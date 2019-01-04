#69600
СнимаемВедерко~
2 c 0
снять~
if !%arg.contains(ведерко)%
  wsend %actor.name% Что Вы хотите снять?
else
  %send% %actor% _Вы попытались снять с крюка берестяное ведерко, 
  %send% %actor% _Но оно выскользнуло из Ваших рук и упало на землю.
  %echoaround% %actor% %actor.name% осторожно снял%actor.g% берестяное ведерко с крючка. 
  %echoaround% %actor% Но будучи неуклюжим созданием, уронил%actor.g% его на землю.
  wload obj 69601
  detach 69600 %self.id% 
end
~
#69601
ПоливаемЗемлюВПоле~
2 c 0
полить~
*wait 1s
*wecho actor test - %actor.name%
if !%arg.contains(землю)%
  wsend %actor.name% Что Вы хотите полить?
else
  if !%actor.haveobj(69601)%
    %send% %actor% Из чего поливать-то?!
  else
    calcuid tmp 69601 obj
    *Если емкость не пустая
    if %tmp.val1%>0
      **************
      %send% %actor% Взяв в руки берестяное ведерко, Вы вылили его содержимое на иссохшую от жары землю.
      %echoaround% %actor% %actor.name% взял%actor.g% в руки берестяное ведерко и вылил%actor.g% его содержимоена иссохшую от жары землю.
      *attach 69611 %tmp.id%
      *exec 69611 %tmp.id%
      *detach 69611 %tmp.id%
      wforce %actor.name% вылить ведерко земля
      *wpurge tmp.id
      *wload obj 
      **************
      wait 1
      switch %random.10%
        case 1
          *возмущается мышка
          if %world.curmobs(69600)%>0 
            %echo% _Огненная земля жадно поглотила живительную влагу.
            halt
          end 
          %load% mob 69600
          set v1 %actor%
          calcuid maus1 69600 mob
          *attach 69603 %maus1.id%
          remote v1 %maus1.id%
          exec 69603 %maus1.id%
          *detach 69603 %maus1.id%
        break
        case 2
          if  %world.curobjs(69607)%>1
            %echo% _Измученная безжалостным солнцем земля жадно поглотила живительную влагу.
            halt
          end
          *ожил колосок
          wait 1 
          wecho _&YВдруг из огненной земли начал прорастать пшеничный колосок.&n
          wload obj 69607
        break
        case 3
          if  %world.curobjs(69614)%>10
            %echo% _Измученная жарой земля жадно поглотила живительную влагу.
            halt
          end
          *растет василек
          wecho _&CНапоенный живительной влагой ожил и наполнился синевой неба василек.&n
          wload obj 69614
        break        
        default
          %echo% _Огненная земля жадно поглотила живительную влагу.
        break
      done
      
    else
      %send% %actor% Поливать из пустого ведра, как минимум, странно!
    end
  end
end
~
#69602
ПоливаемЗемлюВЛесу~
2 c 0
полить~
*wecho test quester - %quest696.name% actor - %actor.name%
if !%arg.contains(землю)%
  wsend %actor.name% Что Вы хотите полить?
else
  if !%actor.haveobj(69601)%
    %send% %actor% Из чего поливать-то?!
  else
    calcuid tmp 69601 obj
    *Если емкость не пустая
    if %tmp.val1%>0
      **************
      %send% %actor% _Взяв в руки берестяное ведерко, Вы вылили его содержимое на иссохшую от жары землю.
      %echoaround% %actor% %actor.name% взял%actor.g% в руки берестяное ведерко и вылил%actor.g% его содержимоена иссохшую от жары землю.
      wforce %actor.name% вылить ведерко земля
      **************
      wait 1
      switch %random.10%
        case 1
          *возмущается мышка
          if %world.curmobs(69601)%>0 
            %echo% _Капли влаги моментально исчезли в иссохшей земле, не оставляя даже следа.
            halt
          end
          %load% mob 69601
          set v1 %actor%
          calcuid maus1 69601 mob
          *attach 69603 %maus1.id%
          remote v1 %maus1.id%
          exec 69603 %maus1.id% 
        break
        case 2
          *ожил цветок
          if  %world.curobjs(69613)%>10
            %echo% _Измученная жарой земля жадно поглотила живительную влагу.
            halt
          end
          wecho _&CНапоенный живительной влагой ожил и наполнился голубизной синего неба лесной колокольчик.&n
          *Вдруг ожил напоенный живительной влагой и засверкал синевой ясного неба лесной колокольчик.
          wload obj 69613
        break
        case 3
          if  %world.curobjs(69608)%>5
            %echo% _Измученная безжалостным солнцем земля жадно поглотила живительную влагу.
            halt
          end
          *растет гриб
          wecho _&yВдруг среди засохшей травы показалась шляпка гриба-боровика.&y
          wload obj 69608 
        break        
        default
          %echo% _Огненная земля жадно поглотила живительную влагу.
        break
      done
      
    else
      %send% %actor% Поливать из пустого ведра, как минимум, странно!
    end
  end
end
~
#69603
ВозмущаетсяМышка~
0 z 0
~
wait 1s
%echo% _Из залитой водой норы выскочила возмущенная мышь.
эм стала отряхиваться и тысячи капель рассыпались вокруг, сверкая на солнце
wait 1s
г Ты это что же такое делаешь?!
wait 1s
%send% %v1% _Вне себя от возмущения мышь чуть не испепелила Вас взглядом черных глаз-бусинок.
%echoaround% %v1% _Вне себя от возмущения мышь чуть не испепелила %v1.rname% взглядом черных глаз-бусинок.
~
#69604
СлавимПерунаУВрат~
0 d 0
*~
*mecho %speech%
if %speech% == слава перуну
  *mecho %speech% 
  к !свет! %actor.name% 
  к !доблесть! %actor.name%
  к !освящение! %actor.name%
end
~
#69605
РубимЩепуСДуба~
2 c 0
рубить~
if !%arg.contains(щепу)%
  wsend %actor.name% Что рубим?
else
  %send% %actor% _Взяв в руки первый попавийся острый предмет, Вы размахнувшись, ударили по стволу дуба.
  %echoaround% %actor% %actor.name% схвати%actor.g% что-то в обе руки и, размахнувшись, удари%actor.g% по стволу дуба.
  wait 1s
  wecho _Разлетелись вокруг щепы от Дуба-Сыробуда отколотые!
  if %world.curobjs(69660)% < 17
    wload obj 69662
    wload obj 69662
    wload obj 69662
  end
  detach 69605 %self.id%
end
~
#69606
УмерЧернокрылыйВран~
0 f 0
~
switch %random.3%
  case 1
    if %random.100% < 10 && %world.curobjs(69663)% < 8
      mload obj 69663
    end 
  break
  case 2
    if %random.100% < 10 && %world.curobjs(69664)% < 8 
      mload obj 69664
    end 
  break
  case 3
    if %random.100% < 10 && %world.curobjs(69665)% < 8
      mload obj 69665
    end 
  break
  default 
    halt
  break 
done
~
#69607
ДалиЛеснойМышкеПредмет~
0 j 100
~
wait 1s
mtransform 69604
рад
wait 1s
mecho - Ну спасибо тебе добрый человек!
mecho - Не часто встретишь в глухом лесу добрых людей.
mecho - Поэтому я тоже в долгу не останусь...
wait 1s
*******************
switch %object.vnum%
  case 69607
    *если дали колосок
    if  %world.curobjs(69604)%>1
      %echo% _Внезапно откуда-то справа (а может быть слева) донесся шорох.
      wait 1s
      %echo% _Мышка испуганно пискнула и со всех ног бросилась в свою норку.
      halt
    end
    
    mecho _Вдруг мышка исчезла из виду,
    mecho _И через секунду уже вылезала из норки, держа что-то в лапах.
    wait 1s
    mpurge %object.id%
    mecho - Вот держи!
    mload obj 69604
    дать все %actor.name%
    wait 1s
    mecho - Когда эта земля стала умирать под палящим солнцем
    mecho - Я сохранила этот живой росток вьюнка
    mecho - Но ты не думай, он не простой!
    mecho - Где посадишь его, тут же прорастет он от Земли до Неба.
    mecho - Ну, а теперь мне пора.
    эм исчезла в ближайшей норке
    mpurge %self.id% 
  break 
  case 69614
    *если василек
    эм чихнула
    wait 1s
    эм сделала недовольную мордочку
    wait 1s
    mecho - Только следующий раз не надо поливать меня водой!
    взд
    wait 1s
    mecho - Так вот, о чем это я...
    эм закатила глаза к небу словно что-то вспоминая.
    wait 1s
    mecho - Далеко-далеко за высокими горами, за бескрайними полями,
    mecho - Во чертогах самого Перуна-Батюшки цветет голубой ирис о шести лепестках. 
    mecho - Как раз очень похож на этот василек.
    mecho - Никто не знает где именно он растет,
    mecho - Но говорят, кто добудет его, приобретет власть над кладами сокрытыми в земле.
    mecho - А в нашем лесу много кладов...
    эм многозначительно махнула лапой в неопределенном направлении
    wait 1s
    mecho - Ну, а теперь мне пора.
    эм исчезла в ближайшей норке
    mpurge %object.id%
    mpurge %self.id% 
  break 
  ***********
  default 
    mpurge %object.id%
    mecho _Вдруг мышка исчезла из виду,
    mecho _И через секунду уже вылезала из норки, держа что-то в лапах.
    wait 1s
    mload obj 69615
    дать все %actor.name%
    wait 1s
    mecho - Ну, а теперь мне пора.
    эм исчезла в ближайшей норке
    mpurge %self.id%
  break 
done
~
#69608
ПоливаемВьюн~
1 c 100
полить~
*wait 1s
*wecho actor test - %actor.name%
if !%arg.contains(вьюн)%
  wsend %actor.name% Что Вы хотите полить?
else
  if !%actor.haveobj(69601)%
    %send% %actor% Из чего поливать-то?!
  else
    calcuid tmp 69601 obj
    *Если емкость не пустая
    if %tmp.val1%>0
      %send% %actor% Взяв в руки берестяное ведерко, Вы вылили его содержимое под корень вьюна.
      %echoaround% %actor% %actor.name% взял%actor.q% в руки берестяное ведерко и вылил%actor.q% его содержимое под корень вьюна.
      wait 1s
      *oecho  Наполнился вьюн новыми силами!
      * oecho  Окрепшие корни змеями утекали в расщелину, сдвигая камни и делая ее все шире и шире.
      *oecho  Рос-рос окрепший вьюн, тянулся к солнцу пока не достал до самого неба!
      *входы
      calcuid trm 69610 room
      attach 69634 %trm.id%
      exec 69634 %trm.id%
      detach 69634 %trm.id%
      *otransform  69605
      
    else
      %send% %actor% Поливать из пустого ведра, как минимум, странно!
    end
  end
end
detach 69608 %self%
~
#69609
ВстречаетБелка~
2 e 100
~
*wait 1s
*wecho test quester - %quest696.name% actor - %actor.name%
* *если зашел квестер
if %actor.name% == %quest696.name%
  wait 1s
  wecho _Из листвы векового дуба выпрыгнула пушистая белочка.
  wload mob 69614
  calcuid belka 69614 mob
  remote quest696 %belka.id%
  wait 1s
  wecho Пушистая белочка сказала:
  wecho - Привет, странник!
  wecho - Прослышала я что ты помочь в нашей беде хочешь.
  wecho - Только мне не очень верится что справишься ты.
  wforce белочка бре
  wait 1s
  wecho - Коли отгадаешь ты загадки мои, то и я помогу тебе.
  wecho - Согласен? Или боишься?
  detach 69609 %self.id%
  attach 69690 %self.id%
end
~
#69610
БросаемПоленьяСевер~
2 h 100
~
if ( %object.vnum% == 69612 )
  wait 1s
  eval flag_kol_vo_drov %flag_kol_vo_drov%+1
  global flag_kol_vo_drov
  if %flag_kol_vo_drov% < 4
    wecho _Взметнулся к небу пепел потухшего костра.
    *удаляем кинутое полено
    wpurge %object%
    if %flag_kol_vo_drov% == 1
      *удаляем потухшее кострище
      if ( %world.curobjs(69628)% > 0 ) 
        *проверяем наличие чтоб не спамило
        calcuid kostr 69628 obj
        wpurge %kostr%
      end
      *лоад крады дров
      wload obj 69630
    end
    if %flag_kol_vo_drov% == 2
      *wecho test (2)  %flag_kol_vo_drov%
    end
    if %flag_kol_vo_drov% == 3
      *если все поленья положили
      *атачим триг костра
      attach 69623 %self%
    end
  else
    %send% %actor% _Может хватит уже?
  end
end
~
#69611
ОтгадываемБелкиныЗагадки~
0 d 1
*~
*mecho %speech% %arg.words%--- ждем ответа номер %n_word% 
if %actor.name% == %quest696.name% 
  switch %speech%
    case солнце
      if %n_word% == 1
        *mecho 1
        set fl_good 1
      end
    break
    case эхо
      if %n_word% == 2
        *mecho 2
        set fl_good 1
      end
    break
    case паук
      if %n_word% == 3
        *mecho 3
        set fl_good 1
      end
    break
    case белка
      if %n_word% == 4
        *mecho 4
        set fl_good 1
      end
    break
    case календарь
      if %n_word% == 5
        *mecho 5
        set fl_good 1
      end
    break
    default
      set fl_good 0
    break
  done
  wait 1s
  if %fl_good% == 1
    кив
    say Молодец! Угадал!
    wait 1s
    say Ну чтож, вот твои дрова, которые ты ищешь.
    wait 1s
    эм взмахнула хвостом и откуда не возьмись под дубом появилась поленница дров
    calcuid tmp_room 69617 room
    attach 69620 %tmp_room.id%
    exec 69620 %tmp_room.id%
    detach 69620 %tmp_room.id%
    wait 1s
    say А с остальным справишься сам! 
    эм исчезла в сумраке ветвей
    mpurge %self.id%
  else
    нет
  end
else
  wait 1s
  хму %actor.name%
  mecho - А ты кто такой?!
end
~
#69612
УмерРатай~
0 f 100
~
switch %random.2%
  case 1
    *плащ
    if %random.100% < 30 && %world.curobjs(69616)% < 8
      mload obj 69616
    end
  break
  case 2
    *колесо
    if %random.100% < 30 && %world.curobjs(69617)% < 8
      mload obj 69617
    end
  break
  default
  break
done
~
#69613
ВстречаетОблакогонитель~
0 r 100
~
wait 1s
эм поклонился на все четыре стороны
wait 1s
mecho Волхв-облакогонитель рек:
mecho - Уж ты гой еси Перун-Батюшка
mecho - Возгреми ты громами в Небе Ясном
mecho - Ты напои Мать Сыру-Землю студеной росой
mecho - Чтобы понесла она зерно, всколыхала его
mecho - Возвратила нам большим колосом!
mecho - Гой! Слава!
wait 5s
mecho _&YВсе также равнодушно смотрит небо синее, да безжалостно палит солнце жаркое.&n
wait 1s
эм вздохнул горько
wait 5s
mecho _Наконец волхв заметил Ваше присутствие.
wait 1s
mecho Волхв-облакогонитель сказал:
mecho - Здравствуй, добрый человек!
mecho - Вижу чужой ты на этой земле.
mecho - Коли воин ты хоробрый не подсобишь ли ты в моей беде?
mecho - Совсем отчаялся я.
эм устало опустился на раскаленную землю
wait 1s
вопро
attach 69614 %self.id%
~
#69614
ПомогуОблакогонителю~
0 d 0
да помогу смогу подсоблю~
wait 1s
кив
wait 1s
mecho - Тогда слушай
mecho - Четверть века назад остановился Коловрат и воцарилась на этой земле Ярь Огненная
mecho - Все колодцы испиты, все реки высушены, озера обмельчали
mecho - Гибнет и зверь и птица во Геенне Огненной
гру
wait 1s
mecho - Каждый год я прихожу сюда и молю о дожде Бога Нашего - Перуна Громовержца
mecho - Дабы выехал Он на огненной колеснице во хлябь небесную,
mecho - Да разрубил бы Секирою Громовою рать нежити хмарной, что сие творит.
mecho - Да разил бы он черного супостата промаха не ведая.
mecho - И лилася бы потоками во Сыру-Землю черная кровь.
mecho - Огнем Перуновым в Живую воду обращенная.
mecho - И встало бы на полях, той водою напоенных, высокое жито.
mecho - Честным пахарям да всей Родной Земле на славу!
взд
wait 1s
mecho - И сейчас уже сто дней и сто ночей радею я о дожде, да о милости Божьей.
mecho - Даже иногда сбираются тучи темные, затмевают Небо Синее,
mecho - И даже слышится где-то, очень далеко, отголоски Перунова Грома.
mecho - Но вскоре уходит нежить хмарная непобежденной во свою обитель Закатную.
взд
wait 1s
mecho - Вот теперь ты знаешь беду нашу.
mecho - И по прежнему готов%actor.g% нам помочь?
attach 69615 %self.id%
detach 69613 %self.id%
detach 69614 %self.id%
~
#69615
ГотовОблакогонителю~
0 d 0
готов готова~
calcuid trm 69617 room
attach 69609 %trm.id%
set quest696 %actor%
*global quest696
remote quest696 %trm.id%
calcuid trm1 69633 mob
remote quest696 %trm1.id%
calcuid trm2 69603 mob
remote quest696 %trm2.id%
wait 1s
mecho - Труден будет путь твой - во чертоги самого Перуна-Батюшки
mecho - Я бы сам пошел, но стар уже и немощен.
mecho - А преодолеть путь к Богу Нашему может только сильный воин 
mecho - Телом сильный, да духом крепкий.
эм задумался, словно что-то вспоминая
wait 1s
mecho - Да, чуть не забыл!
mecho - Если ты сумеешь разжечь снова костры по четырем Сторонам Света,
mecho - Я смогу перенести тебя прямо ко вратам огненным Крепи Перуновой.
mecho - Необходимо для свершения того - крада дров дубовых, 
mecho - И огневище Священное, дабы возжечь пламень ярый во славу Божью.
mecho - Огневище у меня и теперь я передаю его тебе
mload obj 69627
wait 1s
дать огневи %actor.name%
mecho - Теперь иди!
wait 1s
эм погрузился в тяжелое ожидание
detach 69615 %self.id%
~
#69616
ГрыземЩепу~
1 c 2
грызть~
if %arg.contains(щепу)%
  %send% %actor% _Вы вонзились зубами в щепу могучего дерева.
  %echoaround% %actor% _%actor.name% начал%actor.g% судорожно грызть щепу Дуба-Сыродуба.
  set buf %actor.hitp(+%random.50%)%
  wait 1s
  opurge %self.id%
else
  %send% %actor% _Чего грызем?
end
~
#69617
ПентаОблакогонителя~
2 cz 100
~
wportal 69643 2
~
#69618
СогласенБелке~
0 d 0
согласен согласна~
detach 69619 %self.id%
wait 1s
say Ну слушай загадку...
wait 2s
switch %random.5%
  case 1
    set n_word 1
    mecho - Что выше леса,
    mecho - Краше света,
    mecho - Без огня горит?
  break
  case 2
    set n_word 2
    mecho - Никто его не видывал,
    mecho - А слышать всякий слыхивал,
    mecho - Без тела, а живет,
    mecho - Без языка, а кричит
    mecho - Кто это?
  break
  case 3
    set n_word 3
    mecho - Ниток много-много,
    mecho - А в клубок не смотает,
    mecho - Одежды себе не шьет,
    mecho - А ткань всегда ткет.
    mecho - Кто такой?
  break
  case 4
    set n_word 4
    mecho - Не мышь, не птица,
    mecho - В лесу резвится,
    mecho - На деревьях живет
    mecho - И орешки грызет.
    mecho - Кто это?
  break
  case 5
    set n_word 5
    mecho - Годовой кусточек
    mecho - Каждый день пройдет роняет листочек,
    mecho - Год пройдет - весь опадет
    mecho - О чем это я?
  break
  default 
    halt
  break 
done 
global n_word
attach 69611 %self.id%
detach 69618 %self.id%
~
#69619
БоюсьБелке~
0 d 0
боюсь~
*wait 1s
*wecho test quester - %quest696.name% actor - %actor.name%
if %actor.name% == %quest696.name%
  wait 1s
  взд
  wait 1s
  mecho Пушистая белочка рассерженно сказала:
  mecho - Я так и знала!
  эм начала беспокойно бегать по ветке взад-вперед
  wait 2s
  mecho - Но кроме тебя все равно никого нет!
  mecho - Так что придется тебе помочь, без меня ты пропадешь!
  эм успокоилась и уселась на ветку, свесив рыжий хвост
  wait 3s
  mecho - Во-первых, вот твои дрова, которые ты ищешь.
  wait 1s
  эм взмахнула хвостом и откуда не возьмись под дубом появилась поленница дров
  calcuid tmp_room 69617 room
  attach 69620 %tmp_room.id%
  exec 69620 %tmp_room.id%
  detach 69620 %tmp_room.id%
  if %world.curobjs(69629)% < 17
    wait 3s
    mecho - Во-вторых, вот тебе священные ветви дуба.
    mecho - В трудную минуту бросишь их на землю, и ты и други твои почувствуют себя лучше.
    mecho - Я надеюсь, тебе хватит ума применить волшебную силу Священных Ветвей вовремя!
    wait 1s
    mload obj 69629
    mload obj 69629
    mload obj 69629
    дать все %actor.name%
  end
  взд
  wait 1s
  mecho - Это пожалуй все! 
  эм исчезла в сумраке ветвей
  mpurge %self.id%
else
  wait 1s
  хму %actor.name%
  mecho - А ты кто такой?!
end
~
#69620
ЛоадДров~
2 z 0
~
wload obj 69612
wload obj 69612
wload obj 69612
wload obj 69612
wload obj 69612
wload obj 69612
wload obj 69612
wload obj 69612
wload obj 69612
wload obj 69612
wload obj 69612
wload obj 69612
~
#69621
БросилиВетвьНаЗемлю~
1 h 100
~
wait 1s
oecho Как достигла Священная Ветвь земли, так рассыпалась в прах, даря каждому немного здоровья.
foreach i %self.pc%
  eval delta %i.maxhitp%-%i.hitp%
  *oecho %delta%
  if %delta%>0
    set buf %i.hitp(+%random.200%)%
  end
done
%purge% %self%
~
#69622
БросаемРосток~
2 h 100
~
if %object.vnum% == 69604
  wait 1s
  wpurge %object.id%
  wecho _Как достиг росток земли, тут же укоренился он корнями поперек трещины.
  wecho _И стал расти-ширится, оплетать ветвями камни горячие!
  wait 1s
  wecho _Затрещал-застонал камень прочный, но не поддался еще слабым плетям вьюнка.
  wload obj 69654
  calcuid vrn 69610 room
  attach 69608 %vrn%
end
~
#69623
РазжигаемКостерСевер~
2 c 0
разжечь~
if !%arg.contains(костер)%
  wsend %actor.name% Что разжигаем?
else
  if %actor.haveobj(69627)% 
    %send% %actor% _Вы поднесли Священное огневище к дубовым поленьям.
    if %actor.sex% == 1 
      %echoaround% %actor% %actor.name% поднес Священное огневище к дубовым поленьям.
    else
      %echoaround% %actor% %actor.name% поднесла Священное огневище к дубовым поленьям.
    end
    wait 1s
    wecho &RВмиг разгорелось, затрещало пламя Священного костра.&n
    *убираем краду
    calcuid krada 69630 obj
    wpurge %krada.id%
    *лоадим костер
    wload obj 69645
    *флаг для волхва
    calcuid volxv 69603 mob
    *attach 69624 %volxv.id%
    set sever_yes 1
    remote sever_yes %volxv.id%
    detach 69623 %self.id%
  else 
    wsend %actor.name% Чего-то не хватает.
  end
end
~
#69624
ВошлиКВолхву~
0 r 100
~
wait 1s
*mecho sever_yes %sever_yes%  vostok_yes %vostok_yes% ug_yes %ug_yes% zapad_yes %zapad_yes% квестер %quest696.name%
if %actor.name% == %quest696.name%
  if %ug_yes%  != 1
    *mecho 1
    halt
  end
  if %sever_yes% != 1
    *mecho 2
    halt
  end
  if %zapad_yes% != 1 
    *mecho 3
    halt
  end
  if %vostok_yes% != 1
    *mecho 4
    halt
  end
  *set nom_variant 1
  кив
  wait 1s
  mecho - Да, теперь я могу отправить тебя в Крепь Перунову.
  mecho - И помни:
  mecho - Не тот есть истинный Воин, кто меч в руках держит,
  mecho - Но тот, кто Сердцем своим все трудности да невзгоды преодолевает!
  wait 1s
  mecho - Да пребудут с тобою Боги!
  wait 2s
  calcuid mpt 69627 room
  attach 69633 %mpt.id%
  exec 69633 %mpt.id% 
  detach 69633 %self.id%
  *mecho -- %nom_variant%
  *
  detach 69624 %self.id% 
end
~
#69625
БросаемПоленьяЮг~
2 h 100
~
if %object.vnum% == 69612
  wait 1s
  eval flag_kol_vo_drov %flag_kol_vo_drov%+1
  global flag_kol_vo_drov
  if %flag_kol_vo_drov% < 4
    wecho _Взметнулся к небу пепел потухшего костра.
    *удаляем кинутое полено
    wpurge %object%
    if %flag_kol_vo_drov% == 1
      *удаляем потухшее кострище
      if ( %world.curobjs(69642)% > 0 )  
        calcuid kostr 69642 obj
        wpurge %kostr%
      end
      *лоад крады дров
      wload obj 69639
    end
    if %flag_kol_vo_drov% == 2
      *wecho test (2)  %flag_kol_vo_drov%
    end
    if %flag_kol_vo_drov% == 3
      *если все поленья положили
      *атачим триг костра
      attach 69628 %self%
    end
  else
    %send% %actor% _Может хватит уже?
  end
  *
end
~
#69626
БросаемПоленьяЗапад~
2 h 100
~
if %object.vnum% == 69612
  wait 1s
  eval flag_kol_vo_drov %flag_kol_vo_drov%+1
  global flag_kol_vo_drov
  if %flag_kol_vo_drov% < 4
    wecho _Взметнулся к небу пепел потухшего костра.
    *удаляем кинутое полено
    wpurge %object%
    if %flag_kol_vo_drov% == 1
      *удаляем потухшее кострище
      if ( %world.curobjs(69643)% > 0 ) 
        *проверяем наличие чтоб не спамило   
        calcuid kostr 69643 obj
        wpurge %kostr%
      end
      *лоад крады дров
      wload obj 69640
    end
    if %flag_kol_vo_drov% == 2
      *wecho test (2)  %flag_kol_vo_drov%
    end
    if %flag_kol_vo_drov% == 3
      *если все поленья положили
      *атачим триг костра
      attach 69629 %self% 
    end
  else
    %send% %actor% _Может хватит уже?
  end
  *
end
~
#69627
БросаемПоленьяВосток~
2 h 100
~
if %object.vnum% == 69612
  wait 1s
  eval flag_kol_vo_drov %flag_kol_vo_drov%+1
  global flag_kol_vo_drov
  if %flag_kol_vo_drov% < 4
    wecho _Взметнулся к небу пепел потухшего костра.
    *удаляем кинутое полено
    wpurge %object%
    if %flag_kol_vo_drov% == 1
      *удаляем потухшее кострище
      if ( %world.curobjs(69644)% > 0 ) 
        *проверяем наличие чтоб не спамило 
        calcuid kostr 69644 obj
        wpurge %kostr%
      end
      *лоад крады дров
      wload obj 69641
    end
    if %flag_kol_vo_drov% == 2
      *wecho test (2)  %flag_kol_vo_drov%
    end
    if %flag_kol_vo_drov% == 3
      *если все поленья положили
      *атачим триг костра
      attach 69630 %self% 
    end
  else
    %send% %actor% _Может хватит уже?
  end
  *
end
~
#69628
РазжигаемКостерЮг~
2 c 0
разжечь~
if !%arg.contains(костер)%
  wsend %actor.name% Что разжигаем?
else
  if %actor.haveobj(69627)% 
    %send% %actor% _Вы поднесли Священное огневище к дубовым поленьям.
    if %actor.sex% == 1 
      %echoaround% %actor% %actor.name% поднес Священное огневище к дубовым поленьям.
    else
      %echoaround% %actor% %actor.name% поднесла Священное огневище к дубовым поленьям.
    end
    wait 1s
    wecho &RВмиг разгорелось, затрещало пламя Священного костра.&n
    *убираем краду
    calcuid krada 69639 obj
    wpurge %krada.id%
    *лоадим костер
    wload obj 69645
    *флаг для волхва
    calcuid volxv 69603 mob
    *attach 69624 %volxv.id%
    set ug_yes 1
    remote ug_yes %volxv.id%
    detach 69628 %self.id%
  else 
    wsend %actor.name% Чего-то не хватает.
  end
end
~
#69629
РазжигаемКостерЗапад~
2 c 0
разжечь~
if !%arg.contains(костер)%
  wsend %actor.name% Что разжигаем?
else
  if %actor.haveobj(69627)% 
    %send% %actor% _Вы поднесли Священное огневище к дубовым поленьям.
    if %actor.sex% == 1 
      %echoaround% %actor% %actor.name% поднес Священное огневище к дубовым поленьям.
    else
      %echoaround% %actor% %actor.name% поднесла Священное огневище к дубовым поленьям.
    end
    wait 1s
    wecho &RВмиг разгорелось, затрещало пламя Священного костра.&n
    *убираем краду
    calcuid krada 69640 obj
    wpurge %krada.id%
    *лоадим костер
    wload obj 69645
    *флаг для волхва
    calcuid volxv 69603 mob
    set zapad_yes 1
    remote zapad_yes %volxv.id%
    *wecho zapad_yes %zapad_yes%
    detach 69629 %self.id%
  else 
    wsend %actor.name% Чего-то не хватает.
  end
end
~
#69630
РазжигаемКостерВосток~
2 c 0
разжечь~
if !%arg.contains(костер)%
  wsend %actor.name% Что разжигаем?
else
  if %actor.haveobj(69627)% 
    %send% %actor% _Вы поднесли Священное огневище к дубовым поленьям.
    if %actor.sex% == 1 
      %echoaround% %actor% %actor.name% поднес Священное огневище к дубовым поленьям.
    else
      %echoaround% %actor% %actor.name% поднесла Священное огневище к дубовым поленьям.
    end
    wait 1s
    wecho &RВмиг разгорелось, затрещало пламя Священного костра.&n
    *убираем краду
    calcuid krada 69641 obj
    wpurge %krada.id%
    *лоадим костер
    wload obj 69645
    *флаг для волхва
    calcuid volxv 69603 mob
    *attach 69624 %volxv.id%
    set vostok_yes 1
    remote vostok_yes %volxv.id%
    detach 69630 %self.id%
  else 
    wsend %actor.name% Чего-то не хватает.
  end
end
~
#69631
РезетЗоны~
2 f 100
~
* *удалить зажженные костры и крады
if %exist.obj(69645)% == 1 
  calcuid iu 69645 obj
  %purge% %iu.id%
end
if %exist.obj(69645)% == 1 
  calcuid iu 69645 obj
  %purge% %iu.id%
end
if %exist.obj(69645)% == 1 
  calcuid iu 69645 obj
  %purge% %iu.id%
end
if %exist.obj(69645)% == 1 
  calcuid iu 69645 obj
  %purge% %iu.id%
end
if %exist.obj(69639)% == 1 
  calcuid iu 69639 obj
  %purge% %iu.id%
end
if %exist.obj(69640)% == 1 
  calcuid iu 69640 obj
  %purge% %iu.id%
end
if %exist.obj(69630)% == 1 
  calcuid iu 69630 obj
  %purge% %iu.id%
end
if %exist.obj(69641)% == 1 
  calcuid iu 69641 obj
  %purge% %iu.id%
end
***
*удалить вьюн
if %exist.obj(69605)% == 1
  calcuid viu 69605 obj
  %purge% %viu.id% 
end
*очищаем переменные флагов 
calcuid r1 69626 room
attach 69668 %r1.id% 
exec 69668 %r1.id%
*детач разжигания костров 
detach 69623 %r1.id%  
*
calcuid r2 69624 room
attach 69668 %r2.id% 
exec 69668 %r2.id% 
*детач разжигания костров 
detach 69629 %r1.id%  
*
calcuid r3 69625 room
attach 69668 %r3.id% 
exec 69668 %r3.id% 
*детач разжигания костров 
detach 69628 %r1.id%  
*
calcuid r4 69623 room
attach 69668 %r4.id% 
exec 69668 %r4.id% 
*детач разжигания костров 
detach 69630 %r1.id%  
*
* 
*атач трига встрчает облакогонитель
calcuid volxv 69603 mob
attach 69613 %volxv.id%
attach 69624 %volxv.id%
*
*убирем триг на клад с клетки с белкой
detach 69690 %self.id%
* 
* 
***
*приатачить тригера не пройти перуну не проехати клетки 89 80 85 84 
calcuid r5 69689 room
attach 69638 %r5.id% 
*
calcuid r6 69680 room
attach 69644 %r6.id% 
*
calcuid r7 69685 room
attach 69652 %r7.id% 
*
calcuid r8 69684 room
attach 69657 %r8.id% 
*закрыть открытые входы клетки 79 83 73 89 92 10
calcuid r10 69679 room 
attach 69679 %r10.id% 
exec 69679 %r10.id% 
detach 69679 %r10.id%
*
calcuid r11 69683 room 
attach 69680 %r11.id% 
exec 69680 %r11.id% 
detach 69680 %r11.id%
*
calcuid r12 69673 room 
attach 69681 %r12.id% 
exec 69681 %r12.id% 
detach 69681 %r12.id%
*
calcuid r13 69689 room 
attach 69682 %r13.id% 
exec 69682 %r13.id% 
detach 69682 %r13.id% 
*
calcuid r14 69692 room 
attach 69684 %r14.id% 
exec 69684 %r14.id% 
detach 69684 %r14.id% 
*
calcuid r15 69610 room 
attach 69683 %r15.id% 
exec 69683 %r15.id% 
detach 69683 %r15.id% 
*********************
*
calcuid r31 69610 room 
attach 69694 %r31.id% 
exec 69694 %r31.id% 
detach 69694 %r31.id%  
*восстанавливаем радужные триги клетки 92 91 90 93 94 95 96
calcuid r21 69692 room 
attach 69686 %r21.id% 
*
calcuid r22 69691 room 
attach 69687 %r22.id% 
*
calcuid r23 69690 room 
attach 69688 %r23.id% 
*
calcuid r24 69693 room 
attach 69689 %r24.id%  
*
calcuid r25 69694 room 
attach 69691 %r25.id%  
*
calcuid r26 69695 room 
attach 69692 %r26.id%  
*
calcuid r27 69696 room 
attach 69693 %r27.id%  
*ведерко
calcuid r41 69605 room
attach 69600 %r41.id%  
*меч
* 
calcuid r42 69664 room
attach 69685 %r42.id%   
*щепы
calcuid r43 69678 room
attach 69605 %r43.id%   
*триг обнаружения квестера
calcuid rq1 69644 room
attach 85221 %rq1% 
~
#69632
УмерлиГарцуки~
0 f 0
~
mecho _Взвился предсмертный крик горных духов к небу.
mecho _Ударило крыло в последний раз о каменные своды.
*wait 1s
mecho _Задрожала скала мелкой дрожью и осыпалась вниз каменным дождем
*wait 1s
* -200 хитов по списку
set nHit 200
foreach i %self.pc%
  mdamage %i% %nHit%
done  
*лоад камней* 
switch %random.5%
  case 1
    if %random.100% < 20 && %world.curobjs(69649)% < 10
      mload obj 69649
    end 
  break
  case 2
    if %random.100% < 20 && %world.curobjs(69650)% < 10 
      mload obj 69650
    end 
  break
  case 3
    if %random.100% < 20 && %world.curobjs(69651)% < 10
      mload obj 69651
    end 
  break
  case 4
    if %random.100% < 20 && %world.curobjs(69652)% < 10
      mload obj 69652
    end 
  break
  case 5
    if %random.100% < 20 && %world.curobjs(69653)% < 10
      mload obj 69653
    end 
  break
  default 
    halt
  break 
done 
~
#69633
ПентаВолхва~
2 z 100
~
wportal 69643 2
~
#69634
ОткрываемВходыВьюн~
2 hz 100
~
wecho _Наполнился вьюн новыми силами!
wecho _Окрепшие корни змеями утекали в расщелину, сдвигая камни и делая ее все шире и шире.
wecho _Рос-рос окрепший вьюн, тянулся к солнцу пока не достал до самого неба! 
wdoor 69610 down room 69635
wdoor 69610 up room 69653
~
#69635
ВстречаетПерун~
0 r 100
~
wait 1s
осм %actor.name%
mecho - Коли дошел ты сюда, значит храбро сердце твое и горит в руках острый меч.
mecho - Знаю зачем пришел ты сюда, воин.
взд
wait 1s
mecho - Вот уже много лет царит на земле Ярь Огненная - солнце палящее.
mecho - Потому как не могу я победить нежить хмарную и пролить кровь ее в проливным дождем.
эм опечалился
wait 1s
mecho - Снова и снова выходил я на Битву Великую
mecho - Но каждый раз одолевала меня рать темная - слуги Змеевы.
mecho - И не жити честным пахарям во радости.
mecho - И не сбирать с полей высокое жито.
эм склонил буйну голову во глубокой печали.
wait 1s
mecho - Уж коли пришел ты сюда, воин
mecho - Помоги разбить черного супостата
mecho - Небеса свидетели одарю я тебя по заслугам!
вопрос
attach 69636 %self.id%
~
#69636
СогласенПеруну~
0 d 0
да помогу~
set quest696_2 %actor%
*remote quest696_2 %trm.id%
*mecho %quest696_2.name% =---------- 
calcuid trm1 69633 mob
remote quest696_2 %trm1.id%
wait 1s
кив
mecho - Иди за мной и все увидишь сам!
mecho - И помни, ни одной твари поганой нельзя упустить.
wait 1s
calcuid tmp_room 69672 room
attach 69637 %tmp_room.id%
exec 69637 %tmp_room.id%
detach 69637 %tmp_room.id%
вверх
mtransform 69607
detach 69635 %self.id%
detach 69636 %self.id%
~
#69637
ОткрываемВходНаНебо~
2 z 0
~
wdoor 69672 up room 69689
~
#69638
Вход89~
2 e 100
~
wait 1s
%echo% __&RЕхал Бог Перун на Коне-Огне&n
%echo% __&RЕхал битися-ратоватися&n
%echo% __&RСо горынищем - Лютым Змеищем&n
wait 1s
%echo% __&RКак прознал про то змеище горынище&n
%echo% __&RПосылал навстречь он ползучих змей&n
%echo% __&RЗмей ползучих-то коим счету нет&n
%echo% __&RСвоих отпрысков тьму великую&n
wait 1s
%echo% __&RОползли черны змеи все пути&n
%echo% __&RНе пройти Перуну, не проехати!&n
wait 3s
* *лоад змей
*ползучие
calcuid nTroom1 69689 room
attach 69639 %nTroom1.id%
exec 69639 %nTroom1.id% 
detach 69639 %nTroom1.id%
*агр змеи на перуна 
wait 1s 
wecho _Из клубов черного дыма появилась змея. 
wforce змея эм оценивающе омотрела каждого с ног до головы
wait 1s
wforce змея уд перун
*
calcuid nTroom2 69697 room
attach 69639 %nTroom2.id%
exec 69639 %nTroom2.id% 
detach 69639 %nTroom2.id% 
*
calcuid nTroom3 69679 room
attach 69639 %nTroom3.id%
exec 69639 %nTroom3.id% 
detach 69639 %nTroom3.id% 
*
calcuid nTroom4 69688 room
attach 69639 %nTroom4.id%
exec 69639 %nTroom4.id% 
detach 69639 %nTroom4.id%
*змееныши
calcuid nTroom5 69697 room
attach 69640 %nTroom5.id%
exec 69640 %nTroom5.id% 
detach 69640 %nTroom5.id%
*
calcuid nTroom6 69679 room
attach 69640 %nTroom6.id%
exec 69640 %nTroom6.id% 
detach 69640 %nTroom6.id% 
* 
calcuid nTroom7 69688 room
attach 69640 %nTroom7.id%
exec 69640 %nTroom7.id% 
detach 69640 %nTroom7.id% 
*черная змея
calcuid nTroom8 69679 room
attach 69641 %nTroom8.id%
exec 69641 %nTroom8.id% 
detach 69641 %nTroom8.id%  
******
detach 69638 %self.id% 
~
#69639
ЛоадПолзучихЗмей~
2 z 100
~
wload mob 69624
~
#69640
ЛоадЗмеенышей~
2 z 100
~
wload mob 69625
wload mob 69625
~
#69641
ЛоадЧернойЗмеи~
2 z 100
~
wload mob 69626
~
#69642
УмерлиЗмейки~
0 f 100
~
*если нет живых змей открываем вход и лоадим перуна в новом месте
eval tmpz %world.curmobs(69624)% + %world.curmobs(69625)% + %world.curmobs(69626)%
*mecho %world.curmobs(69624)% -- %world.curmobs(69625)% -- %world.curmobs(69626)% -dctuj- %tmpz%
if %tmpz% == 1
  *load
  calcuid vpr 69607 mob
  mteleport %vpr% 69680
  
  calcuid nTroom2 69689 room
  attach 69649 %nTroom2%
  exec 69649 %nTroom2%
  detach 69649 %nTroom2%
  ***
  if %world.curobjs(69675)% < 2
    *mload obj 69675
  end 
  *** 
  switch %random.2%
    case 1
      if ( ( %random.1000% < 201 ) && ( %world.curobjs(69674)% < 6 ) )
        mload obj 69674
      end 
    break
    case 2
      if ( ( %random.1000% < 201 ) && ( %world.curobjs(69673)% < 3 ) )
        mload obj 69673
      end 
    break
    default 
      halt
    break 
  done   
end
~
#69643
ЛоадПеруна~
2 z 100
~
wload mob 69607
~
#69644
Вход80~
2 e 100
~
wait 1s
%echo% __&RЕхал Бог Перун на Коне-Огне&n
%echo% __&RЕхал битися-ратоватися&n
%echo% __&RСо горынищем - Лютым Змеищем&n
wait 1s
%echo% __&RКак прознал про то змеище горынище&n
%echo% __&RПосылал встречь Перуну стаю волчию&n
%echo% __&RПосылал лютых зверей поперек пути&n
%echo% __&RНе пройти Перуну, не проехати!&n
wait 3s
* *лоад волков
*лютые
calcuid nTroom1 69680 room
attach 69645 %nTroom1.id%
exec 69645 %nTroom1.id% 
detach 69645 %nTroom1.id%
*агр змеи на перуна 
wait 1s 
wecho _Из клубов черного дыма, оскалившись, вышел черный зверь.
wforce вол эм оглянулся в поисках жертвы
wait 1s
wforce волк уд перун 
*
calcuid nTroom2 69682 room
attach 69645 %nTroom2.id%
exec 69645 %nTroom2.id% 
detach 69645 %nTroom2.id% 
*
calcuid nTroom3 69683 room
attach 69645 %nTroom3.id%
exec 69645 %nTroom3.id% 
detach 69645 %nTroom3.id% 
*
calcuid nTroom4 69681 room
attach 69645 %nTroom4.id%
exec 69645 %nTroom4.id% 
detach 69645 %nTroom4.id%
*призраки
calcuid nTroom5 69682 room
attach 69646 %nTroom5.id%
exec 69646 %nTroom5.id% 
detach 69646 %nTroom5.id%
*
calcuid nTroom6 69683 room
attach 69646 %nTroom6.id%
exec 69646 %nTroom6.id% 
detach 69646 %nTroom6.id% 
* 
calcuid nTroom7 69681 room
attach 69646 %nTroom7.id%
exec 69646 %nTroom7.id% 
detach 69646 %nTroom7.id% 
*оборотень
calcuid nTroom8 69683 room
attach 69647 %nTroom8.id%
exec 69647 %nTroom8.id% 
detach 69647 %nTroom8.id%  
******
detach 69644 %self.id% 
~
#69645
ЛоадЛютыхЗверей~
2 z 100
~
wload mob 69627
~
#69646
ЛоадСерыхПризраков~
2 z 100
~
wload mob 69628
wload mob 69628
~
#69647
ЛоадОборотня~
2 z 100
~
wload mob 69629
~
#69648
УмерлиВолки~
0 f 100
~
*если нет живых  открываем вход и лоадим перуна в новом месте
eval tmpz %world.curmobs(69627)% + %world.curmobs(69628)% + %world.curmobs(69629)% 
if %tmpz% == 1
  calcuid vpr 69607 mob
  mteleport %vpr% 69685
  *load
  *calcuid nTroom1 69685 room
  *attach 69643 %nTroom1.id%
  *exec 69643 %nTroom1.id% 
  *detach 69643 %nTroom1.id% 
  *открываем выход на запад
  calcuid nTroom2 69683 room
  attach 69650 %nTroom2.id%
  exec 69650 %nTroom2.id% 
  detach 69650 %nTroom2.id% 
  switch %random.3%
    case 1
      if %random.100% < 20 && %world.curobjs(69678)% < 5
        mload obj 69678
      end 
    break
    case 2
      if %random.100% < 20 && %world.curobjs(69679)% < 5
        mload obj 69679
      end 
    break
    case 3
      if %random.100% < 20 && %world.curobjs(69680)% < 5
        mload obj 69680
      end 
    break
    default 
      halt
    break 
  done   
  *
  *calcuid nTroom3 69680 room
  *attach 69659 %nTroom3.id%
  *exec 69659 %nTroom3.id% 
  *detach 69659 %nTroom3.id%  
end
~
#69649
Выход79~
2 z 0
~
wdoor 69679 west room 69680
~
#69650
Выход83~
2 z 0
~
wdoor 69683 west room 69685
~
#69651
Выход73~
2 z 0
~
wdoor 69673 west room 69684
~
#69652
Вход85~
2 e 100
~
wait 1s
%echo% __&RЕхал Бог Перун на Коне-Огне&n
%echo% __&RЕхал битися-ратоватися&n
%echo% __&RСо горынищем - Лютым Змеищем&n
wait 1s
%echo% __&RКак прознал про то змеище горынище&n
%echo% __&RНапускал Перуну встречь черное врание&n
%echo% __&RЧерно врание грозит очи выклевать&n
%echo% __&RНалетает тучей, бьет-машет крыльями&n
%echo% __&RСтеной черной стало врание на пути&n
%echo% __&RНе пройти Перуну, не проехати!&n
wait 3s
* *лоад воронов
*воронье
calcuid nTroom1 69685 room
attach 69654 %nTroom1.id%
exec 69654 %nTroom1.id% 
detach 69654 %nTroom1.id%
*агр на перуна 
wait 1s 
wecho _Из клубов черного дыма, сверкая черным опереньем, вылетел вран.
wforce ворон эм оглянулся, выискивая жертву
wait 1s
wforce вор уд перун
*
calcuid nTroom2 69687 room
attach 69654 %nTroom2.id%
exec 69654 %nTroom2.id% 
detach 69654 %nTroom2.id% 
*
calcuid nTroom3 69673 room
attach 69654 %nTroom3.id%
exec 69654 %nTroom3.id% 
detach 69654 %nTroom3.id% 
*
calcuid nTroom4 69686 room
attach 69654 %nTroom4.id%
exec 69654 %nTroom4.id% 
detach 69654 %nTroom4.id%
*воронье
calcuid nTroom5 69687 room
attach 69653 %nTroom5.id%
exec 69653 %nTroom5.id% 
detach 69653 %nTroom5.id%
*
calcuid nTroom6 69673 room
attach 69653 %nTroom6.id%
exec 69653 %nTroom6.id% 
detach 69653 %nTroom6.id% 
* 
calcuid nTroom7 69686 room
attach 69653 %nTroom7.id%
exec 69653 %nTroom7.id% 
detach 69653 %nTroom7.id% 
*царь ворон
calcuid nTroom8 69673 room
attach 69655 %nTroom8.id%
exec 69655 %nTroom8.id% 
detach 69655 %nTroom8.id%  
******
detach 69652 %self.id% 
~
#69653
ЛоадВоронья~
2 z 100
~
wload mob 69630
wload mob 69630
~
#69654
ЛоадВещихВоронов~
2 z 100
~
wload mob 69631
~
#69655
ЛоадЦаряВорона~
2 z 100
~
wload mob 69632
~
#69656
УмерлиВороны~
0 f 100
~
*если нет живых змей открываем вход и лоадим перуна в новом месте
*if %world.curmobs(69630)% == 1 && %world.curmobs(69631)% == 1 && %world.curmobs(69632)% == 1
if (%world.curmobs(69630)% + %world.curmobs(69631)% + %world.curmobs(69632)%) == 1
  calcuid vpr 69607 mob
  mteleport %vpr% 69684
  *load
  *calcuid nTroom1 69684 room
  *attach 69643 %nTroom1.id%
  *exec 69643 %nTroom1.id% 
  *detach 69643 %nTroom1.id% 
  *открываем выход на запад
  calcuid nTroom2 69673 room
  attach 69651 %nTroom2.id%
  exec 69651 %nTroom2.id% 
  detach 69651 %nTroom2.id% 
  if %random.100% < 20 && %world.curobjs(69678)% < 3
    mload obj 69681
  end 
  *
  *calcuid nTroom3 69685 room
  *attach 69659 %nTroom3.id%
  *exec 69659 %nTroom3.id% 
  *detach 69659 %nTroom3.id% 
end
~
#69657
Вход84~
2 e 100
~
wait 1s
%echo% __&RЕхал Бог Перун на Коне-Огне&n
%echo% __&RЕхал битися-ратоватися&n
%echo% __&RСо горынищем - Лютым Змеищем&n
wait 1s
%echo% __&RПодъезжал Перун ко змееву логову&n
%echo% __&RВызывал Перун врага тут на смертный бой!&n
detach 69657 %self.id% 
~
#69658
ВходимКЗмею~
0 r 100
~
*mecho %quest696_2% =----------%quest696_3%
if %flag_black_altar% == 1
  хих
  mecho _Как ударил Змей хвостом оземь, так посыпались из Ваших глаз искры.
  mteleport all 69639
  mteleport %self% 69639
  хих
  wait 5s
  рад %quest696_3.name%
  say Знаю, возносил требы ты Богу моему, тем самым продлевая мне жизнь!
  say За это достоин ты награды!
  switch %random.5%
    case 1
      if %random.100% < 50 && %world.curobjs(69655)% < 10
        mload obj 69655
      else 
        %self.gold(+10000)%
        дать 10000 кун %quest696_3.name%
      end 
    break
    case 2
      if %random.100% < 50 && %world.curobjs(69659)% < 10 
        mload obj 69659
      else 
        %self.gold(+10000)%
        дать 10000 кун %quest696_3.name%
      end 
    break
    case 3
      if %random.100% < 50 && %world.curobjs(69656)% < 10
        mload obj 69656
      else 
        %self.gold(+10000)%
        дать 10000 кун %quest696_3.name%
      end 
    break
    case 4
      if %random.100% < 50 && %world.curobjs(69657)% < 10
        mload obj 69657
      else 
        %self.gold(+10000)%
        дать 10000 кун %quest696_3.name%
      end 
    break
    case 5
      if %random.100% < 50 && %world.curobjs(69658)% < 10
        mload obj 69658
      else 
        %self.gold(+10000)%
        дать 10000 кун %quest696_3.name%
      end 
    break
    default 
    break 
  done
  дать все %quest696_3.name%
  wait 1s
  say Ну теперь можешь идти!
  say Ты заходи, если что!
  хих
  wait 1s
  mecho _Как ударил Змей хвостом оземь, так осыпались каменные своды, открывая путь вверх.
  *открываем выход вверх
  calcuid nTroom2 69639 room
  attach 69661 %nTroom2.id%
  exec 69661 %nTroom2.id% 
  detach 69661 %nTroom2.id% 
  mpurge %self.id%
else
  атак %actor.name%
end
~
#69659
УбираемПеруна~
2 z 100
~
calcuid perun 69607 mob
%purge% %perun.id%
~
#69660
ОкропляемКровьюКамень~
2 c 0
окропить~
if !%arg.contains(камень)%
  wsend %actor.name% Что окропляем?
else
  set quest696_3 %actor%
  set flag_black_altar 1
  calcuid trm1 69633 mob
  remote quest696_3 %trm1.id%
  remote flag_black_altar %trm1.id%
  %send% %actor% Схватив первый попавшийся острый предмет, Вы резанули себе по венам.
  %echoaround% %actor% %actor.name% схватил%actor.g% первый попавшийся острый предмет и резанул%actor.g% себе по венам.
  wait 1s
  wecho _Закапала на Черный Камень алая руда-кровь.  
  wait 2s
  set nHit 100
  wdamage %actor% %nHit%
  %send% %actor% Ничего не изменилось в окружающем мире, но Вы знаете - услышал Вас Кощный Бог!
  %echoaround% %actor% %actor.name% схвати%actor.q% первый попавшийся острый предмет и резанул%actor.q% себе по венам.
end
~
#69661
ВыходСАлтаря~
2 z 0
~
wdoor 69639 up room 69610
~
#69662
УмерЗмей~
0 f 100
~
*mecho %quest696_2.name% ----------------
*mload obj 69676
*награда перуна 
calcuid nPerun 69607 mob
attach 69664 %nPerun.id% 
*
*награда облакогонителя
calcuid nVolxv 69603 mob
attach 69667 %nVolxv.id%  
remote quest696 %nVolxv.id%
*detach 69624 %nVolxv.id%
* 
calcuid nTroom2 69675 room
attach 69663 %nTroom2.id%
exec 69663 %nTroom2.id% 
*
calcuid trm1 69607 mob
remote quest696_2 %trm1.id%
*detach 69663 %nTroom2.id% 
~
#69663
ЗакончилсяБой~
2 z 0
~
wait 1s
wecho _&gИ вот, наконец, окончен бой - разбита темная рать.&n
wait 1s
wecho _&gПотоками льется, уходит во Сыру-Землю черная кровь, Огнем Перуновым в Живую Воду обращенная.&n
wait 1s
wecho _&gУносится куда-то вдаль - за виднокрай по Ра-Дуге Небесная Колесница Грозового Бога
wecho _&gИ лежит под нею Земля, Небом как плащом укрытая, дождевою водою напоенная,&n 
wecho _&gГрозовым ливнем омытая.&n
wait 1s
wecho _&gШумят-волнуются Дубравы Священные, Громовержца славя.&n
wait 1s
wecho _&gТянет колосья тяжелые-полные к Ясному Небу Синему золотая рожь.&n
wecho _&gИ встает на полях, Водою напоенных, высокое жито - честным пахарям да всей Земле во славу!&n
~
#69664
НаградаПеруна~
0 r 100
~
*mecho %quest696_2.name% -----
if %actor.name% == %quest696_2.name%
  wait 1s
  say Выполнил%actor.g% ты обещание свое
  say Теперь пришла пора мне свое обещание сдержать!
  *
  wait 1s 
  switch %random.3%
    case 1
      if ( ( %random.1000% < 301 ) && ( %world.curobjs(69618)% < 5 ) )
        mload obj 69618
        say Пусть эта палица хранит тебе жизнь и Роду твоему!
        дать все %quest696_2.name%
      end 
    break
    case 2
      if ( ( %random.1000% < 301 ) && ( %world.curobjs(69660)% < 5 ) )
        mload obj 69660
        say Пусть этот лук хранит тебе жизнь и Роду твоему!
        дать все %quest696_2.name%
      end 
    break
    case 3
      if ( ( %random.1000% < 301 ) && ( %world.curobjs(69647)% < 5 ) )
        mload obj 69647
        say Коли будет этот колчан с тобой, да прибудешь ты во здравии как и Род твой!
        дать все %quest696_2.name%
      end 
    break
    default 
      halt
    break 
  done  
  wait 2s
  wait 1s
  mecho _Как ударил Перун громовой палицей по небесам, так задрожало небо!
  wait 1s
  mecho _И опустилась к Земле-Матушке Ра-Дуга сияющим коромыслом!
  wait 2s
  *открываем входы в радугу
  say Вот твой путь к Родному дому!
  say Да смотри, по сторонам оглядывайся! Запоминай! 
  wait 1s
  эм улыбнулся в бороду и исчез
  calcuid nTroom2 69684 room
  attach 69666 %nTroom2%
  exec 69666 %nTroom2%
  detach 69666 %nTroom2%
  mpurge %self%
end
~
#69665
ДалиПолевойМышкеПредмет~
0 j 100
~
wait 1s
mtransform 69604
рад
wait 1s
mecho - Ну спасибо тебе добрый человек!
mecho - Не часто встретишь в глухом лесу добрых людей.
mecho - Поэтому я тоже в долгу не останусь...
wait 1s
*******************
switch %object.vnum%
  case 69608
    *если дали гриб
    if  %world.curobjs(69604)%>1
      %echo% _Внезапно откуда-то справа (а может быть слева) донесся шорох.
      wait 1s
      %echo% _Мышка испуганно пискнула и со всех ног бросилась в свою норку.
      mpurge %self%
      halt
    end
    
    mecho _Вдруг мышка исчезла из виду,
    mecho _И через секунду уже вылезала из норки, держа что-то в лапах.
    wait 1s
    mpurge %object.id%
    mecho - Вот держи!
    mload obj 69604
    дать все %actor.name%
    wait 1s
    mecho - Когда эта земля стала умирать под палящим солнцем
    mecho - Я сохранила этот живой росток вьюнка
    mecho - Но ты не думай, он не простой!
    mecho - Где посадишь его, тут же прорастет он от Земли до Неба.
    mecho - Ну, а теперь мне пора.
    эм исчезла в ближайшей норке
    mpurge %self.id% 
  break 
  case 69613
    *если колокольчик
    эм чихнула
    wait 1s
    эм сделала недовольную мордочку
    wait 1s
    mecho - Только следующий раз не надо поливать меня водой!
    взд
    wait 1s
    mecho - Ой! Я где-то видела уже подобный цветок...
    эм закатила глаза к небу словно что-то вспоминая.
    wait 1s
    mecho - Да-да, вспомнила...
    mecho - Когда-то очень давно, во времена молодости моей бабушки
    mecho - Одна из мышей нашла небывалой красоты цветок
    mecho - В его синеве можно было увидеть сияние небесных глубин
    mecho - И с тех пор мы храним его передавая из поколения в поколение
    mecho - Никто не знает что это за цветок, но все знают что не место ему под землей
    mecho - Поэтому возьми ты его
    эм загадочно улыбнулась
    mpurge %object.id%
    mload obj 69682
    дать все %actor.name%
    wait 1s
    mecho - Ну, а теперь мне пора.
    эм исчезла в ближайшей норке
    mpurge %self.id% 
  break 
  ***********
  default 
    mpurge %object.id%
    mecho _Вдруг мышка исчезла из виду,
    mecho _И через секунду уже вылезала из норки, держа что-то в лапах.
    wait 1s
    mload obj 69615
    дать все %actor.name%
    wait 1s
    mecho - Ну, а теперь мне пора.
    эм исчезла в ближайшей норке
    mpurge %self.id%
  break 
done
~
#69666
ВходНаРадугу~
2 z 0
~
wdoor 69684 down room 69692
~
#69667
НаградаОблакогонителя~
0 r 100
~
*mecho %quest696.name% -----
if %actor.name% == %quest696.name%
  wait 1s
  mecho _Волхв поднялся навстречу вошедшим и сияло в его глазах счастье! 
  mecho _А может быть это было лишь отражение радуги или мокрой листвы, то нам неведомо!
  wait 1s
  ул %quest696.name%
  say Я верил, что победят Родные Боги нечисть хмарную! 
  say И верил в тебя, воин!
  поклон %quest696.name%
  wait 1s
  say Вот возьми от меня на память
  *
  wait 1s 
  switch %random.3%
    case 1
      if %random.100% < 20 && %world.curobjs(69625)% < 10
        mload obj 69625
        дать все %quest696.name%
      else
        %self.gold(+10000)%
        дать 10000 кун %quest696.name%
      end 
    break
    case 2
      if %random.100% < 20 && %world.curobjs(69626)% < 10
        mload obj 69626
        дать все %quest696.name%
      else
        %self.gold(+10000)%
        дать 10000 кун %quest696.name%
      end 
    break
    case 3
      if %random.100% < 20 && %world.curobjs(69648)% < 10
        mload obj 69648
        дать все %quest696.name%
      else
        %self.gold(+10000)%
        дать 10000 кун %quest696.name%
      end 
    break
    default 
      halt
    break 
  done  
  if %self.haveobj(85135)%
    wait 1s
    г Погоди, это тебе тоже пригодится...
    дать идол %quest696.name%
  end
  detach 69667 %self.id% 
end
~
#69668
УдаляемКостер~
2 z 0
~
unset flag_kol_vo_drov
~
#69669
УмерлиКониОгни~
0 f 0
~
if %random.100% < 30 && %world.curobjs(69624)% < 15
  mload obj 69624
end 
~
#69670
УмерлаУтица~
0 f 0
~
if %random.100% < 30 && %world.curobjs(69661)% < 7
  mload obj 69661
end 
~
#69671
УмерлСоколОгнеперый~
0 f 0
~
if %random.100% < 30 && %world.curobjs(69623)% < 5
  mload obj 69623
end 
~
#69672
УмерлиБлискавицы~
0 f 0
~
switch %random.3%
  case 1
    if %random.100% < 20 && %world.curobjs(69619)% < 20
      mload obj 69619
    end 
  break
  case 2
    if %random.100% < 20 && %world.curobjs(69646)% < 10 
      mload obj 69646
    end 
  break
  case 3
    if %random.100% < 20 && %world.curobjs(69651)% < 10
      mload obj 69622
    end 
  break
  default 
    halt
  break 
done 
~
#69673
УмерлВитязь~
0 f 0
~
if %random.100% < 30 && %world.curobjs(69666)% < 6
  mload obj 69666
end 
~
#69674
УмерлаДива~
0 f 0
~
switch %random.3%
  case 1
    if %random.100% < 20 && %world.curobjs(69667)% < 6
      mload obj 69667
    end 
  break
  case 2
    if %random.100% < 20 && %world.curobjs(69668)% < 6
      mload obj 69668
    end 
  break
  case 3
    if %random.100% < 20 && %world.curobjs(69669)% < 6
      mload obj 69669
    end 
  break
  default 
    halt
  break 
done 
~
#69675
УмерлиБарашки~
0 f 0
~
if %random.100% < 30 && %world.curobjs(69670)% < 14
  mload obj 69670
end 
~
#69676
УмерлиКрасныеВолки~
0 f 0
~
if %random.100% < 30 && %world.curobjs(69671)% < 14
  mload obj 69671
end 
~
#69677
УмерлиКуропатки~
0 f 0
~
if %random.100% < 30 && %world.curobjs(69672)% < 14
  mload obj 69672
end 
~
#69678
ОткрылиЛарец~
1 p 100
~
oecho  _Как открылся ларец змеев, так повеяло вокруг холодом...
switch %random.3%
  case 1
    if %random.1000% < 301  %world.curobjs(69659)% < 10
      oload obj 69659
    end 
  break
  case 2
    if %random.1000% < 301 && %world.curobjs(69658)% < 10
      oload obj 69658
    end 
  break
  case 3
    if %random.1000% < 301 && %world.curobjs(69656)% < 10
      oload obj 69656
    end 
  break
  default 
  break 
done 
detach 69678 %self%
~
#69679
УбираемВыход79~
2 z 0
~
wdoor 69679 west purge
~
#69680
УбираемВыход83~
2 z 0
~
wdoor 69683 west purge
~
#69681
УбираемВыход73~
2 z 0
~
wdoor 69673 west purge
~
#69682
УбираемВходНаНебо~
2 z 0
~
wdoor 69672 up purge
~
#69683
УбираемВыходСАлтаря~
2 z 0
~
wdoor 69639 up purge
~
#69684
УбираемВходНаРадугу~
2 z 0
~
wdoor 69684 down purge
~
#69685
ВытаскиваемМечИзГорна~
2 c 0
вытащить~
if !%arg.contains(меч)%
  wsend %actor.name% Что вытаскиваем?
else
  wait 1s
  if %random.100% < 20 && %world.curobjs(69621)% < 5
    wload obj 69621
    %send% %actor% _Вы потянулись к жару кузнечного горна и, несмотря на боль ожогов, вытащили меч
    %send% %actor% _Но не смогли удержать в руках огненный металл и со звоном уронили его на землю.
    %echoaround% %actor% %actor.name% закричал%actor.g% от боли когда жаркое пламя коснулось его рук, но таки вытащил меч.
    %echoaround% %actor% Но %actor.name% не смог удержать раскаленный меч в рука и с визгом бросил его на земь.
  else
    %send% %actor% _Вы потянулись к жару кузнечного горна, но рукоятка меча увильнула от Вас, исчезнув в огне.
    %echoaround% %actor% %actor.name% потяну%actor.u% к жару кузнечного горна, но рукоятка меча увильнула от него и исчезла.
  end
  detach 69685 %self.id%
end
~
#69686
ВошлиКраснаяРадуга92~
2 e 100
~
if ( ( %random.1000% < 101 ) && ( %world.curobjs(69632)% < 5 ) )
  wait 2s
  wecho _Вдруг Вы услышали приближающийся шелест, словно шуршат крылья невидимой птицы.
  wait 1s
  wecho _С тихим шорохом опустилась к Вашим ногам красная лента Ра-Дуги.
  wload obj 69632
end
detach 69686 %self%
~
#69687
ВошлиОранжеваяРадуга91~
2 e 100
~
if ( ( %random.1000% < 101 ) && ( %world.curobjs(69633)% < 5 ) )
  wait 2s
  wecho _Вдруг Вы услышали приближающийся шелест, словно шуршат крылья невидимой птицы.
  wait 1s
  wecho _С тихим шорохом опустилась к Вашим ногам оранжевая лента Ра-Дуги.
  wload obj 69633
end
detach 69687 %self%
~
#69688
ВошлиЖелтаяРадуга90~
2 e 100
~
if ( ( %random.1000% < 101 ) && ( %world.curobjs(69634)% < 5 ) )
  wait 2s
  wecho _Вдруг Вы услышали приближающийся шелест, словно шуршат крылья невидимой птицы.
  wait 1s
  wecho _С тихим шорохом опустилась к Вашим ногам желтая лента Ра-Дуги.
  wload obj 69634
end
detach 69688 %self%
~
#69689
ВошлиЗеленаяРадуга93~
2 e 100
~
if ( ( %random.1000% < 101 ) && ( %world.curobjs(69635)% < 5 ) )
  wait 2s
  wecho _Вдруг Вы услышали приближающийся шелест, словно шуршат крылья невидимой птицы.
  wait 1s
  wecho _С тихим шорохом опустилась к Вашим ногам зеленая лента Ра-Дуги.
  wload obj 69635
end
detach 69689 %self%
~
#69690
ИщемКладВЛесу~
2 e 100
~
if %actor.haveobj(69606)%
  wait 1s
  %send% %actor% _Тихо шагая по лесу, Вы то и дело прислушиваетесь, да присматриваетесь в поисках клада...
  if %random.100% < 5
    %send% %actor% Вдруг засиял в ваших руках Перунов цвет! И предстал пред Вами старинный клад!
    %echoaround% %actor% Вдруг засиял в руках у %actor.rname% синим огнем Перунов Цвет!.
    wload obj 69677
    calcuid percvet 69606 obj
    wpurge %percvet.id%
  end
end
~
#69691
ВошлиГолубаяРадуга94~
2 e 100
~
if %random.1000% < 501
  wait 1s
  wecho _&CЗасиял светом неземным, затмевая синь небесную Перунов цвет.&n
  wload obj 69606
end
if %random.1000% < 101  %world.curobjs(69636)% < 5
  wait 2s
  wecho _Вдруг Вы услышали приближающийся шелест, словно шуршат крылья невидимой птицы.
  wait 1s
  wecho _С тихим шорохом опустилась к Вашим ногам голубая лента Ра-Дуги.
  wload obj 69636
end
detach 69691 %self%
~
#69692
ВошлиСиняяРадуга95~
2 e 100
~
if ( ( %random.1000%  < 101 ) && ( %world.curobjs(69637)% < 5) )
  wait 2s
  wecho _Вдруг Вы услышали приближающийся шелест, словно шуршат крылья невидимой птицы.
  wait 1s
  wecho _С тихим шорохом опустилась к Вашим ногам синяя лента Ра-Дуги.
  wload obj 69637
end
detach 69692 %self%
~
#69693
ВошлиФиолетоваяРадуга96~
2 e 100
~
if ( ( %random.1000% < 101 ) && ( %world.curobjs(69638)% < 5 ) )
  wait 2s
  wecho _Вдруг Вы услышали приближающийся шелест, словно шуршат крылья невидимой птицы.
  wait 1s
  wecho _С тихим шорохом опустилась к Вашим ногам фиолетовая лента Ра-Дуги.
  wload obj 69638
end
detach 69693 %self%
~
#69694
УбираемВыходыВьюна~
2 ez 100
~
wdoor 69610 down purge
wdoor 69610 up purge
~
#69695
Предупреждение1~
0 r 100
~
if %actor.class% == 4
  %actor.wait(3)%
  mecho _ 
  mecho Налетел горячий ветер, словно о чем-то предупреждая...
  сказ %actor.name% Что тебе надо здесь?&n
  сказ %actor.name% Не место на земле богов тем, кто кровь без нужды разливает...&n
  сказ %actor.name% Уходи, убойца...&n
end
~
#69696
Предупреждение2~
0 r 100
~
if %actor.class% == 4
  %actor.wait(5)%
  wait 1s
  mecho &r_Угрожающе завыл огненный ветер в в тишине Перуновой земли.&n
  сказ %actor.name% Зачем пожаловал?
  сказ %actor.name% Не место на священной земле тем, кто кровь без нужды разливает...
  сказ %actor.name% Уходи по хорошему, убойца...
end
~
#69697
Предупреждение3~
0 r 100
~
*последнее предупреждение
if %actor.class% == 4
  %actor.wait(10)%
  wait 1s
  %send% %actor% &R_Уходи, убойца!
  %send% %actor% &R_Остатний раз упреждаю, уходи... - прошелестело вдали.
  %send% %actor% &R_Не место на священной земле тем, кто кровь без нужды разливает...
  wait 1s
  mecho &C_Взметнулся огненный вихрь обжигающим знаменьем.&n
  %send% %actor% &C_В единое мгновение окутал Вас горячий сумрак, огнем обжигая - жизнь отнимая.&n
  %echoaround% %actor% &C_В единое мгновение окутал горячий сумрак %actor.rname%, огнем обжигая - жизнь отнимая.&n
  eval nHit %actor.hitp%-1
  mdamage %actor% %nHit%
end
~
#69698
СмертьНаемам~
0 r 100
~
*если предупреждениям не внемлют
if %actor.class% == 4
  wait 1s
  %send% %actor% &R_Ведь тебя упреждали, убойца... - еле слышно прошелестело вдали.
  %send% %actor% &R_Теперь пеняй на себя...
  wait 1s
  mecho _Задрожал от напряжения воздух - словно спустился сам Грозный Бог с неба.
  %send% %actor% _Ударила в землю молния, оставляя от Вас лишь кучку пепла.
  %echoaround% %actor% _СУдарила в землю молния, оставляя от %actor.rname% кчку пепла.
  eval nHit %actor.hitp%+11
  mdamage %actor% %nHit%
end
~
$~
