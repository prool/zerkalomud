#56800
Лезть ступени~
2 c 0
лезть пролезть залезть карабкаться~
if !(%arg.contains(ступен)%) 
  wsend       %actor% Куда это Вы хотите лезть???
  return 0
  halt
end
if %actor.fighting%
  wsend %actor% Вы не можете лезть пока сражаетесь.
end
wsend       %actor% Вы полезли вверх по ступеням.
wechoaround %actor% %actor.name%, исчезая в темноте стен, пропал%actor.g% в глубинах темных массивов.
wait 1s
wsend %actor% .- Вы оказались в красной зале...
wteleport %actor% 56836 horse
wechoaround %actor% Кто-то пришел сюда.
end
~
#56801
Вход в зону~
0 q 100
1~
if (%actor.vnum% != -1)
  halt
end
wait 2s
говор Рад видеть в этих глухих местах Вас, почтенн%actor.w% !
говор Дальше пройти у тебя не получится.
говор Только я знаю как попасть по ту сторону этих болот.
говор Говорят, в тех местах творятся злые вещи...
говор И там, мол, некогда учились одни из самых могущественных магов...
говор Я могу тебя туда отправить, но ты должен будешь мне принести оттуда два пергамента.
говор Готов ли ты отправиться в этот путь ?
~
#56802
игрок сказал Готов~
0 d 1
готов да yes jar~
msend %actor% Старый воин задумался.....
wait  3s
msend %actor% Подошел к Вам ближе и стал Вас разглядывать...
eval minlev 30-%actor.remort%/2
if (%actor.level% >= %minlev%)
  msend %actor% Вы отправились следом за опытным воином в глубь лесных болот..
  msend %actor% .- Старый воин провел Вас через болота к лесной чаще и быстро ушел в обратном направлении.
  mteleport %actor% 56889
  mecho Старый воин повел %actor.name% в лесную чащу.
  mechoaround %actor% Старый воин вывел кого-то из лесных болот и скрался в обратном направлении
else  
  msend %actor% .-  Ты не подходишь по своему опыту, для этого путешествия, тебя я не поведу в те места...
end
*attach 56808 %self.id%
~
#56803
нырнуть озеро~
2 c 0
нырнуть нырять занырнуть~
if (%arg.contains(озер)%)||(%arg.contains(вод)%)
  if (%actor.move%<120)
    wsend %actor% _Вы подумали, что возможно Вам не хватит сил на этот путь..
    wsend %actor% _Вы нырнули в темную , холодную воду подземного озера
    wechoaround %actor% _%actor.name% полез%actor.q% в холодные воды подземного озера.
    wait 1s
    wsend %actor% _Вы осознали что Вам не хватит сил на этот путь.. Вас потянуло в глубины темного подземного озера.
    wteleport %actor% 56897
    return 0
  else
    wsend %actor% _Вы нырнули в темные воды подземного озера.
    wechoaround %actor% _%actor.name% полез%actor.q% в воду.
    wait 1s
    wsend %actor% _После длительного пути вы выбрались на сухое место и отряхнулись.
    if (%actor.realroom%==56814)
      wteleport %actor% 56865 
      eval buffer %actor.move(-120)%
    end
    wechoaround %actor% %actor.name% вынырнул%actor.g% из подводных глубин, отплевываясь и задыхаясь.
  end
end
~
#56804
помер дракон черный~
0 f 100
~
if %world.curobjs(56816)% < 1
  mload obj 56816
end
~
#56805
кто то зашел~
2 c 100
~
wait 2s
говор Зачем Ты пожаловал%actor.g% в эти места?
говор Какое ты имеешь право тревожить меня?
говор Никто не нарушал мой покой уже Тысячи лет....
говор Смертным здесь не место. 
mkill %actor%
~
#56806
Разобрать завал~
2 c 0
разобрать разбирать расчистить~
if (%arg.contains(завал)%)||(%arg.contains(ход)%)
  if (%actor.move%<120)
    wsend %actor% _Это, скорее всего, будет Вам не под силу.
    return 0
  else
    wsend %actor% _Вы принялись за работу и стали разбирать огромный заваленный проход, ведущий непонятно куда...
    wechoaround %actor%  %actor.name% стал%actor.g% носиться с камнями туда-сюда, пытаясь расчистить проход... Ну зачем ему туда надо?
    wait 3s
    wdoor  56817 s room 56859
    wechoaround %actor% %actor.name% разобрал%actor.g% завал и появился проход дальше...
    eval buffer %actor.move(-120)%
    detach 56806 %self.id%
  end
end
~
#56807
репоп зоны "подземный город"~
2 f 100
~
calcuid wall 56817 room
detach 56806 %wall%
attach 56806 %wall%
wdoor  56817 s purge
~
#56809
Помер библиотекарь~
0 f 100
~
if %world.curobjs(56805)% < 1
  mload obj 56805
end
~
#56810
Даем пергамент воину~
0 j 100
~
wait 1
switch %object.vnum%
  case 56816
    wait 1
    mpurge %object%
    говор У тебя все-таки получилось!
    wait  1s
    говор Ах, как я тебе благодарен...
    wait  1s
    говор Чем бы тебя отблагодарить?
    oecho Старый воин задумался на мгновение...
    wait  4s
    if ( %world.curobjs(56818)% < 2 ) && (%random.100% <= 40 )
      mload obj 56818
      говор Вот у меня осталось от минувших дней...
      говор Возможно это тебе пригодится...
      говор Спасибо за помощь!
      дать меч %actor.name%
    else
      говор Припоминаю, меч у меня был старый, да кому-то уже я отдал.
    end
  end
break
case 56805
  wait 1
  mpurge %object%
  говор У тебя все-таки получилось!
  wait  1s
  говор Ах, как я тебе благодарен...
  wait  1s
  говор Чем бы тебя отблагодарить?
  oecho Старый воин задумался на мгновение...
  wait  1s
  if (%world.curobjs(56806)% < 2 ) && (%random.100% <= 40 )
    mload obj 56806
    говор Вот у меня осталось от минувших дней...
    говор Возможно это тебе пригодится...
    говор Спасибо за помощь!
    дать доспех %actor.name%
  else
    говор Припоминаю, доспех у меня был старый, да кому-то уже я отдал.
  end
end
break
default
  дум
  say Зачем мне это?
  бросить %object.name%
done
~
#56811
тригер с доспехом~
1 j 100
~
wait 1s
oecho &RОгненный доспех подземного города вспыхнул багровым пламенем.&n
~
#56812
бой у темн. чудища~
0 k 0
~
set target %random.char%
if !%target%
  halt
end
switch %random.4%
  case 1
    dg_cast 'sleep' .%target.name%
  break
  case 2
    dg_cast 'молч' .%target.name%
    dg_cast 'слепот' .%target.name%
    dg_cast 'глухот' .%target.name%
  break
  case 3
    dg_cast 'молния' .%target.name%
    dg_cast 'молния' .%target.name%
  break
  case 4
    dg_cast 'огн поток' .%target.name%
    dg_cast 'огн поток' .%target.name%
    dg_cast 'огн поток' .%target.name%
  done
~
$~
