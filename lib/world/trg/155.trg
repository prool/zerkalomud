#15502
выталкиваем костяк в щели~
2 c 100
вытолкнуть~
if !%arg.contains(костяк)% 
  wsend %actor%  Что это вы хотите вытолкнуть ?
  return 0
  halt 
end
wsend %actor%  Упершись ногами в землю, вы вытолкнули костяк.
wechoaround %actor%  %actor.name% вытолкнул%actor.q% костяк освобоив проход.
wdoor 15505 east room 15524
wdoor 15524 west room 15505
wecho  Вот теперь и пройти можно.
end
~
#15504
уступ падает~
2 e 100
~
wait  1
set   pc %self.people%
while %pc%
  if %pc.vnum% == -1
  break
end
set pc %pc.next_in_room%
done
if !%pc%
  halt
end
wait 5s
set   pc   %self.people%
set   used 0
while %pc%
  if %pc.vnum% == -1
    if !%used%
      wecho Карниз с грохотом оборвался...
    end
    wait 4s
    set used  %pc%
    wteleport %pc% 15544
    set pc %used%
  end
  set pc %pc.next_in_room%
done
if %used%
  detach 15504 %self.id%
end
~
#15505
лезем через стену~
2 c 100
перелезть~
if !%arg.contains(стена)% 
  wsend %actor%  Куда вы хотите лезть?
  return 0
  halt 
end
wsend %actor%  Подпрыгнув, вы ухватились заверхний край стены.
wechoaround %actor% %actor.name% ловко перемахнул%actor.g% через стену...
wteleport %actor% 15521
wsend %actor%  Вы перелезли через стену
wechoaround %actor%  Кто-то спрыгнул сверху. 
end
~
#15506
лезем через стену(назад)~
2 c 100
перелезть~
if !%arg.contains(стена)% 
  wsend %actor%  Куда вы хотите лезть?
  return 0
  halt 
end
wsend %actor%  Подпрыгнув, вы ухватились заверхний край стены.
wechoaround %actor% %actor.name% ловко перемахнул%actor.g% через стену...
wteleport %actor% 15520
wsend %actor%  Вы перелезли через стену
wechoaround %actor%  Кто-то спрыгнул сверху. 
end
~
#15509
лезем в лаз(1)~
2 c 100
ползти~
if %arg.contains(лаз)%
  wsend %actor.name% Куда вы хотите залезть?   
  return 0
  halt
end
wait 1
wsend %actor.name% Вы ловко забрались в узкий лаз и поползли на юг.
wechoaround %actor% %actor.name% залез%actor.q% в отверстие в стене и уполз%actor.q% внутрь.
wteleport %actor.name% 15561
~
#15510
лезем в лаз (2)~
2 c 100
ползти~
if %arg.contains(лаз)%
  wsend %actor.name% Куда вы хотите залезть?   
  return 0
  halt
end
wait 1
wsend %actor.name% Вы опустились на колени и на карачках поползли в узкий лаз.
wechoaround %actor% %actor.name% скрыл%actor.u% в зияющей на севере дыре.
wteleport %actor.name% 15558
~
#15511
Приветствие Духа женщины~
0 q 100
~
wait 1
say Здорово, добрый молодец!
say Не бойся меня, я не причиню тебя зла!
say Меня зовут Телестра.
say Моя душа не может найти покой на небесах.
взд
wait 2s
say Помоги мне, освободи мою душу от проклятья.
attach 15512 %self.id%
detach 15511 %self.id%
~
#15512
выдача квеста~
0 d 100
*~
set text Кто тебя проклял?
if (%questor155% || (%speech% != %text%))
  halt
end
say Здесь на западной части мавзолея похоронен Царь Скилур.
say Он правил нашей державой, он захватил многие греческие портовые города,
say но не смог захватить мое сердце.
say Я вышла за другого человека
say Жили мы хорошо с ним, но в один прекрасный день в наш дом ворвались солдаты и убили нас.
взд
wait 2s
say Меня захранили тут а моего мужа я не знаю где, но Я уверена! что его дух где-то рядом.
say Я чувствую это!
say Найди моего мужа, но будь осторожен! Скилур не дремлет и его дух где-то тут!
wait 3s
say Ах да, чуть не забыла, только не попадись на глаза Скилуру, ты его не сможешь победить!
say Если ты мне найдешь моего мужа, то он даст тебе зеркало, которое поможет тебе 
say победить Скилура. 
say Скажи ему что ты пришел от меня и он поможет тебе.
say Все ступай, не стой тут!
detach 15512 %self.id%
~
#15513
Даем зеркало~
0 dz 100
Телестра~
wait 1s
say Да это ее имя!
say Ладно верю я тебе, я надеюсь ты поможешь нам!
say Это зеркало поможет тебе в бою с Скилуром!
wait 1s 
mload obj 15551
дать зерка %actor.name%
say Удачи! Да храни тебя Мышовyp!
wait 1s
detach 15513 %self.id%
~
#15514
Мужику говорим чтот мы от жены~
0 d 100
Я пришел от твоей жены, я хочу помочь вам!~
wait 5s
say Хм..... Если вы от нее то вы должны знать ее имя!
wait 1
say Скажи ее имя и я поверю тебе!
attach 15513 %self.id%
detach 15514 %self.id%
~
#15515
Нельзя убить моба без зеркала~
0 p 100
~
mecho Тьма сгустившаяся над Духом Скилура восполнила его жизненные силы!
%self.hitp% = %self.maxhitp%
~
#15516
броосаем зеркало~
1 h 100
~
wait 1
oecho Зеркало разбилось на мелкие кусочки!
if (%actor.realroom% == 15583)
  oecho Свет от осколков разогнал тьму вокруг Скилура!
  calcuid prizrak 15500 mob
  detach 15515 %prizrak.id%
  detach 15525 %self.id%
end
wait 1
opurge %self%
~
#15517
колдун в бою~
0 k 100
~
dg cast 'огн шар'
dg cast 'огн шар'
~
#15518
Наступаем на кости~
2 e 100
~
wait 1s
wecho  Хруст костей послышался у Вас под ногами.
~
#15519
Поднимаемся по лестнице~
2 g 100
~
if %actor.move% < 90 
  wsend %actor% Вы слишком устали идти по этой лестнице!
  return 0
else
  %actor.move(-90)%
end
~
#15525
Дамаг при входе в румм~
2 e 100
~
wait 2s
eval dam 900+%random.20%
wdamage %actor% %dam%
wecho Мощный луч исходящий от Духа Скилара попал в Вас.
detach 15525 %self.id%
~
#15527
смерть скорпиона~
0 f 100
~
if (%random.100% < 50) && (%world.curobjs(15537)% < 5) then
  wload obj 15537
end
~
#15532
лоад убийцы~
0 n 100
~
if (%random.100% < 6) && (%world.curobjs(15513)% < 3) then
  wload obj 15513
end
if (%random.100% < 20) && (%world.curobjs(15521)% < 10) then
  wload obj 15521
end
~
#15533
лоад колдуна~
0 n 100
~
if (%random.100% < 16) && (%world.curobjs(15525)% < 5) then
  wload obj 15525
end
if (%random.100% < 15) && (%world.curobjs(15526)% < 5) then
  wload obj 15526
end
~
#15534
лоад наездника~
0 n 100
~
if (%random.100% < 20) && (%world.curobjs(15515)% < 15) then
  wload obj 15515
end
if (%random.100% < 10) && (%world.curobjs(15515)% < 5) then
  wload obj 15556
end
~
#15536
Входим в мавзолей~
2 c 100
разобрать~
if !%arg.contains(заклад)% 
  wsend %actor%  Что это вы хотите делать ?
  return 0
  halt 
end
wsend %actor%  Долго пыхтя вы разобрали каменный заклад.
wechoaround %actor%  %actor.name% разобрал%actor.q% каменный заклад освободив проход.
wdoor 15501 north room 15502
wdoor 15502 south  room 15501
end
~
#15543
репоп зоны~
2 f 100
~
attach 15511
attach 15525
wdoor 15505 east purge 15524
wdoor 15524 west purge 15505
attach 15502
attach 15511
wdoor 15564 up purge
wdoor 15535 down purge
wdoor 15501 north purge 15502 
wdoor 15502 south  purge 15501
~
#15546
дали бабе~
0 j 100
~
wait 1
if %object.vnum% != 15536
  г Что это? Это не мое!
  брос все
  halt
end
wait 1
mpurge %object%
г О! Правосудие свершилось! Отлично!
г Этот упырь получил по заслугам!
взд
if (%world.curobjs(15517)% < 4) && (%random.1000% <= 100)
  mecho - Вот, мне этого больше никогда не носить.
  mecho - Ты найдешь этой вещи лучшее применение.
  mload obj 15517
  give  плат %actor.name%
else
  mecho - Вот, возьми, это все что у меня есть.
  msend       %actor% Дух дал Вам 500 монет.
  %actor.gold(+500)%
  mechoaround %actor% Дух дал %actor.dname% горсть монет.
end
detach 15546 %self.id%
~
#15547
убили скифского вождя~
0 f 100
*~
if (%world.curobjs(15510)% < 4) && (%random.1000% <= 150)
  mload obj 15510
end
if (%world.curobjs(15511)% < 4) && (%random.1000% <= 150)
  mload obj 15511
end
~
#15548
убили червя~
0 f 100
*~
if (%world.curobjs(15529)% < 4) && (%random.1000% <= 150)
  mload obj 15529
end
~
#15549
убили серого призрака~
0 f 100
*~
if (%world.curobjs(15520)% < 6) && (%random.1000% <= 150)
  mload obj 15520
end
if (%world.curobjs(15560)% == 0)
  mload obj 15560
end
~
#15550
убили лучника~
0 f 100
*~
if (%world.curobjs(15524)% < 4) && (%random.1000% <= 150)
  mload obj 15524
end
~
#15551
убили всадника~
0 f 100
*~
if (%world.curobjs(15515)% < 4) && (%random.1000% <= 150)
  mload obj 15515
end
if (%world.curobjs(15523)% < 4) && (%random.1000% <= 150)
  mload obj 15523
end
~
#15552
убили ожившего колдуна~
0 f 100
*~
if (%world.curobjs(15534)% < 4) && (%random.1000% <= 150)
  mload obj 15534
end
if (%world.curobjs(15535)% < 4) && (%random.1000% <= 150)
  mload obj 15535
end
~
#15553
убили золотого охра~
0 f 100
*~
if (%world.curobjs(15546)% < 4) && (%random.1000% <= 150)
  mload obj 15546
end
if (%world.curobjs(15547)% < 4) && (%random.1000% <= 150)
  mload obj 15547
end
~
#15554
убили скорпиона~
0 f 100
*~
if (%world.curobjs(15537)% < 4) && (%random.1000% <= 150)
  mload obj 15537
end
~
#15555
убили знахаря~
0 f 100
*~
if (%world.curobjs(15518)% < 4) && (%random.1000% <= 150)
  mload obj 15518
end
~
#15556
убили смотрителя~
0 f 100
*~
if (%world.curobjs(15530)% < 4) && (%random.1000% <= 150)
  mload obj 15530
end
if (%world.curobjs(15542)% < 4) && (%random.1000% <= 150)
  mload obj 15542
end
~
#15557
убили поднятого колдуна~
0 f 100
*~
if (%world.curobjs(15525)% < 4) && (%random.1000% <= 150)
  mload obj 15525
end
if (%world.curobjs(15526)% < 4) && (%random.1000% <= 150)
  mload obj 15526
end
~
#15558
убили убийцу~
0 f 100
*~
if (%world.curobjs(15513)% < 4) && (%random.1000% <= 150)
  mload obj 15513
end
if (%world.curobjs(15522)% < 4) && (%random.1000% <= 150)
  mload obj 15522
end
if (%world.curobjs(15533)% < 4) && (%random.1000% <= 150)
  mload obj 15533
end
~
#15559
убили мастера топора~
0 f 100
*~
if (%world.curobjs(15512)% < 4) && (%random.1000% <= 150)
  mload obj 15512
end
if (%world.curobjs(15514)% < 4) && (%random.1000% <= 150)
  mload obj 15514
end
~
#15560
убили мастера меча~
0 f 100
*~
if (%world.curobjs(15541)% < 4) && (%random.1000% <= 150)
  mload obj 15541
end
if (%world.curobjs(15556)% < 4) && (%random.1000% <= 150)
  mload obj 15556
end
~
#15561
убили шамана~
0 f 100
*~
if (%world.curobjs(15532)% < 4) && (%random.1000% <= 150)
  mload obj 15532
end
if (%world.curobjs(15557)% < 4) && (%random.1000% <= 150)
  mload obj 15557
end
~
#15562
убили телоха скилура~
0 f 100
*~
if (%world.curobjs(15528)% < 4) && (%random.1000% <= 150)
  mload obj 15528
end
if (%world.curobjs(15531)% < 4) && (%random.1000% <= 150)
  mload obj 15531
end
~
#15563
убили отщепенца~
0 f 100
*~
if (%world.curobjs(15521)% < 4) && (%random.1000% <= 150)
  mload obj 15521
end
~
#15564
убили других телох скилура~
0 f 100
*~
if (%world.curobjs(15527)% < 4) && (%random.1000% <= 150)
  mload obj 15527
end
if (%world.curobjs(15549)% < 4) && (%random.1000% <= 150)
  mload obj 15549
end
~
#15565
убили  скилура~
0 f 100
*~
if (%world.curobjs(15516)% < 4) && (%random.1000% <= 150)
  mload obj 15516
end
if (%world.curobjs(15519)% < 4) && (%random.1000% <= 150)
  mload obj 15519
end
if (%world.curobjs(15536)% < 4) && (%random.1000% <= 150)
  mload obj 15536
end
if (%world.curobjs(15544)% < 4) && (%random.1000% <= 150)
  mload obj 15544
end
~
$~
