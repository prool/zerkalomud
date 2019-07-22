#80400
Проклятый воин дает квест_1~
0 r 100
~
wait 1s
взд   
say Приветствую тебя %actor.iname%!
дум
if %quest804%
  halt
end
wait 2s
say Зря ты сюда заш%actor.y%. 
say Гиблое здесь место, проклятое.
say Детинец тут рядом стоит заброшенный.
say Давно как его разгромили, а всех защитников смерти тяжкой предали.
say Вот только я один и уцелел.
wait 1s
say Эх... лучше бы пасть мне честною смертию, в бою, с мечом в руках!..
say Да не судьба...
плак %actor.iname%
wait 1s
say Наслал на меня порчу их колдун наиглавнейший!
say Не могу я теперь к людям, к живым вернуться... не могу. 
say И смерть меня тоже не берет...
выть
*плак %actor.iname%
say Помоги мне, сходи в подвалы детинца, убей колдуна богомерзкого!
say Только так с меня проклятие можно снять.
say А я уж тебя отблагодарю как смогу.
wait 2s
say Поможешь ли ты мне?
~
#80401
Проклятый воин дает квест_2~
0 d 0
да помогу хорошо слушаю согласен~
if %actor.level% < 24
  say Нет... не могу я взять грех такой на душу...
  say Тебя на смерть на верную послать
  тоска
  halt
end
if !%quest804.name%
  set quest804 %actor%
  global quest804
  wait 1s
  радов
  say Вот и хорошо.
  say Вот тебе ключ от ворот. 
  say Я его прихватил, когда из детинца бежал.
  mload obj 80426
  give ключ %actor.iname%
  wait 1s
  say Ах да, еще забыл тебе сказать.
  say Для своей охраны этот колдун, или как его там...
  думать
  say Ну это не важно. Он поднял трупы всех наших павших воинов!
  say Ходят там теперь орды нечисти жуткой, ищут поживы.
  say Да и колдуна-то самого добраться - непросто.
  say Я уж и пробовал, да только не по силам это мне...
  say Так что %actor.iname%, осторожней там.
  wait 1s
  проща %actor.iname% 
  calcuid for_mb 80400 mob
  detach 80400 %for_mb.id%
  detach 80401 %for_mb.id%
end
~
#80402
Проклятый воин принимает квест~
0 h 100
~
if %actor% != %Killer%
  halt
end
wait 1s
say Наконец-то избавился я от этих пут!
say %actor.iname%, держи свою награду.
if (( %world.curobjs(591)% < 1 :) && ( %random.4% == 1 :))
  mload obj 591
  give all %actor.name% 
  say Я даю тебе эту заповедь, и если тебе хватит ума, чтобы понять ее.
  say То ты сможешь всегда вернуть своих близких и любимых...
elseif (( %world.curobjs(588)% < 1) && ( %random.4% == 1))
  mload obj 588
  give all %actor.name% 
  say Я даю тебе эту летопись, и если тебе хватит ума, чтобы понять ее.
  say То ты сможешь использовать холод себе на пользу...
else
  %self.gold(10000)%
  give 10000 кун .%actor.name%
end
say Это все, чем я могу наградить тебя...
wait 10
say А теперь прощай.
mecho Воин громко захохотал и исчез в розовой дымке!
wait 5
mpurge %self%
~
#80403
Репоп степного детинца~
2 f 100
~
calcuid for_mb 80400 mob
rdelete quest804 %for_mb.id%   
detach 80400 %for_mb.id%
detach 80401 %for_mb.id%
detach 80402 %for_mb.id%
attach 80400 %for_mb.id%
attach 80401 %for_mb.id%
*пуржим все двери в подземелье...
wdoor 80484 w purge
wdoor 80484 e purge
wdoor 80470 w purge
wdoor 80470 e purge
wdoor 80489 w purge
wdoor 80489 e purge
wdoor 80490 w purge
wdoor 80490 e purge
wdoor 80485 w purge
wdoor 80485 e purge
wdoor 80486 w purge
wdoor 80486 e purge
wdoor 80469 w purge
wdoor 80469 e purge
wdoor 80483 w purge
wdoor 80483 e purge
wdoor 80482 w purge
wdoor 80482 e purge
*... и создаем их заново случайным образом
*неохота возиться с калькуидом, поэтому так
*... и самое смешное, что все это работает :-)
set room1_west no
set room1_east no
set room2_west no
set room2_east no
set room3_west no
set room3_east no
eval dungeon 0  
foreach %i% 1 2 3 4 5 6
  switch %dungeon%
    case 0
      eval dungeon 80484
    break
    case 80484
      eval dungeon 80470
    break
    case 80470
      eval dungeon 80489
    break
    case 80489
      eval dungeon 80490
    break
    case 80490
      eval dungeon 80485
    break
    case 80485
      eval dungeon 80486
    done
    eval doors no_ok
    while !(%doors% == ok) 
      switch %random.3%
        case 1
          if %room1_west% == no
            wdoor 80469 w room %dungeon%
            wdoor 80469 w flags ab
            wdoor %dungeon% e room 80469
            wdoor %dungeon% e flags ab
            eval room1_west yes
            eval doors ok
          elseif %room1_east% == no
            wdoor 80469 e room %dungeon%
            wdoor 80469 e flags ab 
            wdoor %dungeon% w room 80469
            wdoor %dungeon% w flags ab
            eval room1_east yes
            eval doors ok
          end
        break
        case 2
          if %room2_west% == no
            wdoor 80482 w room %dungeon%
            wdoor 80482 w flags ab 
            wdoor %dungeon% e room 80482
            wdoor %dungeon% e flags ab 
            eval room2_west yes
            eval doors ok
          elseif %room2_east% == no
            wdoor 80482 e room %dungeon%
            wdoor 80482 e flags ab 
            wdoor %dungeon% w room 80482
            wdoor %dungeon% w flags ab 
            eval room2_east yes
            eval doors ok
          end
        break
        default
          if %room3_west% == no
            wdoor 80483 w room %dungeon%
            wdoor 80483 w flags ab
            wdoor %dungeon% e room 80483
            wdoor %dungeon% e flags ab
            eval room3_west yes
            eval doors ok
          elseif %room3_east% == no
            wdoor 80483 e room %dungeon%
            wdoor 80483 e flags ab
            wdoor %dungeon% w room 80483
            wdoor %dungeon% w flags ab
            eval room3_east yes
            eval doors ok
          end
        done
      done
    done
~
#80404
бой с костяным духом~
0 k 50
~
msend %actor% Одним ударом своей страшной лапы костяной дух повалил Вас на землю!
msend %actor% У вас в голове помутилось...
mechoaround %actor% Одним ударом лапы костяной дух сбил %actor.vname% на землю!
mdamage %actor% 50
%actor.position(6)%
%actor.wait(5)%
if %random.3% == 2
  cast !лед шторм! %actor.name%
end
~
#80405
чернокнижник приказывает атаковать~
0 k 35
~
wait 1
dg_cast 'поднять труп' труп
eval target %random.pc%
if (%random.3% == 2)
  say На помощь, упыри, мертвяки и призраки!
  say На помощь, нечисть и силы тьмы, Чернобоговы дети!!!
end
if %target%
  приказ все убить %target.name%
else
  приказ все помочь %self.name%
end
~
#80406
чернокнижник поднимает трупы~
0 z 0
~
*поднимаем труп после телепортирования
wait 1s
if %random.10% < 7
  dg_cast 'поднять труп'  труп
else
  dg_cast 'ожив труп'  труп
  dg_cast 'поднять труп'  труп
end
~
#80407
телепортим труп к черноку вероятность 2/5~
0 f 0
~
eval leader %random.5%
if %leader% == 4
  if %exist.mob(80408)%
    calcuid necro 80408 mob
  else
    halt
  end
elseif %leader% == 3
  if %exist.mob(80409)%
    calcuid necro 80409 mob
  else
    halt
  end
else
  halt
end
mecho Незримая сила вдруг подхватила труп %self.rname% и унесла неведомо куда!
set target_room %necro.realroom%
mteleport %self% %target_room%
mechoaround %necro% Обезображенный ранами труп вдруг выпал из воздуха!
exec 80406 %necro.id%
detach 80407 %self.id%
~
#80408
убили слугу чернобога~
0 f 20
~
if %random.5% == 3
  return 1
  halt
end
return 0
mecho _Умирая, слуга чернобога сказал: Pestis eram vivus - moriens tua mors...!!!
*при жизни я был (тебе) чумой - умирая, стану (твоей) смертью (с) Мартин Лютер
msend %actor% _Слова слуги чернобога потрясли Вас до глубины души и вы содрогнулись от боли!
mechoaound %actor% _%actor.name% содрогнулся от боли, услышав сказанное слугой чернобога.
eval damage %actor.hitp%/3
*сносим 1/3 жизни
mdamage %actor% %damage%
~
#80409
триггер нечто (нападаем на кастеров)~
0 c 0
к с сло~
return 0
if !(%cmd.mudcommand% == колдовать) || !(%cmd.mudcommand% == cast) || !(%cmd.mudcommand% == сложить)
  halt
end
if %random.100% < 50
  switch %random.2%
    case 1
      cast !sielence! %actor.name%
      default
        cast !blind! %actor.name%
      done
    end
~
#80410
триггер нежити (башим кастеров)~
0 c 0
к с сло~
return 0
if !(%cmd.mudcommand% == колдовать) || !(%cmd.mudcommand% == cast) || !(%cmd.mudcommand% == сложить)
  halt
end
if %random.100% < 75
  отступить
  mkill %actor%
end
~
#80411
вошли к призраку воеводы~
0 q 40
~
wait 2s
emot тоскливо вздохнул
say О как мне тяжко и горько...
say Покою!!! Дайте же мне покою... Отпустите же душу мою на волю!...
wait 3s
say Может, надо вознести молитву? Как же там...
wait 3s
say Отче наш...
say Нет... не так... Не помню!!!
wait 4s
say Будь ты проклят, колдун!
say Отнял ты у меня и память и волю , но когда-нибудь я все вспомню и освобожусь...
wait 2s
emot глухо застонал
emot погрузился в тяжкие раздумия, и перестал обращать внимание на окружающее
~
#80412
сказал "помогу" у священника (выдача вторичного квеста)~
0 d 100
помогу~
if (%actor.religion% == 0) || !(%actor.vnum% == -1)
  halt
end
wait 2s
emot встрепенулся и посмотрел на Вас
say Ты? Ты мне поможешь?!
emot глубоко задумался..
if %actor.level% < 24
  say Нет... тебе это не по силам...
  if %actor.sex% ==  1
    say Ступай, сын мой... Да будет тебе удача в делах добрых.
  else
    say Ступай, дочь моя... Да будет тебе удача в делах добрых. 
  end
  emot отвернулся и стал внимательно разглядывать обломки церковной утвари
  halt
end
wait 1s
say Хорошо...  Слушай...
mecho _- Звали при жизни иноком Феодосием, в миру же Санькой Тягурским прозывался...
mecho _- Привела меня судьба в этот детинец - вразумил я воителей здешних, в веру истинную обратил.
mecho _- Да не спасло это ни их ни меня... Слаб человек плотью... да и духом тоже, бывает.
wait 5
say Нечисть же богомерзкая сюда вторгнувшись разбила и испоганила здесь все - сам видишь.
mecho _- А у меня отнял колдун проклятый память - и забыл я все предания святоотеческие и молитвы.
mecho _- Если б хоть строку одну вспомнил бы, да и вознес - был бы свободен...
wait 3
say Хоть одну бы строку... но - пусто на душе...
mecho _- Стоял здесь раньше иконостас, с вычерненной по позолоте молитвою.
mecho _- Но нечисть его разбила, а обломки растащила по всему детинцу.
wait 1s
say Кабы нашел ты эти обломки - может и сумел  бы я тогда вспомнить ее.
wait 1s
if %actor.sex% ==  1
  say Ступай, сын мой, найди их... И да пребудет с тобою Крестная сила...
else
  say Ступай, дочь моя, найди их... И да пребудет с тобою Крестная сила...
end
emot благословил Вас
dg_cast 'освящ' %actor.name%
*прячем обломок 1 в бочку
calcuid tun1 80434 obj
calcuid tun2 80435 obj
calcuid tun3 80436 obj
switch %random.3%
  case 1
    attach 80414 %tun1.id%
    attach 80415 %tun2.id%
    attach 80415 %tun3.id%
  break
  case 2
    attach 80415 %tun1.id%
    attach 80414 %tun2.id%
    attach 80415 %tun3.id%
  break
  default
    attach 80415 %tun1.id%
    attach 80415 %tun2.id%
    attach 80414 %tun3.id%
  done
  *грузим тиуна с обломком 
  *третий обломок все время лежит в хоромах но ключ от них у тиуна
  eval room1 80407+%random.26%
  calcuid tiun %room1% room
  attach 80417 %tiun.id%
  exec 80417 %tiun.id%
  *выбираем отрывок для квеста
  switch %random.10%
    case 1
      set otr1 "Твое, да приидет "
      set otr2 "Да святится имя"
      set otr3 "Царствие Твое"
      set otr Да святится имя Твое, да приидет Царствие Твое
    break
    case 2
      set otr1 "земле, как на небе"
      set otr2 "Твоя и на "
      set otr3 "Да будет воля"
      set otr Да будет воля Твоя и на земле, как на небе
    break 
    case 3
      set otr1 "прощаем должникам нашим"
      set otr2 "...и прости нам грехи наши,"
      set otr3 "как и мы "
      set otr и прости нам грехи наши, как и мы прощаем должникам нашим
    break
    case 4
      set otr1 "искушение, но "
      set otr2 "...и не введи нас во "
      set otr3 "избави нас от Лукавого"
      set otr и не введи нас во искушение, но избави нас от Лукавого
    break
    case 5
      set otr1 "и слава вовеки"
      set otr2 "Царствие и сила,"
      set otr3 "Ибо твое есть "
      set otr Ибо Твое есть Царствие и сила, и слава вовеки
    break
    case 6
      set otr1 "Его враги"
      set otr2 "Да воскреснет"
      set otr3 "Бог, и разсеются"
      set otr Да воскреснет Бог, и разсеются Его враги
    break
    case 7
      set otr1 "Мария, исполненная"
      set otr2 "благодати Божией, радуйся! "
      set otr3 "Богородица Дева"
      set otr Богородица Дева Мария, исполненная благодати Божией, радуйся!
    break
    case 8
      set otr1 "лукавому демону"
      set otr2 "Не дай воли"
      set otr3 "завладеть мною"
      set otr Не дай воли лукавому демону завладеть мною
    break
    case 9
      set otr1 "Святый, приди "
      set otr2 "безсилие наше"
      set otr3 "и уврачуй"
      set otr Святый, приди и уврачуй безсилие наше
    break
    default
      set otr1 "души"
      set otr2 "и спаси,"
      set otr3 "Милосердный, наши "
      set otr и спаси, Милосердный, наши души
    done
    set crash 0
    global crash
    global otr1
    global otr2
    global otr3
    global otr
    calcuid warrior 80431 mob
    remote otr %warrior.id%
    attach 80418 %self.id% 
    detach 80412 %self.id%
~
#80413
напали на призрак священника~
0 l 100
~
say Да будь ты проклят во веки веков, премерзкий язычник!
dg_cast 'проклят' %actor.name%
*народ бывает всякий, может и не догонит без намека, что на язычников только агрит
detach 80413 %self.id%
~
#80414
разбили бочку с обломком~
1 c 4
разбить~
if !%arg.contains(бочк)%
  osend %actor% Что вы разбить-то желаете?
  halt
end
osend %actor% Вы размахнулись ногой и БОЛЬНО пнули бочку!
oechoaround %actor% _%actor.name% размахнул%actor.u% ногой и что есть силы пнул%actor.g% самую большую бочку!
if %actor.str% < 25
  osend %actor% Как ни странно, но БОЛЬНО стало Вам.
  oechoaround %actor%  _Теперь %actor.name% скачет на одной ноге и издает немелодичные вопли.
  if %actor.hitp% > 50
    odamage %actor% 50
  end
  halt
end
oecho Бочка треснула и развалилась
oecho Выпивка растеклась по полу... Варварство!
oecho Из обломков бочки выпало что-то, блеснувшее золотом.
oload obj 80433
opurge %self%
~
#80415
разбили бочку с тварями~
1 c 4
разбить~
if !%arg.contains(бочк)%
  osend %actor% Что вы разбить-то желаете?
  halt
end
osend %actor% Вы размахнулись ногой и БОЛЬНО пнули бочку!
oechoaround %actor% _%actor.name% размахнул%actor.u% ногой и что есть силы пнул%actor.g% самую большую бочку!
if %actor.str% < 25
  osend %actor% Как ни странно, но БОЛЬНО стало Вам.
  oechoaround %actor%  _Теперь %actor.name% скачет на одной ноге и издает немелодичные вопли.
  if %actor.hitp% > 50
    odamage %actor% 50
  end
  halt
end
oecho Бочка треснула и развалилась
oecho Выпивка растеклась по полу... Варварство!
oecho Что-то выскочило из обломков бочки!
switch %random.3%
  case 1
    oload mob 80410
    oload mob 80425
    oload mob 80411
  break
  case 2
    oload mob 80411
    oload mob 80426
    oload mob 80423
  break
  default
    oload mob 80412
    oload mob 80427
    oload mob 80424
  done
  opurge %self%
~
#80416
зарезали призрак тиуна~
0 f 0
~
mload obj 80438
~
#80417
Загрузка призрака тиуна~
2 z 0
~
wload mob 80433
wecho  Призрак тиуна внезапно возник здесь!
detach 80417 %self.id%
~
#80418
дали обломок священнику~
0 j 100
~
if !(%object.vnum% == 80433) || (%actor.religion% == 0)
  drop %object.name%
  halt
end
wait 3
eval crash %crash%+1
global crash
switch %crash%
  case 1
    say Да, это то самое!
    say Что же тут написано....
    wait 1s
    say Вот, что тут говорится: %otr1% 
    say Пожалуй, этого мало...
    mpurge %object%
    halt
  break
  case 2
    say Ты наш%actor.y% еще один?
    say Прекрасно...
    wait 1s
    say Дай-ка прочесть... : %otr2% 
    say Нет... нужно еще хотя бы один
    mpurge %object%
    halt
  break
  default
    say Ты наш%actor.y% третий обломок?
    say Как мне отблагодарить тебя...
    wait 1s
    say Вот что тут сказано: %otr3%
    wait 2
    say Но как все это вместе сложить? Не помню я... Может ты подскажешь?
    attach 80419 %self.id%
    mpurge %object%
  done
  detach 80418 %self.id%
~
#80419
сказали отрывок священнику~
0 d 0
*~
if (%actor.religion% == 0) || !(%actor.vnum% == -1)
  halt
end
if %speech% == %otr%
  say Да! именно так... 
  wait 4
  emot умиротворенно улыбнулся
  say %otr%
  emot озарился неземным светом
  wait 1s
  say Благодарю тебя...
  say Нечем мне тебя наградить...
  say Об одном лишь прошу - воевода здешний был достойный человек и христинанин добрый,
  say Да и его поганый колдун себе служить обрек и поставил охранять сокровищницу и свои покои.
  say Освободи и его тоже - и зачтется это тебе и на небесах, и на земле.
  wait 2
  emot осветился исходящим с незримых небес светом и медленно истаял в воздухе..
  calcuid warrior 80431 mob
  attach 80420 %warrior.id%
  mpurge %self%
else
  if %random.3% == 2
    say Нет.... это что-то не то....
    emot тяжело задумался
  end
end
~
#80420
сказали отрывок воеводе~
0 d 0
*~
if !(%actor.vnum% == -1)
  halt
end
if %speech% == %otr%
  emot поперхнулся и прекратил свои стенания
  detach 80411 %self.id%
  wait 2s
  emot недоуменно посмотрел на Вас
  say ?... 
  wait 4
  emot внезапно встрепянулся и выпрямился, расправляя сведенные плечи
  wait 1s
  say Да... Вот оно! Я все вспомнил!
  say Спасибо тебе
  улы
  emot опустился на колени и горячечно зашептал молитву
  wait 5
  emot осветился исходящим с незримых небес светом и медленно истаял в воздухе..   
  if %actor.level% > 24
    msend %actor% _За это доброе дело Вы получили 80000 очков опыта.
    %actor.exp(+90000)%  
  end
  mpurge %self%
end
~
#80421
убили огненный морок~
0 f 0
~
if (%random.5% == 2) && (%world.curobjs(80430)% < 7)
  mload obj 80430
end
~
#80422
убили ледяной морок~
0 f 0
~
if (%random.5% == 2) && (%world.curobjs(80429)% < 7)
  mload obj 80429
end
~
#80423
убили созидателя~
0 f 0
~
mload obj 80439
calcuid dark 80400 mob
attach 80402 %dark.id%
makeuid Killer %actor.id%
remote Killer %dark.id%
~
#80424
отперли сундук в сокровищнице~
1 o 100
~
*сундуков три, но открыть получится только один, ключ сразу ломается
wait 1
calcuid key 80439 obj
exec 80426 %key.id%
osend %actor% _От вашего неловкого движения серебряный ключ переломился пополом.
oechoaround %actor% _%actor.name% неловко повернул%actor.g% ключ, и тот сломался пополам... Растяпа!
~
#80425
повернули светильник ~
1 c 4
повернуть~
if !(%actor.vnum% == -1)
  halt
end           
if !%arg.contains(светильник)%
  osend %actor% _Что вы желаете повернуть?
  halt
end
osend %actor% Вы взялись выкручивать светильник из стены... Интересно - что сейчас будет?
oechoaround %actor% _%actor.name% повернул%actor.g% торчащий из стены светильник и стал%actor.g% дожидаться результата.
osend %actor%  Внезапно пол под Вами провалился и Вы полетели куда-то в темноту!
oechoaround %actor%  Внезапно пол под %actor.tname% провалился и он%actor.g% с диким воплем исчез из виду.                 
oteleport %actor% 80404
~
#80426
пуржим ключ~
1 z 0
~
opurge %self%
~
#80427
бой с созидателем (99%)~
0 l 100
~
mecho _%self.iname% взмахнул полами своего плаща, и они заслонили весь свет!
dg_cast 'dark' %self.name%  
attach 80432 %self.id%
detach 80427 %self.id%
~
#80428
выгоняем нечиcть из темницы~
0 z 0
~
calcuid temn %self.realroom% room
if (%temn.west% == west)
  west
else
  east
end
~
#80429
запуск триггера 80428 и 80430~
2 j 100
~
if %exist.mob(80418)%
  calcuid nechto1 80418 mob
  exec 80428 %nechto1.id%
end
if %exist.mob(80421)%
  calcuid nechto2 80421 mob
  exec 80428 %nechto2.id%   
end
if %exist.mob(80434)%
  calcuid fire 80434 mob
  exec 80430 %fire.id%
end
if %exist.mob(80438)%
  calcuid fire2 80438 mob
  exec 80430 %fire2.id%
end
~
#80430
ловушка с огненным вихрем~
0 rz 100
~
wait 2
calcuid temn %self.realroom% room
if %temn.west%
  west
else
  east
end
if (%self.realroom% == %temn.vnum%)
  halt
end
mecho _Огненный вихрь взорвался ослепительным сиянием, опаляя все вокруг!
mecho _Это действительно БОЛЬНО!
eval firstchar %self.people%
eval secondchar %firstchar.next_in_room%
mdamage %firstchar% 200
while %secondchar%
  eval firstchar %secondchar%
  eval secondchar %firstchar.next_in_room%
  mdamage %firstchar% 200
done
mpurge %self%
~
#80431
ловушка с грудой костей~
1 t 100
~
wait 1
oload mob 80410
oecho _Внезапно куча мертвых костей зашевелилась и вздыбилась вверх!
oecho _Костяной дух возник на ваших глазах.
eval target %random.pc%
oforce костяной.дух kill %target.name%
opurge %self%
~
#80432
бой с созидателем (50%)~
0 l 50
~
mecho _Созидатель тьмы взревел: "Ко мне, силы тьмы и безумия! Помогите своему хозяину!!!"
wait 1s
mecho _Тьма в комнате забурлила, потекла потоками.... 
mecho _Черные тени вдруг зашевелились, обретая форму, и кинулись на Вас!
mload mob 80436
mload mob 80427
mecho  Несколько страшных призраков вынырнуло из темноты!
mload mob 80437
mload mob 80437
detach 80432 %self.id%
~
#80433
в бою с вурдалаком~
0 k 30
~
eval meat %random.pc%
if (!%meat.name%)
  halt
end
msend %meat% _Вурдалак бросился на вас и вцепился вам в глотку!
msend %meat% _Гнусный вурдалак выпил вашей крови и расцвел на глазах.
mechoaround %meat% _Гнусный вурдалак бросился на %meat.vname% и вцепился в горло!
mechoaround %meat% _Вурдалак выпил крови %meat.rname% и его раны мгновенно затянулись.
eval blood %random.200%
mdamage %meat% %blood%
%self.hitp(+%blood%)%
~
#80434
делит мобов из погреба и лоад бочек~
2 f 100
~
*удяляем всех тварей, загруженых по триггеру и грузим бочки
wpurge 
wload obj 80434
wload obj 80435
wload obj 80436
~
#80435
убили созидателя~
0 f 100
~
if ( %actor.vnum% ==  -1 )
  set Killer %actor.id%
else
  eval owner %actor.leader%
  set Killer %owner.id%
end
calcuid dark 80401 mob
attach 80402 %dark.id%
remote Killer %dark.id%
~
#80436
Убили последнего вурдалака~
0 f 100
~
if (%world.curmobs(80402)% <= 1)
  mload obj 80450
end
~
$~
