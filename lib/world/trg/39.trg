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
#3901
лоад метательного ножа~
1 c 1
достать~
wait 1
eval first %arg.words(1)%
eval secnd %arg.words(2)%
if (%secnd.contains(нож)% && (%first% > 1))
  if (%world.curobjs(3966)% >= 500)
    osend %actor% Вы пошарили рукой в поясе, но ножи кончились!
    halt
  end
  if (%first% > 10)
    eval first 10
    osend %actor% Столько ножей сразу Вам не вытащить.
  end
  while (%first% > 0)
    oload obj 3966
    calcuid knife 3966 obj
    eval temp %knife.put(%actor%)%
    eval temp %knife.owner(%actor.uniq%)%
    eval first %first%-1
  done
  osend %actor% Вы достали несколько метательных ножей из пояса с метательными ножами.
  oechoaround %actor% %actor.iname% достал%actor.g% несколько метательных ножей из пояса.
  halt
end
if (%first% == нож)
  if %world.curobjs(3966)% >= 500
    osend %actor% Вы пошарили рукой в поясе, но ножи кончились!
    halt
  end
  oload obj 3966
  calcuid knife 3966 obj
  osend %actor% Вы достали метательный нож из пояса с метательными ножами.
  oechoaround %actor% %actor.iname% достал%actor.g% метательный нож из пояса.
  eval temp %knife.put(%actor%)%
  eval temp %knife.owner(%actor.uniq%)%
else
  osend %actor% Что вы хотите достать?
end
~
#3902
Пуржим ножи при метании~
1 c 1
ме~
return 0
halt
if (%cmd.mudcommand% == метнуть)
  wait 2s
  eval carrier %self.carried_by%
  if (%carrier.vnum% != -1)
    %purge% %self%
  end
end
~
#3903
Достаем нож из пояса (не одет)~
1 c 2
достать~
wait 1
eval first %arg.words(1)%
eval secnd %arg.words(2)%
if (%secnd.contains(нож)% && (%first% > 1))
  if (%world.curobjs(3966)% >= 500)
    osend %actor% Вы пошарили рукой в поясе, но ножи кончились!
    halt
  end
  if (%first% > 10)
    eval first 10
    osend %actor% Столько ножей сразу Вам не вытащить.
  end
  while (%first% > 0)
    oload obj 3966
    calcuid knife 3966 obj
    eval temp %knife.put(%actor%)%
    eval temp %knife.owner(%actor.uniq%)%
    eval first %first%-1
  done
  osend %actor% Вы достали несколько метательных ножей из пояса с метательными ножами.
  oechoaround %actor% %actor.iname% достал%actor.g% несколько метательных ножей из пояса.
  halt
end
if (%first% == нож)
  if %world.curobjs(3966)% >= 500
    osend %actor% Вы пошарили рукой в поясе, но ножи кончились!
    halt
  end
  oload obj 3966
  calcuid knife 3966 obj
  osend %actor% Вы достали метательный нож из пояса с метательными ножами.
  oechoaround %actor% %actor.iname% достал%actor.g% метательный нож из пояса.
  eval temp %knife.put(%actor%)%
  eval temp %knife.owner(%actor.uniq%)%
else
  osend %actor% Что вы хотите достать?
end
~
$~
