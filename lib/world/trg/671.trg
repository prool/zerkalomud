#67100
Первая встреча с головой~
0 r 100
~
wait 2
г Здравствуй странник!
wait 1s
рыдать
г Ты уже наверно заметил что вокруг нашей деревне что-то странное творится?
г А ежели не заметил так я тебе скажу.
г Взбесились духи лесные, предки наши на кладбище из могил восстают.
г От леших в чаще житья нет, да и на болоте не лучше,
г Кикиморы да болотники, людей под воду утаскивают.
г А своими силами мы только и можем что в деревню эту нечисть не пускать.
г Так ведь нам охотится, надо, по ягоды ходить, детей то кормить надо!
wait 1s
г А я смотрю ты силою обладаешь странник, не согласишься ли, ты мне помочь?
г Наша деревня в долгу не останется, награду мы тебе дадим будь уверен!
attach 67104 %self.id%
end
~
#67101
ноу христы~
1 j 100
~
if !(%actor.religion% == 0)
  osend %actor.name% Носить эту вещь значит быть похожим на варвара!
  oechoaround %actor% %actor.name% сморщил%actor.u% от отвращения.
  return 0
  halt
end
~
#67102
Открываем вход~
2 c 100
вложить~
if !(%actor.haveobj(67100)%)
  wsend %actor.name% У Вас нет нужного камня.
  wechoaround %actor% %actor.name% поковырялся пальцем в углублении каменной глыбы.
  halt
end
if !(%arg.contains(камень)%)
  wsend %actor.name% Что Вы собираетесь вложить?
  halt
end
wsend %actor.name% Вы вложили камень в углубление на каменной глыбе.
wechoaround %actor% %actor.name% вложил камень в углубление на каменной глыбе.
wait 1s
wecho Трещина в огромной глыбе стала расширятся, образовывая проход...
wait 1s
wdoor 67181 north flags a
wdoor 67181 down room 67189
wdoor 67189 north flags a
wdoor 67189 up room 67181
wecho Глыба остановилась.
wpurge камень
end
~
#67103
Закрываем вход~
2 c 100
вынуть~
if !(%arg.contains(камень)%)
  wsend %actor.name% Что Вы собираетесь вынуть?
  halt
end
wsend %actor.name% Вы попытались вынуть камень из каменной глыбы, но у Вас ничего неполучилось,
wsend %actor.name% как вдруг камень сам выскочил из углубления и упал на землю.
wechoaround %actor% %actor.name% попытался вынуть камень из каменной глыбы, но у него ничего неполучилось,
wechoaround %actor% как вдруг камень сам выскочил из углубления и упал на землю.
wait 1s
wecho Трещина в огромной глыбе стала сужаться, закрывая проход...
wait 1s
wdoor 67181 down purge
wdoor 67189 up purge
wecho Глыба остановилась.
wload obj 67100
end
~
#67104
Согласились помочь голове~
0 d 1
помогу~
wait 1
г Спасибо тебе странник за то что сжалился над нами.
г Вот что я тебе скажу, все наши напасти не просто так,
г А наводит их по всей видимости какой-то черный колдун - душегубец,
г который всех этих тварей да духов лесных на людей натравливает.
г Но я во всем этом волшебстве не силен, и делом помочь не могу,
г Зато могу посоветовать, сходить к нашему знахарю, думаю он скажет тебе что делать.
set quest %actor%
global quest
calcuid vopr671 67101 mob
remote quest %vopr671.id%
calcuid vopr671 67104 mob
remote quest %vopr671.id%
attach 67105 %self.id%
detach 67100 %self.id%
detach 67104 %self.id%
end
~
#67105
Пришел без победы~
0 r 100
~
wait 1
if (%actor.name% == %quest.name%)
  вопр %actor.name%
end
~
#67106
Знахарь дает задание~
0 r 100
~
wait 1
if (%actor.name% == %quest.name%)
  г А, здравствуй странник, я знаю, тебя прислал голова за советом.
  г Так слушай мой совет.
  г Для того чтобы узнать кто это безобразие творит,
  г мне потребуется несколько предметов, для заклинания поиска.
  г Принеси мне шерсть вурдалака, который завелся на кладбище,
  г и белый камешек с берега реки которая течет за болотом.
  г С этими ингредиентами я смогу составить заклинание,
  г которое укажет мне на злодея!
  г Ну в путь, удачи.
  wait  2s
  attach 67107 %self.id%
  detach 67106 %self.id%
end
~
#67107
Пришли к знахарю опять~
0 r 100
~
if (%actor.name% != %quest.name%)
  halt
end
if !(%actor.haveobj(67101)%) && !(%actor.haveobj(67102)%)
  вопр %actor.name%
  г мне нужен клок шерсти вурдалака и белый камешек
  halt
end
if !(%actor.haveobj(67101)%) 
  вопр %actor.name%
  г мне нужен клок шерсти вурдалака
  halt
end
if !(%actor.haveobj(67102)%) 
  вопр %actor.name%
  г мне нужен белый камешек
  halt
end
г вот молодец! Ну давай же скорей сюда ингредиенты!
wait 1
msend %actor.name% Вы дали белый камешек знахарю.
mechoaround %actor% %actor.name% дал белый камешек знахарю.
wait 1
msend %actor.name% Вы дали клок шерсти вурдалака знахарю.
mechoaround %actor% %actor.name% дал клок шерсти вурдалака знахарю.
mpurge  белый.камешек
mpurge клок.шерсти.вурдалака
г вот и хорошо, сей час, я попробую, что ни будь сделать.
wait 1s
mecho Знахарь достал котел, положил в него шерсть вурдалака и белый камень
mecho и принялся что-то шептать, как вдруг в котле что-то ярко вспыхнуло...
wait 1s
*вылазит текст за экран
г да, я обнаружил того душегубца, который заставляет лесных и болотных духов нападать на людей
г как только ты его убьешь, его магия рассеется, и вокруг нашей деревни вновь воцарится спокойствие
г этот злой колдун творит свои заклятья из древней усыпальницы наших предков, которая находится за
г северным лесом, но чтобы попасть в нее тебе понадобится вот это.
mload obj 67100
дать камень %actor.name%
wait 1s
г вложи этот камень в гранитную глыбу на вершине кургана, и откроется проход вниз,
г там ты и найдешь злодея.
detach 67107 %self.id%
end
~
#67108
оплата квеста~
0 r 100
~
wait 1
if (%actor.name% != %quest.name%)
  halt
end
г Спасибо, тебе за доброе дело, путешественник!
wait 1s
switch %random.20%
  case 1
    wait 1
    г Я обещал наградить?
    if (%world.curobjs(67111)% < 3) && (%random.3% == 1)
      mload obj 67111
    end
    дать крест %actor.name%
  break
  case 2
    wait 1
    г Вот получи в награду
    %self.gold(3000)%
    дать 3000 кун %actor.name%
  break
  case 3
    г Вот получи в награду
    %self.gold(3000)%
    дать 3000 кун %actor.name%
  break
  default
    г Вот получи в награду
    %self.gold(3000)%
    дать 3000 кун %actor.name%
  done
  if ((%random.1000% < 50) && (%world.curobjs(3317)% < 1))
    mload obj 3317
    дать все %actor.name%
  elseif ((%random.1000% < 30) && (%world.curobjs(3329)% < 1))
    mload obj 3329
    дать все %actor.name%
  end
  detach 67108 %self.id%
~
#67109
Вылезаем из могилы~
2 c 100
карабкаться~
if !(%arg.contains(вверх)%)
  wsend %actor.name% Куда вы собираетесь карабкаться?
  halt
end
wsend %actor.name% Цепляясь за корни деревьев торчащих из склона, Вы полезли на верх.
wechoaround %actor% Цепляясь за корни деревьев торчащих из склона, %actor.name% полез%actor.q% на верх.
wait 1s
wteleport %actor% 67154
wait 1
wsend %actor.name% На конец то Вы вылезли из могилы и встали на ровном месте.
wechoaround %actor% %actor.name% вылез%actor.q% из могилы и встал на ровное место.
~
#67110
Включаем дт~
2 e 100
~
calcuid vopr671 67135 room
attach 67112 %vopr671.id%
calcuid vopr671 67196 room
attach 67112 %vopr671.id%
wait  2s
wsend %actor.name% Вы погрузились в болото по пояс. Пора выбираться от сюда!
wechoaround %actor% %actor.name% погрузился в болото по пояс.
wait  2s
wsend %actor.name% Вы погрузились в болото по грудь. Пора выбираться от сюда!
wechoaround %actor% %actor.name% погрузился в болото по грудь.
wait  2s
wsend %actor.name% Вы погрузились в болото с головой.
wechoaround %actor% %actor.name% погрузился в болото с головой, и начал захлебываться.
wdamage %actor.name% 2000
~
#67111
выкололи глаз~
2 e 100
~
if %random.15% == 1
  wait 1
  wsend %actor.name% Вдруг какая то ветка ткнула вас прямо в глаз!
  wechoaround %actor% Острая ветка ткнула %actor.rname% прямо в глаз!
  wdamage %actor.name% 100
end
~
#67112
Отключение дт~
2 e 100
~
calcuid vopr671 67138 room
detach 67110 %vopr671.id%
calcuid vopr671 67138 room
attach 67110 %vopr671.id%
~
#67113
колдун умер~
0 f 100
~
calcuid vopr671 67100 mob
attach 67108 %vopr671.id%
calcuid vopr671 67100 mob
detach 67105 %vopr671.id%
calcuid vopr671 67105 mob
detach 67114 %vopr671.id%
calcuid vopr671 67106 mob
detach 67114 %vopr671.id%
end
~
#67114
мобы агрят~
0 r 100
~
у %actor.name%
~
#67115
встреча с прислужником~
0 q 100
~
if (%actor.name% != %quest.name%)
  г Здравствуй путник!
  г не хочешь ли ты выполнить мое задание?
  г награду обещаю!
  attach 67116 %self.id%
  halt
end
г Умри служитель света!
у %actor.name%
halt
end
~
#67116
задание прислужника~
0 d 1
помогу~
г Иди убей знахаря, а в доказательство этого принеси мне его голову
set quest1 %actor%
global quest1
attach 67121 %self.id%
detach 67115 %self.id%
detach 67116 %self.id%
end
~
#67117
обновление переменных~
2 f 100
~
calcuid vopr 67100 mob
rdelete quest %vopr.id%
calcuid vopr5 67101 mob
rdelete quest %vopr5.id%
calcuid vopr6 67104 mob
rdelete quest %vopr6.id%
calcuid vopr1 67104 mob
rdelete quest1 %vopr1.id%
calcuid vopr2 67100 mob
attach 67100 %vopr2.id%
calcuid vopr3 67104 mob
attach 67115 %vopr3.id%
calcuid vopr4 67101 mob
attach 67106 %vopr4.id%
wdoor 67181 down purge
wdoor 67189 up purge
end
~
#67118
лоад шерсти~
0 f 100
~
mload obj 67101
if (%world.curobjs(67106)% < 5) && (%random.5% == 1)
  mload obj 67106
end
~
#67119
лоад камня~
2 f 100
~
wload obj 67102
~
#67120
лоад головы~
0 f 100
~
mload obj 67103
~
#67121
оплата квеста 2~
0 j 100
~
wait 1
ухм
г Нужное дело сделано!
mpurge  голова.знахаря
switch %random.20%
  case 1
    wait 1
    г Я обещал наградить?
    if (%world.curobjs(67110)% < 3) && (%random.3% == 1)
      mload obj 67110
    end
    дать крест %actor.name%
  break
  case 2
    wait 1
    г Вот получи в награду
    %self.gold(3000)%
    дать 3000 кун %actor.name%
  break
  case 3
    wait 1
    г Вот получи в награду
    %self.gold(3000)%
    дать 3000 кун %actor.name%
  break
  default
    г Вот получи в награду
    %self.gold(3000)%
    дать 3000 кун %actor.name%
  done
  detach 67121 %self.id%
~
#67122
Лоад с кикимор~
0 f 100
~
if (%world.curobjs(67105)% < 10) && (%random.5% == 1)
  mload obj 67105
end
~
#67123
Лоад с вурдолака~
0 f 100
~
if (%world.curobjs(67106)% < 5) && (%random.5% == 1)
  mload obj 67106
end
~
#67124
лоад с леших~
0 f 100
~
if (%world.curobjs(67108)% < 10) && (%random.5% == 1)
  mload obj 67108
end
~
#67125
убили страха~
0 f 100
~
if (%world.curobjs(67112)% < 5) && (%random.5% == 1)
  mload obj 67112
end
~
#67126
убили пожирателя снов~
0 f 100
~
if (%world.curobjs(67113)% < 5) && (%random.5% == 1)
  mload obj 67113
end
~
#67127
убили шиликуна~
0 f 100
~
if (%world.curobjs(67114)% < 5) && (%random.5% == 1)
  mload obj 67114
end
~
$~
