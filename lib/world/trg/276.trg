#27600
искать стог~
1 c 100
искать~
if (%actor% == %hero276%)
  if (%arg% == стог)
    osend %actor% Вы стали судорожно искать в стоге сена. Интересно что.
    oechoaround %actor% %actor.name% стал%actor.g% судорожно искать в стоге сена. Интересно что.
    oload obj 27609
    oforce %actor% взять пряжка
    calcuid mpast 27610 mob
    detach 27603 %mpast.id%
    detach 27600 %self.id%
  else
    osend %actor% И где искать?
  end
else
  osend %actor% Что искать то собрались?
end
~
#27601
привземл~
0 q 100
~
wait 1
if (%weather.season% == зима)
  halt
end
if (%world.curobjs(27610)% > 0)
  tell %actor.name% Привет, добр человек, не будет ли у тебя пары минут?
  tell %actor.name% Я хочу попросить тебя кое о чем.
end
~
#27602
даземл~
0 d 0
да конечно yes~
wait 1
if (%weather.season% == зима)
  halt
end
wait 1
eval hero276 %actor%
global hero276
if %exist.mob(27613)%
  calcuid ustal 27613 mob
  remote hero276 %ustal.id%
end
if %exist.mob(27610)%
  calcuid pastuh 27610 mob
  attach 27603 %pastuh.id%
  remote hero276 %pastuh.id%
end
tell %actor.name% Спасибо, я немного займу твоего времени.
tell %actor.name% Ты наверное заметил, что крестьяне здесь
tell %actor.name% работают на полях просто до изнеможения.
tell %actor.name% И все это потому что работают руками, мотыгами.
tell %actor.name% А могли бы запрячь быка и сделать свое дело быстро.
tell %actor.name% Сходи к пастухам, спроси у них, могут ли они
tell %actor.name% дать быка крестьянам для работ.
detach 27601 %self.id%
detach 27602 %self.id%
~
#27603
привпастух~
0 q 100
~
wait 1
if (%actor% == %hero276%) && (%actor.realroom% == 27645)
  wait 1
  tell %actor.name% Стой! Аккуратно, смотри под ноги!
  tell %actor.name% И вообще, что ты тут делаешь, шляешься панимаешь.
  %send% %actor% Растерявшись, Вы наспех рассказали о проблемах крестьян.
  %echoaround% %actor% Растерявшись, %actor.iname% наспех рассказал%actor.g% о проблемах крестьян.
  tell %actor.name% Что, что ты там бормочешь?
  tell %actor.name% Быка тебе надо? С ума сош%actor.y% что ли.
  tell %actor.name% Ах, крестьянам помочь?
  tell %actor.name% Ну, надо тогда подумать.
  wait 2
  дум
  wait 2
  tell %actor.name% Ну, наверное, найдем быка!
  tell %actor.name% Крестьянам помочь надо, навстречу пойти.
  tell %actor.name% Но помоги и ты мне, я где-то потерял пряжку от ремня.
  tell %actor.name% Теперь даже лошадь не запрячь. Найди, будь добр%actor.g%.
  tell %actor.name% Тогда и приходи.
  calcuid stog 27608 obj
  attach 27600 %stog.id%
  remote hero276 %stog.id%
  attach 27605 %self.id%
  detach 27603 %self.id%
end
~
#27604
ресетзоны~
2 f 100
~
if (%world.curobjs(27610)% > 0)
  calcuid zemlem 27609 mob
  attach 27601 %zemlem.id%
  attach 27602 %zemlem.id%
  detach 27606 %zemlem.id%
  calcuid ustav 27613 mob
  detach 27607 %ustav.id%
  calcuid mpast 27610 mob
  detach 27603 %mpast.id%
  detach 27605 %mpast.id%
  calcuid ovca 27608 obj
  detach 27600 %ovca.id%
else
  calcuid zemlem 27609 mob
  dettach 27601 %zemlem.id%
  dettach 27602 %zemlem.id%
end
~
#27605
датьпряжкапастух~
0 j 100
~
wait 1
if (%object.vnum% != 27609)
  tell %actor.name% Зачем мне это?
  return 0
  halt
end
if (%actor% != %hero276%)
  mpurge %object%
  tell %actor.name% Спасибо за пряжку!
  tell %actor.name% Откуда ты знаешь что она моя? Я ТЕБЕ разве говорил об этом?
  гнева
  mkill %actor%
  detach 27605 %self.id%
  halt
else
  mpurge %object%
  tell %actor.name% То что надо, молодец!
  tell %actor.name% Подожди пару минут, я сбегаю спрошу насчет твоей просьбы.
  wait 1s
  tell %actor.name% Да быка можно взять, сообщи тому кто просил!
  tell %actor.name% И пусть будут аккуратны, быка надо поберечь для важных дел.
  tell %actor.name% Вон коров сколько.
  ухмы
  calcuid zemlem 27609 mob
  attach 27606 %zemlem.id%
  remote hero276 %zemlem.id%
  detach 27605 %self.id%
end
~
#27606
получключземлемер~
0 q 100
~
wait 1
if (%actor% == %hero276%)
  wait 1
  tell %actor.name% Молодец! Ты выполнил мою просьбу, думаю все крестьяне
  tell %actor.name% будут тебе благодарны. Ну и я, насколько это возможно.
  tell %actor.name% Вот возьми, чем богаты, тем и рады.
  %send% %actor% %self.iname% дал Вам немного кун.
  eval temp %actor.gold(+50)%
  wait 1
  if %world.curobj(27614)%==0
    дум
    tell %actor.name% Раз ты смог помочь один раз помоги уж и второй.
    tell %actor.name% Не подумай что мы тут все такие назойливые, но есть проблема.
    tell %actor.name% Здесь у поля давно была выкопана землянка крестьянами.
    tell %actor.name% Там они хранили зерно перед посадками, свои инструменты.
    tell %actor.name% Но теперь туда ходить стало опасно, поселились странные
    tell %actor.name% создания, крысы, но большие и говорят человеческим языком.
    tell %actor.name% Мы тут подумали что это перевертыши какие.
    wait 1
    tell %actor.name% В общем, вот тебе ключ, сходи, посмотри что там.
    tell %actor.name% Ну а если тоже боишься, и не ходи, тебя никто не осудит.
    tell %actor.name% Туда опытные воины с городища ходили и не вернулись.
    mload obj 27614
    дать ключ .%actor.name%
    calcuid ustav 27613 mob
    attach 27607 %ustav.id%
    remote hero276 %ustav.id%
    грусть
  end
  detach 27606 %self.id%
end
~
#27607
встречусталый~
0 q 100
~
wait 1
if (%actor% == %hero276%) && (%actor.realroom% == 27663)
  wait 1
  г Добрый день!
  г Ты прош%actor.y%, там больше нет этих гадких крыс?
  г Спасибо за освобождение!
  дать 150 кун .%actor.name%
  г Я тут книгами приторговываю, вот сюда на ночь залез,
  г не знал, что тут такие монстры гуляют.
  г Но могу Вам предложить свой товар.
  г Сегодня у меня с собой:
  if %world.curobjs(517)%==0
    г 100  кун : ледяное прикосновение
  end
  if %world.curobjs(516)%==0
    г 500  кун : молчание
  end
  if %world.curobjs(512)%==0
    г 2000 кун : полет
  end
  if %world.curobjs(527)%==0
    г 200  кун : серьезное исцеление
  end
  if %world.curobjs(518)%==0
    г 400  кун : слабость
  end
  if %world.curobjs(538)%==0
    г 2500 кун : страх
  end
  if %world.curobjs(500)%==0
    г 1500 кун : кислота
  end
  if %world.curobjs(543)%==0
    г 1000 кун : серьезный вред
  end
  if %world.curobjs(537)%==0
    г 5000 кун : развеять магию
  end
  г Сколько дашь кун, такую книгу и получишь.
  г Извиняюсь, что прошу деньги, но я только усталый торговец книгами.
  attach 27611 %self.id%
  detach 27605 %self.id%
end
~
#27608
убилсытого~
0 f 100
~
if (%world.curmobs(27614)% == 1) 88 (%world.curobjs(27614)% == 0)
  if (%actor.vnum% == -1)
    set hero276 %actor%
  else
    set hero276 %actor.leader%
  end
  calcuid ustav 27613 mob
  attach 27607 %ustav.id%
  remote hero276 %ustav.id%
  mload obj 27614
end
~
#27609
убилбольшую~
0 f 100
~
if (%world.curobjs(535)%==0) && (%random.5%==1)
  mload obj 535
end
~
#27610
взкости~
1 g 100
~
if (%world.curmobs(27614)% > 0) && (%world.curmobs(27617)% == 0)
  calcuid volk 27614 mob
  opurge %volk%
  oload mob 27617
  oechoaround %actor% Волк вдруг оскалился и напал на %actor.vname%.
  osend %actor% Волк вдруг оскалился и напал на Вас.
end
~
#27611
деньгиусталому~
0 m 100
~
wait 1
if (%actor% != %hero276%) || (%actor.realroom% != 27663)
  halt
end
switch %amount%
  case 100
    set bvnum 517
  break
  case 200
    set bvnum 527
  break
  case 400
    set bvnum 518
  break
  case 500
    set bvnum 516
  break
  case 1000
    set bvnum 543
  break
  case 1500
    set bvnum 500
  break
  case 2000
    set bvnum 512
  break
  case 2500
    set bvnum 538
  break
  case 5000
    set bvnum 537
  break
  default
    say Сумма не соответствует ни одной из книг.
    дать %amount% кун .%actor.name%
    halt
  break
done
if (%world.curobjs(%bvnum%)% == 0)
  mload obj %bvnum%
  give all .%actor.name%
else
  г Знаешь, книга похоже пропала здесь в темноте, или крысы унесли.
  дать %amount% кун .%actor.name%
  взд
  halt
end
г Все, я уношу поскорее отсюда ноги.
%echo% %self.iname% выбежал из землянки.
mpurge %self%
~
#27612
изшерстиперчатки~
1 g 100
~
wait 1
if (%random.5% < 2) && (%world.curobjs(27619)% <= %world.maxobj(27619)%)
  osend %actor.name% Похоже, в детстве бабушка учила Вас обращаться с шерстью.
  osend %actor.name% Вы быстро скатали шерсть, потом сделали еще массу всяких
  osend %actor.name% манипуляций и связали теплые рукавицы.
  oload obj 27619
  oforce %actor% взять рукавицы
else
  osend %actor% Вы попробовали связать рукавицы из шерсти, но только испортили ее.
end
calcuid hobj 27613 obj
opurge %hobj%
~
#27613
Помер землемер~
0 f 100
~
if (%world.curobjs(542)% < 1) && (%random.100% < 41)
  mload obj 542
end
~
$~
