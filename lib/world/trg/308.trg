#30800
����� ������������~
0 r 100
~
mecho _���������� ����� �������� ������� � ������.
wait 1s
� ���� ������, ��������� ���� ������ ����,
� ������ � ���� ��������� �� ���� �����?
wait 1s
mecho _� ������ ������ ��������� ��� ������.
wait 1s
� ���� ������, �� ����� ��� ������ �����...
wait 2s
� ��� ��� ������ ��� ������� � ��� � ������ �� ���� ������.
� �� ��� ����, ���������� �� �������� ����� ��������,
� �������� �� ��� ���, ������ � ������ �������...
wait 1s
� ���� �� �� ��� �����, ������� � ������� ���� ������,
�  �� �������� ������ �� �����.
wait 1s
� ��� ��� �������� �� �������� ������, � ������� �� �������� ������.
� � � ��� � ���� ������ � ����� �����. � ������ ������...
~
#30801
������ ���� �����~
0 j 100
~
if (%object.vnum% == 30807)
  wait 1s
  ����� �� ������%actor.g% ���, �������!
  wait 1s
  mecho _���������� ����� �������� ������� �� ������ � ����������� � ����.
  %purge% %object%
  wait 1s
  ����� ��� ������ ���� ����� ����� �������� ��� ����� ������ ���� ������.
  if (%world.curobjs(30808)% < 4) &&  (%random.4% == 2) 
    mecho _���������� ����� �������� �� ����� � ����� � ��������: "����-�������".
    wait 1s
    ����� �� ���, ������, ��� �� �� � ����, � ����, ����� ����, � ����������.
    mload obj 30808
    ���� ����� .%actor.name%
  end
  wait 1s
  ����� � ������, ��� � � ������, ����� ���� �����.
  wait 1s
  mecho _���������� ����� ������ ���������� ����.
  wait 1s
  mecho _�������� ����� �������� � �������.
  mecho _�������� ����� �������� � �������.
  mecho _�������� ����� �������� � �������.
  mload mob 30813
  mload mob 30813
  mload mob 30813
  wait 2s
  ����� �� ����, ��������... ���� ��� �������� ������.
  wait 1s
  mecho _���������� ����� ������ ���������� ����.
  wait 1s
  while (%exist.mob(30813)%)
    calcuid belka 30813 mob
    %purge% %belka%
  done
  mecho  ����� ����� �����������, ���� �� ������������ � ��������� �������.
  wait 1s
  mecho _���������� ����� �������� ����� � ������ �� ������.
  wait 1s
  ����� �� ���, � ������ ������...
  mload obj 30809
  ���� ������ .%actor.name%
  mecho _���������� ����� ������ ���������� ����.
  wait 1s
  calcuid berlom 30812 room
  attach 30805 %berlom.id%
  exec 30805 %berlom.id%
  calcuid leshiy 30701 mob
  detach 30723 %leshiy.id%
  detach 30801 %self.id% 
end
~
#30802
����� ���� ������~
0 f 100
~
calcuid leshiy2 30800 mob
detach 30800 %leshiy2.id%
mecho _������ ���� ������ ����������, ������������� � ������ �����.
mload obj 30807
~
#30803
����� ����~
2 f 100
~
calcuid leshiy2 30800 mob
detach 30800 %leshiy2.id%
detach 30801 %leshiy2.id%
attach 30800 %leshiy2.id%
attach 30801 %leshiy2.id%
calcuid berlom 30812 room
detach 30805 %berlom.id%  
if %exist.mob(30813)%
  calcuid belka 30813 mob
  detach 30813 %belka.id%
end
~
#30804
����� � ������ � ���� ������~
0 q 100
~
mecho _���� ������ ������ ��������� � ���� �������.
����� �� ������ ����� ����, �� ��� ���� ������ ���!
mkill %actor%
~
#30805
������� �����~
2 z 100
~
wportal 30704 2
~
#30806
����� �������� �����~
0 f 100
~
if (%world.curobjs(30804)% < 5) &&  (%random.3% == 1)
  mload obj 30804
end
~
#30807
����� ����������� �����~
0 f 100
~
if (%world.curobjs(30802)% < 10) &&  (%random.3% == 1)
  mload obj 30802
end
~
#30808
����� ������������ �����~
0 f 100
~
if (%world.curobjs(30800)% < 5) &&  (%random.3% == 1)
  mload obj 30800
end
~
#30809
����� ����������� �����~
0 f 100
~
if (%world.curobjs(30803)% < 5) &&  (%random.3% == 1)
  mload obj 30803
end
~
#30810
����� ���������� �����~
0 f 100
~
if (%world.curobjs(30801)% < 20) &&  (%random.3% == 1)
  mload obj 30801
end
~
#30811
����� ������� �����~
0 f 100
~
if (%world.curobjs(30805)% < 4) &&  (%random.3% == 1)
  mload obj 30805
end
~
#30812
����� ������~
0 f 100
~
if (%world.curobjs(30806)% < 3) &&  (%random.3% == 1)
  mload obj 30806
end
~
#30813
������� ����� �� �������~
0 z 100
~
mpurge %self%
~
#30814
������� � ������~
2 c 0
����� �������~
if !(%arg.contains(������)%) 
  wsend       %actor% ���� ��� �� ������ ��������???
  return 0
  halt
end
wsend       %actor% �������� �� ����� ����, �� ������� � ������ ������.
wechoaround %actor% _%actor.name% �����%actor.q% � ������ ������, �������� �� ����� ����.
wait 1s
wsend %actor% - �� ��������� �� ��� �������� ������.
wteleport %actor.name% 30891
wat 30891 wechoaround %actor% ���-�� ����� � ������.
~
#30815
������� �� ������~
2 c 0
����� �������~
if !(%arg.contains(�����)%) 
  wsend       %actor% ���� ��� �� ������ ��������???
  return 0
  halt
end
wsend       %actor% _��������� �������� �� ����� ����, �� ������� �����.
wechoaround %actor% _%actor.name% �����%actor.q% �����, ��������� �������� �� ����� ����.
wait 1s
wsend %actor% - �� ��������� �� �������� ������� �����.
wteleport %actor.name% 30834
wat 30834 wechoaround %actor% ���-�� ����� �� �������� ������.
~
#30816
������� ���� �����~
1 j 100
~
osend       %actor% _���� ����� �� ����� ������ ��������� ��� ���������.
oechoaround %actor% _���� ����� �� ������ %actor.rname% ��������� ��� ���������.
~
#30817
���� ������ � 307 ����?~
2 b 100
~
eval test 1
global test
calcuid resetroom 30809 room
remote test %resetroom.id% 
rdelete test %self.id%
detach 30817 %self.id%
~
$~
