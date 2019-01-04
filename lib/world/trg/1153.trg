#115301
Лоад уникального стафа~
0 f 100
~
set znum 115300
set onum 0
while %onum% < 10
  eval vnum %znum% + %onum%
  if %world.curobjs(%vnum%)% > 0
    halt
  end
  eval onum %onum% + 1
done
if %random.5000% <= 5
  eval vnum %znum% + %random.10% - 1
  mload obj %vnum%
end
~
$~
