#25100
�����������~
2 c 100
�������~
if %cmd%==������� && %arg.contains(����)% 
calcuid nuzroom 25167 wld
if %nuzroom.people%>0
wecho � �������� ������� ����������� ��������� � ������� "������!".
else
wechoaround %actor% %actor.name% ������ � ��������.
wsend %actor.name% �� ��������� � �������.
wechoaround %actor% %actor.name% ����� � ��������.
wteleport %actor.name% 25167
wpurge %nuzroom%
end
else
oecho ���� ?
  halt
end
~
#25101
�������������������~
0 r 100
~
wait 1s
context 251
if !%hero251%
mecho - ����, � �������� ��� ��� ������ ������ ����������� ��, ��� ��� ������ ���
mecho �������� �� �� ������, �� ����� �� � ��� ����. 
wait 1s
mecho - �������� ������, ��� �� ����, ������ ��������, �� �������, ��� � ��� ���
mecho �������� �� ����� ����. ������ ����� ��� � ��������, ��� �������� ������
mecho �� ���� �����, ������ ��� ��� � ��� ����, �� � ������ ������������. ��
mecho ������ ��������� ���, �������� ��� ������� � ���� ����.
wait 1s
mecho - �������� ������ �� ����� ��������� ������ ������, �� ������ � ��� ��
mecho ������� � �����, ���������� � �����. ����� ������� ����� ���, � ����
mecho ��������� ����� � ������� ���������� ����� �������, ������� �����
mecho �����, � ������� ��������.
wait 1s
���
mecho  - ��� ������ ���� ������������� ����� �����, � ������ ����� ������� 
mecho ����, �� �������� ����� ������ � ��������� � ������. �� �� ����������
mecho ��� ��� �������� ���������, �� �����, ������, ��� �� �������� ������ �� ����� �������� �������.
wait 1s
���
mecho - ������, ������ �� �� �����, ������� �� ������� ����, ��� ��� ���� ���.
mecho ���� ������� ������� ��������, �������� ��� ������� � ����������� ��
mecho ��������� �� �����, ����� ��� ��������.
wait 1s
mecho - ��, ������, ���� ������������ ����, ����� ���� � ������������ ���-��
mecho ������ � ������ ����� ���� ���������, ��� ������ � ����� ����� ��������
mecho �������. ������ �� �����. �� � ��� �� ����� �������� ���������, ���� ��
mecho � ���� ������� �����, ��� �� �� ��������. ���� ���������.
wait 1s
attach 25102 %self.id%
else
if (%actor.name% == %hero251%)
�����
wait 2s
say �� ��� �� ����� �������?
else
mecho ���, ���, ������ ����� ����. �������� %hero251% ������ ��� � ����� ����
mecho �� ���-�� ������.
wait 2s
���
mecho ���� � �� ���� ��� ������, ����� ����� ����� ���� ��������, ����������
mecho ������� � ���� ����� - ����� �������� ���� ��������.
wait 2s
������
end
end
~
#25102
��������������~
0 d 1
�� ������~
wait 1 
say �������, � ���� ����� ���� �����.
if %world.curmobs(25107)% > 0
context 251
eval hero251 %actor.name%
global hero251
calcuid z251 25107 mob
remote hero251 %z251.id%
attach 25106 %z251.id%
attach 25108 %z251.id%
detach 25103 %z251.id%
detach 25102 %self.id%
end
~
#25103
���������������1~
0 r 100
~
mecho - ������ ����, ������.
mecho - ���� ���� �������? ���� � �����, �� ���� ���������, ���-�� ��� ��������.
mecho �� ����� ��� ���� ���� ����� ������� � ��� ��������� ������� ������� ���
mecho �������. ������ �� �����, ������� ������� � ��� �����������.
wait 1s
mecho - � ������� ������������ ����� ����������� ������ - ������ ��������
mecho �������� ������� �� ������ �� ����� ������ � ��������� �� �����.
mecho - ��� �, �� ����� ��� ��� ��� ������� ��������� � �������, ����������
mecho �������, � ����� �������� �� ����������� �����, �������, ����� � �����.
wait 1s
mecho - ���, �� �����. ������ � ����� ��������� �� ���� ������, �� �����
mecho ��������� ������������.
wait 2s
if %world.curmobs(25110)% > 0
mecho - �� ���� ����� ���� ��������� �� ������ ������������ ����� ���������
mecho �������. ���� ������� ��� �������, ��� ��������.
end
wait 3s
if %world.curmobs(25114)% > 0
mecho - ���� ��� ��� ���� ����, �������� �� ���������� ����� ������ ������
mecho ���������, ���� ������������ ����� �����, ����� ����� ������� ��
mecho �����������. ���������� ��� ���-�� �����, ���� ����������. � ����
mecho ������ �� � ������� �� ������, ������� �������������� ��� ������,
mecho � ������� ���� �� ���.
end
~
#25104
������������~
0 q 100
~
wait 1
if %world.curmobs(25103)% > 0
msend %actor% �������� ����� ������� ���� ����������� � ������ ������.
tell %actor.name% ������ ����!
wait 1s
�������� %actor.name%
wait 1s
tell %actor.name% ���� � ���� ����, ����� ������� ��� �������. � ��� �������� � ��� �� ����������.
tell %actor.name% ������ �������� ����, ��� �� ������ ���� ����������, �� ������� ������� ����.
tell %actor.name% ���� ��������, ��� �����.
msend %actor% ����� ������ ���� ����, ��� ����� �������� �������� ������.
wait 1s
tell %actor.name% � �������, ������� �� ������� 10 ������.
tell %actor.name% �������� �����, �� �������.
����
wait 1s
tell %actor.name% � �������. ���� ���� ������ ��������, ������� ���������� �� ������ ������.
tell %actor.name% � �����, ���� ����, ������� ����� ����.
wait 1s
msend %actor% �������� ����� ��������� ���������� ������ ������.
end
~
#25105
��������������~
0 j 100
~
wait 1
if %object.name%==���� ��������� ����
 tell %actor.name% ����� �������� ��, �������� �� ���������� ����� ��������.
 tell %actor.name% �������� ������ ���� ��� ��������, ����� ��� ���� ������ ������.
wait 1s
���
wait 1s
 mecho ������� ����� �������� ����.
wait 1s
say ����, ��������� ���� ����� �������� �������, ��� ��� �������.
say �����, ��� 400 ����� �������� �� ����� ������� ����������, ��� ��� ��� ���� ����.
  %self.gold(+200)%
���� 200 ��� %actor.name%
wait 2
  if %world.curobjs(25104)% < 10
   mload obj 25104
   mecho ������� ����� ������� ����� ����, ���-�� ��� �����������, ���-�� �������.
   ���� ������ %actor.name%
   tell %actor.name% ����� ������ ������� ���� ����� ����� ���������� ������������.
  end
 tell %actor.name% �����, ����� ����������.
 tell %actor.name% �������, �� ������� �����.
 mpurge ����
 mpurge %self%
else
  say  ����� ��� ���?
  eval getobject %object.name%
  if  %getobject.car% == ����
     mpurge ����
  else
     ����� %getobject.car%.%getobject.cdr%
  end
end
~
#25106
���������������2~
0 r 100
~
wait 1
if %world.curmobs(25114)% > 0
mecho - ���� ��� ��� ���� ����, �������� �� ���������� ����� ������ ������
mecho ���������, ���� ������������ ����� �����, ����� ����� ������� ��
mecho �����������. ���������� ��� ���-�� �����, ���� ����������. � ����
mecho ������ �� � ������� �� ������, ������� �������������� ��� ������,
mecho � ������� ���� �� ���.
end
context 251
if (%actor.name% == %hero251%)
wait 1s
����
wait 1s
mecho - ���, ������� �� ��� � ���������, � �� ������ ������������, ����������� � ���
mecho � ��� ��. ��������� ����, �� �� ��� �����, ����� ��������� ���� ��������
mecho �������� ���� � �����, �� ���� � ��.
wait 1s
mecho  - ������ ������������, �������� �������.
wait 1s
mecho - ��� � ��� ��� ���, ������� ��� ������� ������ �� ����� �����.
end
~
#25107
���������~
0 n 100
~
context 251
eval hero251 blank
remote hero251 %self.id%
attach 25101 %self.id%
attach 25102 %self.id%
attach 25111 %self.id%
~
#25108
��������������~
0 f 100
~
context 251
if (%actor.name% == %hero251%) && %world.curmobs(25110)% > 0
mecho �������� ����� ������� ����������� �� �����.
mecho �������� ������: �� ������� ���� ���!
mecho �������� ������: �� ������ ��� � �� ��������� ��������� �� ������ ������� ����.
mecho �������� ������: �������� ����� �� ��� �� �����, ������ ����� � �� ����� ���������.
mecho �������� ������: � ������� �� ���� ����� �������� ��������� ������� � ������� ������.
mecho �������� ������: ������ ����� ����� ����� �����, �� ��� ������� ���� ���� ������ �� ����� � ����������.
mecho �������� ��������.
mecho �������� ������: �������� � �������� ��� ������, ������� �� �� ������ ��������� ����������.
mload obj 25103
detach 25106 %self.id%
calcuid p251 25110 mob
attach 25109 %p251.id%
detach 25108 %self.id%
end
~
#25109
����������������~
0 j 100
~
wait 1
context 251
if (%object.vnum%==25103) && (%actor.name%==%hero251%)
say �������, ��� � ���, �� ��� ����.
mecho ����� ���������� �� �������.
say � ������� ������, ��� � ���� ������ ����.
*say � ������� �� ������ ����� ����� ������ � ���� ���� � ���� �������,
*say ���������� � ����� � ������� � �������� ���� ����� ����� � ����� ����������� ����.
%self.gold(+4000)%
���� 4000 ��� %actor.name%
wait 2s
  if %world.curobjs(25107)% < 2
   mload obj 25107
   mecho ����� ������ �� ����� ������.
   ���� ������ %actor.name%
  end
 say %actor.name% �����, ������� ������, �������� � �������� ���������.
 mpurge %self%
else
 wait 1s
 say ������ � ���� ���?
 ���
 wait 1s
 ������� '������, ����� ����� �����!'
 say ����� ����� �����!
 mkill %actor.name%
end
detach %self.id%
~
#25110
������������~
0 j 100
~
wait 1
switch %object.vnum%
* ������
   case 25108
     say �������, ������ ������ ������ ��� �����.
     mecho �������� �������� � ����� ������, ��������� ��� �� ���� ������.
     say �� ����� ������� ��� ���� �������.
     %self.gold(+1000)%
     ���� 1000 ��� %actor.name%
wait 1
     mpurge %object%
      wait 2
     if %world.curobjs(25109)% < 2
       mload obj 25109
       say �������� �����, ����� � ���� �� - ����� ����������.
       ���� ������ %actor.name%
     end
    break
* ������
case 25110
  say ��� ������� ������ ������ �������� �����.
  say ������, ��������� ������������, ��� ������ �� ��������� �������� �� ����.
  say �� �� ���� � �����, ������� ������ ������� �� ����� �����.
  wait 1s
  mecho �������� ������ ������ ����� �� ������ � ������ � ������� ����.
  wait 1s
  mforce %actor% ����
  mforce %actor.name% say �������� ��� ��������� � ��������, ����� ���� ���������� ����������.
  wait 1s
  mecho �������� ������� ����� %actor.rname% � ����� �����������.
  wait 1s
  say � ���� ����� ����, �� ���� ����� ������?
  mecho � ����� ������� �������� ������ �� ����� ����� � ��������.
  mload obj 25111
  ������� �����
  say ��� ���� � ����������. � ������ �� ����� �� � ���� ����.
  say � �� ��������� ������ ��� ���������� ������.
  say ������ ����, ������ �����.
  ���
  say ��������� ������ � ������� ���� ����� �������, ������ ���� �����.
wait 1
  mpurge %object%
 break
default
  say  ����� ��� ���?
  eval getobject %object.name%
  if  %getobject.car% == ����
     mpurge ����
  else
     ����� %getobject.car%.%getobject.cdr%
  end
break
done
~
#25111
�����������~
0 f 100
~
context 251
if (%actor.name% == %hero251%)
mecho ����� ����� ��������� ��������� ���� ����� �������.
mecho ����� ������: ��������� ����� � ����� ������ ����� ����� ��� �� ��������!
mecho ����� ������: �� ��������� ���� ���� �����, �� ������� ���� � ���� ������.
end
mload obj 25110
eval hero251 blank
calcuid z251 25107 mob
remote hero251 %z251.id%
detach 25106 %z251.id%
~
#25112
���������������~
0 r 100
~
wait 1
msend %actor% ��������� ������ ����:
msend %actor% - ������ ����, %actor.name%, �������� ����!
msend %actor% - � ���� ��������� ���� ����� ���� �� ��������������� ����� �� 10 ���.
~
#25113
������������������~
0 m 1
~
wait 1
switch %amount%
 case 10
  msend %actor.name% ��������� ������ ������� � �����, ����� ��� ������� � ���.
  wait 1s
  msend %actor.name% �� ������� �� ����� ����� ���� � ��������� ������.
 if %actor.sex%==1
  mechoaround %actor% %actor.name% ����� � ����� � ����������.
  mechoaround %actor% %actor.name% ����� �� ����� � ����������.
 else
  mechoaround %actor% %actor.name% ������� � ����� � ����������.
  mechoaround %actor% %actor.name% ������ �� ����� � ����������.
 end
  wait 1s
  msend %actor.name% �� �������� �� ��������������� ����� � ������� �� �����.
  msend %actor.name% ��������� ������ ��������� � ����� � ������ �����.
  mteleport %actor% 25065
  wait 1s
 if %actor.sex%==1
  mat 25065 mechoaround %actor% %actor.name% ������� � ������ ������ � ����� �� �����.
 else
  mat 25065 mechoaround %actor% %actor.name% �������� � ������ ������ � ������� �� �����.
 end
  mat 25065 mechoaround %actor% ��������� ������ ��������� � ����� � ������ �����.
  wait 1s
  mat 25120 mecho ���������-�������� ������� �����.
 break
 default
 msend %actor% ���-�� �� ��.
 msend %actor% � ������� ���������� �����, ������� ��� ���. 
 ���� %amount% ��� %actor.name%
 break	
done
~
#25114
������������~
0 f 100
~
if %random.4%==1
mload obj 519
end
~
#25115
����� ���� ����������� �����������~
2 f 100
~
context 251
if %exist.mob(25107)%
calcuid z251 25107 mob
rdelete hero251 %z251.id%
end
if %exist.mob(25110)%
calcuid knez 25110 mob
rdelete hero251 %knez.id%
detach 25101 %knez.id%
detach 25102 %knez.id%
detach 25111 %knez.id%
attach 25111 %knez.id%
attach 25101 %knez.id%
end
~
$~