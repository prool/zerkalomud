/* ************************************************************************
*   File: handler.h                                     Part of Bylins    *
*  Usage: header file: prototypes of handling and utility functions       *
*                                                                         *
*  All rights reserved.  See license.doc for complete information.        *
*                                                                         *
*  Copyright (C) 1993, 94 by the Trustees of the Johns Hopkins University *
*  CircleMUD is based on DikuMUD, Copyright (C) 1990, 1991.               *
* 									  *
*  $Author$                                                        *
*  $Date$                                           *
*  $Revision$                                                      *
************************************************************************ */

#ifndef _HANDLER_H_
#define _HANDLER_H_

#define LIGHT_NO    0
#define LIGHT_YES   1
#define LIGHT_UNDEF 2

int get_room_sky(int rnum);
int equip_in_metall(CHAR_DATA * ch);
int awake_others(CHAR_DATA * ch);

void check_light(CHAR_DATA * ch, int was_equip, int was_single, int was_holylight, int was_holydark, int koef);

/* Resistance calculate */
int calculate_resistance_coeff(CHAR_DATA *ch, int resist_type, int effect);

/* handling the affected-structures */
void affect_total(CHAR_DATA * ch);
void affect_modify(CHAR_DATA * ch, byte loc, sbyte mod, bitvector_t bitv, bool add);
void affect_to_char(CHAR_DATA * ch, AFFECT_DATA * af);
void affect_remove(CHAR_DATA * ch, AFFECT_DATA * af);
void affect_from_char(CHAR_DATA * ch, int type);
bool affected_by_spell(CHAR_DATA * ch, int type);
void affect_join_fspell(CHAR_DATA * ch, AFFECT_DATA * af);
void affect_join(CHAR_DATA * ch, AFFECT_DATA * af, bool add_dur, bool avg_dur, bool add_mod, bool avg_mod);
void timed_feat_to_char(CHAR_DATA * ch, struct timed_type *timed);
void timed_feat_from_char(CHAR_DATA * ch, struct timed_type *timed);
int timed_by_feat(CHAR_DATA * ch, int skill);
void timed_to_char(CHAR_DATA * ch, struct timed_type *timed);
void timed_from_char(CHAR_DATA * ch, struct timed_type *timed);
int timed_by_skill(CHAR_DATA * ch, int skill);

/* ��������� �������� ������*/
void affect_room_total(ROOM_DATA * room);
void affect_room_modify(ROOM_DATA * room, byte loc, sbyte mod, bitvector_t bitv, bool add);
void affect_to_room(ROOM_DATA * room, AFFECT_DATA * af);
void affect_room_remove(ROOM_DATA * room, AFFECT_DATA * af);
void affect_from_room(ROOM_DATA * room, int type);
//bool room_affected_by_spell(ROOM_DATA * room, int type);
AFFECT_DATA *room_affected_by_spell(ROOM_DATA * room, int type);
void affect_room_join_fspell(ROOM_DATA *room, AFFECT_DATA * af);
void affect_room_join(ROOM_DATA * room, AFFECT_DATA * af, bool add_dur, bool avg_dur, bool add_mod, bool avg_mod);

/* utility */
char *money_desc(int amount, int padis);
OBJ_DATA *create_money(int amount);
int isname(const char *str, const char *namelist);
int isname(const std::string &str, const char *namelist);
char *fname(const char *namelist);
int get_number(char **name);
int get_number(std::string &name);

/* ******** objects *********** */
bool equal_obj(OBJ_DATA *obj_one, OBJ_DATA *obj_two);
void obj_to_char(OBJ_DATA * object, CHAR_DATA * ch);
void obj_from_char(OBJ_DATA * object);

void equip_char(CHAR_DATA * ch, OBJ_DATA * obj, int pos);
OBJ_DATA *unequip_char(CHAR_DATA * ch, int pos);
int invalid_align(CHAR_DATA * ch, OBJ_DATA * obj);

OBJ_DATA *get_obj_in_list(char *name, OBJ_DATA * list);
OBJ_DATA *get_obj_in_list_num(int num, OBJ_DATA * list);
OBJ_DATA *get_obj_in_list_vnum(int num, OBJ_DATA * list);

OBJ_DATA *get_obj(char *name, int vnum = 0);
OBJ_DATA *get_obj_num(obj_rnum nr);

int obj_decay(OBJ_DATA * object);
bool obj_to_room(OBJ_DATA * object, room_rnum room);
void obj_from_room(OBJ_DATA * object);
void obj_to_obj(OBJ_DATA * obj, OBJ_DATA * obj_to);
void obj_from_obj(OBJ_DATA * obj);
void object_list_new_owner(OBJ_DATA * list, CHAR_DATA * ch);

void extract_obj(OBJ_DATA * obj);

/* ******* characters ********* */

CHAR_DATA *get_char_room(char *name, room_rnum room);
CHAR_DATA *get_char_num(mob_rnum nr);
CHAR_DATA *get_char(char *name, int vnum = 0);

void char_from_room(CHAR_DATA * ch);
void char_to_room(CHAR_DATA * ch, room_rnum room);
void extract_char(CHAR_DATA * ch, int clear_objs, bool zone_reset = 0);

/* find if character can see */
CHAR_DATA *get_char_room_vis(CHAR_DATA * ch, const char *name);
CHAR_DATA *get_char_room_vis(CHAR_DATA * ch, const std::string &name);
CHAR_DATA *get_player_vis(CHAR_DATA * ch, const char *name, int inroom);
CHAR_DATA *get_player_vis(CHAR_DATA * ch, const std::string &name, int inroom);
CHAR_DATA *get_player_pun(CHAR_DATA * ch, const char *name, int inroom);
CHAR_DATA *get_player_pun(CHAR_DATA * ch, const std::string &name, int inroom);

CHAR_DATA *get_char_vis(CHAR_DATA * ch, const char *name, int where);
CHAR_DATA *get_char_vis(CHAR_DATA * ch, const std::string &name, int where);
OBJ_DATA *get_obj_in_list_vis(CHAR_DATA * ch, const char *name, OBJ_DATA * list);
OBJ_DATA *get_obj_in_list_vis(CHAR_DATA * ch, const std::string &name, OBJ_DATA * list);
OBJ_DATA *get_obj_vis(CHAR_DATA * ch, const char *name);
OBJ_DATA *get_obj_vis(CHAR_DATA * ch, const std::string &name);
OBJ_DATA *get_object_in_equip_vis(CHAR_DATA * ch, const char *arg, OBJ_DATA * equipment[], int *j);
OBJ_DATA *get_object_in_equip_vis(CHAR_DATA * ch, const std::string &arg, OBJ_DATA * equipment[], int *j);


/* find all dots */

int find_all_dots(char *arg);

#define FIND_INDIV	0
#define FIND_ALL	1
#define FIND_ALLDOT	2


/* Generic Find */

int generic_find(char *arg, bitvector_t bitvector, CHAR_DATA * ch, CHAR_DATA ** tar_ch, OBJ_DATA ** tar_obj);

#define FIND_CHAR_ROOM     (1 << 0)
#define FIND_CHAR_WORLD    (1 << 1)
#define FIND_OBJ_INV       (1 << 2)
#define FIND_OBJ_ROOM      (1 << 3)
#define FIND_OBJ_WORLD     (1 << 4)
#define FIND_OBJ_EQUIP     (1 << 5)
#define FIND_CHAR_DISCONNECTED (1 << 6)

#define CRASH_DELETE_OLD   (1 << 0)
#define CRASH_DELETE_NEW   (1 << 1)

/* prototypes from crash save system */

int Crash_get_filename(char *orig_name, char *filename);
int Crash_delete_files(int index);
int Crash_delete_crashfile(CHAR_DATA * ch);
int Crash_clean_file(char *name);
void Crash_listrent(CHAR_DATA * ch, char *name);
int Crash_load(CHAR_DATA * ch);
void Crash_crashsave(CHAR_DATA * ch);
void Crash_idlesave(CHAR_DATA * ch);
void Crash_save_all(void);

/* prototypes from fight.cpp */
void set_fighting(CHAR_DATA * ch, CHAR_DATA * victim);
void stop_fighting(CHAR_DATA * ch, int switch_others);
bool stop_follower(CHAR_DATA * ch, int mode);
void hit(CHAR_DATA * ch, CHAR_DATA * victim, int type, int weapon);
void forget(CHAR_DATA * ch, CHAR_DATA * victim);
void remember(CHAR_DATA * ch, CHAR_DATA * victim);
int damage(CHAR_DATA * ch, CHAR_DATA * victim, int dam, int attacktype, int mayflee);

/* townportal */
char *find_portal_by_vnum(int vnum);
int level_portal_by_vnum(int vnum);
int find_portal_by_word(char *wrd);
void add_portal_to_char(CHAR_DATA * ch, int vnum);
int has_char_portal(CHAR_DATA * ch, int vnum);
void check_portals(CHAR_DATA * ch);
struct portals_list_type *get_portal(int vnum, char *wrd);

/* charm */

#define MAXPRICE 9999999

int charm_points(CHAR_DATA * ch);
int on_charm_points(CHAR_DATA * ch);
int used_charm_points(CHAR_DATA * ch);
CHAR_DATA *charm_mob(CHAR_DATA * victim);
float get_damage_per_round(CHAR_DATA * victim);
float get_effective_cha(CHAR_DATA * ch, int spellnum);
float get_effective_int(CHAR_DATA * ch);
int get_reformed_charmice_hp(CHAR_DATA * ch, CHAR_DATA * victim, int spellnum);
int get_player_charms(CHAR_DATA * ch, int spellnum);
float calc_cha_for_hire(CHAR_DATA * victim);
int calc_hire_price(CHAR_DATA * ch, CHAR_DATA * victim);


/* mem queue */
void MemQ_init(CHAR_DATA * ch);
void MemQ_flush(CHAR_DATA * ch);
int MemQ_learn(CHAR_DATA * ch);
void MemQ_remember(CHAR_DATA * ch, int num);
void MemQ_forget(CHAR_DATA * ch, int num);
int *MemQ_slots(CHAR_DATA * ch);

int get_object_low_rent(OBJ_DATA *obj);
void set_uid(OBJ_DATA *object);

void remove_rune_label(CHAR_DATA *ch);
#endif
