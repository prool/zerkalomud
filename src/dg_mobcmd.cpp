/***************************************************************************
 *  File: dg_mobcmd.cpp                                    Part of Bylins  *
 *  Usage: functions for usage in mob triggers.                            *
 *                                                                         *
 *                                                                         *
 *  Original Diku Mud copyright (C) 1990, 1991 by Sebastian Hammer,        *
 *  Michael Seifert, Hans Henrik St{rfeldt, Tom Madsen, and Katja Nyboe.   *
 *                                                                         *
 *  Merc Diku Mud improvments copyright (C) 1992, 1993 by Michael          *
 *  Chastain, Michael Quan, and Mitchell Tse.                              *
 *                                                                         *
 *  In order to use any part of this Merc Diku Mud, you must comply with   *
 *  both the original Diku license in 'license.doc' as well the Merc       *
 *  license in 'license.txt'.  In particular, you may not remove either of *
 *  these copyright notices.                                               *
 *                                                                         *
 *  Much time and thought has gone into this software and you are          *
 *  benefitting.  We hope that you share your changes too.  What goes      *
 *  around, comes around.                                                  *
 *                                                                         *
 *  $Author$                                                         *
 *  $Date$                                           *
 *  $Revision$                                                   *
 ***************************************************************************/

/***************************************************************************
 *  The MOBprograms have been contributed by N'Atas-ha.  Any support for   *
 *  these routines should not be expected from Merc Industries.  However,  *
 *  under no circumstances should the blame for bugs, etc be placed on     *
 *  Merc Industries.  They are not guaranteed to work on all systems due   *
 *  to their frequent use of strxxx functions.  They are also not the most *
 *  efficient way to perform their tasks, but hopefully should be in the   *
 *  easiest possible way to install and begin using. Documentation for     *
 *  such installation can be found in INSTALL.  Enjoy........    N'Atas-Ha *
 ***************************************************************************/

#include "conf.h"
#include "sysdep.h"
#include "structs.h"
#include "dg_scripts.h"
#include "db.h"
#include "utils.h"
#include "handler.h"
#include "interpreter.h"
#include "comm.h"
#include "spells.h"
#include "im.h"
#include "features.hpp"
#include "char.hpp"
#include "skills.h"
#include "name_list.hpp"
#include "room.hpp"

#define IS_CHARMED(ch)          (IS_HORSE(ch)||AFF_FLAGGED(ch, AFF_CHARM))

extern DESCRIPTOR_DATA *descriptor_list;
extern room_rnum find_target_room(CHAR_DATA * ch, char *rawroomstr, int trig);
extern INDEX_DATA *mob_index;

extern int dg_owner_purged;
extern const char *dirs[];

extern int reloc_target;
extern TRIG_DATA *cur_trig;

void sub_write(char *arg, CHAR_DATA * ch, byte find_invis, int targets);
void asciiflag_conv(const char *flag, void *value);
room_data *get_room(char *name);
extern void char_dam_message(int dam, CHAR_DATA * ch, CHAR_DATA * victim, int attacktype, int mayflee);
OBJ_DATA *get_obj_by_char(CHAR_DATA * ch, char *name);
extern void die(CHAR_DATA * ch, CHAR_DATA * killer);
/*
 * Local functions.
 */

/* attaches mob's name and vnum to msg and sends it to script_log */
void mob_log(CHAR_DATA * mob, const char *msg)
{
	char buf[MAX_INPUT_LENGTH + 100];

	sprintf(buf, "(Mob: '%s', VNum: %d, trig: %d): %s", GET_SHORT(mob), GET_MOB_VNUM(mob), last_trig_vnum, msg);
	script_log(buf);
}

/*
** macro to determine if a mob is permitted to use these commands
*/
#define MOB_OR_IMPL(ch) \
        (IS_NPC(ch) && (!(ch)->desc || GET_LEVEL((ch)->desc->original)>=LVL_IMPL))



/* mob commands */

/* prints the argument to all the rooms aroud the mobile */
ACMD(do_masound)
{
	if (!MOB_OR_IMPL(ch))
	{
		send_to_char("���� ?\r\n", ch);
		return;
	}

	if (AFF_FLAGGED(ch, AFF_CHARM))
		return;

	if (!*argument)
	{
		mob_log(ch, "masound called with no argument");
		return;
	}

	skip_spaces(&argument);

	int temp_in_room = IN_ROOM(ch);
	for (int door = 0; door < NUM_OF_DIRS; door++)
	{
		EXIT_DATA *exit;
		if (((exit = world[temp_in_room]->dir_option[door]) != NULL) &&
				exit->to_room != NOWHERE && exit->to_room != temp_in_room)
		{
			IN_ROOM(ch) = exit->to_room;
			sub_write(argument, ch, TRUE, TO_ROOM);
		}
	}

	IN_ROOM(ch) = temp_in_room;
}


/* lets the mobile kill any player or mobile without murder*/
ACMD(do_mkill)
{
	char arg[MAX_INPUT_LENGTH];
	CHAR_DATA *victim;

	if (!MOB_OR_IMPL(ch))
	{
		send_to_char("���� ?\r\n", ch);
		return;
	}

	if (MOB_FLAGGED(ch, MOB_NOFIGHT))
	{
		mob_log(ch, "mkill called for mob with NOFIGHT flag");
		return;
	}

	if (AFF_FLAGGED(ch, AFF_CHARM))
		return;

	one_argument(argument, arg);

	if (!*arg)
	{
		mob_log(ch, "mkill called with no argument");
		return;
	}

	if (*arg == UID_CHAR)
	{
		if (!(victim = get_char(arg)))
		{
			sprintf(buf, "mkill: victim (%s) not found", arg);
			mob_log(ch, buf);
			return;
		}
	}
	else if (!(victim = get_char_room_vis(ch, arg)))
	{
		sprintf(buf, "mkill: victim (%s) not found", arg);
		mob_log(ch, buf);
		return;
	}

	if (victim == ch)
	{
		mob_log(ch, "mkill: victim is self");
		return;
	}

	if (IS_AFFECTED(ch, AFF_CHARM) && ch->master == victim)
	{
		mob_log(ch, "mkill: charmed mob attacking master");
		return;
	}

	if (ch->get_fighting())
	{
		mob_log(ch, "mkill: already fighting");
		return;
	}

	hit(ch, victim, TYPE_UNDEFINED, 1);
	return;
}


/*
 * lets the mobile destroy an object in its inventory
 * it can also destroy a worn object and it can destroy
 * items using all.xxxxx or just plain all of them
 */
ACMD(do_mjunk)
{
	char arg[MAX_INPUT_LENGTH];
	int pos, junk_all = 0;
	OBJ_DATA *obj;
	OBJ_DATA *obj_next;

	if (!MOB_OR_IMPL(ch))
	{
		send_to_char("���� ?\r\n", ch);
		return;
	}

	if (AFF_FLAGGED(ch, AFF_CHARM))
		return;

	one_argument(argument, arg);

	if (!*arg)
	{
		mob_log(ch, "mjunk called with no argument");
		return;
	}

	if (!str_cmp(arg, "all") || !str_cmp(arg, "���"))
		junk_all = 1;

	if ((find_all_dots(arg) == FIND_INDIV) && !junk_all)
	{
		if ((obj = get_object_in_equip_vis(ch, arg, ch->equipment, &pos)) != NULL)
		{
			unequip_char(ch, pos);
			extract_obj(obj);
			return;
		}
		if ((obj = get_obj_in_list_vis(ch, arg, ch->carrying)) != NULL)
			extract_obj(obj);
		return;
	}
	else
	{
		for (obj = ch->carrying; obj != NULL; obj = obj_next)
		{
			obj_next = obj->next_content;
			if (arg[3] == '\0' || isname(arg + 4, obj->name))
			{
				extract_obj(obj);
			}
		}
		while ((obj = get_object_in_equip_vis(ch, arg, ch->equipment, &pos)))
		{
			unequip_char(ch, pos);
			extract_obj(obj);
		}
	}
	return;
}


/* prints the message to everyone in the room other than the mob and victim */
ACMD(do_mechoaround)
{
	char arg[MAX_INPUT_LENGTH];
	CHAR_DATA *victim;
	char *p;

	if (!MOB_OR_IMPL(ch))
	{
		send_to_char("���� ?\r\n", ch);
		return;
	}

	if (AFF_FLAGGED(ch, AFF_CHARM))
		return;

	p = one_argument(argument, arg);
	skip_spaces(&p);

	if (!*arg)
	{
		mob_log(ch, "mechoaround called with no argument");
		return;
	}

	if (*arg == UID_CHAR)
	{
		if (!(victim = get_char(arg)))
		{
			sprintf(buf, "mechoaround: victim (%s) does not exist", arg);
			mob_log(ch, buf);
			return;
		}
	}
	else if (!(victim = get_char_room_vis(ch, arg)))
	{
		sprintf(buf, "mechoaround: victim (%s) does not exist", arg);
		mob_log(ch, buf);
		return;
	}

	if (reloc_target != -1 && reloc_target != IN_ROOM(victim))
	{
		sprintf(buf,
				"&Y��������&G �������� ������������� ������� wat � �������� %s (VNUM=%d).",
				GET_TRIG_NAME(cur_trig), GET_TRIG_VNUM(cur_trig));
		mudlog(buf, BRF, LVL_BUILDER, ERRLOG, TRUE);
	}

	sub_write(p, victim, TRUE, TO_ROOM);
}


/* sends the message to only the victim */
ACMD(do_msend)
{
	char arg[MAX_INPUT_LENGTH];
	CHAR_DATA *victim;
	char *p;

	if (!MOB_OR_IMPL(ch))
	{
		send_to_char("���� ?\r\n", ch);
		return;
	}

	if (AFF_FLAGGED(ch, AFF_CHARM))
		return;

	p = one_argument(argument, arg);
	skip_spaces(&p);

	if (!*arg)
	{
		mob_log(ch, "msend called with no argument");
		return;
	}

	if (*arg == UID_CHAR)
	{
		if (!(victim = get_char(arg)))
		{
			sprintf(buf, "msend: victim (%s) does not exist", arg);
			mob_log(ch, buf);
			return;
		}
	}
	else if (!(victim = get_char_room_vis(ch, arg)))
	{
		sprintf(buf, "msend: victim (%s) does not exist", arg);
		mob_log(ch, buf);
		return;
	}

	if (reloc_target != -1 && reloc_target != IN_ROOM(victim))
	{
		sprintf(buf,
				"&Y��������&G �������� ������������� ������� wat � �������� %s (VNUM=%d).",
				GET_TRIG_NAME(cur_trig), GET_TRIG_VNUM(cur_trig));
		mudlog(buf, BRF, LVL_BUILDER, ERRLOG, TRUE);
	}

	sub_write(p, victim, TRUE, TO_CHAR);
}


/* prints the message to the room at large */
ACMD(do_mecho)
{
	char *p;

	if (!MOB_OR_IMPL(ch))
	{
		send_to_char("���� ?\r\n", ch);
		return;
	}

	if (AFF_FLAGGED(ch, AFF_CHARM))
		return;

	if (!*argument)
	{
		mob_log(ch, "mecho called with no arguments");
		return;
	}
	p = argument;
	skip_spaces(&p);

	if (reloc_target != -1 && reloc_target != IN_ROOM(ch))
	{
		sprintf(buf,
				"&Y��������&G �������� ������������� ������� wat � �������� %s (VNUM=%d).",
				GET_TRIG_NAME(cur_trig), GET_TRIG_VNUM(cur_trig));
		mudlog(buf, BRF, LVL_BUILDER, ERRLOG, TRUE);
	}

	sub_write(p, ch, TRUE, TO_ROOM);
}


/*
 * lets the mobile load an item or mobile.  All items
 * are loaded into inventory, unless it is NO-TAKE.
 */
ACMD(do_mload)
{
	char arg1[MAX_INPUT_LENGTH], arg2[MAX_INPUT_LENGTH];
	int number = 0;
	CHAR_DATA *mob;
	OBJ_DATA *object;

	if (!MOB_OR_IMPL(ch))
	{
		send_to_char("���� ?\r\n", ch);
		return;
	}

	if (AFF_FLAGGED(ch, AFF_CHARM))
		return;

	if (ch->desc && GET_LEVEL(ch->desc->original) < LVL_IMPL)
		return;

	two_arguments(argument, arg1, arg2);

	if (!*arg1 || !*arg2 || !is_number(arg2) || ((number = atoi(arg2)) < 0))
	{
		mob_log(ch, "mload: bad syntax");
		return;
	}

	if (is_abbrev(arg1, "mob"))
	{
		if ((mob = read_mobile(number, VIRTUAL)) == NULL)
		{
			mob_log(ch, "mload: bad mob vnum");
			return;
		}
		char_to_room(mob, IN_ROOM(ch));
		load_mtrigger(mob);
	}
	else if (is_abbrev(arg1, "obj"))
	{
		if ((object = read_object(number, VIRTUAL)) == NULL)
		{
			mob_log(ch, "mload: bad object vnum");
			return;
		}
		log("Load obj #%d by %s (mload)", number, GET_NAME(ch));
		GET_OBJ_ZONE(object) = world[IN_ROOM(ch)]->zone;
		if (CAN_WEAR(object, ITEM_WEAR_TAKE))
		{
			obj_to_char(object, ch);
		}
		else
		{
			obj_to_room(object, IN_ROOM(ch));
		}
		load_otrigger(object);
	}
	else
		mob_log(ch, "mload: bad type");
}


/*
 * lets the mobile purge all objects and other npcs in the room,
 * or purge a specified object or mob in the room.  It can purge
 *  itself, but this will be the last command it does.
 */
ACMD(do_mpurge)
{
	char arg[MAX_INPUT_LENGTH];
	CHAR_DATA *victim;
	OBJ_DATA *obj;

	if (!MOB_OR_IMPL(ch))
	{
		send_to_char("���� ?\r\n", ch);
		return;
	}

	if (AFF_FLAGGED(ch, AFF_CHARM))
		return;

	if (ch->desc && (GET_LEVEL(ch->desc->original) < LVL_IMPL))
		return;

	one_argument(argument, arg);

	if (!*arg)
	{
		return;
/*
		CHAR_DATA *vnext;
		OBJ_DATA *obj_next;

		for (victim = world[IN_ROOM(ch)]->people; victim; victim = vnext)
		{
			vnext = victim->next_in_room;
			if (IS_NPC(victim) && victim != ch)
			{
				if (victim->followers || victim->master)
					die_follower(victim);
				extract_char(victim, FALSE);
			}
		}
		for (obj = world[IN_ROOM(ch)]->contents; obj; obj = obj_next)
		{
			obj_next = obj->next_content;
			extract_obj(obj);
		}
		return;
*/
	}
	if (*arg == UID_CHAR)
		victim = get_char(arg);
	else
		victim = get_char_room_vis(ch, arg);

	if (victim == NULL)
	{
		if ((obj = get_obj_by_char(ch, arg)))
		{
			extract_obj(obj);
		}
		else
			mob_log(ch, "mpurge: bad argument");
		return;
	}

	if (!IS_NPC(victim))
	{
		mob_log(ch, "mpurge: purging a PC");
		return;
	}

	if (victim == ch)
		dg_owner_purged = 1;

	if (victim->followers || victim->master)
		die_follower(victim);
	extract_char(victim, FALSE);
}


/* lets the mobile goto any location it wishes that is not private */
ACMD(do_mgoto)
{
	char arg[MAX_INPUT_LENGTH];
	char buf[MAX_INPUT_LENGTH];
	int location;

	if (!MOB_OR_IMPL(ch))
	{
		send_to_char("���� ?\r\n", ch);
		return;
	}

	if (AFF_FLAGGED(ch, AFF_CHARM))
		return;

	one_argument(argument, arg);

	if (!*arg)
	{
		mob_log(ch, "mgoto called with no argument");
		return;
	}

	if ((location = find_target_room(ch, arg, 1)) == NOWHERE)
	{
		sprintf(buf, "mgoto: invalid location '%s'", arg);
		mob_log(ch, buf);
		return;
	}

	if (ch->get_fighting())
		stop_fighting(ch, TRUE);

	char_from_room(ch);
	char_to_room(ch, location);
}


/* lets the mobile do a command at another location. Very useful */
ACMD(do_mat)
{
	char arg[MAX_INPUT_LENGTH];
	char buf[MAX_INPUT_LENGTH];
	int location;
	int original;

	if (!MOB_OR_IMPL(ch))
	{
		send_to_char("���� ?\r\n", ch);
		return;
	}

	if (AFF_FLAGGED(ch, AFF_CHARM))
		return;

	argument = one_argument(argument, arg);

	if (!*arg || !*argument)
	{
		mob_log(ch, "mat: bad argument");
		return;
	}

	if ((location = find_target_room(ch, arg, 1)) == NOWHERE)
	{
		sprintf(buf, "mat: invalid location '%s'", arg);
		mob_log(ch, buf);
		return;
	}

	reloc_target = location;
	original = IN_ROOM(ch);
	char_from_room(ch);
	char_to_room(ch, location);
	command_interpreter(ch, argument);
	reloc_target = -1;

	/*
	 * See if 'ch' still exists before continuing!
	 * Handles 'at XXXX quit' case.
	 */
	if (IN_ROOM(ch) == location)
	{
		char_from_room(ch);
		char_to_room(ch, original);
	}
}


/*
 * lets the mobile transfer people.  the all argument transfers
 * everyone in the current room to the specified location
 */
ACMD(do_mteleport)
{
	char arg1[MAX_INPUT_LENGTH], arg2[MAX_INPUT_LENGTH];
	int target;
	room_rnum from_room;
	CHAR_DATA *vict, *next_ch, *horse, *charmee, *ncharmee;

	if (!MOB_OR_IMPL(ch))
	{
		send_to_char("���� ?\r\n", ch);
		return;
	}

	if (AFF_FLAGGED(ch, AFF_CHARM))
		return;

	argument = two_arguments(argument, arg1, arg2);
	skip_spaces(&argument);

	if (!*arg1 || !*arg2)
	{
		mob_log(ch, "mteleport: bad syntax");
		return;
	}

	target = find_target_room(ch, arg2, 1);

	if (target == NOWHERE)
		mob_log(ch, "mteleport target is an invalid room");
	else if (!str_cmp(arg1, "all") || !str_cmp(arg1, "���"))
	{
		if (target == IN_ROOM(ch))
		{
			mob_log(ch, "mteleport all: target is itself");
			return;
		}

		for (vict = world[IN_ROOM(ch)]->people; vict; vict = next_ch)
		{
			next_ch = vict->next_in_room;
			if (IS_NPC(vict)
					&& !(IS_HORSE(vict) || AFF_FLAGGED(vict, AFF_CHARM)
						 || MOB_FLAGGED(ch, MOB_ANGEL)))
				continue;
			/*			if (on_horse(vict) || has_horse(vict, TRUE))
							horse = get_horse(vict);
						else
							horse = NULL;
			*/
			if (IN_ROOM(vict) == NOWHERE)
			{
				mob_log(ch, "mteleport transports from NOWHERE");
				return;
			}

			char_from_room(vict);
			char_to_room(vict, target);
			/*			if (!str_cmp(argument, "horse") && horse) {
							if (horse == next_ch)
								next_ch = horse->next_in_room;
							char_from_room(horse);
							char_to_room(horse, target);
						}
						check_horse(vict);
			*/
			look_at_room(vict, TRUE);
		}
	}
	else
	{
		if (*arg1 == UID_CHAR)
		{
			if (!(vict = get_char(arg1)))
			{
				sprintf(buf, "mteleport: victim (%s) does not exist", arg1);
				mob_log(ch, buf);
				return;
			}
		}
		else if (!(vict = get_char_vis(ch, arg1, FIND_CHAR_WORLD)))
		{
			sprintf(buf, "mteleport: victim (%s) does not exist", arg1);
			mob_log(ch, buf);
			return;
		}
		for (charmee = world[IN_ROOM(vict)]->people; charmee; charmee = ncharmee)
		{
			ncharmee = charmee->next_in_room;
			if (IS_NPC(charmee) && (AFF_FLAGGED(charmee, AFF_CHARM)
									|| MOB_FLAGGED(charmee, MOB_ANGEL))
					&& charmee->master == vict)
			{
				char_from_room(charmee);
				char_to_room(charmee, target);
			}
		}
		if (on_horse(vict) || has_horse(vict, TRUE))
			horse = get_horse(vict);
		else
			horse = NULL;
		from_room = vict->in_room;

		char_from_room(vict);
		char_to_room(vict, target);
		if (!str_cmp(argument, "horse") && horse)
		{
			char_from_room(horse);
			char_to_room(horse, target);
		}
//Polud ��������� ����� followers. �� ���������� ��������� ������������ ��� �������������-NPC
		if (!str_cmp(argument, "followers") && vict->followers)
		{
			follow_type *ft;
			for (ft = vict->followers; ft; ft = ft->next)
				if (IN_ROOM(ft->follower) == from_room && IS_NPC(ft->follower))
				{
					char_from_room(ft->follower);
					char_to_room(ft->follower, target);
				}
		}
//-Polud
		check_horse(vict);
		look_at_room(vict, TRUE);
	}
}


/*
 * lets the mobile force someone to do something.  must be mortal level
 * and the all argument only affects those in the room with the mobile
 */
ACMD(do_mforce)
{
	char arg[MAX_INPUT_LENGTH];

	if (!MOB_OR_IMPL(ch))
	{
		send_to_char("���� ?\r\n", ch);
		return;
	}

	if (AFF_FLAGGED(ch, AFF_CHARM))
		return;

	if (ch->desc && (GET_LEVEL(ch->desc->original) < LVL_IMPL))
		return;

	argument = one_argument(argument, arg);

	if (!*arg || !*argument)
	{
		mob_log(ch, "mforce: bad syntax");
		return;
	}

	if (!str_cmp(arg, "all") || !str_cmp(arg, "���"))
	{
		DESCRIPTOR_DATA *i;
		CHAR_DATA *vch;

		// �� ���� ������ ����� ���� ������ �� �������, �� ��� ���,
		// �� LVL_IMMORT+ ��� ����� ����� ��������� ���� ��� ������
		for (i = descriptor_list; i; i = i->next)
		{
			if ((i->character != ch) && !i->connected && (IN_ROOM(i->character) == IN_ROOM(ch)))
			{
				vch = i->character;
				if (GET_LEVEL(vch) < GET_LEVEL(ch) && CAN_SEE(ch, vch) && GET_LEVEL(vch) < LVL_IMMORT)
				{
					command_interpreter(vch, argument);
				}
			}
		}
	}
	else
	{
		CHAR_DATA *victim;
		if (*arg == UID_CHAR)
		{
			if (!(victim = get_char(arg)))
			{
				sprintf(buf, "mforce: victim (%s) does not exist", arg);
				mob_log(ch, buf);
				return;
			}
		}
		else if ((victim = get_char_room_vis(ch, arg)) == NULL)
		{
			mob_log(ch, "mforce: no such victim");
			return;
		}
		if (victim == ch)
		{
			mob_log(ch, "mforce: forcing self");
			return;
		}
		if (IS_NPC(victim) || GET_LEVEL(victim) < LVL_IMMORT)
			command_interpreter(victim, argument);
	}
}


/* increases the target's exp */
ACMD(do_mexp)
{
	CHAR_DATA *victim;
	char name[MAX_INPUT_LENGTH], amount[MAX_INPUT_LENGTH];

	mob_log(ch, "WARNING: mexp command is depracated! Use: %actor.exp(amount-to-add)%");


	if (!MOB_OR_IMPL(ch))
	{
		send_to_char("���� ?\r\n", ch);
		return;
	}

	if (AFF_FLAGGED(ch, AFF_CHARM))
		return;

	if (ch->desc && (GET_LEVEL(ch->desc->original) < LVL_IMPL))
		return;

	two_arguments(argument, name, amount);

	if (!*name || !*amount)
	{
		mob_log(ch, "mexp: too few arguments");
		return;
	}

	if (*name == UID_CHAR)
	{
		if (!(victim = get_char(name)))
		{
			sprintf(buf, "mexp: victim (%s) does not exist", name);
			mob_log(ch, buf);
			return;
		}
	}
	else if (!(victim = get_char_vis(ch, name, FIND_CHAR_WORLD)))
	{
		sprintf(buf, "mexp: victim (%s) does not exist", name);
		mob_log(ch, buf);
		return;
	}

	gain_exp(victim, atoi(amount));
}


/* increases the target's gold */
ACMD(do_mgold)
{
	CHAR_DATA *victim;
	char name[MAX_INPUT_LENGTH], amount[MAX_INPUT_LENGTH];

	mob_log(ch, "WARNING: mgold command is depracated! Use: %actor.gold(amount-to-add)%");


	if (!MOB_OR_IMPL(ch))
	{
		send_to_char("���� ?\r\n", ch);
		return;
	}

	if (AFF_FLAGGED(ch, AFF_CHARM))
		return;

	if (ch->desc && (GET_LEVEL(ch->desc->original) < LVL_IMPL))
		return;

	two_arguments(argument, name, amount);

	if (!*name || !*amount)
	{
		mob_log(ch, "mgold: too few arguments");
		return;
	}

	if (*name == UID_CHAR)
	{
		if (!(victim = get_char(name)))
		{
			sprintf(buf, "mgold: victim (%s) does not exist", name);
			mob_log(ch, buf);
			return;
		}
	}
	else if (!(victim = get_char_vis(ch, name, FIND_CHAR_WORLD)))
	{
		sprintf(buf, "mgold: victim (%s) does not exist", name);
		mob_log(ch, buf);
		return;
	}

	int num = atoi(amount);
	if (num >= 0)
	{
		victim->add_gold(num);
	}
	else
	{
		num = victim->remove_gold(num);
		if (num > 0)
		{
			mob_log(ch, "mgold subtracting more gold than character has");
		}
	}
}

/* place someone into the mob's memory list */
ACMD(do_mremember)
{
	CHAR_DATA *victim;
	struct script_memory *mem;
	char arg[MAX_INPUT_LENGTH];

	if (!MOB_OR_IMPL(ch))
	{
		send_to_char("���� ?\r\n", ch);
		return;
	}

	if (AFF_FLAGGED(ch, AFF_CHARM))
		return;

	if (ch->desc && (GET_LEVEL(ch->desc->original) < LVL_IMPL))
		return;

	argument = one_argument(argument, arg);

	if (!*arg)
	{
		mob_log(ch, "mremember: bad syntax");
		return;
	}

	if (*arg == UID_CHAR)
	{
		if (!(victim = get_char(arg)))
		{
			sprintf(buf, "mremember: victim (%s) does not exist", arg);
			mob_log(ch, buf);
			return;
		}
	}
	else if (!(victim = get_char_vis(ch, arg, FIND_CHAR_WORLD)))
	{
		sprintf(buf, "mremember: victim (%s) does not exist", arg);
		mob_log(ch, buf);
		return;
	}

	/* create a structure and add it to the list */
	CREATE(mem, struct script_memory, 1);
	if (!SCRIPT_MEM(ch))
		SCRIPT_MEM(ch) = mem;
	else
	{
		struct script_memory *tmpmem = SCRIPT_MEM(ch);
		while (tmpmem->next)
			tmpmem = tmpmem->next;
		tmpmem->next = mem;
	}

	/* fill in the structure */
	mem->id = GET_ID(victim);
	if (argument && *argument)
	{
		mem->cmd = str_dup(argument);	// ������������� ���������
	}
}


/* remove someone from the list */
ACMD(do_mforget)
{
	CHAR_DATA *victim;
	struct script_memory *mem, *prev;
	char arg[MAX_INPUT_LENGTH];

	if (!MOB_OR_IMPL(ch))
	{
		send_to_char("���� ?\r\n", ch);
		return;
	}

	if (AFF_FLAGGED(ch, AFF_CHARM))
		return;

	if (ch->desc && (GET_LEVEL(ch->desc->original) < LVL_IMPL))
		return;

	one_argument(argument, arg);

	if (!*arg)
	{
		mob_log(ch, "mforget: bad syntax");
		return;
	}

	if (*arg == UID_CHAR)
	{
		if (!(victim = get_char(arg)))
		{
			sprintf(buf, "mforget: victim (%s) does not exist", arg);
			mob_log(ch, buf);
			return;
		}
	}
	else if (!(victim = get_char_vis(ch, arg, FIND_CHAR_WORLD)))
	{
		sprintf(buf, "mforget: victim (%s) does not exist", arg);
		mob_log(ch, buf);
		return;
	}

	mem = SCRIPT_MEM(ch);
	prev = NULL;
	while (mem)
	{
		if (mem->id == GET_ID(victim))
		{
			if (mem->cmd)
				free(mem->cmd);
			if (prev == NULL)
			{
				SCRIPT_MEM(ch) = mem->next;
				free(mem);
				mem = SCRIPT_MEM(ch);
			}
			else
			{
				prev->next = mem->next;
				free(mem);
				mem = prev->next;
			}
		}
		else
		{
			prev = mem;
			mem = mem->next;
		}
	}
}


/* transform into a different mobile */
ACMD(do_mtransform)
{
	char arg[MAX_INPUT_LENGTH];
	CHAR_DATA *m;
	OBJ_DATA *obj[NUM_WEARS];
	int keep_hp = 1;	/* new mob keeps the old mob's hp/max hp/exp */
	int pos;

	if (!MOB_OR_IMPL(ch))
	{
		send_to_char("���� ?\r\n", ch);
		return;
	}

	if (AFF_FLAGGED(ch, AFF_CHARM))
		return;

	if (ch->desc)
	{
		send_to_char("You've got no VNUM to return to, dummy! try 'switch'\r\n", ch);
		return;
	}

	one_argument(argument, arg);

	if (!*arg)
		mob_log(ch, "mtransform: missing argument");
	else if (!isdigit(*arg) && *arg != '-')
		mob_log(ch, "mtransform: bad argument");
	else
	{
		if (isdigit(*arg))
			m = read_mobile(atoi(arg), VIRTUAL);
		else
		{
			keep_hp = 0;
			m = read_mobile(atoi(arg + 1), VIRTUAL);
		}
		if (m == NULL)
		{
			mob_log(ch, "mtransform: bad mobile vnum");
			return;
		}
// �������:
// 1. �������� ����� ��� (m), ��������� ���������� � mob_index
// 2. ����� ��������� ���-�� ����� ch, ����� ����������� ch,
//    �� ����� ������ ������, �.�. �� ���� ����� ����� ������.
// 3. ����� - a) ��������� ���������� m � ch.
//            b) � ch (������ m) ������� ������� ���������� �� m (������ ch)
//            c) ������ m (�� ����� ���� ��� ������ ch � ������ ��������)


		for (pos = 0; pos < NUM_WEARS; pos++)
		{
			if (GET_EQ(ch, pos))
				obj[pos] = unequip_char(ch, pos);
			else
				obj[pos] = NULL;
		}

		/* put the mob in the same room as ch so extract will work */
		char_to_room(m, IN_ROOM(ch));

// ����� ����������
		CHAR_DATA tmpmob(*m);
		*m = *ch;
		*ch = tmpmob;
		ch->set_normal_morph();
		/*
				memcpy(&tmpmob, m, sizeof(CHAR_DATA));	// m  ==> tmpmob
				memcpy(m, ch, sizeof(CHAR_DATA));	// ch ==> m
				memcpy(ch, &tmpmob, sizeof(CHAR_DATA));	// tmpmob ==> ch
		*/
// ����:
//  ch -> ������ ���������, ����� ���������� �� ���� m
//  m -> ����� ���������, ������ ���������� �� ���� ch
//  tmpmob -> ����. ����������, ���������� �� ������������� ���� m

// ����������� ������� ���������� (��� m ����������� ������������ ��������)
		ch->id = m->id;
		m->id = tmpmob.id;
		ch->affected = m->affected;
		m->affected = tmpmob.affected;
		ch->carrying = m->carrying;
		m->carrying = tmpmob.carrying;
		ch->script = m->script;
		m->script = tmpmob.script;
		ch->memory = m->memory;
		m->memory = tmpmob.memory;
		ch->next_in_room = m->next_in_room;
		m->next_in_room = tmpmob.next_in_room;
		ch->next = m->next;
		m->next = tmpmob.next;
		ch->next_fighting = m->next_fighting;
		m->next_fighting = tmpmob.next_fighting;
		ch->followers = m->followers;
		m->followers = tmpmob.followers;
		ch->master = m->master;
		m->master = tmpmob.master;
		if (keep_hp)
		{
			GET_HIT(ch) = GET_HIT(m);
			GET_MAX_HIT(ch) = GET_MAX_HIT(m);
			ch->set_exp(m->get_exp());
		}
		ch->set_gold(m->get_gold());
		GET_POS(ch) = GET_POS(m);
		IS_CARRYING_W(ch) = IS_CARRYING_W(m);
		IS_CARRYING_W(m) = IS_CARRYING_W(&tmpmob);
		IS_CARRYING_N(ch) = IS_CARRYING_N(m);
		IS_CARRYING_N(m) = IS_CARRYING_N(&tmpmob);
		ch->set_fighting(m->get_fighting());
		m->set_fighting(tmpmob.get_fighting());
		ch->in_fighting_list_ = m->in_fighting_list_;
		m->in_fighting_list_ = tmpmob.in_fighting_list_;
		// ��� name_list
		ch->set_serial_num(m->get_serial_num());
		m->set_serial_num(tmpmob.get_serial_num());
//		CharacterAlias::remove(ch);
//		CharacterAlias::add(ch);

		for (pos = 0; pos < NUM_WEARS; pos++)
		{
			if (obj[pos])
				equip_char(ch, obj[pos], pos | 0x40);
		}
		extract_char(m, FALSE);
	}
}


ACMD(do_mdoor)
{
	char target[MAX_INPUT_LENGTH], direction[MAX_INPUT_LENGTH];
	char field[MAX_INPUT_LENGTH], *value;
	room_data *rm;
	EXIT_DATA *exit;
	int dir, fd, to_room, lock;

	const char *door_field[] =
	{
		"purge",
		"description",
		"flags",
		"key",
		"name",
		"room",
		"lock",
		"\n"
	};


	if (!MOB_OR_IMPL(ch))
	{
		send_to_char("���� ?\r\n", ch);
		return;
	}

	if (AFF_FLAGGED(ch, AFF_CHARM))
		return;

	argument = two_arguments(argument, target, direction);
	value = one_argument(argument, field);
	skip_spaces(&value);

	if (!*target || !*direction || !*field)
	{
		mob_log(ch, "mdoor called with too few args");
		return;
	}

	if ((rm = get_room(target)) == NULL)
	{
		mob_log(ch, "mdoor: invalid target");
		return;
	}

	if ((dir = search_block(direction, dirs, FALSE)) == -1)
	{
		mob_log(ch, "mdoor: invalid direction");
		return;
	}

	if ((fd = search_block(field, door_field, FALSE)) == -1)
	{
		mob_log(ch, "mdoor: invalid field");
		return;
	}

	exit = rm->dir_option[dir];

	/* purge exit */
	if (fd == 0)
	{
		if (exit)
		{
			if (exit->general_description)
				free(exit->general_description);
			if (exit->keyword)
				free(exit->keyword);
			if (exit->vkeyword)
				free(exit->vkeyword);
			free(exit);
			rm->dir_option[dir] = NULL;
		}
	}
	else
	{
		if (!exit)
		{
			CREATE(exit, EXIT_DATA, 1);
			rm->dir_option[dir] = exit;
		}

		std::string buffer;
		std::string::size_type i;

		switch (fd)
		{
		case 1:	/* description */
			if (exit->general_description)
				free(exit->general_description);
			CREATE(exit->general_description, char, strlen(value) + 3);
			strcpy(exit->general_description, value);
			strcat(exit->general_description, "\r\n");
			break;
		case 2:	/* flags       */
			asciiflag_conv(value, &exit->exit_info);
			break;
		case 3:	/* key         */
			exit->key = atoi(value);
			break;
		case 4:	/* name        */
			if (exit->keyword)
				free(exit->keyword);
			if (exit->vkeyword)
				free(exit->vkeyword);
			buffer = value;
			i = buffer.find('|');
			if (i != std::string::npos)
			{
				exit->keyword = str_dup(buffer.substr(0, i).c_str());
				exit->vkeyword = str_dup(buffer.substr(++i).c_str());
			}
			else
			{
				exit->keyword = str_dup(buffer.c_str());
				exit->vkeyword = str_dup(buffer.c_str());
			}
//			CREATE(exit->keyword, char, strlen(value) + 1);
//			strcpy(exit->keyword, value);
			break;
		case 5:	/* room        */
			if ((to_room = real_room(atoi(value))) != NOWHERE)
				exit->to_room = to_room;
			else
				mob_log(ch, "mdoor: invalid door target");
			break;
		case 6:	/* lock - ��������� �����         */
			lock = atoi(value);
			if (!(lock < 0 || lock >255))
				exit->lock_complexity = lock;
			else
				mob_log(ch, "mdoor: invalid lock complexity");
			break;
		}
	}
}

/* increases spells & skills */
const char *skill_name(int num);
const char *spell_name(int num);
int find_skill_num(const char *name);
int find_spell_num(char *name);

ACMD(do_mfeatturn)
{
	int isFeat = 0;
	CHAR_DATA *victim;
	char name[MAX_INPUT_LENGTH], featname[MAX_INPUT_LENGTH], amount[MAX_INPUT_LENGTH], *pos;
	int featnum = 0, featdiff = 0;

	if (!MOB_OR_IMPL(ch))
	{
		send_to_char("���� ?\r\n", ch);
		return;
	}

	if (AFF_FLAGGED(ch, AFF_CHARM))
		return;

	one_argument(two_arguments(argument, name, featname), amount);

	if (!*name || !*featname || !*amount)
	{
		mob_log(ch, "mfeatturn: too few arguments");
		return;
	}

	while ((pos = strchr(featname, '.')))
		* pos = ' ';
	while ((pos = strchr(featname, '_')))
		* pos = ' ';

	if ((featnum = find_feat_num(featname)) > 0 && featnum < MAX_FEATS)
		isFeat = 1;
	else
	{
		mob_log(ch, "mfeatturn: feature not found");
		return;
	}

	if (!str_cmp(amount, "set"))
		featdiff = 1;
	else if (!str_cmp(amount, "clear"))
		featdiff = 0;
	else
	{
		mob_log(ch, "mfeatturn: unknown set variable");
		return;
	}

	if (AFF_FLAGGED(ch, AFF_CHARM))
		return;

	if (ch->desc && (GET_LEVEL(ch->desc->original) < LVL_IMPL))
		return;

	if (*name == UID_CHAR)
	{
		if (!(victim = get_char(name)))
		{
			sprintf(buf, "mfeatturn: victim (%s) does not exist", name);
			mob_log(ch, buf);
			return;
		}
	}
	else if (!(victim = get_char_vis(ch, name, FIND_CHAR_WORLD)))
	{
		sprintf(buf, "mfeatturn: victim (%s) does not exist", name);
		mob_log(ch, buf);
		return;
	};

	if (isFeat)
		trg_featturn(victim, featnum, featdiff);

}

ACMD(do_mskillturn)
{
	int isSkill = 0;
	CHAR_DATA *victim;
	char name[MAX_INPUT_LENGTH], skillname[MAX_INPUT_LENGTH], amount[MAX_INPUT_LENGTH], *pos;
	int skillnum = 0, skilldiff = 0;

	if (!MOB_OR_IMPL(ch))
	{
		send_to_char("���� ?\r\n", ch);
		return;
	}

	if (AFF_FLAGGED(ch, AFF_CHARM))
		return;

	one_argument(two_arguments(argument, name, skillname), amount);

	if (!*name || !*skillname || !*amount)
	{
		mob_log(ch, "mskillturn: too few arguments");
		return;
	}

	while ((pos = strchr(skillname, '.')))
		* pos = ' ';
	while ((pos = strchr(skillname, '_')))
		* pos = ' ';

	if ((skillnum = find_skill_num(skillname)) > 0 && skillnum <= MAX_SKILL_NUM)
		isSkill = 1;
	else if ((skillnum = im_get_recipe_by_name(skillname)) < 0)
	{
		mob_log(ch, "mskillturn: skill/recipe not found");
		return;
	}

	if (!str_cmp(amount, "set"))
		skilldiff = 1;
	else if (!str_cmp(amount, "clear"))
		skilldiff = 0;
	else
	{
		mob_log(ch, "mskillturn: unknown set variable");
		return;
	}

	if (!MOB_OR_IMPL(ch))
	{
		send_to_char("���� ?\r\n", ch);
		return;
	}

	if (AFF_FLAGGED(ch, AFF_CHARM))
		return;

	if (ch->desc && (GET_LEVEL(ch->desc->original) < LVL_IMPL))
		return;

	if (*name == UID_CHAR)
	{
		if (!(victim = get_char(name)))
		{
			sprintf(buf, "mskillturn: victim (%s) does not exist", name);
			mob_log(ch, buf);
			return;
		}
	}
	else if (!(victim = get_char_vis(ch, name, FIND_CHAR_WORLD)))
	{
		sprintf(buf, "mskillturn: victim (%s) does not exist", name);
		mob_log(ch, buf);
		return;
	};

	if (isSkill)
		trg_skillturn(victim, skillnum, skilldiff);
	else
		trg_recipeturn(victim, skillnum, skilldiff);
}

ACMD(do_mskilladd)
{
	int isSkill = 0;
	CHAR_DATA *victim;
	char name[MAX_INPUT_LENGTH], skillname[MAX_INPUT_LENGTH], amount[MAX_INPUT_LENGTH], *pos;
	int skillnum = 0, skilldiff = 0;

	if (!MOB_OR_IMPL(ch))
	{
		send_to_char("���� ?\r\n", ch);
		return;
	}

	if (AFF_FLAGGED(ch, AFF_CHARM))
		return;

	one_argument(two_arguments(argument, name, skillname), amount);

	if (!*name || !*skillname || !*amount)
	{
		mob_log(ch, "mskilladd: too few arguments");
		return;
	}

	while ((pos = strchr(skillname, '.')))
		* pos = ' ';
	while ((pos = strchr(skillname, '_')))
		* pos = ' ';

	if ((skillnum = find_skill_num(skillname)) > 0 && skillnum <= MAX_SKILL_NUM)
		isSkill = 1;
	else if ((skillnum = im_get_recipe_by_name(skillname)) < 0)
	{
		mob_log(ch, "mskilladd: skill/recipe not found");
		return;
	}

	skilldiff = atoi(amount);

	if (!MOB_OR_IMPL(ch))
	{
		send_to_char("���� ?\r\n", ch);
		return;
	}

	if (AFF_FLAGGED(ch, AFF_CHARM))
		return;

	if (ch->desc && (GET_LEVEL(ch->desc->original) < LVL_IMPL))
		return;

	if (*name == UID_CHAR)
	{
		if (!(victim = get_char(name)))
		{
			sprintf(buf, "mskilladd: victim (%s) does not exist", name + 1);
			mob_log(ch, buf);
			return;
		}
	}
	else if (!(victim = get_char_vis(ch, name, FIND_CHAR_WORLD)))
	{
		sprintf(buf, "mskilladd: victim (%s) does not exist", name);
		mob_log(ch, buf);
		return;
	};

	if (isSkill)
		trg_skilladd(victim, skillnum, skilldiff);
	else
		trg_recipeadd(victim, skillnum, skilldiff);
}

ACMD(do_mspellturn)
{
	CHAR_DATA *victim;
	char name[MAX_INPUT_LENGTH], skillname[MAX_INPUT_LENGTH], amount[MAX_INPUT_LENGTH], *pos;
	int skillnum = 0, skilldiff = 0;

	if (!MOB_OR_IMPL(ch))
	{
		send_to_char("���� ?\r\n", ch);
		return;
	}

	if (AFF_FLAGGED(ch, AFF_CHARM))
		return;

	argument = one_argument(argument, name);
	two_arguments(argument, skillname, amount);

	if (!*name || !*skillname || !*amount)
	{
		mob_log(ch, "mspellturn: too few arguments");
		return;
	}

	if ((pos = strchr(skillname, '.')))
		* pos = ' ';

	if ((skillnum = find_spell_num(skillname)) < 0 || skillnum == 0 || skillnum > MAX_SKILL_NUM)
	{
		mob_log(ch, "mspellturn: spell not found");
		return;
	}

	if (!str_cmp(amount, "set"))
		skilldiff = 1;
	else if (!str_cmp(amount, "clear"))
		skilldiff = 0;
	else
	{
		mob_log(ch, "mspellturn: unknown set variable");
		return;
	}

	if (!MOB_OR_IMPL(ch))
	{
		send_to_char("���� ?\r\n", ch);
		return;
	}

	if (AFF_FLAGGED(ch, AFF_CHARM))
		return;

	if (ch->desc && (GET_LEVEL(ch->desc->original) < LVL_IMPL))
		return;

	if (*name == UID_CHAR)
	{
		if (!(victim = get_char(name)))
		{
			sprintf(buf, "mspellturn: victim (%s) does not exist", name);
			mob_log(ch, buf);
			return;
		}
	}
	else if (!(victim = get_char_vis(ch, name, FIND_CHAR_WORLD)))
	{
		sprintf(buf, "mspellturn: victim (%s) does not exist", name);
		mob_log(ch, buf);
		return;
	};

	trg_spellturn(victim, skillnum, skilldiff);
}

ACMD(do_mspelladd)
{
	CHAR_DATA *victim;
	char name[MAX_INPUT_LENGTH], skillname[MAX_INPUT_LENGTH], amount[MAX_INPUT_LENGTH], *pos;
	int skillnum = 0, skilldiff = 0;

	if (!MOB_OR_IMPL(ch))
	{
		send_to_char("���� ?\r\n", ch);
		return;
	}

	if (AFF_FLAGGED(ch, AFF_CHARM))
		return;

	one_argument(two_arguments(argument, name, skillname), amount);

	if (!*name || !*skillname || !*amount)
	{
		mob_log(ch, "mspelladd: too few arguments");
		return;
	}

	if ((pos = strchr(skillname, '.')))
		* pos = ' ';

	if ((skillnum = find_spell_num(skillname)) < 0 || skillnum == 0 || skillnum > MAX_SKILL_NUM)
	{
		mob_log(ch, "mspelladd: skill not found");
		return;
	}

	skilldiff = atoi(amount);

	if (!MOB_OR_IMPL(ch))
	{
		send_to_char("���� ?\r\n", ch);
		return;
	}

	if (AFF_FLAGGED(ch, AFF_CHARM))
		return;

	if (ch->desc && (GET_LEVEL(ch->desc->original) < LVL_IMPL))
		return;

	if (*name == UID_CHAR)
	{
		if (!(victim = get_char(name)))
		{
			sprintf(buf, "mspelladd: victim (%s) does not exist", name + 1);
			mob_log(ch, buf);
			return;
		}
	}
	else if (!(victim = get_char_vis(ch, name, FIND_CHAR_WORLD)))
	{
		sprintf(buf, "mspelladd: victim (%s) does not exist", name);
		mob_log(ch, buf);
		return;
	};

	trg_spelladd(victim, skillnum, skilldiff);
}

ACMD(do_mspellitem)
{
	CHAR_DATA *victim;
	char name[MAX_INPUT_LENGTH], spellname[MAX_INPUT_LENGTH], type[MAX_INPUT_LENGTH], turn[MAX_INPUT_LENGTH], *pos;
	int spellnum = 0, spelldiff = 0, spell = 0;

	if (!MOB_OR_IMPL(ch))
	{
		send_to_char("���� ?\r\n", ch);
		return;
	}

	if (AFF_FLAGGED(ch, AFF_CHARM))
		return;

	two_arguments(two_arguments(argument, name, spellname), type, turn);

	if (!*name || !*spellname || !*type || !*turn)
	{
		mob_log(ch, "mspellitem: too few arguments");
		return;
	}

	if ((pos = strchr(spellname, '.')))
		* pos = ' ';

	if ((spellnum = find_spell_num(spellname)) < 0 || spellnum == 0 || spellnum > MAX_SPELLS)
	{
		mob_log(ch, "mspellitem: spell not found");
		return;
	}

	if (!str_cmp(type, "potion"))
		spell = SPELL_POTION;
	else if (!str_cmp(type, "wand"))
		spell = SPELL_WAND;
	else if (!str_cmp(type, "scroll"))
		spell = SPELL_SCROLL;
	else if (!str_cmp(type, "items"))
		spell = SPELL_ITEMS;
	else if (!str_cmp(type, "runes"))
		spell = SPELL_RUNES;
	else
	{
		mob_log(ch, "mspellitem: type spell not found");
		return;
	}

	if (!str_cmp(turn, "set"))
		spelldiff = 1;
	else if (!str_cmp(turn, "clear"))
		spelldiff = 0;
	else
	{
		mob_log(ch, "mspellitem: unknown set variable");
		return;
	}

	if (*name == UID_CHAR)
	{
		if (!(victim = get_char(name)))
		{
			sprintf(buf, "mspellitem: victim (%s) does not exist", name + 1);
			mob_log(ch, buf);
			return;
		}
	}
	else if (!(victim = get_char_vis(ch, name, FIND_CHAR_WORLD)))
	{
		sprintf(buf, "mspellitem: victim (%s) does not exist", name);
		mob_log(ch, buf);
		return;
	};

	trg_spellitem(victim, spellnum, spelldiff, spell);
}

ACMD(do_mdamage)
{
	char name[MAX_INPUT_LENGTH], amount[MAX_INPUT_LENGTH];
	int dam = 0;
	CHAR_DATA *victim;

	if (!MOB_OR_IMPL(ch))
	{
		send_to_char("���� ?\r\n", ch);
		return;
	}

	if (AFF_FLAGGED(ch, AFF_CHARM))
		return;

	two_arguments(argument, name, amount);

	if (!*name || !*amount || !isdigit(*amount))
	{
		mob_log(ch, "mdamage: bad syntax");
		return;
	}

	dam = atoi(amount);

	if ((victim = get_char(name)))
	{
		if (world[IN_ROOM(victim)]->zone != world[IN_ROOM(ch)]->zone)
			return;

		if (GET_LEVEL(victim) >= LVL_IMMORT && dam > 0)
		{
			send_to_char
			("������ ����� ������, �� ������� ��� � ������� �� �������� �����������...\r\n", victim);
			return;
		}
		GET_HIT(victim) -= dam;
		if (dam < 0)
		{
			send_to_char("��� ������������� ���� �����.\r\n", victim);
			return;
		}

		update_pos(victim);
		char_dam_message(dam, victim, victim, TYPE_UNDEFINED, 0);
		if (GET_POS(victim) == POS_DEAD)
		{
			if (!IS_NPC(victim))
			{
				sprintf(buf2, "%s killed by mobdamage at %s",
						GET_NAME(victim),
						IN_ROOM(victim) == NOWHERE ? "NOWHERE" : world[IN_ROOM(victim)]->name);
				mudlog(buf2, BRF, 0, SYSLOG, TRUE);
			}
			die(victim, ch);
		}
	}
	else
		mob_log(ch, "mdamage: target not found");
}
