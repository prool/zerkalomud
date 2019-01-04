* BRusMUD trigger file v1.0
#79300
вынутькол~
2 c0 1
вынуть высунуть вытащить взять~
if !(%arg.contains(кол)%) 
   wsend %actor% И что это Вы собираетесь вытаскивать?
   return 1
   halt
else
wait 1
wecho Как только кол был извлечен из своего местоположения, вся полянка рухнула вниз.
wteleport all 79310
wdoor 79301 north room 79310
end






~
#79301
дамаготверевки~
2 c0 1
лезть пролезть~
if !(%arg.contains(веревка)%) 
   wsend %actor% И по чем Вы собрались куда-то лезть?
   return 1
   halt
else
wait 1
wsend %actor% Как только Вы ухватились за веревку раздался дикий треск, и сверху на 
wsend %actor% Вас обрушился град кинжалов.
wechoaround %actor.name% Как только %actor.name% ухватился за веревку раздался дикий треск, 
wechoaround %actor.name% и сверху на Вас обрушился град кинжалов.
foreach pc %actor.pc%
eval dam (%pc.maxhitp%/100)*95
 wdamage %pc% %dam%
done
calcuid ver 79301 obj
wpurge %ver%
detach 79301 %self.id%
end







~
#79302
дамаготдерева~
2 c0 1
взобраться залезть~
if !(%arg.contains(дерево)%) 
   wsend %actor% И куда это Вы собрались залезть?
   return 1
   halt
else
wait 1
wsend %actor% Вы начали взбираться наверх. 
wsend %actor% Неожиданно сук надломился... падать на попу больно.
wechoaround %actor.name% %actor.name% начал взбираться вверх по дереву. 
wechoaround %actor.name% Неожиданно сук надломился и %actor.name% со свистом рухнул вниз.
wdamage %actor.name% 370
end





~
#79303
лезтьяма~
2 c0 1
пролезть~
if !(%arg.contains(яма)%) 
   wsend %actor% Куда это Вы хотите пролезть?
   return 1
   halt
else
wait 1
wteleport %actor.name% 79306
end






~
#79304
телепортвдт1~
2 z0 1
*~
wait 1
wteleport all 79358
end






~
#79305
отодратьдоска~
2 c0 1
отодрать оторвать~
if !(%arg.contains(доску)%) 
   wsend %actor% И что это Вы собираетесь отодрать?
   return 1
   halt
else
wait 1
wteleport all 79361
calcuid room1 79306 room
exec 79304 %room1.id%
calcuid room2 79307 room
exec 79307 %room2.id%
calcuid room4 79309 room
exec 79308 %room4.id%
calcuid room5 79303 room
calcuid room6 79305 room
detach 79303 %room5.id%
detach 79303 %room6.id%
attach 79306 %room5.id%
attach 79306 %room6.id%
end





~
#79306
лезтьяма2~
2 c0 1
лезть пролезть~
if !(%arg.contains(яма)%) 
   wsend %actor% Куда это Вы хотите пролезть?
   return 1
   halt
else
wait 1
wsend %actor% Вы собрались было лезть в яму, но она оказалась вся засыпана землей.
end






~
#79307
телепортвдт2~
2 z0 1
*~
wait 1
wteleport all 79360
end






~
#79308
телепортвдт3~
2 z0 1
*~
wait 1
wteleport all 79362
end






~
#79309
волшликсмотрителю1раз~
0 r0 100
*~
wait 1
Осм %actor.name%
say Новенький? Почему без дела болтаешься?!
say Быстро вали к старейшине, там получишь задание. Он в южных пещерах лагеря. 
say Еще раз увижу, что просто так шляешься, врою!
attach 79310 %self.id%
detach 79309 %self.id%





~
#79310
волшликсмотрителю2раз~
0 r0 100
*~
wait 1
рыч
атак .%actor.name%
detach 79309 %self.id%





~
#79311
волшликстарейшине~
0 r0 100
*~
wait 1
эм внимательно осмотрел Вас.
say Ты хочешь вступить в гильдию и учиться нашему ремеслу?
attach 79314 %self.id%
attach 79315 %self.id%
detach 79311 %self.id%


~
#79312
лезтьвышка~
2 c0 1
лезть вскарабкаться~
if !(%arg.contains(вышка)%) 
   wsend %actor% Куда это Вы хотите влезть?
   return 1
   halt
else
wait 1
wteleport %actor.name% 79315
end





~
#79313
сбежавшийученик~
0 r0 100
*~
wait 1
say Стой!!!
say Не подходи ко мне!
say Я сейчас здесь все обрушу!
say Я пожертвую собой, ради всех добрых людей. Я уничтожу проход к тренировочному лагерю душегубов!
wait 25s
эм перекрестился и с силой рванул одну из досок опалубки.
оторвать доску

~
#79314
нетстарейшине~
0 d0 1
нет~
wait 1
say Тогда ты для нас бесполезен, и зря сюда пришел.
wait 1
встать
атак %actor.name%
detach 79315 %self.id%
detach 79314 %self.id%


~
#79315
дастарейшине~
0 d0 1
да~
wait 1
makeuid xman %actor.id%
worlds xman
say Тогда тебе следует пройти испытание.
say Северные пещеры населены древними чудищами. Убей их всех, дабы доказать, что достоин 
say находиться здесь.
wait 5
mecho Старейшина кивнул одному из телохранителей, который тут же скрылся.
calcuid tel 79316 mob
mpurge %tel%
wait 5
say Зайди к мастеру, он уже в курсе о твоем задании и даст тебе соответствующие 
say наставления. Сейчас мастер на северо-востоке лагеря. 
wait 1
calcuid mast 79304 mob
calcuid smotr 79301 mob
attach 79316 %mast.id%
detach 79310 %smotr.id%
detach 79314 %self.id%
detach 79315 %self.id%


~
#79316
волшликмастеру~
0 r0 100
*~
wait 1
say Мне уже сообщили, что ты взялся очистить северные пещеры от тамошних обитателей. Это 
say будет не так просто, но если ты справишься, то у тебя будет шанс попасть в гильдию. 
say Более того, старейшина наверняка оплатит твои старанья.
wait 1
say Тебе следует знать, что самая старая часть пещер, пока что завалена. Но в восточной 
say ветке обосновался страшный зверь, предсмертный рык которого в состоянии сокрушить 
say стены.
say Думаю, с него тебе и стоит начать.
wait 5
mecho Мастер еле заметно мотнул головой, и в дверях мелькнула чия то тень.
calcuid str 79308 mob
mpurge %str%
wait 2
calcuid str 79308 mob
mpurge %str%
wait 5
say Ступай. Я уже распорядился, что бы стражей, охраняющих вход в пещеры, убрали.
detach 79316 %self.id%





~
#79317
Зупатармертв~
0 f0 100
*~
if (%world.curobjs(79312)% < 3) && (%random.1000% <= 100)
   mload obj 79312
end
mecho От дикого предсмертного рева Зупатара у Вас остановилась кровь в жилах.
mecho Откуда-то послышался град падающих камней.
mdoor 79347 east room 79357
mdoor 79345 west room 79357


~
#79318
Вертопрахмертв~
0 f0 100
*~
if (%world.curobjs(79314)% < 3) && (%random.1000% <= 50)
   mload obj 79314
end
if (%world.curobjs(79315)% < 3) && (%random.1000% <= 50)
   mload obj 79315
end
if (%world.curobjs(79316)% < 3) && (%random.1000% <= 50)
   mload obj 79316
end
calcuid star 79302 mob
attach 79319 %star.id%


~
#79319
сдаемквестстарейшине~
0 r0 100
*~
if %actor.id% == %xman.id%
wait 1
say Поздравляю! Ты прошел вступительный экзамен и теперь можешь приступать к постижению 
say нашего мастерства.
wait 5
say Кроме того, ты заслужил награду.
wait 5
eval rand %random.100%
if (%rand% < 30) & (%world.curobjs(79310)% < 3)
mload obj 79310
дать символ %actor.name%
elseif (%rand% < 25) & (%world.curobjs(79311)% < 2)
mload obj 79311
дать стилет %actor.name%
else
%actor.exp(+300000)%
wait 5
mecho Вы заметили, что Ваш опыт увеличился.
end
wait 5
mecho Старейшина закрыл глаза, дав понять, что на сегодня общение окончено.
detach 79319 %self.id%
else 
mecho Ступай с миром путник. Тебе здесь не место.
end


~
#79320
ребут~
2 f0 100
*~
wdoor 79301 north room 79302
wdoor 79347 east room 79346
wdoor 79345 west room 79346
calcuid roomver 79301 room
attach 79301 %roomver.id%
calcuid room5 79303 room
calcuid room6 79305 room
detach 79306 %room5.id%
detach 79306 %room6.id%
attach 79303 %room5.id%
attach 79303 %room6.id%


~
#79321
дезАдепта1~
0 f0 100
*~
if (%world.curobjs(79304)% < 3) && (%random.1000% <= 150)
   mload obj 79304
end
if (%world.curobjs(79305)% < 3) && (%random.1000% <= 150)
   mload obj 79305
end


~
#79323
дезУченика1~
0 f0 100
*~
if (%world.curobjs(79306)% < 5) && (%random.1000% <= 150)
   mload obj 79306
end
if (%world.curobjs(79307)% < 5) && (%random.1000% <= 150)
   mload obj 79307
end


~
#79325
дезмлУченика~
0 f0 100
*~
if (%world.curobjs(79308)% < 5) && (%random.1000% <= 150)
   mload obj 79308
end


~
#79326
дезМастера~
0 f0 100
*~
if (%world.curobjs(79309)% < 2) && (%random.1000% <= 100)
   mload obj 79309
end


~
#79328
дезСкалозуба~
0 f0 100
*~
if (%world.curobjs(79313)% < 2) && (%random.1000% <= 50)
   mload obj 79313
end


~
$
$
