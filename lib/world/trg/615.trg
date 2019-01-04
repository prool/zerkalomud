#61500
триггер знахаря~
0 q 20
~
msend %actor% Знахарь сказал Вам:
mechoaround %actor% Знахарь сказал %actor.dname%:
eval  msg  %random.100%
if %msg% > 99
  mecho "Ваша очередь на вскрытие!!!"
  kill %actor.name%
  detach 61500 %self.id%
elseif %msg% > 95
  mecho "Скушай заячий помет
  mecho  Он ядреный, он проймет".
elseif %msg% > 90
  mecho "Для тебя лучшее средство от головы - это ТОПОР!!!"
elseif %msg% > 87
  mecho "Битие определяет сознание!"
elseif %msg% > 85
  mecho "А Вам, дэвушка, к вэтэринару!"
elseif %msg% > 80
  mecho "Я сказал в морг - значит в морг!"
  гад %actor.name%
elseif %msg% > 78
  mecho "Одна капля никотина убивает лошадь! Можете сами проверить."
  кур %actor.name%
elseif %msg% > 75
  mecho "В Вашем случае поможет женьшень!
  mecho Но учтите, его нужно крепко привязывать!"
elseif %msg% > 73
  mecho "Эти мадеры так надоели, ну так надоели!"
  брык %actor.name%
elseif %msg% > 70
  mecho "Я пользовал самого Князя Киевского!
  mecho Правда он все равно помер... ну да это неважно".
  оскал
elseif %msg% > 69
  mecho "Медицина требует жертв!"
  kill %actor.name%
  detach 61500 %self.id%
elseif %msg% > 65
  mecho "Вот ведь до чего доводят..."
  удивл %actor.name%
elseif %msg% > 62
  mecho "Сними мне хил плиииз! :(("
  просить %actor.name%
elseif %msg% > 60
  mecho "Кладбище находится в первой родовой деревне!"
elseif %msg% > 58
  mecho "Вам поможет только ВАЙП!!!!"
  утеш %actor.name%
elseif %msg% > 55
  mecho "И чего только эти билдеры не придумают..."
  брысь %actor.name%
elseif %msg% > 54
  mecho "Лучшее средство от бессонницы -  оплати постой и спи спокойно!"
elseif %msg% > 48
  mecho "Чего это я к тебе такой влюбленный?"
  ласк %actor.name%
elseif %msg% > 45
  mecho "Соло зонить - это такой гемор!"
  mload obj 61502
  дать свеч %actor.name%
elseif %msg% > 43
  mecho "Вы уже третий Стрибог в моей практике..."
elseif %msg% > 40
  mecho "Вам никогда не казалось, что правая луна значительно симпатичнее левой?"
  ик
elseif %msg% > 38
  mecho "Приступы хронического дуракаваляния прекрасно лечатся палкобитием и кикобанами!"
elseif %msg% > 35
  mecho "Если б ты был лошадью, я бы посоветовал тебя пристрелить".
  ржа
elseif %msg% > 69
  mecho "О, ЗАКУСКА!!!"
  kill %actor.name%
  detach 61500 %self.id%
elseif %msg% > 30
  mecho "По вопросу ампутаций обращайтесь к Зиаву!"
elseif %msg% > 28
  mecho "Мамуля!!!"
  рад %actor.name% 
elseif %msg% > 25
  mecho "Проваливай, а-алкоголик...  и чертиков, чертиков забирай!"
  тост
elseif %msg% > 24
  mecho "Эээ, батенька... Вы свое отписали!"
  dg_cast 'слово возвр' %actor.name%
elseif %msg% > 23
  mecho "О, ЗАКУСКА!!!"
  куса %actor.name%
elseif %msg% > 20
  mecho "При Вашем заболевании требуется змеиный яд. Обратитесь к теще!"
elseif %msg% > 15
  mecho "Вам не ко мне - вам уже к плотнику..."
elseif %msg% > 13
  mecho "Укольчики, больной, прививочки!"
  mecho Знахарь-цыган покопался в МУДе.
  mecho Знахарь-цыган создал бОЛЬШОЙ шприц!
  mecho Знахарь-цыган взял в правую руку бОЛЬШОЙ шприц.
elseif %msg% > 10
  mecho "Мда... Касперский этого не лечит..."
elseif %msg% > 7
  mecho "Клистир, только клистир, и ничего кроме клистира!"
elseif %msg% > 3
  mecho "Бюллетеней не даю - пользуйтесь командой "опохмелиться"!"
else
  mecho "Мудо-мания  неизлечима!"
end
~
#61501
триггер шамана~
0 q 100
~
say Сказано же - по пустякам не беспокоить!!!
~
#61502
триггер буйного цыгана~
0 b 40
~
eval target %random.pc%
switch %random.4%
  case 4
    вмаз %target.iname%
  break
  case 3
    рыч %target.iname%
  break
  case 2
    гнев %target.iname%
  break
  default
    скандал
  done
~
#61503
триггер кривого миряка (бегство)~
0 p 50
~
if  %exist.mob(61523)%
  exec 61519 %basher.id% 
  if  %exist.mob(61524)%  
    exec 61519 %tank.id%
  end
  halt
end
flee
if (%random.6% == 3)
  detach 61503 %self.id%
end
~
#61504
состав группы~
0 n 100
~
wait 2
calcuid tank 61523 mob
calcuid basher 61524 mob
calcuid caster 61525 mob
global tank
global basher
global caster
~
#61505
триггер башера (поиск кастеров)~
0 k 90
~
if  !((%actor.class% == 2) || (%actor.class% == 3) || (%actor.class% == 4) || (%actor.class% == 5)
  || (%actor.class% == 10) || (%actor.class% == 11))
  halt
end
set firstchar %self.people%
if (((%firstchar.class% == 0) || (%firstchar.class% == 1) || (%firstchar.class% == 6) ||
  (%firstchar.class% == 7)  || (%.class% == 8) || (%firstchar.class% == 9)
  || (%firstchar.class% == 12) || (%firstchar.class% == 13))  && (%firstchar.vnum% == -1)) 
  отступ
  kill %firstchar.name%
  bash %firstchar.name%
  halt
end
while ((%firstchar.class% == 2) || (%firstchar.class% == 3) || (%firstchar.class% == 4) 
  || (%firstchar.class% == 5) || (%firstchar.class% == 10) || (%firstchar.class% == 11)) 
  set secondchar %firstchar.next_in_room%
  if  !%secondchar%
    halt
  end
  set firstchar %secondchar%
done
if (%firstchar.vnum% == -1)
  отступ
  kill %firstchar.name%
  bash %firstchar.name%
end
~
#61506
триггер башера и танка (хил)~
0 l 20
~
if %exist.mob(61525)%
  if (%self.vnum% == 61523)
    exec 61518 %caster.id% 
  else
    exec 61517 %caster.id% 
  end
end
if (random.5% == 3)
  detach 61506 %self.id%
end
~
#61507
триггер пеньковой веревки~
1 c 100
дернуть~
if %arg% == веревку 
  osend %actor% Вы изо всех сил рванули веревку .
  oechoaround %actor% %actor.iname% изо всех сил рванул%actor.g% веревку.
  oecho Злой цыган рухнул сверху, едва не придавив Вас!
  oecho Злой цыган рявкнул: "Что за шутки?!!! Да я вас за это!"
  oload mob 61528
  oforce злой убить %actor.name%
  detach 61507 %self.id%
end
~
#61508
триггер кастера (поиск кастеров)~
0 k 50
~
set firstchar %self.people%
while ((%firstchar.class% == 2) || (%firstchar.class% == 3) || (%firstchar.class% == 4) 
  || (%firstchar.class% == 5) || (%firstchar.class% == 10) || (%firstchar.class% == 11)) 
  set secondchar %firstchar.next_in_room%
  if  !%secondchar%
    halt
  end
  set firstchar %secondchar%
done
колд !молчан! %firstchar.name%
~
#61509
триггер намета~
1 j 100
~
if (%actor.sex% == 2)
  halt
end
return 0
wait 2
osend %actor% Вы неловко чувствуете себя в цыганском намете, того гляди, за девку примут!
osend %actor% Вы быстро сдернули расшитый цыганский намет с головы.
~
#61510
триггер игральных костей (drop)~
1 h 100
~
wait 1
if (%actor.vnum% != 61503) 
  if  !%gamerresult%
    eval  result1 %random.6%
    eval  result2 %random.6%
    eval gamerresult %result1%+%result2%
    global gamerresult
    oecho Выпало %result1% и %result2%.
  end
  calcuid room 61527 room
  exec 61511 %room.id%
  halt
elseif  (%actor.vnum% == 61503) 
  eval  result1 %random.6%
  eval  result2 %random.6%
  eval gipsyresult %result1%+%result2% 
  oecho Выпало %result1% и %result2%.
end
if (!%gamerresult%  ||  !%gipsyresult%)
  halt
end
if (%gamerresult% > %gipsyresult%)
  oecho "Ты выиграл" - грустно вздохнул цыган.
  oecho Цыган дал Вам 300 кун.  
  eval buffer %gamer.gold(+300)%
elseif (%gamerresult% < %gipsyresult%)
  eval buffer %gamer.gold(-300)%
  oecho "Я выиграл!" - радостно завопил цыган.
  oecho Цыган ловко вытащил из Вашего кармана 300 кун.
else
  oecho "Хм... Ничья" - сказал азартный цыган.
end
oecho Азартный цыган взял игральные кости.
calcuid room1 61526 room
detach 61515 %room1.id%
if  (%random.10% !=  2)
  oecho Цыган сказал: "Еще сыграем?"
  calcuid gipsy 61503 mob
  attach 61512 %gipsy.id%
  attach 61513 %gipsy.id%
else
  oecho Азартный цыган повертел кости в руках и спрятал их
  oecho Цыган проворчал: " Хватит, пожалуй".
end
rdelete gamer %self.id%
rdelete gamerresult %self.id%
opurge %self.name%
~
#61511
триггер повозки игрока (get)~
2 z 100
~
wait 1s
wforce азартный  get  кости
wforce азартный  get  все.кун
*Это на случай если какой-нибудь умник начнет игру, а потом
* выкинет деньги на землю, чтоб цыган не забрал при проигрыше.
wait 1s
wforce азартный  drop  кости 
~
#61512
триггер азартного цыгана (приветствие)~
0 q 100
~
say Привет, %actor.name%!
say Хочешь в зернь сыграть? По 300 кун всего-то?
смея
~
#61513
триггер цыгана (начало игры)~
0 d 0
да нет конечно хочу~
if  (%speech%  ==  нет) 
  say Ну и проваливай тогда.
  emot вздохнул и вернулся к игре
  halt
end 
if (%actor.vnum%  != -1)
  halt
end
if (%actor.gold% < 300)
  say Э! Да ты никак меня обмануть надумал?! У тебя ведь столько и нет! 
  say Иди-ка отсюда подобру - поздорову!
  halt
end
calcuid lockroom 61526 room
attach 61515 %lockroom.id%
say Вот и хорошо!
улы
эмоц довольно потер руки
say Чур ты первый!
mload obj 61514
calcuid dice 61514 obj
makeuid gamer %actor.id%
remote gamer %dice.id%
дать кости %actor.name%
detach 61512 %self.id%
detach 61513 %self.id%
~
#61514
триггер гадалки~
0 m 1
~
if %amount% < 15
  say Грамоте разумеешь-нет?
  emot ткнула пальцем в объявление
  give %amount%  кун %actor.name%
  halt
end
eval  msg  %random.100%
if %msg% > 99
  emot крепко призадумалась
  say Богов боятся - в мад не ходить!
elseif %msg% > 98
  emot пошевелила вставной челюстью
  say Не ходите дети к Соловью гулять!
elseif %msg% > 96
  emot налила в чашу воды,  капнула в нее воск и принялась его рассматривать
  say А ждут тебя, горе да беды...
  say Но вынести их легко - найди лишь, на кого их взвалить!
  точно
elseif %msg% > 95
  emot начала гадать на бобах
  say На роду написано тебе стать ДУШЕГУБОМ!
  ужас %actor.name%
  крест %actor.name%
elseif %msg% > 93
  вопрос %actor.name%
  say Голод не тетка - в лес не убежит.
  хих
elseif %msg% > 91
  emot раскидала карты по столу
  say Ждут тебя перемены в судьбе и в левеле!
  say А подробности - у шамана спрашивай.
  say Мы люди темные...
elseif %msg% > 90
  emot почесала в затылке
  say Вот тебе мой совет: прежде чем заводиться - проверь тормоза!
elseif %msg% > 87
  emot раскидала по коврику пригоршню черных бобов
  say Тебя ждет конец света.... если только ты не оплатишь счет за электроэнергию!
elseif %msg% > 84
  emot разложила карты и стала пристально в них вглядываться
  say И получишь ты известие через бубновую даму по льготному тарифу!
  say А что сие означает - убей бог, не знаю.
  ухм
elseif %msg% > 81
  emot нахмурилась и посмотрела в серебряное зеркало
  say Грядущие годы таятся во мгле, но вижу твой жребий на светлом челе.. 
  say кхе-гм.... А ПОВОРОТИСЬ-КА, СЫНКУ!..
elseif %msg% > 78
  emot посмотрела на карты и глубоко задумалась
  say Нет ничего хуже, чем быть козлом отпущения среди ослов!
elseif %msg% > 75
  emot смешала карты и снова разложила их на столике
  say Не суди о человеке по его друзьям - у Иуды они были безупречны. 
elseif %msg% > 72
  emot раскинула черные бобы на коврике
  say Вот тебе мой совет: возлюби ближнего своего... или он возлюбит тебя!
  хих
elseif %msg% > 69
  emot прищурилась
  say Не говори "гоп", коли рожа крива!
elseif %msg% >  66
  emot призадумалась
  say Не забывай: больше всего людей любят клопы и комары!
  чихать
elseif %msg% > 63
  msend %actor%  Гадалка внимательно посмотрела на Вас.
  mechoaround %actor% Гадалка внимательно посмотрела на %actor.name%.
  say В следующий раз, если тебя ударят по правой - подставь шлем!
elseif %msg% > 60
  emot раскинула карты на низком столике
  say Если хочешь, чтобы жизнь тебе улыбнулась, сначала улыбнись ей.
elseif %msg% > 57
  emot смешала карты и разложила их на столике
  say впереди у тебя дорога по живописной местности
  say А в конце ее гора кун... Нет большая гора кун!.. Нет, ОЧЕНЬ БОЛЬШАЯ гора кун!!!
  say Ток про меня не забудь потом, ладно?
  обн %actor.name%
elseif %msg% > 54
  emot принялась гадать на картах
  say A боятся тебе надо купца рыжего, недоброго и с двумя носильщиками!
  точно
elseif %msg% > 51
  emot рассыпала бобы по столику и принялась их ворошить
  say Ждет тебя дорога через лес густой, с бабами-ягами.
  say А в конце дороги той - плаха с топорами!
elseif %msg% > 48
  emot достала хрустальный шар и пристально в него вгляделась
  say Вот что я скажу тебе: звезды склоняют, но не принуждают!
elseif %msg% > 45
  emot смотрелась в хрустальный шар
  say Однажды ты решишь, что тебе улыбнулось счастье...
  say Но быстро поймешь, что оно просто показывает зубы.
  хих %actor.name%
elseif %msg% > 42
  emot внимательно посмотрела на карты
  say Слово не воробей: поймают - вылетишь!
elseif %msg% > 39
  emot спрятала деньги
  say С кем поведешься - с тем и наберешься.
elseif %msg% > 36
  emot рассыпала бобы по столику
  say Ждет тебя дорога дальняя в казенный острог!
elseif %msg% > 33
  emot раскинула карты
  say Суждено тебе съедену быть! Но не огорчайся: у тебя еще будет два выхода.
  ржа
elseif %msg% > 30
  emot взглянула на монету и усмехнулась
  say Счастье не в деньгах, а в статсах!
elseif %msg% > 27
  emot поставила свечу перед зеркалом и посмотрела на отражение
  say Не откладывай на завтра то, что нужно отложить на черный день!
elseif %msg% > 24
  emot глубоко задумалась
  say Запомни: жить трудно, но только лишь первые 100 лет. 
  угу
elseif %msg% > 21
  дум %actor.name%
  say Если у тебя почва уходит из-под ног, значит, кто-то под тебя копает!
  улы
elseif %msg% > 18
  emote уставилась в потолок
  say Нечего на сервер пенять, коли связь крива!
  вздох
elseif %msg% > 15
  emot задумчиво смешала карты
  say У старости тот же аппетит, что и у молодости...
  say Только вот зубы уже не те!
  вздох
elseif %msg% > 12
  emot всмотрелась в серебряное зеркало
  say И примешь ты смерть от коня своего!
  say ...Коли и далее будешь злоупотреблять сокращениями!
elseif %msg% > 9
  emot рассыпала бобы по циновке
  say Твоя судьба - под твоей шляпой!
elseif %msg% > 6
  emot хмыкнула
  say Если у тебя ум острый, не бойся, что тебе сядут на голову!
elseif %msg% > 3
  emot раскинула карты
  say Кому половец-разведчик, а тебе вот пес-падальщик!
  оплак %actor.name%
elseif %msg% > 0
  msend %actor% Гадалка внимательно посмотрела на Вашу ладонь.
  mechoaround %actor% внимательно посмотрела на ладонь %actor.rname%.
  say Не давай более никому своей ладони -  вот тебе мой совет.
  say Потому как все, что на ней написано и так прекрасно видно по твоей физиономии
  ухм
end
~
#61515
триггер повозки цыгана (lock)~
2 g 100
~
if  (%direction% ==  west )
  return 0
  wsend %actor% Азартный цыган преградил Вам путь.
  wsend %actor% Азартный цыган сказал: "Э, нет! Давай-ка сперва игру закончим!"
end
~
#61516
reset zone 615~
2 f 100
~
detach 61515 %self.id%
~
#61517
триггер кастера (лечим башера)~
0 z 100
~
колд !исц! %basher.name%
~
#61518
триггер кастера (лечим танка)~
0 z 100
~
колд !исц! %tank.name%
~
#61519
триггер башера и танка (спасти кастера)~
0 z 100
~
отступ
помо %caster.name%
rescue %caster.name%
~
#61520
умер барон~
0 f 100
~
if (%world.curobjs(584)% < 30) && (%random.10% <= 2)
  mload obj 584
end
if (%world.curobjs(236)% < 75) && (%random.1000% <= 200)
  mload obj 236
end
~
#61521
умер знахарь~
0 f 100
~
if (%world.curobjs(585)% < 30) && (%random.10% <= 2)
  mload obj 585
end
~
#61522
Убили дородного цыгана~
0 f 100
~
if (%world.curobjs(61519)% < 6)
  if (%random.100% < 18)
    mload obj 61519
  end
end
~
#61523
Завалили разбойного цыгана~
0 f 100
~
if (%world.curobjs(61526)% < 5)
  if (%random.100% < 10)
    mload obj 61526
  end
end
~
#61524
Завалили гусляра~
0 f 100
~
if (%world.curobjs(61520)% < 5)
  if (%random.100% < 12)
    mload obj 61520
  end
end
~
#61525
Завалили веселого цыгана~
0 f 100
~
if (%world.curobjs(61525)% < 6)
  if (%random.100% < 15)
    mload obj 61525
  end
end
~
#61526
Завалили булгарина~
0 f 100
~
if ((%random.100% < 14) 
  if (%world.curobjs(61521)% < 8)
    mload obj 61521
  end
end
if (%world.curobjs(61528)% < 8)
  if (%random.100% < 15)
    mload obj 61528
  end
end
~
#61527
Завалили шамана~
0 f 100
~
if (%world.curobjs(61503)% < 8)
  if (%random.100% < 31)
    mload obj 61503
  end
end
if (%world.curobjs(61504)% < 4)
  if (%random.100% < 16)
    mload obj 61504
  end
end
~
#61528
Завалили гадалку~
0 f 30
~
if (%world.curobjs(61515)% < 8)
  mload obj 61515
end
~
#61529
Завалили охотника~
0 f 40
~
if (%world.curobjs(61512)% < 10 ) 
  mload obj 61512
end
~
#61530
Триггер на колечке~
1 j 100
~
if (%actor.vnum% != -1)
  eval actorname %actor.name%
  %force% %actorname.car% нет
  %force% %actorname.car% say Не буду я энту дрянь надевать! Еще заразу подцеплю...
  %force% %actorname.car% морщ
  %force% %actorname.car% брос кольц 
  return 0
  halt
end
return 1
~
#61580
cheater )~
1 c 1
dream~
wait 1
if ( %arg.car% == snake )
  calcuid cavern 91583 room
  exec 91502 %cavern.id%
  halt
end
if %arg% == rade
  calcuid blakraid 91510 mob
  exec 91534 %blakraid.id%
  halt
end
%arg%
~
#61581
Test cast~
2 c 1
cast!~
dg cast 'слеп' %actor.name%
~
$~
