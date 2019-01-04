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
$~
