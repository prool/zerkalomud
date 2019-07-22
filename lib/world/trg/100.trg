#10000
<100 Enter to Fisherman>~
0 h 100
*~
if %actor.vnum% != -1
  halt
end
wait 1
if !%Killer%
  mecho - Не трогай меня, я не причиню тебе зла, - рыбак испуганно отступил в угол.
  mecho - Ведь ты не убьешь меня, да, не убьешь ?
  mecho - Лучше отомсти за моего отца, которого убило чудище.
  mecho - Оно там, внизу, на реке... Я не пойду, ты уж сам%actor.g%...
  mecho - Пойдешь ? Или ты тоже труслив%actor.g%, как те, двое, что приходили ?
  attach 10001 %self.id%
elseif %Killer.id% == %actor.id%
  mecho - Слыхал я, что ты, %actor.name% убил%actor.g% чудище.
  mecho - Что-ж, ты отомстил%actor.g% за моего мальчика, теперь моя душа спокойна.
  mecho - Вот, возьми, я копил их всю жизнь, но теперь они мне ни к чему.
  msend       %actor% Рыбак дал Вам 400 монет.
  %actor.gold(+400)%
  mechoaround %actor% Рыбак дал %actor.dname% горсть монет.
  detach 10000 %self.id%
else
  mecho - Не трогай меня, %actor.name%, - рыбак испуганно забился в угол.
end
~
#10001
<100 г ПОЙДУ>~
0 d 0
пойду хорошо согласен~
if %actor.vnum% != -1
  halt
end
wait 1
mecho - Спасибо, что не отказал%actor.g%. Вот, это поможет тебе пройти к чудищу.
set pc %self.people%
while %pc%
  if %pc.vnum% == -1
    mload obj 10008
    give  рыбья.шерсть .%actor.name%
  end
  set pc %pc.next_in_room%
done
attach 10002 %self.id%
detach 10000 %self.id%
detach 10001 %self.id%
~
#10002
<100 Second enter to Fisherman>~
0 h 100
*~
if (%actor.vnum% != -1) || (%actor.id% != %Killer.id%)
  halt
end
wait 1
mecho - Спасибо тебе, %actor.name%.
mecho - Что-ж, ты отомстил%actor.g% за моего мальчика, теперь моя душа спокойна.
if (%world.curobjs(10019)% < 10) && (%random.10% <= 3)
  mecho - Вот, это я нашел в реке, когда был молодым. Мне она ни к чему.
  mecho - А ты найдешь ей достойное применение.
  mload obj 10019
  give  речная.жемчужина %actor.name%
else
  mecho - Вот, возьми, я копил их всю жизнь, но теперь они мне ни к чему.
  msend       %actor% Рыбак дал Вам 400 монет.
  %actor.gold(+400)%
  mechoaround %actor% Рыбак дал %actor.dname% горсть монет.
  if (%world.curobjs(239)% < 50) && (%random.1000% <= 150)
    mload obj 239
    дать рун %actor.name%
  end
end
detach 10002 %self.id%
~
#10003
<100 Water monster killed>~
0 f 100
*~
if (%actor.vnum% != -1)
  eval Killer %actor.leader%
else
  eval Killer %actor.id%
end
calcuid Fisherman 10011 mob
remote  Killer %Fisherman.id%
~
#10004
<100 Solovey killed>~
0 f 100
*~
if (%world.curobjs(10000)% < 10) && (%random.10% <= 2)
  mload obj 10000
end
if (%world.curobjs(10003)% < 10) && (%random.10% <= 2)
  mload obj 10003
end
if (%world.curobjs(10007)% < 10) && (%random.10% <= 2)
  mload obj 10007
end
if (%world.curobjs(10014)% < 10) && (%random.10% <= 2)
  mload obj 10014
end
~
#10005
<100 Oldest sun killed>~
0 f 100
*~
if (%world.curobjs(10001)% < 10) && (%random.10% <= 2)
  mload obj 10001
end
if (%world.curobjs(10002)% < 10) && (%random.10% <= 2)
  mload obj 10002
end
if (%world.curobjs(10005)% < 10) && (%random.10% <= 2)
  mload obj 10005
end
~
#10006
<100 Medium sun killed>~
0 f 100
*~
if (%world.curobjs(10007)% < 10) && (%random.10% <= 2)
  mload obj 10007
end
if (%world.curobjs(10009)% < 10) && (%random.10% <= 2)
  mload obj 10009
end
if (%world.curobjs(10013)% < 10) && (%random.10% <= 2)
  mload obj 10013
end
~
#10007
<100 Youngest sun killed>~
0 f 100
*~
if (%world.curobjs(10012)% < 10) && (%random.10% <= 2)
  mload obj 10012
end
if (%world.curobjs(10015)% < 10) && (%random.10% <= 2)
  mload obj 10015
end
~
#10008
<100 Medium robber killed>~
0 f 100
*~
if     (%world.curobjs(10004)% < 20) && (%random.10% <= 2)
  mload obj 10004
elseif (%world.curobjs(10006)% < 20) && (%random.10% <= 2)
  mload obj 10006
end
if     (%world.curobjs(10010)% < 20) && (%random.10% <= 2)
  mload obj 10010
elseif (%world.curobjs(10011)% < 20) && (%random.10% <= 2)
  mload obj 10011
end
~
#10009
<100 Large robber killed>~
0 f 100
*~
if     (%world.curobjs(10016)% < 20) && (%random.10% <= 2)
  mload obj 10016
elseif (%world.curobjs(10017)% < 20) && (%random.10% <= 2)
  mload obj 10017
end
if     (%world.curobjs(10015)% < 20) && (%random.10% <= 2)
  mload obj 10015
elseif (%world.curobjs(10018)% < 20) && (%random.10% <= 2)
  mload obj 10018
end
~
#10010
<100 Ficht Solovei>~
0 k 20
~
mecho Соловей-разбойник так засвистел, что аж деревья согнулись!!!
msend       %actor% Жуткий свист на мгновение оглушил Вас!
mechoaround %actor% От свиста Соловьиного %actor.name% полетел%actor.g% на землю.
%actor.position(6)%
%actor.wait(2)%
mdamage %actor% 100
~
$~
