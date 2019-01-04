#91500
спуститься~
2 c 1
спуститься~
if !(%arg.contains(осторожно)%) && !(%arg.contains(аккуратно)%)
wsend %actor% Вы начали спускаться по склону.
wechoaround %actor% %actor% %actor.name% начал спускаться.   
          wait 1s
          if (%random.5% < 3) 
          wsend %actor.name% Камень ушел из под Вашей ноги, и Вы упали, сильно ударившись головой.
          wechoaround %actor% %actor% %actor.name% оступился и полетел вниз.
          wteleport %actor.name% 91574
            wechoaround %actor% Кто-то упал сверху.
          wdamage %actor% %actor.hitp%
                  if (%random.5% == 1) 
                    wecho Горный орел прилетел на шум.
                  wait 3s
                  wat  91574 wload mob 91506
                  end
          else
          wsend %actor.name% Вы спустились на площадку.
          wteleport %actor.name% 91574
            wechoaround %actor% Кто-то спустился сверху.
                   if (%random.40% == 1) 
                    wecho __Горный орел прилетел на шум.
                  wait 1s
                    wload mob 91506
                  end
          end
else 
wsend %actor% Вы начали аккуратно спускатья по склону.
wechoaround %actor% %actor% %actor.name% начал аккуратно спускаться вниз.   
wait 1s
        if (%random.50% == 1) 
          wsend %actor.name% Камень ушел из под Вашей ноги, и Вы упали, сильно ударившись головой.
          wechoaround %actor% %actor% %actor.name% оступился и полетел вниз.
          wteleport %actor.name% 91574
            wechoaround %actor% Кто-то упал сверху.
          wdamage %actor% %actor.hitp%
                  if (%random.5% == 1) 
                    wecho __Горный орел прилетел на шум.
                  wait 3s
                    wload mob 91506
                  end
          else
          wsend %actor.name% Вы аккуратно спустились на площадку.
          wteleport %actor.name% 91574
            wechoaround %actor% Кто-то аккруатно спустился сверху.
          end
end
~
#91501
умер зеленый змей в налете~
0 f 100
*~
unset greendragonraid915
 if (%world.curobjs(91505)% < 2) && (%random.10% <= 4)
   mload obj 91505
end
if (%world.curobjs(91506)% < 2) && (%random.10% <= 4)
   mload obj 91506
end
if (%world.curobjs(91508)% < 2) && (%random.10% <= 4)
   mload obj 91508
end
~
#91502
Вылет зеленого змея~
2 z 100
~
*if (%random.500% == 1)
*wait 10s
  calcuid zelen 91502 mob
  attach 91503 %zelen.id%
  exec 91503 %zelen.id%
wait 5s
calcuid glashat 27017 mob
attach 91525 %glashat.id%
exec 91525 %glashat.id%
end
~
#91503
отсчет времени зеленого змея~
0 z 100
~
wait 1s
if (%random.4% != 1)
           mteleport моб_91502 27016
unset greendragonraid915
set greendragonraid915 1
worlds greendragonraid915
           else  
           mteleport моб_91502 91523 
           end
       mecho Черная тень закрыла небо и Вы услышали хлопанье гигантских крыльев.
      attach 91501 %self.id%
      attach 91505 %self.id%
    wait 1000s
    detach 91505 %self.id%
    detach 91501 %self.id%
attach 91504 %self.id%
exec 91504 %self.id%
~
#91504
возвращение зеленого змея~
0 z 100
~
wait 2s
mecho Зеленый змей передумал драться, взмыл вверх и улетел.
detach 91503 %self.id%
unset greendragonraid915
      mteleport моб_91502 91585
бро все.возвр
взя все.сунд
пол все 1.сунд
пол 1000 кун 1.сунд
пол все 2.сунд
пол 1000 кун 2.сунд
пол все 3.сунд
пол 1000 кун 3.сунд
бро все
     mteleport моб_91502 91583
calcuid grterror 91583 room
attach 91502 %grterror.id%
detach 91504 %self.id%
~
#91505
отступление зеленого змея~
0 k 100
~
if (%self.hitp% < 2000) && (%random.5% == 1)
attach 91504 %self.id%
exec 91504 %self.id%
detach 91505 %self.id%
detach 91501 %self.id%
end
~
#91506
умер белый змей в налете~
0 f 100
*~
unset whitedragonraid915
unset raid499
 if (%world.curobjs(91512)% < 2) && (%random.10% <= 2)
   mload obj 91512
end
if (%world.curobjs(91513)% < 2) && (%random.10% <= 2)
   mload obj 91513
end
if (%world.curobjs(91509)% < 2) && (%random.10% <= 2)
   mload obj 91509
end
~
#91507
Налет белого змея (начальный отсчет)~
2 ab 100
~
if %exist.mob(91501)%
calcuid white 91501 mob
if ((%random.4000% == 5) &&(%white.fighting% == 0)) 
unset execwhiteraid915
  attach 91508 %white.id%
  exec 91508 %white.id%
detach 91507 %self.id%
end
end
~
#91508
Налет белого змея (отсчет времени)~
0 z 100
~
%teleport% %self% 49908
      set whitedragonraid915 1
      worlds whitedragonraid915
      set raid499 1
      worlds raid499
%echo% Черная тень закрыла небо и Вы услышали хлопанье гигантских крыльев.
  attach 91506 %self.id%
  attach 91510 %self.id%
wait 1100s
    detach 91506 %self.id%
    detach 91510 %self.id%
attach 91509 %self.id%
exec 91509 %self.id%
~
#91509
возвращение белого змея~
0 ab 100
~
wait 1s
mecho Белый змей передумал драться, взмыл вверх и улетел.
detach 91508 %self.id%
   unset whitedragonraid915
   unset raid499
   %teleport% %self% 91579
бро все.возвр
взя все.сунд
пол все 1.сунд
пол 1000 кун 1.сунд
пол все 2.сунд
пол 1000 кун 2.сунд
пол все 3.сунд
пол 1000 кун 3.сунд
пол все 4.сунд
пол 1000 кун 4.сунд
бро все
   %teleport% %self% 91577
calcuid wtterror 91577 room
attach 91507 %wtterror.id%
detach 91509 %self.id%
~
#91510
отступление белого змея~
0 k 100
~
if (%self.hitp% < 2500) && (%random.6% == 1)
attach 91509 %self.id%
exec 91509 %self.id%
detach 91510 %self.id%
detach 91506 %self.id%
end
~
#91511
умер красный змей в налете~
0 f 100
*~
unset reddragonraid915
unset raid499
 if (%world.curobjs(91514)% < 2) && (%random.10% <= 2)
   mload obj 91514
end
if (%world.curobjs(91515)% < 2) && (%random.10% <= 2)
   mload obj 91515
end
if (%world.curobjs(91516)% < 2) && (%random.10% <= 2)
   mload obj 91516
end    
if (%world.curobjs(91510)% < 2) && (%random.10% <= 2)
   mload obj 91510
end
if ( %self.realroom% < 90000 ) && (%random.100% > 95 )
mload obj 91517
end
~
#91512
Налет красного змея (начальный отсчет)~
2 ab 100
~
if %exist.mob(91500)%
calcuid redz 91500 mob
if ((%random.3000% == 5) &&(%redz.fighting% == 0)) 
unset execredraid915
  attach 91513 %redz.id%
  exec 91513 %redz.id%
detach 91512 %redz.id%
end
end
~
#91513
Налет красного змея (отсчет времени)~
0 z 100
~
%teleport% %self% 49915
      set reddragonraid915 1
      worlds reddragonraid915
      set raid499 1
      worlds raid499
%echo% Черная тень закрыла небо и Вы услышали хлопанье гигантских крыльев.
      attach 91511 %self.id%
      attach 91515 %self.id%
wait 1200s
    detach 91515 %self.id%
    detach 91511 %self.id%
attach 91514 %self.id%
exec 91514 %self.id%
~
#91514
возвращение красного змея~
0 ab 100
~
wait 1s
mecho Красный змей передумал драться, взмыл вверх и улетел.
detach 91513 %self.id%
unset reddragonraid915
unset raid499
      %teleport% %self% 91582
бро все.возвр
взя все.сунд
пол все 1.сунд
пол 1000 кун 1.сунд
пол все 2.сунд
пол 1000 кун 2.сунд
пол все 3.сунд
пол 1000 кун 3.сунд
пол все 4.сунд
пол 1000 кун 4.сунд
пол все 5.сунд
пол 1000 кун 5.сунд
бро все
     %teleport% %self% 91580
calcuid grterror 91580 room
attach 91512 %grterror.id%
detach 91514 %self.id%
~
#91515
отступление красного змея~
0 k 100
~
if (%self.hitp% < 3000) && (%random.7% == 1)
attach 91514 %self.id%
exec 91514 %self.id%
detach 91515 %self.id%
detach 91511 %self.id%
end
~
#91518
антуражные взмахи когтями~
0 k 40
~
%echo%  \&rУдары когтей %self.rname% оставляют в воздухе кровавые росчерки.\&n
dg_cast 'огн поток' %actor.name%
dg_cast 'огн поток' %actor.name%
dg_cast 'огн поток' %actor.name%
~
#91519
Запуск набега зеленого змея~
2 c 100
набег зеленого змея~
*exec 91502 %world.room(91583)%
%echo% test
~
#91520
Запуск набега белого змея~
2 c 100
набег_белого_змея~
if (%raid499% == 1)
%echo% Набег уже идет.
else
set execwhiteraid915 1
worlds execwhiteraid915
%echo% Запускаем набег белого змея.
calcuid raidroom 91577 room
exec 91507 %raidroom.id%
end
~
#91521
Запуск набега красного змея~
2 c 100
набег_красного_змея~
if (%raid499% == 1)
%echo% Набег уже идет.
else
set execredraid915 1
worlds execredraid915
%echo% Запускаем набег красного змея.
calcuid raidroom 91580 room
exec 91512 %raidroom.id%
end
~
#91522
Сброс флага набега зеленого змея при лоаде~
0 n 100
~
unset greendragonraid915
~
#91523
Сброс флага набега белого змея при лоаде~
0 n 100
~
unset whitedragonraid915
~
#91524
Сброс флага набега красного змея при лоаде~
0 n 100
~
unset reddragonraid915
~
#91525
Глашатай орет о набеге змея~
0 b 12
~
calcuid snake 91502 mob
if ( %snake.realroom% < 80000 ) && %snake%
mshou Горожане!!! Спасайтесь! Зеленый дракон напал на наш маленький городишко!
wait 1
mshou Где княжеская дружина!!! За что мы Киеву дань платим?!
wait 3
mshou Водярой не откупимся, а девки все замуж повыскакивали - спасайся кто может!!!
else
detach 91525 %self.id%
end
~
#91526
Баттл триггер красного змея~
0 k 30
~
set target %random.pc%
if %target%
dg_cast 'огн поток' %target.name%
dg_cast 'огн поток' %target.name%
dg_cast 'огн поток' %target.name%
end
~
#91530
дышка черного змея~
0 n 100
~
set dir 0
calcuid room %self.realroom% room
switch %random.6%
case 1
set dir %room.north%
set napr north
break
case 2
set dir %room.east%
set napr east
break
case 3
set dir %room.south%
set napr south
break
case 4
set dir %room.west%
set napr west
break
case 5
set dir %room.up%
set napr up
break
default
set dir %room.down%
set napr down
break
done
if %dir%
mecho Шквал черного пламени промчался мимо Вас!
%napr%
wait 2
set target %random.pc%
if %target%
mkill %target%
end
wait 7s
mpurge %self%
else
calcuid zmey 91510 mob
if %zmey.fighting%
set target %zmey.fighting%
mkill %target%
wait 3s
end
wait 2
mpurge %self%
end
~
#91531
Получение целей для пентания~
0 r 25
~
wait 1
context 915
if %target1%
set target2 %actor%
worlds target2
elseif %target2%
set target3 %actor%
worlds target3
elseif %target3%
set target4 %actor%
worlds target4
elseif %target4%
set target5 %actor%
worlds target5
else %target2%
set target1 %actor%
worlds target1
end
~
#91532
лоад черного змея~
0 n 100
~
wait 1
mload obj 91533
wait 1
wear чешуя
wait 1s
detach 91532 %self.id%
~
#91533
бой змея черного - применение дышки~
0 ab 100
~
context 915
вст
взя все все.тру
if %self.fighting% && %random.pc% 
set target %random.pc%
dg_cast 'звук волн' %target%
dg_cast 'масс страх' %target%
mecho &rИспепеляющий все на своем пути поток пламени вырвался из пастей двухголового черного змея!&n
mload mob 91512
mload mob 91512
elseif %self.realroom% < 90000  
mecho &rИспепеляющий все на своем пути поток пламени вырвался из пастей двухголового черного змея!&n
mload mob 91512
mload mob 91512
end
if %random.100% <= 14
switch %random.5%
case 1
if %target1%
cast !portal! %target1.name%
end
break
case 2
if %target1%
cast !portal! %target2.name%
end
break
case 3
if %target3%
cast !portal! %target3.name%
end
break
case 4
if %target4%
cast !portal! %target4.name%
end
break
case 5
if %target5%
cast !portal! %target5.name%
end
break
done
end
~
#91534
таймер набега двухголового черного змея~
0 z 100
~
mecho Двухголовый черный змей выдохнул пламя, и полетел к выходу из пещеры.
mteleport моб_91510 49927
mecho Огромная черная тень закрыла небо!
calcuid nabl 49907 mob
attach 91535 %nabl.id%
set i 0
wait 100s
while %i% < 20
if !%self.fighting%
set return %self.realroom%
mteleport моб_91510 91590
бро все.черно
бро все.бутыл
бро все.напито
бро все.пузыре
бро все.возвр
бро все.ден
полож все 5.сундук_91500
полож все 4.сундук_91500
полож все 3.сундук_91500
полож все 2.сундук_91500
полож все 1.сундук_91500
mteleport моб_91510 %return%
end
wait 50s
eval i %i%+1
done
mteleport моб_91510 91590
поло все 1.сундук_91500
поло все 2.сундук_91500
поло все 3.сундук_91500
поло все 4.сундук_91500
поло все 5.сундук_91500
mteleport моб_91510 91589
~
#91535
кричим о змее!!~
0 b 20
~
calcuid blacksnake 91510 mob
if %blacksnake.realroom% < 90000 & %blacksnake%
mshou Вижу зарево багровое и дымы в небе!
wait 2s
mshou Крылья черные веют над нами - змей огненный явился зорить земли Русские!
mshou Где же вы, витязи хоробрые? Зовет вас сам князь Киевский стольный град оборонить от беды лютой!
else
detach 91535 %self.id%
end
~
#91536
Награда за убийство черного змея~
0 z 100
~
if %object.vnum% == 91522
чел
wait 1
say Ну вы герои! Убили аж самого черного змея!
say Возьмите эту вещь в награду! Из моих личных сокровищ!
%self.gold(+10000)%
wait 1
say  Ну и 10000 кун от города. 
дать  10000 кун %actor.name%
mpurge %object%
switch %actor.class%
case 2
case 4
mload obj 91523
break
case 6
case 8
mload obj 91526
break
case 5
case 10
mload obj 91521
break
case 3
case 11
mload obj 91524
break
case 7
case 12
mload obj 91525
break
case 1
case 13
mload obj 91527
break
default
mload obj 91525
break
done
wait 1s
дать все %actor.name%
end
~
#91537
умер черный змей  в набеге~
0 f 100
~
if %self.realroom% < 90000
mload obj 91522
end
~
#91538
Рандом набега черного змИя!~
2 ab 100
~
if %world.curmobs(91510)%
calcuid blaksnake 91510 mob
end
wait 2s
if %blacksnake.realroom% < 90000
halt
elseif %random.4000% == 1
if %blacksnake.realroom% > 91575
east
north
пол все сундук
пол все 2.сундук
пол все 3.сундук
пол все 4.сундук
end
exec 91534 %blacksnake.id%
end
~
#91539
Лоад чешуи черного змея~
0 n 100
~
mload obj 91533
wait 1
одеть чешуя
~
#91540
Блокируем использование чешуи~
1 gj 100
~
if %actor.vnum% != 91510
osend %actor% Ишь, чего удумали! Да в эту чешую сотню таких как вы завернуть можно!
return 0
halt
end
~
#91541
Лоад красных змеев~
2 f 100
~
*TRIG 91541 Лоад красного змея и змеенышей
wload mob 91503
wload mob 91503
wload mob 91503
wload mob 91500
attach 91542 %self.id%
detach 91541 %self.id%
~
#91542
Восстановление популяции красных змеев :-)~
2 f 100
~
*если все змеи истреблены детачиим триггер
*до ребута красные змеи не появятся
if !%exist.mob(91503)% && !%exist.mob(91500)%
detach 91542 %self.id%
halt
end
if !%number%
set number 0
end
eval number %number%+1
global number
if %number% < 48
halt
end
eval number 1
global number
*если большой змей убит, но маленькие живы - лоадим большого змея )
if %exist.mob(91503)% && !%exist.mob(91500)%
wpurge little_red_snake915
wecho _Маленький красный змееныш вдруг резко дернулся.
wecho _Шкура и крылья сползли с него и он резко увеличился в размерах!
wecho _Двухголовый красный змей предстал перед Вами!
wload mob 91500
halt
end
*если перебиты змееныши, но жив большой змей - змееныши вылупляются заново
if !%exist.mob(91503)% && %exist.mob(91500)%
wecho _Лежащее среди камней змеиное яйцо вдруг покачнулось и треснуло.
wecho _Маленький красный змееныш выполз из осколков скорлупы.
wload mob 91503
wait 3s
wecho _Лежащее среди камней змеиное яйцо вдруг покачнулось и треснуло.
wecho _Маленький красный змееныш выполз из осколков скорлупы.
wload mob 91503
wait 3s
wecho _Лежащее среди камней змеиное яйцо вдруг покачнулось и треснуло.
wecho _Маленький красный змееныш выполз из осколков скорлупы.
wload mob 91503
end
~
#91543
Загрузка белых змеев~
2 f 100
~
*TRIG 91543 Лоад белого змея и змеенышей
wload mob 91504
wload mob 91504
wload mob 91504
wload mob 91501
attach 91544 %self.id%
detach 91543 %self.id%
~
#91544
Восстановление популяции белых змеев~
2 f 100
~
*если все змеи истреблены детачиим триггер
*до ребута белые змеи не появятся
if !%exist.mob(91504)% && !%exist.mob(91501)%
detach 91544 %self.id%
halt
end
if !%number%
set number 0
end
eval number %number%+1
global number
if %number% < 24
halt
end
eval number 1
global number
*если большой змей убит, но маленькие живы - лоадим большого змея )
if %exist.mob(91504)% && !%exist.mob(91501)%
wpurge little_white_snake915
wecho _Маленький белый змееныш вдруг резко дернулся.
wecho _Шкура и крылья сползли с него и он резко увеличился в размерах!
wecho _Двухголовый белый змей предстал перед Вами!
wload mob 91501
halt
end
*если перебиты змееныши, но жив большой змей - змееныши вылупляются заново
if !%exist.mob(91504)% && %exist.mob(91501)%
wecho _Лежащее среди камней змеиное яйцо вдруг покачнулось и треснуло.
wecho _Маленький белый змееныш выполз из осколков скорлупы.
wload mob 91504
wait 2s
wecho _Лежащее среди камней змеиное яйцо вдруг покачнулось и треснуло.
wecho _Маленький белый змееныш выполз из осколков скорлупы.
wload mob 91504
wait 2s
wecho _Лежащее среди камней змеиное яйцо вдруг покачнулось и треснуло.
wecho _Маленький белый змееныш выполз из осколков скорлупы.
wload mob 91504
end
~
#91545
Загрузка зеленых змеев~
2 f 100
~
*TRIG 91545 Лоад зеленого змея и змеенышей
wload mob 91505
wload mob 91505
wload mob 91505
wload mob 91502
attach 91546 %self.id%
detach 91545 %self.id%
~
#91546
Восстановление популяции зеленых змеев~
2 f 100
~
*если все змеи истреблены детачим триггер
*до ребута зеленые змеи не появятся
if !%exist.mob(91505)% && !%exist.mob(91502)%
detach 91546 %self.id%
halt
end
if !%number%
set number 0
end
eval number %number%+1
global number
if %number% < 12
halt
end
eval number 1
global number
*если большой змей убит, но маленькие живы - лоадим большого змея )
if %exist.mob(91505)% && !%exist.mob(91502)%
wpurge little_green_snake915
wecho _Маленький белый змееныш вдруг резко дернулся.
wecho _Шкура и крылья сползли с него и он резко увеличился в размерах!
wecho _Двухголовый зеленый змей предстал перед Вами!
wload mob 91502
halt
end
*если перебиты змееныши, но жив большой змей - змееныши вылупляются заново
if !%exist.mob(91505)% && %exist.mob(91502)%
wecho _Лежащее среди камней змеиное яйцо вдруг покачнулось и треснуло.
wecho _Маленький зеленый змееныш выполз из осколков скорлупы.
wload mob 91505
wait 2s
wecho _Лежащее среди камней змеиное яйцо вдруг покачнулось и треснуло.
wecho _Маленький зеленый змееныш выполз из осколков скорлупы.
wload mob 91505
wait 2s
wecho _Лежащее среди камней змеиное яйцо вдруг покачнулось и треснуло.
wecho _Маленький зеленый змееныш выполз из осколков скорлупы.
wload mob 91505
end
~
$~
