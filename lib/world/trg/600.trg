#60000
����������� �������~
0 r 100
~
wait 1
msend %actor% ������� ������� ����:
msend %actor% - �� ������� ���� ������� �� ������� ���, %actor.name%!
msend %actor% - ����, ��� �� ������ ��� �� ���� �����! ���� ���� ������!
msend %actor% - ���� �� ���� ��� ������� ��� ��� ������ �����,
msend %actor% - � ������ ���� ����� ��������� �� ������� �������� ������.
~
#60001
���� ������ �������~
0 m 1
~
wait 1
if (%amount% < 200)
  say �� ����� ����� ���%actor.g% ����� ���������. � � �� ������!
  halt
end
emot ����������%self.g% ������
eval target 0
switch %amount%
  * ��������
  case 3800
    eval target 18244
  break
  * �����������
  case 4100
    eval target 25007
  break
  * �����������
  case 6400
    eval target 13506
  break
  default
    wait 1
    msend %actor% ������� ������� ����:
    msend %actor% - ���� ����������� ���� ���� ���������, �� �������, �������.
    msend %actor% - �� �������� - �� 3800 ���.
    msend %actor% - � ����������� - �� 4100 ���.
    msend %actor% - �� � � ����������� - �� 6400 ���.
    msend %actor% - � ��� ��� ������, �� �������-�� �����!
    wait 3
    msend %actor% - ����� ��� - ������ ��� ��� ������� �������.
    msend %actor% - ���� � �������� ������ - ������� ��� ����� � ������ �����.
    msend %actor% - ���� �������� ����� ��������� � �����, �� ����� ��������� ���� �� �����.
    msend %actor% - � �������� �� �������� ������� - ��� ��� ���� � �����.
    halt
  done
  ���
  emot ������%self.g% ��������� �������� ������
  mechoaround %actor% %actor.name% �����%actor.q% � ������ ����.
  msend %actor% � ��� ����������� ������, � �� ��� �� �������� ��������...
  msend %actor% 
  mteleport %actor% %target% horse
  mechoaround %actor% %actor.name% ������%actor.u% ����� � ������ ����.
~
#60002
���� ����� �������~
0 j 100
~
wait 1
If (%object.vnum%==713)
  If (%object.val1%>5)
    Say �������� �����! �������� ��� ���������� ��������!
    If  !(%self.haveobj(60067)%)
      Mload obj 60067
    Else 
      Say ��... ����� � ���� ��� ����. ������ �� ����� ����.
    End
  Else
    Say ��... ����� �� ���������� �������! ����� �� ��������.
  end 
End
If (%object.vnum%==705)
  If (%object.val1%>5)
    Say ������������� ������ �����! � ����� ��� ��� ����������!
    If  !(%self.haveobj(60061)%)
      Mload obj 60061
    Else 
      Say � ���� ��� ���� �����! ��� ���� ���� �� �����!
    End
  Else
    Say ���! ��� ����� ������������ ������! ����� �� ��������.
  end 
End
If (%object.vnum%==700)
  If (%object.val1%>5)
    Say ��-�! ������������� �����!
    If  !(%self.haveobj(60060)%)
      Mload obj 60060
    Else 
      Say � ���� ��� ���� ����! ��� ������ �� �����!
    End
  Else
    Say ��-�-��! ���� ������ ��������� � ��������. ����� �� ��������!
  end 
End    
If (%object.vnum%==751)
  If (%object.val1%>10)
    Say �������� ����� ����!
    If  !(%self.haveobj(60068)%)
      Mload obj 60068
    Else 
      Say ���� � ���� ��� ����! ������ ������� ���� �� �����!
    End
  Else
    Say ��..���� ������ ��� �� �������� ��� ����������! ��� ��, ��� �������!
  end 
End
Mpurge %object%
if (%self.haveobj(60067)% && %self.haveobj(60061)%)
  say �������! ������ � ������� ������ � ������� ��������!
  say � ��� ������� � �������� ��� � ��������
  mecho ������� ���-�� ��������� ��� ������������� � �������� �� � �����.
  ���� ���
  mat 63670 mecho ���-�� �������� ����� � ������ ������ ����.
  mteleport all 63670
end
if (%self.haveobj(60067)% && %self.haveobj(60060)%)
  say �������! ������ � ������� ������ � ������� ��������!
  say � ��� ������� � �������� ��� �� �����
  mecho ������� ���-�� ��������� ��� ������������� � �������� �� � �����.
  ���� ���
  mat 75105 mecho ���-�� �������� ����� � ������ ������ ����.
  mteleport all 75105
end   
if (%self.haveobj(60068)% && %self.haveobj(60060)%)
  say �������! ������ � ������� ������ � ������� ��������!
  say � ��� ������� � �������� ��� �� ��������
  mecho ������� ���-�� ��������� ��� ������������� � �������� �� � �����.
  ���� ���
  mat 18244 mecho ���-�� �������� ����� � ������ ������ ����.
  mteleport all 18244
end
~
#60003
������ �� ��������~
2 z 100
~
wportal 18244 2
~
#60004
������ � �����������~
2 z 100
~
wportal 25007 2
~
#60005
������ � ����������� (���� �� ��������� -- � ��������)~
2 z 100
~
wportal 13506 2
~
$~
