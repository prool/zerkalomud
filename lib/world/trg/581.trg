#58101
эмо~
1 gijl 100
~
wait 1
if !%actor.anem% || %actor.vnum% != -1
  halt
end
oforce %actor% плак
~
#58102
зеркало~
1 c 1
блеснуть~
wait 1
if %arg%
  oecho &cБольшое пребольшое зеркало&n блеснуло в лучах солнца, %arg%.
else
  oecho &cБольшое пребольшое зеркало&n блеснуло в лучах солнца.
end
~
#58103
дебаг-моб триг~
0 c 100
дгтест~
wait 1
if !%actor.name% || %actor.iname% != Переплут && %actor.iname% != Херуба
  %echo% You're restricted to use me!
  halt
else
end
~
#58104
биться стена~
1 c 9
биться~
halt
wait 1
%actor.wait(8s)%
wsend %actor% Прицелившись, и разогнавшись Вы побежали к стене!
wechoaround %actor% Прицелившись, и разогнавшись %actor.name% побежал%actor.q% к стене!
wait 1s
wsend %actor% &YИскры возникли в глазах&n. &RВы начинаете терять связь с этим миром!&n
wechoaround %actor% При столкновении %actor.rname% со стеной посыпались &Yискры&n, наверное &Rэто было действительно БОЛЬНО&n.
wait 1s
wsend %actor% Вы без сознания и медленно умираете.
wechoaround %actor% %actor.name% без сознания и медленно умирает.
wait 3s
wsend %actor% Вы без сознания и медленно умираете.
wechoaround %actor% %actor.name% без сознания и медленно умирает.
wait 3s
wsend %actor% А, это Вам всего лишь показалось?
~
#58110
клан шмот ДВ подняли с земли или взяли из контейнера~
1 g 100
~
*клан шмот ДВ подняли с земли или взяли из контейнера
*Objects | Get | 100 
*триг дикеит клан-стаф при попытке взять его игроком нейтрально-враждебным к клану
wait 1
* мобы и союзники, если такие есть -- могут носить
if ((%actor.clan% == НД) || (%actor.clan% == СО2) || (%actor.clan% == СО3) || (%actor.vnum% != -1))
  halt
end
* остальные -- не могут
if (%actor.clan% != ВД)
  oecho Внезапно %self.iname% исчез%self.q% в яркой вспышке.
  wait 1
  opurge %self.id%
end
~
#58111
самоцвет => конь~
1 c 3
потереть~
*самоцвет => конь | Objects | Command | 3 | потереть
wait 1
if (%actor.clan% != ВД)
  oechoaround %actor% %actor.name% начал%actor.u% тереть черный самоцвет. С ним все в порядке?
  osend %actor% Вы начали тереть самоцвет. Достойное занятие.
  halt
end
if (%world.curmobs(58112)% < 50)
  oechoaround %actor% %actor.name% начал%actor.g% тереть самоцвет и тот превратился в КОНЯ.
  osend %actor% Вы потерли самоцвет и он превратился в КОНЯ!
  oload mob 58112
  wait 1
  opurge %self%
else
  osend %actor% Вы потерли самоцвет но ничего не произошло.
end
~
#58112
конь => самоцвет~
0 c 0
погладить~
*конь => самоцвет | Mobiles | Command | 0 | погладить
wait 1
if (%actor.clan% != ВД)
  if (%self.vnum% == 58112)
    mechoaround %actor% %actor.name% попробовал%actor.g% погладить %self.vname%, но тот СМЕРТЕЛЬНО укусил%self.g% его за палец.
    msend %actor% Вы попробовали погладить %self.vname%, но он СМЕРТЕЛЬНО укусил%self.g% Вас за палец!
  else
    if (%self.vnum% == 58113)
      mechoaround %actor% %actor.name% попробовал%actor.g% погладить %self.vname%, но та отлетел%self.g% в сторону.
      msend %actor% Вы попробовали погладить %self.vname%, но она отлетел%self.g% в сторону.
    end
  end
  halt
end
if (%self.vnum% == 58112)
  mechoaround %actor% %actor.name% осторожно погладил%actor.g% %self.vname%, и %self.name% с громким хлопком изчез%self.q%.
  msend %actor% Вы осторожно погладили %self.vname%, и %self.name% с громким хлопком исчез%self.q%.
else
  if (%self.vnum% == 58113)
    mechoaround %actor% %actor.name% неосторожно погладил%actor.g% %self.vname%, и внезапно %self.name% лопнул%self.g%! Печально :(.
    msend %actor% Вы неосторожно погладили %self.vname% и как результат она лопнул%self.g%! Что же Вы наделали!?
  end
end
mload obj 58105
wait 1
mpurge %self%
~
#58113
самоцвет => конь2~
1 c 3
лизнуть~
*самоцвет => конь2 | Objects | Command | 3 | лизнуть
wait 1
if (%actor.clan% != ВД)
  oechoaround %actor% %actor.name% начал%actor.u% облизывать черный самоцвет. С ним все в порядке?
  osend %actor% Вы начали облизывать магический самоцвет. Достойное занятие.
  halt
end
if (%world.curmobs(58113)% < 5)
  if (%actor.clanrank% < 6)
    oechoaround %actor% %actor.name% начал%actor.g% облизывать самоцвет и внезапно тот превратился в резиновую бабу, ну и дела!
    osend %actor% Вы начали облизывать самоцвет и внезапно он превратился в резиновую бабу!
    oload mob 58113
    wait 1
    opurge %self%
  else
    osend %actor% Из-за плохого финансового снабжения, такие развлечения доступны только старшему составу клана! :(.
  end
else
  osend %actor% Вы лизнули самоцвет но ничего не произошло.
end
~
#58122
ударить мяч~
0 c 100
ударить~
*ударить мяч | Mobiles | Command | 100 | ударить
*прицеплен на моба 58120
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
#58123
мяч прилетает в ворота~
0 g 100
~
*мяч прилетает в ворота | Mobiles | Greet | 100
*прицеплен к мобу 58121
wait 1
if %actor.vnum% != 58120
  halt
end
detach 58122 %actor.id%
eval sockergoal1counter %sockergoal1counter% + 1
global sockergoal1counter
set sockergate1id %self%
global sockergate1id
remote sockergate1id %actor.id%
exec 58125 %actor.id%
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
  *mat %ballloadroom% mload mob 58120
  mteleport %self% %ballloadroom%
  mload mob 58120
  mteleport %self% %ballbackroom%
end
~
#58124
назначить название команды~
0 c 100
назначить~
*назначить название команды | Mobiles | Command | 100 | назначить
*прицеплен к мобу 58121
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
#58125
триггер чтобы можно было определить кто забивал гол~
0 z 100
~
*триггер чтобы можно было определить кто забивал гол | Mobiles | Auto | 100
*прицеплен к мобу 58120
remote sockerpinalter1name %sockergate1id.id%
~
#58126
определить есть у мяча лаг или нет~
0 c 100
лагнамяче~
*определить есть у мяча лаг или нет | Mobiles | Command | 100 | лагнамяче
*прицеплен на моба 58120
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
#58127
вешается на моба продавца мячиков~
0 r 100
~
*вешается на моба продавца мячиков | Mobiles | Great-All PC | 100
*прицеплен к мобу 58122
wait 1
if %actor.vnum% == -1
  tell %actor.name% За 15000 кун Вы можете приобрести у меня &Wк&Kр&Wу&Kг&Wл&Kы&Wй &Kм&Wя&Kч&C!&n
end
~
#58128
вешается на моба продавца мячиков~
0 m 1
~
*вешается на моба продавца мячиков | Mobiles | Bribe | 1
*прицеплен к мобу 58122
wait 1
if %world.curmobs(58120)% < 25
  if %amount% < 15000
    tell %actor.name% Мало, мяч стоит 15000 кун, а ты сколько даешь? Всего %amount%!
    tell %actor.name% А деньги назад не отдам - это твои проблемы, что счету не обучен%actor.g%.
  else
    tell %actor.name% Вот тебе, твой мяч
    mload mob 58120
  end
else
  say Кончились мячи, больше не привезли
  груст
end
~
#58129
мяч загружается в мир~
0 n 100
~
*Мяч загружается в мир | Mobiles | Load | 100
*прицеплен к мобу 58120
wait 1
mecho Мяч упал на землю и покатился, весело подпрыгивая.
~
#58170
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
  wteleport %actor% 58193 horse
elseif %arg.contains(север)%
  wsend %actor% Вы вошли на тренировочное поле с \&Rсевера\&n.
  wechoaround %actor% %actor.name% вош%actor.y% на тренировочное поле.
  wteleport %actor% 58173 horse
elseif %arg.contains(запад)%
  wsend %actor% Вы вошли на тренировочное поле с \&Rзапада\&n.
  wechoaround %actor% %actor.name% вош%actor.y% на тренировочное поле.
  wteleport %actor% 58181 horse
elseif %arg.contains(восток)%
  wsend %actor% Вы вошли на тренировочное поле с \&Rвостока\&n.
  wechoaround %actor% %actor.name% вош%actor.y% на тренировочное поле.
  wteleport %actor% 58185 horse
else
  eval rnd %random.num(4)%
  wsend %actor% Вы вошли на тренировочное поле.
  wechoaround %actor% %actor.name% вош%actor.y% на тренировочное поле.
  switch %rnd%
    case 1
      wteleport %actor% 58193 horse
    break
    case 2
      wteleport %actor% 58173 horse
    break
    case 3
      wteleport %actor% 58181 horse
    break
    case 4
      wteleport %actor% 58185 horse
    break
  done
end
~
#58171
выход с арены~
2 c 1
выйти~
* выход с арены [без параметров]
* аттачено на клетки: 58173 58181 58185 58193
wait 1
wsend %actor% Вы покинули тренировочное поле.
wechoaround %actor% %actor.name% выш%actor.y% с тренировочного поля.
wteleport %actor% 58116 horse
~
$~
