#111001
Лоад уникального стафа~
0 f0 100
~
set znum 111000
set onum 0
while %onum% < 10
  eval vnum %znum% + %onum%
  if %world.curobjs(%vnum%)% > 0
    halt
  end
  eval onum %onum% + 1
done

if %random.100% == 1
  eval vnum %znum% + %random.10% - 1
  mload obj %vnum%
end
~
$
$
