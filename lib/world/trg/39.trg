#3900
загрузка стаффа в магазины - пока так~
0 r 100
~
switch %self.vnum%
case 62007
set vnum 3932
break
default
halt
break
done
mecho %self.name% достал из загашника какие-то вещи и принялся развешивать их на прилавке.
set i 0
while %i% < 8
mload obj %vnum%
mload obj %vnum%
mload obj %vnum%
mload obj %vnum%
mload obj %vnum%
mload obj %vnum%
mload obj %vnum%
mload obj %vnum%
mload obj %vnum%
mload obj %vnum%
eval i %i%+1
eval vnum %vnum%+1
done
detach 3900 %self.id%
~
$~
