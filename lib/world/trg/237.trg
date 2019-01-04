#23700
Создаем ишака~
1 c 2
гладить~
wait 1
if !%arg.contains(лошадку)%
  osend  %actor% Что Вы хотите погладить?
  halt
end
osend %actor% Вы ласково погладили лошадку по гриве
if %actor.clan% != нво
  halt
end
if %world.curmobs(23716)% > 50
  osend %actor% ...и ничего не произошло!
  halt
end
oechoaround %actor% %actor.name% ласково погладил%actor.g% лошадку по гриве.
wait 1s
oload mob 23716
oecho Непонятно откуда вдруг вместо лошадки оказался Дряхлый ишак.
oforce %actor% оседлать ишак
wait 1
opurge %self% 
~
#23701
Убираем ишака~
0 c 1
топнуть~
if (%actor% != %self.leader%)
  msend %actor% Это не Ваш скакун.
  halt
end
if (%actor.clan% != нво) 
  mechoaround %actor% %actor.name% попытал%actor.u% топнуть, но нога так и застыла в воздухе.
  msend %actor% Вы попытались топнуть, но Ваша нога так и застыла в воздухе.
  halt
end
mechoaround %actor% %actor.name% громко топнул%actor.g%.
msend %actor% Вы громко топнули ногой о земь. 
mload obj 23701
дать лошад .%actor.name%
mecho Дряхлый ишак испарился на Ваших глазах.
wait 1
mpurge %self%
~
#23702
спуск в погреб~
2 c 100
спуститься~
if !(%arg.contains(погреб)%) 
  wsend %actor% Куда это Вы хотите спуститься?
  halt
end
wsend %actor% Вы спустились по лестнице в погреб.
wechoaround %actor% %actor.name% спустил%actor.u% в погреб.
wteleport %actor% 23758
wechoaround %actor% Кто-то спустился в погреб.
end
~
#23703
клан шмот подобрали~
1 g 100
~
if (%actor.clan% == нво) 
  halt
end
osend %actor% %self.name% рассыпал%self.u% в ваших руках.
wait 1
opurge %self%
~
#23704
непрошенный гость~
0 q 100
~
if %actor.clan% == нво
  halt
end
крич &BГость &R%actor.name%&n &Bк нашему Князю пожаловал%actor.g%.&n
~
#23705
выдача кланового стафа~
0 c 1
закупка~
wait 1
if %actor.vnum% != -1
  halt
elseif %actor.clan% == нво
  say Гой еси, уважаем%actor.w%!
  wait 1
  if %actor.bank% < 1550
    дум
    say Э, да у тебя денег то совсем нету!
    halt
  end
  eval buffer %actor.bank(-1550)%
  mload obj 23701
  mload obj 23708
  mload obj 23713
  mload obj 23714
  mload obj 23715
  mload obj 23716
  mload obj 23717
  mload obj 23718
  mload obj 23718
  mload obj 23719
  mload obj 23719
  mload obj 23720
  mload obj 23721
  mload obj 23722
  mload obj 23723
  mload obj 23725
  mload obj 23725
  mload obj 23731
  mload obj 23738
  mload obj 144
  mload obj 141
  mload obj 139
  mload obj 139
  mload obj 139
  полож все баул
  say Вот твое хозяйство. Получите и распишитесь!
  give all .%actor.name%
  drop all
  wait 1
  say Оружие сам%actor.g% себе купи, какое пожелаешь.
else 
  say А ну ка геть отсюда, ишь чего удумал%actor.g%!
  say Не положено тебе носить доспехов Княжеских!
  msend %actor%  %self.name% достал из-под прилавка поганую метлу и стукнул Вас по голове.
  mecho %self.name% достал из-под прилавка поганую метлу и стукнул %actor.rname% по голове.
end
~
#23706
создаем медаль~
0 c 0
медаль~
if %actor.vnum% != -1
  halt
elseif %actor.clan% == нво
  say Ща-Ща, пагади дарагой. Ух, шайтан!
  wait 1
  if %actor.clanrank% < 8
    дум
    say Мал%actor.g% ты еще медали казенные разбазаривать!
    halt
  end
  if (%world.curobjs(23724)% > 50)
    say Нету медалек то.. кончились.
    halt
  end
  mload obj 23724
  give all .%actor.name%
  drop all
else
  msend %actor% Не положено тебе носить медалей Княжеских!
end
~
#23707
осмотр территории~
2 c 0
взглянуть~
if (%arg% == вниз)
  %send% %actor% Вы взглянули вниз.
  calcuid rom 23701 room
end
if (%arg% == вперед)
  %send% %actor% Вы взглянули вперед.
  calcuid rom 23700 room
end
if (%arg% == вдаль)
  %send% %actor% Вы взглянули вдаль
  calcuid rom 63189 room
end
end
foreach target %rom.all%
  wsend %actor% Вдали от замка вы увидели %target.vname%.
done
~
#23708
выход из замка~
2 c 0
отпереть~
wait 1
if !%arg.contains(замок)%
  return 0
  halt
end
wait 1
wsend %actor% Ржавая решетка противно заскрипела, пропуская вас дальше.
wteleport %actor% 60085
wechoaround %actor% %actor.name% хрустя ветками и ругаясь выбрал%actor.u% из кустов.
~
#23709
тригер худосочной~
0 b 3
~
wait 1
switch %random.8%
  case 1
    mecho  эмо неприветливо взглянула на вас.
    mecho  Худосочная девица буркнула: 'Заказывать будем, нет?'
  break
  case 2
    mecho  Худосочная девица вздохнула и принялась вытирать столик.
  break
  case 3
    mechoaround Худосочная девица хихикнула, чуть повела плечиком и игриво посмотрела на %random.pc%
  break
  case 4
    крич Что это ты, %random.pc%, крошки по полу раскидал? А ну убирай за собой, ирод!
    mload obj 23760
    mload obj 23761
    дать obj 23760 %actor.name%
    дать obj 23761 %actor.name%
  break
  case 5
    mecho  Худосочная девица взглянула на вас и густо покраснела : 'Какой хорошенький!'
  break
  case 6
    mecho  Худосочная девица наклонилась к вам поближе и заговорщицки улыбнулась.
    say Пельмешки сегодня брать не рекомендую.
    миг %actor.name%
    case 7
      примост %random.pc%
    break
  done
end
wait 4s
~
#23710
тригер игральных костей~
1 h 100
~
wait 1
if ((%actor.realroom% != 23739) || ((%actor.vnum% != -1) && (%actor.vnum% != 23705)))
  halt
end
if (%actor.vnum% != 23705) 
  if !%gamerresult%
    eval result1 %random.6%
    eval result2 %random.6%
    eval gamerresult %result1%+%result2%
    global gamerresult
    oecho Выпало %result1% и %result2%.
  end
  calcuid gipsy 23705 mob
  exec 23732 %gipsy.id%
end
if (%actor.vnum% == 23705) 
  eval result1 %random.6%
  eval result2 %random.6%
  eval gipsyresult %result1%+%result2% 
  oecho Выпало %result1% и %result2%.
end
if (!%gamerresult% || !%gipsyresult%)
  halt
end
if (%gamerresult% > %gipsyresult%)
  oecho "Бля, я проиграл" - огорченно покосился на вас Ромес.
  oecho Ромес дал Вам %game% кун.  
  eval buffer %gamer.bank(+%game%)%
elseif (%gamerresult% < %gipsyresult%)
  eval buffer %gamer.bank(-%game%)%
  oecho "Я выиграл!" - радостно завопил Ромес.
  oecho Цыган ловко вытащил из Вашего кармана %game% кун.
else
  oecho "Так-так, ничья!" - константировал Ромес.
end
oecho Ромес взял игральные кости.
calcuid gipsy 23705 mob
if (%random.1000% >  100)
  oecho Ромес сказал: "Еще сыграем?"
  attach 23730 %gipsy.id%
else
  oecho Ромес повертел кости в руках и спрятал их
  oecho Ромес проворчал: " Так, все, топай отсюда".
  exec 23735 %gipsy.id%
end
opurge %self%
~
#23711
приветствие Ромеса~
0 q 100
~
wait 1
if (%world.curobjs(23758)% > 0)
  хмур
  say Ходят тут, дрочеры... А потом вещи пропадают!
  say Кто кости мои спер, а?! Любимые! От дедушки достались!! (В сторону) Шулера, правда...
  взд
  halt
end
say Привет, фраерок!
if ((%actor.uniq% == %oldgamer1%) || (%actor.uniq% == %oldgamer2%) || (%actor.uniq% == %oldgamer3%) || (%actor.uniq% == %oldgamer4%) || %actor.uniq% == %oldgamer5%))
  halt
end
эмо с интересом оглядел вас с ног до головы.
say Картишки-хуишки, косточки-хуесточки?
смея
wait 1
say Ну что, сыграем?
attach 23730 %self.id%
~
#23712
укрыться на дубе~
2 c 0
взобраться~
if !%arg.contains(на дерево)%
  return 0
  halt
end
wait 1
wsend %actor% Ловко вскарабкавшись по мощным веткам, вы оказались наверху.
wteleport %actor% 23780
wechoaround %actor% %actor.name% забрал%actor.u% сюда хрустя ветками и ругаясь.
log &k*>->-> %actor.name%&n
~
#23714
Тригер двойника~
0 p 100
~
wait 3
хмур
wait 2
say На кого руку поднял, пёс шелудивый!
wait 1s
пощеч .%actor.name%
~
#23715
триггер охранника казны~
0 b 4
~
wait 1
switch %random.8%
  case 1
    mecho  Охранник княжеской казны покосился на вас и откашлялся.
  break
  case 2
    mecho  Охранник княжеской казны внимательно осмотрел вас с ног до головы.
    mecho  Охранник еле слышно пробормотал : 'Ходят тут всякие...'
  break
  case 3
    mecho  Охранник княжеской казны вдруг уронил секиру и виновато покосился на вас.
  break
done
end
wait 4s
~
#23716
тригер  ведуньи~
0 b 3
~
wait 1
switch %random.6%
  case 1
    mecho  Ведунья задумчиво посмотрела на вас и улыбнулась.
  break
  case 2
    mecho  Ведунья внимательно оглядела вас и усмехнулась.
    mecho  Ведунья сказала : 'Вижу я, тебе зелье приворотное не помешает'
    mecho  Ведунья сказала : 'Приходи в полночь, приготовлю, друг мой'
  break
  case 3
    mecho  Мудрая ведунья поправила пару свитков на столе.
  break
done
end
wait 4s
~
#23717
триггер травника~
0 b 2
~
wait 1
switch %random.6%
  case 1
    mecho  Травник, поглощенный изучением глаза, недовольно заворчал.
  break
  case 2
    mecho  Травник с трудом оторвался от созерцания какой то пакости на столе и уставился на вас.
    mecho  Цао Сюэ-цинь вскричал : 'Уходите, уходите, из без зуба желтого крокодила не возвращайтесь!'
    mecho  Травник Цао Сюэ-цинь замахал вас руками.
  break
  case 3
    mecho  Травник Цао Сюэ-цинь задумчиво потыкал в глазик на плошке деревянной палочкой.
  break
  case 4
    mecho  Травник Цао Сюэ-цинь рассеяно сложил из несколько травинок неприличное слово и захихикал.
  break 
  case 5
    mecho  Травник Цао Сюэ-цинь разложил на столе когти неведомых зверушек и погрузился в раздумья.
  break 
  case 6
    mecho  Травник Цао Сюэ-цинь просветлел и кинул в колбу с зельем чью-то грязную кость.
    mecho  Травник Цао Сюэ-цинь выжидающе уставился на колбу.
  break
  case 7
    mecho  Травник Цао Сюэ-цинь уставился вам на плечо и вдруг бросился к вам.
    mecho  Травник Цао Сюэ-цинь радостно воскликнул : 'О, мелкая тварь! Как раз для отвара не хватает!'
  break
done
end
wait 4s
~
#23718
тригер ухода от цыгана~
2 g 100
~
if  (%direction% ==  west )
  return 0
  wsend %actor% Ромес преградил вам путь. 
  wsend %actor% Ромес сказал: "Э, нет, чувак! Давай-ка сперва игру закончим!"
end
~
#23719
триггер котенка~
0 c 1
погладить играть~
if ((%cmd% == погладить) && !%arg.contains(котенка)%)
  return 0
  halt
end
if ((%cmd% == играть) && !%arg.contains(с котенком)%)
  return 0
  halt
end
wait 1
if (%cmd% == погладить)
  mechoaround %actor% %actor.name% ласково погладил%actor.g% котенка.
  msend %actor% вы погладили котенка по шелковистой шерстке.
  wait 1s
  switch %random.5%
    case 1
      msend %actor% Котенок довольно замурчал и потерлся мордочкой о вашу руку.
      mechoaround %actor% Котенок довольно замурчал и потерлся мордочкой о руку %actor.rname%.
    break
    case 2
      mecho Котенок зажмурился от удовольствия, подставляя пушистую грудку под пальцы.
    break
    case 3
      msend %actor% Котенок завалился на ковер и принялся ловить вашу руку мягкими лапами.
      mechoaround %actor% Котенок завалился на ковер и принялся ловить руку %actor.rname% лапами.
    break
    case 4
      msend %actor% Котенок ласково потерся боком о вашу ногу, чуть не опрокинув на ковер.
      mechoaround %actor% Котенок ласково потерся о ногу %actor.rname%.
    break
    case 5
      msend %actor% Котенок охватил вашу руку лапами, подставляя мягкие уши под ласку.
      mechoaround %actor% Котенок охватил руку %actor.rname% лапами, подставляя уши под ласку.
    break
  done
end
if (%cmd% == играть)
  mechoaround %actor% %actor.name% принял%actor.u% играть с котенком.
  msend %actor% Вы принялись играть с котенком пантеры.
  wait 1s
  switch %random.4%
    case 1
      msend %actor% Котенок припал на передние лапы, и прыгнул вперед, пытаясь поймать вашу
      руку.
      mechoaround %actor% Котенок припал на передние лапы, и прыгнул вперед, пытаясь
      поймать руку %actor.rname%.
    break
    case 2
      mecho Котенок в притворном ужасе отпрыгнул в сторону.
    break
    case 3
      msend %actor% Котенок весело прыгает и ловит вашу руку.
      mechoaround %actor% Котенок весело прыгает и ловит руку %actor.rname%.
    break
    case 4
      msend %actor% Котенок катается по ковру, уворачиваясь от вашей руки.
      mechoaround %actor% Котенок катается по ковру, уворачиваясь от руки %actor.rname%.
    break
  done
end
~
#23720
кормим котенка~
0 j 100
~
wait 1
set str %object.name%
set food %str.car%.%str.cdr%
if (%object.type% != 19) || (!%food.contains(мяс)% && !%food.contains(рыб)% &&
  !%food.contains(полок)% && !%food.contains(молоч)%))
  wait 1
  mecho Котенок обиженно фыркнул.
  drop %food%
  halt
end
mecho Котенок с аппетитом слопал %object.vname%.
wait 1
mpurge %object%
wait 2s
mecho Котенок облизнулся и принялся вылизывать шерстку.
~
#23721
котенок встречает~
0 q 100
~
wait 1
if ((%actor.name% == Руська) && (%exit% == 1))
  set exit 0
  global exit
  восторг
  рад Елена
  wait 2s
  emot катается по ковру от радости
end
~
#23722
загрузка котенка~
0 n 100
~
set exit 1
global exit
~
#23723
триггер камина~
2 c 1
разжечь подбросить~
wait 1
if %cmd% == разжечь
  if !%arg.contains(камин)%
    wsend %actor%  Что вы хотите разжечь?
    halt
  end
  if %exist.obj(23757)%
    wsend %actor%  Здесь уже горит огонь!
    halt
  end
  wsend %actor% Вы разожгли камин.
  wechoaround %actor% %actor.name% разожгла камин.
  wload obj 23757
  halt
end
if %cmd% == подбросить
  if !%arg.contains(дрова)%
    wsend %actor%  Что вы хотите подбросить? Котенка? :)
    halt
  end
  if !%exist.obj(23757)%
    wsend %actor% Прежде чем подбрасывать дрова - хотя бы разожгите камин. :)
    halt
  end
  wsend %actor% Вы подбросили несколько поленье в камин.
  wsend %actor% Огонь вспыхнул с новой силой.
  calcuid flame 23757 obj
  wpurge %flame%
  wload obj 23757
end
~
#23724
горит камин~
1 nz 100
~
oecho &rПламя ярко вспыхнуло в камине, высветив комнату и темные балки над головой.&n
wait 20s
oecho &rЯзыки пламени медленно пляшут в камине.&n
wait 40s
oecho &rОт камина исходит терпкий запах смолы.&n
wait 40s
oecho &rИсходящие от камина волны тепла ласкают кожу.&n
wait 30s
oecho &rДрова в камине потрескивают, испуская струйки искр.&n
wait 45s
oecho &rОгонь в камине чуть-чуть приопал.&n
wait 50s
oecho &rБольшое полено с громким треском развалилось на несколько угольков.&n
wait 40s
oecho &rПламя в камине медленно начинает угасать.&n
wait 50s
oecho &rЯркие сскорки отрываются от горящих дров и уносятся в дымоход.&n
wait 50s
oecho &rПламя приопало, и уже почти не освещает комнату.&n
wait 45s
oecho &rУгли в камине пощелкивают, рассыпаясь в золу.&n
wait 50s
oecho &rКамин почти угас.&n
wait 50s
oecho &rУгли ярко рдеют в полутемной пасти камина.&n
wait 50s
oecho &rКамин затух.&n
wait 1
opurge %self%
~
#23725
вход в башню~
2 c 1
подняться~
if (!%arg.contains(в башню)% || ( %actor.name% != Руська ))
  return 0
  halt
end
wait 1
wsend %actor% Вы тихонько отворили узкую потайную дверцу и поспешили вверх по винтовой
лестнице.
wteleport %actor% 23782
~
#23726
выйти из башни~
2 c 1
спуститься~
if !%arg.contains(в замок)%
  return 0
  halt
end
wait 1
wsend %actor% Вы спустились вниз по лестнице и тихо выскользнули в потайную дверцу.
wteleport %actor% 23729
set exit 1
global exit
calcuid panther 23720 mob
remote exit %panther.id%
~
#23727
жизнедеятельность двойника~
0 b 6
~
wait 1
switch %random.6%
  case 1
    mecho  Двойник Ивана тронул вас за плечо и поинтересовался : 'Ивана не видали?' 
  break
  case 2
    mecho  Двойник Ивана огляделся и почесал в затылке.
    mecho  Двойник Ивана сказал : 'За информацию о местонахождении моего владельца щедро награжу!'
  break
  case 3
    mecho  Двойник Ивана проворчал : 'Ну куда же он запропостился!' 
  break
done
wait 4s
~
#23728
тригер сада~
2 b 5
~
wait 1
switch %random.6%
  case 1
    wecho  ______До вас донеслась нежная переливчатая песнь соловья.
  break
  case 2
    wecho  ______Вы чуть вздрогнули, когда ваших ног коснулась нежная шерстка мурчащей кошечки.
  break
  case 3
    wecho  ______Легкий ветерок нежно коснулся вашего лица и улетел прочь. 
  break
done
end
wait 4s
~
#23729
выход через нишу~
2 c 0
двигать сдвинуть отодвинуть~
wait 1
if !%arg.contains(постамент)%
  return 0
  halt
end
wait 1
wsend %actor% Постамент мягко отошел в сторону, пропустив вас в подземный ход.
wsend %actor% Пройдя несколько десятков метров, вы оказались в зарослях кустарника.
wsend %actor% Оглянувшись на крепостную стену, вы так и не смогли понять, откуда же вы вышли.
wteleport all 23769
wechoaround %actor% %actor.name% хрустя ветками и ругаясь выбрал%actor.u% из кустов.
~
#23730
Предлагаем выбрать сумму игры~
0 d 0
да согласен конечно нет~
wait 1
if (%speech%  ==  нет) 
  say Ну и проваливай тогда.
  set gamer %actor.id%
  global gamer
  exec 23735 %self.id%
  halt
end
if ((%actor.uniq% == %oldgamer1%) || (%actor.uniq% == %oldgamer2%) || (%actor.uniq% == %oldgamer3%) || (%actor.uniq% == %oldgamer4%) || %actor.uniq% == %oldgamer5%))
  say Да иди ты в жопу! 
  say Домогаешься прям, ахтунг чо ли?
  плюн
  halt
end
say Вот и хорошо!
улы
emot довольно потер руки
wait 2s
say Почем игра? По тысяче, коли богат%actor.g%, али 500, 300 кун?
say Или по маленькой - по сотне раскинем?
attach 23731 %self.id%
detach 23711 %self.id%
detach 23730 %self.id%
~
#23731
Выбираем сумму игры~
0 d 0
тысяча пятьсот триста сто 1000 500 300 100~
wait 1
if (%actor.vnum%  != -1)
  halt
end
switch %speech%
  case 1000
    case тясяча
      set game 1000
    break
    case 500
      case пятьсот
        set game 500
      break
      case 300
        case триста
          set game 300
        break
        case 100
          case сто
            set game 100
          break
          default
            say Скока-скока?
            halt
          end
        done
        global game
        if (%actor.bank% < %game%)
          say Э! Да ты никак меня обмануть надумал%actor.g%?! У тебя ведь столько и нет!
          say Иди-ка отсюда подобру - поздорову!
          ворч
          halt
        end
        mload obj 23763
        calcuid key 23763 obj
        close двер east
        lock двер east
        wait 1
        mpurge %key%
        say Ладушки!
        say Чур ты первый!
        mload obj 23758
        calcuid dice 23758 obj
        set gamer %actor.id%
        global gamer
        remote gamer %dice.id%
        remote game %dice.id%
        дать кости %actor.name%
        detach 23731 %self.id%
~
#23732
Подбираем кости~
0 z 0
~
drop all
get gamedice237
get all.кун
wait 2
drop gamedice237
~
#23733
Стучимся в руму к ромесу~
2 c 0
стукнуть постучать стукнуться~
wait 1
if !%arg.contains(двер)%
  wsend %actor% Вы постучались лбом в стену. БОЛЬНО!
  halt
end
calcuid room1 23739 room
if %room1.pc%
  wsend %actor% _"Ааап стену убейтесь, охламоны!" - донесся из-за двери раздраженный голос.
else
  calcuid gipsy 23705 mob
  exec 23734 %gipsy.id%
  wsend %actor% "Ну, чего надо-то?" - спросил выглянув цыган Ромес.
end
wait 5s
~
#23734
Отпираем дверку у ромеса~
0 z 100
~
detach 23730 %self.id%
detach 23731 %self.id%
attach 23711 %self.id%
rdelete gamer %self.id%
rdelete game %self.id%
rdelete gamerresult %self.id%
mload obj 23763
calcuid key 23763 obj
unlock двер east
open двер east
emot вздохнул и вернулся к игре
wait 1
mpurge %key%
~
#23735
Запоминаем игроков~
0 z 100
~
if !%gamer%
  halt
end
if %oldgamer1%
  set oldgamer2 %gamer.uniq%
  global oldgamer2
elseif %oldgamer2%
  set oldgamer3 %gamer.uniq%
  global oldgamer3
elseif %oldgamer3%
  set oldgamer4 %gamer.uniq%
  global oldgamer4
elseif %oldgamer4%
  set oldgamer5 %gamer.uniq%
  global oldgamer5
elseif (%oldgamer5% || !%oldgamer1%)
  set oldgamer1 %gamer.uniq%
  global oldgamer1
end
exec 23734 %self.id%
~
#23736
Ключник базарит~
0 d 3
Спите славные люди Багдадаааа...!~
wait 2
set text Спите славные люди Багдадаааа...!
if (%speech% == %text%)
  say Вы удооооды...!
end
~
$~
