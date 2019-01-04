#93500
Староста приветствует~
0 q 100
~
wait 1s
г Здравствуй мил человек.
г Помоги старику.
г Померла одинокая девка из нашей деревни.
г Я, как старейшина, обязан похоронить по-людски. Как положено.
г Да вот, беда! Дьяк отказался ее отпевать.
г Говорит ведьма.
г Нехорошо это.
г Я уж дневную часть молебна отпел, а ночную не могу. Сил нет. Стар я совсем стал.
г Может поможешь ? Я отблагодарю.
calcuid star 93500 mob
attach 93501 %star.id%
~
#93501
Староста соглашается~
0 d 100
помогу~
if %actor.vnum% != -1
  halt
end
If %actor.religion% = 0
  г Вот и ладненько.
  wait 1s
  calcuid psal 93518 room
  detach 93504 %psal.id%
  calcuid star 93500 mob
  detach 93500 %star.id%
  г Там я уже все подготовил.
  wait 1s
  г Сторожить не буду! Потому дверь запру на ночь. Так оно безопаснее будет.
  wait 1s
  г Как закончишь отпевать. В колокол позвони. Я мигом приду. Расплачусь.
  wait 1s
  г Держи еще освященный мел. Им дьяк пользовался. Не знаю зачем. Может пригодится.
  mload obj 93500
  дат мел %actor.name%
  wait 1s
  г Еще раз спасибо за помощь.
  mecho Деревенский староста затолкал вас внутрь и запер дверь снаружи на засов.
  mteleport all 93519
  wait 1
  calcuid killstar 93501 room
  attach 93544 %killstar.id%
  exec 93544 %killstar.id%
else
  wait 1
  г Да ты как я заметил язычник! Как же ты собрался мне помочь?
end
~
#93502
РЕПОП~
2 f 100
~
calcuid star 93500 mob
attach 93500 %star.id%
calcuid star 93500 mob
detach 93501 %star.id%
calcuid star 93500 mob
detach 93535 %star.id%
calcuid killstar 93501 room
detach 93544 %killstar.id%
calcuid ps 93518 room
detach 93504 %ps.id%
calcuid kolokol 93525 room
detach 93543 %kolokol.id%
calcuid killmel 93518 room
detach 93545 %killmel.id%
wait 1s
wdoor  93564 west purge
wdoor  93563 east purge
wdoor  93518 west flags a
wdoor  93518 west room  93517
wdoor  93518 east   flags a
wdoor  93518 east room  93519
wdoor  93518 north flags a
wdoor  93518 north room  93521
wdoor  93518 south   flags a
wdoor  93518 south room  93520
wdoor  93519 west flags a
wdoor  93519 west room  93518
wdoor  93517 east   flags a
wdoor  93517 east room  93518
wdoor  93520 north flags a
wdoor  93520 north room  93518
wdoor  93521 south   flags a
wdoor  93521 south room  93518
~
#93503
чертим круг~
1 h 100
~
if %actor.vnum% != -1
  halt
end
wait 1s
If %actor.realroom% == 93518
  calcuid killstar 93501 room
  detach 93544 %killstar.id%
  osend %actor% Вы стали чертить мелом круг, но его хватило обвести лишь псалтырь со свечей.
  oechoaround %actor% %actor.name% стал%actor.g% чертить мелом круг, но его хватило обвести лишь псалтырь со свечей.
  osend %actor% Вы довольно уставились на свою работу, изрядно испачкав мелом пол, и встали, непоместившись, рядом с кругом.
  oechoaround %actor% %actor.name% довольно посмотрел%actor.g% на свою работу, изрядно испачкав мелом пол, и встал%actor.g%, непоместившись, рядом с кругом.
  calcuid ps 93518 room
  attach 93504 %ps.id%
  opurge %self%
else
  wait 1
end
~
#93504
читать псалтырь~
2 c 100
читать~
if !(%arg.contains(псалтырь)%) 
  wsend       %actor% Что это вы хотите читать???
  return 1
  halt
end
If %actor.religion% = 0
  wsend       %actor% Вы принялись за чтение молитв.
  wechoaround %actor% %actor.name% начал%actor.g% чтение молитв.
  wecho Вдруг, вы заметили, что лицо покойной исказилось в неподвижной гримасе, а под потолком послышался шорох. 
  wload mob 93501
  detach 93504 %self.id%
else
  wsend       %actor% Негоже вам изменять своим богам!!!
  wechoaround %actor% %actor.name% Хотел%actor.g% изменить своим богам, но вовремя спохватился.
end
~
#93505
умерла мышка~
0 f 100
~
calcuid psal 93518 room
detach 93504 %psal.id%
calcuid veter 93518 room
attach 93506 %veter.id%
run 93506 %veter.id%
~
#93506
Ветер роом 18~
2 z 100
~
wait 15s
wecho Внезапно поднялся страшный ветер и затушил все свечи в церкви, кроме стоящей в круге.
wecho Непроницаемая тьма окружила вас со всех сторон.
wecho Вы поспешили вернуться к свету!
wdoor  93518 west purge
wdoor  93518 north purge
wdoor  93518 east purge
wdoor  93518 south purge
wdoor  93519 west purge
wdoor  93520 north purge
wdoor  93517 east purge
wdoor  93521 south purge
wdoor  93524 west flags a
wdoor  93524 west room  93518
wdoor  93525 north flags a
wdoor  93525 north room  93518
wdoor  93522 east   flags a
wdoor  93522 east room  93518
wdoor  93523 south   flags a
wdoor  93523 south room  93518
calcuid veter 93517 room
attach 93507 %veter.id%
run 93507 %veter.id%
~
#93507
ветер роом 17~
2 z 0
~
wait 1
wecho Внезапно поднялся страшный ветер и затушил все свечи в церкви, кроме стоящей в круге.
wecho Непроницаемая тьма окружила вас со всех сторон.
wecho Вы поспешили вернуться к свету!
wteleport all 93518
calcuid veter 93518 room
detach 93506 %veter.id%
calcuid veter 93519 room
attach 93508 %veter.id%
run 93508 %veter.id%
~
#93508
ветер роом 19~
2 z 0
~
wait 1
wecho Внезапно поднялся страшный ветер и затушил все свечи в церкви, кроме стоящей в круге.
wecho Непроницаемая тьма окружила вас со всех сторон.
wecho Вы поспешили вернуться к свету!
wteleport all 93518
calcuid veter 93517 room
detach 93507 %veter.id%
calcuid veter 93520 room
attach 93509 %veter.id%
run 93509 %veter.id%
~
#93509
ветер роом 20~
2 z 0
~
wait 1
wecho Внезапно поднялся страшный ветер и затушил все свечи в церкви, кроме стоящей в круге.
wecho Непроницаемая тьма окружила вас со всех сторон.
wecho Вы поспешили вернуться к свету!
wteleport all 93518
calcuid veter 93519 room
detach 93508 %veter.id%
calcuid veter 93521 room
attach 93510 %veter.id%
run 93510 %veter.id%
~
#93510
ветер роом 21~
2 z 0
~
wait 1
wecho Внезапно поднялся страшный ветер и затушил все свечи в церкви, кроме стоящей в круге.
wecho Непроницаемая тьма окружила вас со всех сторон.
wecho Вы поспешили вернуться к свету!
wteleport all 93518
calcuid veter 93520 room
detach 93509 %veter.id%
calcuid vedma 93518 room
attach 93511 %vedma.id%
run 93511 %vedma.id%
~
#93511
Ведьма говорит~
2 z 100
~
wait 7s
wecho  "Что? Богоугодник явился по мою душу?",- заговорила мертвая дивчина.
wait 1s
wecho "Чтож! Посмотрим, каков ты на вкус!",- прошепелявила девка, но разглядеть ее в кромешной тьме не удалось.
wait 5s
calcuid veter 93521 room
detach 93510 %veter.id%
calcuid mertvec 93518 room
attach 93512 %mertvec.id%
run 93512 %mertvec.id%
~
#93512
Мертвец2 атачит~
2 z 100
~
wait 1
wecho Мертвец пришел с запада.
wload mob 93502
wait 1
calcuid vedma 93518 room
detach 93511 %vedma.id%
calcuid mertvecu 93502 mob
attach 93516 %mertvecu.id%
calcuid mertvec 93518 room
attach 93513 %mertvec.id%
run 93513 %mertvec.id%
~
#93513
мертвец3 атачит~
0 z 100
~
wait 1
wecho Мертвец пришел с севера.
wload mob 93503
wait 1
calcuid mertvec 93502 mob
detach 93512 %mertvec.id%
calcuid mertvecu 93503 mob
attach 93518 %mertvecu.id%
calcuid mertvec 93518 room
attach 93514 %mertvec.id%
run 93514 %mertvec.id%
~
#93514
мертвец4 атачит~
0 z 100
~
wait 1
wecho Мертвец пришел с востока.
wload mob 93504
wait 1
calcuid mertvec 93503 mob
detach 93513 %mertvec.id%
calcuid mertvecu 93504 mob
attach 93520 %mertvecu.id%
calcuid mertvec 93518 room
attach 93515 %mertvec.id%
run 93515 %mertvec.id%
~
#93515
мертвец5 атачит~
0 z 100
~
wait 1
wecho Мертвец пришел с юга.
wload mob 93505
wait 1
calcuid mertvec 93504 mob
detach 93514 %mertvec.id%
calcuid mertvecu 93505 mob
attach 93522 %mertvecu.id%
calcuid vedmaidet 93525 room
attach 93546 %vedmaidet.id%
run 93546 %vedmaidet.id%
~
#93516
мертвец2 умер~
0 f 100
~
calcuid mertvecl 93518 room
attach 93517 %mertvecl.id%
run 93517 %mertvecl.id%
~
#93517
мертвец2 лоад~
2 z 100
~
wait 1
wecho Мертвец пришел с запада.
wload mob 93502
calcuid mertvecu 93502 mob
attach 93516 %mertvecu.id%
~
#93518
мертвец3 умер~
0 f 100
~
calcuid mertvecl 93518 room
attach 93519 %mertvecl.id%
run 93519 %mertvecl.id%
~
#93519
мертвец3 лоад~
2 z 100
~
wait 1
wecho Мертвец пришел с севера
wload mob 93503
calcuid mertvecu 93503 mob
attach 93518 %mertvecu.id%
~
#93520
мертвец 4 умер~
0 f 100
~
calcuid mertvecl 93518 room
attach 93521 %mertvecl.id%
run 93521 %mertvecl.id%
~
#93521
мертвец 4 лоад~
2 z 100
~
wait 1
wecho Мертвец пришел с востока.
wload mob 93504
calcuid mertvecu 93504 mob
attach 93520 %mertvecu.id%
~
#93522
мертвец5 умер~
0 f 100
~
calcuid mertvecl 93518 room
attach 93523 %mertvecl.id%
run 93523 %mertvecl.id%
~
#93523
мертвец 5 лоад~
2 z 100
~
wait 1
wecho Мертвец пришел с юга.
wload mob 93505
calcuid mertvecu 93505 mob
attach 93522 %mertvecu.id%
~
#93524
Ведьма атачит+выключаем "подачу обеда"~
0 z 100
~
wait 25s
calcuid mertvecu 93502 mob
detach 93516 %mertvecu.id%
calcuid mertvecu 93503 mob
detach 93518 %mertvecu.id%
calcuid mertvecu 93504 mob
detach 93520 %mertvecu.id%
calcuid mertvecu 93505 mob
detach 93522 %mertvecu.id%
calcuid mertvecl 93518 room
detach 93517 %mertvecl.id%
calcuid mertvecl 93518 room
detach 93519 %mertvecl.id%
calcuid mertvecl 93518 room
detach 93521 %mertvecl.id%
calcuid mertvecl 93518 room
detach 93523 %mertvecl.id%
calcuid mertvec 93518 room
detach 93515 %mertvec.id%
calcuid vedmaidet 93525 room
detach 93546 %vedmaidet.id%
wait 1s
север
колд !землетр!
~
#93525
умерла ведьма~
0 f 100
~
calcuid vedmaidet 93506 mob
detach 93524 %vedmaidet.id%
mecho Труп ведьмы исчез, а осиновый гроб, будто чьим то повелением, упал на помост.
mecho "Мы еще встретимся!",- послышалось эхо.
mload obj 93502
if (%world.curobjs(93504)% < 10) && (%random.3% == 2)
  mload obj 93504
end
mecho Ветер утих и беспросветная тьма, окружавшая вас, мигом отступила.
mdoor  93518 west flags a
mdoor  93518 west room  93522
mdoor  93518 north flags a
mdoor  93518 north room  93523
mdoor  93518 east   flags a
mdoor  93518 east room  93524
mdoor  93518 south   flags a
mdoor  93518 south room  93525
~
#93526
умер Вий1~
0 f 100
~
if (%world.curobjs(93505)% < 10) && %random.100% < 50
  mload obj 93505
end
mecho Черный туман возник на месте убитого Вия.
mload mob 93519
calcuid kolokol 93523 room
attach 93531 %kolokol.id%
calcuid tuman 93519 mob
attach 93527 %tuman.id%
run 93527 %tuman.id%
~
#93527
Туман атачит~
0 z 100
~
wait 1s
колд !масс оцеп!
wait 5s
г Мы еще поквитаемся!
mecho Черный туман ушел в щели, прям под вашими ногами.
wait 7
mpurge туман
~
#93528
Умер Вий2~
0 f 100
~
if (%world.curobjs(93510)% < 7) && %random.100% < 50
  mload obj 93510
end
mecho Черный туман обволок убитого Вия и растворился без следа.
mecho "Приходи следующей ночью! Поквитаемся!",- послышалось из-под земли.
calcuid viy 93526 room
attach 93540 %viy.id%
~
#93529
лезем в щель~
2 c 100
красться~
if !(%arg.contains(щель)%) 
  wsend       %actor% Куда это вы хотите красться?
  return 1
  halt
end
if (%actor.move%>100) && (%actor.dex%>31) && (%actor.skill(подкрасться)%>90)
  wsend       %actor% Вы тихо прокрались мимо сторожевого пса и нырнули в щель.
  wait 2s
  eval %actor.move(-100)%
  wsend %actor% Вы тихо влезли внутрь церковной пристройки.
  wteleport %actor.name% 93528
else
  wsend %actor% Сторожевой пес приоткрыл глаза, лишив вас интересной затеи.
  return 0
end
~
#93530
лезем из щели~
2 c 100
красться~
if !(%arg.contains(щель)%) 
  osend       %actor% Куда это вы хотите красться?
  return 1
  halt
end
if (%actor.move%>100) && (%actor.dex%>32) && (%actor.skill(подкрасться)%>90)
  wsend       %actor% Вы тихо вылезли из церковной пристройки.
  wait 2s
  eval buf %actor.move(-100)%
  wsend %actor% Вы тихо прокрались мимо сторожевого пса.
  wteleport %actor.name% 93510
else
  wsend %actor% Сторожевой пес приоткрыл глаза, лишив вас возможности выйти.
  return 0
end
~
#93531
Звоним в колокол~
2 c 100
потянуть~
if !(%arg.contains(веревка)%) 
  wsend       %actor% Что вы хотите потянуть?
  return 1
  halt
end
wait 1
wdoor  93518 west purge
wdoor  93518 east purge
wdoor  93518 north purge
wdoor  93518 south purge
wdoor  93524 west purge
wdoor  93522 east purge
wdoor  93525 north purge
wdoor  93523 south purge
wecho Оглушительный звон колокола отозвался болью в ушах.
wecho Стены поплыли перед вашими глазами. И вы упали без сознания.
wecho Деревенский староста вылил на вас ведро воды.
wteleport all 93501
calcuid kolokol 93518 room
attach 93532 %kolokol.id%
run 93532 %kolokol.id%
~
#93532
Все в сад1~
2 z 100
~
wait 1s
wecho Оглушительный звон колокола отозвался болью в ушах.
wecho Стены поплыли перед вашими глазами. И вы упали без сознания.
wecho Деревенский староста вылил на вас ведро воды.
wteleport all 93501
calcuid kolokol 93523 room
detach 93531 %kolokol.id%
calcuid kolokol 93522 room
attach 93541 %kolokol.id%
run 93541 %kolokol.id%
~
#93533
Старик пора подарки дарить~
2 z 100
~
wload mob 93500
wait 1
calcuid kolokol 93525 room
detach 93543 %kolokol.id%
calcuid star 93500 mob
attach 93534 %star.id%
run 93534 %star.id%
~
#93534
Старик подарочки принес?~
0 z 100
~
calcuid kolokol2 93501 room
detach 93533 %kolokol2.id%
mecho В вашей голове все еще звенит, но уже намного лучше.
г Все хорошо?
wait 1s
г Эй! А куда делся труп девки?
wait 1s
г И вообще! Что там за разврат творился всю ночь?
wait 1s
эмоц задумался о видах мирской любви и ее крайностях.
calcuid star 93500 mob
attach 93535 %star.id%
~
#93535
староста вознаграждает~
0 j 100
~
wait 1
if %object.vnum% != 93502
  drop all
  halt
end
wait 1
mpurge %object%
detach 93534 %self.id%
wait 1s
mecho Прядь волос вспыхнула в руках старосты и рассыпалась в прах.
г И впрямь ведьма!
г Держи свою награду, если заслужил.
if %world.gameobjs(93503)% < 10
  mload obj 93503
  дат крест %actor.name%
else
  фиг %actor.name%
end
mecho Старик развернулся и быстрым шагом ушел в деревню.
wait 1
mpurge %self%
~
#93536
умер рогатый бес~
0 f 100
~
if (%world.curobjs(93506)% < 10) && (%random.3% == 1)
  mload obj 93506
end
~
#93537
Умер здор упырь~
0 f 100
~
if (%world.curobjs(93507)% < 10) && (%random.3% == 3)
  mload obj 93507
end
~
#93538
умер рука~
0 f 100
~
if (%world.curobjs(93508)% < 10) && (%random.3% == 1)
  mload obj 93508
end
~
#93539
умер древн воин~
0 f 100
~
if (%world.curobjs(93509)% < 10) && (%random.1000% <= 333)
  mload obj 93509
end
if (%world.curobjs(1743)% < 1) && (%random.1000% <= 100)
  mload obj 1743
end
~
#93540
ищем~
2 c 100
искать~
if !(%arg.contains(мусор)%) 
  osend       %actor% Где вы хотите искать?
  return 1
  halt
end
wait 1
wecho Вы перевернули весь мусор, но, кажется, ничего не нашли.
if (%world.curobjs(93511)% < 10) && (%random.3% == 1)
  wload obj 93511
end
wait 1
calcuid viy 93526 room
detach 93540 %viy.id%
~
#93541
Все в сад2~
2 z 100
~
wait 1
wecho Оглушительный звон колокола отозвался болью в ушах.
wecho Стены поплыли перед вашими глазами. И вы упали без сознания.
wait 1
wecho Деревенский староста вылил на вас ведро воды.
wteleport all 93501
calcuid kolokol 93518 room
detach 93532 %kolokol.id%
calcuid kolokol 93524 room
attach 93542 %kolokol.id%
run 93542 %kolokol.id%
~
#93542
Все в сад3~
2 z 100
~
wait 1
wecho Оглушительный звон колокола отозвался болью в ушах.
wecho Стены поплыли перед вашими глазами. И вы упали без сознания.
wecho Деревенский староста вылил на вас ведро воды.
wteleport all 93501
calcuid kolokol 93522 room
detach 93541 %kolokol.id%
calcuid kolokol 93525 room
attach 93543 %kolokol.id%
run 93543 %kolokol.id%
~
#93543
все в сад4~
2 z 100
~
wait 1
wecho Оглушительный звон колокола отозвался болью в ушах.
wecho Стены поплыли перед вашими глазами. И вы упали без сознания.
wecho Деревенский староста вылил на вас ведро воды.
wteleport all 93501
calcuid kolokol 93524 room
detach 93542 %kolokol.id%
calcuid kolokol2 93501 room
attach 93533 %kolokol2.id%
run 93533 %kolokol2.id%
~
#93544
убираем старосту~
2 z 100
~
wpurge старост
~
#93545
убираем мел~
2 z 100
~
wpurge мел
~
#93546
создаем ведьму со свитой и пускаем~
2 z 100
~
wload mob 93506
wload mob 93507
wload mob 93508
wload mob 93509
calcuid vedmaidet 93506 mob
attach 93524 %vedmaidet.id%
run 93524 %vedmaidet.id%
~
#93547
Опустить мост~
2 c 100
опустить~
if !(%arg.contains(мост)%) 
  wsend       %actor% Что это вы хотите опустить???
  return 1
  halt
end
wait 1
wsend       %actor% Вы приподняли запирательный механизм, и барабан бешено закрутился, разматывая натянутую под массой моста бечевку.
wechoaround %actor% %actor.name% приподнял%actor.g% запирательный механизм и барабан бешено закрутился, разматывая натянутую под массой моста бечевку.
wait 2s
wecho    Подъемный мост с грохотом и треском дубовых досок рухнул на западный берег.
wdoor  93564 west flags a
wdoor  93564 west room  93563
wdoor  93563 east   flags a
wdoor  93563 east room  93564
calcuid most 93564 room
detach 93564 %most.id%
~
$~
