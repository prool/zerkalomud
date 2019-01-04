#69100
Лоадим чудище у реки~
2 e 100
~
*Чтоб жизнь медом не казалась :))))
wait 3s
wecho _Вдруг река забурлила и на поверхность вынырнуло огромное чудище!
wecho _И с диким ревом бросилось на Вас!
wload mob 69100
detach 69100 %self.id%
~
#69101
Прыгаем через реку~
2 c 100
перепрыгнуть~
if !%arg.contains(река)% 
  wsend %actor% _Куда это Вы прыгнуть собрались!?
  return 0
  halt 
end
wsend %actor% _Разбежавшись и как следует оттокнувшись вы прыгнули на другой берег.
wechoaround %actor% _%actor.name% перепрыгнул%actor.g% на другой берег реки...
wteleport %actor% 69109
wsend %actor% _Вы перепрыгнули на другой берег реки.
wechoaround %actor% _Кто-то прыгнул сюда с той стороны реки. 
end
~
#69102
Через реку обратно~
2 c 100
перепрыгнуть~
if !%arg.contains(река)% 
  wsend %actor% _Куда это Вы прыгнуть собрались!?
  return 0
  halt 
end
wsend %actor%  Разбежавшись и как следует оттокнувшись, вы прыгнули на другой берег.
wechoaround %actor%  %actor.name% перепрыгнул%actor.g% на другой берег реки...
wteleport %actor% 69105
wsend %actor% _Вы перепрыгнули на другой берег реки.
wechoaround %actor%  Кто-то прыгнул сюда с той стороны реки.
end
~
#69103
Умер морок~
0 f 100
~
mecho _Морок издал предсмертный крик и растворился в пустоте!
mecho _От этого ужасного крика вас заполнил страх!
mload mob 69102
~
#69104
Убили духа скорби и печали~
0 f 100
~
mload obj 69112
~
#69105
Бросаем рунный камень~
2 h 100
~
if (%object.iname% == рунный камень)
  wait 1s
  wecho _Вдруг налетел порывистый ветер.
  wait 1s
  wecho _Засверкали молнии.
  wait 1s
  wecho _Грянул гром.
  wait 1s
  wecho _И скалы начали потихоньку раздвигаться, открывая проход.
  wdoor 69138 west room 69139
  wdoor 69139 east room 69138 
  wait 1s
  wecho _И вот проход уже достаточно широк, и можно пройти дальше.
end
~
#69106
Умер страх~
0 f 100
*~
if (%random.5% == 2) && (%world.curobjs(69120)% < 1)
  mload obj 69120
end
if (%random.5% == 2) && (%world.curobjs(69121)% < 1)
  mload obj 69121
end
if (%random.5% == 2) && (%world.curobjs(69122)% < 1)
  mload obj 69122
end
~
#69107
Умерло речное чудище~
0 f 100
~
msend %actor% _После Вашего мощнейшего удара, душа чудища на всегда покинула его тело!
mechoaround %actor% _После удара %actor.rname% чудище отправилось на судилище к богам!
switch %random.10%
  case 1
    mload obj 69123
  break
  case 2
    mload obj 69124
  break
  default
    mload obj 69125
  break
done
~
#69108
Умер цербер~
0 f 100
~
msend %actor% _После Вашего мощнейшего удара, душа двуглавого цербера на всегда покинула его тело!
mechoaround %actor% _После удара %actor.rname% цербер отправился на судилище к богам!
switch %random.10%
  case 1
    mload obj 69131
  break
  case 2
    mload obj 69132
  break
  default
    mload obj 69133
  break
done
~
#69109
Убили старого омутника~
0 f 100
~
if %random.7% == 1 && %world.curobjs(69104)% < 4
  mload obj 69104
  *if (%random.7% == 1) && (%world.curobjs(69134)% < 1)
  *mload obj 1217
end
~
#69110
Спускаемся в провал~
2 c 100
спуститься~
if !%arg.contains(провал)% 
  wsend %actor% _Куда это Вы спуститься собрались!?
  return 0
  halt 
end
wsend %actor% _Вы начали аккуратно спускаться в провал.
wechoaround %actor%  %actor.name% начал%actor.g% спускаться в провал.
wteleport %actor% 67700
wsend %actor% _Вы спустились в провал, сильно ободрав руки!
wechoaround %actor% _Кто-то спустился сюда. 
end
~
#69111
репоп~
2 f 100
~
wdoor 69138 west purge
wdoor 69139 east purge
calcuid river 69119 room
attach 69100 %river.id%
~
$~
