#42200
������� � ��������~
0 q 100
~
wait 3s
say _������� ���� �������!
if (%actor.level% =< 24)
mecho _�������� ����� ���������� � ���������� ���� ������������ ��� ����.
calcuid beregina 42207 mob
attach 42201 %beregina.id%
calcuid beregina 42207 mob
attach 42202 %beregina.id%
calcuid beregina 42207 mob
detach 42200 %beregina.id%
end
~
#42201
������ !���! � ��������~
0 d 0
���� ����� ������ ���� ���~
wait 2s
if %actor.level% <= 24 
mecho _�������� ��������� �����, ������ �������.....
DG_CAST '���������' %actor.name%
calcuid beregina 42207 mob
attach 42203 %beregina.id%
calcuid beregina 42207 mob
detach 42201 %beregina.id%
end
~
#42202
������ !�����! � ��������~
0 d 0
����� ������������ ��������������~
wait 2s
if %actor.level% <= 24 
mecho _�������� ��������� ��� �� ���������, ������� ��� ��.....
DG_CAST '��������������' %actor.name%
calcuid beregina 42207 mob
attach 42203 %beregina.id%
calcuid beregina 42207 mob
detach 42202 %beregina.id%
end
~
#42203
������ !�������! � ��������~
0 d 0
������������� ������� �����~
wait 2s
say _������� �� ����� ������! �� �� ��� �� �����...
�������
wait 2s
say _��� ������� �������� �� ����� ���������... � �� � ����� ���� �������� ��...
wait 2s
�������
say_����, ���� ���� ������ �������� - ���-�����...
say _�� �� ���� � ����������, �������� ���� ����� ��� ���������...
����
wait 2s
say_����� ��� ������, ������ �������� ��������.
calcuid beregina 42207 mob
attach 42204 %beregina.id%
calcuid beregina 42207 mob
detach 42203 %beregina.id%
~
#42204
������ !������! � ��������~
0 d 0
������ �����~
wait 2s
say _���������. �������...
if %actor.level% <= 14
say _������ ������ �� ������... 
mload obj 42202
���� ���� %actor.name%
end
wait 2s
say _� � ���� ������� �� ������ ���������.
calcuid beregina 42207 mob
attach 42205 %beregina.id%
calcuid polewik 42209 mob
attach 42207 %polewik.id%
����
���
mecho _�������� �������� ��� � ����������� � ������ ���.
calcuid beregina 42207 mob
detach 42204 %beregina.id%
end
~
#42205
������ !��������! � ��������~
0 d 0
�������� ������� ������ ���������~
wait 2s
mecho _�������� ������ ����������, �������� ��������... 
���
say _�� ���?
calcuid beregina 42207 mob
attach 42206 %beregina.id%
calcuid beregina 42207 mob
detach 42205 %beregina.id%
~
#42206
��� �������� �����~
0 j 100
~
wait 2s
if %object.vnum% == 42203 then
���
say  �������....! ��� ������ � �� ����� �������, �� ���� �������� ���� ������...
calcuid varik 42203 obj
mpurge %varik.name%
mload obj 42207
wait 2s
say _���� �� ��������...
��� ��� %actor.name%
end
~
#42207
������� � ��������~
0 q 100
~
wait 3s
if %exist.mob(42213)%
mecho _������ ������������� �������� �����.
say ��, �������, ������ ���-������ ������....
mecho _������ ��������� ��������.
say  �� ��������� ������ � ����! � ��� ����...
���
wait 2 s
����
wait 1s
say _������� ��������� �������! ���� �������� ������, ���� ���� � �������!
say  _��� ��� ������ �������, �����.
mecho _������� ����� �������� ������ �� ��� ���� �����.
calcuid homiak 42213 mob
attach 42208 %homiak.id%
end
~
#42208
����� �����~
0 f 100
~
calcuid polewik 42209 mob
attach 42209 %polewik.id%
calcuid polewik 42209 mob
detach 42207 %polewik.id%
~
#42209
������� � �������� ����� ���� ������~
0 q 100
~
wait 3s
mecho _������ ������ �������.
say_��� � ��������.... ��� � ������...
mecho _������ ��������� ��������.
wait 2 s
mload obj 42203
���� ���� %actor.name%
say _��� ���� �������, ��� ������. �� ��������, ���� ������ �������� ���� ����.
calcuid polewik 42209 mob
detach 42209 %polewik.id%
~
#42210
������� ������ �����-�����~
0 f 100
~
if (%world.curobjs(42219)% < 15) && (%random.8% == 1)
   mload obj 42219
end
~
#42211
������� �����~
0 f 100
~
if (%world.curobjs(42205)% < 15) && (%random.4% == 1)
   mload obj 42205
end
~
#42212
����� ������ ����~
0 f 100
~
if (%world.curobjs(42204)% < 15) && (%random.15% == 1)
   mload obj 42204
end
~
#42213
����� ������~
2 f 100
~
calcuid polewik 42209 mob
detach 42207 %polewik.id%
calcuid homiak 42213 mob
detach 42208 %homiak.id%
~
$~