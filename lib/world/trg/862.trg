#86200
мертв маршал~
0 f 100
*~
mload obj 86123
~
#86201
баттлтриг луча света~
0 k 75
~
if %random.3% == 1
  set target %random.pc%
  dg_cast 'слеп' .%target.name%
end
~
#86202
магистр призывает лучи~
0 k 70
~
if ((%random.3% == 1) && (%world.curmobs(86210)% < 4))
  mecho Верховный магистр призвал на помощь Силы Света 
  mecho - И нестерпимо яркий луч ударил Вам в глаза!
  mload mob 86210
  mforce луч.свет kill %random.pc%
end
~
#86203
мертв луч света~
0 f 50
~
if (%world.curobjs(86207)% < 41)
  mload obj 86207
  mecho Когда луч света достаточно ослаб, его удалось пленить в колбочку!
  mecho Быть тожет понадобится...
end
~
#86204
мертв верховный магистр~
0 f 100
~
mload obj 86124
~
#86205
в бою с маршалом~
0 k 15
~
wait 1
foreach victim %self.char%
  emot испустил боевой клич рыцарей и ринулся на Вас, рубя направо и налево!
  if (%random.100% < 60 )
    dg_cast 'страх' %victim.name%
  end
done
if (%random.100% < 3 )
  detach 86205 %self.id%
end
~
#86206
помер важный священник~
0 f 100
~
if ((%random.100% < 25) && (%world.curobjs(555)% < 1 )) 
  mload obj 555
  *if ((%random.100% < 25) && (%world.curobjs(487)% <1 )) 
  *mload obj 487
end 
~
#86208
повернуть ворот~
2 c 1
повернуть~
wait 1
if !%arg.contains(ворот)%
  %send% %actor% Что вы хотите повернуть?
  halt
end
%send% %actor% Вы начали крутить ворот.
%echoaround% %actor% %actor.name% начал%actor.g% крутить ворот.
%echo% Послышался лязг засовов - теперь ворота можно открыть.
wdoor 86265 east purge
wdoor 86265 east room 86133
wdoor 86265 east name ворота
wdoor 86265 east description ворота
wdoor 86265 east flags ab
detach 86208 %self.id%
~
#86209
репоп зоны 862~
2 f 100
~
detach 86208 %self.id%
attach 86208 %self.id%
wdoor 86265 east purge
wdoor 86265 east room 86133
wdoor 86265 east name ворота
wdoor 86265 east description ворота
wdoor 86265 east flags abcd
~
#86210
Пресуществление, епт~
1 c 3
пи~
set command %cmd.mudcommand%
if ((%command% != пить) || %self.val1% < 1))
  return 0
  halt
end
if %actor.fighting%
  osend %actor% Не стоит отвлекаться в бою!
  halt
end
set name лагвица
set target %arg.words(1)%
if !%name.contains(%target%)%
  halt
end
%self.val2(2)%
*таки чашу откуда-то наполнили и теперь пьют
return 0
set vol %self.val1%
wait 1
*oops - товарисч уже напился и выпить еще не смог
if (%self.val1% >= %vol%)
  halt
end
if (%actor.hitp% < %actor.maxhitp%)
  eval heal 50+%random.50%
  eval hitp %actor.maxhitp%-%actor.hitp%
  if (%heal% <= %hitp%)
    set buf %actor.hitp(+%heal%)%
  else
    set buf %actor.hitp(+%hitp%)%
  end
  osend %actor% Вы почувствовали себя значительно лучше.
end
~
$~
