#7400
����������� ���������~
0 r 100
~
wait 2
mecho �������� ������ ������ � ������������.
if %actor.sex% == 1
  say ����������, �����.
else 
  say ����������, ��������.
end
if %actor% == %questor74%
  halt
end
mecho _- ��� �� ����%actor.y% � ��� ������ �����.
mecho _- ������ ������ ������. �� ���� ������� ���� �� ������ ��� ������ �� �� �������.
wait 1
mecho ������ ����� � ���-�� ��������.
say ��, �� � � �� ������������. ������� � ���� ��� �����.
mecho _- � ������� ������ ���� ����� � ����� �������� ��� ������.. ���� �������� ���� ���������-���������� � � �� ��������.
mecho _- �������� ������� ���� ������ � �� ���� ������, ��� �� ���������. ���� � ������ ���� �� ����. �� ���� ����, � �����������.
mecho ������ ������.
if %questor74%
  halt
end
wait 2s
say �� ���� �� ������ ��� ������ ������� - ���� ��-������.
mecho _- ������ ����� �� ������ ��� � ����� ����, � � ������ �������. ����� ��� �� ����.
attach 7401 %self.id%
~
#7401
������ ������ ����������~
0 d 1
����� �������� �������� ������~
wait 1
if %actor.vnum% != -1
  halt
end
if %actor% == %questor74%
  say � �� ��� �������� ���� � ������. �� ������� ������ - ���� ����.
  halt
end
if %questor74%
  ��� .%actor.name%
  say ���� � ���� ���� ���������, �� � ��� �������� ��������� ������ ���, � �� � ����������.
  say ��� ��� ������ ����, � ������ - �� ���� �� ������.
  halt
end
set questor74 %actor%
global questor74
calcuid swampghost 7401 mob
remote questor74 %swampghost.id% 
����   
say ������, �� � �� ���������.
mecho _- �����-�� � ��� ����������� ���� ����� � ��� ����� ��� �����������.
mecho _- �� �������� � ���� ����� ������ � ������ �������.
mecho _- �� ����� ����� ����� ���� � ������� ��������� ������ ����.
mecho _- ���� � ���� ���� ��� �������� ������, � ��� ��� ��� �������������,
mecho _- �� �� ��������� ���� � ������ ���� �� ��� � ���� ����.
���
wait 1s
say ���������, ������ ������ ���� ����� �������� ���� ��� �����. 
mecho _- ������ � �� ���� ��������� ������ �� ������, ���� ��� ����� ������.
mecho _- ����� ��� ��� ����� � ���� ��� ������� ��������, � � �������.
mecho _- ����� �� ������� ����� ��� ����� �������, � ����� �� ������� ������ � ���� � ������.
mecho _- ��� �� ������� �� �������, �� ������ �������.
mecho _- ������ � ������ ����.
detach 7400 %self.id%
~
#7402
������� ���������~
0 j 100
~
wait 1
if %actor.vnum% != -1
  halt
end
if %object.vnum% != 7401
  ����
  say � ����� �� �� ��� ��� ��������%actor.g%, ���� �������?!
  drop %object.name%
  halt
end
wait 1
mpurge %object%
say �� ������� ����!
mecho _- � � �� �����, ��� � ����� ���� ��� �����.
: ���� ����� �� ���� � �������� �� �������, �� ������ ��� ���� �����.
wait 2
say ��� ����� ��� ������ � ����������� � ���� ����� ��� � ������� ��������.
mecho _- ��� ���� ������� ����� ��� ���� ��������� � ������ �� �����������. �������� ���� � ������� ����.
mecho _- �� ������ ��� �� ��� � �����, �� ��� ���� ������� ��� ����, � �� ����� ������������.
mecho _- �� � ������ �� ������, ���� �� ����������. 
mload obj 7402
give ������ .%actor.name%
wait 1s
if ((%world.curobjs(516)% < 1) && (%random.1000% <= 200))
  say ��, ��� ��� ���������� � ���� ���� ��������� - ����� ���� ����������.
  mload obj 516
  give ������ .%actor.name%
end
detach 7401 %self.id%
detach 7402 %self.id%
~
#7403
����� �����~
2 c 1
��������� ������ ��������~
wait 1
if !%arg.contains(����)% && !%arg.contains(������)%
  wsend %actor% _������ �� ������ � �� �����!
  wsend %actor% _��� ������ ��� ������?
  halt
end
set zastup %actor.eq(18)%
if %zastup.vnum% != 7402
  wsend %actor% �� ����������� ��������� ���� ����� �������.
  wsend %actor% ��� �� ������ ����� �����, ��� ��.
  halt
end
wait 1
wsend %actor% �� ��������� �������� ����� ��������.
wechoaround %actor% %actor.name% �����%actor.g% �������� ����� ��������.
wait 2s
wforce %actor% ���
eval %actor.move(10)%
wecho �������� ����� �������, ������� ��� ����-�� ������ �����.
wdoor 7433 d room 7490
detach 7403 %self.id%
~
#7404
������� ����~
1 c 4
�������~
wait 1
if !%arg.contains(�����)% && !%arg.contains(����)%
  osend %actor% _����� �� �� ���-�� ������ �� ���������!
  osend %actor% _� ���� �� ����� - ��� ������.
  halt
end
wait 1
set zastup %actor.eq(16)%
set zastupname %zastup.name%
set zastup %actor.eq(18)%
set zastupname2 %zastup.name%
if !%zastupname.contains(�����)% && !%zastupname2.contains(�����)%
  osend %actor% �� ��������� �������� ������ ���� ������.
  osend %actor% �������, ��������� ������� ��������� ������������.
  halt
end
osend %actor% �� ������� ������ ����� ����� �� ������� �����.
oechoaround %actor% %actor.name% ����� ������� ������ ����%actor.g% ����� � �����.
otransform 7415
~
#7405
����� �������~
0 f 100
~
foreach killer %self.pc%
  if %killer.id% == %questor74.id%
    mload obj 7400
    halt
  end
done
~
#7406
����� ���� 74~
2 f 100
~
calcuid island 7433 room
attach 7403 %island.id%
wdoor 7433 d purge
~
$~
