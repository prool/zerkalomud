#77600
стафРК~
1 ghijlt 100
~
wait 1
if (%actor.clan% == рк ) || (%actor.vnum% == 77601 )
  halt
end
wait 1
%purge% %self%
~
#77601
получаемскакуна~
1 c 2
прочитать~
if %actor.clan% != рк
  wait 1
  opurge %self%
  halt
end
if %arg.contains(ленточка)%
  osend %actor% _Вы начали читать руны на ленточке...
  oechoaround %actor% _%actor.iname% начал%actor.g% шепотом читать серебренные руны на ленточке...
  if %world.curmobs(77609)% > 30
    osend %actor% _И ничего не произошло.
    halt
  end
  oload mob 77609 
  wait 1
  opurge %self%
end 
~
#77602
прогнатьскакуна~
0 c 1
топ~
if (%actor.clan%)!=рк
  msend %actor% _\&RСкакун не захотел видеть Вас своим хозяином...
  halt
else
  mechoaround %actor% _\&G%actor.iname% резко потянул поводья и жеребец грустно заржал !!!\&w
  msend %actor% _\&WЖеребец грустно заржал попрощавшись с Вами !!!
  mload obj 77630
  дать лент %actor.name%
  wait 1
  mpurge %self%
  halt
end
~
#77603
волкрычитнанеприятеля~
0 r 100
~
wait 1
if %actor.clan% != рк
  эмоц оскалился и зарычал
  ск вериня Врррррраги!!! %actor.name%!
  ск ветерек Врррррраги!!!  %actor.name%!
  ск громадар Врррррраги!!! %actor.name%!
  ск Клифф Врррррраги!!! %actor.name%!
else
  эмоц завилял хвостом.
end
~
#77604
выдача ключа~
0 d 3
ключ~
wait 1s
вздох
wait 2s
if (%world.curobjs(77629)% < 10)
  mecho Бкладовщик достал из кармана бронзовый ключик.
  wait 2s
  say  Возьми его, он долго пылился тут без дела.
  mload obj 77629
  wait 2s
  дат бронз %actor.name%
end
~
#77605
богатырьвпускаетнаарену~
0 d 8
готов~
wait 1s
mecho Богатырь Нисон открыл заборчик и сказал:'Удачи'
mechoaround %actor% Богатырь Нисон пропустил %actor.dname% на арену.
wait 2
wsend %actor% ... Вы прошли на территорию арены.
mteleport %actor% 77632
wechoaround %actor% Кто-то вошел на арену и оказался здесь.
end
~
#77606
вопросарена~
0 r 100
~
wait 1s
г Привет воин!
wait 1s
г Готов%actor.g% ли ты проверить свою силушку и сразиться на арене?
~
#77607
возвратсарены~
2 c 100
перепрыгнуть~
if !(%arg.contains(заборчик)%) 
  wsend %actor% Что вы хотите перепрыгнуть?
  return 0
  halt
end
wsend %actor% Разбежавшись, вы прыгнули через заборчик.
wechoaround %actor% Разбежавшись, %actor.name% перепрыгнул%actor.g% через заборчик.
wait 1s
wsend %actor% ... Вы оказались с другой стороны заборчика.
wteleport %actor% 77631
wechoaround %actor% Кто-то перепрыгнул заборчик и оказался здесь.
~
#77608
Команды волка~
0 d 1
встать сесть~
wait 1
if (%actor% != %self.leader%)
  msend %actor% Волк сумрачно посмотрел на Вас, оскалился и зарычал.
  mechoaround %actor% Волк сумрачно посмотрел на %actor.vname%, оскалился и зарычал.
  halt
end
if %speech% == встать
  stand
else
  rest
end
~
#77609
Загрузка волка~
1 c 2
подбросить~
wait 1
if !%arg.contains(клубок)%
  osend %actor% Что бросить хотите?
  halt
end
if %actor.clan% != рк
  osend %actor% Вы подбросили клубок черной шерсти в воздух, но ничего не произошло.
  halt
end
if %world.curmobs(77611)% > 50
  osend %actor% ...и ничего не произошло!
  halt
end
oload mob 77611
osend %actor% Вы подбросили клубок черной шерсти.
oechoaround %actor% %actor.name% подбросил%actor.g% в воздух клубок черной шерсти.
oecho Клубок черной шерсти исчез в яркой вспышке.
oecho Громадный черный волк возник здесь!
oforce %actor% оседлать волк
wait 1
opurge %self%
~
#77610
Почесать волка~
0 c 1
почесать~
wait 1
if %self.fighting%
  halt
end
if !%arg.contains(волка)%
  msend %actor% _Кого вы хотите почесать?
  halt
end
if ((%actor.clan% != рк) || (%self.leader% && (%self.leader% != %actor%)))
  msend %actor%  вы попытались прикоснутсья к волку.
  msend %actor%  Волк грозно зарычал и лязгнул зубами!
  mechoaround %actor% %actor.name% попытал%actor.u% прикоснуться к волку.
  mechoaround %actor%  Волк едва не откусил %actor.dname% руку!
  eval dmg %actor.hitp%/5
  mdamage %actor% %dmg%
  halt
end
msend %actor% Вы почесали волка за ухом.
mechoaround %actor% %actor.name% почесал%actor.g% волка за ухом.
mload obj 77635
mecho Волк резко уменьшился и превратисля в невзрачный клубок черной шерсти.
give клубок .%actor.name%
wait 1
mpurge %self%
~
#77611
Волк убит~
0 f 100
~
mload obj 77635
~
$~
