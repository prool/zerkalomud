#14600
ЗовемКоняжку~
1 c 100
гладить~
wait 1
if !%arg.contains(статуэтка)%
  osend  %actor% Что Вы хотите погладить?
  halt
end
osend %actor% Вы погладили статуэтку.
if %actor.clan% != тдн
  halt
end
if %world.curmobs(14600)% > 50
  osend %actor% ...и ничего не произошло!
  halt
end
oechoaround %actor% %actor.name% погладил%actor.g% статуэтку.
wait 1s
oload mob 14600
oecho Послышлся стук копыт и перед Вами предстал вороной жеребец.
oforce %actor% оседлать жереб
wait 1
opurge %self%
~
#14601
СворачиваемБогатырскогоКоня~
0 c 100
топнуть~
if  (%actor% != %self.leader%)
  msend %actor% Это не Ваш скакун.
  halt
end
mechoaround %actor% %actor.name% громко топнул%actor.g%.
msend %actor% Вы громко топнули ногой о земь.
mload obj 14601
дать стату .%actor.name%
wait 1s
mecho Вороной жеребец испарился на Ваших глазах.
wait 1
mpurge %self%
elseif (%actor.clan% != тдн)
mechoaround %actor% %actor.name% попытал%actor.u% топнуть, но нога так и застыла в воздухе.
msend %actor% Вы попытались топнуть, но Ваша нога так и застыла в воздухе.
end
~
#14602
СпускВПодвал~
2 c 100
спуститься~
if !(%arg.contains(подвал)%)
  wsend       %actor% Куда это Вы хотите спуститься???
  halt
end
wsend %actor% Вы спустились по лестнице в подвал.
wechoaround %actor% %actor.name% спустил%actor.u% в подвал.
wteleport %actor% 14646
wechoaround %actor% Кто-то спустилься в подвал.
end
~
#14603
УдалениеШмота~
1 gj 100
~
if (%actor.clan% == тдн)
  halt
end
osend %actor% %self.name% рассыпал%self.u% в ваших руках.
oechoaround %actor% %self.name% рассыпал%self.u% в руках %actor.rname%.
wait 1
opurge %self%
~
#14604
КарабкаемсяВЗамок~
2 c 100
подняться~
if !%arg.contains(замок)%
  wsend %actor%  Куда это Вы хотите подняться???
  halt
end
wsend %actor%  Вы поднялись по лестнице.
wechoaround %actor%  %actor.name% поднял%actor.u% по лестнице.
wait 1s
wsend %actor.name%   Вы очутились внутри замка Наемников!
wteleport %actor.name% 14645
wechoaround %actor%  Кто-то поднялся по лестнице в замок.
end
~
#14605
КрадемсяМимоЛовуки~
2 c 100
прокрасться~
if (!%arg.contains(мимо)% || !%arg.contains(ловушки)%)
  wsend  %actor% Чаво?
  halt
elseif %actor.clan% == тдн && %actor.realroom% != 14663 && %actor.realroom% != 14666 && %actor.realroom% != 14602 && %actor.realroom% != 14681
  wsend %actor%  Вы ловко прошмыгнули мимо ловушки.
  wechoaround %actor%  %actor.name% медленно скрыл%actor.u% из виду.
  eval room %random.4%
  switch %room%
    case 1
      wteleport %actor% 14663
    break
    case 2
      wteleport %actor% 14666
    break
    case 3
      wteleport %actor% 14602
    break
    case 4
      wteleport %actor% 14681
    break
  done
  wechoaround %actor%  Кто-то появил%actor.u% из неоткуда.
elseif %actor.realroom% != 14663 && %actor.realroom% != 14666 && %actor.realroom% != 14602 && %actor.realroom% != 14681
  wsend %actor%  Вы ловко прошмыгнули мимо ловушки.
  wechoaround %actor%  %actor.name% медленно скрыл%actor.u% из виду.
  eval room %random.4%
  switch %room%
    case 1
      wteleport %actor% 14663
    break
    case 2
      wteleport %actor% 14666
    break
    case 3
      wteleport %actor% 14602
    break
    case 4
      wteleport %actor% 14681
    break
  done
  wechoaround %actor%  Кто-то появил%actor.u% из неоткуда.
  calcuid dozor 14610 mob
  exec 14611 %dozor.id%
end
~
#14606
ИщемСоклановцев~
0 c 100
найти~
wait 1
%echo% Тут рыбы нет...
~
#14610
КрадемсяНазад~
2 c 100
прокрасться~
if !%arg.contains(мимо)% || !%arg.contains(ловушки)%
  wsend  %actor% Чаво?
  halt
elseif %actor.clan% == тдн
  wsend %actor%  Вы ловко прошмыгнули мимо ловушки.
  wechoaround %actor%  %actor.name% медленно скрыл%actor.u% из виду.
  wteleport %actor% 14601
  wechoaround %actor%  Кто-то появил%actor.u% из неоткуда.
else
  wsend %actor%  Вы ловко прошмыгнули мимо ловушки.
  wechoaround %actor%  %actor.name% медленно скрыл%actor.u% из виду.
  wteleport %actor% 14601
  wechoaround %actor%  Кто-то появил%actor.u% из неоткуда.
end
~
#14611
ТригДозорного~
0 z 100
~
wait 1
if %actor.clan% == тдн
  эмо отдал честь
else
  set list эстор морхолт малагант антарис глаймон вячеслав бранген гердар ишхана матфей волонд ломко гунхильда шателье дрелти некрон динни рольт
  foreach mem %list%
    tell %mem% &R%actor.iname%&n у ворот!
  done
  set list антонина злокраса элемир лариса кунал шунька мирт делор росава микун еруслан лешко вериша судару затаки альвина лонтара
  foreach mem %list%
    tell %mem% &R%actor.iname%&n у ворот!
  done
end
~
#14612
ВыдачаКланСтафа~
0 d 100
экипировка~
wait 1
if %actor.vnum% != -1
  halt
elseif %actor.clan% == тдн
  say Сейчас-сейчас...
  wait 1
  if %actor.bank% < 665
    дум
    say Э, да у тебя денег то совсем нету!
    halt
  end
  eval buffer %actor.bank(-665)%
  mload obj 14603
  mload obj 14604
  mload obj 14605
  mload obj 14606
  mload obj 14607
  mload obj 14608
  mload obj 14609
  mload obj 14609
  mload obj 14610
  mload obj 14610
  mload obj 14611
  mload obj 14612
  mload obj 14612
  mload obj 14613
  mload obj 14614
  mload obj 14615
  mload obj 144
  mload obj 139
  полож все сум
  say Вот твое добро.
  give all .%actor.name%
  drop all
  wait 1
  say Оружие сам%actor.g% себе в кузне купи - не маленк%actor.w% уже.
else
  say Чужакам не положено ходить в оверном стафе!
  say И ваще ты че тут трешся? А ну чеши отседова!
  msend %actor%  %self.name% сделал несколько непонятных жестов, и Вы потеряли ориентацию в пространстве.
  mteleport .%actor.name% 14603
  mecho %self.name% сделал несколько непонятных жестов, и %actor.name% изчез%actor.g% из виду.
end
~
#14613
Лезим в трещину~
2 c 100
лезть~
if !%arg.contains(трещина)%
  wsend  %actor% Куда это Вы хотите пролезть?
  halt
end
if ((%actor.clan% == тдн) && %actor.rentable%)
  wsend %actor%  Вы с трудом пролезли в трещину.
  wechoaround %actor%  %actor.name% с трудом пролез%actor.g% в терщину.
  wteleport %actor% 14679
  wechoaround %actor%  Кто-то пролез в трещину вслед за Вами.
else
  wechoaround %actor%  Как не старал%actor.u% %actor.name% пролезть в трещину, но так ничего и не получилось.
  wsend %actor%  Как Вы не старались, но так и не смогли протиснуться в трещину.
end
~
#14641
даем деньги на удавку~
0 m 0
~
wait 1
if %amount% < 30
  wait 2
  say Удавку хочешь? мелочь свою забери, а мне 30 кун давай!
  give %amount% кун .%actor.name%
  halt
end
if %world.curobjs(14642)% >= 50
  wait 2
  say Закончились удавки, не привозили пока больше :-)
  give %amount% кун .%actor.name%
  halt
end
wait 2
say Держи удавку, носи на здоровье!
mload obj 14642
give удавка .%actor.name%
~
#14642
спамерный триг удавки~
1 j 100
~
if (%actor.level% > 30 ) && (%actor.vnum% == -1 )
  halt
end
if %actor.clan% == тдн
  wait 2
  oechoaround %actor% _&rОкровавленная &Kудавка&n соскочила с запястья %actor.rname% и ловко обвилась вокруг Вашей нежной шеи. &WНичего личного&n - только &Rбизнес&n.
  osend %actor% _&rОкровавленная &Kудавка&n аккуратно сползла с Вашего запястья в поисках &Rжертвы&n и через несколько секунд &Wвернулась&n обратно.
  halt
end
osend %actor% %self.name% рассыпал%self.u% в ваших руках.
oechoaround %actor% %self.name% рассыпал%self.u% в руках %actor.rname%.
wait 1
opurge %self%
~
#14643
ЩитМерцает~
1 t 100
~
wait 1
wait 1s
oecho   &rБагровые &Rпятна &Rкрови &rпроступили на &MЩИТЕ&n, &rи Вы увидели надпись : &R"&YЖелание &CНаемника&n - &WЗакон для смерда&n&R"&n
~
#14644
Репоп(лоадщит)~
2 f 100
~
wait 1
if (%world.obj(23700).room% != %self.vnum%)
  %load% obj 14641
end
~
$~
