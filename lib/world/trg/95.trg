#9500
����� � �������~
0 q 100
~
wait 1s
say �������! ������, ������, ����� �������� ���.
say ���� � ���� ������������. ������ � �������, ������� ��� �������, ������������!
say ���� ������� � ����, �������, ����������, ��������-�������� � �����������!
say � �� ����, ���������� �� ��� ����� ����, ���� �� �����, � ������� �������� - �����������!
say �� � ������� ���� �����, �������!
say ������ �������! ����� �����, �?
�����
~
#9501
����� ������� �������~
0 j 100
~
wait 1
if %object.vnum% == 9502
  wait 1s
  say �� ������� ��������, %actor.name%! ���� �������, �������, ����� ��������! 
  �� ������� �����, ���� ����� ��������, ������� � � ��������� ����� ������ 
  %purge% %object%
  wait 1s
  say �� ��� ����! ��� �������, ����� �����!
  mecho ������ ������� � ����� � ������ ������ �����-�� �������
  mload obj 9506
  say ��� ������ � ������� ��� ������, ������ ������ � ������� ������ ���.
  ��� �����.���� %actor.name%
  if %random.1000% <= 200
    � �� ������ ����, ������ �����������. � ���� � ������ ��� �����-�� ����.
    � �����, ��� ��� �� ����� ������, ������� � �� ������...
    %load% obj 527
    ���� ���� %actor.name%
  end
  detach 9500 %self.id%
  detach 9501 %self.id%
else
  say ����� ��� ���? 
  ���� ���
end
~
#9502
������ ������� ��������~
0 f 100
~
%load% obj 9501
if (%random.10% < 3) && (%world.curobjs(9504)% < %world.maxobj(9504)%)
  mload obj 9504
  if (%random.10% > 8) && (%world.curobjs(9505)% < %world.maxobj(9505)%)
    mload obj 9505
  end
end
~
$~