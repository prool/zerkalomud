#66500
�������� ������������~
0 r 100
~
if %questor665.name% != %nil%
halt
end
wait 1s
� ���, ������� ���� � ���, ��� �� ������ ����� ��� ?
������ %actor.iname%
� �� ���� �� � ��� ���...
� ���� ����� ���� �� ��� ����, �� � �� � �������� ���-�� ���������...
� �� ����� ������� �� �����, ������ ������� �� ������ ����������...
wait 2s
���
wait 1s
say ������, ��� �� ������ � ��� � ����, ������ �������� �������.
� � �� ���� �� ����, ���� � ��� �����.
~
#66501
�������� ���� �������~
0 d 100
������~
if (%quest665.name% = %nil%)
set quest665 %actor%
global quest665
wait 1s
���
wait 1s
� �� ��� ���, ������� ��� ������ ������ ����������, ������ �� ���� �� �����.
� ������ ���, ������ ���. 
wait 2s 
���
� � ����, ��� ��� � ��� � ���� ������� ����, �� ���� � ���, � ����� ��� ������.
� ����� � ����, ����� ��� � ���������. 
wait 1s
calcuid for_mb 66500 mob
detach 66500 %for_mb.id%
detach 66501 %for_mb.id%
end
~
#66502
� ����������~
0 r 100
~
wait 1s
�����
� ����� �� ������ ���� ?
� ����� �� ���������� ���� �� ��� ?
���
wait 2s 
� � � �����������, ������ ���� �������� �� ���, ���� ������ � ��� �������.
� ������� �����, ��� �� � ������� �� ����� ?
wait 2s     
� �� ����, �� ����� ������ ������� ����...
���
� � �� �������, ��� ���� ��������? ���� ����� �� ���� ����!
� � ��� ��� �� ������, ��� ��������, ��� � ������.
wait 6
� ������� � ������ �����, �� ���� ���� ��� �� ������� �� �������
� ������� ��� ������ ���������, ��� ������ � �����.
� � ����� ��� � ���� ��� �� ���������.
� ���������, ��� � ����, ����� � ����� ����, �� � ������� �������.
wait 8
� � ��� ��� ����� ��������� �� ���� ������ � ���� ���� ������������
� �������, ��� ���-�� � ���� ������ �������-���������,
� ��� ��� �������� �� ��������� ������� ������� � ���.
���
wait 10
� ���� �������� �� ���������, ������� ������� �� ����������� � ���� ������ ����
� �� ������ ����� ��� ������ ���� �������� � ���� ������ ����� ���� �����. 
���
wait 10
� �� ��� �� ���� ������� ������ - � �� ����, ����� ��������� �� �������.
� ������� ����� �������, ��� ��������� ����� ��������... �� ��� ���� �����.
~
#66503
��������� ���� �����~
0 j 100
~
if (%object.iname% == ��������� ������)
wait 1s
� �� ��� �� ��� ����.
����
wait 2s
� ���...���� ����� ������� �������.
�����
mpurge ������
mload obj 66501
���� ����� %actor.name%
calcuid delete_trig 66501 mob
detach 66503 %delete_trig.id% 
detach 66502 %delete_trig.id%
end
end
~
#66504
�������� ��������� �������~
0 j 100
~
if (%actor.name% == %quest665.name%)
if %object.vnum% != 66501
wait 1
drop %object.name%
halt
end
wait 1
mpurge %object%
� �� ���� ������������ � �����������.
� ������� ���� %actor.iname%, ������ ������ ��� ����� ����� ��� ����.
wait 1s
� �� � ��� ���� �� �������, ��� ������...
� ��� �� ���� ������������� ?
��� 
wait 1s
� ��� ������, � ���� ���� ����� ������ �� ������� �����.
� ������ ������ �������, �� ��� ������ �� ������ ��� ����.
� � ������ ������ ����, �� ������.
wait 1s
mload obj 66502
mload obj 66502
mload obj 66502
mload obj 66503
���� ����� %actor.name%
���� ����� %actor.name%
���� ����� %actor.name%
���� ����� %actor.name%
end
~
#66505
������ ������ ����~
0 j 100
~
if %object.name% == ����� ������  
 wait 10
 mpurge %object.name%
 � ��, ����� �� ��� ���������, � � �� ���������� ����� ��� ���� ��� ������!
 switch %random.5%
   case 1
     mecho _������ ���� ����� ������ � ����� ���-�� ���������� �� ����.
     if %world.curobjs(66504)% < 5
       mload obj 66504
       ���� ��������� %actor.iname%
       � ���, �����. ���� ��� ����������!
     else
       � �� �� �����.
       ���
       halt
     end 
  break
  case 2
    mecho _������ ���� ����� ������ � ����� ���-�� ���������� �� ����.
     if %world.curobjs(66505)% < 5
    mload obj 66505
    ���� ��� %actor.iname%
    � ���, �����. ���� ��� ����������!
     else
       � �� �� �����.
       ���
       halt
     end 
  break
  case 3
    mecho _������ ���� ����� ������ � ����� ���-�� ���������� �� ����.
     if %world.curobjs(66506)% < 5
    mload obj 66506
    ���� ���� %actor.iname%
    � ���, �����. ���� ��� ����������!
     else
       � �� �� �����.
       ���
       halt
     end 
  break
  default 
    mecho _������ ���� ����� ������ � ����� ���-�� ���������� �� ����.
    wait 1s
    � �� �� �����.
    ���
    halt
  break 
done
else
 � �� ��� ��� ���?
wait 2
 ���� ���
end
~
#66506
�����~
2 f 100
~
set quest665 %nil%
global quest665
calcuid delete_trig 66500 mob
attach 66500 %delete_trig.id% 
attach 66501 %delete_trig.id%
attach 66504 %delete_trig.id%
calcuid delete_trig 66501 mob
attach 66502 %delete_trig.id%
attach 66503 %delete_trig.id%
calcuid delete_trig 66502 mob
attach 66505 %delete_trig.id%
~
#66507
���� ������� ������~
0 j 100
~
wait 1
if %self.fighting%
 halt
end       
If (%object.vnum%==711) && (%object.val1%==7)
   Say ��! ������! � ��� ����� ��� ������!
   ���� ��������� ������ � ����� �� ����� � �������� ����� �������� �� �� �����.    
   ��� � ��������! � �������! � ������ �����!
else
   Say ��� ��� �� �����! �� ����������� ���� ����!
   kill %actor.name%
   halt
End
mecho ������� ������� �������������, � �� ������ ��������� �������.
mpurge ������
wait 10
if %self.fighting%
 halt
end
����
wait 10
if %self.fighting%
 halt
end
say �� ���� ��������� � ��� �����������!  
wait 1
switch %random.5%
  case 1
    mecho _������� ����� ���-�� �� �������� ����.
    mload obj 533
    ���� ���� %actor.iname%
    � ���, �����. ���� ��� ����������!
  break
  case 2
    mecho _������� ����� ���-�� �� �������� ����.
    mload obj 240
    ���� ��� %actor.iname%
    � ���, �����. ���� ��� ����������!
  break
  case 3
    mecho _������� ���-�� ����� �� �������� ����.
    mload obj 66507
    ���� ����� %actor.iname%
    � ���, �����. ���� ��� ����������! 
    � ����� �� ���������� ���� � ���, ��� ��� ����� ��������� �� �����!
  break
  default 
    mecho _������� ���-�� ����� �� �������� ����.
    wait 1s
    mload obj 66503
    ���� ����� %actor.iname%
    ���         
  break 
done     
wait 5
if %self.fighting%
 halt
end     
� � ������ ��������! ��� ���� ����..
mpurge �������
~
$~