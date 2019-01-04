#5500
хозяйка-встреча~
0 q 100
~
if %actor.vnum% != -1
  halt
end
if %world.curmobs(5500)% > 0
  msend %actor% Хозяйка заметила ваше присутствие и повернулась к вам.
  tell %actor.name% Добрый день!
  tell %actor.name% Как занесло тебя в наши богом забытые края? Здесь обитаем только мы.
  tell %actor.name% Раз ты прошел через окружающий лес, ты достаточно силен и опытен.
  tell %actor.name% У меня есть к тебе просьба, спаси нас от напасти.
  tell %actor.name% Коршуны повадились похищать наших кур и цыплят, бестии.
  tell %actor.name% Убей их, и принеси доказательство их смерти.
  tell %actor.name% Я отблагодарю тебя за это.
  msend %actor% Хозяйка продолжила заниматься своими делами.
end
~
#5501
смерть коршуна~
0 f 100
~
if %world.curmobs(5500)%==1 && %world.curobjs(5500)%==0
  mload obj 5500
  calcuid ovar 5500 obj
  attach 5503 %ovar.id%
end
~
#5502
дали крыло хозяйке~
0 j 100
~
wait 1
if (( %object.vnum% == 5500 ) && !%self.fighting%)
  wait 1
  mpurge %object%
  mecho Хозяйка осмотрела окровавленное крыло.
  say Ух ты, ты убил окаянных!
  dg_cast 'насыщение' %actor.name%
  dg_cast 'восстановление' %actor.name%
  dg_cast 'исцеление' %actor.name%
  dg_cast 'освящение' %actor.name%
  calcuid hostr 5514 mob
  attach 5504 %hostr.id%
  attach 5507 %hostr.id%
  if ((%random.1000% <= 200) && (%world.curobjs(516)% < 1))
    mload obj 516
    дать береста %actor.name%
  end
  if (%world.curobjs(234)% < 50) && (%random.1000% <= 100)
    mload obj 234
    дать рун %actor.name%
  end
  if (%world.curobjs(1731)% < 1) && (%random.1000% <= 50)
    mload obj 1731
    дать рецепт %actor.name%
  end
  say Благодарю, ты выручаешь нас.
end
~
#5503
подняли крыло~
1 g 100
~
if %actor.realroom% == 5548 || %actor.realroom%  == 5549
  oforce %actor.name% сесть
  osend %actor.name% Наклонившись за крылом, вы наступили на залитое кровью место и поскользнулись.
  osend %actor.name% Ну что, будем считать, сколько тут веток до земли встретится: раз, два, три...
  wait 5
  if %actor.sex% == 1
    oecho %actor.name% полетел вниз с дерева.
  else
    oecho %actor.name% полетела вниз с дерева.
  end
  osend %actor.name% Вы полетели вниз с дерева.
  wait 1
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
0 r 100
~
wait 1
if (( %world.curmobs(5503)% > 0 ) && ( %world.curobjs(5508)% == 0 ))
  mecho Хозяин поднял голову и посмотрел в вашу сторону.
  say Добрый день, путник!
  mecho _- Ты помог избавится нам от коршунов, спасибо тебе!
  mecho _- Если ты смог их победить может ты и мне сделаешь услугу.
  mecho _- Я нанимаю на работу окрестных мужиков, они в принципе хорошо работают.
  mecho _- Но вот в последний раз взял на работу троих и очень пожалел.
  mecho _- Работать не хотят совсем, все спят на полатях и есть требуют.
  mecho _- Я уже стар и не в состоянии выгнать их.
  mecho _- Одолей их, и я отблагодарю тебя.
  mecho _- Да, самое главное - отбери у них ключ от моего сундука, украли они, точно.
  if (!%self.haveobj(5514)% && (%world.curobjs(5514)% < 6))
    mload obj 5514
    calcuid vobj 5514 obj
    взять %vobj.name%
    воор %vobj.name%
  end
  wait 3
  say А я если что, встречу их здесь!
  mecho _- Хозяин встал из-за стола и прошел по комнате.
  mecho _- Только здесь вы заметили что он хромает и с трудом передвигает левую ногу.
  mecho _- Да, сейчас из него вояка совсем никакой.
  detach 5504 %self.id%
end
~
#5505
смерть лентяя~
0 f 100
~
if %world.curmobs(5503)% == 1
  mecho  Лентяй вдруг громко закричал:
  mecho  - Мужики, помогите, наших бьют!
  mecho В дом быстро вбежали непонятно откуда взявшиеся сердитые мужики и принялись БОЛЬНО Вас бить.
  mecho  Лентяй дал ключ сердитому мужику.
  mload mob 5504
  mload mob 5504
end
~
#5506
смерть мужика~
0 f 100
~
if %world.curmobs(5504)% == 1
  mload obj 5508
end
~
#5507
дали хозяину~
0 j 100
~
wait 1
switch %object.vnum%
  case 5051
    wait 1
    mpurge %object%
    %actor.setquest(5000)%
    emot взглянул на вас и принялся внимательно читать письмо.
    wait 1s
    say Спасибо, что принес весточку от родича. Давно я к ним не хаживал.
    взд
    mecho  - Тогда буду считать твою службу исполненной!
    say Что-то ноги отниматься стали. Знахарь наш какое-то зелье готовит, оно вроде и помогает...
    mecho _- Да только он сам признается - не будет в зелье силы без нужных добавок.
    mecho _- А найти их он не может, стар уже по лесам да полям бегать.
    wait 2
    say Вот что, родич пишет, что ты работу подрядился выполнить?
    mecho _- Значит и найди их. 
    mecho _- Принеси мне уши старой лисы, перепелиные перья, да сало барсучье.
    mecho _- Тогда буду считать твою службу исполненой!
  break
  *перья
  case 5414
    wait 1
    mpurge %object%
    say Хм... как раз та вещь, которую знахарь просил...
    if !%actor.quested(5000)%
      say Я тебе не поручал ее искать, но все равно благодарствую
      halt
    end
    %actor.setquest(5001)%
    if %actor.quested(5001)% && %actor.quested(5002)% && %actor.quested(5003)%
      set questor5501 %actor%
      global questor5501
      exec 5508 %self.id%
      halt
    end
    say ну что же, благодарствую... Но еще кой-чего не хватает - сходи поищи.
  break
  *уши
  case 4713
    wait 1
    mpurge %object%
    say Хм... как раз та вещь, которую знахарь просил...
    if !%actor.quested(5000)%
      say Я тебе не поручал ее искать, но все равно благодарствую
      halt
    end
    %actor.setquest(5002)%
    if %actor.quested(5001)% && %actor.quested(5002)% && %actor.quested(5003)%
      set questor5501 %actor%
      global questor5501
      exec 5508 %self.id%
      halt
    end
    say ну что же, благодарствую... Но еще кой-чего не хватает - сходи поищи.
  break
  *сало
  case 5517
    wait 1
    mpurge %object%
    say Хм... как раз та вещь, которую знахарь просил...
    if !%actor.quested(5000)%
      say Я тебе не поручал ее искать, но все равно благодарствую
      halt
    end
    %actor.setquest(5003)%
    if %actor.quested(5001)% && %actor.quested(5002)% && %actor.quested(5003)%
      set questor5501 %actor%
      global questor5501
      exec 5508 %self.id%
      halt
    end
    say ну что же, благодарствую... Но еще кой-чего не хватает - сходи поищи.
  break
  case 5508
    wait 1
    mpurge %object%
    calcuid vobj 5514 obj
    снять %vobj.name%
    *mpurge %vobj%
    wait 1s
    say Молодец! Наконец-то нашлась на них управа.
    say Надеюсь они не вернутся?
    mecho Хозяин глубокомысленно посмотрел на вашу одежду, всю в пятнах крови.
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
      case 5
        if %world.curobjs(200)% < 50
          mload obj 200
          дать рун %actor.name%
        else
          %self.gold(+300)%
          дать 300 кун %actor.name%
        end
      break
      default
        mload obj 16023
        дать чекушк %actor.name%
      break
    done
    say Это все, чем я смогу тебя отблагодарить, так что извини.
  break
  default
    eval getobject %object.name%
    drop %getobject.car%.%getobject.cdr%
  done
~
#5508
Хозяин дает письмо~
0 z 100
~
wait 1
say Вот, теперь знахарь сварит сильное зелье, авось скоро сам племяшку увижу!
mecho _- А пока на вот, отнеси им.
emot потянулся к сундуку и достал из него маленький клочок бересты
mload obj 5518
дать вест .%questor5501.name%
drop вест
~
$~
