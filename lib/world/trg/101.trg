#10100
<101 - Marja killed~
0 f 100
~
mload   obj 10111
calcuid Temnica 10125 room
attach  10108 %Temnica.id%
if (%world.curobjs(10101)% < 10) && (%random.1000% <= 50)
  mload obj 10101
end
if (%world.curobjs(10108)% < 10) && (%random.1000% <= 50)
  mload obj 10108
end
if (%world.curobjs(558)% == 0) && (%random.5% <= 1)
  mload obj 558
end
if (%world.curobjs(529)% == 0) && (%random.5% <= 1)
  mload obj 529
end
~
#10101
<101 - Darja killed~
0 f 100
~
if (%world.curobjs(10102)% < 10) && (%random.100% <= 5)
  mload obj 10102
end
if (%world.curobjs(10109)% < 10) && (%random.100% <= 5)
  mload obj 10109
end
~
#10102
<101 - Evdokia killed~
0 f 100
~
if (%world.curobjs(10103)% < 10) && (%random.100% <= 5)
  mload obj 10103
end
if (%world.curobjs(10105)% < 10) && (%random.100% <= 5)
  mload obj 10105
end
~
#10103
<101 - Old robber killed~
0 f 100
~
if (%world.curobjs(10110)% < 10) && (%random.100% <= 5)
  mload obj 10110
end
~
#10104
<101 - Young robber killed~
0 f 100
~
if (%world.curobjs(10004)% < 30) && (%random.100% <= 25)
  mload obj 10104
end
~
#10105
<101 - Nianika killed~
0 f 100
~
if (%world.curobjs(10104)% < 10) && (%random.100% <= 5)
  mload obj 10104
end
~
#10106
<101 - Petushok "Take diamond"~
2 c 0
вырвать выдрать выковырять достать~
if (%actor.vnum% != -1)
  halt
end
calcuid Petushok 10100 obj
if !%Petushok%
  halt
end
if !(%arg.contains(камень)%) && !(%arg.contains(самоцвет)%)
  halt
end
wait 1
wpurge резной.петушок
wload  mob 10101
wforce петушок attack %actor.name%
detach 10106 %self.id%
~
#10107
<101 - Petushok killed~
0 f 100
~
if %random.10% <= 2
  mload obj 10113
end
~
#10108
<101 - PC open door to temnica~
2 j 100
~
if %actor.vnum% != -1
  halt
end
set Hero %actor%
eval rV %random.1000%
wecho ----- %rV% ------
if %rV% < 901
  *90% на оба положительных исхода
  if %rV% < 451
    *делим на 2 ветки благополучный исход
    *1 ветка моб 1109
    wload mob 10109
    calcuid target 10109 mob
    attach 10110 %target%
    remote Hero %target%
  else
    *2 ветка моб 1108
    wload mob 10108
    calcuid target 10108 mob
    attach 10109 %target%
    remote Hero %target%
  end
end
wait 1
detach 10108 %self%
~
#10109
<101 - PC enter to temnica when Kniese Sun~
0 h 100
~
if %actor.id% != %Hero.id%
  halt
end
wait 1s
if !%self.fighting%
  mecho - Спасибо, что освободил%actor.g% меня, %actor.name%.
  if (%world.curobjs(10107)% < 10) && (%random.100% <= 25)
    mload obj 10107
    mecho - Вот, она досталась мне от деда, возьми ее.
    give  мурзамецкая.сабля %actor.name%
  else
    mechoaround %actor% Княжий сын дал груду монет %actor.dname%.
    msend       %actor% Княжий сын дал Вам 1000 монет.
    %actor.gold(+1000)%
  end
  calcuid knez101 10108 mob
  mpurge %knez101%
end
detach 10109 %self.id%
~
#10110
<101 - PC enter to temnica when Merchant~
0 h 100
~
if %actor.id% != %Hero.id%
  halt
end
wait 1s
if !%self.fighting%
  mecho - Спасибо, что освободил%actor.g% меня, %actor.name%.
  if (%world.curobjs(534)% < 10) && (%random.4% <= 1)
    mload obj 534
    mecho - Я хотел ее продать, но пусть это будет твоей наградой.
    give книг %actor.name%
  elseif (%random.1000% <= 100)
    say Возьми эту чекушку, ее ценность намного выше, чем кажется на первый взгляд.
    wait 1
    mload obj 103
    дать чекуш %actor.name%
  else
    mechoaround %actor% Заморский купец дал груду монет %actor.dname%.
    msend %actor% Заморский купец дал Вам 1000 монет.
    %actor.gold(+1000)%
  end
  calcuid merch101 10109 mob
  mpurge %merch101%
end
detach 10110 %self.id%
~
#10120
<101 - Zone reset~
2 f 100
~
calcuid room 10131 room
attach  10106 %room.id%
calcuid room1 10125 room
attach 10108 %room1%
~
$~
