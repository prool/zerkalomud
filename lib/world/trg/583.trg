#58300
Тестовый триг комнаты 58304~
2 c 100
тест~
charuid char Купала
eval temp %char.dispel%
~
#58301
Тестовый триг объекта 58300~
1 c 2
соединить~
%echo% 1
~
#58302
Тестовый триг моба 58300~
0 j 100
~
%echo% 0 %object.val0%
%echo% 1 %object.val1%
%echo% 2 %object.val2%
%echo% 3 %object.val3%
~
#58303
Огненный пес (венок)~
1 ab 100
~
switch %world.curmobs(58301)%
  case 0
    %load% mob 58301
    %echo% _Большой огненный пес прибежал сюда. 
    %echo% _Большой огненный пес потерся об ногу Купалы. 
  break
  case 1
    calcuid doggy 58301 mob
    if (%self.room% != %doggy.realroom%)
      %echoaround% %doggy% _Большой огненный пес начал принюхиваться.
      %echoaround% %doggy% _Большой огненный пес завилял хвостом и куда-то убежал. 
      %purge% %doggy%
      %load% mob 58301
      %echo% _Большой огненный пес прибежал сюда. 
      %echo% _Большой огненный пес потерся об ногу Купалы. 
    else
      switch %random.80%
        case 1
          %echo% _Большой огненный пес сел и почесал лапой за ухом.
          %echo% _Большой огненный пес вскочил и завилял хвостом.
        break
        case 2
          eval rndchar %random.pc%
          if (%rndchar.canbeseen%)
            %send% %rndchar% _Большой огненный пес набросился на Вас!
            %echoaround% %rndchar% _Большой огненный пес набросился на %rndchar.vname%.
            %send% %rndchar% _Повалив Вас на лопатки, довольный огненный пес позволил Вам подняться.
            %echoaround% %rndchar% _Повалив %rndchar.vname% на лопатки, довольный огненный пес отошел в сторонку.
            %echoaround% %rndchar% _%rndchar.name% смог%rndchar.q% наконец подняться.
          end
        break
        case 3
          %echo% _Большой огненный пес прикатил откуда-то камушек весом в пять пудов.
          %echo% _Большой огненный пес начал играться с этим странным 'клубком'.
          %echo% _Сильно разыгравшись, пес случайно запустил камушек в небеса.
        break
        case 4
          %echo% _Большой огненный пес начал ловить себя за хвост, как бы не разнес тут все.
        break
        default
        break
      done
    end
  break
  default
    while (%world.curmobs(58301)% > 0)
      calcuid doggy 58301 mob
      %echoaround% %doggy% _Большой огненный пес начал принюхиваться. 
      %echoaround% %doggy% _Большой огненный пес заскулил и куда-то убежал. 
      %purge% %doggy%
    done
  break
done
~
#58304
Вкл-Выкл пса (венок)~
1 c 1
песик~
if (%arg.contains(вкл)%)
  attach 58303 %self.id%
  %echo% _Купала позвал кого-то пронзительным свистом.
  wait 1s
  %load% mob 58301
  %echo% _Большой огненный пес прибежал сюда. 
  %echo% _Большой огненный пес потерся о ногу Купалы.
end
if (%arg.contains(выкл)%)
  detach 58303 %self.id%
  while (%world.curmobs(58301)% > 0)
    calcuid doggy 58301 mob
    %echoaround% %doggy% _'Домой!' - строго приказал огненному псу Купала.
    %echoaround% %doggy% _Большой огненный пес заскулил и куда-то убежал. 
    %purge% %doggy%
  done
end
~
#58305
Одели (венок)~
1 j 100
~
if %actor.realroom%
  eval temp %actor.hitp(5555)% %actor.move(555)%
else
  %echo% Что-то зашуршало.
end
~
#58306
Управление клоном (венок)~
1 c 1
клон~
if (%arg.contains(выкл)%)
  if (%exist.mob(58302)%)
    calcuid kupal 58302 mob
    %echoaround% %kupal% Купала убежал за горизонт.
    %purge% %kupal%
  end
elseif (%arg.contains(тихо-)%)
  if (%exist.mob(58302)%)
    calcuid kupal 58302 mob
    %purge% %kupal%
  end
elseif (%arg.contains(вкл)%)
  if (!%exist.mob(58302)%)
    %load% mob 58302
    %echo% Купала прибежал из-за горизонта.
  end
elseif (%arg.contains(тихо+)%)
  if (!%exist.mob(58302)%)
    %load% mob 58302
  end
elseif (%arg.contains(сюда)%)
  if (%exist.mob(58302)%)
    calcuid kupal 58302 mob
    %echoaround% %kupal% Купала убежал за горизонт.
    %purge% %kupal%
  end
  %load% mob 58302
  %echo% Купала прибежал из-за горизонта.
elseif (%exist.mob(58302)%)
  calcuid kupal 58302 mob
  *%echo% команда: %arg%
  %force% %kupal% %arg%
end
~
#58307
Собираем инфо (венок)~
1 c 1
хп~
charuid victim %arg%
if ((!%victim.realroom%) || (!%exist.mob(58302)%))
  halt
end
calcuid klon 58302 mob
eval victinm %victim.iname%
eval victrnm %victim.rname%
while (%victinm.strlen% < 10)
  eval victinm %victinm%_
done
while (%victrnm.strlen% < 10)
  eval victrnm %victrnm%_
done
if (%victim.sex% == 1)
  eval victsex М
else
  eval victsex Ж
end
switch %victim.class%
  case 0
    eval victclass Лека
  break
  case 1
    eval victclass Колд
  break
  case 2
    eval victclass Тать
  break
  case 3
    eval victclass Батр
  break
  case 4
    eval victclass Наем
  break
  case 5
    eval victclass Друж
  break
  case 6
    eval victclass Кудс
  break
  case 7
    eval victclass Волш
  break
  case 8
    eval victclass Черн
  break
  case 9
    eval victclass Витя
  break
  case 10
    eval victclass Охот
  break
  case 11
    eval victclass Кузя
  break
  case 12
    eval victclass Купа
  break
  case 13
    eval victclass Волх
  break
done
if (%victim.clan% != null)
  eval victclan %victim.clan%
else
  eval victclan нет
end
if (%victclan.strlen% < 3)
  eval victclan _%victclan%
end
if (%victim.level% < 10)
  eval victlvl 0%victim.level%
else
  eval victlvl %victim.level%
end
eval victhp %victim.hitp%
eval victmhp %victim.maxhitp%
while (%victhp.strlen% < 4)
  eval victhp _%victhp%
done
while (%victmhp.strlen% < 4)
  eval victmhp _%victmhp%
done
%force% %klon% tell .Купала <> %victinm%|%victrnm%|%victlvl%|%victhp%|%victmhp%|%victsex%|%victclass%|%victclan%|%victim.realroom%
~
#58308
Приподнимаем шляпу (венок)~
1 c 1
шля~
if ((%cmd% != шля) && (%cmd% != шляп) && (%cmd% != шляпа))
  return 0
  halt
end
if (!%arg%)
  %echo% &KКупала вежливо приподнял свой %self.vname%&K.&n
else
  eval victim %arg%
  if ((%victim.iname%) && (%victim.level%) && (%victim.vnum% == -1))
    if (%victim.realroom% == %self.room%)
      %send% %victim% &KКупала вежливо приподнял свой %self.vname%&K перед Вами.&n
      %echoaround% %victim% &KКупала вежливо приподнял свой %self.vname%&K перед %victim.tname%.
    end
  end
end
~
#58309
Переключение умений-заклов-фитов (венок)~
1 c 1
чит~
if (%cmd% != чит)
  return 0
  halt
end
if (%arg.words% < 3)
  %send% %actor% Маловато аргументов, подумай.
  halt
end
switch %arg.words(1)%
  case -заклинание
    set swch clear
    set type spell
  break
  case +заклинание
    set swch set
    set type spell
  break
  case -способность
    set swch clear
    set type feat
  break
  case +способность
    set swch set
    set type feat
  break
  case -умение
    set swch clear
    set type skill
  break
  case +умение
    set swch set
    set type skill
  break
  default
    %send% %actor% Что-то криво командуешь, надо +-заклинание, +-умение или +-способность.
    halt
  break
done
eval vict %arg.words(2)%
if (%vict.vnum% != -1)
  %send% %actor% Цель не найдена, лучше прыгни к нему и пиши внимательнее.
  halt
end
%send% %actor% Пытаемся %swch% %type% %arg.words(3)% для %vict.rname%.
%echoaround% %actor% %actor.iname% прикрыл глаза.
%send% %vict.id% Волосы на Вашей голове зашевелились.
%echoaround% %vict.id% Голова %vict.rname% на миг оделась в электрическую сетку.
o%type%turn %vict.id% %arg.words(3)% %swch%
~
#58310
триг отладочного моба~
0 c 100
кам~
след .%actor.name%
dg_affect отлад зачарован подчинить_разум 1 10000
~
#58311
(m58310) Бубнеж~
0 b 30
~
*(m58310) Бубнеж : Mobiles : Random : 20
if %hero.name%
  halt
end
switch %random.5%
  case 1
    say ...где же...
  break
  case 2
    say ...как же так получилось...
  break
  case 3
    say ...вот ведь стряслось...
  break
  case 4
    say ...откуда такое...
  break
  case 5
    say ...за что ж...
  break
done
wait 1s
switch %random.5%
  case 1
    say ...надобно потушить...
  break
  case 2
    say ...помог бы кто...
  break
  case 3
    say ...и помочь то некому...
  break
  case 4
    say ...покуда не помер еще...
  break
  case 5
    say ...надо спешить...
  break
done
wait 1s
switch %random.5%
  case 1
    say ...нето беда...
  break
  case 2
    say ...иначе смерть...
  break
  case 3
    say ...без святого то огня...
  break
  case 4
    say ...главное успеть, пока...
  break
  case 5
    say ...вот же нечистая сила...
  break
done
~
#58312
(m58310) Реакция на речь~
0 d 0
помогу расскажи~
*(m58310) Реакция на речь : Mobiles : Speech : 0 : помогу расскажи
if (%actor.vnum% != -1)
  halt
end
*detach 58311 %self.id%
wait 3
if (%actor.getquest(2012%znum%)% == %time.year%)
  нет .%actor.name%
  tell %actor.name% Не могу я снова просить тебя помочь мне!
  tell %actor.name% Быть может, на следующий год...
  halt
end
if (%actor.level% < 20)
  нет .%actor.name%
  tell %actor.name% Мал%actor.g% ты еще чтобы помочь мне!
  tell %actor.name% Подрасти еще немного...
  halt
end
set hero %actor.id%
set quester %self.id%
set firesdown 0
set itemsup 0
global hero
global quester
global firesdown
global itemsup
set i %hero.name%
%echoaround% %actor% %self.iname% начал что-то рассказывать %actor.dname%...
tell %i% %ziname% нуждается в тебе!
tell %i% Обнаглела нынче нечисть лесная, подменила святой огонь,
tell %i% греющий и освещающий, на свой - проклятый, прожорливый,
tell %i% обжигающий и ослепляющий. Коли не поправить дело это,
tell %i% не пережить %zdname% зимы ближайшей.
tell %i% Дома погорят, болезни всякие придут на землю...
wait 3
tell %i% Надобно найти все огни в городе да потушить их, чтобы
tell %i% проклятье перестало действовать. Потом приходи ко мне,
tell %i% будем думать что далее делать.
attach 58321 %self.id%
exec 58321 %self.id%
calcuid here %self.realroom% room
attach 58313 %here.id%
remote znum %here.id%
remote norooms %here.id%
remote lastnum %here.id%
remote hero %here.id%
remote quester %here.id%
exec 58313 %here.id%
wait 2s
detach 58313 %here.id%
detach 58312 %self.id%
~
#58313
(t58312) Расставляем свечи~
2 z 100
~
*(t58312) Расставляем свечи : Rooms : Auto : 100
eval amount (%lastnum%-%norooms.words%)/10
remote amount %quester.id%
set n 0
while (%n% < %amount%)
  eval tnum %random.num(%lastnum%)%-1
  if %tnum% < 10
    set tnum 0%tnum%
  end
  while %norooms.contains(%tnum%)%
    eval tnum %random.num(%lastnum%)%-1
    if %tnum% < 10
      set tnum 0%tnum%
    end
  done
  set rnum %znum%%tnum%
  set norooms %norooms% %tnum%
  eval onum 58314+%random.3%
  wat %rnum% wload obj %onum%
  calcuid tobj %onum% obj
  remote hero %tobj.id%
  remote quester %tobj.id%
  eval n %n%+1
  *
  set light%n% %tobj.id%
  remote light%n% %quester.id%
  *
done
unset lastnum
unset norooms
unset znum
unset hero
unset quester
detach 58313 %self.id%
~
#58314
(m58310) Лоад старичка~
0 n 100
~
*(m58310) Лоад старичка : Mobiles : Load : 100
wait 3
set lroom %self.realroom%
eval znum %lroom%/100
switch %znum%
  case 40
    set ziname Лесная деревня
    set zdname лесной деревне
    set lastnum 72
    set norooms 58 59 65 66 67 68 69
  break
  case 50
    set ziname Речная деревня
    set zdname речной деревне
    set lastnum 55
    set norooms 55
  break
  case 60
    set ziname Степная деревня
    set zdname степной деревне
    set lastnum 54
    set norooms 50
  break
  case 70
    set ziname Погост Холуй
    set zdname погосту Холуй
    set lastnum 68
    set norooms 68
  break
  case 80
    set ziname Деревня Беличья падь
    set zdname деревне Беличья падь
    set lastnum 89
    set norooms 89
  break
  case 90
    set ziname Деревня Медвежья гора
    set zdname деревне Медвежья гора
    set lastnum 56
    set norooms 56
  break
  case 660
    set ziname Брянск
    set zdname Брянску
    set lastnum 94
    set norooms 94
  break
  case 600
    set ziname Великий Новгород
    set zdname Великому Новгороду
    set lastnum 92
    set norooms 39 40
  break
  case 182
    set ziname Владимир
    set zdname Владимиру
    set lastnum 76
    set norooms 16
  break
  case 636
    set ziname Вышгород
    set zdname Вышгороду
    set lastnum 75
    set norooms 56 57 58 59 60 61 62 63 64 65 66 67
  break
  case 344
    set ziname Галич
    set zdname Галичу
    set lastnum 64
    set norooms 64
  break
  case 135
    set ziname Искоростень
    set zdname Искоростеню
    set lastnum 97
    set norooms 97
  break
  case 499
    set ziname Стольный Киев
    set zdname Киеву
    set lastnum 98
    set norooms 98
  break
  case 270
    set ziname Корсунь
    set zdname Корсуни
    set lastnum 79
    set norooms 69 71 
  break
  case 630
    set ziname Курск
    set zdname Курску
    set lastnum 96
    set norooms 04 05 14 15 17 19 20 21 43 44 57 62 67 68 69 70 71 78 79 80 83 84 85 86 89
  break
  case 302
    set ziname Ладога
    set zdname Ладоге
    set lastnum 95
    set norooms 00 01 02 03 04 05 06 07 08 09 10 18 19 20 21 46 48 53 88 89 91
  break
  case 690
    set ziname Любеч
    set zdname Любечу
    set lastnum 99
    set norooms 00 02 06 12 14 20 42 43 47 54 55 56 57 59 60 62 86 93 97
  break
  case 770
    set ziname Меньск
    set zdname Меньску
    set lastnum 91
    set norooms 91
  break
  case 760
    set ziname Муром
    set zdname Мурому
    set lastnum 98
    set norooms 01 29 36
  break
  case 250
    set ziname Переяславль
    set zdname Переяславлю
    set lastnum 94
    set norooms 05 06 07 08 09 10 11 12 13 14 15 16 17 18 20 43 44 49 55 56 57 58 59 60 61
  break
  case 720
    set ziname Полоцк
    set zdname Полоцку
    set lastnum 58
    set norooms 00
  break
  case 750
    set ziname Псков
    set zdname Пскову
    set lastnum 99
    set norooms 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 52
  break
  case 640
    set ziname Путивль
    set zdname Путивлю
    set lastnum 71
    set norooms 00 43 52 58
  break
  case 350
    set ziname Русса
    set zdname Руссе
    set lastnum 72
    set norooms 45 47 48 49 50 51 52
  break
  case 730
    set ziname Рязань
    set zdname Рязани
    set lastnum 98
    set norooms 00 01 02 14 23 26 27 28 55 63 64 65 66 67
  break
  case 851
    set ziname Ростов
    set zdname Ростову
    set lastnum 97
    set norooms 73 76 79 81 94 95
  break
  case 602
    set ziname Тверь
    set zdname Твери
    set lastnum 97
    set norooms 16 85 87 92
  break
  case 240
    set ziname Торжок
    set zdname Торжку
    set lastnum 79
    set norooms 08 09 10
  break
  case 620
    set ziname Тотьма
    set zdname Тотьме
    set lastnum 95
    set norooms 54 59 73 74 76
  break
  case 324
    set ziname Туров
    set zdname Турову
    set lastnum 86
    set norooms 36 70 75 76
  break
  case 680
    set ziname Чернигов
    set zdname Чернигову
    set lastnum 95
    set norooms 01 12 44 82 92
  break
  default
    log Почему-то залоадился в %lroom%!
    detach 58314 %self%
  break
done
global ziname
global zdname
global znum
global lroom
global lastnum
global norooms
attach 58311 %self%
attach 58312 %self%
detach 58314 %self%
~
#58315
(o58315-17) Тушим огни~
1 c 4
потушить~
*(o58315-17) Тушим огни : Objects : Command : 4 : потушить
if (%actor% != %hero%)
  %send% %actor% Зачем Вам это?
  halt
end
if (!%arg.contains(огонь)% && !%arg.contains(капуст)%)
  %send% %actor% Чего тушить-то будем, капусту?
  halt
end
if %arg.contains(капуст)%
  %send% %actor% Огонька-то для этого тут явно маловато!
  log %actor.iname% пробует тушить капусту! :)
  halt
end
if !%self.effect(горит)%
  %send% %actor% Тушить то нечего! Или не на чем...
  halt
end
eval temp %self.effect(-горит)%
%send% %actor% Собравшись духом, Вы погасили проклятое пламя %self.rname%.
%echoaround% %actor% Сделав пару глубоких вдохов-выдохов, %actor.iname% погасил%actor.g% пламя %self.rname%.
eval firesdown %quester.global(firesdown)%+1
remote firesdown %quester.id%
if (%firesdown% >= %quester.global(amount)%)
  %echo% %self.iname% вдруг почернел%self.g% и обратил%self.u% в облачко сизого дыма.
  %send% %actor% Сизый дым медленно приблизился к Вам, стало трудно дышать.
  %echoaround% %actor% Сизый дым медленно приблизился к %actor.dname%, он%actor.g% стал%actor.g% задыхаться.
  %load% mob 58312
  calcuid cloud 58312 mob
  remote quester %cloud.id%
  remote cloud %quester.id%
  %force% %cloud.id% mkill %actor%
else
  wait 1s
  %echo% %self.iname% вдруг почернел%self.g% и обратил%self.u% в облачко сизого дыма.
end
%purge% %self%
~
#58316
(m58311-12) Смерть нежити~
0 f 100
~
*(m58311-12) Смерть нежити : Mobiles : Death : 100
switch %self.vnum%
  case 58312
    %echo% Рассеявшееся облако сизого дыма явило Вашему взору нечто волосатое!
    %load% mob 58311
    calcuid thing 58311 mob
    remote quester %thing.id%
    %echo% %thing.iname% взревела: 'Прокляну!'
    %force% %thing% mkill %actor%
  break
  case 58311
    attach 58317 %quester.id%
  break
  default
    halt
  break
done
~
#58317
(m58310) Вошли к старику~
0 q 100
~
*(m58310) Вошли к старику : Mobiles : Great PC : 100
if (%actor% != %hero%)
  halt
end
wait 3
улыб .%actor.name%
tell %hero.name% Я чувствую, что нежить больше нас не побеспокоит
tell %hero.name% Значит ты погасил%actor.g% все огни %zdname%...
tell %hero.name% Но ведь людям нет жизни без огня! Теперь нужно
tell %hero.name% добыть новый, священный огонь.
tell %hero.name% Мой дед говорил, что лишь огонь, добытый трением,
tell %hero.name% может сравниться по чистоте с небесным огнём.
tell %hero.name% Поищи-ка подходящие для этого инструменты: нужна
tell %hero.name% веревка и лучок, пара сухих дощечек и прочное
tell %hero.name% сверло. Ну и трут подходящий, конечно же!
calcuid here %self.realroom% room
attach 58318 %here.id%
remote znum %here.id%
remote norooms %here.id%
remote lastnum %here.id%
remote hero %here.id%
remote quester %here.id%
exec 58318 %here.id%
wait 2s
detach 58318 %here.id%
detach 58317 %self.id%
~
#58318
(t58317) Разбрасываем ингры~
2 z 100
~
*(t58317) Разбрасываем ингры : Rooms : Auto : 100
set list 58310 58311 58312 58312 58313 58314
set i 1
while (%i% <= 6)
  set vnum %list.words(%i%)%
  eval tnum %random.num(%lastnum%)%-1
  if %tnum% < 10
    set tnum 0%tnum%
  end
  while %norooms.contains(%tnum%)%
    eval tnum %random.num(%lastnum%)%-1
    if %tnum% < 10
      set tnum 0%tnum%
    end
  done
  set rnum %znum%%tnum%
  set norooms %norooms% %tnum%
  wat %rnum% wload obj %vnum%
  calcuid tobj %vnum% obj
  remote hero %tobj.id%
  remote quester %tobj.id%
  *
  set item%i% %tobj.id%
  remote item%i% %quester.id%
  *
  eval i %i%+1
done
unset lastnum
unset norooms
unset znum
unset hero
unset quester
detach 58318 %self.id%
~
#58319
(o58310-14) Берем ингр~
1 g 100
~
*(o58310-14) Берем ингр : Objects : Get : 100
if (%actor% != %hero%)
  if (%self.sex% == 2)
    %send% %actor% Взглянув повнимательнее на %self.vname%, Вы решили оставить её здесь.
  else 
    %send% %actor% Взглянув повнимательнее на %self.vname%, Вы решили оставить его здесь.
  end
  return 0
  halt
end
return 1
eval itemsup %quester.global(itemsup)%+1
set item%itemsup% %self.id%
remote itemsup %quester.id%
if (%itemsup% >= 6)
  %send% %actor% 'Вроде собрал%actor.g% всё что надо было,' - подумалось Вам.
  attach 58320 %quester.id%
else
  %send% %actor% Чтобы не забыть, Вы начали бубнить: 'Трут, веревка, лучок, сверло, доски.'
end
~
#58320
(m58310) Конец квеста~
0 q 100
~
*(m58310) Конец квеста : Mobiles : Great PC : 100
if ((%actor% != %hero%) || (%itemsup% < 6))
  halt
end
wait 3
detach 58321 %self.id%
tell %hero.name% Наконец то!
%send% %hero% %self.iname% начал торопливо осматривать инструменты, принесенные Вами.
while (%itemsup% > 0)
  set tobj %self.global(item%itemsup%)%
  %purge% %tobj.id%
  eval itemsup %itemsup%-1
done
wait 3
%send% %hero% Наконец, одобрительно кивнув, %self.iname% начал собирать какую-то хитрую конструкцию.
%echoaround% %hero% %self.iname% начал увлеченно возиться со всяким хламом.
%send% %hero% Всего через минуту, трут начал дымиться, а еще через две - &Yзагорелся&n!!!
%echoaround% %hero% %self.iname% сотворил &Wсвятой огонь&n!
%send% %hero% %self.iname% достал из-за пазухи небольшую медную лампу и засветил её.
%echoaround% %hero% %self.iname% засветил небольшую медную лампу.
wait 3
tell %hero.name% Вот и счастливый конец нашей истории, спасибо тебе, %hero.iname%!
%load% obj 10630
give all .%hero.name%
drop all
eval temp %hero.setquest(2012%znum% %time.year%)%
if (%self.realroom% != %lroom%)
  %echo% %self.iname% тихонько ушел отсюда.
  %teleport% %self% %lroom%
  %echo% %self.iname% тихонько бредет мимо Вас.
end
unset hero
unset quester
unset firesdown
unset itemsup
set n 1
while (%n% <= 10)
  unset item%n%
  unset light%n%
  eval n %n%+1
done
unset cloud
unset thing
wait 120s
attach 58311 %self.id%
attach 58312 %self.id%
detach 58320 %self.id%
~
#58321
(m58310) Старичок засекает время~
0 z 100
~
*(m58310) Старичок засекает время : Mobiles : Auto : 100
tell %hero.name% Только поторопись!
tell %hero.name% Уже через пять часов мне придется искать другого помощника
wait 600s
tell %hero.name% Твое время вышло!
if (%self.realroom% != %lroom%)
  %echo% %self.iname% тихонько ушел отсюда.
  %teleport% %self% %lroom%
  %echo% %self.iname% тихонько бредет мимо Вас.
end
unset hero
unset quester
unset firesdown
unset itemsup
set n 1
while (%n% <= 10)
  set titem %self.global(item%n%)%
  set tlight %self.global(light%n%)%
  unset item%n%
  unset light%n%
  if %titem.name%
    %purge% %titem%
  end
  if %tlight.name%
    %purge% %tlight%
  end
  eval n %n%+1
done
if (%cloud.name%)
  %force% %cloud% mecho %cloud.iname% вдруг куда-то пропало.
  %purge% %cloud%
end
if (%thing.name%)
  %force% %thing% mecho %thing.iname% вдруг куда-то пропала.
  %purge% %thing%
end
unset cloud
unset thing
attach 58311 %self.id%
attach 58312 %self.id%
detach 58317 %self.id%
detach 58320 %self.id%
detach 58321 %self.id%
~
$~
