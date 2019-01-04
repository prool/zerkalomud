* BRusMUD trigger file v1.0
#66400
смерть трухлявого~
0 f0 100
~
mload obj 66400













~
#66401
смерть землеройки~
0 f0 100
~
mload obj 66401













~
#66402
смерть крысы~
0 f0 100
~
mload obj 66402













~
#66403
смерть упыря~
0 f0 100
~
if (%world.curobjs(66411)% < 10) && (%random.10% <= 4)
mload obj 66411
end
calcuid kost 66400 room
attach 66407 %kost.id%













~
#66404
ломать куст1~
2 c0 100
ломать~
if !(%arg.contains(куст)%)
   wsend       %actor% Чего это Вы хотите ломать ?
   return 0
   halt
end
  wsend       %actor% Представив себя медведем, вы вырвали ближайший куст с корнем.
  wsend       %actor% Глупо. Не правда ли ?
  wait 1s
  %actor.move(-30)%
wechoaround %actor% %actor.name%, окончательно озверев, вырвал ближайший куст с корнем.
wechoaround %actor% "Во бугай!",- подумали Вы.
wload obj 66406
calcuid kust 66444 room
detach 66404 %kust.id%













~
#66405
ломать куст2~
2 c0 100
ломать~
if !(%arg.contains(куст)%)
   wsend       %actor% Чего это Вы хотите ломать ?
   return 0
   halt
end
  wsend       %actor% Представив себя медведем, вы вырвали ближайший куст с корнем.
  wsend       %actor% Глупо. Не правда ли ?
  wait 1s
  %actor.move(-30)%
wechoaround %actor% %actor.name%, окончательно озверев, вырвал ближайший куст с корнем.
wechoaround %actor% "Во бугай!",- подумали Вы.
wload obj 66406
calcuid kust 66425 room
detach 66405 %kust.id%













~
#66406
Репоп~
2 f0 100
~
calcuid kust 66444 room
attach 66404 %kust.id%
calcuid kust 66425 room
attach 66405 %kust.id%
calcuid kost 66429 room
attach 66408 %kost.id%
calcuid starik664 66400 mob
detach 66411 %starik664.id%
calcuid starik664 66400 mob
detach 66412 %starik664.id%
calcuid starik664 66400 mob
detach 66413 %starik664.id%
calcuid starik664 66400 mob
detach 66424 %starik664.id%
calcuid starik664 66400 mob
detach 66425 %starik664.id%
calcuid starik664 66400 mob
detach 66426 %starik664.id%
calcuid starik664 66400 mob
detach 66427 %starik664.id%
calcuid starik664 66400 mob
detach 66428 %starik664.id%
calcuid starik664 66400 mob
detach 66429 %starik664.id%
calcuid starik664 66400 mob
detach 66430 %starik664.id%
calcuid starik664 66400 mob
attach 66410 %starik664.id%








~
#66407
Расколоть камень~
2 c0 100
расколоть~
if !(%arg.contains(камень)%)
   wsend       %actor% Чего это Вы хотите расколоть ?
   return 0
   halt
end
  wsend       %actor% Вы со всех сил ударили по черному камню и от него отвалился осколок.
  wait 1s
  %actor.move(-50)%
wload obj 66412
 wait 1s
calcuid kost 66400 room
detach 66407 %kost.id%













~
#66408
Бросаем кость~
2 h0 100
~
if %object.vnum% == 66411
  wait 2s
  wsend       %actor% Кость упала в костер и вспыхнула красным огнем.
  wait 1s
wechoaround %actor% %actor.name% Кость упала в костер и вспыхнула красным огнем.
wpurge obj 66411
wload obj 66410
 wait 1s
calcuid kost 66429 room
detach 66408 %kost.id%
end



~
#66409
Приветствие старика~
0 r0 100
~
wait 1
г Здравствуй!
г Какая невзгода привела тебя ко мне на болота ?
г Я помогу ! Не будь я великим...
эмоц внезапно разразился в приступе кашля...
wait 1s
плю
г Старость не в радость!
mechoaround %actor% Старик погрустнел и замолк.


~
#66410
Вознаграждение~
0 j0 100
~
if %object.vnum% == 66400
wait 1s
г О! Да это сучок проклятого пня !
г Щас чавой-то сварганим.
wait 1s
mecho Старик болотник бросил сучок в котелок и начал что-то приговаривать и притоптывать.
mecho Котелок вспыхнул и счастливый дед улыбаясь во все свои 17 зубов, выудил прокрасившийся сучок.
г Держи яво!
mload obj 66403
дать синий %actor.name%
wait 1s
г Это этот! Гмм... Старость не в радость.
г Уже забыл.
mecho Дед насупился и замолк.
mpurge сучок
else
if %object.vnum% == 66401
wait 1s
г О! Да это лапка землеройки !
г Щас чавой-то сварганим.
wait 1s
mecho Старик болотник бросил лапку землеройки в котелок и начал что-то приговаривать и притоптывать.
mecho Котелок вспыхнул и счастливый дед улыбаясь во все свои 17 зубов, выудил прокрасившуюся лапку.
г Держи ее!
mload obj 66404
дать желт %actor.name%
wait 1s
г Это эта! Гмм... Старость не в радость.
г Уже забыл.
mecho Дед насупился и замолк.
mpurge лапка
else
if %object.vnum% == 66402
wait 1s
г О! Да это хвост болотной крысы !
г Щас чавой-то сварганим.
wait 1s
mecho Старик болотник бросил хвост в котелок и начал что-то приговаривать и притоптывать.
mecho Котелок вспыхнул и счастливый дед улыбаясь во все свои 17 зубов, выудил прокрасившийся крысиный хвостик.
г Держи яво!
mload obj 66405
дать красн %actor.name%
wait 1s
г Это этот! Гмм... Старость не в радость.
г Уже забыл.
mecho Дед насупился и замолк.
mpurge хвост
else
if %object.vnum% == 66403
switch %random.3%
case 1
wait 1s
mecho Дед почесал затылок.
г Что-то припоминаю
хму
wait 1s
г Кажется, нехватает деревянной палочки.
wait 1s
mpurge сучок
calcuid starik664 66400 mob
attach 66411 %starik664.id%
wait 5
calcuid starik664 66400 mob
detach 66410 %starik664.id%
break
case 2
wait 1s
mecho Дед почесал затылок.
г И чего ты хочешь ?
вопр %actor.name%
wait 1s
mpurge лапк
break
case 3
wait 1s
mecho Дед почесал затылок.
г И чего ты хочешь ?
вопр %actor.name%
wait 1s
mpurge лапк
break
default
break
done
else
if %object.vnum% == 66404
switch %random.3%
case 1
wait 1s
mecho Дед почесал затылок.
г Что-то припоминаю
хму
wait 1s
г Кажется, нехватает деревянной палочки.
wait 1s
mpurge сучок
calcuid starik664 66400 mob
attach 66412 %starik664.id%
wait 5
calcuid starik664 66400 mob
detach 66410 %starik664.id%
break
case 2
wait 1s
mecho Дед почесал затылок.
г И чего ты хочешь ?
вопр %actor.name%
wait 1s
mpurge лапк
break
case 3
wait 1s
mecho Дед почесал затылок.
г И чего ты хочешь ?
вопр %actor.name%
wait 1s
mpurge лапк
break
default
break
done
else
if %object.vnum% == 66405
switch %random.3%
case 1
wait 1s
mecho Дед почесал затылок.
г Что-то припоминаю
хму
wait 1s
г Кажется, нехватает деревянной палочки.
wait 1s
mpurge сучок
calcuid starik664 66400 mob
attach 66413 %starik664.id%
wait 5
calcuid starik664 66400 mob
detach 66410 %starik664.id%
break
case 2
wait 1s
mecho Дед почесал затылок.
г И чего ты хочешь ?
вопр %actor.name%
wait 1s
mpurge лапк
break
case 3
wait 1s
mecho Дед почесал затылок.
г И чего ты хочешь ?
вопр %actor.name%
wait 1s
mpurge лапк
break
default
break
done
else
   if %object.vnum% == 66407
wait 1s
mecho Дед почесал затылок.
г И чего ты хочешь ?
вопр %actor.name%
wait 1s
mpurge палочк
calcuid starik664 66400 mob
attach 66424 %starik664.id%
wait 5
calcuid starik664 66400 mob
detach 66410 %starik664.id%
else
   if %object.vnum% == 66408
wait 1s
mecho Дед почесал затылок.
г И чего ты хочеш ?
вопр %actor.name%
wait 1s
mpurge палочк
calcuid starik664 66400 mob
attach 66425 %starik664.id%
wait 5
calcuid starik664 66400 mob
detach 66410 %starik664.id%
else
   if %object.vnum% == 66409
wait 1s
mecho Дед почесал затылок.
г И чего ты хочешь ?
вопр %actor.name%
wait 1s
mpurge палочк
calcuid starik664 66400 mob
attach 66426 %starik664.id%
wait 5
calcuid starik664 66400 mob
detach 66410 %starik664.id%
end
end
end
end
end
end
end
end
end







~
#66411
Делаем синюю палочку~
0 j0 100
~
if %object.vnum% == 66406
wait 1s
mpurge  палочк
г Ах! Это мы щас... Мигом.
mecho Дед бросил синие сучки в котелок и начал орать матерные частушки на все болото.
wait 1s
mecho Кажется, ваши уши свернулись в трубочку.
wait 1s
mecho Котелок вспыхнул и счастливый дед вылил содержимое на палочку.
mload obj 66407
Дать палочк %actor.name%
wait 1s
г Эта волшебная палочка для... Гм..
плю
г Опять забыл!
mecho Дед нахмурился и замолк.
calcuid starik664 66400 mob
attach 66410 %starik664.id%
wait 5
calcuid starik664 66400 mob
detach 66411 %starik664.id%
end








~
#66412
Делаем желтую палочку~
0 j0 100
~
if %object.vnum% == 66406
wait 1s
mpurge  палочк
г Ах! Это мы щас... Мигом.
mecho Дед бросил желтые лапки в котелок и начал орать матерные частушки на все болото.
wait 1s
mecho Кажется, ваши уши свернулись в трубочку.
wait 1s
mecho Котелок вспыхнул и счастливый дед вылил содержимое на палочку.
mload obj 66408
Дать палочк %actor.name%
wait 1s
г Эта волшебная палочка для... Гм..
плю
г Опять забыл!
mecho Дед нахмурился и замолк.
calcuid starik664 66400 mob
attach 66410 %starik664.id%
wait 5
calcuid starik664 66400 mob
detach 66412 %starik664.id%
end








~
#66413
Делаем красную палочку~
0 j0 100
~
if %object.vnum% == 66406
wait 1s
mpurge  палочк
г Ах! Это мы щас... Мигом.
mecho Дед бросил красные хвосты в котелок и начал орать матерные частушки на все болото.
wait 1s
mecho Кажется, ваши уши свернулись в трубочку.
wait 1s
mecho Котелок вспыхнул и счастливый дед вылил содержимое на палочку.
mload obj 66409
Дать палочк %actor.name%
wait 1s
г Эта волшебная палочка для... Гм..
плю
г Опять забыл!
mecho Дед нахмурился и замолк.
calcuid starik664 66400 mob
attach 66410 %starik664.id%
wait 5
calcuid starik664 66400 mob
detach 66413 %starik664.id%
end





~
#66424
Делаем точило 2-1~
0 j0 100
~
   if %object.vnum% == 66408
wait 1s
mecho Дед почесал затылок.
г И чего ты хочешь ?
вопр %actor.name%
wait 1s
mpurge палочк
calcuid starik664 66400 mob
attach 66427 %starik664.id%
wait 5
calcuid starik664 66400 mob
detach 66424 %starik664.id%
else
   if %object.vnum% == 66409
wait 1s
mecho Дед почесал затылок.
г И чего ты хочешь ?
вопр %actor.name%
wait 1s
mpurge палочк
calcuid starik664 66400 mob
attach 66428 %starik664.id%
wait 5
calcuid starik664 66400 mob
detach 66424 %starik664.id%
end
end






~
#66425
Делаем точило 2-2~
0 j0 100
~
   if %object.vnum% == 66407
wait 1s
mecho Дед почесал затылок.
г И чего ты хочешь ?
вопр %actor.name%
wait 1s
mpurge палочк
calcuid starik664 66400 mob
attach 66427 %starik664.id%
wait 5
calcuid starik664 66400 mob
detach 66425 %starik664.id%
else
   if %object.vnum% == 66409
wait 1s
mecho Дед почесал затылок.
г И чего ты хочешь ?
вопр %actor.name%
wait 1s
mpurge палочк
calcuid starik664 66400 mob
attach 66429 %starik664.id%
wait 5
calcuid starik664 66400 mob
detach 66425 %starik664.id%
end
end






~
#66426
Делаем точило 2-3~
0 j0 100
~
 if %object.vnum% == 66407
wait 1s
mecho Дед почесал затылок.
г И чего ты хочешь ?
вопр %actor.name%
wait 1s
mpurge палочк
calcuid starik664 66400 mob
attach 66428 %starik664.id%
wait 5
calcuid starik664 66400 mob
detach 66426 %starik664.id%
else
   if %object.vnum% == 66408
wait 1s
mecho Дед почесал затылок.
г И чего ты хочешь ?
вопр %actor.name%
wait 1s
mpurge палочк
calcuid starik664 66400 mob
attach 66429 %starik664.id%
wait 5
calcuid starik664 66400 mob
detach 66426 %starik664.id%
end
end






~
#66427
Делаем точило 3-1~
0 j0 100
~
if %object.vnum% == 66409
wait 1s
mecho Дед почесал затылок.
г Что-то припоминаю
хму
wait 1s
г Кажется, чего-то нехватает.
wait 1s
mpurge палочк
calcuid starik664 66400 mob
attach 66430 %starik664.id%
wait 5
calcuid starik664 66400 mob
detach 66427 %starik664.id%
end













~
#66428
Делаем точило 3-2~
0 j0 100
~
if %object.vnum% == 66408
wait 1s
mecho Дед почесал затылок.
г Что-то припоминаю
хму
wait 1s
г Кажется, чего-то нехватает.
wait 1s
mpurge палочк
calcuid starik664 66400 mob
attach 66430 %starik664.id%
wait 5
calcuid starik664 66400 mob
detach 66428 %starik664.id%
end













~
#66429
Делаем точило 3-3~
0 j0 100
~
if %object.vnum% == 66407
wait 1s
mecho Дед почесал затылок.
г Что-то припоминаю
хму
wait 1s
г Кажется, чего-то нехватает.
wait 1s
mpurge палочк
calcuid starik664 66400 mob
attach 66430 %starik664.id%
wait 5
calcuid starik664 66400 mob
detach 66429 %starik664.id%
end













~
#66430
Делаем точило 4~
0 j0 100
~
if %object.vnum% == 66412
wait 1s
mpurge осколок
г А! Это будет сильно!
г Давненько такое не колдовал.
wait 1s
mecho Счастливый дед накидал палочек в котелок и начал бегать вокруг, выкрикивая заклинания.
wait 1s
mecho Затем достал свой ножик и помешал им содержимое котелка.
wait 1s
mecho Ножик вспыхнул и начал светиться голубым светом.
wait 1s
г Хе! Хе! С таким ножичком теперь и за хворостом можно сходить.
wait 1s
mecho Дед вылил остатки на осколок.
wait 1s
г Тебе пригодится!
mload obj 66413
дать точил %actor.name%
calcuid starik664 66400 mob
attach 66410 %starik664.id%
wait 5
calcuid starik664 66400 mob
detach 66430 %starik664.id%
end






~
#66431
лезем В пещеру~
2 c0 100
лезть~
if !(%arg.contains(щель)%) 
   wsend       %actor% Куда это Вы хотите пролезть???
   return 0
   halt
end
if (%actor.move%<200)
    wsend %actor% _У Вас не хватит сил для этого.
   return 0
else
  wsend       %actor% Вы полезли в узкую щель. Ох и тяжело же тут ползти!
  wechoaround %actor% %actor.name% полез%actor.g% в узкую щель. 
  wait 5s
  %actor.move(-200)%
  wsend %actor% Вы пролезли в маленькую пещеру.
  wteleport %actor.name% 66448
  wat 66448 wechoaround %actor% Кто-то пролез сюда.\
end












~
#66432
Лезем ИЗ пещеры~
2 c0 100
лезть~
if !(%arg.contains(щель)%) 
   wsend       %actor% Куда это Вы хотите пролезть???
   return 0
   halt
end
if (%actor.move%<200)
    wsend %actor% _У Вас не хватит сил для этого.
   return 0
else
  wsend       %actor% Вы полезли в узкую щель. Ох и тяжело же тут ползти!
  wechoaround %actor% %actor.name% полез%actor.g% в узкую щель. 
  wait 5s
  %actor.move(-200)%
  wsend %actor% Вы вылезли из маленькой пещеры.
  wteleport %actor.name% 66447
  wat 66447 wechoaround %actor% Кто-то пролез сюда.\
end











~
$
$
