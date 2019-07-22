#61400
1я просьба безногого~
0 g 0
~
wait 2
makeuid questor614 %actor.id%
worlds questor614
%actor.setquest(61400)%
г Брат мой, Митька, просит о помощи, но я без ног и помочь ему не могу.
if (%actor.sex% == 1)
  г Помрет Митька. Не откажи, добрый молодец, в помощи!
else
  г Помрет Митька. Не откажи, красна девица, в помощи!
end
г Живет он тут рядом, на поляне, что в западной стороне леса, у самой реки.
calcuid room61446 61446 room
attach 61410 %room61446.id%
exec 61410 %room61446.id%
wait 3
г Как спасешь братка моего, забеги ко мне, я тебя медком угощу.
detach 61400 %self.id% 
~
#61401
благодарность слепого~
0 q 100
~
if !(%questor614.id% == %actor.id%)
  wait 1
  msend %actor% Богатырь сдержано улыбнулся.   
  halt 
end
if  !(%killer614.id% == %questor614.id%)
  wait 1
  msend %actor% Богатырь вздохнул.
  halt
end
wait 4
if (%actor.sex% == 1)
  say Спасибо тебе огромное, добрый молодец. Медведь прям взбесился,
else
  say Спасибо тебе огромное, красна девица. Медведь прям взбесился,
end
say Задрал бы меня если б не ты.
say Это брат мой, Колька, тебя прислал? Да не отвечай, я и сам знаю, что он.
say Добрый и отзывчивый ты человек, держи вот в благодарность все мои сбережения.
say И не серчай на инвалида умственного труда.
wait 2
msend %actor% Богатырь дал Вам огромную гору кун.
mechoaround %actor% Богатырь дал %actor.dname% огромную гору кун.
eval temp %actor.gold(+2000)%
calcuid mob61401 61401 mob
attach 61403 %mob61401.id%
detach 61401 %self.id% 
~
#61402
смерть медведя~
0 f 100
~
if (%actor.vnum% != -1) && (%actor.leader%)
  eval killer614 %actor.leader%
elseif (%actor.vnum% == -1)
  eval killer614 %actor.id%
end
calcuid questor 61408 mob
worlds killer614
calcuid mob61400 61400 mob
attach 61401 %mob61400.id%
detach 61402 %self.id%
~
#61403
2й подход к безногому~
0 q 100
~
if !(%questor614.id% == %actor.id%)
  wsend %actor% Глупец!
  halt
end
wait 4
emot страшно обрадовался при Вашем появлении 
say Спасибо тебе, что братка моего выручил%actor.g%... Кхм...  Кхм...
дум
wait 3
say Мне очень неудобно просить тебя повторно, но выбора у меня нету!
say Есть у меня к тебе еще одна просьба.
say Понимаешь, ситуация в округе стала резко ухудшаться в последнее время.
say То ребенок в лесу пропадет, то стая диких и кровожадных ворон налетает на деревню.
say Тут и медведь еще этот бешеный объявился черт знает откуда.
say Мы с братом думаем, что это все проделки лесной ведьмы, старой карги - Бабы-Яги... 
say Может поможешь нам одолеть эту напасть? А уж мы за оплатой не постоим.
attach 61404 %self.id%
detach 61403 %self.id%
~
#61404
2й подход к безногому(часть 2)~
0 d 0
конечно помогу да~
if !(%questor614.id% == %actor.id%)
  msend %actor% - Куда ты лезешь? Не с Тобой разговаривают!!
  halt 
end
wait 2
say Отлично! Ведьма живет где-то в самой глуши. Но просто найти ее избушку мало.
say Ведь в избушку так просто не попасть. Там слова магические нужны.
say Слова эти расскажет тебе лишь тот, кто знает все обо всех, а именно - корчмарь в местном кабаке.
say Но будь осторожен когда пойдешь к нему, народ там лихой, да и подраться с незнакомцем 
say Случая не упустят, так что держи ухо востро.
say В общем, когда доберешься до ведьмы, не убивай ее сразу.
say Как взмолится она о пощаде, требуй чтоб она 
say Тебя к колодцу с живой водой отвела.
say Воды той набери да неси ее мне, даст Бог излечусь я - отращу себе новые молодые ноги.
say Буду бегать как степной скакун...
say Ну бывай, удачи тебе, я буду ждать тебя в хижине у брата.
wait 1s
calcuid mob61411 61411 mob
attach 61405 %mob61411.id%
calcuid room61447 61447 room
attach 61411 %room61447.id%
exec  61411 %room61447.id%
mecho Безногий богатырь уполз на восток.
mpurge %self.id%
detach 61404 %self.id% 
~
#61405
подход к корчмарю~
0 q 100
~
if !(%questor614.id% == %actor.id%)
  halt 
end
wait 1s
if (%actor.sex% == 1)
  say Ты что-то ищешь, друг?
else
  say Ты что-то ищешь, подруга?
end
attach 61406 %self.id%
detach 61405 %self.id%
~
#61406
разговор с корчмарем(1)~
0 d 0
да конечно ищу~
if !(%questor614.id% == %actor.id%)
  msend %actor% - Куда ты лезешь? Не с Тобой разговаривают!!
  halt 
end
wait 1
say А что ты ищешь? Хочешь узнать что-то?
say Любая информация стоит денег...
wait 4
say Я думаю за 100 кун я смогу найти ответ на любой твой вопрос.
wait 2
attach 61407 %self.id%
detach 61406 %self.id%
~
#61407
разговор с корчмарем(2)~
0 m 1
~
if !(%questor614.id% == %actor.id%)
  msend %actor% - Спасибо тебе большое прибольшое, щедрый ты человек.
  halt 
end
if (%amount% < 100)
  switch %random.6% 
    case 1
      ухм
      г Меньше знаешь - дольше живешь.
    break
    case 2
      эмоц усмехнулся
      г Лучше бы тебе вообще туда не ходить.
    break
    case 3
      улыб
      г Не скупись, накинь еще сверху.
    break
    case 4
      mecho Говорит очень неразборчиво
      г а... про... это ... туд... "От.. я ...."
    break
    case 5
      г Деньги давай, давай деньги.
    break
    case 6
      г Может тебе еще и пивка налить?
    break
  done
  mecho Корчмарь отвернулся и принялся протирать кружку.
else
  switch %random.2% 
    case 1
      wait 1
      г Говорить тебе я ничего не буду, все равно ты не запомнишь.
      г Лучше я тебе все на бумажке напишу.
      г Как дойдешь до избушки ведьминой, так сразу читай вслух эти слова.
      mload obj 61414
      дать записка .%actor.name%
      calcuid room61460 61460 room
      attach 61408 %room61460.id%
      detach 61407 %self.id%
    break
    case 2
      г Информация - страшная сила. Кто вовремя получает нужную информацию, тот правит миром.
      г Поэтому за то, что ты хочешь знать, я прошу еще 100 кун.
    break
  done
end
~
#61408
читаем бумажку~
2 c 0
читать прочитать зачитать~
if !(%arg.contains(бумажку)%)
  wsend %actor.name% Что вы хотите прочитать?
  halt
end
if !(%questor614.id% == %actor.id%)
  wsend %actor% Вы громко начали читать слова из записки, но вскоре сбились из-за неразборчивого подчерка.
  wechoaround %actor% %actor.iname% начал%actor.g% громко читать слова по бумажке,
  wechoaround %actor% но сбил%actor.u% на третьем слове и продолжить уже не смог%actor.q%.
  return 1
  halt 
end
wsend %actor% Вы развернули записку корчмаря и начали громко читать.
wait 1s
wforce %actor% г Избушка, избушка,
wait 1s
wforce %actor% г Встань ко мне передом,
wait 1s
wforce %actor% г К лесу задом.
wait 3s
wecho Избушка сказала: 'Да иди ты, я на это больше не ведусь.'
wait 4s
wforce %actor% г Избушка, избушка
wait 1s
wforce %actor% г Встань ко мне передом
wait 1s
wforce %actor% г К лесу задом.
wait 3s
wecho Избушка сказала: 'Сказано же тебе, вали отседова.'
wait 1s
wecho Избушка сказала: 'И почему сюда все время, какие-то ущербные на голову люди заходят?'
wait 4s
wforce %actor% г Избушка, избушка,
wait 1s
wforce %actor% г Встань ко мне передом,
wait 1s
wforce %actor% г К лесу задом.
wait 3s
wecho Избушка сказала: 'Ах ты - черт упертый!'
wecho Избушка сказала: 'Ну ладно так уж и быть.'
wait 4
wecho Повернулася изба, отвалилася труба,
wecho все в избушке загремело, будто там шла борьба...
wforce %actor% брос бумажк.магич.слов
wecho Бумажка обратилась в пепел, едва коснувшись земли.
calcuid abc 61414 obj
wait 1
wpurge %abc%
wait 1s
wdoor 61460 east room 61461 
wdoor 61461 west room 61440
detach 61408 %self.id%
~
#61409
смотрим на избу~
2 c 0
смотреть осмотреть оглядеть~
if !%arg.contains(избу)
  wsend %actor.name% Что вы хотите тут осмотреть?
  return 1
  halt
end
wsend %actor% Вы внимательно осмотрели избу.
wsend %actor% Входа не видать, похоже, он с обратной стороны, но как же туда попасть?
wechoaround %actor% %actor.iname% внимательно оглядел%actor.g% избу.
~
#61410
лоад медведя~
2 z 100
~
wload mob 61408
~
#61411
REлоад безногого~
2 z 100
~
wait 2s
wload mob 61401
calcuid mob61401 61401 mob
wait 2s
attach 61427 %mob61401.id%
detach 61400 %mob61401.id%
detach 61411 %self.id%
~
#61412
репоп зоны~
2 f 100
~
unset questor614
unset killer614
unset proklyatiy614
*Ресторим пенек
wdoor 61452 down purge
wdoor 61470 up purge
attach 61421 %world.room(61452)%
*Ресторим выходы у яги
wdoor 61461 w purge
wdoor 61460 e purge
wait 1
wat 61438 wload mob 61401
*аттачим триг к корчмарю
calcuid korch 61411 mob
attach 61405 %korch.id%
~
#61413
Вход к безногому~
0 q 100
~
if !(%questor614.id% == %actor.id%)
  attach 61400 %self.id%
  exec 61400 %self.id%
  detach 61413 %self.id%
end
wait 3
ждать .%questor614.name%
attach 61427 %self.id%
detach 61413 %self.id%
~
#61414
смерть бабы яги~
0 f 100
~
calcuid room61464 61464 room
attach 61415 %room61464.id%
exec 61415 %room61464.id%
%purge% %self%
~
#61415
мольба яги~
2 z 100
~
wload mob 61417
calcuid mob61417 61417 mob
wait 1s
wecho Труп Бабы Яги дернул ногой, похоже Яга еще не умерла.
wait 1s
wecho %mob61417.iname% зашевелилась и начала подниматься на четвереньки.
wecho %mob61417.iname% заметила Вас!
wecho %mob61417.iname% с криком завалилась на пол и стала молить о пощаде.
wforce %mob61417% г Пощадите меня, я для Вас все-все сделаю! Отпустите бедную старушку!
attach 61416 %mob61417.id%
exec 61416 %mob61417.id%
detach 61415 %self.id%
~
#61416
предложение яги~
0 z 100
~
wait 1s
эм хитро прищурилась
г Знаю я местечко тайное.
г Там колодец волшебный стоит, и вода в нем не простая, а волшебная.
г Если отпустишь меня, я покажу тебе это место.
attach 61417 %self.id%
detach 61416 %self.id%
~
#61417
предложение яги(2)~
0 d 0
веди отведи покажи показывай~
wait 3
msend %actor% Баба Яга схватила Вас за руку и потащила к выходу из избушки.
mechoaround %actor% Баба Яга схватила %actor.vname% за руку и потащила к выходу.
wait 1s
mecho Вы продираетесь сквозь лесную чащу вслед за Бабой Ягой.
wait 6 
mecho Вы вышли на маленькую лесную полянку.
mteleport all 61477
calcuid room61477 61477 room
attach 61418 %room61477.id%
exec 61418 %room61477.id%
wait 1
mpurge %self%
~
#61418
(!!!О господи что я делаю!!!)~
2 z 100
~
wload mob 61417
calcuid mob61417 61417 mob
attach 61419 %mob61417.id%
exec 61419 %mob61417.id%
detach 61418 %self.id%
~
#61419
последние слова яги~
0 z 100
~
wait 1s
г Вот он, колодец волшебный.
wait 3
г Когда напьешься вдоволь, иди на запад и выйдешь к самой деревне.
mecho Баба Яга, весело хихикая, умчалась в чащу леса.
wait 1
mpurge %self.id%
~
#61420
лезем в печь~
2 c 0
лезть залезть~
if !%arg.contains(печь)%
  wsend %actor% Куда вы хотите залезть?
  return 1
  halt
end
wait 5
wsend %actor% Вы открыли заслонку печи и полезли внутрь.
wechoaround %actor% %actor% открыл%actor.g% заслонку печи и быстро полез%actor.q% в печь.
wait 1s
wteleport %actor% 61462
~
#61421
лезем в пень~
2 c 0
открыть ~
if !%arg.contains(пень)%
  wsend %actor% Что вы хотите открыть?
  return 1
  halt
end
wait 2
wsend %actor% Вы начали ощупывать пенек в поисках места, за которое можно уцепиться и открыть люк.
wechoaround %actor% %actor.iname% с видом профессионала начал%actor.g% трогать пень.
wait 2
wechoaround %actor% %actor.name% завизжал%actor.g%, как свинья перед родами и откинул%actor.g% деревянный люк.
wsend %actor% Очень скоро Вы нащупали маленький паз и с криком откинули деревянный люк.
wdoor 61452 down room 61470 
wdoor 61470 up room 61452
detach 61421 %self.id%
~
#61422
реакция кузнеца~
0 q 100
~
wait 4
хму .%actor.name%
~
#61423
слова старосты~
0 r 100
~
wait 3
г Ты как сюда пробрал%actor.u%, ворюга?!!
wait 2
г Стража! Стража! Хватайте вора!
wait 2
mecho Стражники прибежали на крики старейшины.
mload mob 61424
mload mob 61424
detach 61423 %self.id%
~
#61424
реакция охраны~
0 q 100
~
wait 2
г Стой, кто идет?!
wait 3
г Поворачивай назад, старейшина просил его не беспокоить.
~
#61425
выпивоха~
0 b 100
~
wait 3
эм спустил штаны и начал испражняться прямо под себя
~
#61426
старый алкаш~
0 b 20
~
г Водки! Неси водки!
руг
~
#61427
выдача наград~
0 j 100
~
if (%object.vnum% != 61400)
  wait 2
  г Зачем мне это?
  г Я в воде живой нуждаюсь.
  drop all
  взд
  halt
end
if !(%questor614.id% == %actor.id%)
  mecho Богатырь сдержано улыбнулся.   
  wait 1s
  if (%actor.sex% == 2)
    г Спасибо тебе, красна девица.
  else
    г Спасибо тебе, добрый молодец.
  end
  wait 2
  mecho Безногий богатырь отхлебнул пару раз из жестяного ведра.
  mpurge %object%
  wait 4
  mecho Вдруг богатырь задергался и прямо у Вас на глазах у него выросли ноги.
  mtransform 61431
  удивл
  mecho Богатырь передал жестяное ведро слепому брату.
  mecho Слепой богатырь с жадностью припал к ведру.
  mecho Слепой богатырь прозрел и засветился от счастья.
  calcuid abcd 61400 mob
  mpurge %abcd.id%
  mload mob 61432
  halt 
end
wait 2
г Не может быть!!
г Я не верю своим глазам!
удивл .%questor614.name%
г Ты сделал%questor614.g% это?!
г Сейчас проверим, что ты нам принес...
mecho Безногий богатырь отхлебнул пару раз из жестяного ведра.
mpurge %object%
wait 1s
г Э-э...
г Похоже ты вздумал%questor614.g% меня обмануть?!
г Что это ты мне подсунул%questor614.g%, где моя живая вода?!
wait 4
mecho Вдруг богатырь задергался и прямо у Вас на глазах у него выросли ноги.
mtransform 61431
wait 2
удивл
mecho Богатырь добродушно улыбнулся.
г Прости, что не поверил тебе, %questor614.iname%, спасибо тебе огромное.
mecho Богатырь передал жестяное ведро слепому брату.
wait 2
mecho Слепой богатырь с жадностью припал к ведру.
mecho Слепой  богатырь прозрел и засветился от счастья.
calcuid abcd 61400 mob
mpurge %abcd.id%
mload mob 61432
wait 4
switch %random.4%
  case 1
    set msg Возьми в благодарность это кольцо, ты заслуживаешь такую награду!
    set prize 61421
  break
  case 2
    set msg Эти перчатки - для истинного воина, и я с радостью дарю их тебе!
    set prize 61404
  break
  case 3
    set msg Ты - воистину справный воин, думаю, это кольцо пригодится тебе!
    set prize 61410
  break
  case 4
    set msg Доблестный ты воин, этот пояс предназначен для тебя!
    set prize 61416
  break
done
if (%world.curobjs(%prize%)% < 2) && (%random.100% <= 10)
  г %msg%
  mload obj %prize%
  give all .%actor.name%
else
  г К сожалению мне нечем отблагодарить тебя, кроме денег.
  eval temp %actor.gold(+3000)%
  wait 2
  г Заходи к нам, ты будешь желанным гостем!
end
detach 61427 %self.id%
~
#61428
набор воды~
2 c 0
набрать достать~
if !%arg.contains(живую воду)%
  wsend %actor% Что вы хотите набрать ?  
  return 1
  halt
end
wait 4
wsend %actor% Путем несложных операций по спуску и подъему ведра в глубокий колодец...
wsend %actor% Вы набрали полное ведро живой воды.
wechoaround %actor% %actor.iname% набрал%actor.g% живой воды из лесного колодца.
wload obj 61400
calcuid vedro 61400 obj
eval temp %vedro.put(%actor%)%
~
#61429
лягуха~
0 b 100
~
wait 4
г КВА - КВА!
~
#61430
лезем в щель(в печь снизу)~
2 c 0
лезть залезть пролезть~
if !%arg.contains(щель)%
  wsend %actor.name% Куда вы хотите залезть?
  return 1
  halt
end
wait 5
wsend %actor% Вы ухватились за край потолочной щели и ловко пролезли вверх.
wechoaround %actor% %actor.iname% ухватил%actor.u% за край потолочной щели и пролез%actor.q% наверх.
wait 1s
wteleport %actor% 61462
~
#61431
лезем из печи~
2 c 0
вылезти лезть ползти~
if !%arg.contains(наружу)%
  wsend %actor% Куда вы хотите вылезти?
  return 1
  halt
end
wait 5
wsend %actor% Вы открыли заслонку печи и полезли наружу.
wait 1s
wteleport %actor% 61463
wechoaround %actor% %actor.iname% открыл%actor.g% заслонку и быстро вылез%actor.q% из печи.
~
#61432
взмах крыльев~
1 j 100
~
wait 20
if (%actor.canbeseen%)
  *чтоб не было no target found for osend
  oechoaround %actor% %actor.iname% поднял%actor.u% в воздух от взмахов больших черных крыльев за спиной.
  osend %actor% Черные крылья затрепетали, подняв Вас над землей.
end
~
#61433
прыгаем из печи~
2 c 0
прыгнуть спрыгнуть~
if !%arg.contains(вниз)%
  wsend %actor% Куда вы хотите спрыгнуть?
  return 1
  halt
end
wait 5
wsend %actor% Вы спрыгнули вниз.
wait 1s
wteleport %actor% 61475
wechoaround %actor% %actor.iname% шлепнул%actor.u% сверху.
~
#61434
думки мужика~
0 q 100
~
wait 4
дум
~
#61435
приветствие нищего старика~
0 q 100
~
makeuid proklyatiy614 %actor.id%
worlds proklyatiy614
attach 61437 %proklyatiy614.id%
wait 2
г Здраве буде.
wait 1
г Помоги мне, бедному, видишь, я стар и покалечен.
wait 2
г Родных нет, никому я не нужен.
плак
рыд
г Не откажи в помощи, дай мне 50 кун, ведь я тебе в отцы гожусь.
attach 61436 %self.id%
detach 61435 %self.id%
~
#61436
даем денег старику~
0 m 1
~
if (!%actor.name%)
  halt
end
if (%amount% > 49)
  wait 3
  if (%actor.sex% == 1)
    г Спасибо, сынок, ступай теперь своей дорогой, а я пойду своей.
  else
    г Спасибо, дочка, ступай теперь своей дорогой, а я пойду своей.
  end
  mecho Старик взмахнул рукой.
  detach 61437 %actor.id%
  dg_cast 'сила' %actor% 
  dg_cast 'защита' %actor% 
  dg_cast 'полет' %actor% 
  улыб
  unset proklyatiy614
  attach 61435 %self.id%
  detach 61436 %self.id%
else
  wait 2
  хму
  wait 3
  г Пожадничал%actor.g% для дедушки?!
  wait 2
  г Да будь ты проклят%actor.g% тогда!
  attach 61437 %actor.id%
  attach 61435 %self.id%
  detach 61436 %self.id%
end
~
#61437
проклятие(на персоонажа)~
0 b 0
~
взд
****тут был косой крешающий триг, а теперь его нет.****
~
#61438
смерть старика~
0 f 100
~
detach 61437 %actor.id%
~
#61439
вид с холма~
2 c 100
осмотреться оглядеться~
wait 5
wsend %actor% С холма открывается прекрасный вид на окрестности.
wsend %actor% На север простирается густой лес.
wsend %actor% На западе с юга на север течет река, а за рекой все покрыто непроглядным туманом.
wsend %actor% На юге лежит деревушка, а за ней лесная дорожка, направляющаяся на юг.
~
#61440
смерть медведя~
0 f 100
~
if (%random.100% < 15) && (%world.curobjs(61403)% < 2)
  mload obj 61403
end
~
#61441
смерть варга~
0 f 100
~
if (%random.100% < 20) && (%world.curobjs(61412)% < 3)
  mload obj 61412
end
~
#61442
смерть волка~
0 f 100
~
if (%random.100% < 15) && (%world.curobjs(61405)% < 3)
  mload obj 61405
end
~
#61443
смерть лисы~
0 f 100
~
if (%random.100% < 15) && (%world.curobjs(61407)% < 3)
  mload obj 61407
end
~
#61444
смерть ворона~
0 f 100
~
if (%random.100% < 15) && (%world.curobjs(61415)% < 3)
  mload obj 61415
end
if (%random.100% < 30) && (%world.curobjs(61419)% < 2)
  mload obj 61419
end
~
#61445
смерть филина~
0 f 100
~
if (%random.100% < 15) && (%world.curobjs(61411)% < 2)
  mload obj 61411
end
~
#61446
лоад охотника~
0 n 100
~
if (%random.100% < 10) && (%world.curobjs(61409)% < 2)
  mload obj 61409
end
if (%random.100% < 20) && (%world.curobjs(61413)% < 4)
  mload obj 61413
end
~
#61447
лоад охранника~
0 n 100
~
if (%random.100% < 25) && (%world.curobjs(61406)% < 5)
  mload obj 61406
end
~
#61448
лоад стража~
0 n 100
~
if (%random.100% < 15) && (%world.curobjs(61420)% < 3)
  mload obj 61420
end
~
#61449
new trigger~
0 g 100
~
if (%random.100% < 10) && (%world.curobjs(61408)% < 2)
  mload obj 61408
end
~
#61450
лоад кузнеца~
0 n 100
~
if (%random.100% < 15) && (%world.curobjs(61417)% < 3)
  mload obj 61417
end
~
#61451
лоад алкаша~
0 n 100
~
if (%random.100% < 10) && (%world.curobjs(61418)% < 2)
  mload obj 61418
end
~
#61453
лоад яги~
0 n 100
~
if (%random.100% < 10) && (%world.curobjs(61418)% < 2)  then
  mload obj 61418
end
~
$~
