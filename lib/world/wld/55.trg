* BRusMUD trigger file v1.0
#5500
хозяйка-встреча~
0 r0 100
~
if %actor.vnum% != -1
 halt
end
if %world.curmobs(5500)% > 0
msend %actor.name% Хозяйка заметила ваше присутствие и повернулась к вам.
tell %actor.name% Добрый день!
tell %actor.name% Как занесло тебя в наши богом забытые края? Здесь обитаем только мы.
tell %actor.name% Раз ты прошел через окружающий лес, ты достаточно силен и опытен.
tell %actor.name% У меня есть к тебе просьба, спаси нас от напасти.
tell %actor.name% Коршуны повадились похищать наших кур и цыплят, бестии.
tell %actor.name% Убей их, и принеси доказательство их смерти.
tell %actor.name% Я отблагодарю тебя за это.
msend %actor.name% Хозяйка продолжила заниматься своими делами.
end


~
#5501
смерть коршуна~
0 f0 100
~
if %world.curmobs(5500)%==1 && %world.curobjs(5500)%==0
mload obj 5500
calcuid ovar 5500 obj
attach 5503 %ovar.id%
end


~
#5502
дали хозяйке~
0 j0 100
~
wait 1
if (%object.vnum%==5500)&&!(%self.fighting%)
 tell %actor.name% Ух ты, ты убил окаянных!
 mecho Хозяйка осмотрела окровавленное крыло.
 dg_cast 'насыщение' %actor.name%
 dg_cast 'восстановление' %actor.name%
 dg_cast 'исцеление' %actor.name%
 dg_cast 'освящение' %actor.name%
 calcuid hostr 5514 mob
 attach 5504 %hostr.id%
 attach 5507 %hostr.id%
  if %random.5% == 1 && %world.curobjs(516)% < 1
   mload obj 516
   дать береста %actor.name%
  end
 tell %actor.name% Спасибо, ты выручаешь нас.
 calcuid target 5500 obj
 mpurge %target.name%
end


~
#5503
подняли крыло~
1 g0 100
~
if %actor.realroom% == 5548 || %actor.realroom%  == 5549
 oforce %actor.name% сесть
 osend %actor.name% Наклонившись за крылом вы наступили на залитое кровью место и подскользнулись.
 osend %actor.name% Ну что, будем считать сколько тут веток до земли встетится, раз, два, три ...
 wait 5
 if %actor.sex% == 1
 oecho %actor.name% полетел вниз с дерева.
 else
 oecho %actor.name% полетела вниз с дерева.
 end
 osend %actor.name% Вы полетели вниз с дерева.
 oteleport %actor.name% 5528
 if %actor.sex% == 1
 oechoaround %actor% %actor.name% упал с дерева.
 else
 oechoaround %actor% %actor.name% упала с дерева.
 end
 osend %actor.name% ООО, БОЛЬНО!
 osend %actor.name% Земля распростерла перед вами свои объятья.
 osend %actor.name% Вокруг примятости в земле, похожие на оставленную вмятину от вас.
 oforce %actor.name% смотреть
 odamage %actor.name% 50
end


~
#5504
хозяин-встреча~
0 r0 100
~
if %actor.vnum% != -1
 halt
end
if %world.curmobs(5503)% > 0 && %world.curobjs(5514)%==0
msend %actor.name% Хозяин поднял голову и посмотрел в вашу сторону.
tell %actor.name% Добрый день путник!
tell %actor.name% Ты помог избавится нам от коршунов, спасибо тебе!
tell %actor.name% Если ты смог их победить может ты и мне сделаешь услугу.
tell %actor.name% Я нанимаю на работу окрестных мужиков, они в принципе хорошо работают.
tell %actor.name% Но вот в последний раз взял на работу троих и очень пожелел.
tell %actor.name% Работать не хотят совсем, все спят на полатях и есть требуют.
tell %actor.name% Я уже стар и не в состоянии выгнать их.
tell %actor.name% Одолей их, и я отблагодарю тебя.
tell %actor.name% Да, самое главное - отбери у них ключ от моего сундука, украли они, точно.
mload obj 5514
calcuid vobj 5514 obj
взять %vobj.name%
воор %vobj.name%
msend %actor.name% А я если что встречу из здесь!
msend %actor.name% Хозяин встал из-за стола и прошел по комнате.
msend %actor.name% Только здесь вы заметили что он хромает и с трудом передвигает левую ногу.
msend %actor.name% Да, сейчас из него вояка совсем никакой.
end


~
#5505
смерть лентяя~
0 f0 100
~
if %world.curmobs(5503)%==1 && %world.curobjs(5514)%==1
msend %actor.name% Лентяй вдруг кромко закричал:
msend %actor.name% Мужики, помогите, наших бьют!
msend %actor.name% В дом быстро вбежали непонятно откуда взявшиеся сердитые мужики.
msend %actor.name% И стали БОЛЬНО вас бить. Ах вы гады, счас я вас отоварю.
msend %actor.name% Умирая летняй отдал ключ сердитым мужикам.
mload mob 5504
mload mob 5504
end


~
#5506
смерть мужика~
0 f0 100
~
if %world.curmobs(5504)%==1 && %world.curobjs(5508)%==0
mload obj 5508
end


~
#5507
дали хозяину~
0 j0 100
~
wait 1
if %object.vnum%==5508
 calcuid vobj 5514 obj
 снять %vobj.name%
 mpurge %vobj.name%
 say Молодец! Наконец-то нашлась на них управа.
 say Надеюсь они не вернуться?
 mecho Хозяин глубокомусленно посмотел на вашу одежду всю в пятнах крови.
 say Спасибо, ты выручил нас.
 mecho Хозяин отошел к сундуку, открыл его.
 switch %random.6%
 case 1
  if %world.curobjs(5503)% < 4
   mload obj 5503
   дать меч %actor.name%
  else
   %self.gold(+300)%
   дать 300 кун %actor.name%
  end
  break
 case 2
  if %world.curobjs(5504)% < 2
   mload obj 5504
   дать доспехи %actor.name%
  else
   %self.gold(+300)%
   дать 300 кун %actor.name%
  end
  break
 case 3
  if %world.curobjs(512)% < 2
   mload obj 512
   дать книга %actor.name%
  else
   %self.gold(+300)%
   дать 300 кун %actor.name%
  end
  break
 case 4
  if %world.curobjs(500)% < 1
   mload obj 500
   дать книга %actor.name%
  else
   %self.gold(+300)%
   дать 300 кун %actor.name%
  end
  break
 default
   %self.gold(+300)%
   дать 300 кун %actor.name%
  break
 done
 msend %actor.name% Это все, чем я смогу тебя отблагодарить, так что извини.
 calcuid target 5508 obj
 mpurge %target.name%
else
 eval getobject %object.name%
 drop %getobject.car%.%getobject.cdr%
 break
end
 calcuid hostr 5514 mob
 detach 5504 %hostr.id%
 detach 5507 %hostr.id%

~
$
$
