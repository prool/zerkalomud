#6500
РЕСЕТ ЗОНЫ~
2 f 100
~
*РЕСЕТ ЗОНЫ | Rooms | Zone Reset | 100
wdoor 6510 east purge
wdoor 6501 east purge
wdoor 6501 east room 6502
calcuid izba 6501 room
attach 6501 %izba.id%
calcuid undertree 6504 room
rdelete camesouth %undertree% 
rdelete camenorth %undertree%
context 4000
set hunterstory 0
worlds hunterstory
~
#6501
Вошли в избушку~
2 e 100
~
*Вошли в избушку | Rooms | Enter PC | 100
wait 1
wdoor 6501 east flags abcd
wdoor 6501 east description дверь
*wdoor 6501 east name Дверь
%echo% Пройдя всего пару шагов по избушке, Вы услышали как захлопнулась входная дверь.
%echo% Словно чертик из табакерки, за Вашей спиной возник худощавый высокий старик.
%load% mob 6500
detach 6501 %self.id%
~
#6502
Старый охот появился~
0 n 100
~
*Старый охот появился | Mobiles | Load | 100
wait 2s
say Ну здравствуй, гость нежданный-незванный
detach 6502 %self%
~
#6503
Говорим со старым охотом~
0 d 100
*~
*Говорим со старым охотом | Mobiles | Speech | 100 | *
if ((!%actor%) || (%actor.vnum% != -1))
  halt
end
wait 3
switch %speech%
  case здравствуй
    say Спасибочки, стараюсь
    case привет
      if (%actor% == %quester%)
        say Здоровались уже ведь
        say Дак поможешь?
      else
        eval quester %actor%
        global quester
        if %actor.sex% == 2
          say Девица, а не поможешь ли ты мне, старому?
        else
          say Молодец, а не поможешь ли ты мне, старому?
        end
        вопрос .%actor.name%
        say Совсем немощен я стал, на охоту не выйти даже
        say А без охоты то и питаться нечем совсем
        say Не устраивать же сад-огород здесь посреди лесу
        halt
      end
    break
    case помогу
      if (%actor% == %quester%)
        eval temp %actor.wait(2)%
        say Вот и славно
        улыб
        wait 5
        %echo% %self.iname% отодвинул небольшой половик, лежащий на полу.
        %echo% %self.iname% открыл люк в погребок.
        mdoor 6501 down room 6517
        down
        wait 3
        взять all
        wait 1s
        up
        wait 1s
        %echo% %self.iname% закрыл люк, вернул половик на прежнее место.
        mdoor 6501 down purge
        wait 5
        say Мне совсем немного помощи то и надо
        хитр
        say Во-первых, мяска раздобудь, да пожирнее
        say Во-вторых, дрова у меня закончились недавно
        say Надо бы хоть три-четыре охапки заготовить
        say В-третьих, водицы родниковой нужно фляжку набрать
        say Не забудь еще хозяину лесному требу оставить
        say Да место выбирай позаметнее
        say А то он ведь тож не молодеет - уже видит худо
        wait 5
        say Возьми мою сумку, в ней есть все необходимое
        дать all .%actor.name%
        брос all
        wait 3
        %echo% %self.iname% отпер и открыл дверь в избу.
        mdoor 6501 east purge
        mdoor 6501 east room 6502
        detach 6503 %self.id%
      else
        хмур
        say С чего ты взял%actor.g%, что мне нужна помощь?
      end
    break
    default
      say То ли я чего-то не расслышал
      чесат
      say То ли ты чего-то не то сказал%actor.g%
      halt
    break
  done
~
#6504
Рубим деревья~
1 c 100
рубить~
*Рубим деревья | Objects | Command | 100 | рубить
wait 3
if (%exist.obj(6501)%)
  eval handone %actor.eq(16)%
  eval handtwo %actor.eq(17)%
  if ((!%actor.haveobj(6501)%) && (%handone.vnum% != 6501) && (%handtwo.vnum% != 6501))
    %send% %actor% Вам бы топорик раздобыть.
    halt
  end
else 
  %send% %actor% Вам бы топорик раздобыть.
  halt
end
if (((%self.vnum% == 6503) || (%self.vnum% == 6504)) && (!%arg.contains(дерево)%))
  %send% %actor% Что вы собираетесь рубить?
  halt
end
if (%actor.move% < 10)
  %send% %actor% Вы слишком устали для этого, отдохните.
  halt
else
  %send% %actor% Вы начали усердно рубить %self.vname% коротким топориком.
  %echoaround% %actor% %actor.iname% начал%actor.g% усердно рубить %self.vname%.
  eval temp %actor.move(-10)%
end
wait 3
if (%self.room% == 6510)
  if (!%podhod%)
    eval podhod 1
    global podhod
    calcuid axe 6501 obj
    exec 6523 %axe%
  elseif (%podhod% < 2)
    eval podhod %podhod%+1
    global podhod
    if (%exist.mob(6501)%)
      calcuid birdy 6501 mob
      %echo% %birdy.iname% пуще прежнего стала виться вокруг да мешать работать.
    end
  else
    %send% %actor% Наконец Вы повалили %self.vname% поперек оврага.
    %echoaround% %actor% %actor.iname% повалил%actor.g% %self.vname% поперек оврага.
    %echo% Теперь можно пройти на другую сторону.
    odoor 6510 east room 6511
    %load% obj 6508
    if (%exist.mob(6501)%)
      calcuid birdy 6501 mob
      exec 6506 %birdy.id%
    end
    %purge% %self%
  end
else
  if (%podhod% < 2)
    eval podhod %podhod%+1
    global podhod
  else
    %send% %actor% Наконец Вы повалили %self.vname% и порубили его в дрова.
    %echoaround% %actor% %actor.iname% повалил%actor.g% %self.vname% и изрубил%actor.g% его в дрова.
    if (%self.vnum% == 6503)
      %load% obj 6506
    else
      %load% obj 6507
      %load% mob 6502
    end
    %load% obj 6508
    if (%exist.mob(6501)%)
      calcuid birdy 6501 mob
      exec 6506 %birdy.id%
    end
    %purge% %self%
  end
end
~
#6505
Гнездо упало или положено~
1 h 100
~
*Гнездо упало или положено | Objects | Drop | 100
if (%exist.mob(6501)%)
  calcuid birdy 6501 mob
  %teleport% %birdy% %self.room%
  exec 6506 %birdy.id%
else
  calcuid ohot 6500 mob
  set birdsaved 0
  remote birdsaved %ohot%
  wait 1
  %echo% Из-за Вашей неосторожности птенцы в гнезде умерли.
  %purge% %self%
end
~
#6506
Птичка реагирует на перемещение гнезда~
0 z 100
~
*Птичка реагирует на перемещение гнезда | Mobiles | Auto | 100
wait 5
if (%exist.obj(6505)%)
  calcuid nest 6505 obj
  if (%nest.carried_by%)
    %echo% Из-за Вашей неосторожности птенцы в гнезде умерли.
    %purge% %nest%
    %echo% Издав протяжный, полный грусти крик, %self.iname% упорхнула долой.
    %purge% %self%
  else
    %echo% Обрадованная %self.iname% благодарно защебетала и скрылась в гнезде.
    calcuid ohot 6500 mob
    set birdsaved 1
    remote birdsaved %ohot%
    %purge% %self%
  end
else
  %echo% Издав протяжный, полный грусти крик, %self.iname% упорхнула долой.
  %purge% %self%
end
~
#6507
Дух дерева появился~
0 n 100
~
*Дух дерева появился | Mobiles | Load | 100
%echo% %self.iname% вырвался из пня, хищно озираясь вокруг.
foreach victim %self.pc%
  if (%victim.level% > 30)
  break
end
say Ты за что жизнь молодую загубил?! Отомщу!
mkill %victim%
done
~
#6508
Волк, зубами щелк~
0 b 100
~
*Волк, зубами щелк | Mobiles | Random | 100
if ((%self.position% != 8) || ((!%exist.mob(6503)%) && (!%exist.mob(6504)%)) || (%self.realroom% == 6525))
  halt
end
set dirfrom северо-запада севера северо-востока запада нет востока юго-запада юга юго-востока
set dirto северо-запад север северо-восток запад нет восток юго-запад юг юго-восток
eval startroom %self.realroom%-6520
%echo% %self.iname% тихо удалился отсюда.
wait 1
%teleport% %self% 6525
wait 3
%echo% %self.iname% подкрался сюда с %dirfrom.words(%startroom%)%.
wait 2
if (%exist.mob(6503)%)
  calcuid deermom 6503 mob
  switch %random.2%
    case 1
      set wolfy но поймал зубами лишь воздух
    break
    default
      set wolfy но лишь громко клацнул зубами
    break
  done
  switch %random.2%
    case 1
      set deer но ее удар не достиг цели
    break
    default
      set deer но промахнулась
    break
  done
  %echo% %self.iname% попытался укусить %deermom.vname%, %wolfy%.
  %echo% %deermom.iname% попыталась лягнуть %self.vname%, %deer%.
  wait 2
  eval rnd %random.9%
  if (%rnd% == 5)
    eval rnd 6
  end
  %echo% %self.iname% сбежал на %dirto.words(%rnd%)%.
  wait 3
  eval rndroom %rnd%+6520
  %teleport% %self% %rndroom%
  wait 1
  eval rnd 10-%rnd%
  %echo% %self.iname% прибежал сюда с %dirfrom.words(%rnd%)%.
else
  calcuid deerson 6504 mob
  %echo% %self.iname% вцепился в горло %deerson.dname%, вызвав мнгновенную смерть.
  %echo% Кровушка стынет в жилах от предсмертного крика %deerson.rname%.
  wait 1
  %echo% %self.iname% схватил бездыханное тело %deerson.rname% и уволок в лес.
  wait 1
  %purge% %deerson%
  %purge% %self%  
end
~
#6509
Волк ласты склеил~
0 f 100
~
*Волк ласты склеил | Mobiles | Death | 100
%load% obj 6512
if ((!%exist.mob(6503)%) || (!%exist.mob(6504)%) || (!%exist.mob(6500)%))
  halt
end
calcuid deermom 6503 mob
set wolfkiller %actor%
remote wolfkiller %deermom%
exec 6511 %deermom%
~
#6510
Вход под елку~
2 e 100
~
*Вход под елку | Rooms | Enter PC | 100
wait 1
if ((%direction% == south) && (%camesouth% != 1))
  set camesouth 1
  global camesouth
  %load% mob 6506
  %echo% Из темного кустарника вдруг выскочил громадный мужик.
  wait 3
  calcuid holop 6506 mob
  %force% %holop% say Оп-па!
  %force% %holop% say Здрасте, подайте пожалуйста сирым да убогим
  %force% %holop% ухмыл
  %echo% 'Как же, убогий он, вон харя-то какая' - подумалось Вам.
elseif (%camenorth% != 1)
  wat 6525 wload mob 6504
  wat 6525 wload mob 6503
  wat 6522 wload mob 6505
  set camenorth 1
  global camenorth
end
~
#6511
Проверка миниквеста оленихи~
0 z 100
~
*Проверка миниквеста оленихи | Mobiles | Auto | 100
if ((!%exist.mob(6504)%) || (!%exist.mob(6500)%))
  halt
end
if (%arrowtaker%) && (%wolfkiller%)
  wait 2
  calcuid deerson 6504 mob
  calcuid ohot 6500 mob
  if (%wolfkiller.realroom% != %self.realroom%)
    %teleport% %deerson% %wolfkiller.realroom%
    %teleport% %self% %wolfkiller.realroom%
    wait 2
    %echo% Олениха с олененком прискакали из центра поляны.
  end
  %echo% Олениха благодарно посмотрела Вам в глаза.
  %force% %deerson% поклон .%wolfkiller.name%
  %echo% Олениха с олененком убежали в лес.
  set deersaver %wolfkiller%
  remote deersaver %ohot%
  wait 2
  %purge% %deerson%
  %purge% %self%
end
~
#6512
Вошли к оленихе~
0 bq 100
~
*Вошли к оленихе | Mobiles | Random,Great PC | 100
if (!%arrowtaker%)
  if (%self.hitp% > 300)
    eval temp %self.hitp(300)%
  end
  wait 1s
  %echo% %self.iname% застонала, пытаясь вытащить охотничью стрелу из своего бока.
  %echo% Вам подумалось, что самой ей никак не справиться.
end
~
#6513
Вытаскиваем стрелу из оленихи~
0 c 1
вытащить вынуть~
*Вытаскиваем стрелу из оленихи | Mobiles | Command | 100 | вытащить вынуть
if (!%arrowtaker%)
  if (!%arg.contains(стрел)%)
    %send% %actor% Что Вы хотите %cmd.words(1)%?
  else
    wait 3
    %send% %actor% Осторожно подойдя к %self.dname%, Вы вынули из ее бока стрелу.
    %echoaround% %actor% Осторожно подойдя к %self.dname%, %actor.iname% вынул%actor.g% из ее бока стрелу.
    %send% %actor% Вы выкинули стрелу куда-то в сторону леса.
    %echoaround% %actor% %actor.iname% выкинул%actor.g% стрелу куда-то в сторону леса.
    %echo% Из пруда на западе послышалось довольное квакание.
    calcuid ohot 6500 mob
    set arrowtaker %actor%
    global arrowtaker
    exec 6511 %self%
  end
else
  return 0
end
~
#6514
Взяли гнездо~
1 g 100
~
*Взяли гнездо | Objects | Get | 100
wait 1
if (%exist.obj(6501)%)
  calcuid axe 6501 obj
  exec 6523 %axe%
else
  calcuid ohot 6500 mob
  set birdsaved 0
  remote birdsaved %ohot%
  %echo% Из-за Вашей неосторожности птенцы в гнезде умерли.
  %purge% %self%
end
~
#6515
Наполнить фляжку~
1 c 2
набрать~
*Наполнить фляжку | Objects | Command | 2 | набрать
if ((!%arg.contains(вод)%) || (%self.room% != 6514))
  return 0
else
  if (!%mavkashown%)
    set mavkashown 1
    global mavkashown
    %load% mob 6507
    %send% %actor% Вы наклонились к ручью чтобы наполнить фляжку.
    %echoaround% %actor% %actor.iname% наклонил%actor.u% к ручью чтобы наполнить фляжку.
    %echo% Вдруг из ручья показалась девичья голова.
    wait 3
    calcuid mavka 6507 mob
    if (%actor.sex% == 2)
      %force% %mavka% say Сестрица, дай гребешок, пожалуйста
    else
      %force% %mavka% say Братец, дай гребешок, пожалуйста
    end
    %force% %mavka% say Иначе не разрешу тебе воды тут набрать
  elseif (%exist.mob(6507)%)
    %send% %actor% Вы наклонились к ручью чтобы наполнить фляжку.
    %echoaround% %actor% %actor.iname% наклонил%actor.u% к ручью чтобы наполнить фляжку.
    wait 3
    calcuid mavka 6507 mob
    %force% %mavka% say Ах так!? Тогда ты отправишься со мной!
    %force% %mavka% mkill %actor%
  else
    calcuid ohot 6500 mob
    set gotwater 1
    remote gotwater %ohot%
    %echo% Вы набрали воды из ручья в %self.vname%.
    detach 6515 %self.id%
  end
end
~
#6516
Холоп получил что-то~
0 j 100
~
*Холоп получил что-то | Mobiles | Receive | 100
wait 1
switch %object.vnum%
  case 6510
    say О! Такая штука, пожалуй, мне сгодится
    say Ну, ступай тогда, чтоли, не держу
    calcuid ohot 6500 mob
    set failedholop 1
    remote failedholop %ohot%
    mjunk all
    %purge% %self%
  break
  default
    say Спасибочки
    хихи
    %echo% %self.iname% запрыгнул в кусты.
    %echo% %self.iname% выбрался обратно, но уже без %object.rname%.
  break
done
~
#6517
Олени умирают~
0 f 100
~
*Олени умирают | Mobiles | Death | 100
%load% obj 6512
~
#6518
На пень кладут всякое~
1 z 100
~
*На пень кладут всякое | Objects | Auto | 100
if (!%vnum%)
  halt
end
if (%exist.obj(%vnum%)%)
  switch %vnum%
    case 6502
      set salt 1
      global salt
    break
    case 6511
      set bread 1
      global bread
    break
  done
  calcuid food %vnum% obj
  %echo% Вы положили %food.vname% на %self.vname%.
  wait 1
  %purge% %food%
end
wait 1
if ((!%bread%) || (!%salt%))
  %echo% 'Чего-то не хватает' - качнувшись, заскрипели деревья.
else
  %echo% 'Вот теперь другое дело' - просвистел ветер в деревьях.
  calcuid ohot 6500 mob
  set treba 1
  remote treba %ohot%
end
~
#6519
Хлеб-соль кладем~
1 h 100
~
*Хлеб-соль кладем | Objects | Drop | 100
if (%self.room% == 6521)
  calcuid stub 6513 obj
  eval vnum %self.vnum%
  remote vnum %stub%
  return 0
  wait 1
  exec 6518 %stub%
else
  return 1
end
~
#6520
Вошли к охотнику~
0 q 100
~
*Вошли к охотнику | Mobiles | Great PC | 100
if (%actor% != %quester%)
  halt
end
wait 1s
if (%check%)
  say Ну, давай сюда чего принес%actor.q%
  halt
end
удивл
say Уже обернул%actor.u%?
if (!%treba%)
  say А хозяин леса мне ничего не сообщал, странно
  say Видать требу ты не оставил%actor.g% как положено
  say Ступай доделывать
  halt
end
say Тут хозяин леса давеча заходил...
if (!%gotwater%)
  say Не принес%actor.q%, говорит, ты мне воды из ручья, что за оврагом
elseif ((!%birdsaved%) || (!%exist.obj(6505)%))
  say Не сладил%actor.g%, говорит, ты с птицами нашими, не подружил%actor.u%
elseif (!%deersaver%)
  say Говорит, раненой матери не помог%actor.q% уберечь ребенка
else
  say Сказал, что хорош%actor.g% ты как охотник и как человек
  say Ну, давай сюда чего принес%actor.q%
  set check 1
  global check
  attach 6521 %self%
end
~
#6521
Охотнику даем вещи~
0 j 100
~
*Охотнику даем вещи | Mobiles | Receive | 100
wait 1
foreach thing %self.objs%
  if ((%thing.vnum% < 6500) || (%thing.vnum% > 6599))
    wait 4
    say Эт мне не нужно
    брос %thing.iname%
  elseif (%thing.vnum% == 6500)
    say Так-с, сумка, что у нас в сумке?
    взять all охотничья.сумка
    %purge% %thing%
  end
done
wait 5
foreach item %self.objs%
  switch %item.vnum%
    case 6501
      wait 1s
      say Тебе разве больше не нужен топорик? Ну как хочешь
      wait 1
      %purge% %item%
    break
    case 6506
      wait 1s
      say Дрова... хорошие, сухие дрова, спасибо
      eval wood %wood%+2
      global wood
      wait 1
      %purge% %item%
    break
    case 6507
      wait 1s
      say Дрова... но зачем же было живое дерево губить? Ладно уж, высушу у печи
      eval wood %wood%+1
      global wood
      wait 1
      %purge% %item%
    break
    case 6510
      wait 1s
      say Фляжка... Ах, и вкусна же вода из этого ручья!
      eval can 1
      global can
      wait 1
      %purge% %item%
    break
    case 6512
      wait 1s
      say Ммм, волчье мяско, вкуснятина, благодарю за такое лакомство!
      eval food 1
      global food
      wait 1
      %purge% %item%
    break
    default
      wait 4
      say Эт мне не нужно
      брос %thing.iname%
    break
  done
done
if (%food% == 1) && (%can% == 1) && (%wood% >= 5)
  attach 6522 %self%
  exec 6522 %self%
  detach 6520 %self%
  detach 6521 %self%
end
~
#6522
Награда за квест~
0 z 100
~
*Награда за квест | Mobiles | Auto | 100
wait 1s
say Сослужил%quester.g% ты мне службу великую
if (!%quester.can_get_skill(разжечь костер)%)
  say Да мал%quester.g% ты еще слишком чтоб мою науку понять
  %echo% %self.iname% сунул Вам мешочек с кунами.
  eval temp %actor.gold(+1000)%
  say Прими хоть деньжат немного, пригодится небось
else
  say Награжу тебя чем смогу
  %echo% %self.iname% показал Вам как правильно разводить костер.
  mskillturn %quester% разжеч.костер set
  eval temp %quester.setquest(6500 %date.yday%)%
end
~
#6523
Топорик рожает птичку~
1 z 100
~
*Топорик рожает птичку | Objects | Auto | 100
wait 1
if (%exist.obj(6505)%)
  if (!%exist.mob(6501)%)
    if (!%birdshown%)
      %echo% Откуда ни возьмись, выскочила птичка-невеличка и стала вокруг Вас летать.
      %load% mob 6501
      calcuid birdy 6501 mob
      eval quester %self.carried_by%
      %force% %birdy% след .%quester.iname%
      calcuid nest 6505 obj
      set birdshown 1
      global birdshown
    else
      calcuid nest 6505 obj
      if (%nest.room% == %self.room%)
        calcuid ohot 6500 mob
        set birdsaved 0
        remote birdsaved %ohot%
        %echo% Из-за Вашей неосторожности птенцы в гнезде умерли.
        calcuid nest 6505 obj
        %purge% %nest%
      end
    end
  else
    calcuid birdy 6501 mob
    %echo% %birdy.iname% пуще прежнего стала виться вокруг да мешать работать.
  end
end
~
#6524
Дали что-то мавке~
0 j 100
~
*Дали что-то мавке | Mobiles | Receive | 100
wait 1
foreach item %self.objs%
  if (%item.vnum% == 6514)
    say Вот спасибочки
    %echo% %self.iname% скрылась в ручье, махнув на прощание хвостом.
    %purge% %item%
    %purge% %self%
    halt
  end
done
say Ах так!? Тогда ты отправишься со мной!
mkill %actor%
~
#6525
Сказали что-то мавке~
0 d 1
нет нету фиг хрен~
*Сказали что-то мавке | Mobiles | Speech | 1 | нет нету фиг хрен
wait 2
say Ах так!? Тогда ты отправишься со мной!
mkill %actor%
~
#6526
Дали кун смерду~
0 m 1
~
*Дали кун смерду | Mobiles | Bribe | 1
if (%actor.gold% > 0)
  wait 3
  say О, спасибочки
  %self.gold(0)%
  %echo% %self.iname% сделал непонятный резкий жест руками.
  %echo% Куны пропали из его рук как по волшебству.
  ухмыл
  wait 3
  say Но мне кажется ты еще не всем поделился со мной
  ссор
else
  wait 1s
  say Что ж, и на том спасибо
  say Пойду в кабак, чтоли, погуляю
  хихи
  %purge% %self%
end
~
#6527
Рипнули смерда~
0 f 100
~
*Рипнули смерда | Mobiles | Death | 100
%load% obj 6514
~
$~
