// $RCSfile$     $Date$     $Revision$
// Copyright (c) 2009 Krodo
// Part of Bylins http://www.mud.ru

#include <boost/bind.hpp>
#include <boost/format.hpp>
#include <sstream>
#include "dps.hpp"
#include "utils.h"
#include "comm.h"
#include "char.hpp"
#include "interpreter.h"
#include "db.h"
#include "handler.h"

namespace DpsSystem
{

// ���-�� ����������� �������� � ������� ����
const unsigned MAX_DPS_CHARMICE = 5;
boost::format dps_stat_format(" %25s |  %15d | %5d |  %5d | %11d |\r\n");
boost::format dps_group_stat_format(" %25s |  %8d | %3.0f%% | %5d |  %5d | %11d |\r\n");

/**
* ���������� ����������� ������ � ����-������.
*/
void DpsNode::add_dmg(int dmg, int over_dmg)
{
	if (dmg >= 0 && over_dmg >= 0)
	{
		dmg_ += dmg;
		over_dmg_ += over_dmg;
		buf_dmg_ += dmg;
	}
}

/**
* ��� ��� ������ � ���������� ��� ���������� ������.
* ���� �������� ���������� ������ ��� ��������.
*/
void DpsNode::set_name(const char *name)
{
	if (name && *name)
	{
		name_ = name;
		if (name_.size() > 25)
		{
			name_ = name_.substr(0, 25);
		}
	}
}

/**
* ������ ������ � �����.
*/
int DpsNode::get_stat() const
{
	if (rounds_)
	{
		return dmg_/rounds_;
	}
	return 0;
}

unsigned DpsNode::get_dmg() const
{
	return dmg_;
}

unsigned DpsNode::get_over_dmg() const
{
	return over_dmg_;
}

const std::string & DpsNode::get_name() const
{
	return name_;
}

/**
* ������������ ��� ������������� � ������� ��� ��������, ��� � �����.
*/
long DpsNode::get_id() const
{
	return id_;
}

void DpsNode::end_round()
{
	if (round_dmg_ < buf_dmg_)
	{
		round_dmg_ = buf_dmg_;
	}
	buf_dmg_ = 0;
	++rounds_;
}

unsigned DpsNode::get_round_dmg() const
{
	return round_dmg_;
}

////////////////////////////////////////////////////////////////////////////////
// Dps

void Dps::add_dmg(int type, CHAR_DATA *ch, int dmg, int over_dmg)
{
	switch (type)
	{
	case PERS_DPS:
		pers_dps_.add_dmg(dmg, over_dmg);
		break;
	case PERS_CHARM_DPS:
		pers_dps_.add_charm_dmg(ch, dmg, over_dmg);
		break;
	case GROUP_DPS:
		add_group_dmg(ch, dmg, over_dmg);
		break;
	case GROUP_CHARM_DPS:
		if (ch && ch->master)
		{
			add_group_charm_dmg(ch, dmg, over_dmg);
		}
		break;
	default:
		log("SYSERROR: �� �� ������ ���� ���� �������, func: %s", __func__);
		return;
	}
}

void Dps::end_round(int type, CHAR_DATA *ch)
{
	switch (type)
	{
	case PERS_DPS:
		pers_dps_.end_round();
		break;
	case PERS_CHARM_DPS:
		pers_dps_.end_charm_round(ch);
		break;
	case GROUP_DPS:
		end_group_round(ch);
		break;
	case GROUP_CHARM_DPS:
		end_group_charm_round(ch);
		break;
	default:
		log("SYSERROR: �� �� ������ ���� ���� �������, func: %s", __func__);
		return;
	}
}

/**
* ������� ���� ��� ������.
*/
void Dps::clear(int type)
{
	switch (type)
	{
	case PERS_DPS:
	{
		PlayerDpsNode empty_dps;
		pers_dps_ = empty_dps;
		exp_ = 0;
		battle_exp_ = 0;
		lost_exp_ = 0;
		break;
	}
	case PERS_CHARM_DPS:
		break;
	case GROUP_DPS:
		group_dps_.clear();
		break;
	case GROUP_CHARM_DPS:
		break;
	default:
		log("SYSERROR: �� �� ������ ���� ���� �������, func: %s", __func__);
		return;
	}
}

/**
* ��� ���������� ������ �� ���������� ������.
*/
struct sort_node
{
	sort_node(std::string in_name, int in_dps, unsigned in_round_dmg, unsigned in_over_dmg)
			: dps(in_dps), round_dmg(in_round_dmg), over_dmg(in_over_dmg)
	{
		name = in_name.substr(0, 25);
	};

	std::string name;
	int dps;
	unsigned round_dmg;
	unsigned over_dmg;
};

typedef std::multimap<unsigned /* dmg */, sort_node> SortGroupType;
SortGroupType tmp_group_list;
// ��������� ����� ������ ��� ���������� ����������
unsigned tmp_total_dmg = 0;

void Dps::add_tmp_group_list(CHAR_DATA *ch)
{
	GroupListType::iterator it = group_dps_.find(GET_ID(ch));
	if (it != group_dps_.end())
	{
		sort_node tmp_node(it->second.get_name(), it->second.get_stat(),
				it->second.get_round_dmg(), it->second.get_over_dmg());
		tmp_group_list.insert(std::make_pair(it->second.get_dmg(), tmp_node));
		tmp_total_dmg += it->second.get_dmg();
		it->second.print_group_charm_stats(ch);
	}
}

/**
* ���������� ������������ ���������� ������ � ��� ��������.
* \param ch - �����, �������� ���� ����������.
* \param coder - ������ ������ ���������� ������� ���������, �� ��������� = 0
*/
void Dps::print_stats(CHAR_DATA *ch, CHAR_DATA *coder)
{
	if (!coder)
	{
		coder = ch;
	}

	send_to_char("������������ ����������:\r\n"
			"                       ��� |   �������� ����� | � ����� (����) | ������ ���� |\r\n"
			"---------------------------|------------------|----------------|-------------|\r\n", coder);
	send_to_char(str(dps_stat_format
			% GET_NAME(ch) % pers_dps_.get_dmg()
			% pers_dps_.get_stat() % pers_dps_.get_round_dmg()
			% pers_dps_.get_over_dmg()), coder);
	send_to_char(pers_dps_.print_charm_stats(), coder);

	double percent = exp_ ? battle_exp_ * 100.0 / exp_ : 0.0;
	int balance = exp_ + lost_exp_;

	send_to_char(coder, "\r\n����� �������� �����: %s, �� �����: %s (%.2f%%)\r\n"
			"�������� �����: %s, ������: %s %s\r\n",
			thousands_sep(exp_).c_str(), thousands_sep(battle_exp_).c_str(), percent,
			thousands_sep(abs(lost_exp_)).c_str(), balance >= 0 ? "+" : "-",
			thousands_sep(abs(balance)).c_str());

	if (AFF_FLAGGED(ch, AFF_GROUP))
	{
		tmp_total_dmg = 0;
		CHAR_DATA *leader = ch->master ? ch->master : ch;
		leader->dps_print_group_stats(ch, coder);
	}
}

/**
* ���������� ��������� ����������, ����������� � ������ ������.
* \param ch - �����, �������� ���� ����������.
* \param coder - ������ ������ ���������� ������� ���������, �� ��������� = 0
*/
void Dps::print_group_stats(CHAR_DATA *ch, CHAR_DATA *coder)
{
	if (!coder)
	{
		coder = ch;
	}

	send_to_char("\r\n���������� ����� ������:\r\n"
			"---------------------------|------------------|----------------|-------------|\r\n", coder);

	CHAR_DATA *leader = ch->master ? ch->master : ch;
	for (follow_type *f = leader->followers; f; f = f->next)
	{
		if (f->follower && !IS_NPC(f->follower) && AFF_FLAGGED(f->follower, AFF_GROUP))
		{
			add_tmp_group_list(f->follower);
		}
	}
	add_tmp_group_list(leader);

	std::string out;
	for (SortGroupType::reverse_iterator it = tmp_group_list.rbegin(); it != tmp_group_list.rend(); ++it)
	{
		double percent = tmp_total_dmg ? it->first * 100.0 / tmp_total_dmg : 0.0;
		out += (str(dps_group_stat_format % it->second.name % it->first % percent
				% it->second.dps % it->second.round_dmg % it->second.over_dmg));
	}
	send_to_char(out, coder);
	tmp_group_list.clear();
}

void Dps::add_group_dmg(CHAR_DATA *ch, int dmg, int over_dmg)
{
	GroupListType::iterator it = group_dps_.find(GET_ID(ch));
	if (it != group_dps_.end())
	{
		it->second.add_dmg(dmg, over_dmg);
	}
	else
	{
		PlayerDpsNode tmp_node;
		tmp_node.set_name(GET_NAME(ch));
		tmp_node.add_dmg(dmg, over_dmg);
		group_dps_.insert(std::make_pair(GET_ID(ch), tmp_node));
	}
}

void Dps::end_group_round(CHAR_DATA *ch)
{
	GroupListType::iterator it = group_dps_.find(GET_ID(ch));
	if (it != group_dps_.end())
	{
		it->second.end_round();
	}
	else
	{
		PlayerDpsNode tmp_node;
		tmp_node.set_name(GET_NAME(ch));
		tmp_node.end_round();
		group_dps_.insert(std::make_pair(GET_ID(ch), tmp_node));
	}
}

void Dps::add_group_charm_dmg(CHAR_DATA *ch, int dmg, int over_dmg)
{
	GroupListType::iterator it = group_dps_.find(GET_ID(ch->master));
	if (it != group_dps_.end())
	{
		it->second.add_charm_dmg(ch, dmg, over_dmg);
	}
	else
	{
		PlayerDpsNode tmp_node;
		tmp_node.set_name(GET_NAME(ch->master));
		tmp_node.add_charm_dmg(ch, dmg, over_dmg);
		group_dps_.insert(std::make_pair(GET_ID(ch->master), tmp_node));
	}
}

void Dps::end_group_charm_round(CHAR_DATA *ch)
{
	GroupListType::iterator it = group_dps_.find(GET_ID(ch->master));
	if (it != group_dps_.end())
	{
		it->second.end_charm_round(ch);
	}
	else
	{
		PlayerDpsNode tmp_node;
		tmp_node.set_name(GET_NAME(ch->master));
		tmp_node.end_charm_round(ch);
		group_dps_.insert(std::make_pair(GET_ID(ch->master), tmp_node));
	}
}

/**
* ����� �� �������� ������ � dps_copy, �������� ������ ����.����������.
*/
Dps & Dps::operator= (const Dps &copy)
{
	if (this != &copy)
	{
		group_dps_ = copy.group_dps_;
	}
	return *this;
}

void Dps::add_exp(int exp)
{
	if (exp >= 0)
	{
		exp_ += exp;
	}
	else
	{
		lost_exp_ += exp;
	}
}

void Dps::add_battle_exp(int exp)
{
	battle_exp_ += exp;
}

// Dps
////////////////////////////////////////////////////////////////////////////////
// PlayerDpsNode

CharmListType::iterator PlayerDpsNode::find_charmice(CHAR_DATA *ch)
{
	CharmListType::iterator i = std::find_if(charm_list_.begin(), charm_list_.end(),
			boost::bind(std::equal_to<int>(),
			boost::bind(&DpsNode::get_id, _1), GET_ID(ch)));

	if (i != charm_list_.end())
	{
		return i;
	}

	DpsNode tmp_node(GET_ID(ch));
	tmp_node.set_name(GET_NAME(ch));

	charm_list_.push_front(tmp_node);
	if (charm_list_.size() > MAX_DPS_CHARMICE)
	{
		charm_list_.pop_back();
	}
	return charm_list_.begin();
}

void PlayerDpsNode::add_charm_dmg(CHAR_DATA *ch, int dmg, int over_dmg)
{
	CharmListType::iterator i = find_charmice(ch);
	if (i != charm_list_.end())
	{
		i->add_dmg(dmg, over_dmg);
	}
	else
	{
		log("SYSERROR: �� �� ������ ���� ���� �������, func: %s", __func__);
	}
}

void PlayerDpsNode::end_charm_round(CHAR_DATA *ch)
{
	CharmListType::iterator it = find_charmice(ch);
	if (it != charm_list_.end())
	{
		it->end_round();
	}
	else
	{
		log("SYSERROR: �� �� ������ ���� ���� �������, func: %s", __func__);
	}
}

/**
* ������� � ������������ ���������� ��������� ��� ����������.
*/
std::string PlayerDpsNode::print_charm_stats() const
{
	std::ostringstream text;
	for (CharmListType::const_iterator it = charm_list_.begin(); it != charm_list_.end(); ++it)
	{
		if (it->get_dmg() > 0)
		{
			text << dps_stat_format % it->get_name() % it->get_dmg()
					% it->get_stat() % it->get_round_dmg() % it->get_over_dmg();
		}
	}
	return text.str();
}

/**
* ���������� ��������� ���������� ����� �������� �� ������� ������.
*/
void PlayerDpsNode::print_group_charm_stats(CHAR_DATA *ch) const
{
	std::ostringstream text;
	for (follow_type *f = ch->followers; f; f = f->next)
	{
		if (!IS_CHARMICE(f->follower))
		{
			continue;
		}
		CharmListType::const_iterator it = std::find_if(charm_list_.begin(), charm_list_.end(),
				boost::bind(std::equal_to<int>(),
				boost::bind(&DpsNode::get_id, _1), GET_ID(f->follower)));
		if (it != charm_list_.end() && it->get_dmg() > 0)
		{
			sort_node tmp_node(it->get_name(), it->get_stat(), it->get_round_dmg(), it->get_over_dmg());
			tmp_group_list.insert(std::make_pair(it->get_dmg(), tmp_node));
			tmp_total_dmg += it->get_dmg();
		}
	}
}

// PlayerDpsNode
////////////////////////////////////////////////////////////////////////////////

/**
* ������� ������ �� ���������� �����, ��������� � ������ ������ � �� ��������� ���.
*/
void check_round(CHAR_DATA *ch)
{
	if (!IS_NPC(ch))
	{
		ch->dps_end_round(DpsSystem::PERS_DPS);
		if (AFF_FLAGGED(ch, AFF_GROUP))
		{
			CHAR_DATA *leader = ch->master ? ch->master : ch;
			leader->dps_end_round(DpsSystem::GROUP_DPS, ch);
		}
	}
	else if (IS_CHARMICE(ch) && ch->master)
	{
		ch->master->dps_end_round(DpsSystem::PERS_CHARM_DPS, ch);
		if (AFF_FLAGGED(ch->master, AFF_GROUP))
		{
			CHAR_DATA *leader = ch->master->master ? ch->master->master : ch->master;
			leader->dps_end_round(DpsSystem::GROUP_CHARM_DPS, ch);
		}
	}
}

} // namespace DpsSystem

namespace
{

const char *DMETR_FORMAT =
"������ �������:\r\n"
"����� - ����� ���� ����������\r\n"
"����� �������� - ������� ������������ ����������\r\n"
"����� �������� ������ - ������� ��������� ���������� (������ �����)\r\n";

} // namespace

/**
* '�����' - ����� ����� ���������� � ���������, ���� � ������.
* '����� ��������' - ������� ����� ����������.
* '����� �������� ������' - ������� ��������� ���������� (������ �����).
*/
ACMD(do_dmeter)
{
	if (IS_NPC(ch))
	{
		return;
	}

	char name[MAX_INPUT_LENGTH];
	two_arguments(argument, arg, name);

	if (!*arg)
	{
		ch->dps_print_stats();
	}
	else if (isname(arg, "��������"))
	{
		if (!*name)
		{
			ch->dps_clear(DpsSystem::PERS_DPS);
			send_to_char("������������ ���������� �������.\r\n", ch);
		}
		else if (isname(name, "������"))
		{
			if (!AFF_FLAGGED(ch, AFF_GROUP))
			{
				send_to_char("�� �� �������� � ������.\r\n", ch);
				return;
			}
			if (ch->master)
			{
				send_to_char("�� �� ��������� ������� ������.\r\n", ch);
				return;
			}
			ch->dps_clear(DpsSystem::GROUP_DPS);
		}
	}
	else if (PRF_FLAGGED(ch, PRF_CODERINFO))
	{
		// ���������� ���������� ���������� ���������
		CHAR_DATA *vict = get_player_vis(ch, arg, FIND_CHAR_WORLD);
		if (vict)
		{
			vict->dps_print_stats(ch);
		}
		else
		{
			send_to_char("��� ������ ����.\r\n", ch);
		}
	}
	else
	{
		send_to_char(DMETR_FORMAT, ch);
	}
}
