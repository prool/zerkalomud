* BRusMUD trigger file v1.0
#13000
black_wolf_killed~
0 f0 100
~
mload obj 13014


~
#13001
grey_wolf_killed~
0 f0 100
~
if (%world.curobjs(13001)% < 5) && (%random.100% < 15)
  mload obj 13001
end









~
#13002
wolf_dying_in_day~
0 f0 100
~
if (%random.100% < 30)
   mat 13099 mpurge большой.серый.волк
end







~
#13003
охотнику дали объект~
0 j0 100
~
if %object.vnum% == 13000 then
  wait 8
  say Добрая шкура доброго зверя.
  wait 8
  say Ныне редко встретишь столь редкий материал.
  wait 8
  say Поглядим, что я смогу сделать.
  wait 8
  mecho Старый охотник принялся раскраивать шкуру на куски и сшивать их вместе.
  calcuid var 13000 obj
  mpurge %var.name%
  wait 5 sc
 if (%world.curobjs(13002)% < 10) && (%random.100% < 20) then
   mload obj 13002
   say Вот, добрые вышли сапоги, в них тебя никакой зверь не учует.
   wait 5
   дат шкур.черн.волк %actor.name%
 elseif (%world.curobjs(13003)% < 15) && (%random.100% < 40) then
   mload obj 13003
   say Вот эта вещь позволит твоим движениям быть более слаженными.
   wait 5
   дат шкур.черн.волк %actor.name%
 elseif (%world.curobjs(13004)% < 10) && (%random.100% < 20) then
   mload obj 13004
   say В этих перчатках удары твои будут точны.
   wait 5
   дат шкур.черн.волк %actor.name%
 elseif (%world.curobjs(13005)% < 10) && (%random.100% < 20) then
   mload obj 13005
   say Хех, это все, что осталось.
   wait 5
   ул
   wait 5
   say Но зато эта вещь хранит в себе силу зверя, шкуру которого ты принес%actor.q%.
   wait 5
   дат хвост.волк %actor.name%
 else
   say К сожалению, на этот раз у меня ничего не получилось.
   wait 8
   say Не швея же я в конце концов.
 end
end


if %object.vnum% == 13015 then
  wait 8
  calcuid var 13015 obj
  mpurge %var.name%
  say Мда... Тяжело небось было?.. Такую тяжесть тащить-то.
  wait 8
  say Ну что ж, вот, прими за труды.
  wait 8
  дат 400 кун %actor.name%
  wait 4 s
  say Да! Чуть не забыл. Вот это мне досталось от прежнего хозяина.
  wait 8
  say Уж я и ума не приложу, что это да для чего.
  wait 8
  mload obj 13012
  drop ключ
end


~
#13004
load hunter~
0 n0 100
~
if (%world.curobjs(13010)% < 10) && (%random.100% < 20)
     mload obj 13010
     wear перч.лучн
end

if (%world.curobjs(13009)% < 4) && (%random.100% < 5)
     mload obj 13009
     воор лук
end







~
#13005
take key~
1 g0 100
~
if %actor.str% > 20 then
  wait 1
  oechoaround %actor% %actor.name% удовлетворенно сжал%actor.g% ключ в руке и лишь ржавая пыль посыпалась сквозь пальцы...
  osend %actor% Вы переусердствовали, столь хрупкая вещь не выдержала приложенных к ней усилий.
  osend %actor% Вы сломали ржавый ключ.
  opurge ржавый.ключ
end

if %actor.dex% < 20 then
  wait 1
  oechoaround %actor% %actor.name% неловко ухватил%actor.g% ключ рукой, и он сломался... Упссс!
  osend %actor% Вам стоит тренироваться... Жонглировать мечами, ходить по канату...
  osend %actor% Вы сломали ржавый ключ.
  opurge ржавый.ключ
end





~
#13006
load black wolf corpse~
1 n0 100
~
wait 1
opurge труп.огромного.волка


~
#13007
расчленение трупа волка~
1 c0 4
освежевать~
if %actor.vnum% != -1
  halt
end

if !%arg.contains(труп)% && !%arg.contains(волка)%
  return 0
  halt
end

if %actor.class% != 11
  osend %actor% Усомнившись в остроте своих орудий труда, Вы отказались от сей сомнительной затеи.
  halt
end

wait 1
oload obj  13015
oechoaround %actor% Как заправский мясник, %actor.name% принял%actor.u% разделывать труп волка.
osend %actor% Вы выбрали предмет поострее и отделили голову волка от туловища.
if (%world.curobjs(13000)% < 5) && (%random.100% < 50)
  wait 8
  oload obj 13000
  osend %actor% Продолжая начатое, Вы сняли с трупа волка шкуру.
end
opurge труп.огромного.волка

~
$
$
