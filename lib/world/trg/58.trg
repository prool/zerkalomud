#5800
����������������������~
2 e 100
~
if %direction% == west && %world.curmobs(5801)%==1
wait 1
wsend %actor.name% ������ �������� ��������� �� ���.
wsend %actor.name%  ������� �������� ������: ��, �������, ���� ��������?
wsend %actor.name%  ������� �������� ������: � �����, ������ �����?
wsend %actor.name%  ������� ������ ��� �� ���� ������, ����� ������� ��������� � ��� �����.
wsend %actor.name%  ������� �������� ������: �� ��� ������ ��������, �� ���������� �������.
wsend %actor.name%  ������� �������� ������: ��� ��� ������ �������, �������� ��� ����� ��� ��.
wsend %actor.name%  ������� �������� ������������.
wsend %actor.name%  ������� �������� ������: ����� 2000 ���, ����� � ���������!
end
~
#5801
������������������~
0 m 1
~
if %amount% > 1999
wait 1
tell %actor.name% �� ��, � ���� ����� ������ ����.
tell %actor.name% �����, �������, �� ���������.
����� �����
����� �����
wait 5 s
���� �����
����� �����
else
wait 1
msend %actor.name% ���� ��� ���� ������, ���������� ���� �� �����������.
���� %amount% ��� %actor.name%
end
~
#5802
�������������~
0 r 100
~
wait 1
tell %actor.name% ������ ������!
msend %actor% ������ ������� ������� ������������ �������.
msend %actor% ���-�� ����� � ��������� � ������� ���� �����. ��� ���
msend %actor% � ������ ���� ����� ������ �� ���� ���� � ������ �
msend %actor% ���������� �� ������ �������.
msend %actor% � ������ �� ����, �� �������� ���-�� ����� ����� ��������
msend %actor% ��������, ��� ��� ���� ���������. � ������ �������� ��
msend %actor% ����� � ���.
~
#5803
���������������~
1 j 100
~
if %object.vnum% == 5801
wait 1
mecho ����� ������ ��������� ���� ������ ������� � ���� �� ����� ����.
mecho ��� ���� �� ��������� ����� ��� ���.
mecho �� ��� ��� ��� ���������!
mecho �� ����� ������ ���������� ������, ����� ����� ��������,
mecho ��������� � ����. ����� ����� �������� ������ � ������ ���� ��� ����.
mecho ��� ��� ������.
mpurge %object.name%
mpurge %self.name%
end
~
#5804
���������������~
0 j 100
~
if %object.vnum% == 5803
wait 1
mecho �������, ������ ������.
mecho �� � ������ ��� �������.
���
mpurge %object.name%
mload mob 5805
mpurge %self.name%
end
~
#5805
�������������~
0 f 100
~
mload obj 5802
~
#5806
����������~
2 c 100
�����~
if %cmd%==�����
wait 1
wechoaround %actor% %actor.name% ������ ����� ����� �� �����.
wsend %actor% �� � ������ �������� ����� �����.
wteleport %actor% 5824
wat 5824 wechoaround %actor% %actor.name% �������� ����������� �� �����.
wsend %actor.name% �� ������� �� ����, ������ �� ���� � ���������� �� �����.
end
~
#5807
�������~
2 c 100
�����~
if %cmd%==�����
wechoaround %actor% %actor.name% ������ ����� ����� �� �����.
wsend %actor% �� � ������ �������� ����� �����.
wteleport %actor% 5823
wat 5823 wechoaround %actor% %actor.name% �������� ����������� �� �����.
wsend %actor.name% �� ������� �� ����, ������ �� ���� � ���������� �� �����.
end
~
#5808
���������~
2 c 100
���������~
if %cmd%==��������� && %world.curmobs(5801)%==1
wteleport %actor% 5813
wsend %actor.name% ���-�� ����� ������� � ������ � ��� �������, �� ����� ����������
wsend %actor.name% ����� ������ ��������� � ���������� ���. � � ������ ���������.
wsend %actor.name% �� ������ � ������.
wsend %actor.name% ������� �������� ��������� �� ���.
wsend %actor.name% ������� �������� ������: �� ��� �����, � ������� �������? ����� �� �����?
wsend %actor.name% ������� �������� ������ ������������.
end
~
#5809
������������������~
0 j 100
~
if %object.vnum% == 5802
wait 1
mecho ������� �������� ��������� �� ��� ����������� �������.
mecho ��! �� �� ����� �������. ���������, ������� ���� �������.
���
wait 1
mecho � ����������� �� ��������.
mecho �������� ���������, � ��� �� ��������. �����, �� ������
mecho ����� �������� ��������� �� �����, � �� ��������� �����.
mecho ���� ��������, ������ �� ���������. � �� ������� �� ������.
mecho ������ ��� �����-�� �������� ���� ����������, ������ ����������.
mecho �������� �� ���� ������, ��� ����� �� ���� ����.
mpurge %object.name%
���� ���� %actor.name%
%purge% guard58
%purge% guard58
wait 1
mpurge %self%
~
#5810
��������������~
0 r 100
~
wait 1
msend %actor% �������� ������: ������ ����!
msend %actor% �������� ������: ������ � ������ �� �������. � ��� ������, ���� ���������.
msend %actor% �������� ������: �� ������� � ���� ����, � ���� �� ��� �� ������ ���
msend %actor% �������� ������: �� ������� ������������� ��� ������, ����� �� �������
msend %actor% �������� ������: ������.
if %actor.level% < 12
wait 1
msend %actor% �������� ������: �� ������� ���, � ��������� ���� �����.
wechoaround %actor% �������� ���-�� �������� � %actor.name% ������ � ������ �����.
wsend %actor% �� ������� � ������ �����.
wteleport %actor% 5838
  wechoaround %actor% %actor.name% �������� � ������ �����.
wsend %actor.name% �� ��������� � ����� �����.
endif
~
#5811
�������������������~
0 j 100
~
if %object.vnum% == 5805
wait 1
mecho �������� ��������� �� �������, - ������ ��� ������.
mecho ���! ������ ���������, ��� ������ ���� ��������� �����.
mecho �������� ���������, ����� ��������� � ���� �������.
mecho ���� ������� ��� ���� ������ � ���������� ���������. ��� ��
mecho �������� ��� �� ��. �� ����� ������ ������������ ��� ��� � �����������
mecho � ����, ��� ����� � ���� �������. ��� ������ �� ������ ���� �������
mecho �������� �������� � ��-�� ���������� ����� ����� ������. ���-�� ���
mecho ��������, �������� ��������� ��� ����������� �������. ��� �����
mecho ������������� ��������� ������ �������� � ���-�� ������ �� ��� ���������.
wait 1
mecho �� ��� ��, ����� ��� ��������, - ������ �������� - �� ������ ���������
mecho ���� ����, � � ������ �������.
mpurge %object.name%
calcuid vmob 5802 mob
if %world.curmobs(5802)%=1
mpurge %vmob.name%
end
if %world.curmobs(5802)%=1
mpurge %vmob.name%
end
if %actor.class%==13
mecho ��� ����� ����� �������, ����� ���� ����������.
  if %random.2% == 1
     mload obj 4414
     ���� �������.���� %actor.name%
  else
     mload obj 4415
     ���� ��������.���� %actor.name%
  end
end
mecho � ������� ������� ���.
wait 1s
set fchar %self.people%
while %fchar%
      set pc %fchar.next_in_room%
      if %fchar.vnum% == -1
         mteleport %fchar% 27057
         %fchar.loadroom(27018)%
         if %fchar.realroom% == 27057
            msend %fchar% �� ����� �� ���������� ������.
            if %fchar.sex% == 1
            mat 27057 mechoaround %fchar% %fchar.name% ����� �� ������.
            else
            mat 27057 mechoaround %fchar% %fchar.name% ����� �� ������.
            end
            msend %fchar% ������ ����, � ������� � �������.
            msend %fchar% �������� ��������� ��� �� �������� � ������ ������.
         end 
      end
      if %pc%
         makeuid fchar %pc.id%
      else
         set fchar 0
      end
done
mpurge %self.name%
end
~
#5812
�������������~
0 r 100
~
if %actor.realroom%==5838 && %actor.level%<10
msend %actor.name% ��� �� ��� �� ������� ���� �������.
halt
end
if %actor.realroom% == 5838
msend %actor.name% ������ ����, ������ �������!
msend %actor.name% ����� ������� ��������, ������� ������ �������.
msend %actor.name% ����� ����� �� �� �������� �������?
msend %actor.name% ������� ����� ������������� � ����������!
msend %actor.name% ����� ����� ���� ������ ����� �����������.
end
~
#5813
������������~
0 c 100
�����~
if %actor.realroom%==5838 && %actor.level%<10
msend %actor.name% ��� �� ��� �� ������� ���� �������.
halt
end
if %actor.realroom%==5838 && %cmd%==�����
msend %actor.name% �� ��������, �� ����� �� ��� ������ ��������� �����
msend %actor.name% ������� �� ��� � ����� �����.
msend %actor.name% ������, � �� ������� ���� ����� �������.
�����
mecho �������� ���-�� �������� ������� � ��� ��� ��� ����� � ��� �������.
msend %actor.name% ��� ���������� �������� � �� �� ��� �������� ��������.
mteleport all 5837
mat 5837 mechoaround %actor% %actor.name% �������� ��� � ������ ����.
halt
end
if %actor.realroom%==5837 && %cmd%==�����
msend %actor.name% �� ��� ��, �� ��� �����.
������
mecho �������� ���-�� �������� ������� � %actor.name% �����.
msend %actor.name% ��� ���������� �������� � �� �� ��� �������� ��������.
mteleport %actor.name% 5838
mat 5838 mechoaround %actor% %actor.name% �������� ��� � ������ ����.
end
~
#5814
�������~
1 h 100
~
osend ��������� ��� � ���������� �����.
oteleport %actor.name% 5838
~
#5815
������~
1 d 100
~
osend ����� ����� �� ������� �������.
osend ��������� ��� ��� �����, � ���������� �����.
oteleport %actor.name% 5838
~
#5816
������������~
0 f 100
~
mload obj 5805
~
#5817
������������~
0 f 100
~
if (%actor.realroom%>5823) && (%world.curobjs(5803)%==0)
mload obj 5803
end
~
$~