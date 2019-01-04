#27600
искать стог~
1 c 100
искать~
context 276
if (%arg%==стог) && (%actor.name%==%hero276%)
  osend %actor% Вы стали судорожно искать в стоге сена. Интересно что.
  oechoaround %actor% %actor.name% стал%actor.g% судорожно искать в стоге сена. Интересно что.
  oload obj 27609
  oforce %actor.name% взять пряжка
  calcuid mpast 27610 mob
  detach 27603 %mpast.id%
  detach 27600 %self.id%
else
  osend %actor% И где искать?
end
~
#27601
привземл~
0 q 100
~
wait 1
if %time.month% > 11 
  halt
end
if %time.month% < 3
  halt
end
if %world.curobjs(27610)%>0
  tell %actor.name% Привет добр человек, не будет ли у тебя пары минут?
  tell %actor.name% Я хочу попросить тебя кое о чем.
end
~
#27602
даземл~
0 d 0
да конечно yes~
wait 1
if %time.month% > 11 
  halt
end
if %time.month% < 3
  halt
end
wait 1
context 276
eval hero276 %actor.name%
if %exist.mob(27609)%
  calcuid z276 27609 mob
  remote hero276 %z276.id%
end
if %exist.mob(27613)%
  calcuid u276 27613 mob
  remote hero276 %u276.id%
end
if %exist.mob(27610)%
  calcuid p276 27610 mob
  attach 27603 %p276.id%
  remote hero276 %p276.id%
end
tell %actor.name% Спасибо, я немного займу твоего времени.
tell %actor.name% Ты наверное заметил, что крестьяне здесь работают на полях
tell %actor.name% просто до изнеможения.
tell %actor.name% И все это потому что работают руками, мотыгами.
tell %actor.name% А могли бы запрячь быка и сделать свое дело быстро.
tell %actor.name% Сходи к пастухам, спроси у них, могут ли они дать быка
tell %actor.name% крестьянам для работ.
detach 27601 %self.id%
detach 27602 %self.id%
~
#27603
привпастух~
0 q 100
~
wait 1
context 276
if (%actor.name% == %hero276%) && (%actor.realroom%==27645)
  wait 1
  tell %actor.name% Стой! Аккуратно, смотри под ноги!
  tell %actor.name% И вообще что ты тут делаешь, шляешься панимаешь.
  tell %actor.name% Что, что ты там бормочешь?
  tell %actor.name% Быка тебе надо? С ума сошел что ли.
  tell %actor.name% Ах, крестьянам помочь?
  tell %actor.name% Ну надо тогда подумать.
  wait 2
  дум
  wait 2
  tell %actor.name% Ну наверное найдем быка!
  tell %actor.name% Крестьянам помочь надо, навстречу пойти.
  tell %actor.name% Но помоги и ты мне, я где-то потерял пряжку от ремня.
  tell %actor.name% Теперь даже лошадь не запрячь. Найди, будь добр.
  tell %actor.name% Тогда и приходи.
  calcuid hobj 27608 obj
  attach 27600 %hobj.id%
  attach 27605 %self.id%
  remote hero276 %hobj.id%
  detach 27603 %self.id%
end
~
#27604
ресетзоны~
2 f 100
~
context 276
unset hero276
unset s276
unset u276
unset p276
unset z276
if %world.curobjs(27610)%>0
  calcuid hmob 27609 mob
  attach 27601 %hmob.id%
  attach 27602 %hmob.id%
  detach 27606 %hmob.id%
  calcuid hmob 27613 mob
  detach 27607 %hmob.id%
  calcuid mpast 27610 mob
  detach 27603 %mpast.id%
  detach 27605 %mpast.id%
  calcuid hobj 27608 obj
  detach 27600 %hobj.id%
else
  calcuid hmob 27609 mob
  dettach 27601 %hmob.id%
  dettach 27602 %hmob.id%
end
~
#27605
датьпряжкапастух~
0 j 100
~
context 276
wait 1
if (%object.vnum%!=27609)
  дать %object.name% %actor.name%
  tell %actor.name% Зачем мне это?
  halt
end
if (%object.vnum%==27609) && (%actor.name% != %hero276%)
  mpurge пряжка
  tell %actor.name% Спасибо за пряжку!
  tell %actor.name% Откуда ты знаешь что она моя? Я ТЕБЕ разве говорил об этом?
  гнева
  mkill %actor.name%
  detach 27605 %self.id%
  halt
end
if (%object.vnum%==27609) && (%actor.name% == %hero276%)
  mpurge пряжка
  tell %actor.name% То что надо, молодец!
  tell %actor.name% Подожди пару минут, я сбегаю спрошу насчет твоей просьбы.
  wait 1s
  tell %actor.name% Да быка можно взять, сообщи тому кто просил!
  tell %actor.name% И пусть будут аккуратны, быка надо поберечь для важных дел.
  tell %actor.name% Вон коров сколько.
  ухмы
  calcuid hmob 27609 mob
  attach 27606 %hmob.id%
  remote hero276 %hmob.id%
  detach 27605 %self.id%
end
~
#27606
получключземлемер~
0 q 100
~
wait 1
context 276
if %actor.name% == %hero276%
  wait 1
  tell %actor.name% Молодец! Ты выполнил мою просьбу, думаю все крестьяне
  tell %actor.name% будут тебе благодарны. Ну и я насколько это возможно.
  tell %actor.name% Вот возьми, чем богаты, тем и рады.
  %self.gold(+50)%
  дать 50 кун %actor.name%
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
    дать ключ %actor.name%
    calcuid hmob 27613 mob
    attach 27607 %hmob.id%
    remote hero276 %hmob.id%
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
context 276
if (%actor.name% == %hero276%) & (%actor.realroom%==27663)
  wait 1
  дать 150 кун %actor.name%
  г Добрый день!
  г Ты прошел, там больше нет этих гадких крыс?
  г Спасибо за освобождение!
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
  г Сколько дадите, то и продам.
  г Извиняюсь, что прошу деньги, но я только усталый торговец книгами.
  attach 27611 %self.id%
  calcuid hmob 27613 mob
  remote hero276 %hmob.id%
  detach 27605 %self.id%
end
~
#27608
убилсытого~
0 f 100
~
if (%world.curmobs(27614)%==1) && (%world.curobjs(27614)%==0)
  context 276
  set hero276 %actor.name%
  calcuid u276 27613 mob
  attach 27607 %u276.id%
  remote hero276 %u276.id%
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
if %world.curmobs(27614)%>0 && %world.curmobs(27617)%==0
  calcuid hmob 27614 mob
  opurge %hmob.name%
  oload mob 27617
  oechoaround %actor.name% Волк вдруг оскалился и напал на %actor.name%.
  osend %actor.name% Волк вдруг оскалился и напал на Вас.
end
~
#27611
деньгиусталому~
0 m 100
~
context 276
wait 1
switch %amount%
  if (%actor.name% == %hero276%) && (%actor.realroom%==27663)
    case 100
      if %world.curobjs(517)%==0
        mload obj 517
        дать пластина %actor.name%
      else
        г Знаешь, книга похоже пропала здесь в темноте или крысы унесли.
        взд
        дать 100 кун %actor.name%
      end
    break
    case 200
      if %world.curobjs(527)%==0
        mload obj 527
        дать книга %actor.name%
      else
        г Знаешь, книга похоже пропала здесь в темноте или крысы унесли.
        взд
        дать 200 кун %actor.name%
      end
    break
    case 400
      if %world.curobjs(518)%==0
        mload obj 518
        дать книга %actor.name%
      else
        г Знаешь, книга похоже пропала здесь в темноте или крысы унесли.
        взд
        дать 400 кун %actor.name%
      end
    break
    case 500
      if %world.curobjs(516)%==0
        mload obj 516
        дать береста %actor.name%
      else
        г Знаешь, книга похоже пропала здесь в темноте или крысы унесли.
        взд
        дать 500 кун %actor.name%
      end
    break
    case 1000
      if %world.curobjs(543)%==0
        mload obj 543
        дать книга %actor.name%
      else
        г Знаешь, книга похоже пропала здесь в темноте или крысы унесли.
        взд
        дать 1000 кун %actor.name%
      end
    break
    case 1500
      if %world.curobjs(500)%==0
        mload obj 500
        дать книга %actor.name%
      else
        г Знаешь, книга похоже пропала здесь в темноте или крысы унесли.
        взд
        дать 1500 кун %actor.name%
      end
    break
    case 2000
      if %world.curobjs(512)%==0
        mload obj 512
        дать книга %actor.name%
      else
        г Знаешь, книга похоже пропала здесь в темноте или крысы унесли.
        взд
        дать 2000 кун %actor.name%
      end
    break
    case 2500
      if %world.curobjs(538)%==0
        mload obj 538
        дать книга %actor.name%
      else
        г Знаешь, книга похоже пропала здесь в темноте или крысы унесли.
        взд
        дать 2500 кун %actor.name%
      end
    break
    case 5000
      if %world.curobjs(537)%==0
        mload obj 537
        дать свиток %actor.name%
      else
        г Знаешь, книга похоже пропала здесь в темноте или крысы унесли.
        взд
        дать 5000 кун %actor.name%
      end
    break
    default
      г Благодарствую.
      ухм
    break
  done
  г Все, я уношу поскорее отсюда ноги.
  calcuid hmob 27613 mob
  mpurge %hmob.name%
  detach 27611 %hmob.id%
else
  say Сумма не соответствует ни одной из книг.
  дать %amount% кун %actor.name%
end
~
#27612
изшерстиперчатки~
1 g 100
~
wait 1
if (%random.5%<2) && (%world.curobjs(27619)%<51
  osend %actor.name% Похоже, в детстве бабушка учила Вас обращаться с шерстью.
  osend %actor.name% Вы быстро скатали шерсть, потом сделали еще массу всяких
  osend %actor.name% манипуляций и связали теплые рукавицы.
  oload obj 27619
  oforce %actor.name% взять рукавицы
  calcuid hobj 27613 obj
  opurge %hobj.name%
else
  osend %actor.name% Вы попробовали связать рукавицы из шерсти, но только испортили ее.
  calcuid hobj 27613 obj
  opurge %hobj.name%
end
~
#27613
Помер землемер~
0 f 100
~
if %world.curobjs(542)% < 1
  if %random.100% < 41
    mload obj 542
  end
end
~
$~
