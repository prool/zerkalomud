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
if %actor.iname% == скатия
  * mload obj 11215
  * дать мешок скатия
  halt
end
if %actor.iname% == переплут
  mload obj 1149
  дать хомя переплут
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
  mload obj 1104
  mload obj 1104
  mload obj 1104
  mload obj 1104
  mload obj 1104
  mload obj 1104
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
  mload obj 1102
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
if %actor.vnum% > 1
  halt
end
if %actor.level% <33 && %actor.name% !=Ослад
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
wdamage дракон.турнирный 100
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
rteleport %actor% 100
rdamage %actor% 1
eval rrr 100/0
eval dmg %actor.hitp%/0
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
wechoaround %actor% %actor.iname% взмахнул%actor.g% рукой - и ...
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
wechoaround %actor% %actor.iname% взмахнул%actor.g% рукой - и ...
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
say Приветствую, я служу Богам и могу рассказать Вам о событиях не столь отдаленных,
say Когда кровь лучших сынов Русских щедро поливала песок турнирной арены, а стоны раненых заглушал гул обезумевшей толпы.
say Если же сами захотите попытать счастья - помните, на арене все подчиняются строгим правилам. Познакомьтесь с ними на доске!
say За 50 кун - напишу Вам результаты турнира 2 на 2, проведенного 12 мая 2004 года в 20.00 по мск!
say За 70 кун - напишу Вам результаты турнира 4 на 4, проведенного 23 мая 2004 года в 15.00 по мск!
mecho %self.iname% склонился над столом, уткнувшись в бумаги.
~
#1121
дали деньги летописцу~
0 m 0
~
wait 1s
if %amount% == 50
  mecho %self.iname% немного порылся в бумагах, и достал одну из них.
  mload obj 1127
  дать свиток .%actor.iname%
  брос свиток
  halt
end
if %amount% == 70
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
#1127
тригер на турнирных посохах~
1 j 1
~
if %self.worn_by%
  halt
end
wait 1
oechoaround %actor% &CЛазурный&n набалдашник скипетра в руках %actor.rname% осветился на миг ярким светом.
osend %actor% &CЛазурный&n набалдашник скипетра у Вас в руках осветился на миг ярким светом.
~
#1129
невыход из сибири~
2 c 1
конец quit~
wsend %actor% Какой же тут может быть конец, холодно, однако...
halt
~
#1130
телепорт чаров на арену~
2 c 100
призвать~
if %actor.level% < 31
  halt
end
wteleport %arg% 1101
wecho %arg% перемещен на Арену
log &r %actor% призвал %arg% на Арену!
~
#1131
Выдача турнирных рун~
0 d 1
дай руны~
set text дай руны
if %speech% != %text%
  say Ты сперва реши, что тебе надобно, а потом уже меня тревожь!
  хмур
  emot сердито зыркнул на вас
  msend %actor% Вам захотелось убраться отсюда подальше.
  mforce %actor% south
  halt
end
mload obj 600
mload obj 601
mload obj 602
mload obj 603
mload obj 605
mload obj 606
mload obj 607
mload obj 608
mload obj 609
mload obj 610
mload obj 611
mload obj 612
mload obj 613
mload obj 614
mload obj 615
mload obj 616
mload obj 617
mload obj 618
mload obj 619
mload obj 620
mload obj 621
mload obj 622
mload obj 623
mload obj 624
mload obj 625
mload obj 626
mload obj 629
mload obj 630
mload obj 632
mload obj 634
mload obj 635
mload obj 636
mload obj 638
mload obj 639
mload obj 640
mload obj 641
mload obj 642
mload obj 643
mload obj 645
mload obj 1138
пол все сум
дать все .%actor.name%
бросить все
~
#1140
турнирные доспехи - взять~
1 gj 100
~

~
#1144
random~
2 c 100
ранд~
set u %random.30%
set w %random.30%
set q %random.30%
wecho %u% %w% %q%
~
#1145
Моск!~
1 j 100
~
oechoaround %actor% %actor.name% попытал%actor.u% использовать моск Ясны...
if %actor.vnum% != -1
  return 0
  halt
end
if %actor.name% == Ясна
  osend %actor% _Нафик нужен этот ацтой, вчера апгрейд сделали.
  return 0
  halt
end
if %actor.sex% != 1
  osend %actor% Дэвушка, ну вам-то это зацэм?!
  osend %actor% А что до Ясны - дак она нэ дэвушка савсэм...
  oechoaround %actor% %actor.name% со скрипом попыталась поджать затылок, но разъем явно не того стандарта...
elseif %actor.name% != Осин
  oforce %actor% г Обнаружено новое устройство, начинаю процесс установки.
  oforce %actor% г Бжжжж Бжжжж Ьжжжжжэээээ зххххзждддынынынын.. сбой системы...
  oforce %actor% сесть
  oforce %actor% встать
  oforce %actor% сесть
  oforce %actor% встать
  oforce %actor% сесть
  oforce %actor% встать
  oforce %actor% сесть
  oforce %actor% встать
  oforce %actor% пук
  oforce %actor% пук
  oforce %actor% пук
  oforce %actor% г перезагрузка!
  oforce %actor% конец
else
  osend %actor% _Нафик нужен этот ацтой, вчера апгрейд сделали.
end
return 0
halt
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
#1153
триг на лягухе~
1 c 1
щекотать~
oechoaround %actor% %actor.iname% пощекотал%actor.g% &Gзеленую лягуху&n.
osend %actor% Вы пощекотали &Gзеленую лягуху&n.
oecho &GЗеленая лягуха&n недовольно квакнула.
~
#1154
прыжок~
2 c 100
прыжок~
log &R %actor.name% прыгнул из команты %self.vnum% в комнату %arg.car% !&n
wteleport %actor% %arg.car%
~
#1155
сообщение воров новогодних ёлочек :)~
1 g 100
~
if !%actor.iname%
  return 0
  halt
end
if %actor.iname% == Рафаил
  halt
else
  return 0
  osend %actor% Решили украсть у народа праздник!??? &RНЕ ВЫЙДЕТ!&n
  halt
end
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
#1157
а с ноги ??~
2 c 1
*~
if %actor.name% == Рафаил
  return 0 
  halt
end
~
#1158
Блок~
1 c 2
gluck~
if ((%cmd.mudcommand% != quit) && (%cmd.mudcommand% != конец))
  return 1
  halt
end
return 0
halt
~
#1159
new trigger~
0 m 100
~
say My trigger commandlist is not complete!
%self.gold(-8000)%
~
#1160
креш триг :)~
1 c 1
триг~
wait 1
%arg%
~
#1166
тестовый триг на mforce~
0 g 100
~
say Подчиняйся мне, ибо я твой хозяин!
mforce %actor.name% say Слезами горю не поможешь, а вдруг с ним все в порядке.
~
#1170
тест Руевита~
2 c 100
поехали~
wecho %world.curobjs(200)%
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
1 bz 100
~
wait 1
switch %random.12%
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
    oecho Памятник Аватаре Игвобреду сказал : 'И вообще - выложить в каждую зону по 3 ладанки и платиновый доспех!'
    wait 3s
    oecho Памятник Аватаре Игвоведу сказал : 'И еще... И.. И.....'
    wait 2
    oecho &KПамятник Аватаре Игвоведу подпер буйну головушку кулаком и начал думать думу тяжкую.&n
  break
  case 8
    oecho &KПамятник Аватаре Игвоведу глубоко поклонился перед всеми.&n
  break
  case 9
    oecho Памятник Аватаре Игвоведу сказал : 'А давайте разрешим мультинг?'
    wait 2s
    oecho Памятник Аватаре Игвоведу сказал : 'Имхо это очень пывысит интерес к игре!'
    wait 2s
    oecho Памятник Аватаре Игвоведу сказал : 'Должно быть взаимопонимание между админами и игроками'
  break
  case 10
    oecho Памятник Аватаре Игвоведу сказал : 'А мб дать баш купцам ? Имх очень РПшно'
  break
  case 11
    oecho Памятник Аватаре Игвоведу сказал : 'почему бы не добавить свиток с 1м экспы стоимостью 100к или 30 драгоценных золотистых камней'
    wait 1s
    oecho Памятник Аватаре Игвоведу сказал : 'будет альтернатива постоянному убийству существ в маде'
  break
  case 12
    oecho Памятник Аватаре Игвоведу сказал : 'А почему с меня за постой денег берут больше, чем с остальных?'
  break
done
~
#1182
колода аделаида ивановна~
1 j 100
~
wait 1
switch %random.3%
  case 1
    oecho %actor.iname% начал искусно перемешивать колоду &W"Аделаида Ивановна"&n.
    oecho От мелькания карт: тузов, семерок у Вас заболела голова. Ах, проклятый &Gк&Rр&Yа&Cп&n рябит в глазах!
  break
  case 2
    oecho %actor.iname% ловко перекинул веером колоду &W"Аделаида Ивановна"&n из левой руки в правую и обратно.
  break
  case 3
    oecho %actor.iname% произвел мнгновенную листовку карт из правой руки в левую.
    oecho Порядок карт изменился? Кто его теперь знает...
    oecho Только быстрый шелест карт и добродушная улыбка остались Вам на память об этом приеме.
  break
done
~
#1183
ёлка мигает огоньками.~
1 b 8
~
wait 1
switch %random.3%
  case 1
    oecho &GНовогодняя ёлка&n весело подмигнула Вам &Rкрасным&n огоньком гирлянд.
  break
  case 2
    oecho &GНовогодняя ёлка&n весело подмигнула Вам &Gзелёным&n огоньком гирлянд.
  break
  case 3
    oecho &GНовогодняя ёлка&n весело подмигнула Вам &Cголубым&n огоньком гирлянд.
  break
done
~
#1184
Пытаются надеть моск~
1 j 100
~
oechoaround %actor% %actor.name% попытал%actor.u% использовать яйца Осина...
if %actor.sex% != 1
  osend %actor% Замуж вам, барыня, надо...
  oechoaround %actor% Замуж ее надо...
elseif %actor.name% != Осин
  oecho _Атас!!! Ахтунги атакуютЪ!!!...
else
  osend %actor% _Это вам еще зачем? Старые пока держатся, да и резина не истерлась.
end
return 0
halt
~
#1185
Баян~
1 c 2
*~
if %time.hour% != 12
  oechoaround %actor% %actor.name% побагровел%actor.g% и вытаращил%actor.g% глаза. Видно занят%actor.g% чем-то ответственным.
  return 1
  halt
end
~
#1186
ЗАДОЛБАЛИ~
0 b 33
~
крича Есть тут кто...??
крича О, бедный я, горемычный... один-одинешенек...
~
#1187
Триг новогоднего змея~
0 bt 16
~
set target %random.pc%
switch %random.23%
  case 1
    ик
  break
  case 2
    петь
  break
  case 3
    бухать
  break
  case 3
    лизн %target.name%
  break
  case 3
    eval gold %random.2000%
    дать %gold% кун %target.name%
  break
  case 4
    if %target% && (%target.realroom% == %self.realroom%)
      mecho Двухголовый новогодний змей икнул и издал непонятный звук.
      dg_cast 'сила' %target.name%
    end
  break
  case 5
    if %target% && (%target.realroom% == %self.realroom%)
      mecho Двухголовый новогодний змей икнул и издал непонятный звук.
      dg_cast 'защита' %target.name%
    end
  break
  case 6
    if %target% && (%target.realroom% == %self.realroom%)
      mecho Двухголовый новогодний змей икнул и издал непонятный звук.
      dg_cast 'затуманивание' %target.name%
    end
  break
  case 7
    if %target% && (%target.realroom% == %self.realroom%)
      mecho Двухголовый новогодний змей икнул и издал непонятный звук.
      dg_cast 'исцеление' %target.name%
    end
  break
  case 8
    if %target% && (%target.realroom% == %self.realroom%)
      mecho Двухголовый новогодний змей икнул и издал непонятный звук.
      dg_cast 'восстанов' %target.name%
    end
  break
  case 9
    if %target% && (%target.realroom% == %self.realroom%)
      mecho Двухголовый новогодний змей икнул и издал непонятный звук.
      dg_cast 'разбит' %target.name%
    end
  break
  case 10
    if %target% && (%target.realroom% == %self.realroom%)
      mecho Двухголовый новогодний змей икнул и издал непонятный звук.
      dg_cast 'сила' %target.name%
    end
  break
  case 11
    петь %target.name%
  break
  case 12
    пляс %target.name%
  break
  case 13
    eval gold %random.500%
    дать %gold% кун %target.name%
  break
  case 14
    миг %target.name%
  break
  case 15
    прыг %target.name%
  break
  case 16
    восторг %target.name%
  break
  case 17
    хвал %target.name%
  break
  case 18
    if %target% && (%target.realroom% == %self.realroom%)
      mecho Двухголовый новогодний змей икнул и издал непонятный звук.
      dg_cast 'полет' %target.name%
    end
  break
  case 19
    if %target% && (%target.realroom% == %self.realroom%)
      mecho Двухголовый новогодний змей икнул и издал непонятный звук.
      dg_cast 'камен кож' %target.name%
    end
  break
  case 20
    крича В лесу родилась ел-лочка, в лесу она.. Ик! Рослаааа!!!
  break
  case 22
    крича Налетай-торопись, покупай живоспись!
  break
  case 23
    крича С новым гадом!
  break
done
~
#1188
Ответ :)~
0 d 0
Я очень большой дракон~
wait 1
set text Я очень большой дракон
if %speech% == %text%
  say С очень маленькими яйцами.
end
~
#1189
выдача доспехов ладону~
0 g 100
~
halt
if (%actor.name%==Ладон)
  load obj 91515
end
бр все
~
#1190
Выдача имм шмота~
0 d 100
дай доспехи~
wait 1
if !%actor%
  halt
end
if %actor.name% == поренут
  if %world.curobjs(1190)% < 1
    mload obj 1190
  end
  if %world.curobjs(1189)% < 1
    mload obj 1189
  end
  if %world.curobjs(1188)% < 1
    mload obj 1188
  end
  if %world.curobjs(1187)% < 1
    mload obj 1187
  end
  if %world.curobjs(1186)% < 1
    mload obj 1186
  end
  if %world.curobjs(1054)% < 1
    mload obj 1054
  end
  if %world.curobjs(1059)% < 1
    mload obj 1059
  end
elseif %actor.name% == переплут
  if %world.curobjs(1150)% < 1
    mload obj 1150
  end
elseif %actor.name% == свентовит
  if %world.curobjs(25389)% < 1
    mload obj 25389
  end
  if %world.curobjs(25391)% < 1
    mload obj 25391
  end
  if %world.curobjs(25392)% < 1
    mload obj 25392
  end
  if %world.curobjs(25394)% < 1
    mload obj 25394
  end
  if %world.curobjs(25396)% < 1
    mload obj 25396
  end
elseif %actor.name% == руевит
  if %world.curobjs(1194)% < 1
    mload obj 1194
  end
  if %world.curobjs(1195)% < 1
    mload obj 1195
  end
elseif %actor.name% == рафаил
  if %world.curobjs(1095)% < 1
    mload obj 1095
  end
  if %world.curobjs(1097)% < 1
    mload obj 1097
  end
elseif %actor.name% == снежич
  if %world.curobjs(1168)% < 1
    mload obj 1168
  end
elseif %actor.name% == вестосвет
  if %world.curobjs(1198)% < 1
    mload obj 1198
  end
elseif %actor.name% == божидар
  if %world.curobjs(1066)% < 1
    mload obj 1066
  end
elseif %actor.name% == квасир
  if %world.curobjs(1158)% < 1
    mload obj 1158
  end
  if %world.curobjs(1159)% < 1
    mload obj 1159
  end
elseif %actor.name% == Авось
  if %world.curobjs(1048)% < 1
    mload obj 1048
  end
  if %world.curobjs(1070)% < 1
    mload obj 1072
  end
end
wait 1
give all %actor.name%
~
#1191
Лоад денег~
1 g 100
~
wait 1
log &W%actor.name% нашел приз!&n
if ((%actor.level% <= 25) && (%actor.remort% == 0))
  oecho _&WНовогодний шарик вспыхнул и внезапно рассыпался на множество &Yзолотых монет.&n
  eval gold %random.4999%+1
  %actor.gold(+%gold%)%
else
  oecho _&WНовогодний шарик вспыхнул и внезапно рассыпался на множество &Gзеленых огоньков.&n
end
wait 1
opurge %self%
~
#1192
Рисуем красным маркером~
1 c 1
рисовать~
set selfnum 0
set num 0
foreach i %self.pc%
  eval num %num%+1
done
set ranofself %random.num(%num%)%
foreach n %self.pc%
  eval selfnum %selfnum%+1
  if %ranofself% == %selfnum%
    set char %n%
  break
end
done
if ((%char.name% == Свентовит) && (%actor.sex% != 2))
  oecho Свентовит разгневанно огляделся по сторонам и закричал : "Я те покажу Свентовит + %actor.iname%"
  odamage %actor% 50
  osend %actor% Свентовит шандарахнул молнией прямо по Вам!
  halt
end
if %char.name% == %actor.name%
  osend %actor% Вы огляделись по сторонам в поисках жертвы ваших фантазий.
  osend %actor% Остановившись на себе любимом, Вы начали было вырисовывать &R%actor.iname% + %actor.iname% = Love...&R
  oechoaround %actor% %actor.name% начал%actor.g% было что-то чертить в воздухе &Rкрасным маркером&n, но похоже передумал%actor.g%...
  osend %actor% Но вовремя остановились, слишком уж неестественно как-то :).
else
  osend %actor% Вы огляделись по сторонам в поисках жертвы ваших фантазий. Ага, кажется %char.name% - самое оно.
  oechoaround %actor% %actor.iname% начал%actor.g% что-то рисовать прямо в воздухе &Rкрасным маркером&n.
  %actor.wait(2)%
  osend %actor% Вы начали что-то рисовать и неожиданно для самого себя выписали &R"%actor.iname% + %char.iname% = Love!"&n
  oechoaround %actor% %actor.iname% наконец закончил%actor.g% своё творение...
  oecho Надпись &R%actor.iname% + %char.iname% = Love!&n немного повисела в воздухе и потухла.
end
~
#1193
Выдача новогоднего стафа~
0 d 0
приз~
wait 1
if ((%actor.name% != Квасир ) && (%actor.name% != скатия ) && (%actor.level% < 34))
  say НЕ ДАМ!
  halt
end
eval ok 0
set bonus %speech.cdr%
if ((%bonus% >= 1130) && (%bonus% <= 1183))
  set ok 1
end
if ((%bonus% >= 10600) && (%bonus% =< 10699))
  set ok 1
end
if ((%bonus% >= 11207) && (%bonus% <= 11255))
  set ok 1
end
if (%ok% != 1)
  say НЕ ДАМ!
  halt
end
mload obj %bonus%
give all %actor.name%
~
#1194
Котенку дали еду~
0 j 100
~
wait 1
set nameobj %object.name%
if %nameobj.contains(рыба)% || %nameobj.contains(мяс)% || %nameobj.contains(рыбка)%
  mecho Котенок съел %object.vname%.
  wait 1
  mpurge %object%
  wait 2
  say Мяу!
  wait 1
  emot сел и принялся умываться
  wait 1
  emot тихо замурлыкал.
else
  ворч
  бросить все
end
~
#1195
Рэндом-триггер котенка~
0 ab 5
~
wait 1
set owner 0
if !%self.leader%
  foreach char %self.pc%
    if %char.name% == Пандора
      set owner 1
    end
  done
  if (( owner != 1 ) && ( %self.realroom% != 186 ))
    emot грустно мяукнул
    wait 1s
    mecho Котенок убежал.
    mteleport %self% 186
    halt
  end
end
switch %random.10%
  case 1
    emot сел и принялся умываться
  break
  case 2
    say Мяу!
    emot заглянул вам в глаза, выпрашивая обед
  break
  case 3
    emot тихо замурлыкал
  break
  case 4
    emot припал к земле, а затем прыгнул вперед, пытаясь поймать что-то невидимое
  break
  case 5
    if ( owner == 1 )
      emot запрыгнул на колени к Пандоре и начал вылизываться
      лизн .пандора
    end
    emot
  break
  case 6
    emot спрятался под тазик (только ухи торчат) и начал испуганно выглядывать оттуда
  break
  case 7
    if ( owner == 1 )
      emot залез на колени к Пандоре
      wait 2
      emot свернулся клубочком и задремал
      спать
    end
  break
  case 8
    зевать
    say Мяу!
    wait 2
    вопрос
  break
  case 9
    set target %random.pc%
    ужас %target.name%
  break
  case 10
    emot начал ловить свой хвост
  break
done
~
#1196
Котенок следует за Пандорой~
0 q 40
~
wait 1
if ( %actor.name% == Пандора )
  say Мяу!
  follow .Пандора
  wait 2s
  лизн .Пандора
end
~
#1197
Медвежонок~
1 j 100
~
wait 2
oechoaround %actor% Маленький медвеженок обнял %actor.vname% и принялся вылизывать с ног до головы.
osend %actor% Маленький медвеженок обнял Вас и принялся вылизывать с ног до головы.
~
#1198
Плащик-антидиктофилин~
1 c 3
*~
if (%cmd.mudcommand% == конец || %cmd.mudcommand% == quit || %cmd.mudcommand% == войти || %cmd.mudcommand% == enter || %cmd.mudcommand% == режим || %cmd.mudcommand% == mode)
  %echo% нарушение правил!
  wait 1
end
return 0
~
$~
