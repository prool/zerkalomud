#30300
����� ���� �������~
0 f 100
~
if (%world.curobjs(30312)% < 5) && (%random.5% == 1)
   mload obj 30312
end
~
#30301
����� � ������ � ����~
0 r 100
~
mecho _���� ������� ��������� �� �������.
wait 1s
msend %actor% _���� ������� ���������� � �������� ��� ������� �����.
mechoaround %actor% _���� ������� ���������� � �������� %actor.dname% ������� �����.
mdamage %actor% 150
mkill %actor%
~
#30302
����� � ������ � ���������~
0 r 100
~
mecho _��������-��������� ���������� � ������� ����� � �������.
wait 1s
����� �� ��� ������� ��� ������!
msend %actor% _��������-��������� �������� �� ������ ������ ����� � ���������� �� ���.
mechoaround %actor% _��������-��������� �������� �� ������ ������ ����� � ���������� �� %actor.rname%.
mload obj 30316
mkill %actor%
~
#30303
����� � ������ � �������~
0 r 100
~
mecho _��������-������ ���������� ����� �����.
wait 1s
����� �� ��� � ���� ������!
msend %actor% _��������-������ ���������� �� ��� � ��������� ������� �� �������.
mechoaround %actor% _��������-������ ���������� �� %actor.rname% � ��������� ������� �� �������.
mkill %actor%
~
#30304
����� � ������ � ���������~
0 r 100
~
mecho _��������-�������� �������� �������� ������� � ������������ � ���.
wait 1s
mecho _��������-�������� ���������� ������ �����.
����� ���������� � ����� ������ ������! ���� �� ��� ��� ��������!
mkill %actor%
~
#30305
����� � ������ � ��������~
0 r 100
~
mecho _��������-������� ������� ��� ���� ��� ����.
wait 1s
����� �� ��� ����! ��� ���!
mkill %actor%
~
#30306
����� � �������� ��������~
0 q 100
~
wait 1s
msend %actor% _������� ������� �������� ��������� �� ���.
mechoaround %actor% _������� ������� �������� ��������� �� %actor.rname%.
wait 1s
tell %actor.name% � �� ����� ���� ������ � ���.
tell %actor.name% �� ������� ������%actor.g% ���� �� ������� �����.
tell %actor.name% ���� ����� �� �������� ������ ��� ����������
tell %actor.name% �� ���������� � ������� ��������. ��� ��� �������
tell %actor.name% ��� ������������, � ������� �� ����� ������� ��� ��������.
tell %actor.name% �� �� ������ ��� �� ����, � � ����������� ��� �����.
wait 1s
msend %actor% _������� ������� ��������� ��� � �������� �� ������.
mechoaround %actor% _������� ������� ��������� %actor.dname% � �������� �� ������.
~
#30307
�������� �������� ���� ������ ��������~
0 j 100
~
if %object.vnum% == 30700 then
  wait 1s
  mpurge ������
  mecho _������� ������� ��������� � ������� ������ �� ������.
  wait 1s
  mpurge ������
  tell %actor.name% ������ �� �������!
  ���
  wait 1s
  tell %actor.name% ��� ���� ������.
  mload obj 30318
  ��� ���� %actor.name%
  wait 1s
  mecho _������� ������� ��������� � ������� �� ����.
  mpurge self
end
~
#30308
����� � ������ ������~
0 r 100
~
mecho _����� ����� ����������� ������ �������.
wait 1s
����� ��� ������ ��� �����, ���� � ������ ��� ��� ������.
msend %actor% _����� ����� �������� ���������� ��� � � ������ ���������� �� ���.
mechoaround %actor% _����� ����� �������� ���������� ��� � � ������ ���������� �� %actor.rname%.
mload obj 30316
mkill %actor%
~
#30309
����� � ������ �����~
0 r 100
~
mecho _����� ����� ������������ � ����� ��� ����������� �����.
wait 1s
����� ��� ��� ���������� �� ���� ����� ����������!
msend %actor% _����� ����� ������ ������� � ���� �������.
mechoaround %actor% _����� ����� ������ ������� � ������� %actor.rname%.
mkill %actor%
~
#30310
������� �����~
0 ab 50
~
 if %random.5%==1 then
      mecho _���� �� ��������� ��� �������� ��� �����.
 else
  if %random.4%==1 then
      mecho _���� �� ��������� ��� �������� ��� �������.
  else
    if %random.3%==1 then
      mecho _���� �� ��������� ��� ������� ������ � ������� � ��������� ���.
   else
     if %random.2%==1 then
foreach i %self.pc%
msend %i.name%  ���� �� ��������� ��� ����������, ������ �������� ��� �� ���.
mechoaround %i.name%  ���� �� ��������� ��� ����������, ������ �������� %i.rname% �� ���.
mdamage %i.name% 50
done
    else
      if %world.curmobs(30348)% <2
    mecho _������ ������ �� �������� ������� ������� ���������. 
    mload mob 30348
     end
     end
    end
   end
end   
~
#30311
����� �������� ��������~
0 f 100
~
if (%world.curobjs(30305)% < 1)
mload obj 30305
end
~
#30312
����� � �������� ��������~
0 q 100
~
mecho _������� �������� ��������� ������ �������.
wait 1s
����� ���� �������� ���������� ������!
����� � ����� ���� �� ���������� ���������� ��� �������.
����
wait 1s
����� �� ������� ����%actor.y% �������� ��� ������� ����.
����� ���� � ���, � ������� �� ���� �������, 
����� � ��� �������� ������ ��������� �� �����.
mkill %actor%
~
#30313
���������� ������� ��������~
2 c 100
��������~
if !(%arg.contains(�������)%) 
   wsend       %actor% ��� ��� �� ������ ����� ��������???
   return 0
   halt
end
if %actor.haveobj(30305)%
wsend %actor% _�� ������ ����������� ������.
wechoaround %actor% _%actor.name% �����%actor.g% ����������� ������.
wait 1s
wpurge �������
wsend %actor% _�� �������� ������������ ������� � ������ � �������� ��.
wechoaround %actor% _%actor.name% �������%actor.g% ������������ ������� � ������ � �������� ��.
wait 1s
wsend  %actor% _������ ��� ����� ������� ��� � ������.
wechoaround %actor% _������ ��� ����� ������� %actor.rname% � ������.
wsend       %actor% _�� ������ ���� �� �������� 5000 ����� �����...
%actor.exp(+5000)%  
end
~
$~