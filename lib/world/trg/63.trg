#6300
����� � ������~
0 r 100
~
wait 4
����� %actor.name%
say � �������� ��� � � �������� ����� �������� ����������� ���!
wait 1
���
say ��� ����������� ���������� ����� ����� ������ �������������� ������ ���.
say ���-�� ������� ����� ������ ���� ������ ������ ������������ ������������ ������.
wait 3
���
say ������� �� �� �������� ���? 
���� %actor.name%
end
~
#6301
������ �����~
0 d 100
�����~
wait 2
say � ����, ��� �� ����������� ������.
if (%actor.sex% == 1)
  say �� ���� ���������, ��������� ������� ������� ���� ����������
else
  say �� ���� ���������, ��������� ������� ������� ���� ����������
end
say ��� ������� ����� �������� ������������ ������, �� ��� ��� ����� ����� - ����!
say ������ �� �������� �� ��� ����!
wait 4
say ������ ��� ������������ � �������������, ���� �������� ��������� � �������
say ������������ ����� ������� ��������� ��������. ������ ��� ��������� ��� ����!
wait 5
say ���� ������ �� ���� �� ����� ����, ���� �� �� ������� �� ����� ���������.
say ������ ���� ������ ��� �� ���������� ��� �������� ����� ��������.
say ���������� ��������� ��������� �� ����� ���!
attach 6302 %self.id%
detach 6300 %self.id%
detach 6301 %self.id%
end
~
#6302
������ ���������~
0 j 100
~
wait 1
if (%object.vnum% == 6310)    
  wait 1 
  %purge% %object%
  say � ����� � ����!
  ��� %actor.name%
  wait 1
  say ���, ����� �� ����� ����... ��� �������, �� ��� �� ������� ������.
  if (%random.1000% <= 75)
    mload obj 1716
    ���� ��������� .%actor.name%
  else
    msend %actor% ����� ����� ��� ��������� ����� ���.
    %actor.gold(+150)%
  end
end
detach 6302 %self.id%
~
#6303
����� ������������~
0 f 100
~
if %world.curobjs(6310)% < 1
  mload obj 6310
end
if %random.100% <= 75
  if %world.curobjs(592)% < 1
    mload obj 592
  end
end
~
#6304
����� �����~
0 f 100
~
if (%world.curobjs(6309)% < 12) && (%random.100% <= 15)
  mload obj 6309
  mecho �����, �������� �������� ����, ������������ � �������.
  mecho � �� ��� �����, ��� ��� ������ ��� ������, ��������� ��������� ������.
end
~
#6305
����� ������~
0 f 100
~
if (%world.curobjs(6306)% < 10) && (%random.100% <= 15)
  mload obj 6306
  mecho ������ ������ �����, ������ ��� ������� � �� ����
  mecho � �� ��� ����� ���-�� ��������� ������� ���������.
end
~
#6306
����� ��������~
0 f 100
*~
return 0
mecho �������� ������� � ������������� �������.
if (%world.curobjs(6307)% < 12) && (%random.100% <= 20)
  mload obj 6307
  set load 1
end
if ( %world.curobjs(6308)% < 4 ) && ( %random.100% <= 8 )
  mload obj 6308
  set load 1
end
if (%load% == 1)
  mecho � �� ��� ����� ������� ������ �����-�� �������.
end
~
#6307
����� ������~
0 f 100
~
if (%world.curobjs(6303)% < 12) && (%random.10% <= 2)
  mload obj 6303
end
~
$~
