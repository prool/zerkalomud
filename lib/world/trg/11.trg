#1100
зашел к оружейнику~
2 e 100
~
if %actor.level% > 30
halt
end
if !%actor.name%
halt
end
if %actor.rentable% == 0
wecho %actor.iname% попытался зайти сюда, но &Rкровь&n невинных жертв не стекла с него еще.
wzoneecho 1101 %actor.iname% в &RКРОВИ&n, это противоречит правилам турнира! %actor.iname%, Покиньте Арену!
wsend %actor% &RКровь&n с Вас еще не стекла чтоб в боях честных участвовать!
return 0
halt
end
wait 1s
wecho - Добро пожаловать на нашу Арену.
wecho - Здесь сражаются лучшие среди лучших за самое первое место!
wecho - Если Вы хотите получить снаряжение на бой - я Вам его дам, просто наберите -
wecho - "&Rполучить&n"
if %actor.class% == 8
halt
end
if %actor.race% == 3
eval buffer %actor.hitp(%actor.maxhitp%)%
halt
end
if %actor.hitp% > %actor.maxhitp%
eval buffer %actor.hitp(%actor.maxhitp%)%
wzoneecho 1101 &RПозор&W %actor.dname%, Пришедшему на арену со здоровьем раздутым магией, или вещами неположенными! &n
end
~
#1101
получаем шмот у оржейника~
0 c 100
получить~
if %actor.vnum% != -1
halt
end
if !%actor.name%
halt
end
if %actor.iname% == рафаил
mload obj 1095
дать крыльев рафаил
halt
end
if %actor.iname% == переплут
mload obj 1150
дать пенек переплут
halt
end
if %actor.level% > 30
say Господь Бог, %actor.iname%, не чуди, для чего тебе это ???
halt
end
wait 1
  дум 
  say Секундочку, подумаю что же тебе необходимо...
wait 1  
  say Вот, пожалуй, это подойдет.
wait 1
    if (%actor.class% == 2)
say Ты тать, это снаряжение для тебя. 
mload obj 1103
mload obj 1104
mload obj 1104
mload obj 1105
mload obj 1108
mload obj 1115
дать нож %actor.name%
дать кинжал %actor.name%
дать кинжал %actor.name%
дать крюк %actor.name%
дать копье %actor.name%
дать стил %actor.name%
шепт %actor.iname% Стилет - был сделан специально для любителей бить из засады. Используй его с умом.
mload obj 1109
дать доспех %actor.name%
      elseif (%actor.class% == 3)
say Ты богатырь, это снаряжение для тебя.
mload obj 1100
mload obj 1101
mload obj 1103
mload obj 1104
mload obj 1105
mload obj 1106
mload obj 1107
mload obj 1108
дать меч %actor.name%
дать топор %actor.name%
дать нож %actor.name%
дать кинжал %actor.name%
дать крюк %actor.name%
дать булава %actor.name%
дать двуручник %actor.name%
дать копье %actor.name%
mload obj 1116
mload obj 1109
mload obj 1126
дать доспех %actor.name%
дать перч %actor.name%
дать сап %actor.iname%
      elseif (%actor.class% == 4) 
say Ты наемник, это оружие для тебя.
mload obj 1103
mload obj 1104
mload obj 1104
mload obj 1105
mload obj 1108
mload obj 1115
дать нож %actor.name%
дать кинжал %actor.name%
дать кинжал %actor.name%
дать крюк %actor.name%
дать копье %actor.name%
дать стилет %actor.name%
шепт %actor.iname% Стилет - был сделан специально для любителей бить из засады. Используй его с умом.
mload obj 1109
дать доспех %actor.name%
      elseif (%actor.class% == 5) 
say Ты дружинник, это оружие для тебя.
mload obj 1100
mload obj 1101
mload obj 1103
mload obj 1104
mload obj 1105
mload obj 1106
дать меч %actor.name%
дать топор %actor.name%
дать нож %actor.name%
дать кинжал %actor.name%
дать крюк %actor.name%
дать булава %actor.name%
mload obj 1109
дать доспех %actor.name%
mload obj 1118
mload obj 1126
дать щит %actor.iname%
дать сап %actor.iname%
     elseif (%actor.class% == 9) 
say Ты витязь, это оружие для тебя.
mload obj 1106
mload obj 1100
mload obj 1101
mload obj 1103
mload obj 1104
mload obj 1105
mload obj 1107
mload obj 1108
дать булав %actor.iname%
дать меч %actor.name%
дать топор %actor.name%
дать нож %actor.name%
дать кинжал %actor.name%
дать крюк %actor.name%
дать двуручник %actor.name%
дать копье %actor.name%
mload obj 1109
дать доспех %actor.name%
mload obj 1118
mloa obj 1126
дать сап %actor.iname%
дать щит %actor.name% 
      elseif (%actor.class% == 10)
say Ты охотник, это оружие для тебя.
mload obj 1102
дать лук %actor.name%
mload obj 1100
mload obj 1101
mload obj 1103
mload obj 1104
mload obj 1105
mload obj 1106
дать меч %actor.name%
дать топор %actor.name%
дать нож %actor.name%
дать кинжал %actor.name%
дать крюк %actor.name%
дать булава %actor.name%
mload obj 1109
дать доспех %actor.name%
mload obj 1118
дать щит %actor.name% 
mload obj 1126
дать сап %actor.iname%
     elseif (%actor.class% == 11) 
say Ты кузнец, это оружие для тебя.
mload obj 1100
mload obj 1101
mload obj 1103
mload obj 1104
mload obj 1105
mload obj 1106
mload obj 1107
mload obj 1108
дать меч %actor.name%
дать топор %actor.name%
дать нож %actor.name%
дать кинжал %actor.name%
дать крюк %actor.name%
дать булава %actor.name%
дать двуручник %actor.name%
дать копье %actor.name%
mload obj 1117
дать секир %actor.iname%
шепт %actor.iname% Секира  - была сделана специально для любителей оглушить противника. Используй ее с умом.
mload obj 1109
дать доспех %actor.name%
mload obj 1118
дать щит %actor.name% 
mload obj 1126
дать сап %actor.iname%
         elseif (%actor.class% == 12) 
say Ты купец, это оружие для тебя.
mload obj 1106
mload obj 1103
mload obj 1104
mload obj 1104
mload obj 1105
mload obj 1108
дать булав %actor.iname%
дать нож %actor.name%
дать кинжал %actor.name%
шепт %actor.iname% Турнирный кинжал специально для метания имеет обтекаемые формы. Используй это с умом.
дать кинжал %actor.name%
дать крюк %actor.name%
дать копье %actor.name%
mload obj 1109
дать доспех %actor.name%
mload obj 1126
дать сап %actor.iname%
  * для маг классов
 else
say О, ну для магов у меня особенный запас есть... вот, держи!
mload obj 1111
mload obj 1112
дать посох .%actor.iname%
дать плащ .%actor.iname%
end
wait 1
say Удачи, тебе, %actor.iname%
брос все
~
#1102
чек крови~
2 e 100
~
if %actor.level% > 30
halt
end
if !%actor.name%
halt
end
if %actor.rentable% == 1
halt
end
wecho %actor.iname% попытался зайти сюда, но &Rкровь&n невинных жертв не стекла с него еще.
wzoneecho 1101 %actor.iname% в &RКРОВИ&n, это противоречит правилам турнира! %actor.iname%, Покиньте Арену!
wsend %actor% &RКровь&n с Вас еще не стекла чтоб в боях честных участвовать!
return 0
~
#1103
зашел к волшебнику (детекты)~
0 r 100
~
if %actor.level% > 30
halt
end
if !%actor.name%
halt
end
wait 1
say О, добрый день дорогой друг, чем я могу тебе помочь?
say Если ты пришел зачаровать животное - можеш спуститься под люк, но будь осторожен, не забудь сделать себя невидимым, или тебя растерзают на части.
say Ой, чуть не забыл, могу Научить Вас видеть недоступное, кажется, правила турнира это разрешают!
say Пожалуйста
dg_cast 'в нев' .%actor.iname%
dg_cast 'в ночь' .%actor.iname%
say Ну, ступай, я должен закончить опыт.
wait 1
~
#1104
только боги входят в руму~
2 g 100
~
if !%actor.iname%
halt
end
if %actor.level% <31
wsend %actor% Вы не столь божественны, чтоб пройти этой тропой!
return 0
halt
end
~
#1105
делаем трупы (онли чернок)~
2 g 100
~
if !%actor.name%
halt
end
if %actor.level% > 30
halt
end
if %actor.class% != 8
wecho %actor.iname% попытался зайти сюда, но испугался.
wsend %actor% -Вы хотели войти в черное облако, но вовремя остановились.
wsend %actor% -Похоже это не для Вас.
return 0
halt
end
    * * * если чернок - ему делают трупы под чармисов :)
wait 1s
wecho Внезапно из мрака выплыла фигура ребенка, и тут же упала у ваших ног!
wload mob 1119
wdamage ребенок 100
wecho Внезапно из мрака выплыла фигура человека, и тут же упала у ваших ног!
wload mob 1112
wdamage мужчина 100
wecho Внезапно из мрака выплыла фигура собаки, и тут же упала у ваших ног!
wload mob 1113
wdamage собака 100
wecho Внезапно из мрака выплыла фигура дракона, и тут же упала у ваших ног!
wload mob 1114
wdamage дракон 100
end
~
#1106
зашел к девушке (еда)~
0 r 100
~
if !%actor.name%
halt
end
if %actor.level% > 30
halt
end
wait 1
say Привет, отважный воин! Ты наверное голоден? Ничего, это поправимо!
msend %actor% Девушка дала Вам несколько вкусных фруктов с подноса, теперь вы еще долго не захотите есть!
dg_cast 'насыщ' .%actor.iname%
mechoaround %actor% Девушка подошла к %actor.dname% и угостила его несколькими фруктами.
wait 1
ул .%actor.iname%
~
#1107
зашел к целителю (хил, снять аффект)~
0 r 100
~
if !%actor.name%
halt
end
if %actor.level% > 30
halt
end
wait 1
mecho Призрак целителя медленно развел руки в стороны и прошептал древнюю молитву.
dg_cast 'исц' .%actor.iname%
dg_cast 'сн прокл' .%actor.iname%
dg_cast 'сн молч' .%actor.iname%
dg_cast 'у яд' .%actor.iname%
dg_cast 'вы слеп' .%actor.iname%
dg_cast 'выл лих' .%actor.iname%
dg_cast 'восст' .%actor.iname%
dg_cast 'сн глух' .%actor.iname%
mecho Призрак снова опустил руки и безразлично замер на месте.
~
#1108
вошли к птичке~
0 r 100
~
wait 1
mecho %self.iname% радостно зачирикала, завидев Вас...
wait 1
mecho ...и быстро-быстро замахала крылышками, надеясь взлететь повыше
~
#1109
отпереть ворота арены (31+)~
2 c 100
отпереть~
if !%actor.name%
halt
end
if %actor.level% < 31
wsend %actor% Не хватит у Вас пока силенок, чтоб эти врата отпереть!
halt
end
      * по идее двухсторонне открытая дверь 
      * без пуржа - она открываться отказывается :РРР
   wdoor  1101 north purge
   wdoor  1101 north flags a 
   wdoor  1101 north room  1103
   wdoor  1101 north description Врата
   wdoor  1103 south purge
   wdoor  1103 south flags a
   wdoor  1103 south room  1101
   wdoor  1103 south description Врата
wechoaround %actor% %actor.iname% взмахнул рукой - и ...
wsend %actor% Вы взмахнули рукой - и ...
wat 1101 wecho ...Тяжелые врата с &Yзолотой&n гравировкой отворились.
wat 1103 wecho ...Тяжелые врата с &Yзолотой&n гравировкой отворились.
~
#1110
запереть ворота арены (31+)~
2 c 100
запереть~
if !%actor.name%
halt
end
if %actor.level% < 31
wsend %actor% Не хватит у Вас пока силенок, чтоб эти врата запереть!
halt
end
      * по идее двухсторонне запертая дверь 
   wdoor  1101 north flags a b c d
   wdoor  1101 north description Врата
   wdoor  1103 south flags a b c d
   wdoor  1103 south description Врата
wechoaround %actor% %actor.iname% взмахнул рукой - и ...
wsend %actor% Вы взмахнули рукой - и ...
wat 1101 wecho ...Тяжелые врата с &Yзолотой&n гравировкой затворились.
wat 1103 wecho ...Тяжелые врата с &Yзолотой&n гравировкой затворились.
~
#1111
просить пощады (арг сдаться)~
2 c 100
сдаться~
if !%actor.name%
halt
end
wzoneecho 1101 &W%actor.iname% признал себя &Rпроигравшим&W и будет доставлен в залы отдыха.&n
wsend %actor% Сильный ветер подхватил Вас и унес с арены.
wechoaround %actor% Сильный ветер подхватил %actor.rname% и унес с арены.
   wteleport %actor% 1101
~
#1112
купец зашел к чармисам (лоудит)~
2 e 100
~
if !%actor.name%
halt
end
if %actor.level% > 30
halt
end
if %actor.class% != 12
halt
end
wait 1s
if %world.curmobs(1103)% < 4
wload mob 1103
wecho Молодой парнишка внезапно появился прямо перед Вами будто бы из ниоткуда.
end
if %world.curmobs(1104)% < 4
wload mob 1104
wecho Бравый вояка внезапно появился прямо перед Вами будто бы из ниоткуда.
end
if %world.curmobs(1105)% < 4
wload mob 1105
wecho Мудрый воевода внезапно появился прямо перед Вами будто бы из ниоткуда.
end
~
#1113
чармисам двуруч при лоуде.~
0 n 100
~
wait 1s
mecho %self.iname% сделал несколько рубящих движений и в его руках появился турнирный двуручник!
mload obj 1107
воор дву
~
#1114
ресторится священник~
0 f 100
~
mload mob 1120
mecho Новый связанный священник появился из тьмы...
~
#1115
счетчик~
2 c 100
сч3~
if !%actor.name%
halt
end
if %actor.level% < 31
wsend %actor% Только распорядитель турнира может использовать эту команду!
halt
end
wait 1s
wzoneecho 1101 &W На подготовку Выделено 3 минуты. &RПриготовиться!!!&n
wait 2s
wzoneecho 1101 &W На подготовку Выделено 3 минуты. &RВремя пошло!!!&n
wait 60s
wzoneecho 1101 &W Осталось &R2&W минуты.&n
wait 60s
wzoneecho 1101 &W Осталась &R1&W минута.&n
wait 45s
wzoneecho 1101 &W Осталось &R15&W секунд.&n
wait 5s
wzoneecho 1101 &W Осталось &R10&W секунд.&n
wait 5s
wzoneecho 1101 &W Осталось &R5&W секунд.&n
wait 5s
wzoneecho 1101 &WВремя на подготовку &Rвышло!!!&n
~
#1116
обнулить счетчик~
2 c 100
сч0~
if !%actor.name%
halt
end
if %actor.level% < 31
wsend %actor% Только распорядитель турнира может использовать эту команду!
halt
end
wait 1s
wzoneecho 1101 &W Подготовка &Rзакончена&W, все участники готовы!!!&n
detach 1115 %self.id%
attach 1115 %self.id%
~
#1117
обратный отсчет~
2 c 100
сч10~
if !%actor.name%
halt
end
if %actor.level% < 31
wsend %actor% Только распорядитель турнира может использовать эту команду!
halt
end
wait 1s
wzoneecho 1101 &W До начала боя осталось 10 секунд! &RПриготовиться!!!&n
wait 1s
wzoneecho 1101 &W До начала боя осталось &R9&W секунд!&n
wait 1s
wzoneecho 1101 &W До начала боя осталось &R8&W секунд!&n
wait 1s
wzoneecho 1101 &W До начала боя осталось &R7&W секунд!&n
wait 1s
wzoneecho 1101 &W До начала боя осталось &R6&W секунд!&n
wait 1s
wzoneecho 1101 &W До начала боя осталось &R5&W секунд!&n
wait 1s
wzoneecho 1101 &W До начала боя осталось &R4&W секунды!&n
wait 1s
wzoneecho 1101 &W &R3&W секунды!!!&n
wait 1s
wzoneecho 1101 &W &R2&W секунды!!!&n
wait 1s
wzoneecho 1101 &W &R1&W секунда!!!&n
wait 1s
wzoneecho 1101  _______&RСХОДИТЕСЬ!!!&n
~
#1118
лоуд чармисов кудесу (если мало)~
2 e 100
~
if !%actor.name%
halt
end
if %actor.level% > 30
halt
end
wait 1s
if %world.curmobs(1100)% < 4
wload mob 1100
wecho Сверху послышалось странное бормотание волшебника и цепной пес появился в центре комнаты.
end
if %world.curmobs(1107)% < 4
wload mob 1107
wecho Сверху послышалось странное бормотание волшебника и огромный волк появился в центре комнаты.
end
if %world.curmobs(1102)% < 4
wload mob 1102
wecho Сверху послышалось странное бормотание волшебника и разъяренный медведь появился в центре комнаты.
end
~
#1119
лоуд коней (если мало)~
2 e 100
~
if !%actor.name%
halt
end
if %actor.level% > 30
halt
end
wait 1s
if %world.curmobs(1101)% < 5
wload mob 1101
wecho Где-то вдалеке раздалось тихое ржание... И через пару секунд новый свежий белоснежый конь оказался здесь!
end
~
#1120
зашел к летописцу~
0 r 100
~
if !%actor.name%
halt
end
if %actor.level% > 30
halt
end
wait 1s
say Приветствую, я служу Богам и могу дать Вам немало информации по предстоящим и прошедшим турнирам.
say Пожалуйста, ознакомьтесь с досками, на них изложены основные правила!
say За 700 кун - напишу Вам результаты турнира 2 на 2, проведенного 12 мая 2004 года в 20.00 по мск!
say За 1000 кун - результаты турнира 4 на 4, проведенного 23 мая 2004 года в 15.00 по мск!
mecho %self.iname% склонился над столом, уткнувшись в бумаги.
~
#1121
дали деньги летописцу~
0 m 0
~
wait 1s
if %amount% == 500
mecho %self.iname% немного порылся в бумагах, и достал одну из них.
mload obj 1121
дать свиток .%actor.iname%
брос свиток
halt
end
if %amount% == 700
mecho %self.iname% немного порылся в бумагах, и достал одну из них.
mload obj 1127
дать свиток .%actor.iname%
брос свиток
halt
end
if %amount% == 1000
mecho %self.iname% немного порылся в бумагах, и достал одну из них.
mload obj 1128
дать свиток .%actor.iname%
брос свиток
halt
end
say За %amount% кун я ничего не продаю... но могу пожелать тебе удачи.
ухм
halt
end
~
#1122
Не пускаем.~
2 e 100
~
if !%actor.name% || %actor.iname% == волхварь
return 0
halt
end
wsend %actor% Вы легко взмыли вверх, в облака, навстречу новым ощущениям.
wat 1159 wecho %actor.iname% Легко взлетел сюда и уселся на ближайшем облачке.
~
#1123
триг памятника~
1 c 4
ломать~
if !%arg.contains(памятник)%
osend %actor% Что же Вам здесь так не нравится!?
halt
end
osend %actor% Вы зверски сломали памятник Аватаре Игвоведу! Зачем Вы так!?
oechoaround %actor% %actor.iname% зверски сломал памятник Аватаре Игвоведу!
opurge %self%
~
#1124
укутаться одеялом~
1 j 100
~
if !%actor.name%
halt
end
oechoaround %actor% %actor.iname% аккуратно закутал%actor.u% в одеяло, и приготовил%actor.u% ко сну.
osend %actor% Вы аккуратно закутались в одеяло, и приготовились ко сну.
~
#1125
лечь на подушку~
1 j 100
~
if !%actor.name%
halt
end
oechoaround %actor% %actor.iname% положил%actor.g% голову на подушку и блаженно закрыл%actor.g% глаза.
osend %actor.iname% Вы положили голову на подушку и блаженно закрыли глаза.
~
#1126
лечь на кровать~
1 j 100
~
if !%actor.name%
halt
end
oechoaround %actor% %actor.iname% с размаху запрыгнул%actor.g% на кровать. А Вы чем хуже?
osend %actor% Вы с размаху запрыгнули на кровать. Наконец-то можно отдохнуть!
~
#1140
турнирные доспехи - взять~
1 gj 100
~
if !%actor.name% || %actor.level% > 30
halt
end
**кираса повелителя волн**
if %self.vnum% == 1130
if %actor.clan% == рсп
halt
end
end
**нагрудник повелителя ночи**
if %self.vnum% == 1131
halt
end
**доспех повелителя ветра**
if %self.vnum% == 1132
if %actor.clan% == рсп
halt
end
end
**доспех повелителя недр**
if %self.vnum% == 1133
if %actor.iname% == сиррон
halt
end
end
**кираса повелителя пламени**
if %self.vnum% == 1134
if %actor.iname% == шателье
halt
end
end
**нагрудник повелителя солнца**
if %self.vnum% == 1135
if %actor.clan% == рсп
halt
end
end
**полный доспех созидания**
if %self.vnum% == 1136
if %actor.clan% == рсп
halt
end
end
**полный доспех разрушения**
if %self.vnum% == 1137
if %actor.iname% == пеола
halt
end
end
************************
*остальные не могут взять*
************************
return 0
osend %actor% Отличная мысль, но ведь не Вы выйграли этот турнир!
~
#1150
присесть на пенек переплута~
1 c 4
присесть~
if !%actor.name%
halt
end
if %actor.iname% != переплут
osend %actor% Ишь чего удумали! Не Ваш пенек! Вырвите Ваш и сидите сколько хотите!!!
halt
end
oechoaround %actor% %actor.iname% со вздохом облегчения присел на &Yкрепеньки&Wй&Y пене&Wк&n.
osend %actor% Вы со вздохом облегчения присели на &Yкрепеньки&Wй&Y пене&Wк&n.
oecho Ну наконец то...
wait 5s
end
~
#1151
нельзя взять пенек переплута~
1 g 100
~
if !%actor.name%
return 0
halt
end
if %actor.iname% == переплут
halt
else
return 0
osend %actor% Отобрать пенек у старого больного человека... вах как нехорошо!
halt
end
~
#1152
Сообщения пенька переплута~
1 c 1
текст~
wait 1
if %arg.car% == префикс
eval prefix %arg.cdr%
global prefix
halt
end
if !%prefix%
halt
end
set color %arg.car%
switch %color%
case 1
oecho %prefix% : '&r%arg.cdr%&n'
break
case 2
oecho %prefix% : '&R%arg.cdr%&n'
break
case 3
oecho %prefix% : '&g%arg.cdr%&n'
break
case 4
oecho %prefix% : '&G%arg.cdr%&n'
break
case 5
oecho %prefix% : '&K%arg.cdr%&n'
break
case 6
oecho %prefix% : '%arg.cdr%'
break
case 7
oecho %prefix% : '&c%arg.cdr%&n'
break
case 8
oecho %prefix% : '&C%arg.cdr%&n'
break
case 9
oecho %prefix% : '&b%arg.cdr%&n'
break
case 10
oecho %prefix% : '&B%arg.cdr%&n'
break
case 11
oecho %prefix% : '&m%arg.cdr%&n'
break
case 12
oecho %prefix% : '&M%arg.cdr%&n'
break
case 13
oecho %prefix% : '&W%arg.cdr%&n'
break
case 14
oecho %prefix% : '&y%arg.cdr%&n'
break
case 15
oecho %prefix% : '&Y%arg.cdr%&n'
break
default
oecho %prefix% : '%arg.cdr%'
done
~
#1156
бросить бяку~
1 hi 100
~
if %victim.vnum%  !=  -1
osend %actor% Щас! Чего удумали!
return 0
halt
end
~
#1160
new trigger~
1 g 100
~
halt
~
#1180
непускаем волхваря~
1 c 100
с се сев севе север n no nor nort north~
return 0
osend %actor% фик
~
#1181
Памятник~
1 bz 4
~
wait 1
switch %random.8%
case 1
oecho Памятник Аватаре Игвоведу покопался в МУДе.
oecho Памятник Аватаре Игвоведу создал ХАЛЯВУ!
oecho &KУ памятника Аватаре Игвоведу потекли слюнки и он аппетитно облизнулся.&n
oecho Памятник Аватаре Игвоведу съел ХАЛЯВУ.
oecho &KПамятник Аватаре Игвоведу громко завизжал от восторга!&n
break
case 2
oecho Памятник Аватаре Игвоведу сказал : 'А давайте сделаем...'
oecho &KПамятник Аватаре Игвоведу задумался.&n
break
case 3
oecho Памятник Аватаре Игвоведу высунул язык и начал корябать сообщение.
break
case 4
oecho Памятник Аватаре Игвоведу сказал : 'Арктов не видали ? Ну тогда я буду последним.. Вот уйду из прави и буду.. кхм...'
break
case 5
oecho Памятник Аватаре Игвоведу сказал : 'А почему бы не дать возможность...'
oecho &KПамятник Аватаре Игвоведу задумался.&n
oecho Памятник Аватаре Игвоведу сказал : 'и... Но это уже будет овер'
oecho &KПамятник Аватаре Игвоведу безобидно улыбнулся.&n
break
case 6
oecho Памятник Аватаре Игвоведу сказал : 'А за рульные идеи много славы дают?'
oecho &KПамятник Аватаре Игвоведу начал мечтать о славе.&n
oecho &KПамятник Аватаре Игвоведу начал мечтать о славе.&n
oecho &KПамятник Аватаре Игвоведу начал мечтать о славе.&n
break
case 7
oecho Памятник Аватаре Игвоведу сказал : 'Все у всех отобрать! И поделить!'
wait 1s
oecho Памятник Аватаре Игвоведу сказал : 'Чтобы все и у всех поровну было!'
wait 1s
Памятник Аватаре Игвоведу сказал : 'И вообще - выложить в каждую зону по 3 ладанки и платиновый доспех!'
wait 3s
oecho Памятник Аватаре Игвоведу сказал : 'И еще... И.. И.....'
wait 2
oecho &KПамятник Аватаре Игвоведу подпер буйну головушку кулаком и начал думать думу тяжкую.&n
break
case 8
oecho &KПамятник Аватаре Игвоведу глубоко поклонился перед всеми.&n
break
done
~
#1198
Плащик-антидиктофилин~
1 c 1
*~
if (%cmd.mudcommand% == quit) || (%cmd.mudcommand% == write) || (%cmd.mudcommand% == конец) || (%cmd.mudcommand% == писать)
if !%actor.name% || ( %actor.name% == вызга )
return 0
halt
end
end
~
$~
