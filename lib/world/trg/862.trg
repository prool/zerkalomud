#86200
����� ������~
0 f 100
*~
mload obj 86123
if (%world.curobjs(1203)% < 1) && (%random.100% <= 3)
   mload obj 1203
end
~
#86201
��������� ���� �����~
0 k 75
~
if %random.3% == 1
set target %random.pc%
dg_cast '����' .%target.name%
end
~
#86202
������� ��������� ����~
0 k 70
~
if ((%random.3% == 1) && (%world.curmobs(86210)% < 4))
  mecho ��������� ������� ������� �� ������ ���� ����� 
  mecho - � ���������� ����� ��� ������ ��� � �����!
  mload mob 86210
  mforce ���.���� kill %random.pc%
end
~
#86203
����� ��� �����~
0 f 50
~
if (%world.curobjs(86207)% < 41)
mload obj 86207
mecho ����� ��� ����� ���������� �����, ��� ������� ������� � ��������!
mecho ���� ����� �����������...
end
~
#86204
����� ��������� �������~
0 f 100
~
if %world.curobjs(1268)% < 1
if %random.100% < 3
mload obj 1268
end
end
mload obj 86124
~
#86205
� ��� � ��������~
0 k 15
~
wait 1
foreach victim %self.char%
emot �������� ������ ���� ������� � ������� �� ���, ���� ������� � ������!
if (%random.100% < 60 )
dg_cast '�����' %vicitm.name%
end
done
if (%random.100% < 3 )
detach 86205 %self.id%
end
~
#86206
����� ������ ���������~
0 f 100
~
if ((%random.100% < 25) && (%world.curobjs(555)% < 1 )) 
mload obj 555
*if ((%random.100% < 25) && (%world.curobjs(487)% <1 )) 
*mload obj 487
end 
~
#86208
��������� �����~
2 c 1
���������~
wait 1
if !%arg.contains(�����)%
%send% %actor% ��� �� ������ ���������?
halt
end
%send% %actor% �� ������ ������� �����.
%echoaround% %actor.name% �����%actor.g% ������� �����.
%echo% ���������� ���� ������� - ������ ������ ����� �������.
wdoor 86265 east purge
wdoor 86265 east room 86133
wdoor 86265 east name ������
wdoor 86265 east description ������
wdoor 86265 east flags ab
detach 86208 %self.id%
~
#86209
����� ���� 862~
2 f 100
~
detach 86208 %self.id%
attach 86208 %self.id%
wdoor 86265 east purge
wdoor 86265 east room 86133
wdoor 86265 east name ������
wdoor 86265 east description ������
wdoor 86265 east flags abcd
~
$~