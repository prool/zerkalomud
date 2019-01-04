* BRusMUD trigger file v1.0
#100200
приветствие хана~
0 r0 100
~
wait 3
switch %random.2%
case 1
say Здорово путник !
эм тяжело вздохнул и посмотрел вам в глаза
say Присядь...
say Мы гостям хорошим всегда рады, а ты я вижу человек хороший...
wait 1s
плак
say Понимаешь!? Беда со мной приключилась...
say Не уберег я свою кровинушку, дочурку прелестную...
wait 1s
say Напали в степи на нас богатыри лютые.
say Мы то отбились, а вот доченьку мою они в пылу боя с собой утащили.
wait 3
плак
г Ой, горе мне горе...
wait 1s
г Мы конечно в догонку бросились, но эти мрази укрылись в роще, что на востоке.
г Мест этих мы не знаем, поэтому сами туда соваться побаиваимся...
г Мало ли что там может повстречаться.
wait 4
say Не мог бы ты нас из беды выручить, спасти мою доченьку-весеннюю травинку.
attach 100201 %self.id%
detach 100200 %self.id%
break
case 2
say Здраве буде!
say Какая удача, что ты к нам забрел...
wait 6
улыб
say Мы сюда приехали для того, чтобы изловить соколят для охоты.
say И вот уже третий день стоим лагерем у леса и не знаем, как же их достать-то.
взд
say Соколиные гнезда находятся слишком высоко, ни руками, ни копьем достать до них нам не удалось...
say Добудешь мне пяток соколят - отблагодярю по царски...
attach 100202 %self.id%
detach 100200 %self.id%
break
end









~
#100201
квест 1-выдача~
0 d0 1
могу помогу спасу согласен~
if %actor.vnum% != -1
    halt
end
makeuid questor10021 %actor.id%
global questor10021
calcuid mob100215 100215 mob
attach 100210 %mob100215.id%
say Не верю своим ушам, ты воистину храбрый воин..!
say Сам степной ветер принес тебя ко мне!
wait 5
say Я буду ждать тебя здесь...
say Иди же и вызволи мою дочурку!
attach 100211 %self.id%
detach 100201 %self.id%

~
#100202
квест 2 - выдача~
0 d0 1
да согласен добуду~
if %actor.vnum% != -1
    halt
end
makeuid questor10021 %actor.id%
global questor10021
calcuid room100228 100228 room
calcuid room100230 100230 room
calcuid room100234 100234 room
calcuid room100237 100237 room
calcuid room100243 100243 room
attach 100206 %room100228.id%
attach 100206 %room100230.id%
attach 100206 %room100234.id%
attach 100206 %room100237.id%
attach 100206 %room100243.id%
say Прекрасно, а то мы уже подумали поворачивать назад...
say Достань мне пять новорожденных соколят, чтобы мы могли выдрессировать их.
wait 5
say Награда будет ханская... Не пожалеешь...
attach 100203 %self.id%
detach 100202 %self.id%

~
#100203
квест2 (приносим орлят)~
0 j0 100
~
wait 1
if %object.vnum% !=100200
drop all
halt
end
wait 1
mpurge %object% 
eval orlenok1002 %orlenok1002%+1
global orlenok1002
say А вот и %orlenok1002%-й! Ай молодца!
if %orlenok1002%<5 then
say А где остальные? Нужно 5, и не орленком меньше...
halt
end
say О, молодец! Теперь награда как и обещал!
end

~
#100204
Спотыкаемся в ямке~
2 e0 33
~
if !(%random.10% > 5) then
%echoaround% %actor% %actor.name% оступил%actor.u%  и с воплем повалился на землю.
%send% %actor.name% Вы наступили в маленькую ямку и споткнулись.
%force% %actor.name% сесть
end

~
#100205
Царапаемся о сучок~
2 e0 33
~
if !(%random.10% > 5) then
%echoaround% %actor% %actor.name% БОЛЬНО напорол%actor.u%  на острый сучек.
%send% %actor.name% Вы со всего маху налетели на острый сучек...
%send% %actor.name% У вас потемнело в глазах от боли!
%send% %actor.name% Зачем же так спешить?!?
%damage% %actor.name% 100
end

~
#100206
квест 2 (сбиваем орлят)~
2 c0 1
кидать бросать метать швырять~
if !%arg.contains(шишки)%
wsend %actor.name% Что вы хотите швырнуть по гнезду ?  
 return 1
   halt
end
wait 3
wsend  %actor.name% Вы набрали шишек и стали методично закидывать ими гнездо.
wechoaround %actor% %actor.name% набрал%actor.g% шишек и приступил%actor.g% к закидыванию ими гнезда.
wait 1s
if %random.10% < 4 then
wecho Огромный сокол, снижаясь, затмил солнце своими крыльями...
wecho Финист ясна сокол прилетел на выручку маленьких соколят!
wload mob 100201
end
wait 3
wecho Большой кречет спустился из-за облаков, чтобы защитить свое гнездо...
wecho Большой кречет спустился из-за облаков, чтобы защитить свое гнездо...
wload mob 100200
wload mob 100200
wait 5s
wsend  %actor.name% Вскоре вам страшно повезло...
wsend  %actor.name% Ваш меткий бросок пошатнул гнездо и из него вывалился маленький соколенок.
wechoaround  %actor% Вскоре меткое попадание %actor.rname% пошатнуло гнездо.
wechoaround  %actor% Маленький соколенок с писком выпал из гнезда...
wait 4
%echo% Соколенок шлепнулся вам подноги!
wload obj 100200
detach 100206 %self.id%

~
#100207
дует ветер в степи~
2 b0e0 33
~
wait 4
%echo% Могучий степной ветер просвистел у вас в ушах...

~
#100208
паутина тарантула~
0 b0 66
~
eval target %random.pc% 
%send% %target.name% Тарантул оплел вас липкой паутиной...
%echoaround% %target.name% Тарантул принелся метать паутину в %target.rname%...
dg_cast 'сеть' %target.name%
wait 5
%send% %target.name% Тарантул сковал ваши движения...
%echoaround% %target.name%  Паутина сковала движения %target.rname%!
%send% %target.name% Вы повалились на бок!
%echoaround% %target.name% %target.name% повалил%target.u% на бок!
mforce %target.name% сесть
dg_cast 'оцепенение' %target.name%

~
#100209
репоп зоны~
2 f0 100
~
calcuid hantirah 100207 mob
detach 100200 %hantirah.id%
detach 100201 %hantirah.id%
detach 100202 %hantirah.id%
detach 100203 %hantirah.id%
detach 100211 %hantirah.id%
attach 100200 %hantirah.id%
detach 100210 %mob100215.id%
detach 100206 %room100228.id%
detach 100206 %room100230.id%
detach 100206 %room100234.id%
detach 100206 %room100237.id%
detach 100206 %room100243.id%

~
#100210
квест1 (освобождаем девушку)~
0 c0 100
освободить~
if %actor.vnum% != -1
    halt
end
if !%arg.contains(девушка)%
%send% %actor.name% Кого вы хотите освободить ?  
 return 1
   halt
end
%send% %actor.name% Вы освободили дочь печенежского хана.
%echoaround% %actor% %actor.name% освободил%actor.g% дочь печенежского хана.
wait 5
след %actor.name%
wait 2
г Отведи меня домой, смелый богатырь...
makeuid questor10022 %actor.id%
worlds questor10022
calcuid mob100207 100207 mob * Хан-Тирах
attach 100210 %mob100207.id%
detach 100210 %self.id%

~
#100211
квест1 (привод девушки)~
0 h0 100
~
wait 1
calcuid krasa 100215 mob
if (%krasa.realroom% != %self.realroom%)
  хму
  say Торопись добрый молодец, мало ли , что может с моей ненаглядной сделаться.
  halt 
end
if (%questor10021.id% != %questor10022.id%)
  wait 1s
  say Я не тебя просил о помощи, но все же спасибо.
  say  А теперь кыш отсюда....
  посл %questor10022.name%
  halt
end
wait 1s
визж
%purge% %krasa%
say Молодец ! 
say Как же мне отблагодарить тебя %questor10022.name%..?
дум %questor10022.name%
detach 100211 %self.id% 

~
#100212
репоп хана~
0 n0 100
~
 set orlenok1002 0
 global orlenok1002

~
$
$
