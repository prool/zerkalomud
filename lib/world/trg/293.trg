#29300
лезем в гнездо~
2 c 0
лезть залезть~
if !(%arg.contains(гнездо)%) 
  wsend       %actor% Куда это Вы хотите пролезть???
  return 0
  halt
end
wsend       %actor% Хватаясь за ветки дуба, вы полезли в птичье гнездо.
wechoaround %actor% _%actor.name% полез%actor.q% в птичье гнездо, хватаясь за ветки дуба.
wait 1s
wsend %actor% - Вы оказались на дне большого гнезда.
wteleport %actor.name% 29352
wechoaround %actor% Кто-то залез в гнездо.
calcuid ptenec 29309 mob
attach 29305 %ptenec.id%
exec  29305 %ptenec.id% 
~
#29301
лезем из гнезда~
2 c 0
лезть вылезть~
if !(%arg.contains(назад)%) 
  wsend       %actor% Куда это Вы хотите пролезть???
  return 0
  halt
end
wsend       %actor% Осторожно хватаясь за ветки дуба, вы полезли назад.
wechoaround %actor% %actor.name% полез%actor.q% назад, осторожно хватаясь за ветки дуба.
wait 1s
wsend %actor% - Вы оказались на огромной дубовой ветке.
wteleport %actor.name% 29330
wechoaround %actor% Кто-то вылез из птичьего гнезда.
~
#29302
лезем в дупло~
2 c 0
лезть залезть~
if !(%arg.contains(дупло)%) 
  wsend       %actor% Куда это Вы хотите пролезть???
  return 0
  halt
end
wsend       %actor% Согнувшись в три погибели, вы полезли в дупло.
wechoaround %actor% %actor.name% полез%actor.q% в дупло, согнувшись в три погибели.
wait 1s
wsend %actor% - Вы оказались в уютной комнатушке внутри дуба.
wteleport %actor.name% 29353
wat 29353 wechoaround %actor% Кто-то пролез в дупло.
calcuid starichok 29310 mob
attach 29308 %starichok.id%
exec  29308 %starichok.id% 
~
#29303
лезем из дупла~
2 c 0
лезть вылезть~
if !(%arg.contains(назад)%) 
  wsend       %actor% Куда это Вы хотите пролезть???
  return 0
  halt
end
wsend       %actor% Согнувшись в три погибели, вы полезли из дупла.
wechoaround %actor% %actor.name% полез%actor.q% из дупла, согнувшись в три погибели.
wait 1s
wsend %actor% - Вы оказались на огромной дубовой ветке.
wteleport %actor.name% 29332
wat 29332 wechoaround %actor% Кто-то вылез сюда из дупла дуба.
~
#29304
змей движется~
0 r 100
~
if %self.fighting%
  halt
end
wait 1s
mecho   Змей движется в сторону гнезда, не обращая на вас внимания.
~
#29305
птенец пищит~
0 z 100
~
wait 3s
switch %random.4%
  case 1
    mecho Птенец пропищал: "Вы слыхали как поют скворцы? ПИ-ПИ-ПИ!"
  break
  case 2
    mecho Птенец пропищал: "Когда я выросту, я стану орлом!"
  break
  case 3
    mecho Птенец пропищал: "Есть хочу! Заморил бы щас какого-нибудь червячка!"
  break
  case 4
    mecho Птенец пропищал: "Мой дедушка был попугаем и жил в золотой клетке!"
  break
  default
  break
done
calcuid ptenec 29309 mob
detach 29305 %ptenec.id%  
end
~
#29306
птенцу дали мясо~
0 j 100
~
wait 1
if %object.vnum% == 29301
  wait 1
  mpurge %object%
  wait 1s
  mecho Птенец с визгом набросился на змеиное мясо.
  wait 3s
  msend %actor% - Вкуснотища! А еще есть??? Надо тебя чем-нибудь отблагодарить.
  wait 2s
  mecho Птенец начал рыться в своем помете, что-то выискивая.
  wait 4s
  if %world.curobjs(29308)% > 10
    дум
    wait 1s
    эмо печально пискнул.
    msend %actor% - Извини. Не нашел ничего. Давай я тебе лучше спою?
    wait 2s
    mecho Птенец начал петь.
    wait 1s
    mecho Вам стало плохо.
    mdamage %actor% 20
    wait 2s
    msend %actor% - Понравилось? Захочешь еще послушать - приходи.
    halt
  end
  взд
  msend %actor% - Погоди, погоди! Щас что-нибудь, да найду!
  wait 2s
  mecho Птенец ухватился крылышками за ветку гнезда и с натугой вытащил.
  mload obj 29305
  wait 4s
  улы
  msend %actor% - На вот, держи!
  wait 2s
  дат ветка %actor.name%
end
~
#29307
пауку дали лук без тетивы~
0 j 100
~
wait 1
if %object.vnum% != 29309
  боя
  say Чего-чего тебе надо?
  drop %object.name%
  halt
end
wait 1
mpurge %object%
wait 2s
msend %actor% - И что я должен с ним сделать?
wait 1s
mecho Паук задумался и начал изучать лук.
wait 1s
msend %actor% - А понимаю, понимаю! Ты хочешь тетиву для него!
msend %actor% - Сейчас, сейчас сделаю, только не ешь меня!
wait 1s
mecho Паук начал ловко вить нить паутины.
wait 1s
mecho Паук привязал паутинную нить к концам лука.
wait 1s
mload obj 29308
дат лук %actor.name%
улы
wait 1s
msend %actor% - Теперь-то ты точно не съешь меня?
~
#29308
приветствие старичка~
0 z 100
~
wait 2s
msend %actor% Старичок хитровато взглянул на  Вас.
mechoaround %actor% Старичок хитровато взглянул на %actor.vname%
wait 1s
msend %actor% - Приветствую тебя в моем доме!
msend %actor% - Не хочешь ли сослужить добрую службу мне?
msend %actor% - Стар я стал и не в состоянии уходить далеко от моего дуба.
msend %actor% - Передай письмецо моей сестре, что живет на этом острове.
msend %actor% - Пусть знает, что я еще жив и не мешало бы меня навестить хоть разок.
wait 1s
взд
~
#29309
сказать старичку ХОЧУ~
0 d 0
хочу~
wait 1s
mecho Старичок хлопнул в ладошки от радости.
wait 1s
msend %actor% - Погоди немножко, щас я письмецо на бересте накалякаю.
wait 2s
mecho Старичок, морща лоб, принялся старательно выводить закорючки на грязной бересте.
wait 2s
mecho Старичок закончил работу, свернул письмо в трубочку и протянул вам.
msend %actor% - На вот держи, да смотри не потеряй!
mload obj 29307
дат весточка %actor.name%
wait 3s
mecho Старичок улыбаясь вылез из дупла и куда-то ушел.
mpurge %self%
calcuid starichok 29310 mob
detach 29308 %starichok.id%  
~
#29310
приветствие охотника~
0 r 100
~
wait 1s
msend %actor% Охотник оценивающе посмотрел на  Вас.
mechoaround %actor% Охотник оценивающе посмотрел на %actor.vname%
wait 1s
msend %actor% - Привет тебе! И как такому хлюпику угораздило забраться сюда?
msend %actor% - Ты наверно великий колдун? Но никакая магия не поможет,
msend %actor% - когда я пущу в тебя стрелу.
wait 1s
ухм
wait 3s
msend %actor% - Шучу, шучу....а ты поверил, да?
msend %actor% - А вообще, если найдешь подходящую ветку, 
msend %actor% - я бы помог тебе сделать лук не хуже чем у меня.
~
#29311
охотнику дали ветку~
0 j 100
~
wait 1
if %object.vnum% == 29305
  wait 1
  mpurge %object%
  wait 2s
  msend %actor% - О, какая хорошая ветка, из нее выйдет отличный лук.
  wait 2s
  mecho Охотник принялся строгать ветку.
  mload obj 29309
  wait 1s
  улы
  wait 1s
  msend %actor% - На вот, держи! Отличный лук получился!
  wait 2s
  дат лук %actor.name%
  wait 2s
  msend %actor% - Правда тетиву для него тебе придется поискать,
  msend %actor% - у меня нет ничего подходящего.
  wait 1s
  mecho Охотник огорченно развел руками.
end
~
#29312
приветствие паука~
0 r 100
~
wait 1s
msend %actor% Паук испуганно посмотрел на Вас.
mechoaround %actor% Паук испуганно посмотрел на %actor.vname%
wait 1s
msend %actor% - Ты тоже хочешь съесть меня?
msend %actor% - Не делай этого пожалуйста, я невкусный! И от меня плохо пахнет!
взд
wait 1s
msend %actor% - Не ешь меня, а я тебе быть может когда-нибудь еще пригожусь.
~
#29313
вооружаемся богатырским луком~
1 j 100
~
osend  %actor% Тетива на луке грозно задребезжала в предвкушении битвы.
~
#29314
что-то падает~
2 e 100
~
wait 1
switch %random.4%
  case 1
    wsend %actor% Небольшой желудь упал с верхушки дуба и больно ударил Вас!
    wechoaround %actor% Небольшой желудь упал с верхушки дуба и больно ударил %actor.vname%!
    wdamage %actor% 5
  break
  case 2
    wsend %actor% Острый сук упал с верхушки дуба и больно ударил Вас!
    wechoaround %actor% Острый сук упал с верхушки дуба и больно ударил %actor.vname%!
    wdamage %actor% 10
  break
  case 3
    wsend %actor% Тяжелая ветка упала с верхушки дуба и больно ударила Вас!
    wechoaround %actor% Тяжелая ветка упала с верхушки дуба и больно ударила %actor.vname%!
    wdamage %actor% 15
  break
  default
  break
done
end
~
#29315
каждый пульс боя с дятлом~
0 k 33
~
switch %random.20%
  case 1
    msend %actor% Пестрый дятел ударил Вас клювом прямо в темечко!
    mechoaround %actor% Пестрый дятел ударил клювом %actor.vname% прямо в темечко!
    mdamage %actor% 20
  break
  case 2
    msend %actor% Пестрый дятел ударил Вас клювом прямо в руку!
    mechoaround %actor% Пестрый дятел ударил клювом %actor.vname% прямо в руку!
    mdamage %actor% 15
  break
  case 3
    msend %actor% Пестрый дятел ударил Вас клювом прямо в живот!
    mechoaround %actor% Пестрый дятел ударил клювом %actor.vname% прямо в живот!
    mdamage %actor% 10
  break
  case 4
    msend %actor% Пестрый дятел ударил Вас клювом прямо в ногу!
    mechoaround %actor% Пестрый дятел ударил клювом %actor.vname% прямо в ногу!
    mdamage %actor% 5
  break
  default
  break
done
end
~
#29316
померла рысь~
0 f 100
~
if (%world.curobjs(29303)% < 10) &&  (%random.2% == 1)
  mload obj 29303
end
~
$~
