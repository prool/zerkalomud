// #define DEBUG

/* ************************************************************************
*   File: vmud2.h                            Part of Virtustan MUD        *
*  Usage: prool subprograms for Virtustan MUD                             *
*                                                                         *
*  (CC) 2012, 2013, Prool                                                 *
*                                                                         *
*  Author: Prool, proolix@gmail.com, http://prool.kharkov.org             *
************************************************************************ */

#define FREE_RENT 1

#define PERSLOG_FILE "../log/perslog.txt"
#define STATLOG_FILE "../log/statlog.txt"

// codetables for console and log
#define T_KOI			0
#define T_UTF			1
#define T_WIN			2
#define T_ALT			3
#define T_LAT			4

#define MSSP			70
#define MSSP_VAR		1
#define MSSP_VAL		2

#define PROOL_MAX_STRLEN 255

#define ansi_red  "\033[0;40;31m"
#define ansi_green  "\033[0;40;32m"
#define ansi_yellow  "\033[0;40;33m"
#define ansi_blue  "\033[0;40;34m"
#define ansi_magenta  "\033[0;40;35m"
#define ansi_cyan  "\033[0;40;36m"
#define ansi_white  "\033[0;40;37m"
#define ansi_gray  "\033[0;40;30;1m"
#define ansi_lred  "\033[0;40;31;1m"
#define ansi_lgreen  "\033[0;40;32;1m"
#define ansi_lyellow  "\033[0;40;33;1m"
#define ansi_lblue  "\033[0;40;34;1m"
#define ansi_lmagenta  "\033[0;40;35;1m"
#define ansi_lcyan  "\033[0;40;36;1m"
#define ansi_lwhite  "\033[0;40;37;1m"
#define ansi_reset  "\033[0m"

char *ptime(void); // ������������ ��������: ������ �� ��������� ������ � ������� ��������
void perslog (char *verb, const char *pers);
void statlog(void);
void send_email2 (char *from, char *to, char *subj, char *text);
char *nslookup(const char *ip);

ACMD(do_duhmada);

void test_color(void);
void koi_to_utf8(char *str_i, char *str_o);
void utf8_to_koi(char *str_i, char *str_o);
void prool_log(char *str);
