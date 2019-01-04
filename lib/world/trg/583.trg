#58300
вход на арену~
2 c 1
зайти~
* вход на арену [параметр -- направление]
* аттачено на клетки: 58116
wait 1
if !%actor.rentable%
  wsend %actor% В &RБД&n опасно на арене.
  halt
end
if %arg.contains(юг)%
  wsend %actor% Вы вошли на тренировочное поле с \&Rюга\&n.
  wechoaround %actor% %actor.name% вош%actor.y% на тренировочное поле.
  wteleport %actor% 58323 horse
elseif %arg.contains(север)%
  wsend %actor% Вы вошли на тренировочное поле с \&Rсевера\&n.
  wechoaround %actor% %actor.name% вош%actor.y% на тренировочное поле.
  wteleport %actor% 58303 horse
elseif %arg.contains(запад)%
  wsend %actor% Вы вошли на тренировочное поле с \&Rзапада\&n.
  wechoaround %actor% %actor.name% вош%actor.y% на тренировочное поле.
  wteleport %actor% 58311 horse
elseif %arg.contains(восток)%
  wsend %actor% Вы вошли на тренировочное поле с \&Rвостока\&n.
  wechoaround %actor% %actor.name% вош%actor.y% на тренировочное поле.
  wteleport %actor% 58315 horse
else
  eval rnd %random.num(4)%
  wsend %actor% Вы вошли на тренировочное поле.
  wechoaround %actor% %actor.name% вош%actor.y% на тренировочное поле.
  switch %rnd%
    case 1
      wteleport %actor% 58323 horse
    break
    case 2
      wteleport %actor% 58303 horse
    break
    case 3
      wteleport %actor% 58311 horse
    break
    case 4
      wteleport %actor% 58315 horse
    break
  done
end
~
#58301
выход с арены~
2 c 1
выйти~
* выход с арены [без параметров]
* аттачено на клетки: 58303 58311 58315 58323
wait 1
wsend %actor% Вы покинули тренировочное поле.
wechoaround %actor% %actor.name% выш%actor.y% с тренировочного поля.
wteleport %actor% 58116 horse
~
#58302
ударить мяч~
0 c 100
ударить~
wait 1
if %actor.vnum% != -1 || %actor.leader% == %self%
  mechoaround %actor% %actor.name% попытал%actor.u% ударить по мячу но промазал%actor.g%!
  halt
end
msend %actor% Вы ударили по мячу!
if %socker1balllag% == 1
  %actor.wait(2)%
end
mechoaround %actor% %actor.name% ударил%actor.g% по мячу!
set sockerpinalter1name %actor.name%
global sockerpinalter1name
set sockerroom1 %self.realroom%
if %arg.contains(юг)%
  if %sockerroom1.south%
    if %random.100% < 25
      юг
    end
    юг
  else
    mecho Мяч отскочил от стенки.
    %actor.wait(4)%
    север
  end
elseif %arg.contains(север)%
  if %sockerroom1.north%
    if %random.100% < 25
      север
    end
    север
  else
    mecho Мяч отскочил от стенки.
    %actor.wait(4)%
    юг
  end
elseif %arg.contains(запад)%
  if %sockerroom1.west%
    if %random.100% < 25
      запад
    end
    запад
  else
    mecho Мяч отскочил от стенки.
    %actor.wait(4)%
    восток
  end
elseif %arg.contains(восток)%
  if %sockerroom1.east%
    if %random.100% < 25
      восток
    end
    восток
  else
    mecho Мяч отскочил от стенки.
    %actor.wait(4)%
    запад
  end
elseif %arg.contains(вниз)%
  if %sockerroom1.down%
    вниз
  else
    %actor.wait(4)%
    вверх
  end
elseif %arg.contains(вверх)%
  if %sockerroom1.up%
    вверх
  else
    mecho Мяч отскочил от стенки.
    %actor.wait(4)%
    вниз
  end
else
  msend %actor% В каком направлении будем бросать мяч? (север, восток, юг, запад, вниз, вверх)
end
~
#58303
мяч прилетает в ворота~
0 g 100
~
wait 1
if %actor.vnum% != 58300
  halt
end
detach 58302 %actor.id%
eval sockergoal1counter %sockergoal1counter% + 1
global sockergoal1counter
set sockergate1id %self%
global sockergate1id
remote sockergate1id %actor.id%
exec 58305 %actor.id%
wait 2
*кричать &W%sockerpinalter1name% забивает %sockergoal1counter% гол в ворота команды '&K%sockercommand1name%&W'!&n
болтать &W%sockerpinalter1name% забивает %sockergoal1counter% гол в ворота команды '&K%sockercommand1name%&W'!&n
mpurge %actor%
if %ballloadroom%
  set ballbackroom %self.realroom%
  global ballbackroom
  eval pause 3+%random.3%
  wait %pause%s
  * т.к. не работает mat команда пришлось извращаться
  *mat %ballloadroom% mload mob 58300
  mteleport %self% %ballloadroom%
  mload mob 58300
  mteleport %self% %ballbackroom%
end
~
#58304
назначить название команды~
0 c 100
назначить~
wait 1
if %actor.level% > 30
  if !%arg%
    msend %actor% Текущее используемое слово: "%sockercommand1name%"
    msend %actor% Текущее количество голов: "%sockergoal1counter%"
  elseif %arg.car% == команду
    set sockercommand1name %arg.cdr%
    global sockercommand1name
    set sockergoal1counter 0
    global sockergoal1counter
    msend %actor% Будет использовано слово: "%sockercommand1name%"
  elseif %arg.car% == центр
    set ballloadroom %arg.cdr%
    global ballloadroom
    msend %actor% Мяч будет автоматически загружаться в комнату %ballloadroom% (%ballloadroom.name%).
  else
    msend %actor% Извините, неверная команда. Используйте "назначить команду" или "назначить центр".
  end
else
  msend %actor% твой уровень недостаточен для этого!
end
~
#58305
триггер чтобы можно было определить кто забивал гол~
0 z 100
~
remote sockerpinalter1name %sockergate1id.id%
~
#58306
определить есть у мяча лаг или нет~
0 c 100
лагнамяче~
wait 1
if %actor.level% > 30
  if %socker1balllag% == 1
    set socker1balllag 0
    global socker1balllag
  else
    set socker1balllag 1
    global socker1balllag
  end
  msend %actor% Флаг на лаг у мяча: %socker1balllag%
else
  msend %actor% твой уровень недостаточен для этого!
end
~
#58307
вешается на моба продавца мячиков~
0 r 100
~
wait 1
if %actor.vnum% == -1
  tell %actor.name% За 15000 кун Вы можете приобрести у меня &Wк&Kр&Wу&Kг&Wл&Kы&Wй &Kм&Wя&Kч&C!&n
end
~
#58308
вешается на моба продавца мячиков~
0 m 1
~
wait 1
if %world.curmobs(58300)% < 25
  if %amount% < 15000
    tell %actor.name% Мало, мяч стоит 500 кун, а ты сколько даешь? Всего %amount%!
    tell %actor.name% А деньги назад не отдам - это твои проблемы, что счету не обучен%actor.g%.
  else
    tell %actor.name% Вот тебе, твой мяч
    mload mob 58300
  end
else
  say Кончились мячи, больше не привезли
  груст
end
~
#58309
Мяч загружается в мир~
0 n 100
~
wait 1
mecho Мяч упал на землю и покатился, весело подпрыгивая.
~
$~
