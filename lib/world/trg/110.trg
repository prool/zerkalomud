#11000
����� � �������~
0 q 100
~
wait 1
stand
msend %actor% ������ ������� ������� � � ������ ���������� �� ���!
����� .%actor.name%
~
#11001
���� � �������� �����~
0 q 100
~
if %actor.getquest(11010)% == ����
  wait 2
  emot ������� ��� ������ ������
  � ��� ��? �� �� �����%actor.g% �� ����������.
  ���
  emot � �������� ��������� �� ���
end
~
#11002
������ ���������~
0 b 50
~
���� ���� 
wait 2
switch %random.9%
  case 1
    �����
  break
  case 2
    ����
  break
  case 3
    ����
  break
  case 4
    ���
  break
  case 5
    �����
  break
  case 6
    �������
  break
  default
    ����
  done
~
#11003
��������� ���������~
0 b 50
~
���� ���� 
wait 2
switch %random.9%
  case 1
    ����� ����
  break
  case 2
    ����
  break
  case 3
    ������
  break
  case 4
    ���� �����
  break
  case 5
    �����
  break
  case 6
    ���
  break
done
~
#11004
����� � �����~
0 q 100
~
wait 1
�� %actor.name% ������, ������ �������, ������ �� ������.
�� %actor.name% �� ���� � ���� ��������� �������.
~
#11005
���������� �����~
0 c 100
���������~
wait 5
������ %actor.name%
msend %actor% �������, ������ �������.
msend %actor% ����� ���� ����, �� ������ � ������� ������������.
msend %actor% ������ ���, ��� ������� ����.
msend %actor% ������� ������ ��, ��� ����� ��� ���� ������, 
msend %actor% ��������� ������� "����� ��������".
msend %actor% ��� ��� �����, ��� �� ������, �� �������� ���-�� ������.
mecho ����� ������ �������.
mpurge %self%
~
#11006
��������~
2 d 100
����� ��������~
wait 1
wechoaround %actor% %actor.name% �����%actor.q%.
wteleport %actor% 11062
wsend %actor% ���-�� ������� ��� ����.
wat 11062 wechoaround %actor% %actor.name% � ������ ����%actor.g% ������.
~
#11007
������� �� ����.~
0 b 100
~
switch %random.5%
  case 1
    mecho ������� ������� �� ����.
  break
  case 2
    mecho ������� ������ ������ � ��������� �� ���.
    wait 2
    � ��� ��? ������ ������?
    � �������� ������ ����, ������. ��� ���� � �� ����� �� �����.
    � � �� ������� ��� ������, ����� ��� ����. 
    � �� ������� ��� � ������� ��� �����.  
    � ���� �� ����� ������������ ��� ��� ������.
  break
  case 3
    mecho ������� ������� ��������.
  break
done
~
#11008
������� �����~
1 p 100
~
set name2 %actor.id%
if %actor.leader%
  set name1 %actor.leader%
  if (%name1.vnum% == -1) && (%actor.vnum% != -1))
    set name2 %actor.leader%
  end
end
%name2.wait(8)%
wait 1
oecho �������� �� ����� ���������� ����� ������.
osend %name2% �� ����������� ��� ����� ������� �� ���.
wait 1
oecho �� ���� �������� ������ ���,
oecho ������� ����� ������� ��������� � ����������� 
oecho � ���������, ���������� ���� ����� ��������, ����. 
wait 1
oecho ������� ��������� �� ���.
oecho ������� ������ "�� �� ��� ������!"
oecho ������� ������ "���� �� ������� ��� � � �� ���� ������!"
wait 1
oload mob 11024
calcuid ghost 11024 mob
oforce %ghost% mkill %name2%
detach 11008 %self.id%
~
#11009
����� � �����~
0 q 100
~
wait 1
�� %actor.name% �� ���� �������? 
�� %actor.name% ������ ��������. ��� ������ ���?
�� %actor.name% � ������� �����, ��� � ������ ��� ����,
�� %actor.name% ���� �������� ������.
�� %actor.name% �� � ��������� �� ��� ������, ��� ����� �����, ��� ���� �� ������ ��������� ��������.
�� %actor.name% � ����� ��������� ����-������, � �������, �� � ������������� �� ������������ ������ ��� ������ ����.
%self.gold(+2000)% 
���� 2000 ��� %actor.name%
mecho ������� ������� � ������� ������.
wait 1
%purge% %self%
~
#11010
����������� ������������ ������~
0 q 100
~
wait 1
if %actor.getquest(11010)% == ���� || %actor.getquest(11011) == %date.yday%
  halt
end
if %actor.getquest(11010)% == ������
  emot ���������� �� �������� ���
  � ���� �� ������, ��� ���� ����� �� ������� �������������.
  � ��, �� ����, �����������, ��� ��� ������� ������ ��� ��� �����?
  ���� %actor.name%
  halt
end
emot ���������� �� �������� ���
� ����������, %actor.name%! �������, �������, ������� � ������ ���������.
� �������� ���� ���������� ������ ����� � ������� � �������� �������.
� �� ��������� �� ��� ���� �����?
�����
� � �� � ������ ������ ���� ��������, �� ��� � �������� ������� �������!
���
� ��, ��� � ��� � ������, ���� ������� ������ ������� �� ������� �����.
� ����� ��� ����, ����� � �����, ���� ����� ��������.
� ��� � �������� ��� �� ������ �����, ��� � �������� ����� ����.
� ����� ���������?
���� %actor.name%
~
#11011
����� � ��������~
0 d 1
������ �������� ��� �����~
switch %speech%
  case ������
    case ��������
      wait 1
      if  %actor.getquest(11011)% == %date.yday%
        ��� .%actor.name%
        � ����? ��������� �� ���� ���������� �� ���������?
        � �������� �� ��� � �� � ���.
        ���
        halt
      end
      if %actor.getquest(11010)% == ���� || %actor.getquest(11010)% == ������
        � ����? ���������� ���� ���� ��� ��� ������.
        � ������ ������� � ������� ������������, ��� � ������ �� ������, �������.
        � ������� ������ ��� ���� ��� ��� ����.
        � ������%actor.g%, �����?
        ���� .%actor.name%
        halt
      end
      ���
      � ��� ������� ��!
      � ��, ������ �����.
      � ���� � ���� ������-��������, ����������� ������.
      ���
      � ����� �� ��� ������ ������� � ��� ���� ������.
      � � ��� ��� �� � ������������ ����.
      � �� ����, �������, ����� � ������ �������.
      � ������� ���� ����, ���������, �������� ����� ��������.
      �����
      � � ������ ��� � ���� � ������ ���� - � ��� ��� ������� �� � ����������.
      � ��� ����� �� ��������� ������ ����� �������.
      � ��� ������ ����� ������� � ������ �����������, ��� � ��� ������ �� ����.
      � � ��� � �����, ������� ��� �������� ���, ������� � ����� ���������.
      � � ��� �� � ��� ������ ���, ������� ��������� �� ������.
      � ������ ���� ������ ������� �����.
      �����
      � ������ ��� �������� � �����, ���%actor.g% ������ �� ������ ����.
      mload obj 2005
      ���� all.������� .%actor.name%
      %actor.setquest(11010 ����)%
      � ������ ��� ����������� � ������ �� ������ ���������.
      � ����� �� ������� ��������, �� ��� �������� � ������.
    break
    case ���
      if %actor.getquest(11010)% == ������
        wait 1
        ���
        � ������� �� �����! ���� ������ � ���� ��������!
        ��� .%actor.name%
        � �������� ��, ����� ����, �� ������� ������������.
        � �� �� ���� �������� ��� ���� � ��� �������.
        ���
        � ������� ���� ��� ����� �� ����� ������ �����!
        dg_cast '��������' .%actor.name%
        %actor.setquest(11010)%
        %actor.setquest(11011 %date.yday%)%
        halt
      end
    break
    case �����
      if %actor.getquest(11010)% == ������
        wait 1
        ���
        � ���� �� �����!
        emot ���������� �� ������, ��� �� �� �������
        ��� .%actor.name%
        wait 1
        emot ������� �����������
        � ��� �, ���� �������� ��� ������ ��������, �� ���� �� ��� ������!
        ���
        � � �� ������� ��� �� ��������%actor.g%.
        switch %actor.class%
          case 0
            eval skill 23 30 31 141 154
          break
          case 1
            eval skill 20 23 30 136
          break
          case 2
            eval skill 9 24 28 30 131 133 135 136 138 139 144 147 148 157 160
          break
          case 3
            eval skill 1 4 8 30 134 136 165 178
          break
          case 4
            eval skill 6 9 22 30 131 133 136 140 144 147 148 160 167
          break
          case 5
            eval skill 8 12 22 30 31 132 134 136 137 140 141 142 143 144 145 147 148 150 151 158 
          break
          case 6
            eval skill 8 20 23 30 136
          break
          case 7
            eval skill 20 23 30 136 168
          break
          case 8
            eval skill 20 23 30 136
          break
          case 9
            eval skill 8 20 21 23 30 31 132 134 136 137 140 141 142 143 144 145 146 147 147 150 151 158
          break
          case 10
            eval skill 7 8 11 23 30 32 132 134 137 140 150 151 154 155 156 157 159 170
          break
          case 11
            eval skill 5 8 13 23 29 30 132 134  136 137 141 142 143 146 150 151 161 164 177 180
          break
          case 12
            eval skill 8 20 23 30 130 133 134 136 139 141 144 147 148
          break
          case 13
            eval skill 20 23 30 136 141 144 145 148 166
          break
        done
        set numofskill %skill.words%
        eval n %random.num(%numofskill%)%  
        eval skillnum %skill.words(%n%)%
        if (%random.100% < 21)
          set s 2
        else
          set s 1
        end
        mload obj 11026
        set items %self.objs% 
        set book %items.(1)%
        %book.val0(2)%
        %book.val1(%skillnum%)%
        %book.val2(%s%)%
        %book.val3(-1)%
        say ���... �� ���� ���� ��������. �� � �� ����, ��� ��� ��������, �� ������� �� ��.
        give ���� .%actor.name%
        %actor.setquest(11010)%
        %actor.setquest(11011 %date.yday%)%
        halt
      end
    break
  done
~
#11012
���� ������� �������� �����~
0 j 100
~
wait 1
if %object.vnum% == 2005
  emot ���� ������ ������� � ������ ��������
  %purge% %object%
  � ������� ����, %actor.name%.
  ���� .%actor.name%
  wait 1
end
if %actor.getquest(11010)% == ������
  � �� � ������ ��� �� ��� ��������� ���.
  � � � ��� ������� �������� ���-������ �������.
  � �� �� ������%actor.g% � ������ ��, ������%actor.g% ������� �� �� ������.
  � �� ����� �� ����������� �� ����, ������ ���� ������ �������� - �� �����.
  wait 1
end
if %actor.getquest(11010)% == ����
  � ������� � �������� ����� ���-������ �������.
  � ��� ���� ����������, ��� �� ����� ��� �����, � ������.
  � ��� �� � ������� ���� � ��� ���, ��� ������ ��� ���� ��������.
  � ������ �� � ����������� � ������.
  ���
  � �� ����� � ����� ����� ������ � ����� ��������.
  � ����� ��, ����� ����, ��� ������ �� � ���������� ����� ������ �� �������.
  � �� ������� �� ����� �����, ����� �������.
  �����
  %actor.setquest(11010 ������)%
  wait 1
end
������
������ ������� �����
emot �������� �������� �� ���
%purge% %self%
~
#11013
��� �����~
0 f 1
~
%load% obj 11016
~
#11014
���� � ��������~
0 q 100
~
if %actor.getquest(11010)% == ����
  wait 1
  ���� .%actor.name%
  � ���, ��� ���� ������������� ���������!
  � ������ �� ��������� ������ �� �������! ���������� �������-���������!
  � ���� �� ��� ��� ������� ������ ������, ��� ���� � ����� �� �������!
  ����
end
~
$~
