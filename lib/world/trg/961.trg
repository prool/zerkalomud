#96100
��� ����� (������, �������)~
0 f 100
~
eval rnd %random.80%
if (%rnd% < 20) && (%world.curobjs(96101)% < 5)
  mload obj 96101
elseif  (%rnd% < 40) && (%world.curobjs(96102)% < 5)
  mload obj 96102
elseif %rnd% < 60  && (%world.curobjs(96103)% < 5)
  mload obj 96103 
end
~
#96101
��� ����������~
0 f 100
~
if (%random.100% <= 10) && (%world.curobjs(96105)% < %world.maxobj(96105)%)
  mload obj 96105
end
~
#96102
������� � ����-���~
0 q 100
~
wait 1s
%echo% �������� ������ �������� ����� ����������� �����.
wait 1
� ���, ���, ����� ������� ������� �������!
� ��� �����, ����� ����������?
� � �� ��� ������, ������ ������� ������ ���������.
� �������-�������, �����, ������ ������� ��������� ��������.
wait 2
if %actor.id% == %questor960.id%
  %echo% ��������� �������������� ����� ���������������, �� ��� �� ����� �������� ����-��� ����� ������.
  wait 1s
  ����
  � ���, ���������� ����� ����������.
  � ������� �� ���, �� ��� ������ ��� �� ������, ��� ������ ����.
  �� ���������� ���-�� ���� ��������������
  wait 1
  ���
  %echo% �������� ���� �������� �����������, � � ������ ��������� ������� �������.
  � �����, ������� ���...
  wait 1s
  �� �������� ��������� �� ������ � ������� �����-�� ����� ������������ �������
  %load% obj 96100
  ���� ���.����� .%actor.name%
  � ��������� ��, � ����� ������� ��� � ����.
  ����
  attach 96103 %self.id%
  attach 96113 %self.id%
  detach 96102 %self.id%
end
~
#96103
���� ������� ����-���~
0 j 100
~
wait 1
if %object.vnum% != 96100
  ����
  � ��������, �� ����?
  � ���, ������, ����� ��� ����������.
  ���� ���
else
  � ���, �������� �����, �� ����� �����...
  %purge% %object%
  ���
  � ���, ����� ������ ��� �� ������.
  wait 1s
  ���
  wait 1s
  ���
  � �����, ���� ������ ��������� ���, ��������, ��� ����� ��� � ����� ����� ������.
  � ����� ��� ����� ���-�����
  �� ���������� ����������� ������
  � � ��� � ��� ������ �����...
  � ��� ���� � ��� ����� �� �����, ����� ���� ��� ������� �� ����� ���� ����������.
  � � ���� � ����� ������ �� ������� ������� ������.
  � �������, ������� ��� � �����-������� � ������ ������.
  � ��� ����� (����-��� ����� ��������� �� ���) �������, ��������� ��� ������ ��������,
  � �� � ���-����� �������, �� ����� �� ���������� ���� �������.
  � �������, �������, ��������, �����, �� ������� ��� ���.
  attach 96104 %self.id%
  detach 96102 %self.id%
  detach 96113 %self.id%
  detach 96103 %self.id%
end
~
#96104
���� ����� ����-���~
0 j 100
~
wait 1
if %object.vnum% != 96201
  � � �� ��� ��� ���, ������, �����?
  ���� ���
else
  %purge% %object%
  � ���, ��������, � ������ ������ ������������?
  � �� � ���������, �� �������� � ������ ������, ���� ��������.
  � � �������, �������-�� ��� ����������.
  �� ��������� �������� ����� ���-����� � ������������� ��������
  wait 1s
  � ��� ������ �� ����� � �������� ���, ��� ����� ��� � ����� �� ������� �����.
  � ���� �� ����, ���� �� �����.
  ���
  � ��� ����� � ����� ����� ���������.
  � ���� � ��� ������� ����, ��� ��� �� ������� ��������.
  � � �������, ��� �� ������� - ���� ����.
  �� ���-�� �������� �����������
  %echo% �� ��� ����������� ������� ������.
  wait 1s
  � �� ������� ����� � �������, �� �� ��������.
  � ����� ��, ��� �� ������ ��� ����, ��� � �������� ��� �� �����.
  calcuid zmei 96175 room
  exec 96116 %zmei.id%
  ���
  wait 1
  eval rnd %random.100%
  if (%rnd% < 15) && (%world.curobjs(96106)% < 2)
    %load% obj 96106
    �� �������� ����� � ����� �� ��������� ��������
    � ����� ���, ����� � ���������� � �����������.
    ���� ��� .%actor.name%
  elseif (%rnd% < 30) && (%world.curobjs(96107)% < 2)
    %load% obj 96107
    �� �������� ����� � ����� �� ��������� ��������
    � ����� ���, ����� � ���������� � �����������.
    ���� ��� .%actor.name%
  elseif (%rnd% < 45) && (%world.curobjs(96108)% < 2)
    %load% obj 96108
    �� �������� ����� � ����� �� ��������� ��������
    � ����� ���, ����� � ���������� � �����������.
    ���� ��� .%actor.name%
  elseif (%rnd% < 60) && (%world.curobjs(96109)% < 2)
    %load% obj 96109
    �� �������� ����� � ����� �� ��������� ��������
    � ����� ���, ����� � ���������� � �����������.
    ���� ��� .%actor.name%
  end
  detach 96104 %self.id%
end
~
#96105
������ �������� (���� ����)~
0 f 100
~
%echo% ��������� �������� �� ��������� ����������� ����!
%load% mob 96117
%load% mob 96117
%load% mob 96117
~
#96106
��������� ������� 1~
2 e 100
~
wait 1
if %exist.mob(96115)%
  calcuid korshun 96115 mob
  %teleport% %korshun% 96140
  %echo% �������� � ������� ������ ������� ��� � �������� ������ �������!
  %force% %korshun% ���� .%actor.name%
end
~
#96107
������ ������~
0 v 1
~
dg_cast '������' .%actor.name%
%send% %actor.name% ������ ������ ����� ������ �������� ��� �����!
%echoaround% %actor% ������ ������ ����� ������ �������� ����� %actor.dname%!
mecho �������� �������� ������ ������� ������ ����� � ������ �� ������ ����.
mteleport %self% 96199
~
#96108
��������� �����~
2 j 100
~
wait 1
%echo% ������-�� ������ �� ��� ���������� ������� ��������, � �������� � �����!
%load% mob 96123
wait 4s
%echo% ��������, � ����� ���� �� ������ ���������� ��������� ��� ���-��!
%load% mob 96116
detach 96108 %self.id%
~
#96109
����-��� �������� ��� ����������� �������~
0 e 0
���������~
� ����� ��������������, � ����� �������...
���
~
#96110
��������� �����~
0 n 100
~
wait 1
���� !���� ����!
~
#96111
��������� ������� 2~
2 e 100
~
wait 1
if %exist.mob(96115)%
  calcuid korshun 96115 mob
  %teleport% %korshun% 96151
  %echo% �������� � ������� ������ ������� ��� � �������� ������ �������!
  %force% %korshun% ���� .%actor.name%
end
~
#96112
��������� ������� 3~
2 e 100
~
wait 1
if %exist.mob(96115)%
  calcuid korshun 96115 mob
  %teleport% %korshun% 96162
  %echo% �������� � ������� ������ ������� ��� � �������� ������ �������!
  %force% %korshun% ���� .%actor.name%
end
~
#96113
������� � ����-��� ������ ���~
0 q 100
~
wait 1
if %actor.id% == %questor960.id%
  ���
  � ���, ����� ������ ��� �� ������.
  wait 1s
  ���
  wait 1s
  ���
  � �����, ���� ������ ��������� ���, ��������, ��� ����� ��� � ����� ����� ������.
  � ����� ��� ����� ���-�����
  �� ���������� ����������� ������
  � � ��� � ��� ������ �����...
  � ��� ���� � ��� ����� �� �����, ����� ���� ��� ������� �� ����� ���� ����������.
  � � ���� � ����� ������ �� ������� ������� ������.
  � �������, ������� ��� � �����-������� � ������ ������.
  � ��� ����� (����-��� ����� ��������� �� ���) �������, ��������� ��� ������ ��������,
  � �� � ���-����� �������, �� ����� �� ���������� ���� �������.
  � �������, �������, ��������, �����, �� ������� ��� ���.
  attach 96104 %self.id%
  detach 96102 %self.id%
  detach 96103 %self.id%
  detach 96113 %self.id%
else
  wait 1s
  %echo% �������� ������ �������� ����� ����������� �����.
  wait 1
  � ���, ���, ����� ������� ������� �������!
  � ��� �����, ����� ����������?
  � � �� ��� ������, ������ ������� ������ ���������.
  � �������-�������, ����� ������, ������ ������� ��������� ��������.
end
~
#96114
����� ����~
2 f 100
~
calcuid abc 96175 room
attach 96108 %abc.id%
~
#96115
������ ���� (���� �����)~
0 f 100
~
%echo% ����������� ���� �����������!
%load% mob 96106
%load% mob 96106
~
#96116
���� ����-�������~
2 z 100
~
wload mob 96309
~
#96117
������� (96309) ���������� �� ������~
0 d 100
������~
wait 1
%echo% �������� ���� ���������� �������, �� ������� ��������� ������ ������� �� ���� �������� ������.
%echo% ���� �������� �����������, ������� ���� ��� ������ ��������� ��������, ����������... � �������!
wait 1
%echo% �� � ������ ��������, ��� ������ �� ���������� ����� ������ �� ������!
wait 1
%echo% ������ �����-�� �����, ������������� ����� ����������.
%echo% ������ �������� ����� �� �������� �������� ��� ���� ������!
wait 1
%echo% ������������� �� ���� �� ����� ������, ���� ����� ������� ��� �� �����.
%echo% ������������ �������, �� ����� �������� � ����, � ������ ����� �� ����������
wait 1
mteleport all 96386
~
#96118
�������� ��������~
0 k 100
~
if %self.hitp% < 1000 && %self.realroom% != 96138
  %echo% ������ �������� ������ � ������������ �������� �����.
  mteleport %self% 96138
else
  dg_cast '���������'
end
~
#96119
������ ������ �����~
0 f 100
~
if (%random.100% <= 25) && (%world.curobjs(1761)% < %world.maxobj(1761)%)
  mload obj 1761
  %echo% ����� ������ ������ ����� �� ����������� �����-�� �������.
end
~
$~