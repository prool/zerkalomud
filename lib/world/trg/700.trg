#70000
вошли к злому варягу~
0 r 100
~
wait 1
say Аааа. мелюзга. Что, хочешь к нам в гости зайти?
wait 10
if %self.fighting%
 halt
end
say Тогда сначала поработай - убей бродячих собак около частокола, 
say а то совсем от них житья нет. Если убьешь - отрежь им.. гммм.. 
wait 10
дум
mecho Где-то вдалеке послышался надрывный собачий лай.
wait 10
if %self.fighting%
 halt
end
say  ..отрежь хвост и принеси его мне - тогда пропущу.
wait 10
mecho Где-то вдалеке послышался надрывный собачий лай.
wait 10
if %self.fighting%
 halt
end
~
#70001
Просьба мага~
0 r 100
~
wait 1
mecho Старик погладил длинную бороду и пытливо взглянул на Вас.
wait 5
say Привет тебе, странник.
wait 4
say Что привело тебя в наш лагерь? Хотя можешь не отвечать... 
wait 10
say Деньги, слава, жажда знаний и приключений. Много таких я тут видел. 
wait 5
дум
say Есть у меня одно задание для тебя. Посмотрим, достоин ли ты бродить по нашему лагерю.
wait 10
say Ну что, согласен ли ты испытать себя и принять новых богов, отвергнув старых?
end
~
#70002
Поручение.~
0 d 100
да~
wait 5
say Древнее проклятие вступило в силу. 
say По ночам бродит у нас за забором нечисть страшная, зло древнее.
взд
wait 5
say Многие воины храбрые сразить пытались зверя огромного...
wait 4
say  Но утром только трупы разорванные находили за частоколом.
wait 4
улыб %actor.name%
wait 4
say Если не дрогнешь, победишь тварь - награжу я тебя амулетом моих богов.
wait 4
say Не забудь взять шкуру зверя и мне принести. Теперь иди! Один с тобой.
attach 70003 %self.id%
detach 70001 %self.id%
detach 70002 %self.id%
end
~
#70003
Выполнение1.~
0 j 70015
100~
wait 1
if %object.vnum% !=70015
 брос все
 halt
end
wait 5
рад
say Герой! Ты достоин быть нашим гостем, и я отблагодарю тебя!
wait 5
mecho _Вальгрим склонился над куском бересты и что-то быстро написал на нем..
wait 5
mload obj 70052
дать кусок %actor.name%
wait 1
say Отнеси этот кусок бересты Торвину, нашему кузнецу, и он выкует тебе награду.
mpurge шкура
detach 70003 %self.id%
end
~
#70004
Кузнец 1.~
0 j 70052
100~
wait 1
if %object.vnum% !=70052
 брос все
 halt
end
rdelete abuse %self.id%
wait 1
осм %actor.name%
wait 1
эмоц повертел в руках бересту, читая руны
wait 1
say Ну что ж... выкую я тебе награду. 
wait 1 
say Но у нас много богов. 
wait 6
say Тор - мой бог, покровитель кузнецов.
wait 6
say Один - отец всех богов, покровитель воинов, но также предателей и повешенных.
wait 6
say Хеймдалль - бог охотников, сторож моста Бифрост.
wait 6
say Хель - богиня мертвых
wait 6
say Велунд - покровитель изобретателей 
wait 6
say Индуна - богиня-целительница
wait 6
say Тюр - бог войны
wait 6
say Локи - бог коварства и зла
wait 6
say Бальдр - самый прекрасный из богов, любимый сын Одина.
wait 12
say Так какому богу и ремеслу ты бы предпочел служить?
mpurge кусок
attach 70004 %self.id%
attach 70005 %self.id%
attach 70006 %self.id%
attach 70007 %self.id%
attach 70008 %self.id%
attach 70009 %self.id%
attach 70010 %self.id%
attach 70011 %self.id%
attach 70012 %self.id%
attach 70013 %self.id%
end
~
#70005
Тор~
0 d 100
Тор~
wait 1
mecho - Торвин усмехнуля в усы, на секунду задумался и подошел к горну.
mecho - Ну раз ты выбрал%actor.g% этого бога - вот сейчас выкую во славу его тебе награду.
if (%world.curobjs(70040)% < 3) && (%random.100% <= 10)
  mecho - Торвин принялся за работу.
wait 10
  mecho - Вот, смотри, получился отличный амулет!
  mload obj 70040
  give  амулет %actor.name%
else
  mecho - Знаешь, руда в этих краях ужасного качества! То, что у меня получилось
  mecho - Недостойно быть твоей наградой! Возьми лучше деньги в знак благодарности.
  %self.gold(10000)%
  дать 10000 кун %actor.name%
end
*detach 70005 %self.id%
detach 70006 %self.id%
detach 70007 %self.id%
detach 70008 %self.id%
detach 70009 %self.id%
detach 70010 %self.id%
detach 70011 %self.id%
detach 70012 %self.id%
detach 70013 %self.id%
detach 70005 %self.id%
~
#70006
Один~
0 d 100
Один~
wait 1
mecho - Торвин усмехнуля в усы, на секунду задумался и подошел к горну.
mecho - Ну раз ты выбрал%actor.g% этого бога - вот сейчас выкую во славу его тебе награду.
if (%world.curobjs(70041)% < 3) && (%random.100% <= 10)
  mecho - Торвин принялся за работу.
wait 10
  mecho - Вот, смотри, получился отличный амулет!
  mload obj 70041
  give  амулет %actor.name%
else
  mecho - Знаешь, руда в этих краях ужасного качества! То, что у меня получилось
  mecho - Недостойно быть твоей наградой! Возьми лучше деньги в знак благодарности.
  %self.gold(10000)%
  дать 10000 кун %actor.name%
end
detach 70005 %self.id%
*detach 70006 %self.id%
detach 70007 %self.id%
detach 70008 %self.id%
detach 70009 %self.id%
detach 70010 %self.id%
detach 70011 %self.id%
detach 70012 %self.id%
detach 70013 %self.id%
detach 70006 %self.id%
~
#70007
Хеймдалль~
0 d 100
Хеймдалль~
wait 1
mecho - Торвин усмехнуля в усы, на секунду задумался и подошел к горну.
mecho - Ну раз ты выбрал%actor.g% этого бога - вот сейчас выкую во славу его тебе награду.
if (%world.curobjs(70045)% < 3) && (%random.100% <= 10)
  mecho - Торвин принялся за работу.
wait 10
  mecho - Вот, смотри, получился отличный амулет!
  mload obj 70045
  give  амулет %actor.name%
else
  mecho - Знаешь, руда в этих краях ужасного качества! То, что у меня получилось
  mecho - Недостойно быть твоей наградой! Возьми лучше деньги в знак благодарности.
  %self.gold(10000)%
  дать 10000 кун %actor.name%
end
detach 70005 %self.id%
detach 70006 %self.id%
*detach 70007 %self.id%
detach 70008 %self.id%
detach 70009 %self.id%
detach 70010 %self.id%
detach 70011 %self.id%
detach 70012 %self.id%
detach 70013 %self.id%
detach 70007 %self.id%
~
#70008
Хель~
0 d 100
Хель~
wait 1
mecho - Торвин усмехнуля в усы, на секунду задумался и подошел к горну.
mecho - Ну раз ты выбрал%actor.g% этого бога - вот сейчас выкую во славу его тебе награду.
if (%world.curobjs(70046)% < 3) && (%random.100% <= 10)
  mecho - Торвин принялся за работу.
wait 10
  mecho - Вот, смотри, получился отличный амулет!
  mload obj 70046
  give  амулет %actor.name%
else
  mecho - Знаешь, руда в этих краях ужасного качества! То, что у меня получилось
  mecho - Недостойно быть твоей наградой! Возьми лучше деньги в знак благодарности.
  %self.gold(10000)%
  дать 10000 кун %actor.name%
end
detach 70005 %self.id%
detach 70006 %self.id%
detach 70007 %self.id%
*detach 70008 %self.id%
detach 70009 %self.id%
detach 70010 %self.id%
detach 70011 %self.id%
detach 70012 %self.id%
detach 70013 %self.id%
detach 70008 %self.id%
~
#70009
Велунд~
0 d 100
Велунд~
wait 1
mecho - Торвин усмехнуля в усы, на секунду задумался и подошел к горну.
mecho - Ну раз ты выбрал%actor.g% этого бога - вот сейчас выкую во славу его тебе награду.
if (%world.curobjs(70047)% < 3) && (%random.100% <= 10)
  mecho - Торвин принялся за работу.
wait 10
  mecho - Вот, смотри, получился отличный амулет!
  mload obj 70047
  give  амулет %actor.name%
else
  mecho - Знаешь, руда в этих краях ужасного качества! То, что у меня получилось
  mecho - Недостойно быть твоей наградой! Возьми лучше деньги в знак благодарности.
  %self.gold(10000)%
  дать 10000 кун %actor.name%
end
detach 70005 %self.id%
detach 70006 %self.id%
detach 70007 %self.id%
detach 70008 %self.id%
*detach 70009 %self.id%
detach 70010 %self.id%
detach 70011 %self.id%
detach 70012 %self.id%
detach 70013 %self.id%
detach 70009 %self.id%
~
#70010
Индуна~
0 d 100
Индуна~
wait 1
mecho - Торвин усмехнуля в усы, на секунду задумался и подошел к горну.
mecho - Ну раз ты выбрал%actor.g% этого бога - вот сейчас выкую во славу его тебе награду.
if (%world.curobjs(70048)% < 3) && (%random.100% <= 10)
  mecho - Торвин принялся за работу.
wait 10
  mecho - Вот, смотри, получился отличный амулет!
  mload obj 70048
  give  амулет %actor.name%
else
  mecho - Знаешь, руда в этих краях ужасного качества! То, что у меня получилось
  mecho - Недостойно быть твоей наградой! Возьми лучше деньги в знак благодарности.
  %self.gold(10000)%
  дать 10000 кун %actor.name%
end
detach 70005 %self.id%
detach 70006 %self.id%
detach 70007 %self.id%
detach 70008 %self.id%
detach 70009 %self.id%
*detach 70010 %self.id%
detach 70011 %self.id%
detach 70012 %self.id%
detach 70013 %self.id%
detach 70010 %self.id%
~
#70011
Тюр~
0 d 100
Тюр~
wait 1
mecho - Торвин усмехнуля в усы, на секунду задумался и подошел к горну.
mecho - Ну раз ты выбрал%actor.g% этого бога - вот сейчас выкую во славу его тебе награду.
if (%world.curobjs(70049)% < 3) && (%random.100% <= 10)
  mecho - Торвин принялся за работу.
wait 10
  mecho - Вот, смотри, получился отличный амулет!
  mload obj 70049
  give  амулет %actor.name%
else
  mecho - Знаешь, руда в этих краях ужасного качества! То, что у меня получилось
  mecho - Недостойно быть твоей наградой! Возьми лучше деньги в знак благодарности.
  %self.gold(10000)%
  дать 10000 кун %actor.name%
end
detach 70005 %self.id%
detach 70006 %self.id%
detach 70007 %self.id%
detach 70008 %self.id%
detach 70009 %self.id%
detach 70010 %self.id%
*detach 70011 %self.id%
detach 70012 %self.id%
detach 70013 %self.id%
detach 70011 %self.id%
~
#70012
Локи~
0 d 100
Локи~
wait 1
mecho - Торвин усмехнуля в усы, на секунду задумался и подошел к горну.
mecho - Ну раз ты выбрал%actor.g% этого бога - вот сейчас выкую во славу его тебе награду.
if (%world.curobjs(70050)% < 3) && (%random.100% <= 10)
  mecho - Торвин принялся за работу.
wait 10
  mecho - Вот, смотри, получился отличный амулет!
  mload obj 70050
  give  амулет %actor.name%
else
  mecho - Знаешь, руда в этих краях ужасного качества! То, что у меня получилось
  mecho - Недостойно быть твоей наградой! Возьми лучше деньги в знак благодарности.
  %self.gold(10000)%
  дать 10000 кун %actor.name%
end
detach 70005 %self.id%
detach 70006 %self.id%
detach 70007 %self.id%
detach 70008 %self.id%
detach 70009 %self.id%
detach 70010 %self.id%
detach 70011 %self.id%
*detach 70012 %self.id%
detach 70013 %self.id%
detach 70012 %self.id%
~
#70013
Бальдр~
0 d 100
Бальдр~
wait 1
mecho - Торвин усмехнуля в усы, на секунду задумался и подошел к горну.
mecho - Ну раз ты выбрал%actor.g% этого бога - вот сейчас выкую во славу его тебе награду.
if (%world.curobjs(70051)% < 3) && (%random.100% <= 10)
  mecho - Торвин принялся за работу.
wait 10
  mecho - Вот, смотри, получился отличный амулет!
  mload obj 70051
  give  амулет %actor.name%
else
  mecho - Знаешь, руда в этих краях ужасного качества! То, что у меня получилось
  mecho - Недостойно быть твоей наградой! Возьми лучше деньги в знак благодарности.
  %self.gold(10000)%
  дать 10000 кун %actor.name%
end
detach 70005 %self.id%
detach 70006 %self.id%
detach 70007 %self.id%
detach 70008 %self.id%
detach 70009 %self.id%
detach 70010 %self.id%
detach 70011 %self.id%
detach 70012 %self.id%
detach 70013 %self.id%
~
#70014
варягу дали хвост~
0 j 70031
100~
wait 1
if %self.fighting%
 halt
end
if %object.vnum% !=70031
 брос все
 halt
end
mecho Варяг крякнул от удовольствия рассматривая собачий хвост.
mpurge хвост
wait 10
if %self.fighting%
 halt
end
улы
wait 10
if %self.fighting%
 halt
end
say Молодец, справился! Ну что ж можешь проходить!
wait 5
if %self.fighting%
 halt
end
mload mob 70003
mpurge злой
~
#70015
ободрались об колючки~
2 e 100
~
wait 1
wecho _Колючие ветви вмести с одеждой довольно сильно разодрали Вашу кожу.
set fchar %self.people%
wdamage %fchar% 50
~
#70016
вынули бревно~
2 c 100
вынуть~
if !%arg.contains(бревно)%
  wecho Чаго?
  halt
end
wait 1s
wsend %actor% Приложив максимум усилий, Вы вынули бревно.
wechoaround %actor% Побагровев от натуги, %actor.name% вынул%actor.q% бревно.
wdoor 70017 north flags a
wdoor 70017 north room 70072
wdoor 70072 south flags a
wdoor 70072 south room 70017
wait 1
detach 70016 %self.id%
~
#70017
резетим триггер с бревном~
2 f 100
~
wdoor 70017 north purge
wdoor 70072 south purge
attach 70016 %self.id%
~
#70018
убили шведа~
0 f 100
*~
if (%world.curobjs(70023)% < 30) && (%random.100% <= 5)
   mload obj 70023
end
if (%world.curobjs(70026)% < 30) && (%random.100% <= 5)
   mload obj 70026
end
if (%world.curobjs(70027)% < 30) && (%random.100% <= 5)
   mload obj 70027
end
if (%world.curobjs(70032)% < 30) && (%random.100% <= 5)
   mload obj 70032
end
if (%world.curobjs(70033)% < 30) && (%random.100% <= 5)
   mload obj 70033
end
~
#70019
убили датчанина~
0 f 100
*~
if (%world.curobjs(70001)% < 30) && (%random.100% <= 5)
   mload obj 70001
end
if (%world.curobjs(70002)% < 30) && (%random.100% <= 5)
   mload obj 70002
end
if (%world.curobjs(70005)% < 30) && (%random.100% <= 5)
   mload obj 70005
end
if (%world.curobjs(70006)% < 30) && (%random.100% <= 5)
   mload obj 70006
end
if (%world.curobjs(70007)% < 30) && (%random.100% <= 5)
   mload obj 70007
end
if (%world.curobjs(70018)% < 30) && (%random.100% <= 5)
   mload obj 70018
end
if (%world.curobjs(70019)% < 30) && (%random.100% <= 5)
   mload obj 70019
end
if (%world.curobjs(70036)% < 30) && (%random.100% <= 5)
   mload obj 70036
end
~
#70020
убили гаддгедлара~
0 f 100
*~
if (%world.curobjs(70001)% < 30) && (%random.100% <= 5)
   mload obj 70001
end
if (%world.curobjs(70004)% < 30) && (%random.100% <= 5)
   mload obj 70004
end
if (%world.curobjs(70018)% < 30) && (%random.100% <= 5)
   mload obj 70018
end
if (%world.curobjs(70034)% < 30) && (%random.100% <= 5)
   mload obj 70034
end
if (%world.curobjs(70035)% < 30) && (%random.100% <= 5)
   mload obj 70035
end
~
#70021
убили берсерка~
0 f 100
*~
if (%world.curobjs(70002)% < 30) && (%random.100% <= 5)
   mload obj 70002
end
if (%world.curobjs(70037)% < 30) && (%random.100% <= 5)
   mload obj 70037
end
if (%world.curobjs(70038)% < 30) && (%random.100% <= 5)
   mload obj 70038
end
if (%world.curobjs(70039)% < 30) && (%random.100% <= 5)
   mload obj 70039
end
~
$~
