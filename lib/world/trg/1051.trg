#105100
����������� ����������~
0 q 100
~
wait 1
say ����������, �����������!
mecho _- �� ���� ���� ������!
��
wait 1
say ������� �� ������ �������� � �����.
mecho _- ������� ����� ������� ���.
mecho _- ���� ����� ������ � ������� �� ������ �� ����� �������.
detach 105100 %self.id%
~
#105101
����������� ����������~
0 q 100
~
wait 1
emot ��� ���� ��� ��������� �� ������
wait 1
emot ������������ � ���, � ����� ���� � ������� ����.
say � ���� �� �� ������, � ������ �� �� ��������� �� ������.
wait 1s
say ������ �� �������� ���!
mecho _- � ����� ������ � �� ������, ���������������� ��������� �� ������������� � ���������.
wait 1s
say ��� ��������� � ���� ��� ������.
mecho _- ������ ���, ������ ����� � ����� �� �����.
mecho _- � �� � ��� ��������� ��, �� �� ������ ���������� ������ � ��� ������ �� ������.
mecho _- ���� �� ������� ������� ������������ ����� � ��������� ���� �� ��� ������
mecho _- ���� �������� �� ���������� �������.
calcuid sever 105113 mob
attach 105103 %sever.id%
detach 105101 %self.id%
~
#105102
��������� ������~
0 bq 40
~
wait 1
switch %random.5%
  case 1
    say ��-��..��..��..��..��
  break
  case 2
    say ��.. ��-��. ��.. ��.. ��
  break
  case 3
    ���
  break
  case 4
    ���
  break
  case 5
    say ��..��..��...��..��
  break
done
~
#105103
���� ���������~
0 c 1
������� �����~
wait 1
if !%arg.contains(�������)% && !%arg.contains(���������)%
  msend %actor% ������� - ���� ��������... �� ������ ���������� �� �����������.
  msend %actor% �� � � ��� �� ���������� ���������?
  halt
end
set potion %actor.eq(17)%
if %potion.vnum% != 105100
  msend %actor% ��� �� ����������� �� �������?
  halt
end
calcuid otvar 105100 obj
wait 1
mpurge %otvar%
wait 1s
msend %actor% �� ������� �������-��������� ������������ �������.
mechoaround %actor% %actor.name% ������%actor.g% �������-��������� ������������ �������.
wait 2s
detach 105102 %self.id%
mtransform 105129
mecho _����� ��������� ����������� � ��� ����� ��������� ������������ �� ��������.
wait 1s
say ��� �?
wait 1s
say ��� ��?
wait 2
say ��� �� ���� ���������?
calcuid sever 105112 mob
attach 105105 %sever.id%
attach 105104 %self.id%
detach 105103 %self.id%
~
#105104
��������� �������~
0 d 1
������ �����~
wait 1
emot ��������� ���������� �� ��������
say ������ ����� �����... ������ �����������.
stand 
follow .%actor.name%
~
#105105
������� ��������� � ���������~
0 g 100
~
if %actor.vnum% != 105129
  halt
end
set questor105100 %actor.leader%
mforce questmob105101 follow �
emot ������ ��������� �������
wait 1
mecho ��������� �������� � �������, ��� �������� � ����������� � ���.
wait 1s
say �� ������ �� ����� ���������� ������, ����� �������� ������ � �����������.
say ������� ����, � ����� ��� �������������.
switch %random.6%
  case 1
    mload obj 105112
    ���� ��� .%questor105100.name%
  break
  case 2
    mload obj 1598
    ���� ��� .%questor105100.name%
  break
  default
    mload obj 105127
    ���� ������ .%questor105100.name%
  done
  calcuid sestra 105129 mob
  wait 1
  mpurge %sestra%
  wait 1
  mecho ������ ���, ��������� ������ �� ����� ������ ������ ���� � ��� ������ ���������.
  wait 1
  mpurge %self%
~
#105106
���������� ������ ����~
0 q 100
~
wait 1
mechoaround %actor% ���������� ��������� � ���-�� ��������� %actor.dname%.
msend %actor% ���������� ��������� ��� : '������ �������.. ���� ����� �����.. ������ �� ������ - ����������� ������� �����...'
mecho ���������� ��������� ��������� �� ������������ � ���������.
attach 105107 %self.id%
detach 105106 %self.id%
~
#105107
����������� ���� ���~
0 j 100
~
wait 1
if %object.type% != 19
  mecho ���������� � ������ ��������� �� ���.
  drop all
  halt
end
wait 1
mpurge %object%
mecho _���������� ���������� �� �������� � � ��������� ������ ��� �� ��������� ������.
wait 1s
mecho ������������ ������ �������� �����������.
emot ������������ �� ����
wait 1s
����
calcuid nadsm 105109 mob
attach 105108 %nadsm.id%
detach 105107 %self.id%
~
#105108
����������� ����~
0 f 100
~
calcuid peon 105107 mob
exec 105109 %peon.id%
~
#105109
���������� ����������~
0 z 100
~
wait 2s
emot �������������� �� ������ ������� ��������� �� ���� ������������
wait 1
say �� ��, ��� �� ������� ���� �� ������� �����, � ������ ���� ��� ���
mload obj 105101
set char %random.pc%
give tooth1051 %char.name%
say � ���� ������������ �������� - ���� ������� ����� �������-�������� � ����� �������.
mecho _- � ��� ���� ������� - ������ ������������ ��� �� �������
wait 1
mpurge %self%
~
#105110
���� ������ ��������~
0 j 100
~
wait 1
if %object.vnum% != 105101
  ��� .%actor.name%
  drop %object.name%
  halt
end
wait 1
mpurge %object%
wait 1s
emot �������� ������ ���
wait 1
���
wait 2
say ���� ������, ������� � ���, ��� �� ����� ����-�� �� �����.
say ��� � ��� ��� ���� �������?
������ .%actor.name%
attach 105111 %self.id%
detach 105110 %self.id%
~
#105111
������� ��������~
0 d 0
������~
wait 1
if (!%speech.contains(���������)% && !%speech.contains(����)%)
  say ���� �������-��?
  mecho _- ���� ����� ���������? ��� ���� �� ����, �����, ��� ����������.
  mecho _- ��� ����� ���������?
  halt
end
wait 2
emot ��������� �� ������ ����� �����
������
say ��� �������...
mecho ������� �������� ������ ������.
wait 2 
mecho ���-���....
wait 3s
mecho ���-���....
wait 3s
mecho ���-���....
wait 4s
mecho ���-���....
wait 2s
mecho ���-���....
wait 2s
mecho ___&R�������!!!!&n
mecho �������� ������ �������, ���������� �������� � ��������������� �����.
mdoor 105139 w room 105140
wait 2
���
detach 105111 %self.id%
~
#105112
����������� ������� ��������~
0 q 100
~
wait 1
say �� �������-��... 
mecho _- � � �� ��������, ��� �������, ����� ���� �������� ���-����.
mecho _- �� ������ ������ ��������� ���� � ����������� ������!
wait 2
emot � ������� �������� �� ���
attach 105113 %self.id%
detach 105112 %self.id%
~
#105113
�������� �� ��������-���������~
0 d 1
������ ������� ��������� ������~
wait 1
if %actor.vnum% != -1
  halt
end
say ���, �� ���� ������ ���������� ���� ������ ����������� ��������.
mecho _- �� ������ ��� �� ������ ��-�� �������� ������� ����� ������.
mecho _- �������� ��������� ����� ��� ������������ ����� �������!
wait 1
say � �������� ������ ��� �� �������. ���������� �������� ����.
wait 3s
say �����-�� �� ����� ������� ����� �������� ���������� ������ �������,
mecho _- ���� ������ ��������� ����������� ������� ��� � ������ ����������, ���� �����.
wait 1
say � �� ����� ��, ������, ���� �������������� ����� � ��������... 
mecho _- ������� �� ��������� � ��������� ������ � �������� ����,
mecho _- ����� ���������, ��������� ������.
wait 1s
say ��-�� ���������, ��� � �������� ��������� ��������. 
wait 2s
say �� �� ���������� ������� ��� ��� ����� ��������� ����� ����� ��������� ��� �� �����.
mecho _- ��������� �� ������ �� ������� ���� ���������� ��������-��������
mecho _- ������� �� �������� ���  �������� ������ � ������ ����������� ��������� �������� �����
mecho _- ���������� �� ������.
wait 2s
say ���������� ������ ��� ��� ����� ������� ���������, ������, ��� �������������� ��� ����,
mecho _- �� ������� ��� � �������� ������ � �������, ��������� ������� � �������� ����.
mecho _- �� ��� �� ������!
mecho _- �����, ������� ������� �������, �������� ���� ����� ��� ���������� �������
mecho _- � ������ ������ �� �����!
���
wait 2s
say � ��� ��� ����� �� ����� ���������� � ������,
mecho _- ����� ���������� ������ � ��������� ������������� ������,
mecho _- � �� ��� ��� ���� ��� �� ����������,
mecho _- ������ � ������� ������������ ����� ����������� �� ������� ����� �����.
wait 2s
say ���� �� �� ���������� ��� ������ - ������ �� �������� �� � �����.
attach 105114 %self.id%
detach 105113 %self.id%
~
#105114
������ ������ �������-��������~
0 d 1
�������� �������� ������~
wait 1
if %actor.vnum% != -1
  halt
end
say ��� ���� ���������� ������ �� �����, �� ����� ����...
mecho _- ����� ��������� �������� ���� ���������� ������ ����� �������� ��������.
mecho _- ������, ���, ����� �� ������ ���,
mecho _- ����� �������, ��� ��� �������� ���-��, �� ����� �� ����� ��� ������...
�����
wait 1s
say �� � ���� ����� ��� ��� ����� ��� ��� �����������, � ������ � ���� �����.
attach 105119 %self.id%
detach 105114 %self.id%
~
#105115
����������� ������~
0 q 100
~
wait 1
say ����� �������!
��
wait 1s
say ���� ���-�� ����� ������ ���� - ������ � �� ��� ����� ��� ��� ����,
mecho _- ��� ��� �������� ��������� �������!
wait 3
say � ����, �� �����������, � �� ��� ������� ������, �� ���� �� ���� ����������?
mecho _- ������, �� ����������� ��� ������?!
wait 2
say ����� ��� ����� � ����� �������� ���� ����� �� �������� �����,
mecho _- ������� ������ �������� ����� ������.
mecho _- �� �� ������� ���������� ������ ����, ���� ��������� � � �� ����� ��������� ������.
mecho _- ������ � ������, �� ��� ��������� �� � ������ ��� �� �������.
wait 2s
say ����� ��������� ������� ��� ����� ����� ����� �������� ��������
mecho _- � ����� ��������� ����� � ������� ��������, ������� ������������ ��������� ������
mecho _- �� ���� ��������.
mecho _- ���� �� ��� �������� - � ��� ����� �����������.
attach 105120 %self.id%
detach 105115 %self.id%
~
#105116
����� ������~
0 f 100
~
calcuid altar 105192 room
attach 105117 %altar.id%
mload obj 105125
~
#105117
�������� ������~
2 c 1
�������� ����������~
wait 1
if !%arg.contains(������)%
  wsend %actor% ��� �� ������ ����������?
  halt
end
wsend %actor% �� �������� ������ �� ����������� �����.
wechoaround %actor% %actor.name% �������%actor.g% ������ �� ����������� �����.
wait 2s
wecho &C�������� ������ �������� � ���������� ��������� �������, ������ ������ ����-�� ���.&n
calcuid altar 105128 obj
wait 1
wpurge %altar%
wload obj 105129
attach 105118 %self.id%
detach 105117 %self.id%
~
#105118
���������� ������ ����� ��������~
2 d 1
�������~
wait 1
if %actor.vnum% != -1
  halt
end
wecho __����� ��������� � ��� ��� ������
wecho __&c����� ����� �������� ��� ������� �������� ����� ����� � ����� ���������� ������.&n
set questor105101 %actor%
global questor105101
calcuid oldman 105126 mob
remote questor105101 %oldman.id%
detach 105118 %self.id%
~
#105119
����� ������ ������� - ��������~
0 r 100
~
wait 1
if %actor.id% != %questor105101.id%
  halt
end
wait 2
���
wait 1s
say �� ������� ����������� -  �������� �� ������� ���� ��������.
mecho _- ������ ������ � ��� ����� ���� � �����  ����� �����.
mecho _- ������� �� ��� � ���� ����� ���������������
switch %random.5%
  case 1
    mload obj 581
  break
  *case 2
  *say ���� �� ���� ����-���� ����, ������ ���� ������
  *break
  default
    %self.gold(+5000)%
    give 5000 ��� .%actor.name%
  done
  mecho ������ �������� ������ ���������� � �������, ����� �������� ��������� ����� �������������.
  wait 1
  mpurge %self%
~
#105120
������ ����� � ������~
0 d 1
�������� ������ ��������~
wait 1
if %actor.vnum% != -1
  halt
end
set questor105102 %actor%
global questor105102
wait 2
���
say ����� ������...
mecho _- � ��� � ����, ��� ��� ��������� ����������� ����� ������������ ������� �����.
wait 1s
say ����, ������� ����� ����� ���������� ��������.
mecho _- ������� ��� �������� - ����� �������� �������� ���� �������� �� ��� ������,
mecho _- ��������� ����� �������� ���
���
wait 2s
say � ��� ����� ��������� ����� �������� �������� - ������ ���������.
mecho _- � �� ����������� ��� ��� ����� ���� ��������.
mecho _- ��� ������ ��� ����� ������ - ��������� ���� � �� ������ �������� ����� ������.
attach 105122 %self.id%
detach 105120 %self.id%
~
#105121
����� �������-��������~
0 f 100
~
mload obj 105126
~
#105122
���� ����� ����� ������~
0 j 100
~
wait 1
if %object.vnum% != 105126
  say ��� �� ��, ��� ��� �����.
  drop %object.name%
  halt
end
wait 1
mpurge %object%
say ������������!
mecho _- ��� ������ ��, ��� �����!
mecho _- �����  � ���� ����� �������. ������ ��!
emot ���-�� ������� ����� ����������� ����� ������� ����������� ����� �� ������
mecho __�������� ����� ��������� � ��� ��� ������...
����� �����, ������ �������� ��������� ����� ��������!
attach 105123 %self.id%
detach 105122 %self.id%
~
#105123
������� ������ ����� �������� � ������~
0 d 1
������� ���-������ ������ ������� ����~
wait 1
if %speech% != ����
  ������� ���, ���! ��� �� �������%actor.g%!
  mload mob 105123
  mload mob 105119
  mload mob 105119
  mload mob 105125
  calcuid ghoul 105125 mob
  exec 105132 %ghoul.id%
  detach 105116 %self.id%
  detach 105123 %self.id%
  halt
end
mecho _����� ������� �������� ��� �� ��������� � ������� ������ ���������� �� �����.
mecho _�� ����� �� ����� �������� �������� ������ � ����������� �� �����, � �������.
calcuid room1 105108 room
calcuid room2 105126 room
calcuid room3 105136 room
calcuid room4 105114 room
exec 105124 %room1.id%
exec 105124 %room2.id%
exec 105124 %room3.id%
exec 105124 %room4.id%
�����
wait 2s
say ���� ��������� ����� - � ����� �� ������ ����������� ����� ���������� �������
mecho _- ����������� ����� ��������.
wait 1s
say � ���� � ������ ��������� ���� �������� � ��������� ��� �� ����������� ������.
switch %random.6%
  case 1
    say ���� �� ���� ����-���� ����, ������ ���� ������
  break
  case 2
    say ���� �� ���� ����-���� ����, ������ ���� ������
  break
  default
    %self.gold(+5000)%
    give 5000 ��� .%actor.name%
  done
~
#105124
�������� ������ � �������~
2 z 100
~
wecho �������� ��������� ������ ����� � ����� ��-��� ����� ������� ������ ������!
wload mob 105120
wload mob 105121
wload mob 105122
wload mob 105123
~
#105125
����������� �������~
0 q 100
~
wait 1
say ���� � ���� �� ��������, ������ ����� ����.
mecho _- ���� ������ �������� ����������� � ���, ��� ���������� �� ������ �������� �����.
mecho _- � ������ ����� ����� ����� ������� ������� ������� �������������
mecho _- ������, ����� � ����� ������, ������ ���� ������ ������������ ������.
�����
wait 3s
say ���� � �� ���� ��������� ����� �� �������� ������� ��� ���������,
mecho _- �� � �� ���� ��� ���������, �� ������� ��� ���� ����� ������
���
wait 1s
say ��� ���� � ���, ��� ������-������� �������, ����� ��������� ������ 
mecho _- ��������� �� �������, �������, ��� � ��� ������� �������� ����� ������� �� ������.
mecho _- �� ������������!
mecho _- ��������� ��� ����� ����������, � �� ����� ������� ����� ����� � ����� ���������
mecho _- ����� ������, ������� ������ � �������� ������.
���
wait 2s
say ���� ���� ������ ���� ������ ��� � �������� ���������� �� ���������
mecho _- �������� ����� ��������.
mecho _- �� ��� ����� ������� ��� ������� �� ������ ����������� ����������!
mecho _- � ��� ������ �� ������� ������, ���� ����,
mecho _- � ��� ������ ���������� ����� �������� ��������,
mecho _- � ����� ������ ������������ � ������ ����� ���������� ��������
���
wait 3s
say ���� �� �� ������ ��� ������ � ����� �� ����... �..
mecho _- ��������� ����� ���� ������ - � ������ �� ����� ���������, � ��� ����� ��������
������ .%actor.name%
attach 105126 %self.id%
detach 105125 %self.id%
~
#105126
������ ������ � �������~
0 d 1
�������� �������� �������� ������ ������~
wait 1
mecho ������ ������� �� ����� ������ ��������� ���������.
wait 1s
say ��������� �������-�������� ��� �� ���� �������
mecho _- ��� ����� ������ �������� ����� ������� ���������� �����.
mecho _- ������ ������������ ���� ����������� ������, 
mecho _- �������� ��� ��� � ������, � ����� � �����-���� �����.
mecho _- � ��� ������ ����� �������� � ���� � �� ���� ��� �����
���
wait 1s
say ��� ��� ����� � ���� ��� ����� �����. �����!
set qring105100 0
set blood105100 0
global qring105100
global blood105100
attach 105127 %self.id%
detach 105126 %self.id%
~
#105127
������ ������ �������~
0 j 100
~
wait 1
switch %object.vnum%
  case 105125
    wait 1
    mpurge %object%
    set qring105100 1
    global qring105100
    if !%blood105100%
      say ���������!
      say �������� ���� ��������� ����� ����� ���������� ��������.
      ��
      halt
    end
  break
  case 105126
    wait 1
    mpurge %object%
    set blood105100 1
    global blood105100
    if !%qring105100%
      say ���������!
      say �������� ���� ������ ������ ������������.
      ��
      halt
    end
  break
  default
    say ��.. ��� ��� ������ �� �����.
    give %object.name% .%actor.name%
    drop all
    halt
  end
done
wait 1s
say ��! ��!
mecho _- ���� �� ������� ���! � �� ��� ����� � ���!
mecho _- ��� ���� ������ ������ �������...
mecho _- �������� ���� ���� �������� �������� ������ ����!
mecho _- ������ � ������ ����� �������� � ��� �� ����� �������� �� ��������� ������.
wait 2s
mecho ������ ��������� ������� ������ ������������ ������ ������� ����������� �����,
mecho __������� ��� �� �������ջ � ����� ������ �������.
wait 2s
mecho &W�����������, �� ������� ��� ��� ��������� ����� ������ ����� �����&n
mecho __&W����� �������� � ��� ��� ������&n
wait 1
say ������ ����������� ������ ����� �������� - ����� ��������� ����� �� ������!
attach 105128 %self.id%
detach 105127 %self.id%
~
#105128
������� ������ ����� �������� � �������~
0 d 1
������� ���-������ ������ ������� ����~
wait 1
if ( %speech% != ������ )
  mecho ����� ����������, ��-��� ��� ������� ������� �����.
  wait 1
  ����� ���, ���! ��� �� �� �����! ������, ������� ������!
  halt
end
mecho __&C����� ������ ������� � ������, �������� �� ����������� ����� ��������, �������� ��� ������.
wait 2s
����
say �� ��� � ���, � ������ ���, ��� ������ ��� ������� � ���� ������������ �����.
mecho _- �� ������ � ������ ��� ������������� - ��� �������� �� ���� �������
wait 2
switch %random.5%
  case 1
    mload obj 577
    ���� ���� .%actor.name%
  break
  *case 2
  *say ���� �� ���� ����-���� ����, ������ ���� ������
  *break
  default
    %self.gold(+5000)%
    give 5000 ��� .%actor.name%
  done
  wait 2
  ����
  mecho ������ ������� �� ��������� ��������.
  wait 1
  mpurge %self%
~
#105129
����� � ���� �������~
2 f 100
~
if ( %random.100% <= 30 )
  wat 105196 wload mob 105128
end
calcuid altar 105192 room
detach 105117 %altar.id%
detach 105118 %altar.id%
wdoor 105139 w purge
~
#105130
������������� ���������~
1 n 100
~
wait 2s
if ( %world.curobjs(105136)% == 0 )
  otransform 105136
  halt
end
~
#105131
���� �����~
0 f 100
~
mload obj 105100
~
#105132
�������� ����� � ������~
0 z 100
~
wait 1
mecho ����� ���������, � ������ ������ ��������� ������!
�����
mdamage kosog1051 2001
mkill kosog1051
~
#105133
�������� ������~
0 n 100
~
mload obj 105137
~
$~
