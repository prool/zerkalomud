#78900
����� � �������� �����~
0 r 100
~
wait 1s
say ������ ����, %actor.name%
wait 1s
say ����� ������ ����� ���������, �������� �������� ��� ����, �� �� ������ �����, ���
say �� ���� ����� �� ���������� �� � ��� ������, ������ ��� � �����, �� ����� �������
say �� ������ �������� ���������...
wait 1s
say ������ ���� � ���� ������������, �������� - ������ ������ ����� ����� �������, ���
say �������, ��� ��� ������ ���������... � ����� ��� ����� ������ �� ����� ������, ���
say ���������� ������ ��������� �������� �����.
wait 1s
say ������ ���, %actor.name%, � � ������ ���� �������� �������!
~
#78901
���� ����� ������~
0 j 100
~
  if %object.vnum% == 78915 then
     wait 1s
     say ���� ������� ������ ����� ������, �������!
     mecho ������ �������� ����� ������� ������ � ��������� ������ �� ����
     mpurge ����
     wait 1s
     say �� ��� �, � ������ ����, ����� ��� ����, � ����� ��� �� ����� ����� ����� 
     say ��������, � ��� ��������� ���� � ����� ������ �� ������ �������!
     wait 1s
     mload obj 78906
     ��� ��� .%actor.name%
     detach 78900 %self.id%
     detach 78901 %self.id%
  else 
     wait 1s
     say ����� ��� ���, ����� ��� ����� ������!
     wait 1s
     ���
     wait 1s
     say �� ��� �� ���, ������ ��� �����.
  end
~
#78902
����� (����� ����) ����� �� ������~
2 g 100
~
 if %actor.class% == 2 then
  wsend %actor% �� �������� ���������� ����, � ������ ���������� ����
 else
    wsend %actor% ��� � ��������� ������� �� ������������ �����, � ����� ����� ����������
           eval    falldam  %actor.hitp%*1/10
           wdamage %actor% %falldam%
    wforce %actor% ���� �-�-�-�-�-�!
    wait 1s
    wsend %actor% � ������� ����� �� ������ ����, �������� �� ����������� ������ ������.
    wforce %actor% ���� �� ����-�-�-�!
           eval    falldam  %actor.hitp%*1/10
           wdamage %actor% %falldam%
    wsend %actor% ������ ������� ��������� � �� ��������� ����� ������� ������� �������...
    wteleport %actor% 78947
end
   
~
#78903
������� ������� ����� ��������~
1 h 100
~
  if  %actor.realroom% == 78906 then
    oecho ������� ������ �����, ����������� � �������� ���������� ����� ��������� ���,
    oecho � ����� ����� ������ �� ������!
    oteleport all 78988
  else 
    oecho ������� ��������� ������ ��� � ���� ��������. 
end
detach 78903 %self.id%
~
#78904
�����~
2 f 100
~
calcuid div_ptic 78905 mob
  attach 78900 %div_ptic.id%
  attach 78901 %div_ptic.id%
if %exist.obj(78906)%
calcuid pero_ptic 78906 obj  
  attach 78903 %pero_ptic.id%
end
calcuid mag_num 78908 mob
attach 78908 %mag_num.id%
attach 78906 %mag_num.id%
calcuid esc_sov 78900 mob
attach 78909 %esc_sov.id%
calcuid esc_st 78910 mob
detach 78928 %esc_st.id%
attach 78927 %esc_st.id%
if %exist.mob(78930)%
calcuid soba_ki 78930 mob
detach 78929 %soba_ki.id%
wteleport %soba_ki% %self.vnum%
wpurge %soba_ki%
end
calcuid room 78948 room
attach 78930 %room.id%
~
#78905
���� ��� �� ����� (������)~
0 f 100
~
mload obj 78915
~
#78906
��� �� ����� �����������~
0 r 100
~
wait 1s
���
say �������, %actor.name%
wait 1s
say ���� � ���� � ���� ������ ��� �����
say �����-�� �����, ������ ��������.
wait 3s
say ���� ? �� ������, �� ��� ����� ���� ��� ����!
wait 1s
tell %actor.name% ������� ��� � ������ ���������� �����, ������� ������� �������
tell %actor.name% ������� ��� ��� ����� ���� ����� �������, � ��� ������ ���� �� ��� ��������
tell %actor.name% ����� �������� - ����������� ��-������, 10000 ��� ���� ���!
wait 1s
say �� ������, ���� ����� ������
���� %actor.name%
���
detach 78906 %self.id%
~
#78907
���� ������� ������� (�����)~
0 f 100
~
mload obj 78907
if %random.100% < 3
if %world.curobjs(1229)% < 1
mload obj 1229
end
end
~
#78908
���� ���� ����� ��������~
0 j 100
~
if %object.vnum% == 78907 then
   wait 1s
   ���
   say ��, ��� ���
   ���
   wait 1s
   say �� ���, ��� ��������������, ������� ���� 5000 ��� � ��� �� ��� ������ �������
   mload obj 78942
   give ���� %actor.name%
   wait 1s
   msend %actor.name% �� ��������� ����������� ������������� ������� ������, � ��������� 5000
   wait 1s 
   mforce %actor.name% � ��� ��� 10000 ��� ????
   msend %actor.name% - �� ���������� ��
   wait 1s
   say ���-�-� ? ����� ��� 10000 ���? �� ������, ������ �������! 
   mecho ��� �� ����� �� �� ����� ���������� � �������� ��� ���� ���� "����� ��� ������!"
   ���
   dg_cast '� ��' %actor.name%
   detach 78908 %self.id%
else
  ��� 
  wait 1s
  say ���������� ? ����� � ������ ��� ����� ��� ���� ����������!
  mecho ��� �� ����� �� �� ����� ���������� � �������� ��� ���� ���� "��� ������!"
  ���
  dg_cast '��' %actor.name%
  end
detach 78908 %self.id%
~
#78909
����� � ����������-���������~
0 r 100
~
wait 1s
  say ���-���
   ����
wait 1s
  say ������� �� ��� ����� �������.. ���...
  say �� ����, ��� ���� ������, ����� �����������...
  say ���� ����� ������ ������� ����, � ����� ���� �� �������, � ���� ��� ����� ?
wait 1s
  ���� %actor.name%
wait 1s
 msend %actor.name% �� ������ ������� ���� �������� ��� �����
 mforce %actor.name% � � ���� ����� %actor.name%
wait 1s
��� %actor.name%
say ��, %actor.name%, ������ � �������� ���� ������� ��������� ����, ��� ��� ���� ?
���� %actor.name% ��� ����� ���������, �� �����������, ���� ���
attach 78910 %self.id%
detach 78909 %self.id%
~
#78910
����� ����� ������� �������~
0 d 0
���� �� ������� ���������~
wait 1s
  say �������!
wait 1s
  ����
wait 2s
  say ��� ��� ��� ����� ����� ����� � ���� ������ �������� ������, ��� ����� �����
  say �������, �� ��������� ����� �������� ���� ����� ����������� � ����� �����.
  say �������, ��� ������������ �������� ����� ����� ��� �� ��� ������������, � 
  say ����� ������� �������� �� �������� ������, � ����� ����� �� ������ �������������
  say �������
wait 2s
  ����
wait 2s
  say �������� �� ��� ��� ��������, ��� ���� ����, ��� ���� ����� ����� �� ����,
  say �������� ����� ������, %actor.name%, ������� �� ��� ��������!
  say ������ � ��� ���� �������� ��������
wait 2s
  say ��� ����� ��� ������ ����� � ������, ������� � ���� ����� ���������� �����,
  say ������� �������, � ��� �� ������ ���� � ���� ������� ���� �������, �� ��� �������
  say ������ ����������.
  say ������ ������� ������� �������� � ������ �����, �������� �� ��� ����� 
  say ����� ���������, ���� ���������, ��� ������� ������� �����, ������� �� ��� ��������
  say ����� �� �������� �����, �� ���� � ���� ����� ������� �������, ���� �� ������������
wait 2s 
  say ����� �����, ��� ������ � ����� ���� ��� ������ � ���� �������� �������� ��������
  say �� ������ �������� ��� �� �������.
wait 2s
  say ������ �� ������-������� ������� ����� ����� ��������� � ���������, ��� ���� �������
  say ������������, �� �� ��� ����� � ���� �� ��������, ����� �� ����� ������ �� ����� 
  say �������� ����� ���������.
wait 2s 
  say ��, ������� �� ���� ���, ����� �
wait 1s 
  ����
wait 1s
  say � ���������, �� ���������� ������ ������, ������� ������� ����� ������� �� ���
  say ����� ������ � ������� ����.
wait 1s 
  say ����� ����!
detach 78910 %self.id%
~
#78911
����� �������� �����~
0 f 100
~
if (%random.5% <= 1)
      mload obj 78916
end      
~
#78912
����� ����~
0 f 100
~
if (%random.5% <= 1)
      mload obj 78918
end      
~
#78913
����� ������~
0 f 100
~
if (%random.5% <= 1)
      mload obj 78919
end      
~
#78914
����� �����~
0 f 100
~
if (%random.5% <= 1)
      mload obj 78920
end               
~
#78915
������� ������� ������~
0 f 100
~
if (%random.5% <= 1)
      mload obj 78921
end               
~
#78916
����� ��������~
0 f 100
~
if (%random.5% <= 1)
      mload obj 78922
end               
~
#78917
����� ����~
0 f 100
~
if (%random.5% <= 1)
      mload obj 78923
end               
~
#78918
����� ����� �������~
0 f 100
~
if (%random.5% <= 1)
      mload obj 78924
end               
~
#78919
����� ���������~
0 f 100
~
if (%random.5% <= 1)
      mload obj 78925
end               
~
#78920
������� �����~
0 f 100
~
if (%random.5% <= 1)
      mload obj 78926
end               
~
#78921
������� ����~
0 f 100
~
if (%random.5% <= 1)
      mload obj 78927
end               
~
#78922
������� �������� �������� �����~
1 j 100
~
wait 1s
if (%actor.class% == 10) & (%actor.level% > 24)
 switch %self.vnum%
   case 78916
     wait 1s
     osend %actor% �� ����������, ��� �� ����� ������� � ���� �������...
     osend %actor% ��������-�� � ������� ������!
        if (%random.2% <= 1)
           otransform 78930
           oechoaround %actor% %actor.iname% ���-�� ������ �� ������ ������� ���������.
           osend %actor% "���������� ���������� ����!" - ������������ ��.
detach 78922 %self.id%
        else 
           oechoaround %actor% %actor.iname% ������� ��������� � ������� ����������� �����
           osend %actor% ����� ������ �� �����... ���� ������ �������������!
           opurge %self%        
        end
    break
   case 78918
     wait 1s
     osend %actor% �� ����������, ��� �� ����� ������� � ���� �������...
     osend %actor% ��������-�� � ������� ���������!
        if (%random.2% <= 1)
           otransform 78931
           oechoaround %actor% %actor.iname% ���-�� ������ �� ������ ������� ���������.
           osend %actor% "���������� ���������� ����!" - ������������ ��.
detach 78922 %self.id%
        else 
           oechoaround %actor% %actor.iname% ������� ��������� � ������� ����������� �����
           osend %actor% ����� ������ �� �����... ���� ������ �������������!
           opurge %self%        
        end
    break
   case 78919
     wait 1s
     osend %actor% �� ����������, ��� �� ����� ������� � ���� �������...
     osend %actor% ��������-�� � ������� �������!
        if (%random.2% <= 1)
           otransform 78932
           oechoaround %actor% %actor.iname% ���-�� ������ �� ������ ������� ���������.
           osend %actor% "���������� ���������� ����!" - ������������ ��.
detach 78922 %self.id%
        else 
           oechoaround %actor% %actor.iname% ������� ��������� � ������� ����������� �����
           osend %actor% ����� ������ �� �����... ���� ������ �������������!
           opurge %self%        
        end
    break
   case 78920
     wait 1s
     osend %actor% �� ����������, ��� �� ����� ������� � ���� �������...
     osend %actor% ��������-�� � ������� �������!
        if (%random.2% <= 1)
           otransform 78933
           oechoaround %actor% %actor.iname% ���-�� ������ �� ������ ������� ���������.
           osend %actor% "���������� ���������� ����!" - ������������ ��.
detach 78922 %self.id%
        else 
           oechoaround %actor% %actor.iname% ������� ��������� � ������� ����������� �����
           osend %actor% ����� ������ �� �����... ���� ������ �������������!
           opurge %self%        
        end
    break
   case 78921
     wait 1s
     osend %actor% �� ����������, ��� �� ����� ������� � ���� �������...
     osend %actor% ��������-�� � ������� ��������!
        if (%random.2% <= 1)
           otransform 78934
           oechoaround %actor% %actor.iname% ���-�� ������ �� ������ ������� ���������.
           osend %actor% "���������� ���������� ����!" - ������������ ��.
detach 78922 %self.id%
        else 
           oechoaround %actor% %actor.iname% ������� ��������� � ������� ����������� �����
           osend %actor% ����� ������ �� �����... ���� ������ �������������!
           opurge %self%        
        end
    break    
   case 78922
     wait 1s
     osend %actor% �� ����������, ��� �� ����� ������� � ���� �������...
     osend %actor% ��������-�� � ������� �����!
        if (%random.2% <= 1)
           otransform 78935
           oechoaround %actor% %actor.iname% ���-�� ������ �� ������ ������� ���������.
           osend %actor% "���������� ���������� ����!" - ������������ ��.
detach 78922 %self.id%
        else 
           oechoaround %actor% %actor.iname% ������� ��������� � ������� ����������� �����
           osend %actor% ����� ������ �� �����... ���� ������ �������������!
           opurge %self%        
        end
    break
   case 78923
     wait 1s
     osend %actor% �� ����������, ��� �� ����� ������� � ���� �������...
     osend %actor% ��������-�� � ������� �����!
        if (%random.2% <= 1)
           otransform 78936
           oechoaround %actor% %actor.iname% ���-�� ������ �� ������ ������� ���������.
           osend %actor% "���������� ���������� ����!" - ������������ ��.
detach 78922 %self.id%
        else 
           oechoaround %actor% %actor.iname% ������� ��������� � ������� ����������� �����
           osend %actor% ����� ������ �� �����... ���� ������ �������������!
           opurge %self%        
        end
    break
   case 78924
     wait 1s
     osend %actor% �� ����������, ��� �� ����� ������� � ���� �������...
     osend %actor% ��������-�� � ������� ������!
        if (%random.2% <= 1)
           otransform 78937
           oechoaround %actor% %actor.iname% ���-�� ������ �� ������ ������� ���������.
           osend %actor% "���������� ���������� ����!" - ������������ ��.
detach 78922 %self.id%
        else 
           oechoaround %actor% %actor.iname% ������� ��������� � ������� ����������� �����
           osend %actor% ����� ������ �� �����... ���� ������ �������������!
           opurge %self%        
        end
    break
   case 78925
     wait 1s
     osend %actor% �� ����������, ��� �� ����� ������� � ���� �������...
     osend %actor% ��������-�� � ������� �������!
        if (%random.2% <= 1)
           otransform 78938
           oechoaround %actor% %actor.iname% ���-�� ������ �� ������ ������� ���������.
           osend %actor% "���������� ���������� ����!" - ������������ ��.
detach 78922 %self.id%
        else 
           oechoaround %actor% %actor.iname% ������� ��������� � ������� ����������� �����
           osend %actor% ����� ������ �� �����... ���� ������ �������������!
           opurge %self%        
        end
    break
   case 78926
     wait 1s
     osend %actor% �� ����������, ��� �� ����� ������� � ���� �������...
     osend %actor% ��������-�� � ������� �������!
        if (%random.2% <= 1)
           otransform 78939
           oechoaround %actor% %actor.iname% ���-�� ������ �� ������ ������� ���������.
           osend %actor% "���������� ���������� ����!" - ������������ ��.
detach 78922 %self.id%
        else 
           oechoaround %actor% %actor.iname% ������� ��������� � ������� ����������� �����
           osend %actor% ����� ������ �� �����... ���� ������ �������������!
           opurge %self%        
        end
    break
   case 78927
     wait 1s
     osend %actor% �� ����������, ��� �� ����� ������� � ���� �������...
     osend %actor% ��������-�� � ������� ������!
        if (%random.2% <= 1)
           otransform 78940
           oechoaround %actor% %actor.iname% ���-�� ������ �� ������ ������� ���������.
           osend %actor% "���������� ���������� ����!" - ������������ ��.
detach 78922 %self.id%
        else 
           oechoaround %actor% %actor.iname% ������� ��������� � ������� ����������� �����
           osend %actor% ����� ������ �� �����... ���� ������ �������������!
           opurge %self%        
        end
    break
 done  
else 
osend %actor% �� ���� ������ �� �������� ��������!
oechoaround %actor% ����� %actor.iname% ����� �� �������� �������� ? �������� � ���� �����
oechoaround %actor% ���� �� ���� �� ��������!
end
~
#78923
�������� ������������~
0 r 100
~
������
wait 1s
say ���� � �� ��������...
say �������� ���, ����������, ��� � ��� ���... � ���� ������ ������� �� �����...
wait 1s 
���
wait 1s 
say ���� ���, �� ����, ���� ��� �������, ��� ����� � ����� ������ ����, ����� ����
say ����� � ����� ������� �� �����...
wait 1s
say ������ ���� ���� ������� ���������, ������ �� �������� ������, ����� ���� ������
say ������ � �� ���������.
wait 1s 
say 1500 ���, � ����� ����, ������, � ��� ���������, ������� ������ ������� �������...
~
#78924
���� ������ ���������~
0 m 1
~
wait 1s
 if (%actor.sex% == 1) 
     if (%amount% < 1500)
            say ���, ���� ���, ����� �, ������ ��� �� 1500 ��� - �� ������, ������ ���� ������
            ���� %amount% ��� .%actor.name%
     elseif (%amount% == 1500)
            mecho ������� ������ ����-�� �� ����� � ������ ��������� ������� �������
            mload obj  78941
            ���� ���� .%actor.name%
            ���� ����
     elseif (%amount% > 1500)
            say �� ������ �������, �� ��������� ���� ���� ��� ����� �������!
            dg_cast '����' .%actor.iname%
            wait 1s
            mecho ������� ������ ����-�� �� ����� � ������ ��������� ������� �������
            mload obj  78941
            ���� ���� .%actor.name%
            ���� ����
     end
 elseif (%actor.sex% == 2) 
     if (%actor.age% < 30)
            say ������ ����� � ����� ����������� ������� �����, ��� � ����, ����!
            ���� %amount% ��� .%actor.name%
            mecho ������� ������ ����-�� �� ����� � ������ ��������� ������� �������
            say ������ ���������, �� ������� ��� ����, �� ������ �������.
            mload obj  78941
            ���� ���� .%actor.name%
             ���� ����
     elseif (%actor.age% > 30)
            if (%amount% < 1500)
             say ���, ���������, ����� �, ������ ��� �� 1500 ��� - �� ������, �������� ���� ������
            ���� %amount% ��� .%actor.name%
     elseif (%amount% == 1500)
            mecho ������� ������ ����-�� �� ����� � ������ ��������� ������� �������
            mload obj  78941
            say ������ ���������, �� ������� ��� ����, �� ������ �������.
            ���� ���� .%actor.name%
            ���� ����
     elseif (%amount% > 1500)
            say �� ������ �������, �� ��������� ���� ���� ��� ����� �������!
            dg_cast '����' .%actor.iname%
            wait 1s
            mecho ������� ������ ����-�� �� ����� � ������ ��������� ������� �������
            mload obj  78941
            say ������ ���������, �� ������� ��� ����, �� ������ �������.
            ���� ���� .%actor.name%
            ���� ����
     end         
end
~
#78925
����� � ����������~
0 r 100
~
wait 1s
mecho ������, ��������� �� ����� ����-�� �����������.
wait 1s
mecho ������, ��������� �� ����� ����-�� �����������.
����
~
#78926
�������� ����� ������~
0 f 100
~
mload obj 78906
if (%world.curobjs(1218)% < 1) & (%random.100% <= 1)
mload obj 1218
end
~
#78927
������� ������� ������������~
0 r 100
~
wait 1s
  if (%actor.cha% > 20) 
     say ������, ���� ����� ��������, %actor.name%.
     say ��������� ����� ������� ������� ���� ��������� ��� ��������...
     say � ��� ����� ���� ��������, ���� ����� ���, �� ���, ������, ��� ����� �� ���������
      wait 1s
     say ������� ��� ����� �������� ��������, � � ��������� ������� ���� ��������� �������
     attach 78928 %self.id%
     detach 78927 %self.id%
  elseif (%actor.cha% <= 20) 
     say ������, �� ���, ��� ������?
     wait 1s
     mecho ���������� ��������� �����, ��� ����� ��� ���-�� ������ � ������.
     wait 1s
     say �� ����� �� �� ��������, �� ���� � ����, ��� ����� ����� �������...
  end
~
#78928
���� ��������-����� �����~
0 j 100
~
wait 1s
  if (%object.vnum% == 78907)
mpurg %object%
    say �-�-�, ��� �� �� ����� �����!
    ��� .%actor.name%
     wait 1s
    say �� �����, ������ ���� ������� ����� ������� �� ���� ����� ��������� ������!
    say �� ����� ���� � ����, � ����� ���� ����� ��������� � ��� ����������
     wait 1s
    ���� ��-��-��, �����, ����� �� ���
     wait 1s
    say ������ ����� �������� ��� � ����.
     wait 10s
    ��
     wait 10s
    mecho "����-�-�-��" - �������� ����������, ��� ���� ����.
     wait 1s
    mecho "��� ���-�-�" - ���������� ������� ����.
     wait 6s
    ����
    say ������� ������ ����� ���������, ���� ����� ������ ����
    say � �������� ��������, �� ������ ������
     wait 1s
    mload mob 78930
       calcuid soba_ki 78930 mob
       attach 78929 %soba_ki.id%
    mecho ����� ������ � ���, ���� �� ����� ������� �������.
    mecho ����� ���-�� ������ �������� � ��������
     wait 1s
    say ��, ��� ������, �������� � ������� �� ������, � ������ ���� ����� ���� ��� �����
    say ����� ���! ��, ���� �� �����, ������� ���� ����� �����, ���� ������� ��� ��������� � �����������
  else 
    say ��� �� ��, ��� � ������, �� ����� � ���� �������, �������!  
    ���� %object.name%
end    
~
#78929
������� � �������~
0 c 1
�������� ������� ����� ������� �����~
if %arg.contains(�������)%
wait 1s
      msend %actor%  �� ������� � ������� �������, � ��� ����� ����� ��������� � �����.
       wait 1s
      mechoaround %actor% %actor.iname% ����� � ������� �������, � �� ����� ������ ��������
      msend %actor.name% �������������, � ��������, �������� ��, � ������ �������.
      mteleport %actor% 78948
      msend %actor% �� ������� � ������� ����� ������� �������.
      mecho �� ������ �� � ��������� ��� ������� ��������� � ��� ������. ��-�. ��� ���������?
      mecho ����� ���� %actor.next_in_room% ?
else
      msend %actor%  ����-��� �� ��������� ?
end
~
#78930
������� �����������~
2 c 1
������� �������~
 if %arg.contains(�����������)%
wsend %actor%  �� ����� ������� � �����������, �������� ����� ���������� ����.
       wait 1s
wechoaround %actor% %actor.iname% ���� ������� � �����������, �������� ����� ���������� ����.
       wait 1s
wecho ���-�� ������: '������ ����, �������� ������'
       wait 1s 
wecho ���-�� ������: '�� ������� �������� �����, �������� ��������'
       wait 1s
            if (%world.curobjs(78908)% == 0)
wload obj 78908
wecho ���-�� ������: '�� ��� � ��������� ���� �������� �������� �����'
wecho ���-�� ������: '���� ���, � ���� ������� ����� ������!'
wecho ���-�� ���� ��������.
elseif %world.curobjs(3308)% < 1 && %world.curobjs(3309)% < 1 && %random.5% == 1
wload obj 3308
wecho ���-�� ������: '� ����� ��������� ���� ������� ��������'
wecho ���-�� ������: '�� ���� ����� ��� ���� � ����, � ��� ��� ������!'
wecho ���-�� ������: '������ ���� � ������� ���� �������� &W���� �����&n'
wecho ���-�� ���� ��������.
            else 
wecho ���-�� ������: '� ����� ��������� ���� ������� ��������'
wecho ���-�� ������: '�� ���� ����� ��� ���� � ����, � ��� ��� ������!'
wecho ���-�� ���� ��������.
            end
detach 78930 %self.id%
  else             
wsend %actor% �� ��� �� ����������� ��������� ?
end
~
$~