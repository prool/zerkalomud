#189200
���� �� ��������~
0 j 100
~
context 1892
if (%actor.id%!=%quest1892.id%)
  halt
end
if (%object.vnum%!=189105)
  wait 3s
  � ��.. �� ������ �� ��, ��� � ������
  ���� %object.name%
  halt
else 
  wait 2s
  � ������ �� ��, ��� ����.
  � �������, � ������...
  %echo% ������� ������ �������� ��� � ����� � �����, � ������ ������ ���...
  %purge% ��������
  %echo% ����� ����� �� ��� ���� � ��������� �� �������� ������ ����...
  %echo% ������� �������� � ���������� ������ ����� � ����� �� �����.
  wait 10s
  %echo% ������� ������ �����, � ������������� ��������� �� ��������...
  � ����� �������� ��, �� ��������� ������...
  � %quest1892.name%! ������ �� ���� - ������ �� �����!
  � ����� ��� ���, � �� ���� ��������������.
  %load% obj 189209
  ���� ��� .%quest1892.name%
  � ����! 
  attach 189206 %self.id%
  detach  189205 %self.id%
  detach  189200 %self.id%
~
#189201
���� �� �����~
2 f 100
~
wdoor 189229 e purge
calcuid r189229 189229 room
detach 189202 %r189229.id%
calcuid m189201 189201 mob
detach 189206 %m189201.id%
detach 189205 %m189201.id%
attach 189204 %m189201.id%
attach 189203 %m189201.id%
context 1892
set quest1892 0
remote quest1892 %m189201.id%
~
#189202
���� �� �������~
2 c 0
������� ������� ��������~
if !%arg.contains(�������)%
  wsend %actor% ��� �� ������ �������? �����?
  halt
end
if %exist.mob(189200)%
  eval guard %world.mob(189200)%
  %teleport% %guard% 189229
  if %guard.realroom% == 189229
    wecho %guard.name% ������:'�� �� ���! ������ ��������� ��������� ��������???'
    wforce %guard% mkill %actor%
  end
end
wdoor 189229 e room 189235
detach 189202 %self.id%
~
#189203
������� ������������~
0 q 100
~
wait 2s
� ����������� ����, %actor.name%
wait 2s
� �� ����� ������ ����� ��� ������...
� ������%actor.g% ������, ��������� �� �����-�� ��������
� ������ �������, ���� ���� ������ �� ������ ��������.
� ���� � ����� ����...
����
� ���, ������� ���� ������ ����� ��������.
� ������� ��� ���, �� ������, � ������ ���������� ���� ������� ����, ��� � ����,
� �������, ��� �� ����, �� ���������� �����.
wait 1s
� �� ���, ����������� ������?
� ����, ��� �������, ������ ���������� ���� �����, �� ����, ������ ���� �������
wait 1s
� �����, �� �������.
~
#189204
������ ������~
0 d 1
�� �������� �������� �������� ������~
context 1892
if (%quest1892% == 0)
  wait 1s
  set quest1892 %actor%
  calcuid mage1891 189124 mob
  remote quest1892 %mage1891.id%
  remote quest1892 %self.id% 
  ����
  � �������, ��� �� �������%quest1892.g%, ���� ������� � �� �������.
  � �� ��� ��, ���, �� �� ������������ �����, � �� ���������...
  wait 1s
end
attach 189205 %self.id%
attach 189200 %self.id%
detach 189203 %self.id%
detach 189204 %self.id%
~
#189205
� �������� ��������~
0 r 100
~
wait 1s
context 1892
if (%actor.name%==%quest1892.name%)
  � �������� � ����, %actor.name% !
  � ��, ����� ��� ������...
  halt
else 
  � ������, %actor.name%, �� ��� � ������ %quest1892.vname% �� ��������%actor.g%?
  � ���� - � ������� ��� �����!
end
~
#189206
�������� ����� ��������~
0 c 1
������� ����� ����� �������� ��������~
context 1892
if !%arg.contains(��������)%
  %send% %actor% �� ���� �� ������ ��������� ���������?
  halt
end
calcuid o189209 189209 obj 
if (%quest1892.eq(16)%==%o189209%)
  � ���������� ����! ������ ��� ������, � ������������� �� ������ ���� ������� ���� ���-���...
  ���� .%quest1892.name%, ���, �� ���������, ���� ������ ������
  ���� .%quest1892.name%, �����, ���� ����� �� �������...
  � ������� ����, %quest1892.name%, � ������!
  calcuid r189229 189229 room
  attach 189202 %r189229.id%
  %purge% %self.name%
else
  ���� ���, �� ������ �������� ������ � ������ �� �����!!!
  %kill% .%actor.name%
end
~
#189207
������ �������~
0 f 100
*~
if (%world.curobjs(189204)% < 4) && (%random.10% <= 10)
  mload obj 189204
end
if (%world.curobjs(189205)% < 4) && (%random.10% <= 10)
  mload obj 189205
end
if (%world.curobjs(189206)% < 10) && (%random.10% <= 10)
  mload obj 189206
end
if (%world.curobjs(189207)% < 10) && (%random.10% <= 10)
  mload obj 189207
end
if (%world.curobjs(189208)% < 1) && (%random.10% <= 10)
  mload obj 189208
end
~
$~