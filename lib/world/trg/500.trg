#50000
камень_падает~
1 h 100
~
context 500quest
wait 1
set room %self.room%
attach 50083 %room.id%
oecho Время пошло !
wait %pause%s
oecho Время закончилось!
detach 50083 %room.id%
attach 50084 %room.id%
oecho Победитель - тот кто возьмет доказательство!
set schet 2
while (%schet% > 1)
set schet 0
set igrok %room.people%
while %igrok%
if %igrok.vnum% == -1
eval schet %schet%+1
end
set igrok %igrok.next_in_room%
done
wait 10s
done
oecho Вы победитель !
wait 5s
set schet 0
set igrok %room.people%
while %igrok%
if %igrok.vnum% == -1
eval schet %schet%+1
end
set igrok %igrok.next_in_room%
done
if %schet% == 0
oecho Здесь нет ниодного игрока!!!
oecho Некому быть победителем!!!
detach 50084 %room.id%
oecho Теперь все могут войти.
opurge %self%
halt
else
oecho Возьмите доказательство Вашей победы.
oload obj 50001
end
opurge %self%
~
#50001
начало_квестов_переходы_в_зону_500~
2 c 100
начать~
context 500quest
if %pause%
wecho Один квест уже начат!
halt
end
if !%arg%
wecho Скажите какой квест начать !
halt
end
if %arg% == камень
wdoor 50082 west purge
wdoor 50082 west room 50001
wdoor 50082 west flags a
wforce вестник.богов.квест орать Боги зовут вас доказать свою стойкость, встаньте у камня, и возьмите доказательство.
wforce вестник.богов.квест орать Проводники помогут вам попасть в это волшебное место. Ищите их по всему миру.
eval pause 900+%random.1100%
worlds pause
exec 50008 %self.id%
elseif %arg% == кровь
wdoor 50082 east purge
wdoor 50082 east room 50014
wdoor 50082 east flags 0
wforce вестник.богов.квест орать Боги зовут вас на &Rкровавую&Y битву, ступайте к проводникам, и докажите
wforce вестник.богов.квест орать что именно Вы достойны Славы и Чести быть Последним кто останется в живых!
wforce вестник.богов.квест орать У Вас мало времени, что бы успеть к месту битвы! Торопитесь!
eval pause 900+%random.120%
worlds pause
else
wecho Нет такого квеста !
halt
end
wecho Повинуясь вашему желанию в мире стали появляться Проводники.
wecho комнаты: корса 27030, НК - 49954, галич - 34453, брянск - 66001, ВН - 60050
wat 60050 %load% mob 50000
wat 66001 %load% mob 50000
wat 34453 %load% mob 50000
wat 49954 %load% mob 50000
wat 27030 %load% mob 50000
wait %pause%s
wat 27030 %purge% проводник.квест
wat 27030 wecho Проводник улыбнулся и расстворился в воздухе.
wat 49954 %purge% проводник.квест
wat 49954 wecho Проводник улыбнулся и расстворился в воздухе.
wat 34453 %purge% проводник.квест
wat 34453 wecho Проводник улыбнулся и расстворился в воздухе.
wat 66001 %purge% проводник.квест
wat 66001 wecho Проводник улыбнулся и расстворился в воздухе.
wat 60050 %purge% проводник.квест
wat 60050 wecho Проводник улыбнулся и расстворился в воздухе.
wdoor 50082 east flags abcd
~
#50002
вход_к_проводнику~
0 q 100
~
wait 1
say Приветствую тебя, хочешь попасть в мир заданий и соревнований ?
~
#50003
игрок сказал хочу~
0 cd 0
хочу да конечно~
if %actor.level% > 1
say Ну что же, тогда милости просим.
*
end
calcuid room %self.realroom% room
attach 50005 %room.id%
exec 50005 %room.id%
detach 50005 %room.id%
~
#50004
автозакрытие_двери~
2 j 100
~
*if %drection% == west
wait 3s
wecho С тихим шелестом круглая дверь закрылась.
wdoor 50082 west flags b
*end
* в связи с тем что бага какая-то и направление не передается, просто закрваю дверь
~
#50005
портал_в_начало_квест-зоны~
2 z 100
~
wportal 50080 1
~
#50006
возврат_из_квеста~
0 cd 1
вернуться~
say Не знаю вот, получится мне тебя среколить, ну если что попробуй еще раз.
msend %actor% Да уж, устали Вы что-то, пора и честь знать.
dg_cast 'слово возврата' %actor.name%
say Пока, %actor.name%.
~
#50007
делит~
2 g 100
~
wait 1
wecho Ваша энергия уменьшилась!
eval temp %actor.move(-30)%
~
#50008
запуск_квест_камень~
2 z 100
~
calcuid nablud 50001 mob
attach 50009 %nablud.id%
run 50009 %nablud.id%
detach 50009 %nablud.id%
~
#50009
квест_камень_бросаем_камень~
0 z 100
~
mload obj 50000
west
south
бр камень
north
east
появ
~
#50010
взял доказательство~
1 g 100
~
if %actor.vnum% != -1
return 0
halt
else
wait 1
set room %self.room%
detach 50084 %room.id%
oecho Теперь все могут войти.
osend %actor% Вам надо отдать доказательство наблюдателю, он здесь рядом!
end
detach 50010 %self.id%
~
#50011
дали доказательство наблюдателю~
0 j 100
~
if %object.vnum% != 50001
say Зачем мне это ?
бр все
halt
else
wait 1
mpurge %object%
сказа %actor.name% ну что же, выдам тебе я приз, пусть судьба решит, что это будет
wait 1s
mecho Наблюдатель отвернулся, и Вы услышали стук падающих костей.
wait 1s
switch %random.3%
case 1
mload obj 50012
say Это удобный браслет, для твоих рук.
д брасл.побе %actor.iname%
break
case 2
mload obj 50013
say Это медаль, для твоей груди.
д медаль.побе %actor.iname%
break
case 3
say Это кольцо, одень его.
mload obj 50014
д кольц.побе %actor.iname%
break
done
context 500quest
unset pause
end
~
#50012
ресет зоны~
2 f 100
~
context 500quest
if !%pause%
wdoor 50082 east flags abcd
wdoor 50082 west flags abcd
calcuid nablud 50001 mob
wpurge %nablud%
wat 50002 wload mob 50001
end
~
#50020
добавить_слава_5~
1 j 100
~

~
#50021
страшная ХАРЯ~
1 j 100
~
wait 1
oecho _Страшная харя жутко скривилась и нагло ухмыльнулась Вам, обнажив клыки.
~
#50048
Выдача именного шмота - корчмарь~
0 q 100
~
wait 1
if (%actor.name% == Удал)
if (%world.curobjs(50063)% == 0)
say Мое почтение! Вот ваша вещица, не пропала!
mload obj 50063
дать голова .удал
end
elseif (%actor.name% == Ювеналий)
if (%world.curobjs(50064)% == 0)
say Ааа, Ювеналий! Пожаловал.. Забирай свою коробку...
морщ
крест
mload obj 50064
дать тфилин .ювеналий
end
elseif (%actor.name% == Рианда)
if (%world.curobjs(50065)% == 0)
шляп
say Приветствую, волхвам мое почтение! Вот и сумка ваша.
mload obj 50065
дать сумка .рианда
end
end
~
#50049
Хранитель выдает шмот~
0 q 100
~
wait 1
if (%actor.name% == Мильян)
if (%world.curobjs(50054)% == 0)
say Смотри кто пожаловал, давно тебя жду, заберешь ты, наконец, свой кусячий узелок или нет ? На держи.
mload obj 50054
д кушак .мильян
end
end
if (%actor.name% == Урик)
if (%world.curobjs(50051)% == 0)
say Да, знаю твое горе, где-то тут у меня валяется эта красная тряпочка...
mload obj 50051
д кушак .урик
end
end
if %actor.name% == Прокиус
if %world.curobjs(1091)% == 0
say Здравствуй, Прокиус! Знаю я зачем ты пришел.
say Сейчас, сейчас, найду.
wait 1s
say Ах, вот он!
mload obj 1091
д посо прокиус
end
end
if %actor.name% == Сташа
if %world.curobjs(50050)% == 0
say Приветствую тебя, Сташа. Рад видеть у себя в гостях, вот и подарочек припас.
wait 1s
mload obj 50050
д авоська cташа
end
elseif %actor.name% == Лешко
if %world.curobjs(50052)% == 0
say Ах, да... старый Лешко. Здаров, вижу я зачем ты пожаловал, держи свою вышивку.
хих лешко
mload obj 50052
д авось.лешк .лешко
end
elseif %actor.name% == Ерихон
if %world.curobjs(50053)% == 0
say Ааа, пришел за своим вещь мешком ? Да в него наверное пол НК влезет, забирай, он тут у меня кучу места жрет.
mload obj 50053
д сум.ери .ерихон
end
elseif %actor.name% == Некрас
if %world.curobjs(50055)% == 0
say За котомкой явился? Забирай эту царапучую - она мне все лавки когтями ободрала!
mload obj 50055
give котомка .некрас
end
elseif %actor.name% == Кирдан
if %world.curobjs(50056)% == 0
say За сумкой явился? Ну забирай... А то она тут вечно храпит во сне.
say И княжеский пожарнадзор штраф взять норовит!
mload obj 50056
give сумка .Кирдан
end
elseif %actor.name% == Дера
if %world.curobjs(50057)% == 0
say Ааа, Дера, пожаловала наконец!
say Забирай свою корзину визглявую - у меня от нее мигрень.
mload obj 50057
give корзин .Дера
end
elseif %actor.name% == Задиг
if %world.curobjs(50059)% == 0
say Явился, наконец, жулик!
ворч
say Вот твоя котомка - забирай. Орет без конца, да еще и подмигивает, скотина!
mload obj 50059
give корзин .задиг
end
elseif %actor.name% == Илерий
if %world.curobjs(50058)% == 0
say Здравствуй, здравствуй, Илерий!
шляп
say Вот твоя награда - не пропала.
mload obj 50058
give оредн .илерий
end
elseif %actor.name% == Никомир
if %world.curobjs(50060)% == 0
say Лекарю-травнику мое почтение!
шляп
say Вот и сумка ваша - не запропала.
mload obj 50060
give сумка .Никомир
end
elseif %actor.name% == Тирфа
if %world.curobjs(50061)% == 0
say Здраве буде, Тирфа!
шляп
say Помню-помню, за чем ты пришла... Вот она, пожалуйста.
mload obj 50061
give сумочка .тирфа
end
elseif %actor.name% == Феосий
if %world.curobjs(50062)% == 0
say Онвад с унод, друже Феосий? 
: хитро ухмыльнулся и подмигнул Вам
say Знаю, зачем ты пришел, знаю... Вот он, узелок твой.
mload obj 50062
give узелок .феосий
end
end
бр все
~
#50050
именной_шмот_Сташа~
1 gjp 100
~
if (%actor.level% > 30 ) && (%actor.vnum% == -1 )
halt
end
if %actor.name% == Сташа
oechoaround %actor% Цветы на авоське Сташи зашевелились, открылись, вокруг разлилось благоухание.
osend %actor% Цветы повернули к Вам свои бутоны, и распахнулись. Запах Весны заполнил все вокруг.
halt
else
osend %actor% Цветы начали вянуть, и осыпались.
osend %actor% Авоська медленно растаяла у Вас в руках.
%purge% %self%
~
#50051
именной шмот Урик~
1 gjp 100
~
if (%actor.level% > 30 ) && (%actor.vnum% == -1 )
halt
end
if %actor.name% == Урик
osend %actor% Кушак удобно лег вокруг пояса, Вам не хочется с ним расставаться.
oechoaround %actor% Исходящее от Урика чувство близости Смерти бросило Вас в дрожь.
halt
else
oechoaround %actor% Не сумев совладать с отвращением, %actor.iname% разорвал%actor.g% кушак в клочья.
osend %actor% Не сумев совладать с отвращением, Вы разорвали кушак в клочья.
%purge% %self%
end
~
#50052
именной шмот Лешко~
1 gjp 100
~
if (%actor.level% > 30 ) && (%actor.vnum% == -1 )
halt
end
if %actor.name% == Лешко
oechoaround %actor% Рыжеволосая богатырша, изображенная на авоське Лешко, ехидно улыбнулась Вам.
osend %actor% Рыжеволосая богатырша благосклонно улыбнулась Вам. Вы почувствовали спокойствие.
halt
else
osend %actor% Авоська рассыпалась у Вас в руках, ниточка за ниточкой.
oechoaround %actor% Ткань авоськи начала расползаться в руках %actor.rname%, и совсем развалилась.
%purge% %self%
~
#50053
именной шмот Ерихон~
1 gjp 100
~
if (%actor.level% > 30 ) & (%actor.vnum% == -1 )
halt
end
if %actor.name% == Ерихон
wait 1
oechoaround %actor% Сума Ерихона начала раздуваться в предвкушении сладостей.
osend %actor% Ваша сума проголодалась и требует сладких плюшек.
halt
else
oecho _Сума Ерихона  воинственно надулась, давая понять , что готова отдать содержимое только своему хозяину.
return 0
halt
end
~
#50054
именной шмот Мильян~
1 gjp 100
~
if (%actor.level% > 30 ) && (%actor.vnum% == -1 )
halt
end
if %actor.name% == Мильян
osend %actor% Кровавая Зверюшка на узелке облизнула короткие острые зубки.
oechoaround %actor% Кровавая Зверюшка на узелке Мильяна осмотрела Вас в надежде найти что-нибудь полезное.
halt
else
oechoaround %actor% %actor.iname% испуганно отдернул руку от узелка, Вам показалось его кто-то укусил.
osend %actor% Странная зверушка на узелке цапнула Вас за палец, от неожиданности Вы дернулись и узелок развязался.
%purge% %self%
end
~
#50055
Именной шмот - Некрас~
1 gjp 100
~
if (%actor.level% > 30 ) && (%actor.vnum% == -1 )
halt
end
if %actor.name% == Некрас
wait 1
oechoaround %actor% Легенький белый пушок на котомке %actor.vname% слегка зашевелился на ветру.
osend %actor% Легенький белый пушок на котомке слегка зашевелился на ветру.
halt
else
oechoaround %actor% %actor.iname% взвизгнул%actor.g% и отскочил%actor.g% в сторону от пушистой котомки.
osend %actor% Из котомки вдруг высунулась лапа с острыми когтями и вы едва не поплатились пальцем за нахальство.
end
~
#50056
Именной шмот Кирдан~
1 gjp 100
~
if (%actor.level% > 30 ) && (%actor.vnum% == -1 )
halt
end
if %actor.name% != Кирдан
return 0
oechoaround %actor% Лежащая на земле сумка вдруг лязгнула зубищами и БОЛЬНО цапнула %actor.vname%!
oechoaround %actor% %actor.iname% завопил%actor.g% и отскочил%actor.g% в сторону.
osend %actor% Сумка вдруг лязгнула зубами и ОЧЕНЬ БОЛЬНО укусила Вас!
halt
else
wait 1
*oecho _Сумка Кирдана завозилась, устраиваясь поудобнее.
*oecho __Кащей Бессмертный вспомнил своего ручного змея и загрустил...
end
~
#50057
Именной шмот - Дера~
1 gjp 100
~
if (%actor.level% > 30 ) && (%actor.vnum% == -1 )
halt
end
if %actor.name% != Дера
return 0
oechoaround %actor% %actor.name% попытался взять странную корзинку.
oecho ___Корзина вдруг истошно завопила: "Верни на место!"
halt
else
wait 1
oecho _Корзина поудобней устроилась на теле Ведьмы.
end
~
#50058
Именной шмот Илерий~
1 gjp 100
~
if (%actor.level% > 30 ) && (%actor.vnum% == -1 )
halt
end
if %actor.name% != Илерий
return 0
oechoaround %actor% Орден вдруг яросто вспыхнул, и едва не спалил %actor.name% дотла!
oecho ___Орден вдруг яросто вспыхнул, и едва не спалил Вас дотла!
halt
else
wait 1
oecho _Орден Удомельского братства на груди Илерия ярко сверкнул.
end
~
#50059
Именной шмот Задиг~
1 gjp 100
~
if (%actor.level% > 30 ) 88 (%actor.vnum% == -1 )
halt
end
if %actor.name% != Задиг
return 0
oechoaround %actor% %actor.name% попытался взять котомку.
oecho ___Нарисованный на котмке драконий глаз едва не испепелил %actor.vname% дотла!
halt
else
wait 1
oecho _Глаз на котомке Задига вдруг засветился и подмигнул Вам.
oecho ___Неожиданно раздался ЖУТКИЙ вопль и глаз полыхнул кровавым огнем!
end
~
#50060
Именной шмот - Никомир~
1 gjp 100
~
if (%actor.level% > 30 ) && (%actor.vnum% == -1 )
halt
end
if %actor.name% != Никомир
return 0
oechoaround %actor% %actor.name% попытал%actor.u% взять сумку, но вдруг покачнул%actor.u% и едва не упал%actor.g%.
oecho __Запах из внезапно открывшейся сумки был настолько резким, что вы на секунду потеряли сознание.
halt
else
wait 1
oecho _Никомир положил еще пару стебельков в сумку для сбора трав.
end
~
#50061
Именной шмот - Тирфа~
1 gjp 100
~
if (%actor.level% > 30 ) && (%actor.vnum% == -1 )
halt
end
if %actor.name% != Тирфа
return 0
oechoaround %actor% %actor.name% наклонил%actor.u% над сумкой, но вдруг вскрикнул%actor.g% и отскочил%actor.g%.
osend %actor%  _Сумочка вдруг распахнулась, и два ряда белоснежных зубов едва не оставили Вас без пальцев!
halt
else
wait 1
oecho Глаза нетопыря на сумочке Тирфы сверкнули недобрым блеском.
end
~
#50062
Именной щмот - Феосий~
1 gjp 100
~
if (%actor.level% > 30 ) && (%actor.vnum% == -1 )
halt
end
if %actor.name% != Феосий
return 0
oechoaround %actor% %actor.name% наклонил%actor.u% чтобы взять узелок...
oechoaround %actor% __...но откуда-то появился вор, выхватил узелок и был таков.
osend %actor% __Вор изображенный на узелке Феосия чуть не отрубил Вам руку и скрылся.
*opurge %self%
halt
else
wait 1
oecho На мгновение вам показалось, что ваши вещи переходят в узелок Феосия.
end
~
#50063
Именной шмот - Удал~
1 gjp 100
~
if (%actor.level% > 30 ) && (%actor.vnum% == -1 )
halt
end
if %actor.name% != Удал
oechoaround %actor% %actor.name% наклонил%actor.u% и протянул руку к акульей голове.
oechoaround %actor% Зубы акулы впились в руку %actor.name%!
osend %actor% &R __Акульи зубы впились вам в руку! 
osend %actor% &R __Это действительно БОЛЬНО!&n
return 0
halt
else
wait 1
oecho Акулья голова лязгнула зубами, вызвав ужас у окружающих.
end
~
#50064
Именной шмот - Ювеналий~
1 gjp 100
~
if (%actor.level% > 30 ) & (%actor.vnum% == -1 )
halt
end
if %actor.name% != Ювеналий
oechoaround %actor% _Громко матерясь, тфилин отскочил от гойской руки %actor.rname% !
osend %actor%  __Громко матерясь, тфилин отскочил от вашей руки!
return 0
halt
else
wait 1
oecho _Тфилин Ювеналия тихо забормотал древнюю молитву.
end
~
#50065
Именной шмот - Рианда~
1 gj 100
~
if (%actor.level% > 30 ) && (%actor.vnum% == -1 )
halt
end
if %actor.clan% != гд
oechoaround %actor%  Нарисованый на сумке бельчонок негодующе фыркнул и укусил %actor.vname% за палец.
osend %actor% _Нарисованый на сумке бельчоно негодующе фыркнул и отвернулся.
return 0
halt
else
wait 1
oecho _Нарисованый на сумке для рун бельчонок загадочно вам подмигнул.
end
~
#50070
сундук 1~
2 d 5
темна вода во облацех~
wait 1
%echo% Послышался резкий скрип, крышка сундука распахнулась и из него сама собой выпорхнула золотая статуэтка.
%load% obj 50070
%echo% Крышка сундука с громким стуком захлопнулась.
%purge% quest501
detach 50070 %self.id%
~
#50071
сундук 2~
2 d 5
под лежачий камень вода не течет~
wait 1
%echo% Послышался резкий скрип, крышка сундука распахнулась и из него сама собой выпорхнула золотая статуэтка.
%load% obj 50070
%echo% Крышка сундука с громким стуком захлопнулась.
%purge% quest502
%purge% quest501
%purge% quest500
detach 50071 %self.id%
~
#50072
сундук 3~
2 g 5
нельзя объять необъятное~
wait 1
%echo% Послышался резкий скрип, крышка сундука распахнулась и из него сама собой выпорхнула золотая статуэтка.
%load% obj 50070
%echo% Крышка сундука с громким стуком захлопнулась.
%purge% quest503
%purge% quest500
detach 50072 %self.id%
~
#50073
сундук 4~
2 d 5
каждому свое~
wait 1
%echo% Послышался резкий скрип, крышка сундука распахнулась и из него сама собой выпорхнула золотая статуэтка.
%load% obj 50070
%echo% Крышка сундука с громким стуком захлопнулась.
%purge% quest504
%purge% quest500
detach 50073 %self.id%
~
#50074
сундук 5~
2 d 5
встань передо мной, как лист перед травой~
wait 1
%echo% Послышался резкий скрип, крышка сундука распахнулась и из него сама собой выпорхнула золотая статуэтка.
%load% obj 50070
%echo% Крышка сундука с громким стуком захлопнулась.
%purge% quest505
detach 50074 %self.id%
~
#50075
душегуб помер~
0 f 100
~
mecho Душегуб прохрипел :
mecho - Ахх ты :((:(*:?% !!!
mecho - Убил ты меня... Но знай, до сокровищ тебе не добраться!
if (%world.curmobs(50025)% < 2)
mecho - Ибо укрыта одна их часть у разбойника на по всей Руси известного.
mecho - Вторая же на темном болоте в логове страшного зверя
mecho Душегуб рухнул на землю
mecho На выпавшем из его кармана клочке бересты вы различили две строчки:
mecho - каждому свое
mecho - темна вода во облацех
halt
end
if (%world.curmobs(50025)% < 3)
mecho - Ибо укрыта одна их часть в крепости заброшенной и нежитью страшной населенной
mecho - У брата мово
mecho - Вторая же у разбойника на по всей Руси известного.
mecho Душегуб рухнул на землю
mecho На выпавшем из его кармана клочке бересты вы различили две строчки:
mecho - каждому свое
mecho - встань передо мной, как лист перед травой
halt
end
if (%world.curmobs(50025)% < 4)
mecho - Ибо укрыта одна их часть среди озер и болот у наших друзей лихих, разбойничков вольных
mecho - А вторая в крепости заброшенной и нежитью страшной населенной
mecho - У брата мово
mecho Душегуб рухнул на землю
mecho На выпавшем из его кармана клочке бересты вы различили две строчки:
mecho - нельзя объять необъятное!
mecho - каждому свое
halt
end
if (%world.curmobs(50025)% < 5)
mecho - Ибо укрыта одна их часть на дороге в сам ад.
mecho - А вторая среди озер и болот у наших друзей лихих, разбойничков вольных
mecho Душегуб рухнул на землю
mecho На выпавшем из его кармана клочке бересты вы различили две строчки:
mecho - под лежачий камень вода не течет
mecho - нельзя объять необъятное!
halt
end
if (%world.curmobs(50025)% < 6)
mecho - Ибо укрыта одна их часть на темном болоте в логове страшного зверя
mecho - И вторая же на дороге в сам ад!
mecho Душегуб рухнул на землю
mecho На выпавшем из его кармана клочке бересты вы различили две строчки:
mecho - темна вода во облацех
mecho - под лежачий камень вода не течет
halt
end
~
#50076
Little ghoul killed~
0 f 100
~
if ( %random.100% < 3 )
return 0
mload mob 50027
end
mecho ХА-ХА-ХА-ХАААА!!!!
~
#50077
Девка~
1 gj 100
~
if %actor.name% != ховард
return 0
*%actor.wait(6)%
*%actor.position(6)%
%send% %actor% Девушка размахнулась, и залепила Вам смачную пощечину, от которой вы полетели кубарем.
%echoaround% %actor% Девушка размахнулась, и залепила %actor.dname% смачную пощечину, от которой %actor.name% полетел%actor.g% кубарем.
halt
end
%send% %actor% Девушка ласково вас обняла и расцеловала.
%echoaround% %actor% Девушка ласково обняла и расцеловала %actor.vname%.
~
#50080
дали деньги для входа~
0 m 1
~
say Прости, пока что вход закрыт.
say Вам дальше по корридору :)
return 0
halt
wait 1
if %amount% == 100
улы
wait 1
say Хочешь быть зрителем ? Ну что ж, можно это устроить.
msend %actor% Детина приоткрыл дверь, и вы быстро шмыгнули в проем.
mechoaround %actor% Детина приоткрыл дверь и %actor.name% быстро шмыгнул%actor.g% в проем.
~
#50081
проверка душика~
0 e 100
~
if %actor.is_killer%
eval dushik 1
else
eval dushik 0
endif
dg_affect %actor.name% невидимость 10 100
~
#50082
удерживает игрока~
1 c 100
~

~
#50083
вход в комнату к двум~
2 g 100
~
if %actor.vnum% != -1
halt
end
set schet 0
set igrok %self.people%
while %igrok%
if %igrok.vnum% == -1
eval schet %schet%+1
end
* wecho %igrok.name%  тут есть! %schet% - равен счет ! %actor.vnum% - внум
set igrok %igrok.next_in_room%
done
if %schet% > 1
return 0
wsend %actor% Вы не можете туда пройти, там занято.
else
return 1
end
halt
~
#50084
не_пускает_к_победителю~
2 g 100
~
if %actor.vnum% != -1
halt
end
set schet 0
set igrok %self.people%
while %igrok%
if %igrok.vnum% == -1
eval schet %schet%+1
end
* wecho %igrok.name%  тут есть! %schet% - равен счет ! %actor.vnum% - внум
set igrok %igrok.next_in_room%
done
if %schet% > 0
return 0
wsend %actor% Вы не можете туда пройти, там занято.
else
return 1
end
~
#50085
попытка взять камень~
1 g 100
~
osend %actor% Вы не можете взять Этот камень.
return 0
~
#50090
разжигание костра~
0 z 100
~
разжечь
purg %self%
~
#50091
используем огниво~
1 c 100
поджечь~
wait 1
osend %actor% Вы попробывали воспользоваться огнивом.
oechoaround %actor% %actor.iname% попробывал%actor.a% воспользоваться огнивом.
oload mob 50090
calcuid razhech 50090 mob
attach 50090 %razhech.id%
run 50090 %razhech.id%
~
$~
