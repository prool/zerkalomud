#10100
<101 - Marja killed~
0 f 100
~
if %world.curobjs(1276)% < 1 && if %world.curobjs(1277)% < 1 && %random.100% < 3
mload obj 1276
end
mload   obj 10111
calcuid Temnica 10125 room
attach  10108 %Temnica.id%
halt
if (%world.curobjs(10101)% < 10) && (%random.100% <= 5)
   mload obj 10101
end
if (%world.curobjs(10108)% < 10) && (%random.100% <= 5)
   mload obj 10108
end
if (%world.curobjs(558)% == 0) && (%random.100% <= 5)
   mload obj 558
end
if (%world.curobjs(529)% == 0) && (%random.100% <= 5)
   mload obj 529
end
~
#10101
<101 - Darja killed~
0 f 100
~
if (%world.curobjs(10102)% < 10) && (%random.100% <= 5)
   mload obj 10102
end
if (%world.curobjs(10109)% < 10) && (%random.100% <= 5)
   mload obj 10109
end
~
#10102
<101 - Evdokia killed~
0 f 100
~
if (%world.curobjs(10103)% < 10) && (%random.100% <= 5)
   mload obj 10103
end
if (%world.curobjs(10105)% < 10) && (%random.100% <= 5)
   mload obj 10105
end
~
#10103
<101 - Old robber killed~
0 f 100
~
if (%world.curobjs(10110)% < 10) && (%random.100% <= 5)
   mload obj 10110
end
~
#10104
<101 - Young robber killed~
0 f 100
~
if (%world.curobjs(10004)% < 30) && (%random.100% <= 25)
   mload obj 10104
end
~
#10105
<101 - Nianika killed~
0 f 100
~
if (%world.curobjs(10104)% < 10) && (%random.100% <= 5)
   mload obj 10104
end
~
#10106
<101 - Petushok "Take diamond"~
2 c 0
������� ������� ���������� �������~
if (%actor.vnum% != -1)
   halt
end
calcuid Petushok 10100 obj
if !%Petushok%
   halt
end
if !(%arg.contains(������)%) && !(%arg.contains(��������)%)
   halt
end
wait 1
wpurge ������.�������
wload  mob 10101
wforce ������� attack %actor.name%
detach 10106 %self.id%
~
#10107
<101 - Petushok killed~
0 f 100
~
if %random.10% <= 2
   mload obj 10113
end
~
#10108
<101 - PC open door to temnica~
2 j 100
~
if %actor.vnum% != -1
   halt
end
makeuid Hero %actor.id%
global  Hero
switch %random.5%
  case 1
    wload    mob    10108
    calcuid  target 10108 mob
    attach   10109 %target.id%
    remote   Hero  %target.id%
  case 2
    wload    mob 10109
    calcuid  target 10109 mob
    attach   10110 %target.id% 
    remote   Hero  %target.id%
done
wait 1
detach  10108 %self.id%
~
#10109
<101 - PC enter to temnica when Kniese Sun~
0 h 100
~
if %actor.id% != %Hero.id%
   halt
end
wait 1s
if !%self.fighting%
   mecho - �������, ��� ���������%actor.g% ����, %actor.name%.
   if (%world.curobjs(10107)% < 10) && (%random.100% <= 25)
       mload obj 10107
       mecho - ���, ��� ��������� ��� �� ����, ������ ��.
       give  �����������.����� %actor.name%
   else
       mechoaround %actor% ������ ��� ��� ����� ����� %actor.dname%.
       msend       %actor% ������ ��� ��� ��� 1000 �����.
       %actor.gold(+1000)%
   end
   mpurge ������.���
end
detach 10109 %self.id%
~
#10110
<101 - PC enter to temnica when Merchant~
0 h 100
~
if %actor.id% != %Hero.id%
   halt
end
wait 1s
if !%self.fighting%
   mecho - �������, ��� ���������%actor.g% ����, %actor.name%.
   if (%world.curobjs(534)% < 10) && (%random.100% <= 25)
      mload obj 534
      mecho - � ����� �� �������, �� ����� ��� ����� ����� ��������.
      give ���� %actor.name%
   else
      mechoaround %actor% ��������� ����� ��� ����� ����� %actor.dname%.
      msend       %actor% ��������� ����� ��� ��� 1000 �����.
      %actor.gold(+1000)%
   end
   mpurge ���������.�����
end
detach 10110 %self.id%
~
#10120
<101 - Zone reset~
2 f 100
~
calcuid room 10131 room
attach  10106 %room.id%
calcuid room 10125 room
detach  10108 %room.id%
~
$~