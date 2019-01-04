#95400
ползем вверх (1)~
2 c 100
лезть~
if !%arg.contains(вверх)% 
  wsend %actor% И куда же?
  halt
end
wait 1
if %actor.move% < 80
  wsend %actor% _Вы начали карабкаться по скале, но на полпути силы оставили Вас, и вы сорвались вниз.
  wechoaround %actor% %actor.name% полез%actor.q% вверх по столе, но сорвал%actor.u% и руннул%actor.g% на камни.
  %actor.position(2)%
  %actor.move(0)%
  wdamage %actor% 100
  halt
end
%actor.move(-80)%
wsend %actor% _Цепляясь за камни Вы начали медленно карабкаться вверх.
wechoaround %actor% %actor.name% начал%actor.g% медленно взбираться вверх.
wteleport %actor% 95411
wechoaround %actor% _Кто-то, покрытый толстым слоем пыли, выполз из-за камня.
end
~
#95401
ползем вниз (1)~
2 c 100
спуститься~
wait 5
wsend %actor% Вы начали медленно спускаться вниз.
wechoaround %actor% _%actor.iname% начал%actor.g% медленно спускаться вниз.
wteleport %actor% 95410
wechoaround %actor% _Кто-то с диким ревом упал сверху.
~
#95402
двигаем камень на плато~
2 c 100
двигать~
if !%arg.contains(камень)%
  wsend %actor%  Что вы хотите сдвинуть?
  halt
end
if %actor.str% > 24
  wait 5
  wsend %actor%  Приложив не мало усилий вы сдвинули камень...
  wechoaround %actor%  %actor.name% сдвинул%actor.q% камень...
  wecho ___...прямо себе на ногу!!!
  eval dmg %actor.hitp%/3
  wdamage %actor% %dmg%
else
  wsend %actor%  Вы попытались сдвинуть камень но чуть не надорвались.
  wechoaround %actor%  %actor.iname% попытал%actor.u% сдвинуть камень,
  wechoaround %actor%  Но видно %actor.iname% для этого слишком слаб%actor.g%.
end
~
#95403
убили серого змея у камня~
0 f 100
~
mload obj 95405
~
#95404
зашли к каменному колдуну~
0 q 100
~
wait 5
mecho _Каменный колдун:
mecho _- Я ждал, что кто-то придет от имени этого грязного владыки !
mecho _- И я подготовился к этой встрече...
mecho _- Не ждите, что я буду смирно умирать, как баран на бойне !!!
detach 95404 %self.id%
~
#95405
Заходят к бесу~
0 r 100
~
wait 1
mecho Увидев вас бес переступил копытами.
wait 3
say Ну наконец-то!
mecho _- Сколько же можно торчать тут?!
рыч
say Разумеется, хозяин не мог отправить на охоту за этим ничтожеством
mecho _- Столь могущественное создание как я.
mecho _- Вот для тебя это дело в самую пору.
wait 1s
взд
say Нет, я непростительно самонадеян...
mecho _- Как я мог подумать, что человеческий разум... разум &Kобычного&n человека
mecho _- В силах сохранить какие-либо указания в сохранности.
wait 2s
взд
say Итак.. Я повторю.
mecho _- Некий недоучка, бывший ученик мастера, возомнил себя великим магом.
mecho _- Вопреки воле учителя, он собрался провести в этих горах некий обряд.
mecho _- Это старые поселения чернокнижников - тут все пропитано черной магией.
хих
say Мало того, мерзвец осмелился похитить один из заклинательных камней хозяина!
ужас
wait 2s
say Само-собой, подобная дерзость должна быть нказана...
mecho _- Несмотря на врожденную скудность человеческих способностей, ты должен был меня понять.
mecho _- Найди негодяя, и покарай его.
wait 3
mecho _- Когда камень будет у тебя в руках, этот портал... 
emot взмахнул оставляющими багровые следы когтями...
mecho __________________&K... И в воздухе вспыхнула &rбагровая пентаграмма.&n
mload obj 95480
say откроет тебе дорогу к замку.
mecho Мелкий бес повернулся к пентаграмме, но неожиданно остновился и бросил через плечо :
mecho _- До меня дошли слухи, что на вершине черного пика творятся странные дела.
mecho _- Думаю, тебе стоит поискать там.
emot шагнул в пентаграмму и исчез, оставив резкий запашок серы
wait 1
mpurge %self%
~
#95406
РЕПОП~
2 f 100
~
context 954
unset roundstones
eval roundstones 0
worlds roundstones
calcuid conj 95406 mob
detach 95436 %conj.id%
attach 95436 %conj.id%
~
#95407
Лезть через лаз~
2 c 1
лезть пролезть~
if !%arg.contains(лаз)%
  wsend %actor% Да бога ради, только куда?
  halt
end
if %actor.fighting%
  wsend %actor% Щаас, вы, батенька, деретесь!
  halt
end
if %actor.move% < 50
  wsend %actor% _Вы полезли в узкий лаз, но быстро поняли, что вам не хватит сил пролезть до конца.
  wsend %actor% _Вы выбрались назад.
  wechoaround %actor% %actor.name% полез%actor.q% было в темный лаз, но, чуток повозившись, вылез%actor.q% назад.
  %actor.move(0)%
  halt
end
wsend %actor% _Вы полезли в узкий лаз.
wsend %actor% _Обдираясь о камни вы пробрались под завалом.
wechoaround %actor% %actor.name% полез%actor.q% в темный лаз.
%actor.move(-50)%
wechoaround %actor% ~~%actor.name% выбрал%actor.u% из темного лаза.
if %actor.realroom% == 95418
  wteleport %actor% 95480
else
  wteleport %actor% 95418
end
~
#95408
прыгаем через пропасть на восток~
2 c 100
прыгнуть~
wait 1
wechoaround %actor% _%actor.name% уцепил%actor.u% за веревку и с криком прыгнул%actor.g% через пролом.
wsend %actor% _Вы уцепились за веревку и прыгнули через пролом.
wteleport %actor% 95424
eval chanse %random.10%*(%actor.dex%+%actor.dexadd%)
if %chanse% < 92 
  wsend %actor% _Подлетая к другой стороне моста Вы не успели вовремя выпустить веревку
  wsend %actor% _И с разгона врезались в огромный камень !
  wechoaround %actor% ~~%actor.name% прилетел%actor.g% с запада, но не успев вовремя отпустить веревку, врезал%actor.u% к камень !
  wdamage %actor% 200
else
  wsend %actor% _Вы благополучно приземлились на другой стороне пролома.
  wechoaround %actor% ~~%actor.name% прилетел%actor.g% с запада и ловко приземлил%actor.u% меж камней.
end
~
#95409
прыгаем через пропасть на запад~
2 c 100
прыгнуть~
wait 1
wechoaround %actor% _%actor.name% уцепил%actor.u% за веревку и с криком прыгнул%actor.g% через пролом.
wsend %actor% _Вы уцепились за веревку и прыгнули через пролом.
wteleport %actor% 95423
eval chanse %random.10%*(%actor.dex%+%actor.dexadd%)
if %chanse% < 95
  wsend %actor% _Подлетая к другой стороне моста Вы не успели вовремя выпустить веревку
  wsend %actor% _И с разгона врезались в огромный камень !
  wechoaround %actor% ~~%actor.name% прилетел%actor.g% с запада, но не успев вовремя отпустить веревку, врезал%actor.u% к камень !
  wdamage %actor% 200
else
  wsend %actor% _Вы благополучно приземлились на другой стороне пролома.
  wechoaround %actor% ~~%actor.name% прилетел%actor.g% с запада и ловко приземлил%actor.u% меж камней.
end
~
#95410
зашли к каменному хранителю~
0 r 100
~
wait 15
mecho _Каменный хранитель строго посмотрел на Вас.
mecho _- Стой смертный!
mecho _- Одумайся!
mecho _- Зачем ты служишь тьме?
взд
wait 20
mecho _- Не думаешь ли ты, что сможешь победить меня?
хох
detach 95410 %self.id%
~
#95411
поглощается урон у каменного хранителя~
0 p 30
~
msend %damager% Под властным взглядом каменного хранителя Ваша рука отказалась повиноваться Вам!
mechoaround %damager% %damager.iname% не смог%damager.g% причинить вреда каменному хранителю.
~
#95412
проверка хитов каменного хранителя~
0 k 100
~
* Если осталось мало хитов, то пробуем слинять
if %self.hitp% < 300
  mecho _Каменный хранитель устало посмотрел по сторонам.
  mecho _- Я вижу Вам уже не уйти из тьмы.
  mecho _- Этот бой мне не выиграть.
  mecho _- Но мы еще встретимся !
  mteleport %self% 95478
  detach 95411 %self.id%
  attach 95413 %self.id%
  detach 95412 %self.id%
end
~
#95413
второй раз встречает каменного хранителя~
0 r 100
~
wait 10
mecho _Каменный хранитель воинственно глянул в Вашу сторону.
mecho _- Ваши души будут вечно гореть в очищающем пламене!
mkill %actor%
detach 95413 %self.id%
~
#95414
ползем вверх (2)~
2 c 100
лезть~
wait 1
if !%arg.contains(вверх)% 
  wsend %actor% И куда же?
  halt
end
wait 1s
wsend %actor% _Цепляясь за камни Вы начали медленно карабкаться вверх.
wechoaround %actor%  %actor.name% начал%actor.g% медленно взбираться вверх.
wteleport %actor% 95410
wechoaround %actor% _Кто-то, покрытый толстым слоем пыли, выполз из-за камня.
~
#95415
ползем вниз (2)~
2 c 100
спуститься~
wait 5
wsend %actor% Вы начали медленно спускаться вниз.
wechoaround %actor% _%actor.iname% начал%actor.g% медленно спускаться вниз.
wteleport %actor% 95409
wechoaround %actor% _Кто-то с диким ревом упал сверху.
~
#95416
Боевой триг пронырливого скелета~
0 k 25
~
flee
flee
wait 2
if %self.fighting%
  halt
end
calcuid selfroom %self.realroom% room
set roomnorth %selfroom.north%
set roomeast %selfroom.east%
set roomsouth %selfroom.south%
set roomwest %selfroom.west%
stand
set dir 0
if %roomnorth.pc% && !%dir%
  set dir north
end
if %roomeast.pc% && !%dir%
  set dir east
end
if %roomsouth.pc% && !%dir%
  set dir south
end
if %roomwest.pc% && !%dir%
  set dir west
end
sneak
%dir%
look
look
hide
~
#95417
баттл-тригер огромного паука~
0 k 40
~
set victim %random.pc%
switch %random.3%
  case 1
    msend %victim% __Огромный паук метко кинул в вас липкой паутиной.
    mechoaround %victim% __Огромный паук метко кинул в %victim.vname% липкой паутиной.
    msend %victim% __Спутанные по рукам и ногам, вы рухнули на землю!
    mechoaround %victim% __Спутанн%victim.w% по рукам и ногам, %victim.name% рухнул%victim.g% на землю.
    %victim.wait(8)%
    %victim.position(2)%
  break
  case 2
    *set victim %random.char%
    msend %victim% __Огромный паук метко плюнул в вас ядом!
    mechoaround %victim% __Огромный паук метко плюнул ядом в %victim.vname%!
    dg_cast 'яд' %victim%
    dg_cast 'слепота' %victim%
    dg_cast 'глухота' %victim%
  break
  case 3
    set victim2 %random.pc%
    set victim3 %random.pc%
    mecho __Огромный паук рванул за нити паутины, и с потолка рухнуло несколько каменных глыб!
    mechoaround %victim%   Глыба камня рухнула на %victim.vname%!
    msend %victim% __Огромная каменная глыба рухнула на вас!
    eval dmg 100+%random.100%
    mdamage %victim% %dmg%
    %victim.wait(2)%
    %victim.position(2)%
    mechoaround %victim2%   Глыба камня рухнула на %victim2.vname%!
    msend %victim% __Огромная каменная глыба рухнула на вас!
    eval dmg 100+%random.100%
    mdamage %victim2% %dmg%
    %victim2.wait(2)%
    %victim2.position(2)%
    mechoaround %victim%   Глыба камня рухнула на %victim2.vname%!
    msend %victim% __Огромная каменная глыба рухнула на вас!
    eval dmg 100+%random.100%
    mdamage %victim2% %dmg%
    %victim2.wait(2)%
    %victim2.position(2)%
  done
~
#95418
Лоад вещей в пещере паука~
2 z 100
Кровушка стынет в жилах~
wload obj 95470
wload obj 95471
~
#95419
Мертвяку дали голову~
0 j 100
~
wait 1
if %object.vnum% != 95470
  wait 1
  mpurge %object%
  mecho Мертвяк выкинул %object.name% в пропасть.
  halt
end
wait 1
mpurge %object%
wait 2s
sit
mecho _Мертвяк засопел и принялся прилаживать голову на плечи.
mtransform 95442
wait 12s
mecho _Мертвяк сумел наконец кое-как приткнуть голову на обрубке шеи.
wait 3
ухм
wait 4
emot довольно заухал
mtransform 95443
stand
set target %random.pc%
if %target%
  mechoaround %target% __Мертвяк заметил %target.vname%!
  msend %target% __Мертвяк заметил Вас!
  wait 1
  выть 
  mkill %target%
end
wait 300s
if !%self.fighting%
  mjunk all
  mecho Мертвяк засопел, валко прошагал вниз по тропе и исчез.
  wait 1
  mpurge %self%
end
~
#95420
Великан агрит великана - 2~
0 b 20
~
kill blackgiant954
~
#95421
Великаны хиляются~
0 l 70
~
mecho __%self.name% отскочил в сторону и извлек из сумки напиток сурья.
mecho %self.name% взял напиток сурья в левую руку.
mecho %self.name% осушил напиток сурья.
%self.hitp(%self.maxhitp%)%
~
#95422
Великан агрит великана~
0 b 20
~
kill whitegiant954
~
#95423
Великан пьет отраву~
0 l 50
~
mecho __%self.name% отскочил в сторону и схватил бутылочку с прозрачным зельем.
осуш potion954
%self.hitp(1000)%
detach 95423 %self.id%
~
#95424
Боевые сообщения у великанов~
0 k 10
~
switch %random.2%
  case 1
    mecho __%self.name% обрушил на противника сокрушающий удар!
    mecho __&YОкрестные скалы вздрогнули и зашатались.&n
    masound __Чудовищный грохот донесся с севера!
  break
  case 2
    mecho __%self.name% испустил страшный боевой клич!
    mecho __&YСнежная лавина сорвалась с соседнего горного склона.&n
    masound __Чудовишный вопль и грохот обвала донеслись с севера.
  break
done
~
#95425
Великану дали отраву~
0 j 100
~
wait 1
if %object.vnum% != 95472
  drop %object.name%
  halt
end
detach 95421 %self.id%
attach 95423 %self.id%
~
#95426
Убит великан~
0 f 100
~
if %self.vnum% == 95444
  calcuid giant 95445 mob
else
  calcuid giant 95444 mob
end
exec 95427 %giant.id%
if (( %world.curobjs(95457)% < 3 ) && (%random.100% < 12))
  mload obj 95457
end
~
#95427
Великан уходит~
0 z 0
~
wait 1
хохот
крича Ну вот и пришел тебе конец!!!
wait 2
рыч
wait 2
восторг
хохот
wait 2
emot снова захохотал, и не оглядываясь ушел по тропе вниз
убра все
mjunk all
wait 1
mpurge %self%
~
#95428
Убит огр. паук~
0 f 100
~
mecho _&cПаук рухнул наземь и забился в агонии.&n
mecho _&cДвижения громадных лап безжалостно разорвали и скомкали сеть.&n
mecho _&cЧто-то выпало из сети.&n
calcuid spiderroom 95460 room
exec 95418 %spiderroom.id%
~
#95429
Взяли камень~
1 g 100
~
context 954
if (( %actor.vnum% != 95446 ) && !%actor.quested(95400)%)
  osend %actor% Вас обожгло при опытке взять пестрый камушек.
  return 0
  halt
end
eval roundstones %roundstones%+1
worlds roundstones
if %roundstones% > 3
  osend %actor% Див ведь сказал - не больше трех камней... Не стоит его злить понапрасну.
  return 0
  halt
end
if (( %world.curobjs(95478)% == 1 ) && ( %actor.vnum% != 95446 ))
  calcuid deav 95446 mob
  exec 95434 %deav.id%
end
wait 1
osend %actor% Пестрый камушек вспыхнул и рассыпался в прах.
wait 1
opurge %self%
~
#95430
Дамажнули дива~
0 l 100
~
ворч
stand
wait 2
крича А ну вон - отсель!
emot зыркнул на Вас и проревел неразборчивое проклятие
foreach target %self.pc%
  dg_cast 'слово возврата' %target%
end
~
#95431
Триг на вход у дива~
0 q 100
~
wait 1s
if %self.fighting%
  halt
end
ухм
say Здорово!
mecho _- Что, тоже пройти желаешь?
mecho _- А меня вот посадили тут, да попросили не пущать никого.
хих
wait 2s
emot задумчиво почесал торчащий белый клык
say Ну ладно, так и быть... Cкучно мне.
mecho _- Сыграем в игру с тобой.
mecho _- Сумеешь меня одолеть, так и быть - пропущу.
mecho _- Ладно?
attach 95432 %self.id%
detach 95431 %self.id%
~
#95432
Начало игры с дивом~
0 d 0
ладно согласен согласно давай~
wait 1
if %actor.vnum% != -1
  halt
end
say Так вот значит.
mecho _- Брошу я камешков горсть.
mecho _- Можешь один взять, али два или три - но не более.
mecho _- Потом я беру.
wait 1s
say Кто последний возьмет - тот и проиграл.
mecho _- Выиграешь - пропущу тебя беспошлинно.
mecho _- Проиграешь - проваливай, откуда приш%actor.y%.
mecho _- Все ли понял%actor.g%? 
wait 4
say Ну вот и славненько.
foreach gamer %self.pc%
  %gamer.unsetquest(95400)%
done
%actor.setquest(95400)%
eval maxstones 18+%random.5%
eval i %maxstones%
while %i% 
  mload obj 95478
  eval i %i%-1
done
attach 95433 %self.id%
drop all
wait 1
if %random.100% < 51
  say Ну что - начинай.
  say Как возьмешь, сколько хотел%actor.g%, скажешь, что все мол.
else
  exec 95433 %self.id%
end
detach 95432 %self.id%
~
#95433
Сказали "все" (ход дива)~
0 d 1
все~
context 954
if %roundstones% == 0
  say Так дело не пойдет, сейчас твой черед!
  halt
end
eval roundstones 0
worlds roundstones
eval worldstones %world.curobjs(95478)%
if %worldstones% == 0
  %actor.unsetquest(95400)%
  wait 3
  кив
  say Вот я и выиграл!
  wait 3
  ухм
  say Ступай-ка ты себе до дому, не с твоим умишком по горам шастать.
  wait 3
  emot принялся снова играться камушками
  attach 95433 %self.id%
  detach 95431 %self.id%
  detach 95432 %self.id%
  detach 95433 %self.id%
end
if %worldstones% <= 4
  eval getstones %worldstones% - 1
else
  eval getstones %random.3%
end
switch %getstones%
  case 0
    get gamestone954
    %actor.unsetquest(95400)%
    say Ну что ж, проиграл я...
    буб
    say Видать и на старуху бывает проруха,
    wait 1s
    say Проходи, что ли.
    emot отодвинулся в сторонку
    attach 95433 %self.id%
    detach 95431 %self.id%
    detach 95432 %self.id%
    mtransform 95447
    detach 95433 %self.id%
    halt
  break
  case 3
    get gamestone954
    case 2
      get gamestone954
      case 1
        get gamestone954
      done
      eval roundstones 0
      worlds roundstones
      say Все - теперь твой черед.
~
#95434
Див выиграл~
0 z 0
~
foreach gamer %self.pc%
  if %gamer.quested(95400)%
    %gamer.unsetquest(95400)%
  break
end
done
wait 1s
кив
say Вот я и выиграл!
wait 3
ухм
say Ступай-ка ты себе до дому, не с твоим умишком по горам шастать.
wait 3
emot принялся снова играться камушками
detach 95431 %self.id%
detach 95432 %self.id%
detach 95433 %self.id%
~
#95435
Снимаем метку квеста на входе~
2 e 100
~
*На всякий случай
wait 1
if %actor.quested(95400)%
  %actor.unsetquest(95400)%
end
~
#95436
Вход к заклинателю~
0 q 100
~
wait 1
mecho _Колдун повернулся и посмотрел на Вас.
emot язвительно улыбнулся
mecho Заклинатель гор негромко сказал : 'Так я и знал... Мой бывший учитель не мог простить самовольства ученика.'
say Но ему следовало бы найти кого-нибудь получше...
say &RУбить его!!&n
emot указал на Вас!
mforce guard95400 mkill %actor%
mforce guard95401 mkill %actor%
cast 'гнев' %actor.name%
detach 95436 %self.id%
~
#95437
Убит заклинатель~
0 f 100
~
*mload obj 95481
if ((%random.1000% < 20) && (%world.curobjs(593)% < 1))
  mload obj 593
end
~
#95438
Вход в портал~
1 c 2
войти~
wait 1
if !%arg.contains(пентаграмма)%
  osend %actor% _Куда войти-то? (ногами, ногами.. не знаю, что Вы подумали)
  halt
end
if %actor.realroom% != 95429
  osend %actor% Вы не видите здесь пентаграмму.
  halt
end
osend %actor% Стиснув в руках странный камень, вы шагнули в пентаграмму.
oechoaround %actor% Стиснув в руках странный камень, %actor.name% шагнул%actor.g% в пентаграмму.
wait 1
eval dmg %actor.hitp%+10
oecho Пентаграмма внезамно вспяхнула ярким светом, и взорвалась!
osend %actor% Шар из черного камня рассыпался в Ваших руках.
odamage %actor% %dmg%
oecho _Как видно, самонадеянный бес что-то напутал...
opurge redportal954
wait 1
opurge %self%
~
#95439
Запинали шамана~
0 f 0
~
if %world.curobjs(95446)% < 6
  mload obj 95446
end
~
#95440
Агро~
0 o 100
~
*test
~
#95441
Лоад дива~
0 n 100
~
mload obj 95405
отпере сундук
открыть сундук
взя все все.труп
пол все сундук.земля
взя все все.труп
пол все сундук.земля
взя все все.труп
пол все сундук.земля
взя все
пол все сундук.земля
взя все
пол все сундук.земля
взя все
пол все сундук.земля
брос все
закр сундук
запер сундук
calcuid key 95405 obj
mpurge %key%
mjunk all
~
$~
