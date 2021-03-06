/**************************************************************************
*  File: dg_misc.cpp                                      Part of Bylins  *
*  Usage: contains general functions for script usage.                    *
*                                                                         *
*                                                                         *
*  $Author$                                                         *
*  $Date$                                           *
*  $Revision$                                                   *
************************************************************************ */

#include "conf.h"
#include "sysdep.h"
#include "structs.h"
#include "constants.h"
#include "dg_scripts.h"
#include "utils.h"
#include "comm.h"
#include "interpreter.h"
#include "handler.h"
#include "dg_event.h"
#include "db.h"
#include "screen.h"
#include "spells.h"
#include "char.hpp"
#include "room.hpp"

/* copied from spell_parser.c: */
#define SINFO spell_info[spellnum]

/* external vars */
extern INDEX_DATA **trig_index;

extern const char *item_types[];
extern const char *apply_types[];
extern const char *affected_bits[];

int ext_search_block(const char *arg, const char **list, int exact);

#define SpINFO spell_info[spellnum]
extern const char *what_sky_type[];
extern int what_sky;
extern const char *what_weapon[];
/*
 * ������� ������������ ����� ���� ��� DG_CAST
 * ����������� ������ find_cast_target
 */
int find_dg_cast_target(int spellnum, const char *t, CHAR_DATA * ch, CHAR_DATA ** tch, OBJ_DATA ** tobj, ROOM_DATA ** troom)
{
	*tch = NULL;
	*tobj = NULL;
	*troom = world[IN_ROOM(ch)];

	if (spellnum == SPELL_CONTROL_WEATHER)
	{
		if ((what_sky = search_block(t, what_sky_type, FALSE)) < 0)
		{
			sprintf(buf2, "dg_cast (�� ������ ��� ������)");
			script_log(buf2);
			return FALSE;
		}
		else
			what_sky >>= 1;
	}
	if (spellnum == SPELL_CREATE_WEAPON)
	{
		if ((what_sky = search_block(t, what_weapon, FALSE)) < 0)
		{
			sprintf(buf2, "dg_cast (�� ������ ��� ������)");
			script_log(buf2);
			return FALSE;
		}
		else
			what_sky = 5 + (what_sky >> 1);
	}

	if (IS_SET(SpINFO.targets, TAR_IGNORE))
		return TRUE;

	if (IS_SET(SpINFO.targets, TAR_ROOM_THIS))
		return TRUE;

	if (*t)
	{
		if (IS_SET(SpINFO.targets, TAR_CHAR_ROOM))
		{
			if ((*tch = get_char_vis(ch, t, FIND_CHAR_ROOM)) != NULL)
			{
//            if (SpINFO.violent && !check_pkill(ch,*tch,t))
//                 return FALSE;
				return TRUE;
			}
		}
		if (IS_SET(SpINFO.targets, TAR_CHAR_WORLD))
		{
			if ((*tch = get_char_vis(ch, t, FIND_CHAR_WORLD)) != NULL)
			{
//            if (SpINFO.violent && !check_pkill(ch,*tch,t))
//                 return FALSE;
				return TRUE;
			}
		}

		if (IS_SET(SpINFO.targets, TAR_OBJ_INV))
			if ((*tobj = get_obj_in_list_vis(ch, t, ch->carrying)) != NULL)
				return TRUE;

		if (IS_SET(SpINFO.targets, TAR_OBJ_EQUIP))
		{
			int i;
			for (i = 0; i < NUM_WEARS; i++)
				if (GET_EQ(ch, i) && isname(t, GET_EQ(ch, i)->name))
				{
					*tobj = GET_EQ(ch, i);
					return TRUE;
				}
		}

		if (IS_SET(SpINFO.targets, TAR_OBJ_ROOM))
			if ((*tobj = get_obj_in_list_vis(ch, t, world[IN_ROOM(ch)]->contents)) != NULL)
				return TRUE;

		if (IS_SET(SpINFO.targets, TAR_OBJ_WORLD))
			if ((*tobj = get_obj_vis(ch, t)) != NULL)
				return TRUE;
	}
	else
	{
		if (IS_SET(SpINFO.targets, TAR_FIGHT_SELF))
			if (ch->get_fighting() != NULL)
			{
				*tch = ch;
				return TRUE;
			}
		if (IS_SET(SpINFO.targets, TAR_FIGHT_VICT))
			if (ch->get_fighting() != NULL)
			{
				*tch = ch->get_fighting();
				return TRUE;
			}
		if (IS_SET(SpINFO.targets, TAR_CHAR_ROOM) && !SpINFO.violent)
		{
			*tch = ch;
			return TRUE;
		}
	}

	return FALSE;
}


/* cast a spell; can be called by mobiles, objects and rooms, and no   */
/* level check is required. Note that mobs should generally use the    */
/* normal 'cast' command (which must be patched to allow mobs to cast  */
/* spells) as the spell system is designed to have a character caster, */
/* and this cast routine may overlook certain issues.                  */
/* LIMITATION: a target MUST exist for the spell unless the spell is   */
/* set to TAR_IGNORE. Also, group spells are not permitted             */
/* code borrowed from do_cast() */
void do_dg_cast(void *go, SCRIPT_DATA * sc, TRIG_DATA * trig, int type, char *cmd)
{
	CHAR_DATA *caster = NULL;
	CHAR_DATA *tch;
	OBJ_DATA *tobj;
	ROOM_DATA *troom;

	ROOM_DATA *caster_room = NULL;
	char *s, *t;
	int spellnum, target = 0;


	/* need to get the caster or the room of the temporary caster */
	switch (type)
	{
	case MOB_TRIGGER:
		caster = (CHAR_DATA *) go;
		break;
	case WLD_TRIGGER:
		caster_room = (ROOM_DATA *) go;
		break;
	case OBJ_TRIGGER:
		caster_room = dg_room_of_obj((OBJ_DATA *) go);
		if (!caster_room)
		{
			trig_log(trig, "dg_do_cast: unknown room for object-caster!");
			return;
		}
		break;
	default:
		trig_log(trig, "dg_do_cast: unknown trigger type!");
		return;
	}

	/* get: blank, spell name, target name */
	s = strtok(cmd, "'");
	if (s == NULL)
	{
		sprintf(buf2, "dg_cast: needs spell name.");
		trig_log(trig, buf2);
		return;
	}
	s = strtok(NULL, "'");
	if (s == NULL)
	{
		sprintf(buf2, "dg_cast: needs spell name in `'s.");
		trig_log(trig, buf2);
		return;
	}
	t = strtok(NULL, "\0");

	/* spellnum = search_block(s, spells, 0); */
	spellnum = find_spell_num(s);
	if ((spellnum < 1) || (spellnum > MAX_SPELLS))
	{
		sprintf(buf2, "dg_cast: invalid spell name (%s)", cmd);
		trig_log(trig, buf2);
		return;
	}

	if (IS_SET(SINFO.routines, MAG_GROUPS))
	{
		sprintf(buf2, "dg_cast: group spells not permitted (%s)", cmd);
		trig_log(trig, buf2);
		return;
	}

	if (!caster)
	{
		caster = read_mobile(DG_CASTER_PROXY, VIRTUAL);
		if (!caster)
		{
			trig_log(trig, "dg_cast: Cannot load the caster mob!");
			return;
		}
		/* set the caster's name to that of the object, or the gods.... */
		/* take select pieces from char_to_room(); */
		if (type == OBJ_TRIGGER)
		{
			sprintf(buf, "��� %s", ((OBJ_DATA *) go)->PNames[1]);
			caster->set_npc_name(buf);
			sprintf(buf, "��� %s", ((OBJ_DATA *) go)->PNames[1]);
			GET_PAD(caster, 0) = str_dup(buf);
			sprintf(buf, "���� %s", ((OBJ_DATA *) go)->PNames[1]);
			GET_PAD(caster, 1) = str_dup(buf);
			sprintf(buf, "���� %s", ((OBJ_DATA *) go)->PNames[1]);
			GET_PAD(caster, 2) = str_dup(buf);
			sprintf(buf, "���� %s", ((OBJ_DATA *) go)->PNames[1]);
			GET_PAD(caster, 3) = str_dup(buf);
			sprintf(buf, "����� %s", ((OBJ_DATA *) go)->PNames[1]);
			GET_PAD(caster, 4) = str_dup(buf);
			sprintf(buf, "���� %s", ((OBJ_DATA *) go)->PNames[1]);
			GET_PAD(caster, 5) = str_dup(buf);
		}
		else if (type == WLD_TRIGGER)
		{
			caster->set_npc_name("����");
			GET_PAD(caster, 0) = str_dup("����");
			GET_PAD(caster, 1) = str_dup("�����");
			GET_PAD(caster, 2) = str_dup("�����");
			GET_PAD(caster, 3) = str_dup("�����");
			GET_PAD(caster, 4) = str_dup("������");
			GET_PAD(caster, 5) = str_dup("�����");
		}
		caster->next_in_room = caster_room->people;
		caster_room->people = caster;
		IN_ROOM(caster) = real_room(caster_room->number);
	}


	/* Find the target */
	if (t != NULL)
		one_argument(t, arg);
	else
		*arg = '\0';
	if (*arg == UID_CHAR)
	{
		if (!(tch = get_char(arg)))
		{
			sprintf(buf2, "dg_cast: victim (%s) not found", arg);
			trig_log(trig, buf2);
		}
		else
		{
			target = 1;
		}
	}
	else
	{
		target = find_dg_cast_target(spellnum, arg, caster, &tch, &tobj, &troom);
	}


	if (target)
	{
		call_magic(caster, tch, tobj, troom, spellnum, GET_LEVEL(caster), CAST_SPELL);
	}
	else if(spellnum != SPELL_RESSURECTION && spellnum != SPELL_ANIMATE_DEAD)
	{
		sprintf(buf2, "dg_cast: target not found (%s)", cmd);
		trig_log(trig, buf2);
	}
	if (caster_room)
		extract_char(caster, FALSE);
}


/* modify an affection on the target. affections can be of the AFF_x  */
/* variety or APPLY_x type. APPLY_x's have an integer value for them  */
/* while AFF_x's have boolean values. In any case, the duration MUST  */
/* be non-zero.                                                       */
/* usage:  apply <target> <property> <spell> <value> <duration>
   if duration < 1 - function removes affect */
#define APPLY_TYPE	1
#define AFFECT_TYPE	2
void do_dg_affect(void *go, SCRIPT_DATA * sc, TRIG_DATA * trig, int script_type, char *cmd)
{
	CHAR_DATA *ch = NULL;
	int value = 0, duration = 0, battle = 0;
	char junk[MAX_INPUT_LENGTH];	/* will be set to "dg_affect" */
	char charname[MAX_INPUT_LENGTH], property[MAX_INPUT_LENGTH];
	char value_p[MAX_INPUT_LENGTH], duration_p[MAX_INPUT_LENGTH];
	char battle_p[MAX_INPUT_LENGTH];
	char spell[MAX_INPUT_LENGTH];
	int index = 0, type = 0, index_s = 0, i;
	AFFECT_DATA af;


	half_chop(cmd, junk, cmd);
	half_chop(cmd, charname, cmd);
	half_chop(cmd, property, cmd);
	half_chop(cmd, spell, cmd);
	half_chop(cmd, value_p, cmd);
	half_chop(cmd, duration_p, battle_p);

	/* make sure all parameters are present */
	if (!*charname || !*property || !*value_p || !*duration_p)
	{
		sprintf(buf2, "dg_affect usage: <target> <property> <spell> <value> <duration>");
		trig_log(trig, buf2);
		return;
	}

	/* �������� '_' �� ' ' � �������� ���������� � ������� */
	for (i = 0; spell[i]; i++)
		if (spell[i] == '_')
			spell[i] = ' ';
	for (i = 0; property[i]; i++)
		if (property[i] == '_')
			property[i] = ' ';

	value = atoi(value_p);
	duration = atoi(duration_p);
	battle = atoi(battle_p);
	if (duration < 0)
	{
		sprintf(buf2, "dg_affect: need positive duration!");
		trig_log(trig, buf2);
		return;
	}

	/* find the property -- first search apply_types */
	if ((index = search_block(property, apply_types, FALSE)) != -1)
		type = APPLY_TYPE;
	else
	{
		/* search affect_types now */
		if ((index = ext_search_block(property, affected_bits, FALSE)) != 0)
			type = AFFECT_TYPE;
	}

	if (!type)  		/* property not found */
	{
		sprintf(buf2, "dg_affect: unknown property '%s'!", property);
		trig_log(trig, buf2);
		return;
	}

	/* locate spell */
	index_s = find_spell_num(spell);

	/* spell not found */
	if (index_s <= 0)
	{
		sprintf(buf2, "dg_affect: unknown spell '%s'!", spell);
		trig_log(trig, buf2);
		return;
	}


	/* locate the target */
	ch = get_char(charname);
	if (!ch)
	{
		sprintf(buf2, "dg_affect: cannot locate target!");
		trig_log(trig, buf2);
		return;
	}

	if (duration > 0)
	{
		/* add the affect */
		af.type = index_s;
		af.duration = duration;
		af.modifier = value;
		af.battleflag = battle;
		if (type == AFFECT_TYPE)
		{
			af.location = APPLY_NONE;
			af.bitvector = index;
		}
		else
		{
			af.location = index;
			af.bitvector = 0;
		}
		affect_to_char(ch, &af);
	}
	else
	{
		/* remove affect */
		affect_from_char(ch, index_s);
		trig_log(trig, "dg_affect: affect removed from char");
	}
}
