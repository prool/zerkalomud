#66800
�������� �����~
2 c 0
�������� ������ �������~
wait 1s
wsend %actor% ������� � �����, �� � ����� ������� � ��� ����������� ������.
wechoaround %actor% ������� � �����, %actor.iname% ������%actor.g% � ��� ������. 
wait 1s
wat 66801 wecho �� ����-�� ������� ������� �������.
wat 66802 wecho �� ����-�� ������� ������� �������.
wait 1s
wat 66801 wecho � ������� ������� ������ �������� ������������.
wat 66802 wecho � ������� ������� ������ �������� ������������.
wdoor 66801 east room 66802
wdoor 66802 west room 66801  
calcuid delete_item 66801 room
detach 66800 %delete_item.id% 
~
#66801
�������������_���~
0 r 100
~
wait 1s
msend %actor% ������������� ������� ������� � �������� �� ���!
mechoaround %actor% ������������� ������� ������� � �������� �� %actor.vname%!
mkill %actor%
~
#66802
��������_���~
0 r 100
~
wait 1s
� �! ��� ���� ���������.
� �� ������ ������?
� ��� ����, ��� �� ��� �� ��������!
� �� �������. �� �� ����%actor.w% � �� �������%actor.w%!
wait 1s
msend %actor.name% �������� ���� ���� �������� �� ���!
msendaround %actor.name% �������� ���� ���� �������� �� %actor.vname% ! 
���� %actor.name%
~
#66803
����������� ���� �����_1~
0 r 100
~
if (%quest668.name% = nil)
  wait 1s
  ���   
  � �� �� �����%actor.g% �� ���������.
  ���
  wait 1s
  � ������ ���, ����� �� ���� ����������. 
  � ��� �� ��� ����� ��������, ������ �� �������!
  � � �� � �� ���������� �� ��������������! 
  � �� ��� ���, ��������?
end
~
#66804
����������� ���� �����_2~
0 d 0
��~
if (%quest668.name% = nil)
  wait 1s
  set quest668 %actor%
  worlds quest668
  � ��� ��� ������.
  � ���� ��������� ����� ������. ��� ������ ���� ����� �����������.
  � � ������ �������� � ���, ������ ��� �� ��� �������� ��, ���� ������.
  � �� ��� ������� ������� ���. ��� ���-�� ������� � �������!
  � ����� ���� ����������� ��� �����. � ��� �������, ��� ������������������ �� ����� ������� � ��������.
  � ���������� ��������� ������ ����� �� ���� � ����� ���, ��� ���������� �� �����.
  � ������ ��� � ��� �������!
  � � ������ �� ������%actor.g% ����� � ������ ������%actor.g% ������ ��� � ����!
  ��� ������ ��������
  wait 1s
  � ����� ��������� ���������� ����� �������� �����... ��� �� ������ � ��� � �������.
  � ���� ��� � �����, ������� ����� ��� ������ ���������� � ����� ������!
  �  � �������������� ����, ��� �� �����, �� ������ �������� ��� ������.
  wait 1s
  � �� ��� � ���, ��� � ����� ���� �������.
  � ��. ��� ��.
  calcuid delete_item 66800 mob
  detach 66803 %delete_item.id% 
  detach 66804 %delete_item.id%
  �����
~
#66805
����������� ��������� �����~
0 j 100
~
wait 1
if (%actor% != %quest668%)
  � � �� ��� ����� %actor.name%? � ���� �� ����... � ������ �� �� ���� ������� �� ��������!
  halt
end
if (%actor% == %quest668%)
  if (%object.vnum% == 66802)
    wait 1
    mpurge %object%
    wait 1s
    � ��, ������� ����!
    � �����%actor.q% �� ���, ����� �����.
    � � ������ ������, ��� ���������� ��� ����� ������� �������� ���� � �������.
    wait 1s 
    � ��� ���� ��������������.
    set pray668 %random.6%
    if (%pray668% == 1) && (%world.curobjs(66800)% < 3)
      mload obj 66800
      � ���� ����� ��� ������� ��� ����...
      � ����� �� ������ �� ����������� ����.
      ���� ����� %actor.name%
    end
    if (%pray668% == 2) && (%world.curobjs(66827)% < 3)
      mload obj 66827
      � ��� ������� ��� ��������� �� ���� �������...
      � � ������ ��� ����!
      ���� ������� %actor.name%
    end
    if (%pray668% == 3) && (%world.curobjs(66828)% < 3) 
      mload obj 66828
      � ���, ���� ���� ��� �������  ��� ��� �������� �����!
      � ��... � ����� � ������. �� �����.
      � ��� �� �� �� ����, �� ����.
      ���� ����� %actor.name%
    end
    if (%pray668% == 4) && (%world.curobjs(66829)% < 3)
      mload obj 66829
      � ���, ���� ���� ��� �������  ��� ���� �� ���������� �������!
      � ���� ���� �� ��� ������ ���, ��� ������� � ����.
      ���� ������� %actor.name%
    end
    if (%pray668% > 4) 
      mload obj 66825
      � ���, �����.
      ���� ������� .%actor.name%
      � ��� ���� ���, ��� � ���� ����������.
    end
    wait 1s
    ����   
  end
end
~
#66806
������� �����~
0 f 100
~
� ��� �� ���!
� � �� ������ ������� �� ���� ������-�� ����������!
� ������!
mload obj 66802
~
#66807
�����~
2 f 100
~
calcuid repop_1 66800 mob
attach 66803 %repop_1.id% 
attach 66804 %repop_1.id%
wdoor 66801 east purge room 66802
wdoor 66802 west purge room 66801
calcuid delete_item 66801 room
attach 66800 %delete_item.id% 
set quest668 nil
worlds quest668
~
#66808
����� ��������~
0 f 100
*~
if (%world.curobjs(66804)% < 6) && (%random.100% <= 5)
  mload obj 66804
end
if (%world.curobjs(66805)% < 6) && (%random.100% <= 5)
  mload obj 66805
end
if (%world.curobjs(66806)% < 6) && (%random.100% <= 5)
  mload obj 66806
end
if (%world.curobjs(66807)% < 6) && (%random.100% <= 5)
  mload obj 66807
end
if (%world.curobjs(66808)% < 6) && (%random.100% <= 5)
  mload obj 66808
end
~
#66809
����� �������~
0 f 100
*~
if (%world.curobjs(66809)% < 6) && (%random.100% <= 5)
  mload obj 66809
end
if (%world.curobjs(66810)% < 6) && (%random.100% <= 5)
  mload obj 66810
end
if (%world.curobjs(66811)% < 6) && (%random.100% <= 5)
  mload obj 66811
end
~
$~
