#68400
клокотание на обочине~
2 e 35
~
wecho _В дальних кустах что-то громко заклокотало.
wecho _Послышался треск веток.
wecho _Но спустя пару секунд все резко притихло.
~
#68401
вырываем дерево~
1 c 4
вырвать~
if !%arg.contains(дерево)% 
  osend %actor.name% Чего ты хотите вырвать?
else
  if %actor.stradd% > 30 
    osend %actor% _Вы обоими руками вцепились в ствол дерева
    osend %actor% _В следующий момент Вы вырвали дерево с корнями
    osend %actor% _и бросили его в сторону.
    oechoaround %actor% _%iactor.name% схватил дерево обоими руками и с диким
    oechoaround %actor% _криком вырвал%actor.g% его прямо с корнями.
    wait 1s
    oecho _Вдруг земля, где раньше стояло дерево зашевелилась
    oecho _И через какое-то время из нее показалась голова змея!
    oload mob 68400 
    calcuid snike 68400 mob 
    exec 68409 %snike.id% 
    wait 1
    %purge% %self%
  else
    osend %actor.name% _Вы попытались вырвать дерево, но у вас не хватило на это сил.
    oechoaround %actor% _%actor.iname% попытал%actor.u% вырвать дерево
    oechoaround %actor% _но видно у %actor.rname% для этого слишком мало сил.
  end
end
~
#68402
убили земляного змея~
0 f 100
~
switch %random.10%
  case 1
    if %world.curobjs(68402)% < 3 
      msend %actor% _Изловчившись, вы вырвали чешуйку у умирающего змея.
      mechoaround %actor% _%actor.name% вырвал%actor.g% чешуйку умирающего змея.
      mload obj 68402
    end
  break
  case 2
    if %world.curobjs(68403)% < 3 
      msend %actor.name% Немного попотев, вы слатали из чешуи змея неплохую кирасу.
      mechoaround %actor.name% _Немного потрудившись %actor.name% сделал%actor.g%
      mechoaround %actor.name% _неплохую кирасу.
      mload obj 68403
    end
  break          
  case 3
    if %world.curobjs(68404)% < 3 
      msend %actor% _Хорошенько постаравшись, вы сделали шлем из чешуи змея.
      mechoaround %actor% _Долго ругаясь и плюясь смастерил%actor.g% шлем из чешуи.
      mload obj 68404
    end
  break
  case 4
    if %world.curobjs(68405)% < 3 
      msend %actor% _Вы начали усердно обрабатывать чешую змея и сделали ремень.
      mechoaround %actor% _%actor.name% сделал%actor.g% какую-то вещицу.
      mload obj 68405
    end
  break 
  default
    msend %actor.name% _Вы хотели обработать чешую змея, но у вас не чего не вышло.
    mechoaround %actor% _%actor.name% хотел обработать чешую мертвого змея
    mechoaround %actor% _но не смог%actor.q%.
  break
done
~
#68403
скрипят ступени в логове темных магов~
2 e 25
~
wsend %actor% _Ступеньки злобно поскрипывают под Вашими ногам.
wsend %actor% _И вот-вот рухнут под вашим весом.
wsend %actor% _Может Вам стоит в конце концов начинать худеть?
~
#68404
крики из-за двери в логове темных магов~
2 e 45
~
switch %random.3%
  case 1
    wecho _Из-за двери, расположенной в южной стене, разделись истошные крики.
  break
  case 2
    wecho _Злобное бормотание доносится из-за двери, расположенной в южной стене..
  break
  case 3
    wecho _Из-за двери раздался оглушающий хлопок сопровождаемый громким криком.
  break
done
~
#68405
пинаем старый сундук в логове темных магов~
2 c 100
пнуть~
*Пинаем сундук и получаем вещицу
if !%arg.contains(сундук)%
  wsend %actor% _Что вы хотите пнуть?
else    
  if %actor.skill(пнуть)% >79
    wsend %actor% _Мощным ударом ноги вы разнесли старый сундук в мелкие щепки.
    wechoaround %actor% _%actor.iname% мощным ударом ноги разнес%actor.q% 
    wechoaround %actor% _старый сундук на мелкие щепки.
    switch %random.10%
      case 1
        if %world.curobjs(68406)% = 0  
          wecho _Что-то звонко упало на каменный пол.
          wload obj 68406
        end
      break
      case 2
        if %world.curobjs(68407)% = 0  
          wecho _Что-то звонко упало на каменный пол.
          wload obj 68407
        end
      break 
    done 
    detach 68405 %self.id%
  else
    wsend %actor% _Вы разбежались и со всего маху пнули старый сундук.
    wsend %actor% _Но из-за недостатка опыта только повредили себе ногу.
    wechoaround %actor% _Хорошенько разбежавшись %actor.name% пинанул%actor.g% 
    wechoaround %actor% _старый сундук.
    wechoaround %actor% _Но из-за недостатка опыта в таких делах, с визгом
    wechoaround %actor% _отпрыгнул%actor.g% от него, повредив ногу.
    wdamage %actor% 100
  end
end
~
#68406
монах приветствует игрока~
0 r 100
~
wait 10
вздох
mecho _Монах:
mecho _- Привет тебе странник.
mecho _- Будь осторожнее, ты рискуешь своей жизнью ходя по этим местам.
mecho _- Промышляют здесь прислужники злых помыслов, темные маги злобные.
чих
wait 10
mecho _- Мой тебе совет, коли встретишь кого из них, беги!
mecho _- Они мастера своей темной магии!
mecho _- И могут одним взглядом превратить тебя в каменную глыбу или ходячий факел.
wait 1s
хмур
mecho _- Обычно, после того, как я про это говорил, все уходили скорым шагом.
mecho _- Вижу ты не из робкого десятка.
mecho _- Тогда я думаю, ты не откажешь мне в небольшой просьбе.
вопрос %actor.name%
attach 68407 %self%
~
#68407
монах дает квест игроку~
0 d 0
да продолжай хорошо помогу~
detach 68406 %self.id%
set quest_monk %actor%
global quest_monk
wait 10
mecho _Монах:
mecho _- Вот и хорошо.
mecho _- Тогда слушай, что тебе предстоит сделать.
wait 10
mecho _- Как я сказал ранее, обжили эти места темные маги.
mecho _- На люд нападают, скот уводят да в жертвы его приносят.
mecho _- Мне поручили с ними разобраться.
mecho _- Но не справился я с ними.
mecho _- Бежал я от них, не смог справиться с их напором.
wait 10
mecho _- Вход в их логово находится чуть западнее. 
mecho _- В зарослях ты найдешь решетку. За ней, они и обжились.
wait 10
mecho _- Помоги, изничтожь злыдней.
detach 68407 %self.id%
end
~
#68408
монах принимает квест~
0 r 100
~
wait 10
if (%quest_monk.id% == %actor.id%)
  if !%exist.mob(68403)%
    if !%exist.mob(68402)%
      if !%exist.mob(68401)%
        wait 10
        mecho _Монах:
        mecho _- Вот молодец!
        mecho _- Добрые люди уже рассказал, как ты этих злодеев порубал%actor.g%!
        mecho _- Прими от меня в награду это скромное вознаграждение.
        switch %random.10%
          case 1
            if %world.curobjs(68416)% < 2 
              mload obj 68416 
              дать монаш %actor.name%
            end
          break
          case 2
            if %world.curobjs(68417)% < 2 
              mload obj 68417
              дать монаш %actor.name%
            end
          break
          case 3
            if %world.curobjs(68418)% < 2 
              mload obj 68418
              дать монаш %actor.name%
            end
          break
          default
            mload obj 68419
            дать мешоч %actor.name%
          break
        done 
        detach 68408 %self.id%
      else
        wait 10
        mecho _- Как ты уже расправил%actor.u% с нехристями этими?
        mecho _- Говорят, что они все еще творят свои богопротивные деяния!
      end
    end
  end
end
~
#68409
змей ругается на игрока~
0 z 100
~
wait 10
mload obj 68478
mecho _Змей:
mecho _- Рррррр!
mecho _- Ну чех-х-хо ты творишш-ш!
mecho _- По ш-ш-то мой дом руш-ш-ш-иш?!
mecho _- Наказать тебя думаю следует за глупость!
mecho _- Человечиш-ш-ш-ш-ка!
убить %random.pc%
~
#68410
убили старого песчаного змея~
0 f 100
~
switch %random.5%
  case 3
    if %world.curobjs(68420)% < 3 
      mload obj 68420
    end
  break
  case 4
    if %world.curobjs(68421)% < 3
      mload obj 68421
    end
  break
done
~
#68411
толстый страж башни говорит~
0 r 100
~
msend %actor% - Стой!
msend %actor% - Ты не можешь пройти на башню.
msend %actor% - Оттуда наблюдают за активностью змеев.
msend %actor% - Если они отвлекутся, то могут просмотреть нападение!
~
#68412
убили старшего темного мага~
0 f 100
~
mechoaround %actor%  Старший темный маг издал истошный вопль и помер.
mechoaround %actor%  Удар %actor.rname% оказался для него смертельным.
calcuid mag 68448 room
detach 68404 %mag.id%
~
#68413
побирушка приветствует игрока~
0 r 100
~
if (%quest_beggar.name% == %nil%) && (%exist.mob(68429)%)
  wait 10
  кашлять
  mecho _Побирушка:
  mecho _- Привет тебе путник.
  mecho _- Ты наверно недавно в этом злополучном лагере?
  mecho _- Да. Да. Раньше я тебя здесь не видел.
  wait 10
  хмур
  mecho _- Вижу, что ты сюда не жить приш%actor.y%.
  mecho _- Тогда, не согласишься ли ты помочь мне?
  вопрос %actor.name%
end
~
#68414
побирушка дает квест~
0 d 0
да помогу хорошо продолжай~
if (%quest_beggar.name% == %nil%) && (%exist.mob(68429)%)
  wait 10
  set quest_beggar %actor%
  global quest_beggar
  detach 68413 %self.id%
  mecho _Побирушка:
  mecho _- Здорово!
  mecho _- Так вот слушай.
  mecho _- Недавно, когда я шел сюда, в лагерь, на меня напал странный тип.
  mecho _- И сказал, что если я не заплачу ему 500 кун, то он просто убьет меня.
  mecho _- Мне удалось убежать от него.
  дрожать
  wait 10
  mecho _- Вчера, я попытался пройти до главы лагеря, но издали заметил этого человека
  mecho _- И снова убежал.
  wait 10
  mecho _- Как я понимаю, он один из жителей города.
  wait 10
  mecho _- Потом я решил узнать где он живет и заметил, что он постоянно
  mecho _- Отирается у входа в яму, где хранят овощи.
  mecho _- Возможно ты найдешь его там.
  wait 10
  mecho _- Думаю, если ты убьешь его, то сделаешь большую услугу всему лагерю. 
  detach 68414 %self.id%
end
~
#68415
побирушка принимает квест~
0 q 100
~
if (!%exist.mob(68429)%) && (%quest_beggar.iname% == %actor.iname%) 
  wait 10
  mecho _Побирушка:
  mecho _- Молодец!
  mecho _- Слухи о убийстве того злодея разнеслись по лагерю почти мгновенно!
  mecho _- Хорошая работа.
  wait 10
  switch %random.10%
    * Даем колечко
    case 1
      if %world.curobjs(68428)% < 3
        mecho _- Думаю, ты заслужил%actor.g% небольшую награду.
        mecho _- Вот, держи. Это все, что у меня есть.
        mload obj 68428
        дать бронз %actor.name%
      end
    break 
    * Даем браслет
    case 2
      if %world.curobjs(68429)% < 3
        mecho _- Думаю, ты заслужил%actor.g% небольшую награду.
        mecho _- Вот, держи. Это все, что у меня есть.
        mload obj 68429
        дать бронз %actor.name%
      end
    break
    * Даем иглу
    case 3
      if %world.curobjs(68430)% < 3
        mecho _- Думаю, ты заслужил%actor.g% небольшую награду.
        mecho _- Вот, держи. Это все, что у меня есть.
        mload obj 68430
        дать игла %actor.name%
      end
    break
    * Даем самоцвет
    default
      mecho _- Думаю, ты заслужил%actor.g% небольшой награду.
      mecho _- Вот, держи. Это все, что у меня есть.
      mload obj 68431
      дать самоцвет %actor.name%
    break 
  done 
  detach 68415 %self.id%
end
~
#68416
лезем в нору под пнем~
1 c 100
лезть~
if !%arg.contains(нора)%
  osend %actor.name% Куда лезем то?
else 
  wait 15
  osend %actor% Пыхтя как раненый зверь Вы полезли в узкую нору!
  osend %actor% Когда Вы залезли почти по пояс, прямо перед
  osend %actor% Вашим носом что-то неожиданно захрипело, застонало и
  osend %actor% БОЛЬНО укусило за ухо!
  osend %actor% От такой боли Вы мгновенно вылетели из норы.
  odamage %actor% 100
  oechoaround %actor% _Не долго думая %actor.iname% нырнул%actor.g% под пень.
  oechoaround %actor% _Через пару секунд из норы, что находится под пнем
  oechoaround %actor% _послышались странные звуки: не то урчание, но рычание!
  oechoaround %actor% _После чего %actor.iname% взвыл%actor.g% нечеловеческим
  oechoaround %actor% _голосом и с визгом вылетел%actor.g% из норы!
  oechoaround %actor% _Прямо за ним вылезло какое-то взъерошенное животное! 
  oload mob 68439 
  detach 68416 %self.id%
end
~
#68417
вылез белый земляной змей~
0 n 100
~
wait 10 
mecho _Белый змей:
mecho _- Чево ты лезеш-ш-шь в мой дом?
mecho _- Больш-ш-ше жить негде?
mecho _- Иди сам копай себе нору!
~
#68418
убили синего озерного змея~
0 f 50
~
msend %actor% Вы умело сняли шкуру с трупа синего озерного змея.  
mechoaround %actor% %actor.iname% умело снял%actor.g% шкуру с трупа змея.
mload obj 68437
~
#68419
охотник приветствует~
0 r 100
~
wait 10
msend %actor% Охотник поклонился перед вами.
msend %actor% -Привет тебе %actor.iname%.
msend %actor% -Я с детства охочусь в здешних лесах и знаю как обрабатывать шкуры
msend %actor% -Если ты принесешь мне одну такую, я с радостью ее займусь.
~
#68420
охотник делает вещи из шкур~
0 j 100
~
if %object.vnum% == 68437
  wait 1
  mpurge %object%
  msend %actor% - Какая хорошая шкура.
  msend %actor% - Я попробую что-нибудь сделать, но ни чего не обещаю.
  msend %actor% - Могу и поломать.
  mecho _Охотник принялся обрабатывать шкуру.
  wait 2s
  switch %random.9%
    case 1
      if %world.curobjs(68438)% < 3 
        msend %actor% - Вот, гляди что я тебе сделал! 
        mload obj 68438
        дать змеин %actor.iname%
      end
    break  
    case 2
      if %world.curobjs(68439)% < 3 
        msend %actor% - Вот, гляди что я тебе сделал! 
        mload obj 68439
        дать змеин %actor.iname%
      end
    break          
    case 3
      if %world.curobjs(68440)% < 3 
        msend %actor% - Вот, гляди что я тебе сделал! 
        mload obj 68440
        дать змеин %actor.iname%
      end
    break
    default
      плюнуть
      msend %actor% - Извини, я не смог ни чего сделать.
      msend %actor% - Только шкуру испортил.
      плакать %actor.iname%
    break
  done
  halt
end  
msend %actor% - На что мне это нужно?
msend %actor% - Я с этим не работаю.
дать %object.iname% %actor.iname%
~
#68421
раненый дружинник говорит о беде~
0 r 100
~
wait 15
кашлять %actor.iname% 
mecho _Дружинник:
mecho _- Здравствуй путник.
mecho _- Будь осторожней, ходя по окрестностям лагеря.
mecho _- Там обитают ужасные змеи.
mecho _- Недавно я пошел туда с моим оруженосцем!
wait 10
mecho _- Бедный мальчуган!
mecho _- Его загрызли еще до того, как я успел взять у него оружие!
mecho _- Если ты забредешь туда и останешься жив, поищи там мой меч.
mecho _- Мой отец лишит меня наследства, если узнает, что я его потерял!
~
#68422
раненый дружинник принимает меч~
0 j 100
~
if %object.vnum% == 68432
  wait 15 
  mecho _Дружинник:
  mecho _- Вот спасибо тебе.
  mecho _- Ты заслужил%actor.g% небольшую награду.
  switch %random.8%
    case 1
      if %world.curobjs(68434)% < 3 
        mecho _Раненый дружинник снял свои сапоги.
        mload obj 68434
        дать сапоги %actor.iname%  
      end
    break                      
    case 2
      if %world.curobjs(68433)% < 3 
        mecho _Дружинник снял свои шлем с крылами.
        mload obj 68433
        дать шлем %actor.iname%
      end
    break
    default
      mecho _Дружинник взял небольшую кучку кун из своего кошеля.
      mload obj 68435
      дать кучк %actor.iname%
    break
  done 
  detach 68421 %self.id%
  detach 68422 %self.id%
else
  wait 10 
  case 1
    mecho _Дружинник:
    mecho _- Хм. Это не мое.
    mecho _- Мне не нужны чужие вещи, оставь себе.
    дать %object.iname% %actor.iname%
  end
~
#68423
глава лагеря приветствует~
0 r 100
~
wait 15
mecho _Глава лагеря:
mecho _- Привет тебе %actor.iname%!
mecho _- Давно ни кто к нем не заходил.
mecho _- А кто и заходил, то на долго не задерживался.
mecho _- Беда у нас тут большая.
wait 20
mecho _- Ведомые нечистой силой змеи начали подступать к лагерю.
mecho _- Думаю, что пожрут нас скоро.
mecho _- Ни кого здесь не останется.
wait 15
mecho _- Может ты сможешь помочь нам?
~
#68424
глава лагеря дает квест~
0 d 0
да помогу хорошо продолжай~
wait 15
detach 68423 %self.id% 
set quester %actor%
global quester
mecho _Глава лагеря:
mecho _- Ты ведь жаждешь приключений!
mecho _- Я вижу это в твоих глазах.
wait 15
mecho _- Как я уже говорил ранее, лагерь обступили орды змеев.
mecho _- Никогда они еще не подходили так близко.
mecho _- Они всегда жили сами по себе.
mecho  - Ну утащат пару коров да свиней, да и черт с ними!
mecho _- Но на людей они еще ни когда не нападали.
wait 15
mecho _- Но сейчас! Они просто людоедами стали!
mecho _- Они же, изверги, так все население пожрут!
mecho _- Твари ненасытные.
рычать
mecho _- Разберись с ними и тем, кто ведет их.
mecho _- И наша благодарность не заставит себя ждать.
detach 68424 %self.id%
~
#68425
глава принимает квест и перевоплощается~
0 r 100
~
wait 10
if (%quester.id% == %actor.id%)
  if !%exist.mob(68435)% && !%exist.mob(68436)% && !%exist.mob(68437)% && !%exist.mob(68438)%
    mecho Глава лагеря:
    mecho - Да уж наслышан о твоих подвигах!
    mecho - Как ты этих гадов порубал!
    хохотать
    mecho - Теперь у нас все будет хорошо!
    дум
    mecho Вдруг глава лагеря резко оборвал свою речь и искривился в гримасе боли!
    wait 2s
    mecho Через несколько секунд он упал на пол и дико завопил!
    mecho Из его спины полезли огромные клыки и буквально через секунду
    mecho Пред вами возникло странное существо темного цвета!
    mload mob 68434
    wait 1
    mpurge %self%
  end
end
~
#68426
верховный дух говорит~
0 n 100
~
wait 10
if (%exist.mob(68433)%)
  calcuid glava 68433 mob
  mpurge %glava%
end
mecho _Верховный дух:
mecho _- Ты все же сильнее чем я предполагал! 
mecho _- Ты настойчиво не хочешь умирать.
mecho _- Но я думаю я исправлю эту ошибку!
wait 15
mecho _- Верховный дух издал оглушающий клич!
mecho _На мгновение все покрылось темной дымкой.
mecho _Когда же она рассеялась, пред Вами оказалось два странных существа.
wait 10
mecho _- Убейте его! Убейте всех, кого встретите, мои тени!
mload mob 68418
mload mob 68418 
wait 5
груп все
mecho _Дух что-то пошептал и разгневано зыркнул на теней!
*mecho _Теней окутала сверкающая пелена!
foreach smob %self.npc%
  if (%smob.vnum% == 68418)
    dg_cast 'зерк маги' %smob%
  end
done
dg_cast 'зерк маги'
~
#68427
тени говорят~
0 n 100
~
следов дух 
mecho _Тень прошипела: Да хозяин! Я уничтожу всех, кого встречу!
~
#68428
странствующий маг приветствует~
0 r 100
~
wait 5
msend %actor% - Привет странник.
msend %actor% - Я Алексий - странствующий маг.
msend %actor% - Я хожу по лесам и болотам и изучаю свойства разных
msend %actor% - Магических ингредиентов.
msend %actor% - Если ты найдешь несколько
msend %actor% - То я смогу сварить тебе несколько полезных отваров.
~
#68429
странствующий маг варит отвары~
0 j 100
~
wait 1
if ((%object.vnum& >= 700) && (%object.vnum& <= 799))
  wait 1
  mpurge %object%
end
switch %object.vnum%
  case 700
    mecho _Вот держи. Этот отвар не даст тебе умереть от жажды и голода!
    mload obj 68450
    дать отвар %actor.iname%
  break  
  
  case 701
    mecho _Вот держи. Этот отвар затуманит твои очертания.!
    mload obj 68447
    дать отвар %actor.iname%
  break 
  
  case 705
    mecho _Вот держи. Этот отвар не даст тебе умереть от жажды и голода!
    mload obj 68450
    дать отвар %actor.iname%
  break 
  
  case 751
    mecho _Вот держи. Этот отвар вылечит тебя от молчания!
    mload obj 68448
    дать отвар %actor.iname%
  break 
  
  case 752
    mecho _Вот держи. Этот отвар вылечит тебя, если ты ослепнешь.
    mload obj 68449
    дать отвар %actor.iname%
  break 
  
  case 754
    mecho _Вот держи. Этот отвар освятит тебя.
    mload obj 68451
    дать отвар %actor.iname%
  break  
  
  case 755
    mecho _Вот держи. Этот отвар позволит тебе летать!
    mload obj 68452
    дать отвар %actor.iname%
  break  
  
  case 756
    mecho _Вот держи. Этот отвар защитит тебя в трудную минуту.
    mload obj 68453
    дать отвар %actor.iname%
  break   
  
  case 757
    mecho _Вот держи. Этот отвар позволит тебе исчезать из поля зрения врага!
    mload obj 68454
    дать отвар %actor.iname%
  break            
  
  case 758
    mecho _Вот держи. Этот отвар придаст тебе невиданную скорость.
    mload obj 68455
    дать отвар %actor.iname%
  break  
  
  case 721
    mecho _Вот держи. Этот отвар снимет с тебя нехорошую магию!
    mload obj 68456
    дать отвар %actor.iname%
  break 
  
  case 722
    mecho _Вот держи. Этот отвар вылечит тебя, если ты ослепнешь.
    mload obj 68449
    дать отвар %actor.iname%
  break   
  
  case 724
    mecho _Вот держи. Этот отвар вылечит тебя от молчания!
    mload obj 68448
    дать отвар %actor.iname%
  break 
done
drop all
~
#68430
ломаем жертвенный стол~
1 c 100
вставить~
if (!%arg.contains(нож)%) && (!%arg.contains(стол)%) 
  osend %actor% _Что и куда вы хотите вонзить? 
  halt
end
eval weapon %actor.eq(16)%
if !(%weapon.vnum% == 68444) 
  osend %actor% Вы не можете вонзить это туда!
else
  wait 10
  osend %actor% _Вы с силой вставили жертвенный нож в прорезь на жертвенном столе!
  oechoaround %actor% _%actor.iname% с силой вставил%actor.g% нож в прорезь стола.
  osend %actor% _В ту же секунду стол разломился надвое.
  switch %random.10%
    case 1
      if %world.curobjs(68445)% < 2
        oecho _Из тайника, что был внутри стола, что-то звонко выпало.
        oload obj 68445
      end
    break
    case 2
      if %world.curobjs(68446)% < 2 
        oecho _Из тайника, что был внутри стола, что-то звонко выпало.
        oload obj 68446
      end
    break
  done          
  oload obj 68443
end
~
#68431
умирает верховный дух~
0 f 100
~
msend %actor% _Сильнейшей атакой вы разнесли верховного духа в мелкую пыль!
mechoaround %actor% _%actor.iname% мощной атакой уничтожил верховного духа!
switch %random.8%
  case 1
    if %world.curobjs(68470)% < 2 
      mload obj 68470
    end
  break 
  if %world.curobjs(68471)% < 2 
    mload obj 68471
  end 
  case 3
    if %world.curobjs(68472)% < 2 
      mload obj 68472
    end
  break 
  case 4
    if %world.curobjs(68473)% < 2 
      mload obj 68473
    end
  break 
  case 5
    if %world.curobjs(68474)% < 2 
      mload obj 68474
    end
  break 
  case 6
    if %world.curobjs(68475)% < 2 
      mload obj 68475
    end
  break 
  case 7
    if %world.curobjs(68476% < 2 
      mload obj 68476
    end
  break 
  case 8
    if %world.curobjs(68477% < 2 
      mload obj 68477
    end
  break
done
~
#68432
умирает кровавая тень~
0 f 100
~
mecho _Перед смертью тень прошептала: "Я подвела тебя хозяин... жаль."
~
#68433
заходим к жадному купцу~
0 r 100
~
wait 10
mecho _Жадный купец:
mecho _- А! Искатель приключений!
mecho _- Это хорошо.
mecho _- Я Марек - купец с южных окраин.
mecho _- Я здесь скупаю все, что можно втридорога продать на юге.
mecho _- Ну ладно, тебе этого не понять!
mecho _- Самый лакомый товар - это зубы серых подкаменных змеев!
mecho _- Если ты добудешь пару, принеси мне и я у тебя их куплю.
mecho _- Ну как, договорились?
~
#68434
жадный купец предлагает сделку~
0 d 0
да хорошо~
detach 68433 %self.id%
set merc_get 1
global merc_get
wait 10 
mecho _Жадный купец: 
mecho _- Отлично. Они водятся здесь, у лагеря.
mecho _- На северо-западе.
mecho _- Но будь осторожен, они очень сильные противники 
mecho _- Смогут запросто растерзать тебя на мелкие клочки.
detach 68434 %self.id%
~
#68435
жадный купец принимает зубы~
0 j 100
~
wait 5
if %object.vnum% == 68457  
  mpurge %object%
  mecho _Жадный купец:
  mecho _- О-о-о да!
  mecho _- Какая прекрасная вещица!
  mecho _- За нее я тебе дам... мммм.
  mecho _- Думаю 1000 кун справедливая цена.
  wait 1s
  msend %actor% _Купец развязал свой кошель и дал Вам 1000 кун.
  mechoaround %actor% _Купец развязал свой кошель и дал %actor.dname% кучку кун.
  %actor.golg(+1000)%
else
  mecho _Жадный купец:
  mecho _- На кой черт мне эта дрянь?
  mecho _- Ее даже продать выгодно негде!
  mecho _- Забирай ее обратно.
  дать %object.iname% %actor.iname%
end
~
#68436
умирает подкаменный змей~
0 f 50
~
if %merc_get% == 1
  msend %actor% _Мощным ударом Вы выбили у змея передний зуб.
  mechoaround %actor% _Мощным ударом %actor.iname% выбил%actor.g% у змея передний зуб.
end
~
#68437
репоп~
2 f 100
~
*Репопим квест на монахе
calcuid fromid 68404 mob
attach 68406 %fromid.id%
attach 68406 %fromid.id%
attach 68406 %fromid.id%  
*Репопим квест на побирушке
calcuid fromid 68420 mob
attach 68413 %fromid.id%
attach 68414 %fromid.id%
attach 68415 %fromid.id%
*Репопим квест на главе лагеря 
calcuid fromid 68433 mob
attach 68423 %fromid.id%
attach 68424 %fromid.id%
attach 68425 %fromid.id%
*Репопим триггеры на жадном купце
calcuid fromid 68428 mob
attach 68433 %fromid.id%
attach 68434 %fromid.id%
attach 68435 %fromid.id%       
*Репопил триггеры на раненом дружиннике
calcuid fromid 68427 mob
attach 68421 %fromid.id%
attach 68422 %fromid.id% 
*Репопим крики в логове оккультистов
calcuid fromid 68448 room
attach 68404 %fromid.id% 
*Репопим триггеры на распинывание сундука в логове оккультистов
calcuid fromid 68447 room
attach 68405 %fromid.id% 
*Репопим триггеры на пень (белый земляной змей)
calcuid fromid 68436 obj
attach 68416 %fromid.id%  
~
#68438
удаляем жертвенный стол~
1 n 100
~
wait 5
if (%exist.obj(68442)%)
  calcuid stol 68442 obj
  opurge %stol%
end
~
#68439
удаляем сухое дерево при загрузке вырванного~
1 n 100
~
wait 5
if (%exist.obj(68401)%)
  calcuid tree 68401 obj
  opurge %tree%
end
~
#68440
убили белого земляного цвета~
0 f 100
~
msend %actor% _После Вашего мощнейшего удара, жизнь покинула змея!
mechoaround %actor% _После удара %actor.rname% змей мгновенно умер!
switch %random.5%
  case 1
    if %world.curobjs(68479)% < 5 
      mload obj 68479
    end
  break
  case 2
    if %world.curobjs(68480)% < 5 
      mload obj 68480
    end
  break
  default
    if %world.curobjs(68435)% < 10 
      mload obj 68435
    end
  break
done
~
$~
