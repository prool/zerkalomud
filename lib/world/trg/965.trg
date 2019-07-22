#96500
Агрят чудища при разговорах в группе~
0 c 1
гг ггр ггру ггруп ггрупп ггруппа~
%echoaround% %actor% %actor.iname% сообщил%actor.q% группе : '%arg%'
%send% %actor% Вы сообщили группе : '%arg%'
wait 1
%echo% Услышав посторонний голос, чудище яростно взревело и бросилось в атаку!
dg_cast 'суд бог'
~
#96501
Дитрих рассказывает про пещеры~
0 q 100
~
wait 1s
г Здравствуй, здравствуй, путник перехожий.
г Какими судьбами в эти края закинуло?
wait 1
г Небось на мост радужный посмотреть захотелось?
г Оно и правильно, мост сильно красив да искусен.
г Вот только на сам мост входить не нужно, стражи там стоят.
г Роста великого, силы немеряной, и душой больно злобные.
wait 1
г Ах да, забыл представиться - Дитрих я, торговец диковинками.
г Брожу по свету, собираю творения штучные, рук лучших мастеров.
г Вот и к этому лагерю прибился...
эм неопределенно махнул головой
г Все равно по пути, а лишняя охрана, она никогда не помешает.
ухм
г Говорят в пещерах, что чуть северо-западнее отсюда,
г Умер давно воин один знатный.
г И у воина того меч был, выкованный одним из лучших кузнецов,
г И зачарованный, каким-то могущественным ведуном.
wait 1s
г Кто бы помог мне этот меч добыть...
эм ненавязчиво глянул в вашу сторону
attach 96502 %self.id%
detach 96501 %self.id%
~
#96502
Дитрих дает квест~
0 d 0
помогу~
wait 1
сият
г Ох как славно-то, как славно!
г Вот только, в пещерах осторожненько нужно быть
г Говорят, чудища там разные страшные селятся.
г Слепые как кроты, света белого не видевшие.
г Но со слухом зато превосходным.
г Только лишь шорох какой не пещерный услышат - сразу прибегут,
г И в секунды на части мелкие раздерут!
боят
wait 2
г Но такому воину славному как ты, бояться лишний раз не стоит.
г Принеси мне этот меч, и славно я тебя отблагодарю!
attach 96503 %self.id%
detach 96502 %self.id%
~
#96503
Дитрих принимает квест~
0 j 100
~
if (%object.vnum% != 96518)
  хмур
  г Нет-нет, не этого я просил.
  return 0
  halt
end
wait 1
%purge% %object%
чел
wait 1s
эм внимательно осмотрел меч со всех сторон
г Действительно он!
г Какой красавец, он займет важное место в моей коллекции.
г Благодарю тебя, это бесценный подарок!
г Вот, возьми за хлопоты
дать 20000 кун %actor.name%
wait 1s
г Ради такого дела, я даже могу показать тебе кое-что из моей коллекции.
г Возможно даже, решишь что-нибудь себе купить.
г Воистину уникальные творения я, конечно же, не продаю.
г Но вот вещи похуже, могу и продать, за небольшую цену.
г Иди за мной.
юг
switch %random.6%
  case 1
    mload mob 96533
  break
  case 2
    mload mob 96534
  break
  case 3
    mload mob 96535
  break
  case 4
    mload mob 96536
  break
  case 5
    mload mob 96537
  break
  case 6
    mload mob 96538
  break
done
mpurge %self%
~
#96504
Триг Змиулана~
0  0
~
змея, хвосты, трансформы, и т.п. для боя
~
#96505
Стражи моста появляются~
2 e 100
~
wait 1s
if (%random.10% <= 3)
  %echo% Стражи моста медленно появились из пустоты.
  %load% mob 96506
  %load% mob 96507
end
~
#96506
Лоад стафа купцу Дитриху~
0 n 100
0~
halt
%load% obj 96519
if (%random.100% <= 30) && (%world.curobjs(96501)% < %world.maxobj(96501)%)
  mload obj 96501
end
if (%random.100% <= 30) && (%world.curobjs(96502)% < %world.maxobj(96502)%)
  mload obj 96502
end
if (%random.100% <= 30) && (%world.curobjs(96503)% < %world.maxobj(96503)%)
  mload obj 96503
end
if (%random.100% <= 30) && (%world.curobjs(96504)% < %world.maxobj(96504)%)
  mload obj 96504
end
if (%random.100% <= 30) && (%world.curobjs(96505)% < %world.maxobj(96505)%)
  mload obj 96505
end
if (%random.100% <= 30) && (%world.curobjs(96506)% < %world.maxobj(96506)%)
  mload obj 96506
end
if (%random.100% <= 30) && (%world.curobjs(96507)% < %world.maxobj(96507)%)
  mload obj 96507
end
if (%random.100% <= 30) && (%world.curobjs(96508)% < %world.maxobj(96508)%)
  mload obj 96508
end
if (%random.100% <= 30) && (%world.curobjs(96509)% < %world.maxobj(96509)%)
  mload obj 96509
end
if (%random.100% <= 30) && (%world.curobjs(96510)% < %world.maxobj(96510)%)
  mload obj 96510
end
if (%random.100% <= 30) && (%world.curobjs(96511)% < %world.maxobj(96511)%)
  mload obj 96511
end
if (%random.100% <= 30) && (%world.curobjs(96512)% < %world.maxobj(96512)%)
  mload obj 96512
end
if (%random.100% <= 30) && (%world.curobjs(96513)% < %world.maxobj(96513)%)
  mload obj 96513
end
if (%random.100% <= 30) && (%world.curobjs(96514)% < %world.maxobj(96514)%)
  mload obj 96514
end
~
#96507
Восстановление Одоркефта и Арнора~
0 p 100
~
if (%self.vnum% == 96502) && (%exist.mob(96501)%)
  calcuid svmob 96501 mob
  set h1 %self.hitp%
  return 0
  wait 1
  eval h2 %h1%-%self.hitp%
  eval temp %svmob.hitp(+%h2%)%
  %echo% %svmob.name% стал выглядеть немного лучше.
  return 0
end
if (%self.vnum% == 96501) && (%exist.mob(96502)%)
  calcuid temob 96502 mob
  set h1 %self.hitp%
  return 0
  wait 1
  eval h2 %h1%-%self.hitp%
  eval temp %temob.hitp(+%h2%)%
  %echo% %temob.iname% стал выглядеть немного лучше.
  return 0
end
return 0
~
#96508
Моб уходит из битвы~
0 k 100
~
if (%random.100% <= 20)
  wait 1
  %echo% Страж моста исчез в легкой туманной дымке.
  mteleport %self% %self.realroom%
  %echo% Страж моста внезапно оказался прямо у вас за спиной!
end
~
#96509
Преклоняемся пред алтарем~
1 c 4
преклонить~
wait 1
if (!%actor.canbeseen%)
  halt
end
if !(%arg.contains(колен)%)
  %send% %actor% Уточните, чего хотите то?
  halt
end
wait 1
dg_cast 'защит от тьм' .%actor.name%
dg_cast 'сила' .%actor.name%
dg_cast 'затуман' .%actor.name%
dg_cast 'возду щит' .%actor.name%
~
#96510
Надругаемся на алтарем~
1 c 4
надругаться~
wait 1
%echo% По спине пробежался нехороший холодок.
%load% mob 96528
eval abc %altar%*2000
calcuid altmob 96528 mob
set %altmob.str(+%altar%)% 
set %altmob.hitp(+%abc%)%
eval altar %altar%+1
global altar
~
#96511
Взламываем ларь~
1 s 100
~
wait 1
%send% %actor% Вы задели какую-то ловушку когда возились с замком!
%echoaround% %actor% %actor.name% задел%actor.a% какую-то ловушку когда возил%actor.u% с замком!
%damage% .%actor.name% 500
dg_cast 'оцепен' %actor.name%
~
#96512
Берем скелет~
1 g 100
~
wait 1
calcuid skel 96516 obj
%load% mob 96529
%load% obj 96537
%echo% Внезапно останки скелета зашевелились!
%purge% %skel.id%
~
#96513
пьем из источника~
1 c 4
пить~
wait 1
if !(%arg.contains(источн)%)
  %send% %actor% Уточните, чего хотите то?
  halt
end
wait 1
dg_cast 'муд зме' .%actor.name%
dg_cast 'защит от тьм' .%actor.name%
dg_cast 'лед щит' .%actor.name%
~
#96514
Глин просит спасти Хегни от Халы~
0 q 100
~
wait 1s
эм внезапно зарыдала при виде вас
г Путники, путники, если есть среди вас воины отважные,
г помогите мне, прошу вас!
г Хегни, возлюбленный мой, никого не послушал,
г ушел несколько часов назад, добыть воды из источника Урд.
г Догоните его, прошу, иначе, боюсь, погибнет он от чудищ страшных,
г не вернется назад.
г Вы ведь поможете, да?
эм заломила руки в мольбе
attach 96515 %self.id%
~
#96515
Берем квест у Глен~
0 d 0
помогу~
wait 1
г Спасибо вам, спасибо!
г Источник Урд находится к северу отсюда, Хегни должен быть в той стороне
г И поторопитесь, если вы не успеете - он умрет!
%load% mob 96517
calcuid hala 96517 mob
%teleport% %hala% 96522
%load% mob 96520
calcuid hegni 96520 mob
%teleport% %hegni% 96522
%force% %hegni% убить зме
detach 96514 %self.id%
detach 96515 %self.id%
~
#96516
Хала трипает по тригу~
0 k 100
~
wait 1
if (%random.100% <= 20)
  set target %random.pc%
  %target.position(6)%
  %target.wait(3)%
  %send% %target% Мощным ударом хвоста Хала отправила вас на землю!
  %echoaround% %target% Мощным ударом хвоста Хала отправила %actor.vname% на землю!
end
~
#96517
Рип Хегни (лоад трупа)~
0 f 100
~
%load% obj 96520
calcuid glin 96519 mob
attach 96526 %glin.id%
~
#96518
Лоад алтаря~
1 n 100
~
set altar 0
global altar
~
#96519
Рип ламии~
0 f 100
~
mload obj 96518
if (%random.100% <= 25) && (%world.curobjs(96521)% < %world.maxobj(96521)%)
  mload obj 96521
end
if (%random.100% => 75) && (%world.curobjs(96522)% < %world.maxobj(96522)%)
  mload obj 96522
end
~
#96520
Рип Змиулана~
0 f 100
~
if (%random.100% <= 25) && (%world.curobjs(96523)% < %world.maxobj(96523)%)
  mload obj 96523
end
if (%random.100% => 75) && (%world.curobjs(96524)% < %world.maxobj(96524)%)
  mload obj 96524
end
~
#96521
Рип Халы~
0 f 100
~
if (%random.100% <= 25) && (%world.curobjs(96525)% < %world.maxobj(96525)%)
  mload obj 96525
end
if  %exist.mob(96520)% 
  %echo% Хегни сказал : 'Благодарю Вас, кто бы вы не были.'
  %echo% Хегни сказал : 'Этот зверь был намного сильнее чем я предполагал.'
  %echo% Хегни сказал : 'Мне... мне, пожалуй, нужно возратиться в лагерь.'
  %echo% Пошатываясь, Хегни побрел на восток.
  calcuid heg 96520 mob
  %purge% %heg%
  %load% mob 96532
  calcuid heg1 96532 mob
  %teleport% %heg1% 96572
  calcuid glin 96519 mob
  attach 96525 %glin.id%
end
~
#96522
Ламия сумонит~
0 k 100
~
eval lamia %lamia%+1
global lamia
if %lamia% == 5
  %load% mob 96530
  %echo% Мимо ламии прошмыгнула какая-то тень.
end
if %lamia% == 10
  %load% mob 96531
  %echo% Мимо ламии прошмыгнула какая-то тень.
end
if %lamia% == 15
  %load% mob 96530
  %load% mob 96530
  %echo% Мимо ламии прошмыгнула какая-то тень.
end
if %lamia% == 20
  %load% mob 96531
  %load% mob 96531
  %echo% Мимо ламии прошмыгнула какая-то тень.
end
if %lamia% == 25
  %load% mob 96530
  %load% mob 96530
  %load% mob 96530
  %echo% Мимо ламии прошмыгнула какая-то тень.
end
if %lamia% == 30
  %load% mob 96531
  %load% mob 96531
  %load% mob 96531
  %echo% Мимо ламии прошмыгнула какая-то тень.
end
if %lamia% == 35
  %load% mob 96530
  %load% mob 96530
  %load% mob 96530
  %load% mob 96530
  %echo% Мимо ламии прошмыгнула какая-то тень.
end
if %lamia% == 40
  %load% mob 96531
  %load% mob 96531
  %load% mob 96531
  %load% mob 96531
  %echo% Мимо ламии прошмыгнула какая-то тень.
  eval lamia 0
  global lamia
end
~
#96523
Ламия лоадится~
0 n 100
~
set lamia 0
global lamia
~
#96524
Заходим к Хале~
2 e 100
~
wait 1
if %exist.mob(96517)% 
  calcuid hala 96517 mob
  %teleport% %hala% 96522
  attach 96516 %hala.id%
  if %exist.mob(96520)% 
    %echo% Мощным ударом хвоста Хала отбросила полуживого Хегни и набросилась на Вас!
  end
  %force% %hala% вст
  %force% %hala% %kill% .%actor.name%
end
~
#96525
Награда Глен (Хегни жив)~
0 q 100
~
wait 1
сият
г Вы, это вы спасли моего Хегни?
эм с нежностью посмотрела на спящего воина
г Благодарю вас, благодарю от всего сердца.
if (%random.100% <= 50) && (%world.curobjs(96527)% < %world.maxobj(96527)%)
  г Вот, возьмите за свои подвиги.
  %echo% Глен сняла с себя амулет.
  %load% obj 96527
  дать амулет .%actor.name%
end
detach 96525 %self.id%
~
#96526
Награда Глин (Хегни мертв)~
0 j 100
~
wait 1
if %object.vnum% != 96520
  г Зачем мне это?
  дум
  брос все
else 
  wait 1
  бледн
  г О боже, мой Хегни...
  wait 1s
  рыд
  %purge% %object%
  wait 1s
  г Спа... спасибо, что принесли его тело.
  if (%random.100% <= 25) && (%world.curobjs(96526)% < %world.maxobj(96526)%)
    г Вот возьмите это, и, пожалуйста, оставьте меня одну.
    %echo% Глин сняла с себя амулет.
    %load% obj 96526
    дать амулет .%actor.name%
  end
  detach 96526 %self.id%
end
~
#96527
Агрят чудища при разговорах в дружину~
0 c 1
гд гдр гдру гдруг гдруга гдругам~
%echoaround% %actor% %actor.iname% дружине : &R'%arg%'.&n
%send% %actor% Вы дружине : &R'%arg%'.&n
wait 1
%echo% Услышав посторонний голос, чудище яростно взревело и бросилось в атаку!
dg_cast 'суд бог'
~
#96528
Агрят чудища при разговорах в клетку~
0 c 1
г го гов гово говор говори говорит говорить~
%echoaround% %actor% %actor.iname% сказал : '%arg%'
%send% %actor% Вы сказали : '%arg%'
wait 1
%echo% Услышав посторонний голос, чудище яростно взревело и бросилось в атаку!
dg_cast 'суд бог'
~
#96529
Рип стража моста~
0 f 100
~
if (%random.100% <= 8) && (%world.curobjs(96531)% < %world.maxobj(96531)%)
  %load% obj 96531
end
~
#96530
Рип ундины~
0 f 100
~
if (%random.100% <= 15) && (%world.curobjs(96533)% < %world.maxobj(96533)%)
  mload obj 96533
end
~
#96531
Рип белой бабы~
0 f 100
~
if (%random.100% <= 30) && (%world.curobjs(96534)% < %world.maxobj(96534)%)
  mload obj 96534
end
~
#96532
смерть перекати-поля~
0 f 100
~
if (%random.100% <= 30) && (%world.curobjs(96535)% < %world.maxobj(96535)%)
  mload obj 96535
end
~
#96533
Смерть призрака ночи~
0 f 100
~
if (%random.100% <= 40) && (%world.curobjs(96536)% < %world.maxobj(96536)%)
  mload obj 96536
end
~
#96534
Даем оберег~
0 j 100
~
wait 1
if %object.vnum% != 96537
  хмур
  г Зачем мне это?
  брос все
  halt
else
  wait 1s
  отшат
  г Это же оберег одного из наших воинов!
  г Он пропал несколько дней назад...
  г У нас теплилась надежда, что он жив, но, похоже, местные чудища его настигли.
  wait 1
  г Чтоже, покойся с миром, ты был славным воином.
  wait 1s
  г Благодарю вас, теперь мы знаем, что с ним случилось.
  г Держите, возможно вам пригодится в ваших странствиях.
  if (%random.100% <= 35) && (%world.curobjs(96538)% < %world.maxobj(96538)%)
    %load% obj 96538
    дать меч .%actor.name%
  else
    %load% obj 96539
    дать бутыл .%actor.name%
  end
  %purge% %object%
~
$~
