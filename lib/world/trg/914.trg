#91400
умер болотный дух~
0 f 100
~
if (%world.curobjs(91408)% < 4) && (%random.8% == 1)
   mload obj 91408
end
~
#91401
умерла паучиха~
0 f 100
~
if (%world.curobjs(91413)% < 4) && (%random.9% == 1)
   mload obj 91413
end
if (%random.10% == 1)
mload obj 590
end
~
#91402
умер тигр~
0 f 100
~
if (%world.curobjs(91411)% < 21) && (%random.11% == 1)
   mload obj 91411
end
~
#91403
умер медведь~
0 f 100
~
if (%world.curobjs(91414)% < 5) && (%random.14% == 1)
   mload obj 91414
end
~
#91404
умер дикобраз~
0 f 100
~
if (%world.curobjs(91415)% < 15) && (%random.6% == 1)
   mload obj 91415
end
~
#91405
умер болотник~
0 f 100
~
if (%world.curobjs(91416)% == 0) 
   mload obj 91416
end
if %world.curobjs(1280)% < 1 && %world.curobjs(1281)% < 1 && %random.100% < 3
mload obj 1280
end
~
#91406
умер болотный дух2~
0 f 100
~
if (%world.curobjs(91408)% < 4) && (%random.20% == 1)
   mload obj 91408
end
~
#91407
умер большой паук~
0 f 100
~
if (%world.curobjs(91422)% < 10) && (%random.18% == 1)
   mload obj 91422
end
~
#91408
нырнуть дыра~
2 c 1
нырнуть~
if !(%arg.contains(дыра)%)
wsend %actor% Куда это Вы хотите нырнуть???
return 0
halt
else
if %actor.fighting%
wsend %actor% Вы не можете нырнуть пока сражаетесь.
end
wsend %actor% Вы нырнули в болото и начали  протискиваться в дыру.
wechoaround %actor% %actor.name%, нырнул в болото.
wait 1s
if %random.3% == 1
wteleport невиданное_91433 91421
end
wsend %actor.name% .- Похоже Вы проплыли под островом...
wteleport %actor.name% 91421
wat 91421 wechoaround %actor% Кто-то вынырнул из болота.
%actor.wait(2)%
end
~
#91409
Вошел к великанше~
0 q 100
~
mecho _Великанша посмотрела на Вас и зловеще улыбнулась.
  wait 1s
say Еще один герой пришел
say Ну говори, что тебе надобно
attach 91410 %self.id%
detach 91409 %self.id%
~
#91410
Сказал великанше что надо~
0 d 1
ключ знак гранитный символ~
wait 1s
mecho _Великанша достала из кармана гранитный символ и показала его Вам.
wait 1s
say Этот что ли?
mload obj 91400
say И почему его все ищут?
wait 1s
mecho _Великанша задумалась
wait 2s
say Ладно, мне ета фиговина надобности, отдам ее если поможешь
wait 1s
say Тут какие-то грызуны утащили ключ у меня, а без него я сундук открыть не могу
say Ломать неохота, жалко, а вещи из него могут иной раз и потребоваться
wait 1s
вздох
say А у меня нет времени за этими мелкими тварями гоняться
say Принесешь ключ - и поменяемся.
attach 91411 %self.id%
detach 91410 %self.id%
~
#91411
дали ключ великанше~
0 j 100
~
if %object.vnum% == 91401 then
wait 2s
  mecho _Великанша внимательно осмотрела ключ
wait 1s
  say Надо же. Тот самый. 
wait 1s
  say Эх... Договор есть договор...
  дать знак %actor.name%
  say А красивая безделушка была
wait 1s
mecho _Великанша вздохнула и отвернулась к костру.
calcuid znak 91401 obj
mpurge %znak.name%
detach 91411 %self.id%
else
wait 1s
  say Ты обмануть меня хотел!!!
wait 2s
 mkill %actor.name%
 detach 91411 %self.id%
end
~
#91412
репоп триггеров~
2 f 100
~
calcuid velik 91412 mob
detach 91409 %velik.id%
detach 91410 %velik.id%
detach 91411 %velik.id%
attach 91409 %velik.id%
calcuid strazh 91400 mob
detach 91413 %strazh.id%
detach 91414 %strazh.id%
attach 91413 %strazh.id%
wdoor 91497 east purge
~
#91413
Вошел к гранитному стражу~
0 q 100
~
wait 1s
mecho _Огромная гранитная глыба перед вами зашевелилась.
wait 1s
say Приветствую Вас!
say Давно никто не приходил сюда с этой стороны прохода
wait 1s
say С другой стороы недавно проходил один молодец
say Вы его часом не встречали?
wait 2s
mecho _Страж пошевелился и пристально посмотрел на вас.
say Похоже что не встречался - тот еще пройдоха
say Я его поначалу за богатыря принял, а он ворюгой обыкновенным оказался
say Схватил символ, открывающий путь и сбежал...
wait 1s
say А без него открыть проход невозможно.
wait 3s
say Хотя погоди, он семью великанов тут искал, что в Древнем лесу живут
say И коли вы его не встречали наверное к ним на обед как раз и пришел
wait 1s
say Если хочешь %actor.name% сходи поищи, может символ у них
say Они не такие уж и злые, если хорошо попросить, может сразу и не съедят
wait 1s
say Если принесешь символ, я проход открою.
attach 91414 %self.id%
detach 91413 %self.id%
~
#91414
дал гранитный символ стражу~
0 j 100
~
if %object.vnum% == 91400 then
wait 1s
msend %actor% Вы показали гранитный символ Стражу.
wait 1s
say Да, это он
wait 1s
say Приготовься, сейчас я открою проход
wait 2s
  mecho Гладкая стена медленно растворилась.
  mecho Резко изменивший направление ветер подхватил Вас и понес вперед.
mdoor 91497 east room 91550
wait 1s
  mteleport all 91550 
detach 91414 %self.id%
else
  wait 2s
  say Нет, этим я проход открыть не смогу
  wait 1s
  say Принеси что-нибудь другое
бро все
mjunk all
end
~
#91415
триггер паука ловчего~
0 q 100
~
mecho _Паук спрыгнул с паутины и бросился на Вас.
mkill %actor.name%
wait 14s
mechoaround %actor.name% Паук вдруг прыгнул на %actor.vname%, схватил %actor.vname% передними лапами, и убежал в лес
msend %actor.name% Паук вдруг прыгнул на Вас и укусил.
msend %actor.name% Вы потеряли сознание.
mteleport %actor.name% 91457
mteleport моб_91418 91456
detach 91415 %self.id%
~
#91416
смерть великанши~
0 f 100
~
if (%world.curobjs(91400)% == 0)
mload obj 91400
end
~
#91496
фризтриггер остановки времени~
1 c 4
*~
if %actor.name% == %caster.name%
oforce %actor% %cmd%
else
halt
end
~
#91497
таймер остановки времени~
1 hi 100
~
set caster %actor%
remote caster %self.id%
attach 91496 %self.id%
if %victim%
log &r%actor.name% использовал%actor.g% &WОСТАНОВКУ ВРЕМЕНИ&r на %victim.name%!&g
else
log &r %actor.name% использовал%actor.g% &WОСТАНОВКУ ВРЕМЕНИ&r в комнате %caster.realroom%!&g
end
wait 30s
opurge %self%
~
#91498
дополнение к 91499~
1 c 1
заюзать~
*calcuid nabeg 91583 room
*exec 91502 %nabeg.id%
*calcuid glashat 27017 mob
*attach 91425 %glashat.id%
calcuid blakraid 91510 mob
exec 91534 %blakraid.id%
~
#91499
тригг чешуи Триглава~
0 c 1
читинг~
if %cmd% == читинг
%arg%
end
~
$~
