#96300
Ястреб утаскивает чара~
2 e 100
~
wait 1
if %exist.mob(96319)%
  eval victim %random.pc%
  %echo% Неожиданно откуда-то сверху послышались громкие хлопки.
  %echo% Из-за ветвей показался громадный ястреб, летящий прямо на Вас!
  %send% %victim% Сделав резкий поворот ястреб ухватил Вас своими острыми шпорамии вновь взмыл вверх! 
  %echoaround% %victim% Сделав резкий поворот ястреб ухватил %victim.vname% своими острыми шпорамии вновь взмыл вверх!
  wait 1
  %send% %victim% Спустя пару минут ястреб разжал когти и вы кубарем скатились в гнездо.
  %teleport% %victim% 96388
  detach 96300 %self.id%
end
~
#96301
Ястреб видит как кто-то заходит в пенту~
0 e 0
пентаграммы.~
wait 1s
к !суд бог!
~
#96302
Червь глотает~
0 b 50
~
wait 1
set victim %random.pc%
if !%victim%
  halt
end
if (%random.100% <= 51)
  msend %victim% Неудачно споткнувшись, вы угодили прямо в пасть меланхоличного червя!
  mechoaround %victim% Неудачно споткнувшись, %victim.name% угодил прямо в пасть меланхолично ползущего червя!
  mteleport %victim% 96391
end
~
#96303
Убили червя~
0 f 100
~
calcuid troom 96391 room
foreach target %troom.pc%
  mteleport %target% %self.realroom%
  mechoaround %target% Покрыт%actor.w% всякой дрянью %target.name% вывалил%actor.u% из распоротого древесного червя!
  msend %target% Кто-то вспорол склизкое брюхо древесного червя и вы вывалились наружу!
done
%door% 96300 north room 96303
%door% 96303 south room 96300
if %random.10% <= 3
  %load% obj 96316
end
~
#96304
Гризачка клонируется~
0 v 1
~
if (%world.curmobs(96313)% < 1) 
  mecho Гризачка прикрыла глаза и прошептала : 'пусть будет много меня'.
  mecho Гризачка раздвоилась !
  mload mob 96313
end
if (%world.curmobs(96314)% < 1) 
  mecho Гризачка прикрыла глаза и прошептала : 'пусть будет много меня'.
  mecho Гризачка раздвоилась !
  mload mob 96314
end 
if (%world.curmobs(96315)% < 1) 
  mecho Гризачка прикрыла глаза и прошептала : 'пусть будет много меня'.
  mecho Гризачка раздвоилась !
  mload mob 96315
end
if (%world.curmobs(96328)% < 1) 
  mecho Гризачка прикрыла глаза и прошептала : 'пусть будет много меня'.
  mecho Гризачка раздвоилась !
  mload mob 96328
end
~
#96305
Лезем из червя~
2 c 1
лезть ползти пролезть выползти~
wait 1
if (!%arg.contains(дыр)% && !%arg.contains(наружу)% && !%arg.contains(назад)% && !%arg.contains(отсюда)%)
  wsend %actor% Куда это вы лезете?
  halt
end
if (%actor.move% < 45)
  wsend %actor% Вы слишком устали...
  halt
end
wsend %actor% Вы встали на карачки и поползли в дыру.
wechoaround %actor% %actor.name% встал на карачки и принялся протискиваться в пульсирующую дырку.
wait 2s
if ((%random.100% < 90) && %exist.mob(96311)%)
  wsend %actor% Вы долго ползали по кольцам червя, но так никуда и не пришли!
  halt
end
wsend %actor% Наконец-то вы выбрались наружу! Но в каком виде...
wteleport %actor% 96303
~
#96306
Велет скидывает чара на уровень ниже~
0 k 100
~
if (%random.100% <= 15)
  msend %actor% Умелым ударом старший велет оттолкнул вас на самый край дерева.
  msend %actor% Не удержав равновесия, вы с ужасом осознали, что падаете с Прадуба!
  mechoaround %actor% Умелым ударом старший велет оттолкнул %actor.rname% на самый край дерева.
  mechoaround %actor% Не удержав равновесия, %actor.name% начал неумолимо падать вниз!
  mteleport %actor% 96322
  wait 1
  mdamage %actor% 100 
  msend %actor% К счастью, Вы упали на ветку уровнем ниже, отделавшись лишь парой ссадин.
end
~
#96307
Рип одной из сестер (лоад стафа)~
0 f 100
~
eval rnd %random.200%
if (%rnd% < 10) && (%world.curobjs(96302)% < 5)
  mload obj 96302
elseif  (%rnd% < 20) && (%world.curobjs(96303)% < 5)
  mload obj 96303
elseif (%rnd% < 30)  && (%world.curobjs(96304)% < 5)
  mload obj 96304 
elseif (%rnd% < 40) && (%world.curobjs(96312)% < 5)
  mload obj 96312
elseif (%rnd% < 50) && (%world.curobjs(96313)% < 5)
  mload obj 96313
end
~
#96308
Рип муравья~
0 f 100
~
if (%random.100% <= 7) && (%world.curobjs(96308)% < %world.maxobj(96308)%)
  mload obj 96308
end
~
#96309
Отражения заклов в чара у ведого~
0 w 100
~
wait 1
dg_cast '%castname%' .%actor.name%
~
#96310
Лякливица сумонит духов~
0 k 100
~
if %random.20% < 15
  mecho Лякливица пронзительно закричала, призывая на помощь!
  mecho Мелкий дух медленно появился из пустоты.
  mload mob 96331
end
~
#96311
Хил Ломоты~
0 b 100
~
if %exist.mob(96334)% && %exist.mob(96301)%
  calcuid abc 96334 mob
  %force% %abc% восток
  %force% %abc% к 'исц' ломота
  %force% %abc% запад
end
~
#96312
Раздвоение Черевухи~
0 w 100
~
if %castname% == шок
  %echo% Острый ледяной осколок раскроил Черевуху пополам! Но ей все нипочем!
  %load% mob 96335
end
if %castname% == камнепад
  %echo% Яркая вспышка разорвала Черевуху пополам! Но ей все нипочем!
  %load% mob 96335
end
~
#96313
Коркуша орет~
0 k 100
~
if %random.20% < 3
  foreach victim %self.char%
    %send% %victim% Коркуша пронзительно вскрикнула, на время оглушив Вас!
    %victim.position(6)%
    %victim.wait(3)%
  done
end
~
#96314
Репоп зоны~
2 f 100
~
wdoor 96300 north purge
wdoor 96303 south purge
~
#96315
Входим к Велесу~
0 q 100
~
wait 1s
makeuid questor963 %actor.id%
global questor963
calcuid volhv 96000 mob
remote questor963 %volhv.id%
эм с удивлением посмотрел на Вас
wait 1s
хмур
г Что делают здесь смертные?!
wait 1s
%echo% Вы поспешно рассказали о цели своего прибытия.
wait 1
хмур
wait 1
пож
г Между нами и северными богами идет война.
г Но волхв ваш, пусть зря не печалится.
г От веры людей зависит сила богов, и потому укроем мы смертных от битвы этой.
г Идите, и волхву тому скажите, чтоб верил в богов своих.
wait 1s
хмур
г Впрочем, раз вы уже тут, то можете помочь в одном деле.
г В Вальгалле, где Один, бог северный, зачастую пирует со своими воинами,
г Возле трона его, висит волшебное копье Гунгнир, убивающего всякого, в кого попадет.
г Если оно внезапно пропадет...
хмур
г Принеси мне его, смертный, и получишь за это награду щедрую.
г Ступай же! Ворон укажет вам путь.
calcuid voron 96339 room
attach 96319 %voron.id%
calcuid voron2 96558 room
attach 96321 %voron2.id%
detach 96315 %self.id%
~
#96316
Играем на свирели~
1 c 1
сыграть~
wait 1
if !%arg.contains(мелодию)%
  osend %actor% Что вы хотите сыграть?
  halt
end
oechoaround %actor.name% %actor.name% поднес%actor.q% свирель к губам и слегка подул в нее.
if (%world.curmobs(96339)% < 1)
  wait 1s
  oecho Послышалась переливчатая зовущая мелодия.
  wait 1s
  oecho Лунный зверь медленно сгустился из воздуха, зачарованно глядя на вас.
  oechoaround %actor% Лунный зверь медленно сгустился из воздуха, зачарованно глядя на %actor.vname%
  oload mob 96339
  halt
end
calcuid moonanimal 96339 mob
if ((%moonanimal.realroom% == %actor.realroom%) && !%moonanimal.leader%)
  wait 1s
  oecho Послышалась грустная прощальная мелодия.
  oecho Лунный зверь тоскливо взвыл и растаял в воздухе.
  wait 1
  opurge %moonanimal%
  halt
end
if ((%moonanimal.realroom% == %actor.realroom%) && (%moonanimal.leader% == %actor%))
  oecho Послышалась переливчатая прозрачная мелодия.
  wait 1s
  oechoaround %actor% Лунный зверь танцует в воздухе, зачарованно глядя на %actor.vname%
  oecho Лунный зверь танцует в воздухе, зачарованно глядя на вас.
  halt
end
if ((%moonanimal.realroom% == %actor.realroom%) && (%moonanimal.leader% != %actor%))
  oecho Послышалась тонкая звенящая мелодия.
  wait 1s
  oecho Лунный зверь беспокойно взвыл.
  oforce %moonanimal% follow я
  wait 3
  oechoaround %actor% Лунный зверь подлетел ближе к %actor.dname%
  oecho Лунный зверь подлетел поближе к вам.
  halt
end
if (%moonanimal.realroom% != %actor.realroom%)
  oecho Послышалась настойчивая зовущая мелодия.
  wait 1s
  oechoaround %moonanimal% Лунный зверь вдруг беспокойно взвыл и растаял в воздухе.
  oecho Лунный зверь со свистом причался откуда-то, и подлетел к вам.
  oteleport %moonanimal% %actor.realroom%
end
~
#96317
Людница призывает зверя~
0 k 100
~
wait 1
%echo% Людница поспешно поднесла серебряную свирель ко рту, и быстро заиграла.
%echo% Послышалась переливчатая зовущая мелодия.
wait 1
%echo% Лунный зверь медленно сгустился из воздуха, зачарованно глядя на вас.
%load% mob 96338
calcuid abc 96338 mob
%force% %abc% пом людница
detach 96317 %self.id%
end
~
#96318
Читаем книжку~
1 c 2
изучить~
wait 1
if !%arg.contains(записки)%
  %send% %actor% Что вы хотите изучить?
  halt
end
eval skl %actor.remort%*5+86
wait 1
if %actor.class% == 3
  if !%actor.skill(боевой клич)%
    %send% %actor% Внимательно изучив записки, Вы постигли умение "боевой клич".
    %skillturn% %actor.name% боев.клич set
    %purge% %self.id%
  elseif %actor.skill(боевой клич)% < %skl%
    %send% %actor% Внимательно изучив записки, Вы стали намного опытнее в умении "боевой клич".
    %skilladd% %actor.name% боев.клич 5
    %purge% %self.id%
  else
    %send% %actor% Увы, ничего нового в этих записках Вы не обнаружили.
    %purge% %self.id%
  end
else
  %send% %actor% Какие-то совершенно не интересные вам записки.
end
~
#96319
Ворон телепортит в след зону~
2 e 100
~
wait 1s
%echo% Ворон недовольно поглядел на Вас.
%echo% Ворон сказал : 'Кар-р-р-р-р-р!' 
%portal% 96558 1
~
#96320
Репоп зоны~
2 f 100
~
calcuid voron 96339 room
detach 96319 %voron.id%
calcuid voron2 96558 room
detach 96321 %voron2.id%
~
#96321
Ворон телепортит назад~
2 e 100
~
wait 1s
%echo% Ворон недовольно поглядел на Вас.
%echo% Ворон сказал : 'Кар-р-р-р-р-р!' 
%portal% 96339 1
~
#96322
Даем Гунгнир Велесу~
0 j 100
~
wait 1
if %object.vnum% != 96411
  хмур
  брос все
else
  %purge% %object%
  ухм
  эм задумчиво повертел копье в руках
  г Да, это оно!
  wait 1s
  г Держи свою награду.
  wait 1
  %echo% Велес покопался в МУДе.
  eval rnd %random.100%
  if (%rnd% < 25) && (%world.curobjs(96412)% < 2)
    %echo% Велес создал обруч божественной силы!
    %load% obj 96412
    дать обруч .%actor.name%
  elseif (%rnd% < 50) && (%world.curobjs(96416)% < 2)
    %echo% Велес создал сапоги божественного телосложения!
    %load% obj 96416
    дать сапоги .%actor.name%
  elseif (%rnd% < 75) && (%world.curobjs(96417)% < 2)
    %echo% Велес создал перевязь божественной ловкости!
    %load% obj 96417
    дать перевяз .%actor.name%
  else
    %load% obj 96413
    %echo% Велес создал статую %actor.vname% из чистого золота!
    дать стату .%actor.name%
    брос стату
  end
end
~
#96323
Одеваем ведых при лоаде~
0 n 100
~
eval rnd %random.50%
if (%rnd% < 10) && (%world.curobjs(96301)% < 5)
  mload obj 96301
elseif (%rnd% < 20) && (%world.curobjs(96309)% < 5)
  mload obj 96309
elseif (%rnd% < 30) && (%world.curobjs(96310)% < 5)
  mload obj 96310
end
~
#96324
Одеваем древичей при лоаде~
0 n 100
~
if (%random.100% <= 5) && (%world.curobjs(96307)% < 5)
  %load% obj 96307
end
if %self.vnum% == 96325
  след ведый
end
if %self.vnum% == 96324
  след лап.древ
end
~
#96325
даем ворону глазики~
0 j 100
~
wait 1
if (%object.vnum%==753)
  эм оживился и радостно закаркал.
  wait 1s
  %echo% С плохо скрытым омерзением вы смотрите как ворон смакует %object.vname%.
  wait 1s
  эм благодарно посмотрел по сторонам.
  wait 1s
  %echo% Задумчиво переступив с ноги на ногу, ворон вздохнул и легонько клюнул свое крыло.
  %purge% %object%
  %load% obj 96317
  брос черн.пер
  wait 1
  г Кар-р-р-р-р-р-р!
  detach 96325 %self.id%
end
~
$~
