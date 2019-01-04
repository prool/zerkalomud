#77600
стафРК~
1 ghijlt 100
~
wait 1
if (%actor.clan% == рк ) || (%actor.vnum% == 77601 )
  halt
end
wait 1
%purge% %self%
~
#77601
получаемскакуна~
1 c 2
прочитать~
if %actor.clan% != рк
  wait 1
  opurge %self%
  halt
end
if %arg.contains(ленточка)%
  osend %actor% _Вы начали читать руны на ленточке...
  oechoaround %actor% _%actor.iname% начал%actor.g% шепотом читать серебренные руны на ленточке...
  if %world.curmobs(77609)% > 30
    osend %actor% _И ничего не произошло.
    halt
  end
  oload mob 77609 
  wait 1
  opurge %self%
end 
~
#77602
прогнатьскакуна~
0 c 1
топ~
if (%actor.clan%)!=рк
  msend %actor% _\&RСкакун не захотел видеть Вас своим хозяином...
  halt
else
  mechoaround %actor% _\&G%actor.iname% резко потянул поводья и жеребец грустно заржал !!!\&w
  msend %actor% _\&WЖеребец грустно заржал попрощавшись с Вами !!!
  mload obj 77630
  дать лент %actor.name%
  wait 1
  mpurge %self%
  halt
end
~
#77603
волкрычитнанеприятеля~
0 r 100
~
wait 1
if %actor.clan% != рк
  эмоц оскалился и зарычал
else
  эмоц завилял хвостом
end
~
#77604
выдача ключа~
0 d 3
ключ~
wait 1s
вздох
wait 2s
if (%world.curobjs(77629)% < 10)
  mecho Бкладовщик достал из кармана бронзовый ключик.
  wait 2s
  say  Возьми его, он долго пылился тут без дела.
  mload obj 77629
  wait 2s
  дат бронз %actor.name%
end
~
#77605
богатырьвпускаетнаарену~
0 d 8
готов~
wait 1s
mecho Богатырь Нисон открыл заборчик и сказал:'Удачи'
mechoaround %actor% Богатырь Нисон пропустил %actor.dname% на арену.
wait 2
wsend %actor% ... Вы прошли на территорию арены.
mteleport %actor% 77632
wechoaround %actor% Кто-то вошел на арену и оказался здесь.
end
~
#77606
вопросарена~
0 r 100
~
wait 1s
г Привет воин!
wait 1s
г Готов%actor.g% ли ты проверить свою силушку и сразиться на арене?
~
#77607
возвратсарены~
2 c 100
перепрыгнуть~
if !(%arg.contains(заборчик)%) 
  wsend %actor% Что вы хотите перепрыгнуть?
  return 0
  halt
end
wsend %actor% Разбежавшись, вы прыгнули через заборчик.
wechoaround %actor% Разбежавшись, %actor.name% перепрыгнул%actor.g% через заборчик.
wait 1s
wsend %actor% ... Вы оказались с другой стороны заборчика.
wteleport %actor% 77631
wechoaround %actor% Кто-то перепрыгнул заборчик и оказался здесь.
~
#77608
Команды волка~
0 d 1
встать сесть~
wait 1
if (%actor% != %self.leader%)
  msend %actor% Волк сумрачно посмотрел на Вас, оскалился и зарычал.
  mechoaround %actor% Волк сумрачно посмотрел на %actor.vname%, оскалился и зарычал.
  halt
end
if %speech% == встать
  stand
else
  rest
end
~
#77609
Загрузка волка~
1 c 2
подбросить~
wait 1
if !%arg.contains(клубок)%
  osend %actor% Что бросить хотите?
  halt
end
if %actor.clan% != рк
  osend %actor% Вы подбросили клубок черной шерсти в воздух, но ничего не произошло.
  halt
end
if %world.curmobs(77611)% > 50
  osend %actor% ...и ничего не произошло!
  halt
end
oload mob 77611
osend %actor% Вы подбросили клубок черной шерсти.
oechoaround %actor% %actor.name% подбросил%actor.g% в воздух клубок черной шерсти.
oecho Клубок черной шерсти исчез в яркой вспышке.
oecho Громадный черный волк возник здесь!
oforce %actor% оседлать волк
wait 1
opurge %self%
~
#77610
Почесать волка~
0 c 1
почесать~
wait 1
if %self.fighting%
  halt
end
if !%arg.contains(волка)%
  msend %actor% _Кого вы хотите почесать?
  halt
end
if ((%actor.clan% != рк) || (%self.leader% && (%self.leader% != %actor%)))
  msend %actor%  вы попытались прикоснутсья к волку.
  msend %actor%  Волк грозно зарычал и лязгнул зубами!
  mechoaround %actor% %actor.name% попытал%actor.u% прикоснуться к волку.
  mechoaround %actor%  Волк едва не откусил %actor.dname% руку!
  eval dmg %actor.hitp%/5
  mdamage %actor% %dmg%
  halt
end
msend %actor% Вы почесали волка за ухом.
mechoaround %actor% %actor.name% почесал%actor.g% волка за ухом.
mload obj 77635
mecho Волк резко уменьшился и превратисля в невзрачный клубок черной шерсти.
give клубок .%actor.name%
wait 1
mpurge %self%
~
#77611
Волк убит~
0 f 100
~
mload obj 77635
~
#77620
Дикей_кланстафа~
1 ghj 100
~
if %actor.vnum% != -1
  halt
end
if %actor.clan% != рк
  wait 2
  %send% %actor% Перед Вами появился огромный призрачный волк.
  %echoaround% %actor% Перед %actor.tname% появился огромный призрачный волк.
  wait 1
  %echo% Громко клацнув зубами, волк рассыпался серебряными брызгами, забрав с собой %self.iname%.
  wait 1
  opurge %self%
end
~
#77621
Выдача_кланстафа~
0 d 0
экипировка оружие~
if %actor.clan% != рк
  wait 1
  say Извини, %actor.iname%, для тебя у меня ничего нет.
  halt
endif
wait 1
if %speech% == экипировка
  if %actor.bank% >= 855
    %actor.bank(-855)%
  else
    if %actor.gold% >= 855
      %actor.gold(-855)%
    else
      say Но у тебя нет денег!
      halt
    endif
  endif
  say Подожди тут пару минут, сейчас соберу все необходимое.
  wait 1
  %echo% Кладовщик принялся шарить по полкам в поисках снаряжения
  mload obj 77605
  mload obj 77606
  mload obj 77607
  mload obj 77608
  mload obj 77609
  mload obj 77610
  mload obj 77611
  mload obj 77612
  mload obj 77613
  mload obj 77614
  mload obj 77615
  mload obj 77615
  mload obj 77617
  mload obj 77617
  mload obj 77632
  mload obj 139
  wait 2
  say Безоружн%actor.w% пойдешь, %actor.iname%?
  %echo% Кладовщик неодобрительно хмыкнул.
  wait 2
  полож все кошел
  дать кошел .%actor.name%
endif
if %speech.car% == оружие
  %echo% Кладовщик полез в ящик с оружием.
  extract weapon 2 %speech%
  switch %weapon%
    case Ятаган
      set price 50
      mload obj 77618
    break
    case Двуруч
      set price 75
      mload obj 77621
    break
    case Меч
      set price 30
      mload obj 77619
    break
    case Кинжал
      set price 7
      mload obj 77620
    break
    case Посох
      set price 30
      mload obj 77622
    break
    case Лук
      set price 40
      mload obj 77623
    break
    case Щит
      set price 80
      mload obj 77616
    break
    default
      say Нет у меня такого оружия, выбирай внимательнее.
      %echo% - Ятаган - длинные лезвия
      %echo% - Двуруч - двуручный меч
      %echo% - Меч - проникающее оружие
      %echo% - Кинжал - короткие лезвия
      %echo% - Посох - палицы и дубины
      %echo% - Лук - лук
      halt
    break
  done
  if %actor.bank% >= %price%
    %actor.bank(-%price%)%
  else
    if %actor.gold% >= %price%
      %actor.gold(-%price%)%
    else
      say Но у тебя нет денег!
      %purge% %weapon%
      halt
    endif
  endif
  say Вот, пусть он поможет тебе в бою!
  дать %weapon% .%actor.name%
endif
~
#77622
Песня_сказителя~
0 q 100
~
wait 1s
mecho Сказитель поправил струны, и тихо запел.
wait 1s
eval skazitel %random.8%
if %skazitel% == 7
  говор Что ни вечер, то мне, молодцу
  wait 1s
  говор Ненавистен княжий терем,
  wait 1s
  говор И кручина, злее половца,
  wait 1s
  говор Грязный пол шагами мерит...
  wait 1s
  эмо замолчал, продолжая задумчиво перебирать струны
elseif %skazitel% == 6
  говор Завихрился над осиною
  wait 1s
  говор Жгучий дым истлевшим стягом
  wait 1s
  говор Я тоску свою звериную
  wait 1s
  говор Заливаю пенной брагой.
  wait 1s
  эмо замолчал, продолжая задумчиво перебирать струны
elseif %skazitel% == 5
  говор Из-под стрехи в окна крысится
  wait 1s
  говор Недозрелая луна
  wait 1s
  говор Все-то чудится мне, слышится:
  wait 1s
  говор Выпей, милый, пей до дна!
  wait 1s
  эмо замолчал, продолжая задумчиво перебирать струны
elseif %skazitel% == 4
  говор Выпей - может, выйдет толк,
  wait 1s
  говор Обретешь свое добро,
  wait 1s
  говор Был волчонок - станет волк,
  wait 1s
  говор Ветер, кровь и серебро.
  wait 1s
  эмо замолчал, продолжая задумчиво перебирать струны
elseif %skazitel% == 3
  говор Так уж вышло - не крестись
  wait 1s
  говор Когти золотом ковать,
  wait 1s
  говор Был котенок - станет рысь,
  wait 1s
  говор Мягко стелет, жестко спать!
  wait 1s
  эмо замолчал, продолжая задумчиво перебирать струны
elseif %skazitel% == 2
  говор Не ходи ко мне, желанная,
  wait 1s
  говор Не стремись развлечь  беду
  wait 1s
  говор Я обманут ночью пьяною,
  wait 1s
  говор До рассвета не дойду
  wait 1s
  эмо замолчал, продолжая задумчиво перебирать струны
elseif %skazitel% == 1
  говор Ох, встану, выйду, хлопну дверью я
  wait 1s
  говор Тишина вокруг села
  wait 1s
  говор Опадают звезды перьями
  wait 1s
  говор На следы когтистых лап.
  wait 1s
  эмо замолчал, продолжая задумчиво перебирать струны
elseif %skazitel% == 0
  говор Пряный запах темноты,
  wait 1s
  говор Леса горькая купель,
  wait 1s
  говор Медвежонок звался ты,
  wait 1s
  говор Вырос - вышел лютый зверь.
  wait 1s
  эмо замолчал, продолжая задумчиво перебирать струны
else
  говор Выпей - может, выйдет толк,
  wait 1s
  говор Обретешь свое добро, 
  wait 1s
  говор Был волчонок, станет волк,
  wait 1s
  говор Ветер, кровь и серебро...
  wait 1s
  эмо замолчал, продолжая задумчиво перебирать струны
endif
~
#77623
Страж-хозяйка~
0 r 100
~
if %actor.clan% != рк
  if %direction% == west
    ск Гвалиор Врррррраги!!! %actor.name% подходит к замку!
    ск Скифша Врррррраги!!! %actor.name% подходит к замку!
    ск Семсер Врррррраги!!! %actor.name% подходит к замку!
    ск Авин Врррррраги!!! %actor.name% подходит к замку!
    ск Архелая Врррррраги!!! %actor.name% подходит к замку!
    ск Малх Врррррраги!!! %actor.name% подходит к замку!
    ск Иохим Врррррраги!!! %actor.name% подходит к замку!
    ск Кейстут Врррррраги!!! %actor.name% подходит к замку!
    ск Млада Врррррраги!!! %actor.name% подходит к замку!
    ск Гранислав Врррррраги!!! %actor.name% подходит к замку!
    ск Сытень Врррррраги!!! %actor.name% подходит к замку!
    ск Векомир Врррррраги!!! %actor.name% подходит к замку!
    ск Зенисан Врррррраги!!! %actor.name% подходит к замку!
    ск Увелюша Врррррраги!!! %actor.name% подходит к замку!
    ск Милуша Врррррраги!!! %actor.name% подходит к замку!
    eval pc %actor.iname%
    worlds pc
    calcuid Hoz 77604 mob
    run 77624 %Hoz%
  end
end
~
#77624
Хозяюшка_о_гостях~
0 a 0
~
say Встречайте ратники гостя дорогого!! %pc% к нам пожаловал!!
~
#77625
Чар_с_тьмой_входит_на_ренту~
0 aqr 100
~
if %actor.affect(затемнение)% & (!%actor.affect(освещение)%)
  say Ну до чего ты невоспитаный, %actor.iname%, не заслоняй свет, читать мешаешь!
  wait 10 s
  if %actor.affect(затемнение)% & (!%actor.affect(освещение)% & (%actor.realroom% == 77622)) 
    say Ну не хочешь по-хорошему, будет по-плохому...
    %echoaround% %actor% Хозяйка гостинной НЕВЫНОСИМО БОЛЬНО пнула %actor.vname%!
    %send% %actor% Хозяйка гостинной НЕВЫНОСИМО БОЛЬНО пнула Вас!
    %echoaround% %actor% %actor.iname%, широко расправив крылья, изчез на юге.
    %send% %actor% Летели Вы недолго, но неприятно, и наконец шлепнулись на землю у алтаря.
    %teleport% %actor% 77624
  endif
endif
~
#77626
Проверка_на_чаров_во_тьме_на_ренте~
0 b 12
~
foreach Char %self.pc%
  if %Char.affect(затемнение)% & (!%Char.affect(освещение)%)
    say Ну до чего ты невоспитаный, %Char.iname%, не заслоняй свет, читать мешаешь!
    wait 10 s
    if %Char.affect(затемнение)% & (!%Char.affect(освещение)%)
      if %Char.realroom% == 77622
        say Ну не хочешь по-хорошему, будет по-плохому...
        %echoaround% %Char% Хозяйка гостинной НЕВЫНОСИМО БОЛЬНО пнула %Char.vname%!
        %echoaround% %Char% Хозяйка гостинной НЕВЫНОСИМО БОЛЬНО пнула %Char.vname%!
        %echoaround% %Char% %Char.iname%, широко расправив крылья, изчез на юге.
        %send% %Char% Летели Вы недолго, но неприятно, и наконец шлепнулись на землю у алтаря.
        %teleport% %Char% 77624
      endif
    endif
  endif
done
~
#77627
Эмоции волчонка~
0 b 10
~
if %self.position% != 4
  eval key %random.10%
  switch %key%
    case 1
      эмоц с азартом принялся ловить свой собственный хвост
      wait 3
      эмоц так и не поймав свой хвост, посмотрел на него и озадачено тяфкнул
    break
    case 2
      эмоц лениво почесал за ухом, да так и застыл с поднятой лапой, задумавшись о чем-то своем
    break
    case 3
      эмоц посмотрел на окружающих голодными глазами
    break
    case 4
      eval Aim %random.pc%
      if %Aim.sex% == 1
        set S его
      end
      if %Aim.sex% == 2
        set S ее
      end
      if %Aim.clan% == рк
        %send% %Aim% Волчонок запрыгнул к Вам на коленки и лизнул Вас в нос.
        %echoaround% %Aim% Волчонок запрыгнул на колени к %Aim.dname% и лизнул %S% в нос.
      end
    break
    case 5
      eval Stick %exist.obj(77654)%
      if Stick != 1
        eval Aim %random.pc%
        %send% %Aim% Волчонок подергал Вас за штанину предлагая поиграть.
        %echoaround% %Aim% Волчонок начал приставать к %Aim.dname% приглашая поиграть с ним.
        %load% obj 77654
        бросить палка
      end
    break
  done
end
~
#77628
Команды волчонку~
0 d 1
сидеть лежать лапу голос~
if %actor.clan% != рк
  эмоц сделал вид что не слышит Вас
  halt
end
if %speech% == лежать
  эмоц лег на пол и положил голову на лапы
  wait 3
  эмоц поднялся и завилял хвостом
end
if %speech% == сидеть
  сесть
  wait 3
  эмоц внезапно потерял равновесие и упал
  wait 3
  встать
end
if %speech% == лапу
  эмоц с готовностью поднял правую лапу
  wait 2
  эмоц опустил лапу и завилял хвостом ожидая похвалы
end
if %speech% == голос
  эмоц НЕВЫНОСИМО ЗВОНКО тяфкнул, у Вас даже в голове зазвенело
end
~
#77629
Бросаем палку волчонку~
0 c 0
кинуть палка~
eval Stick %world.obj(77654)%
if %Stick.carried_by% == %actor%
  %send% %actor% Широко размахнувшись, Вы бросили палочку.
  %echoaround% %actor% Широко размахнувшись, %actor.iname% бросил палочку.
  %purge% %Stick%
  %echoaround% %self% Волчонок, издавая радостное тяфканье, серебристым вихрем ринулся вслед за палочкой.
  eval key %random.4%
  if %key% == 2
    %echoaround% %self% Не успели вы опомниться, а волчонок уже принес палочку и хочет поиграть еще!
    %load% obj 77654
    drop палка
  else
    %echoaround% %self% Не успели вы опомниться, а волчонок уже принес палочку, но отдавать ее Вам он точно не собирается.
  endif
endif
~
#77630
Волчонку что-то дали~
0 j 100
~
if %object.type% == 19
  eval fd %object.iname%
  if %fd.contains(мяс)%
    eval Angry %random.5%
    switch %Angry%
      case 1
        wait 1
        эмоц с довольным рычанием набросился на %object.vname% и в одно мгновение разорвал на куски
        %purge% %object%
      break
      case 3
        wait 1
        эмоц наступил лапой на %object.vname% и степенно принялся за еду
        %purge% %object%
      break
      case 5
        wait 1
        эмоц лениво пожевал %object.vname%, потом отнес в угол и тщательно закопал
        %purge% %object%
      break
      default
        эмоц понюхал угощение, но почему-то есть не стал
        return 0
        halt
      break
    done
  else
    wait 1
    эмоц с аппетитом начал есть, но поняв что это не мясо выплюнул %object.vname% на пол
    drop %object.iname%
  end
else
  wait 1
  эмоц попробовал погрызть, но оказалось что %object.iname% ему не по-зубам
  drop %object.iname%
end
~
$~
