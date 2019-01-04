#61600
триггер колоды~
1 c 4
перевернуть~
if (%arg% == колоду)
  osend %actor% Вы поднатужились и перевернули колоду...
  oechoaround %actor% %actor.iname% поднатужил%actor.u% и перевернуло колоду.
  eval number %random.7%
  switch %number%
    case 7
      wait 1
      oecho Там, где лежала колода, Вы увидели несколько монет!
      oload obj 61602
    break
    case 6
    break
    case 5
    break
    default
      oload mob 61600
      wait 1
      osend %actor% Огромная змея выскочила из-под колоды и бросилась на Вас!
      oechoaround %actor% Огромная змея выскочила из-под колоды и бросилась на %actor.vname%!
      oforce змея убить %actor.iname%
    done 
    oecho Колода тяжело ударилась о землю и рассыпалась в щепу. 
    opurge %self.iname%
  end
~
#61601
триггер завала~
2 c 0
перелезть~
if (%arg% == завал)
  wsend %actor% Вы принялись карабкаться через завал.
  wsend %actor% Вы благополучно его преодолели.
  if (%self.vnum% == 61609)
    wteleport %actor% 61610
  else
    wteleport %actor% 61609
  end
  wechoaround %actor% %actor.iname% спрыгнул%actor.g% рядом с вами с завала.
  wecho %actor.iname% полез%actor.q% через завал и скрылся из виду
else
  wsend %actor% Куда вы лезете-то?
end
~
#61602
триггер резного посоха~
1 g 100
~
return 0
if ((%world.curmobs(61602)% == 0) && (%actor.id% == %questor616.id%))
  oload mob 61602
  oecho Неупокоенный дух явился посреди комнаты!
  oecho Неупокоенный дух взревел: "Ты осмелился нарушить мой покой?!! Так умри же!!!"
  calcuid ghost 61602 mob
  oforce  %ghost% убить %actor.iname%
else
  osend %actor% Вы протянули руку к посоху, но так и не решились к нему прикоснуться.
end
~
#61603
триггер костерка~
1 g 100
~
return 0
if (%actor.hitp% > 30)
  odamage %actor% 30
else
  odamage %actor% %actor.hitp%
end
osend %actor% Вы сдуру сунули руку в костер  - это действительно БОЛЬНО!!!
oechoaround %actor% %actor.iname% сунул%actor.g% руку в костер и взвыл%actor.g% от боли.
~
#61604
триггер железного ключа~
1 g 100
~
if (%actor.id% == %questor616.id%)
  oecho Налетевший порыв ветра внезапно развернул повешенного к вам лицом
  oecho Мороз прошел по вашей коже.
  detach 61604 %self.id%
else
  return 0
  osend %actor% "Зачем он мне?" - подумали вы и оставили ключ лежать на полу. 
end
~
#61605
триггер сокровищницы~
2 e 100
~
calcuid horror 61648 room
attach 61614 %horror.id%
exec 61614 %horror.id%
detach 61605 %self.id%
~
#61606
триггер неупокоенного духа~
0 f 100
~
return 0
calcuid posoh 61614 obj
detach 61602 %posoh.id%
mecho С протяжным воплем неупокоенный дух растворился во тьме.
~
#61607
триггер сундука~
1 c 4
отодвинуть~
if (%arg% == сундук)
  oechoaround %actor% %actor.iname%, побагровев от натуги, отодвинул%actor.g% сундук от стены. 
  osend %actor% Вы с трудом отодвинули тяжелый сундук в сторону.
  oecho Под сундуком в полу открылся спуск вниз.
  odoor 61647 d room 61687
  detach 61607 %self.id%
end
~
#61608
триггер ловушки в сокровищнице~
2 c 0
перепрыгнуть~
if (%arg% == плиту)
  wsend %actor% Вы разбежались и прыгнули изо всех сил, едва не разбив голову о свод коридора.
  wechoaround %actor% %actor.iname% разбежал%actor.u% и прыгнул%actor.g% вглубь коридора.
  if (%self.vnum% == 61689)
    wteleport %actor% 61691
  else
    wteleport %actor% 61689
  end
  wechoaround %actor% %actor.iname%  вылетел%actor.g% из темноты и тяжело упал%actor.g% рядом с вами.
else
  wsend %actor% Куды прыгаем?
end
~
#61609
триггер воренка~
0 q 100
~
say А ты кто таков?!
say Чего тебе здесь надо?!!
~
#61610
триггер мудреца (приветствие)~
0 r 100
~
if ((%world.gameobjs(61615)% == 0) || (%world.gameobjs(61614)% == 0))
  halt
end
wait 1
msend %actor% Мудрец пристально посмотрел на Вас.
msend %actor% - Поздорову, %actor.name%! - сказал мудрец.
if !%questor616%
  msend %actor% - Зачем пожаловал? Хочешь спросить, отчего заброшена эта крепость?
  msend %actor% - Или же хочешь помочь мне? 
  attach 61611 %self.id%
  attach 61612 %self.id%
end
~
#61611
второй триггер мудреца (выдача истории)~
0 d 0
спросить~
msend %actor% Мудрец сказал:
msend %actor% "Что ж, слушай... Давным-давно явился в эти края откуда-то с севера славный
msend %actor% вождь Хельгрим со дружиной. Захотел он осесть тут, выстроить крепостицу
msend %actor% врагам на страх, добрым людям в защиту... Да не знал он - место, где задумали
msend %actor% крепость ставить не из простых было. Глубоко под землей лежит здесь тайное 
msend %actor% капище Змея Волоса. Когда лишь начали возводить стены - пришел к князю волхв
msend %actor% Велеса да сказал: "Не надо, княже, строить тут. Не будет добра" Но сколь не испрашивал
msend %actor% его Хельгрим - ничего боле не сказал волхв - и не послушал его князь. Когда же стали 
msend %actor% ставить терем - снова пришел волхв и пригрозил проклятием... Вспыльчив был вождь - 
msend %actor% приказал он схватить волхва, а дознавшись о капище - казнил его на алтаре, сказавши:
msend %actor% "Не тягаться Змею с Перуном, как шкуре твоей с мечом справедливым!". Да только сбылось
msend %actor% проклятие-то... Хоть и храбры да справедливы были потомки Хельгрима - а все ж все жадны
msend %actor% были до серебра и злата - так наказал их Змей. Вот и последний из князей возжаждав
msend %actor% великого богатства принес жертву темному духу, чье капище сыскал сам в лесах на севере...
msend %actor% Да видно слишком страшную цену запросил тот дух  - и замыслил князь  нарушить 
msend %actor% уговор... Отнял тогда дух разум его - и в ослепленьи зарубил князь жену свою и дочь и
msend %actor% побратима, что тщился остановить его, тоже не пощадил. Придя же в себя и увидев,
msend %actor% что сотворило с ним сребролюбие, сам наложил на себя руки... С тех пор и пуста эта 
msend %actor% крепость - все бежали отсюда в страхе..." - мудрец смолк и глубоко задумался о чем-то. 
~
#61612
триггер мудреца (выдача квеста)~
0 d 0
помочь~
wait 1
if  %actor.vnum%  !=  -1
  halt
end
if (%actor.id% == %questor616.id%)
  say Я и так вот жду, когда ты мне поможешь, как обещано...
  halt
end
if %questor616% 
  if %questor616.sex% == 1
    say  Взялся уже помочь мне один добрый молодец - %questor616.name%.
    say Ушел он и сгинул - не иначе как не по силам оказался ему этот подвиг...
    halt
  else
    say  Взялась уже помочь мне одна добрая девица  - %questor616.name%.
    say Ушла она и сгинула - не иначе как не по силам оказался ей этот подвиг...
    halt
  end
end
makeuid questor616 %actor.id%
global  questor616
msend %actor% Мудрец сказал:
msend %actor% "Хорошо... Слушай...  Узнав о беде, пришел в эти края черный ведун - из тех,
msend %actor% что силам темным служит... Наложил он проклятие на крепость и выпустил
msend %actor% на свет нечисть непотребную - добрым людям в погибель. Даже если убить
msend %actor% его - проклятие не исчезнет... Лишь я могу его снять, но для этого мне нужны
msend %actor% две святыни здешних князей - посох из ветви священного дуба и железный
msend %actor% коготь змея-волоса, который он потерял в битве с Перуном.
msend %actor% Посох положили на крышку гроба первого князя,  похороненного в подземельях крепости,
msend %actor% а коготь хранился в сокровищнице, тайный ход в которую начинается где-то в княжьих 
msend %actor% покоях. Ключ же от нее князь всегда держал при себе.
msend %actor% Принеси мне их, и я щедро вознагражу тебя!" 
wait 1
msend %actor% Мудрец сделал несколько пассов. Вы почувствовали волну тепла прошедшую по Вашей коже.
dg_cast 'защита от тьм' %actor.name% 
calcuid stick 61614 obj
remote questor616 %stick.id%
calcuid key 61617 obj 
remote questor616 %key.id%
attach 61613 %self.id%
detach 61610 %self.id%
~
#61613
триггер мудреца (оплата квеста)~
0 j 100
~
if  (!(%object.vnum% == 61615) && !(%object.vnum% == 61614))
  say Зачем мне это?
  return 0
  halt
end
wait 1
if  (%actor.id% == %questor616.id%)
  if  !(%quest616_objects%  == ok)
    eval quest616_objects ok
    global quest616_objects
    wait 1
    if  (%object.vnum% == 61614)
      say Очень хорошо, но еще мне нужен железный коготь... 
    elseif  (%object.vnum% == 61615)
      say Очень хорошо, но еще мне нужен резной посох первого князя...
    end
    вопр %actor.name%
    mpurge %object%
    halt
  end
  wait 2
  say О! Ты выполнил мою просьбу!
  say Что ж... Вот и твоя награда... 
  eval chanse %random.100%
  if     ( %chanse% < 3) && (%world.curobjs(61618)% < 7)
    mload obj 61618
    дать самоцвет %actor.name%
  elseif  %chanse% < 10
    mload obj 583
    дать слово %actor.name%
  elseif %chanse% < 20
    mload obj 61613
    дать брас %actor.name%
  elseif (%chanse% < 35) && (%world.curobjs(61623)% < 20)
    mload obj 61623
    дать перстень %actor.name%
  else
    msend %actor% Старик вручил вам увесистый кошель.
    mechoaround %actor% Мудрец вручил %actor.dname% увесистый кошель.
    %actor.gold(+500)%
  end
  unset %quest616_objects%
  detach 61612 %self.id%
  detach 61611 %self.id%
  mpurge %object%
  detach 61613 %self.id%
  halt
end
wait 1
say О! Спасибо! 
улыб
цел %actor.name%
%actor.gold(+5000)%
~
#61614
загрузка стража сокровищницы~
2 z 100
~
calcuid corp 61605 obj
wpurge %corp% 
wload mob 61628
calcuid knez 61628 mob
wteleport %knez%  61647
detach 61614 %self.id%
~
#61615
триггер ожившего мертвеца~
0 h 100
~
mecho Мертвец прохрипел: "Воры... И после смерти нет мне покоя!"
detach 61615 %self.id%
~
#61616
очистка переменных квеста~
2 f 100
~
calcuid questor 61601 mob
calcuid treasor 61692 room
attach 61605 %treasor.id%
rdelete questor616 %treasor.id%
if %questor%
  attach  61610      %questor.id%
  detach  61611      %questor.id%
  detach  61612     %questor.id%
  detach  61613      %questor.id%
  rdelete questor616 %questor.id%
  unset questor616
end
calcuid stick1 61614 obj
calcuid claw1 61615 obj
calcuid key1 61617 obj
if %stick1%
  attach 61619 %stick1.id% 
  exec 61619 %stick1.id%
end
if %claw1%
  attach 61619 %claw1.id% 
  exec 61619 %claw1.id%
end
if %key1%
  attach 61619 %key1.id% 
  exec 61619 %key1.id%
end
calcuid room1 61666 room
calcuid room2 61692 room
calcuid room3 61648 room
attach 61621 %room1.id%
attach 61621 %room2.id%
attach 61621 %room3.id%
exec 61621 %room1.id%
exec 61621 %room2.id%
exec 61621 %room3.id%
wdoor 61647 down purge
~
#61617
триггер старого слуги~
0 q 10
~
say Где же он.. неужели я его потерял?
say Нет... Точно украли... Воры проклятые!..
рыда
msend %actor% Старик с надеждой посмотрел на Вас.
say Помоги мне, %actor.iname%, сделай доброе дело...
~
#61618
второй триггер старого слуги~
0 j 100
~
return 1
if  (%object.vnum% == 61619)
  wait 1
  say Ох, спасибо, %actor.iname% !
  рад
  say Возьми вот... не отказывайся, уважь старика.
  if (%actor.level% < 15)
    msend %actor% Старик дал вам немного денег.
    mechoaround %actor% Старик дал %actor.dname% немного денег.
    %actor.gold(+400)%
  else
    mload obj 103
    дать водк %actor.name%
  end
  detach 61617 %self.id%
  mpurge %object%
end
~
#61619
триггер квестовых предметов~
1 z 0
~
opurge %self.name%
~
#61620
триггер голодного упыря~
0 q 75
~
mechoaround %actor% Упырь уставился на %actor.vname%. 
msend %actor% Упырь посмотрел прямо на Вас!
mecho Упырь заорал: "СВЕЖЕЕ МЯСО!!!"
kill .%actor.name%
~
#61621
загрузка квестовых предметов~
2 z 0
~
if (%self.vnum% == 61666)
  wload obj 61614
elseif (%self.vnum% == 61648)
  wload obj 61617
elseif (%self.vnum% == 61692)
  wload obj 61615
end
detach 61621 %self.id%
~
$~
