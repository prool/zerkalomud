#68600
��������~
0 r 100
~
if %time.hour% > 8 && %time.hour% < 20
  mecho %self.iname% ��������� ������� ������ �����, �� ����� ������� �������� �������. 
  wait 1s
  say ������� ��� ������, ���� �� ������ ������?
else
  mecho �������� ������ ��������� � ����.
  wait 1s
  say ����� ������ �� �������!
end
~
#68601
������� ����~
0 q 100
~
wait 5s
mecho ������� ���� ���-�� ���������� � �����...
~
#68602
������ �  �������~
0 r 100
~
mecho ������� ���������� �� ���.
wait 2s
say ���� ������ � ��� ���: ������� ���� ���������� ������� ������ �� �������,
say ������ ������� �������� ������ ���, �� �� � ���� ��� �� ����������.
say ���� �� �������� ���, ���� �� ����������� ���� ���, ��� ��� ����� ���
say ����� �������� � ��� �������� � ����� �������.
say � ������ ������ ����������� � ���������.
wait 1s
mecho �������, ������� �����, ������������ � ��� ������� � ����������.
wait 1s
say ���� � ����, ��� �� ������, ���� �����. �������� �� ���� ������ -
say �� ������ ��������� ������������ ������ � ��� ���, � ��, ��� ���� -
say �� ���������. ������ ��� ���� ������ ������ ���.
if %actor.sex% == 1
  say �������� �� �� ����������� � ��� ������� �����������?
else
  say �������� �� �� ����������� � ��� ������� �����������?
end
attach 68608 %self.id%
detach 68602 %self.id%
~
#68603
��������� ���� ������~
0 m 100
~
if %time.hour% < 9 || %time.hour% > 19
  halt
end
if %amount% < 50 then
  say ����� ����� �� ����� , ����������!
  halt
end
if %amount% >= 100 then
  say ���� ������� ���� �� ���������!
  mecho ����� ������� �����.
  mdoor 68609 north purge
  mdoor 68609 north room 68646
  wait 10s
  mecho ����� ������ ������.
  mdoor 68609 north purge
  mdoor 68609 north room 68646 flags abdc
end
~
#68604
�������� ����� �������~
0 j 100
~
wait 1
if (%object.vnum% == 68702)
  wait 1
  mpurge %object%
  wait 2s
  say ������ ������ �� �������,������ !
  wait 1s
  mecho _������� ��������� �������� ����� ���� � ����� �������...
  wait 2s
  mecho _������� ���� �������� ����� ��������� � �������, ��� �� � ��� �� ������.
  wait 2s 
  say ������� ���� �� ������.
  if (%world.curobjs(68612)% < 3) && (%random.10% == 1)
    mecho _���� �������� ������� ��������� ������ ����� ��������� � ��������� ���.
    mload obj 68612
    ���� ����� %actor.name%    
  else
    %actor.exp(+200000)%
  end
end
~
#68605
�������~
0 q 100
~
wait 2s
mecho ������� ������ ������ � ���������� ���.
wait 1s
say ��������� ������, ���-�� �� �� ��� � ���� ������ � �����, ���� ��� �������
say ������ � ����� � ���� ����, �� ���� � ���� � ���� ���� �������.
wait 1s
mecho ������� ������� ��������.
wait 1s
say ��� �� ��� �������� ������, � ����� ������� �������� � ������� ��
say �������� �������� ���� ���������� ���. �������� ����� ��������
say ���, �� �������� �� ���� ����� ���������� ������ ������ ��� ��� ������, ����� ��
say ��� ����������! ������� ��� ��������� ������ ������, � ������� � ���������
say ������. ����� ������� ������, �� �� ��� � �� ������ �� ���������.
say ����� ������, ������ � ��� ������ � ������ ��� �� �������, ����������� ����
say �� ������! 
wait 10s
detach 68605 %self.id%
r '��������� ������, ���-�� �� �� ��� � ���� ������ � �����, ���� ��� �������' '����������, ������. ���� ������ �� � �����, ���� ��� �������'
~
#68606
������  ������  ������~
0 f 100
~
if %world.curobjs(68611)% < 1
  mload obj 68611
end
~
#68607
����� ������ ��������~
2 f 100
~
calcuid demid 68613 mob
detach 68605 %demid.id%
attach 68605 %demid.id%
~
#68608
������� �����~
0 d 1
�� ������ �������� ����������~
wait 1s
say ��� � ������ � �����!
wait 1s
mecho �� ������� ���������� ������� ������������ B��.    
wait 5t
attach 68602 %self.id%
detach 68608 %self.id%  
~
#68609
��������� ������~
0 r 100
~
wait 2s
mecho ��������� ���������� ������ ������� ������ ����� � �������.
wait 15s
halt
~
#68610
������� ����~
0 r 100
~
wait 2s
mecho ������� ������ �����������.
wait 10s
halt
~
#68611
� ������� ����������� ��������� ����.~
2 e 100
~
wait 1s
%echo%  � ������� �������� ���-�� ������...
~
#68612
������~
0 r 100
~
mecho �������� ���������� �������� � ������������ ��������� �� ���.
wait 1s
say �������.....��������� �������� ����������� ��������� � ���� ����.
say �� �������� ���� �� ��� ��� ����� ������ ���������� ������ �����?
say ������ ��� ���� ���� ������������, ���� ����������, ��  �������  ����� 
say ������  �����,  �  ���  �����  �� ����������� �� ����.
wait 1s
mecho ������ ����������� ����� ������� ���� ������
wait 1s
say ���� �������, ����� �� ����� ������ �� ������, ��� � �������� ����,
say � �������� ������!
wait 1s
mecho ������ �������� ����� � ������ ����
wait 1s
say � ���� ��� ������!
say ��� � ��� �� ���� �� ��������, �� ���� �����, ��� ����������� ��,
say ����� ���������� ����. � ���� ����� ������ ��� �� ����� ���� �
say ����� ��� �� ����� ������....��� �����, �����-���� ����� ��
say ��� ��� ������ � �� ����������, �? ����, ����� ���� ����� ������
say �������, ��� �� ��� ��������!
wait 30s
halt
~
$~
