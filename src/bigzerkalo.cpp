// #define DEBUG

#define SEND_EMAIL 0

/* ************************************************************************
*   File: bigzerkalo.cpp                      Part of BigZerkalo MUD      *
*  Usage: prool subprograms for BigZerkalo MUD                            *
*                                                                         *
*  Copyleft 2011-2018, Prool                                              *
*                                                                         *
*  Author: Prool, proolix@gmail.com, http://prool.kharkov.org             *
************************************************************************ */

#include "interpreter.h"
#include "comm.h"
#include "db.h"
#include "handler.h"
#include "utils.h"
#include "structs.h"
#include "conf.h"
#include "sysdep.h"
#include "dg_scripts.h"
#include "char.hpp"
#include <sstream>
#include <iconv.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <netdb.h>
#include "telnet.h"

#include "bigzerkalo.h"

extern int total_players;
int players_num;
extern int boot_time;
extern int console_codetable;
extern int email;
extern char mudname[];

void print_object_location(int num, OBJ_DATA * obj, CHAR_DATA * ch, int recur);

void perslog (char *verb, const char *pers)
{FILE *fp;
char buffer [PROOL_MAX_STRLEN];
char *ident;

if (mudname[0]) ident=mudname;
else ident = "Zerkalo";

fp=fopen(PERSLOG_FILE, "a");
fprintf(fp,"%s %s %s\n",ptime(),pers,verb);
if (console_codetable==T_UTF)
	{
	koi_to_utf8((char*)pers,buffer);
	printf("%s %s %s %s\n",ident,ptime(),buffer,verb);
	}
else
	{
	printf("%s %s %s %s\n",ident,ptime(),pers,verb);
	}
fclose(fp);
}

void statlog ()
{FILE *fp;
fp=fopen(STATLOG_FILE, "a");
fprintf(fp,"%s players=%i\n",ptime(),players_num);
//printf("statlog() %s %i", ptime(), players_num);
fclose(fp);
}

char *ptime(void) // Возвращаемое значение: ссылка на текстовую строку с текущим временем
	{
	char *tmstr;
	time_t mytime;

	mytime = time(0);

	tmstr = (char *) asctime(localtime(&mytime));
	*(tmstr + strlen(tmstr) - 1) = '\0';

	return tmstr;

	}
	
ACMD(do_omol)
{
ch->player_data.time.birth=time(0);
}

ACMD(do_fflush)
{
send_to_char("fflush!\n", ch);
fflush(0);
}

#define PUT_OBJ(obj_number) {r_num = real_object(obj_number); \
if (r_num==-1) {send_to_char("&RЭтого предмета почему-то не существует в мире и я не могу его найти!&n :(\r\n",ch);} \
else { \
obj = read_object(r_num, REAL); GET_OBJ_MAKER(obj) = GET_UNIQUE(ch); obj_to_char(obj, ch); \
act("$n получил$g от духа мада $o3!", FALSE, ch, obj, 0, TO_ROOM); \
act("Вы получили от духа мада $o3.", FALSE, ch, obj, 0, TO_CHAR); /* load_otrigger(obj); obj_decay(obj); */ \
olc_log("Духмада: %s load obj %s #%d", GET_NAME(ch), GET_OBJ_ALIAS(obj), obj_number);} }

#define DUH_INSTR "Список вещей, которые вам может принести дух мада: хлеб, фляга, меч, нож, лук, палица, лампа, шарик, доспех, руны, сума, свиток познания, свиток возврата или сет (набор предметов), нумерованный от 0 до 23. Подробнее см. ПОМОЩЬ ДУХМАДА\r\n\r\nПример вызова:\r\nдухмада хлеб\r\nдухмада 10\r\n"

ACMD(do_duhmada)
{
	mob_rnum r_num;
	OBJ_DATA *obj;
	int i;

// char str[100];
// sprintf(str,"`%s'",argument);
// send_to_char(str, ch);

if (*argument==0)
	{
	send_to_char(DUH_INSTR, ch);
	}
else
	{
	argument++;
	if (!strcmp(argument,"хлеб")) PUT_OBJ(2200 /*125*/)
//	else if (!strcmp(argument,"рекол")) PUT_OBJ(2201/*115*/)
	else if (!strcmp(argument,"меч")) PUT_OBJ(2202/*112*/)
	else if (!strcmp(argument,"палица")) PUT_OBJ(2203/*121*/)
	else if (!strcmp(argument,"нож")) PUT_OBJ(2204/*122*/)
	else if (!strcmp(argument,"шарик")) PUT_OBJ(2205/*126*/)
	else if (!strcmp(argument,"лампа")) PUT_OBJ(2206/*127*/)
	else if (!strcmp(argument,"доспех")) PUT_OBJ(2207/*113*/)
	else if (!strcmp(argument,"фляга")) PUT_OBJ(2208/*114*/)
	else if (!strcmp(argument,"лук")) PUT_OBJ(2209/*109*/)
	else if (!strcmp(argument,"сума")) PUT_OBJ(/*2214*/2045)
	else if (!strcmp(argument,"свиток познания")) PUT_OBJ(138)
	else if (!strcmp(argument,"свиток возврата")) PUT_OBJ(139)
	else if (!strcmp(argument,"руны")) /* runes */
	    {
	    #if 0
	    PUT_OBJ(222/*693*/);
	    PUT_OBJ(223/*692*/);
	    PUT_OBJ(224/*695*/);
	    PUT_OBJ(225/*694*/);
	    #endif
	    // all runes
	    for (i=200; i<=245; i++)
		{
		if (i==233) continue;
		if (i==237) continue;
		if (i==244) continue;
		PUT_OBJ (i);
		}
	    }
#include "duhmada.c"
	else
		{
		send_to_char("Этого нет в списке моих возможностей! Набирайте названия полностью.\r\n\r\n",ch);
		send_to_char(DUH_INSTR, ch);
		}
	}

}

char *nslookup(const char *ip) // prool
// example: input "217.12.192.65", returned output "www.itl.ua"
{
struct in_addr ip0;
struct hostent *hp;

if (!inet_aton(ip, &ip0))
	/* printf("can't parse IP address %s", ip) */;

if ((hp = gethostbyaddr((const char *)&ip0, sizeof ip0, AF_INET)) == NULL)
	/* printf("no name associated with %s", ip) */;

// printf("name associated with %s is %s\n", ip, hp->h_name);

#ifdef CYGWIN
return (char *)((hp!=NULL)?hp->h_name:(char *)"*");
#else
return (hp!=NULL)?hp->h_name:(char *)"*";
#endif
}

void send_email2 (char *from, char *to, char *subj, char *text)
	{char buf [80*25];
	if (email==0) return;
#if 1

	sprintf(buf,"echo \"Subject: %s\r\nContent-Type: text/plain; charset=koi8-r\r\n\r\n%s\"|/usr/sbin/sendmail -F\"%s\" %s\r\n",
		subj,text,from,to);

	system(buf);
#endif
	}

void mssp_start(DESCRIPTOR_DATA * t)
{char buf[1024]; int i;

#if 0
const char mssp_str[] = {IAC,SB,MSSP,
	MSSP_VAR,'P','L','A','Y','E','R','S',MSSP_VAL,'0',
	MSSP_VAR,'N','A','M','E',MSSP_VAL,'V','i','r','t','u','s','t','a','n',' ','M','U','D',
	IAC,SE,'\0'};
#endif

i=sprintf(buf,
"%c%c%c%cPLAYERS%c%i%cNAME%cZerkalo MUD%cUPTIME%c%li%cCRAWL_DELAY%c-1\
%cHOSTNAME%czerkalo.kharkov.org\
%cPORT%c4000\
%cPORT%c4000\
%cCODEBASE%cCircleMUD/Byliny\
%cCONTACT%cproolix@gmail.com\
%cCREATED%c2012\
%cIP%c217.12.220.191\
%cLANGUAGE%cRussian\
%cLOCATION%cUkraine\
%cMINIMUM AGE%c0\
%cWEBSITE%chttp://zerkalo.kharkov.org\
%cFAMILY%cDikuMUD\
%cAREAS%c%i\
%cMOBILES%c%i\
%cOBJECTS%c%i\
%cROOMS%c%i\
%cCLASSES%c15\
%cRACES%c6\
%cANSI%c1\
%cMCCP%c1\
%cMCP%c0\
%cMSP%c0\
%cMXP%c0\
%cPUEBLO%c0\
%cHIRING BUILDERS%c1\
%cPLAYER CLANS%c1\
%cWORLD ORIGINALITY%c1\
%c%c",
IAC,SB,MSSP,MSSP_VAR,MSSP_VAL,total_players,MSSP_VAR,MSSP_VAL,MSSP_VAR,MSSP_VAL,(long int)boot_time,
MSSP_VAR,MSSP_VAL,
MSSP_VAR,MSSP_VAL,
MSSP_VAR,MSSP_VAL,
MSSP_VAR,MSSP_VAL,
MSSP_VAR,MSSP_VAL,
MSSP_VAR,MSSP_VAL,
MSSP_VAR,MSSP_VAL,
MSSP_VAR,MSSP_VAL,
MSSP_VAR,MSSP_VAL,
MSSP_VAR,MSSP_VAL,
MSSP_VAR,MSSP_VAL,
MSSP_VAR,MSSP_VAL,
MSSP_VAR,MSSP_VAL,
MSSP_VAR,MSSP_VAL,99 /*statistic_zones*/,
MSSP_VAR,MSSP_VAL,1662 /*statistic_mobs*/,
MSSP_VAR,MSSP_VAL,912 /*statistic_objs*/,
MSSP_VAR,MSSP_VAL,3599 /*statistic_rooms*/,
MSSP_VAR,MSSP_VAL,
MSSP_VAR,MSSP_VAL,
MSSP_VAR,MSSP_VAL,
MSSP_VAR,MSSP_VAL,
MSSP_VAR,MSSP_VAL,
MSSP_VAR,MSSP_VAL,
MSSP_VAR,MSSP_VAL,
MSSP_VAR,MSSP_VAL,
MSSP_VAR,MSSP_VAL,
MSSP_VAR,MSSP_VAL,
MSSP_VAR,MSSP_VAL,
IAC,SE);

// printf("MSSP total_players %i\n",total_players);

write_to_descriptor(t->descriptor, buf, strlen(buf));
}

void test_color(void)
{
const char *const green = "\033[0;40;32m";
const char *const normal = "\033[0m";
int i;

char ESC = '\033';
for (i=1;i<8;i++)
	{
	printf("%c[0;40;%imcolor %i ", ESC, 30+i, i);
	}

for (i=0;i<8;i++)
	{
	printf("%c[0;40;%i;1mlight color %i ", ESC, 30+i, i);
	}

printf("%s Hello World%s\n", green, normal);
}

void koi_to_utf8(char *str_i, char *str_o)
{
	iconv_t cd;
	size_t len_i, len_o = MAX_SOCK_BUF * 6;
	size_t i;
	unsigned char *in, *out;

	in=(unsigned char *)str_i;
	out=(unsigned char *)str_o;

	*str_o=0;

	if (str_i==0)
		{
		printf("koi_to_utf8: error 1\n");
		return;
		}

	if (str_o==0)
		{
		printf("koi_to_utf8: error 2\n");
		return;
		}

	if ((cd = iconv_open("UTF-8","KOI8-U")) == (iconv_t) - 1)
	{
		printf("koi_to_utf8: iconv_open error\n");
		return;
	}
	len_i = strlen(str_i);
	if ((i = iconv(cd, &str_i, &len_i, &str_o, &len_o)) == (size_t) - 1)
	{
		printf("koi_to_utf8: iconv error. ");
		printf("input='%s' ", in);
		while (*in)
			{
			printf("[%02X]",*in++);
			}
		printf(" output='%s' ", out);
		while (*out)
			{
			printf("[%02X]",*out++);
			}
		printf("\n");
		return;
	}
	*str_o = 0;
	if (iconv_close(cd) == -1)
	{
		printf("koi_to_utf8: iconv_close error\n");
		return;
	}
}

void utf8_to_koi(char *str_i, char *str_o)
{
	iconv_t cd;
	size_t len_i, len_o = MAX_SOCK_BUF * 6;
	size_t i;

	if ((cd = iconv_open("KOI8-U", "UTF-8")) == (iconv_t) - 1)
	{
		printf("utf8_to_koi: iconv_open error\n");
		return;
	}
	len_i = strlen(str_i);
	if ((i=iconv(cd, &str_i, &len_i, &str_o, &len_o)) == (size_t) - 1)
	{
		printf("utf8_to_koi: iconv error\n");
		// return;
	}
	if (iconv_close(cd) == -1)
	{
		printf("utf8_to_koi: iconv_close error\n");
		return;
	}
}

void prool_log(char *str)
{
FILE *fp; char buffer [PROOL_MAX_STRLEN];
fp=fopen("proolmud.log", "a");
fprintf(fp,"%s %s\n",ptime(),str);
fclose(fp);
}

ACMD (do_accio_trup)
{
char buf[PROOL_MAX_STRLEN];
char imya_trupa[PROOL_MAX_STRLEN];
OBJ_DATA *k;

//send_to_char("do_accio_trup()\r\n",ch);

// поиск трупа

//sprintf(buf,"Боги знают, что вас зовут %s\r\n", GET_NAME(ch)); send_to_char(buf,ch);

//sprintf(buf,"Боги знают, что ваш труп называется \"труп_%s\"\r\n", GET_PAD(ch,1)); send_to_char(buf,ch);

sprintf(imya_trupa,"труп_%s",GET_PAD(ch,1));

//bool print_imm_where_obj(CHAR_DATA *ch, char *arg, int num)
	bool found = false;
	int num=1;
	for (k = object_list; k; k = k->next)
	{
		if (isname(imya_trupa, k->name))
		{
			found = true;
			print_object_location(num++, k, ch, TRUE);
			break;
		}
	}

if (found==true) send_to_char("\r\nМы нашли труп и призываем его сюда\r\n",ch);
else {send_to_char("Мы НЕ нашли труп\r\n",ch); return; }

// obj from room
	obj_from_room(k);
// obj to room
	obj_to_room(k, ch->in_room);
}

ACMD (do_prool)
{char proolbuf[200];
int i;

i=atoi(argument);
//printf("do_prool: argument='%s' i=%i\n", argument,i);

if (i) {
	snprintf(proolbuf,200,"prool param. set to %i\r\n",i);
	ch->player_specials->prool_map=i;
	}

snprintf(proolbuf,200,"prool parameter = %i\r\n", ch->player_specials->prool_map);
send_to_char(ch,proolbuf);

snprintf(proolbuf,200,"player name '%s'\r\n", GET_NAME(ch));
send_to_char(ch,proolbuf);
}

ACMD(do_nomap)
{
if (ch->player_specials->prool_map) {
	ch->player_specials->prool_map=0;
	send_to_char(ch,"Карта включена\r\n");
	}
else {
	ch->player_specials->prool_map=1;
	send_to_char(ch,"Карта выключена\r\n");
	}
}
