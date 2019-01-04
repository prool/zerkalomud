#70300
Лезть завалы север~
2 c 0
лезть~
if !(%arg.contains(завал)%) 
  wsend       %actor% Куда это Вы хотите пролезть???
  return 1
  halt
end
wsend %actor% Кряхтя и охая, вы полезли через завалы. Ох и высота же тут!
wechoaround %actor% %actor.name% полез%actor.q% через завалы.
wait 1s
wsend %actor% Вы на северной стороне завала.
wteleport %actor% 70306
%actor.wait(1)%
wechoaround %actor% Кто-то пролез сюда.
~
#70301
Лезть завалы юг~
2 c 0
лезть~
if !(%arg.contains(завал)%) 
  wsend       %actor% Куда это Вы хотите пролезть???
  return 0
  halt
end
switch %random.3%
  case 1
    wsend       %actor% Вы полезли через завалы.
    wechoaround %actor% %actor.name% полез%actor.g% через завалы. 
    wait 1s
    wsend %actor% Вы благополучно перебрались через заставу зверей.
    wteleport %actor.name% 70305
    wat 70305 wechoaround %actor% Кто-то пролез сюда.
  break
  case 2
    wsend       %actor% Вы полезли через завалы.
    wechoaround %actor% %actor.name% полез%actor.g% через завалы.
    wait 1s
    wsend %actor% Случайно вы подскользнулись на табакерке волка и свалились вниз.
    wteleport %actor.name% 70306
    wdamage %actor% 50
    wat 70306 wechoaround %actor% _%actor.name% свалился обратно. Вот дела!
  break
  case 3
    wsend       %actor% Вы полезли через завалы.
    wechoaround %actor% %actor.name% полез%actor.g% через завалы.
    wait 1s 
    wsend %actor% Вдруг лиса, неглядя, выбросила огрызок яблока и угодила прямо в вас.
    wteleport %actor.name% 70306
    wdamage %actor% 50
    wat 70306 wechoaround %actor% _%actor.name% свалился обратно. Вот дела!
  break
  default
  break
done
end
~
#70302
Звери кидаются~
2 e 50
~
wait 1
switch %random.5%
  case 1
    wsend       %actor% Вдруг сверху прилетело что-то и БОЛЬНО ударило вас по голове. Это было чудно!
    wechoaround %actor% _%actor.name% получил%actor.g% горшком по голове! 
    wdamage %actor% 60
    wait 1
    wecho Лиса флиртует сверху:"Простите! Извините! Я не хотела!"
  break
  case 2
    wsend       %actor% Вдруг ваш нос УЖАСНО обожгло чем-то, прилетевшим сверху. Вам даже понравилось!
    wechoaround %actor% %actor.name% словил%actor.g% носом горстку табака из табакерки волка. 
    wdamage %actor% 50
    wait 1
    wecho Волк крикнул сверху:"Извините! Ветер понимаешь.."
  break
  case 3
    wsend       %actor% Вдруг на вас сверху свалилось нечто большое... Дальше вы ничего не помните...
    wechoaround %actor% _%actor.name% получил%actor.g% пнем по голове. 
    wdamage %actor% 100
    wait 5
    wecho Медведь пробасил сверху:"Ну.. Э-Э-Э Простите, что ли!"
  break
  case 4
    wsend       %actor% Вдруг вас накрыло тучей шелухи, прилетевшей сверху. О! Как приятно!
    wechoaround %actor% _%actor.name% скрылся%actor.g% в туче шелухи от семечек. 
    wdamage %actor% 30
    wait 5
    wecho Заяц промямлил сверху:"Иззввинните други.. Яяя неччаянно!"
  break
  case 5
    wecho _Мимо вас пролетела деревянная вилка с огурцом."Каким добром раскидываются!",-подумали Вы. 
  break
done
~
#70303
Лев1~
0 q 100
*~
wait 5
say Конопля...
wait 10
Выть
wait 5
say Моя конопляяяяаааа...
wait 10
Эм разрыдался пуще прежнего
wait 5
say Человече, будь другом, изничтожь проклятых тварей, жрущих мое конопляное поле.
wait 10
Выть
wait 5
Mecho "ыыы! Говорящий синий лев..." - пришло Вам на ум.
Mecho Бред какой-то.
Mecho Впрочем, надо бы помочь зверушке.
~
#70304
родился зеленыйкопейщик~
0 n 100
*~
if (%world.curobjs(70310)% < 5) && (%random.10% == 1)
  mload obj 70310
end
~
#70305
Лезем в грот~
2 c 0
лезть пролезть~
if !(%arg.contains(лаз)%) 
  wsend %actor% Куда это Вы хотите пролезть???
  return 0
  halt
end
wsend %actor% Вы полезли в узкий лаз.
wechoaround %actor% %actor.name% полез%actor.q% в лаз. 
wait 2s
wsend %actor% Вы вылезли на поверхность.
wteleport %actor.name% 70350
wechoaround %actor% Кто-то пролез сюда
~
#70306
Лезем из грота~
2 c 0
лезть пролезть~
if !(%arg.contains(лаз)%) 
  wsend  %actor% Куда это Вы хотите пролезть???
  return 0
  halt
end
wsend  %actor% Вы полезли в узкий лаз.
wechoaround %actor% %actor.name% полез%actor.q% в лаз. 
wait 2s
wsend %actor% Вы вылезли на поверхность.
wteleport %actor.name% 70333
wechoaround %actor% Кто-то пролез сюда.
~
#70307
Лезть из грота в щель~
2 c 0
лезть пролезть~
if !(%arg.contains(щель)%) 
  wsend       %actor% Куда это Вы хотите пролезть???
  return 0
  halt
end
if (%actor.move%<200)
  wsend %actor% _У Вас не хватит сил для этого.
  return 0
else
  wsend %actor% Вы полезли в узкую щель. Ох и тяжело же тут ползти!
  wechoaround %actor% %actor.name% полез%actor.q% в лазейку. 
  wait 1s
  eval buf %actor.move(-100)%
  wsend %actor% Ваши старания были не напрасны? Вы пролезли в расширение длинной щели из известняка.
  wteleport %actor.name% 70386
  wechoaround %actor% Кто-то пролез сюда.
end
~
#70308
Лезть из щели в грот~
2 c 0
лезть пролезть~
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
  wait 1s
  eval buf %actor.move(-200)%
  wsend %actor% Вы пролезли в грот.
  wteleport %actor.name% 70351
  wechoaround %actor% Кто-то пролез сюда.
end
~
#70309
Открываем проход в зад~
2 c 0
надавить давить нажать вдавить~
if !(%arg.contains(кирпич)%) 
  wsend %actor% Что это вы хотите вдавить???
  return 1
  halt
end
wait 1
wsend       %actor% Вы вдавили кирпич.
wechoaround %actor% %actor.name% вдавил%actor.g% кирпич.
wait 1s
wecho По гроту покатился грохот и звон цепей. Северная кирпичная стена отворилась, 
wecho открыв секретный проход.
wdoor  70351 north flags a
wdoor  70351 north room  70352
wdoor  70352 south   flags a
wdoor  70352 south room  70351
calcuid proxod 70351 room
detach 70309 %proxod.id%
~
#70310
Лезем за гобелен~
2 c 0
лезть пролезть~
if !(%arg.contains(гобелен)%) 
  wsend       %actor% Куда это Вы хотите пролезть???
  return 0
  halt
end
wsend %actor% Вы полезли под гобелен, всеми силами приподнимая его над полом.
wechoaround %actor% %actor.name% полез%actor.q% под гобелен.
wait 2s
wsend %actor% Вы пролезли на другую сторону гобелена.
wteleport %actor.name% 70371
wechoaround %actor% Кто-то пролез сюда
~
#70311
Лезем за гобелен обратно~
2 c 0
лезть пролезть~
if !(%arg.contains(гобелен)%) 
  wsend       %actor% Куда это Вы хотите пролезть???
  return 0
  halt
end
wsend       %actor% Вы полезли под гобелен, всеми силами приподнимая его над полом.
wechoaround %actor% %actor.name% полез%actor.g% под гобелен. 
wait 2s
wsend %actor% Вы пролезли на другую сторону гобелена.
wteleport %actor.name% 70363
wechoaround %actor% Кто-то пролез сюда
~
#70312
Воробей1~
0 d 100
здравствуй~
if %actor.vnum% != -1
  halt
end
вст
wait 5
г Приветствую тебя!
wait 1
г Эти подонки прусы поймали меня и посадили за решетку.
wait 5
г Сами же заслали купца с заколдованной коноплей.
г Все, насекомые, которые отведают этой травы вырастут до невероятных размеров!
wait 5
г Ух я им покажу!
рыч
wait 5 
дум
wait 5
г Я улетел за подмогой... Держитесь !
г Ух черт! Потрепали меня тут.
wait 5 
mecho Воробей почистил крылья перед полетом и выдернул непокорно торчащее перо.
mload obj 70302
бр перо
wait 5
mecho %actor.name% приподнял нижний край тяжеленного гобелена.
mecho Воробей взлетел и выпорхнул в образовавшуюся щель.
calcuid tolst 70371 room
attach 70314 %tolst.id%
run 70314 %tolst.id%
%purge% %self%
~
#70313
таракан мертв~
0 f 0
~
if %world.curobjs(70301)% == 0
  mload obj 70301
end
~
#70314
Лоадим стража~
2 z 100
~
wload mob 70318
calcuid gavrur 70363 room
detach 70310 %tolst.id%
calcuid gavrur 70371 room
detach 70311 %gavrur.id%
calcuid tolst 70318 mob
attach 70315 %tolst.id%
run 70315 %tolst.id%
calcuid vorobey 70317 mob
%purge% %vorobey%
~
#70315
Толстый идет сажать в тюрьму~
0 z 100
~
mecho Послышался щелчок в замке и в комнату ввалился толстый страж.
say "ШТЭТ ИН ПЛАТЦ!!!"
say "ХЭНДЭ ХОХ!!!"
wait 1
say Русский шпион?!!!
say РУСИШ ШВАЙНЦ!!!
mecho Толстый стражник схватил вас за шиворот и поволок в камеру.
eval  zekchar %self.people%
eval  num 0
while %zekchar% && (%num% < 20)
  set komp %zekchar.next_in_room%
  if %zekchar.vnum% == -1
    mechoaround %zekchar% %zekchar.name% отправлен%actor.g% в камеру! 
    mteleport %zekchar% 70370
    wait 1
    if %zekchar.realroom% == 70370
      msend %zekchar% Вы теперь заключенный! Как интересно!
      eval num (%num%+1)
    end 
  end
  if %komp%
    makeuid zekchar %komp.id%
    *set zekchar %komp%
  else
    set zekchar 0 
  end
done
calcuid zveri 70371 room
attach 70317 %zveri.id%
run 70317 %zveri.id%
~
#70316
Звери атакуют замок~
2 z 0
~
wait 70
wecho Прошло немного времени.
wait 35
wecho Прошло еще немного времени.
wait 35
wecho Прошло и еще немного времени.
wait 30
wecho Вам это начало уже надоедать.
wait 30
wecho Вдруг вдалеке послышался рев:"А-А-А-а-а-а!"
wait 15
wecho Затем послышался хорошый удар, от которого на вашу голову посыпались камешки.
wait 15
wecho Кажется, где-то на гранитный пол упал кусок стены.
wait 15
wecho "ЕПТ ВАШУ МАТЬ!",- заорал басом чей то медвежий голос.
wait 15
wecho "УБЬЮ!",- снова повторился он.
wait 15
wecho Послышался звон доставаемых из ножен мечей и крики:"ПАЧЕМУ БЕЗ ШЛЯПЫ?!!"
wecho Уже знакомый голос крикнул:"РУСИШ ШВАЙНЦ!!!"
wait 25
wecho "БАНЗззЗАЙ!!!",- завизжал чей то голосок.
wecho Затем какой то шелест и чьи крики:"Ничего не вижу!!!"
wait 25
wecho Звук подсечьки сменился звуком разбившегося горшка.
wait 10
wecho "Будеш знать как меня за попку трогать!",- флиртующе сказал чей-то лукавый голосок.
wait 25
wecho Вам показалось, что звуки все ближе и ближе.
wait 25
wecho Слышен топот ног перед дверью... Звон стали... 
wecho Кажется за дверью идет драка и чья-то сторона несет потери...
wecho Тупой удар чьего-то тела о дверь, чуть не сорвал ее с петель...
wait 25
wecho Где-то рядом оглушающе кто-то гавкнул на кого-то:"ТАБАЧКУ НЕ НАЙДЕТСЯ?!!"
wecho Слышен мощный удар по чьей то каске, а затем звук хруста сменился тишиной.
wait 25
wecho За восточной стеной вашей темницы послышался звон хорошо отточенного меча.
wecho "РУСИШ ШВАЙНЦ!!!",- снова заорал знакомый голос.
wecho "ОПЯТЬ БЕЗ ШЛЯПЫ?!!",- взревел чей то бас.
wait 25
wecho Мощный удар крупного тела о восточную стену вашей темницы снес ее напрочь.
wecho Вас накрыло падающими кирпичами... Из-за пыли ничего не видно.
wait 25
wecho Когда пыль рассеялась вы разглядели проход в восточной стене.
wdoor  70374 west flags a
wdoor  70374 west room  70370
wdoor  70370 east   flags a
wdoor  70370 east room  70374
wdoor  70371 west flags a
wdoor  70371 west room  70366
wdoor  70366 east   flags a
wdoor  70366 east room  70371
calcuid zverik 70306 room
detach 70302 %zverik.id%
calcuid zveriyug 70306 room
detach 70301 %zveriyug.id%
calcuid zveriyug2 70306 room
attach 70345 %zveriyug2.id%
calcuid zveri 70374 room
attach 70318 %zveri.id%
run 70318 %zveri.id%
~
#70317
Убираем толстого стража и восстанавливаем гобелен~
2 z 0
~
calcuid gobelen 70363 room
attach 70310 %gobelen.id%
calcuid gobelen 70371 room
attach 70311 %gobelen.id%
calcuid strag 70318 mob
wpurge %strag%
calcuid zveri 70370 room
attach 70316 %zveri.id%
run 70316 %zveri.id%
~
#70318
Лоад зверей~
2 z 0
~
if %world.curmobs(70319)% == 0 then
  wload mob 70319
end
if %world.curmobs(70320)% == 0 then
  wload mob 70320
end
if %world.curmobs(70321)% == 0 then
  wload mob 70321
end
if %world.curmobs(70322)% == 0 then
  wload mob 70322
end
calcuid medv 70319 mob
attach 70319 %medv.id%
end
~
#70319
Медведь~
0 q 100
~
wait 1
г Ух ты!
г Мы тебя спасать пришли, а ты по замку шныряешь...
смея
wait 10
г Вон посмотри, что прусаки вытворяют...Целая толпа уже собралась!
г Ух! Подослали нам жуков, да тараканов!
wait 10
г Да кстати мы тут у одного гада ключ отобрали, может тебе пригодится.
mload obj 70303
дат ключ %actor.name%
calcuid lisa 70320 mob
attach 70320 %lisa.id%
run 70320 %lisa.id%
~
#70320
Лиса~
0 z 100
~
wait 1
г Слушай Медведь!
г А может мы этих прибьем.
mecho Лиса кивнула на юг.
wait 10
г А остальных они сами.
вопр медв
wait 10
вопр волк
wait 10
вопр зая
wait 10
г Что скажете?
calcuid volk 70321 mob
attach 70321 %volk.id%
run 70321 %volk.id%
end
~
#70321
Волк~
0 z 0
~
wait 10
г Я однозначно ЗА!
г Надоело мне тут им бошки крошить.
wait 10
mecho Заяц невыдержал и добавил:"Да да! Может он сам и без нас справится!".
wait 10
mecho Медведь почесал репу и решил:"Айда этих прибьем, а остальных пусть он сам"
wait 10
г А потом отдохнем.
wait 10
хмур зая
mecho Заяц сразу добавил:"Да разве я против?".
wait 10
г Ну вот и порешили!
wait 10
ю
у мечн
calcuid lisa 70320 mob
attach 70322 %lisa.id%
run 70322 %lisa.id%
~
#70322
Лиса на юг~
0 z 100
~
юг
уб копей
calcuid medved 70319 mob
attach 70323 %medved.id%
run 70323 %medved.id%
~
#70323
Медведь на юг~
0 z 100
~
ю
уб лучн
calcuid zai 70322 mob
attach 70324 %zai.id%
run 70324 %zai.id%
~
#70324
заяц юг~
0 z 100
~
ю
у щитонос
calcuid medv 70319 mob
detach 70319 %medv.id%
end
~
#70325
REPOP~
2 f 100
*~
calcuid vorob1 70317 mob
attach 70312 %vorob1.id%
*calcuid vorob2 70317 mob
detach 70328 %vorob1.id%
calcuid zverk 70307 room
attach 70302 %zverk.id%
wait 1
calcuid rasx 70355 room
attach 70340 %rasx.id%
calcuid gavrur1 70363 room
attach 70310 %gavrur1.id%
calcuid gavrur2 70371 room
attach 70311 %gavrur2.id%
wait 1
calcuid proxod 70351 room
attach 70309 %proxod.id%
calcuid lev1 70300 mob
detach 70343 %lev1.id%
calcuid lev2 70300 mob
attach 70303 %lev2.id%
wait 1
calcuid lev3 70300 mob
attach 70304 %lev3.id%
calcuid vorota 70381 room
attach 70344 %vorota.id%
calcuid kapitan 70355 room
attach 70340 %kapitan.id%
wait 1
calcuid zverik 70306 room
attach 70302 %zverik.id%
calcuid zveriyug 70306 room
attach 70301 %zveriyug.id%
calcuid zveriyug2 70306 room
detach 70345 %zveriyug2.id%
wait 1
calcuid mish703 70316 mob
detach 70355 %mish703.id%
if %exist.mob(70352)%
  calcuid marb703 70352 mob
  detach 70349 %marb703.id%
  *calcuid marb703 70352 mob
  detach 70356 %marb703%
  *calcuid marb703 70352 mob
  detach 70357 %marb703%
  *calcuid marb703 70352 mob
  detach 70358 %marb703%
end
wdoor 70339 north purge
wdoor 70357 south purge
wdoor 70371 west purge
wdoor 70370 east purge
wdoor 70374 west purge
wdoor 70366 east purge
wdoor 70351 north purge
~
#70326
красться дыра~
2 c 100
прокрасться~
if !(%arg.contains(дыра)%)
  wsend       %actor% Куда это Вы хотите прокрасться???
  return 0
  halt
end
if (%actor.move%<200) && (%actor.level%<23) && (%actor.skill(подкрасться)%<80)
  wsend %actor% _У Вас не хватит сил для этого.
  return 0
else
  wsend %actor% Вы полезли в узкую дыру. Ох и тяжело же тут ползти, да еще и незамеченным остаться.
  wait 1s
  eval buf %actor.move(-200)%
  wsend %actor% Вы тихо вылезли рядом за печкой.
  wteleport %actor.name% 70396
  wechoaround %actor% Кто-то тихо пролез сюда.
end
~
#70327
Лезть дыра обратно~
2 c 1
лезть пролезть прокрасться~
if !(%arg.contains(дыра)%) 
  wsend       %actor% Куда это Вы хотите пролезть???
  return 0
  halt
end
if (%actor.move%<200)
  wsend %actor% _У Вас не хватит сил для этого.
  return 0
else
  wsend       %actor% Вы полезли в узкую дыру. Ох и тяжело же тут ползти!
  wait 1s
  eval buf %actor.move(-200)%
  wsend %actor% Вы пролезли в узкую комнатушку.
  wteleport %actor.name% 70355
  wechoaround %actor% Кто-то пролез сюда.
end
~
#70328
Воробей2~
0 c 100
здравствуй~
if %actor.vnum% != -1
  halt
end
вст
wait 5
г Приветствую тебя спаситель!
wait 1
г Эти подонки прусы поймали меня и посадили за решетку.
wait 5
г Сами же заслали купца с заколдованной коноплей.
г Все, насекомые, которые отведают этой травы вырастут до невероятных размеров!
wait 5
г Ух я им покажу!
рыч
wait 5 
дум
wait 5
г Я улетел за подмогой... Держитесь товарищи!
г Ух черт! Потрепали меня тут.
wait 5 
mecho Воробей почистил крылья перед полетом и выдернул непокорно торчащее перо.
mload obj 70302
бр перо
wait 5
mecho %actor.name% открыл окошко в двери.
mecho Воробей взлетел и выпорхнул в него.
*непонимаю зачем так сложно удалять воробьья да еще и по имени
*calcuid vorob2 70371 room
*attach 70329 %vorob2.id%
*run 70329 %vorob2.id%
%purge% %self%
~
#70329
последствия воробей2~
2 z 100
~
*вызывался из 70328 
* зачем так сложно непонятно, да еще и по имени
* *wpurge худой
~
#70330
родился толстый~
0 n 100
~
if %world.curobjs(70303)% == 0
  mload obj 70303
end
calcuid vorob1 70317 mob
detach 70312 %vorob1.id%
*calcuid vorob2 70317 mob
attach 70328 %vorob1.id%
~
#70331
Повариха померла~
0 f 100
~
mload obj 70309
~
#70332
родился капитан~
0 n 100
~
mload obj 70362
if (%world.curobjs(70359)% < 5) && (%random.10% == 1)
  mload obj 70359
end
if (%world.curobjs(70360)% < 5) && (%random.10% == 1)
  mload obj 70360
end
~
#70333
родился шпион~
0 n 100
~
if (%world.curobjs(70356)% < 5) && (%random.10% == 1)
  mload obj 70356
end
if (%world.curobjs(70357)% < 5) && (%random.10% == 1)
  mload obj 70357
end
if (%world.curobjs(70358)% < 5) && (%random.10% == 1)
  mload obj 70358
end
~
#70334
родился сотник~
0 n 100
~
if (%world.curobjs(70343)% < 3) && (%random.10% == 1)
  mload obj 70343
end
if (%world.curobjs(70344)% < 3) && (%random.10% == 1)
  mload obj 70344
end
if (%world.curobjs(70345)% < 3) && (%random.10% == 1)
  mload obj 70345
end
if (%world.curobjs(70346)% < 3) && (%random.10% == 1)
  mload obj 70346
end
if (%world.curobjs(70347)% < 3) && (%random.10% == 1)
  mload obj 70347
end
if (%world.curobjs(70348)% < 3) && (%random.10% == 1)
  mload obj 70348
end
if (%world.curobjs(70349)% < 3) && (%random.10% == 1)
  mload obj 70349
end
~
#70335
родился зеленыйлучник~
0 n 100
*~
if (%world.curobjs(70316)% < 5) && (%random.10% == 1)
  mload obj 70316
end
~
#70336
родился рыцарь~
0 n 100
~
if (%world.curobjs(70350)% < 3) && (%random.10% == 1)
  mload obj 70350
end
if (%world.curobjs(70351)% < 3) && (%random.10% == 1)
  mload obj 70351
end
if (%world.curobjs(70352)% < 3) && (%random.10% == 1)
  mload obj 70352
end
if (%world.curobjs(70353)% < 3) && (%random.10% == 1)
  mload obj 70353
end
if (%world.curobjs(70354)% < 3) && (%random.10% == 1)
  mload obj 70354
end
if (%world.curobjs(70355)% < 3) && (%random.10% == 1)
  mload obj 70355
end
if (%world.curobjs(70361)% < 3) && (%random.10% == 1)
  mload obj 70361
end
~
#70337
Помер ловчий~
0 f 100
~
if (%world.curobjs(11604)% < 3) && (%random.10% == 1)
  mload obj 11604
end
if (%world.curobjs(11605)% < 3) && (%random.10% == 1)
  mload obj 11605
end
~
#70338
Помер купец~
0 f 100
~
if (%world.curobjs(38216)% < 10) && (%random.10% == 1)
  mload obj 38216
end
~
#70339
Капитан и шпион уходят~
2 z 100
~
wait 1
if %exist.mob(70348)%
  calcuid mob1 70348 mob
  wpurge %mob1%
  calcuid kapit 70377 room
  attach 70341 %kapit.id%
  exec 70341 %kapit.id%
end
if %exist.mob(70347)%
  calcuid mob2 70347 mob
  wpurge %mob2%
  calcuid shpion 70376 room
  attach 70342 %shpion.id%
  exec 70342 %shpion.id%
end
~
#70340
Воевода и шпион расходятся~
2 e 100
~
wait 5
wecho "Хер капитан!",- пробасил грубый голос.
wecho "ЧТО??! Еще раз меня так назовешь и я тебя #K@R@CHUN#!!!",- ответил другой голос.
wecho Не смотря на всю укуреность Вам тоже не захотелось называть капитана хером.
wecho "Извините┘ товарищ капитан.",- сказал первый голос.
wait 10
wecho "В моем замке выше сотника тебе не дослужиться!",- видимо сказал капитан.
wecho "Что тебе надо Вермухт?"
wait 10
wecho "Вернулся наш шпион с докладной",- сказал сотник. 
wait 10
wecho "Давай его сюда!",- резко ответил капитан.
wait 10
wecho Слышен стук дверей.
wait 10
wecho "Эээ┘ товарищ капитан! Я тчательно изучил окрестности трех родовых деревень, а также 
wecho на обратном пути разведал обстановку в стане Льва",- начал доклад шпион.
wait 10
wecho "У меня есть две новости: Одна плохая, а другая хорошая. С какой начать?",- юлит шпион.
wait 10
wecho "Пожалуй, лучше начать с плохой, а закончить с хорошей",- рявнул сотник.
wait 10
wecho "Спасибо Вермухт. Ты знаешь мои вкусы.",- добавил капитан.
wait 10
wecho "Плохие новости из родовых деревень. Они не имеют укреплений. Немного местных воинов 
wecho не смогли бы справиться с нами...",- рассказывает шпион.
wait 15
wecho "Если бы не проходимцы. Их немного, но они хорошовооружены и опытны. Некоторые 
wecho арендуют комнаты в трактирах, другие же идут мимоходом. Пара таких может отразить 
wecho атаку всего нашего зеленого звена!",- внезапно закончил рассказ шпион.
wait 10
wecho "Чтож... Действительно плохие новости. Наш маленький гарнизон в полсотни бойцов сможет 
wecho набегом уничтожить только одну из трех деревень...",- мыслит вслух капитан.
wait 10
wecho "Пожалуй сначала подождем подкрепления!",- оборвал свои мысли капитан.
wait 10
wecho "А что за хорошие новости?",- несдержался сотник.
wait 10
wecho "Наша затея с заколдованной коноплей получилась наславу! На земле зверей разгуливают 
wecho огромные колорадские жуки. А тот самый таракан вырос до неимоверных размеров!",- хитрым 
wecho голосом докладывает шпион.
wait 10
wecho "Должен добавить, что на юге остатки зверей под командованием льва перекрыли вход в 
wecho долину огромными завалами...",- говорит шпион.
wait 10
wecho "Вот это славные новости! Как только будут окончательные результаты по эксперименту со зверьми, можно будет приступать к распространению конопли на Русь.  Это подорвет стан врага изнутри!■
wait 10
wecho "Вольная тебе до утра, а я пойду подумаю над дальнейшими планами...",- отдал приказ 
wecho капитан.
wait 10
wecho "Да и еще! Вермухт проследи за охраной и выставь десятников. Мы не можем рисковать теперь!",- отдал распоряжения капитан.
wait 10 
wecho "Есть! Капитан!",- рявнули два оглушительных голоса.
wait 10
wecho Спустя некоторое время топот и стук дверей сменился тишиной.
calcuid kapit 70375 room
attach 70339 %kapit.id%
run 70339 %kapit.id%
detach 70340 %self.id%
~
#70341
Лоад капитана~
2 z 100
~
wload mob 70348
calcuid shpion 70376 room
attach 70342 %shpion.id%
run 70342 %shpion.id%
~
#70342
Лоад шпиона~
2 z 100
~
wload mob 70347
calcuid rasx 70355 room
detach 70340 %rasx.id%
~
#70343
Лев вознаграждает~
0 j 100
*~
switch %object.vnum%
  case 70301
    wait 1
    mpurge %object%
    wait 8
    say Ух ты! Одолел%actor.g% таракана?!!
    wait 8
    say Молодчина!
    wait 8
    улы %actor.name%
    wait 8
    mecho Лев отвернулся, что-то дернул и издал душераздирающий вопль.
    mecho Лев повернулся обратно со счастливым лицом и выпученными сумашедшими глазами.
    г Держи обещанную награду!
    switch %random.3%
      case 1
        mload obj 70363
        дать пух %actor.name%
      break
      case 2
        mload obj 70364
        дать ус %actor.name%
      break
      default
        mload obj 70365
        дать шерст %actor.name%
      break
    done
  end
  case 70302
    wait 1
    mpurge %object%
    г Ах да! Воробей отыскался... Я помню!
    wait 8
    г Молодчина!
    wait 8
    улы %actor.name%
    wait 1
    *mpurge перо
    wait 8
    if (%actor.class% == 4) && (%actor.level% > 22) && (%actor.skill(осторожный.стиль)% == -1)
      wait 1    
      сказ %actor.name% Я вижу ты еще мал, многого не умеешь и помочь тебе никто не хочет...
      сказ %actor.name% Пожалуй я смогу тебя кое-чему научить... Но для этого сделай еще одно доброе дело...
      wait 15
      сказ %actor.name% У нас в лесу завелось ужасное ночное созданье... 
      сказ %actor.name% Каждое полнолуние оно прилетает в долину и убивает невинных зверей.
      сказ %actor.name% Оставляет на шее только две дырочки от укуса... Ужас! Брр..
      сказ %actor.name% Избавишь лес от него... Научу тебя чему-нибудь.
      calcuid mish703 70316 mob
      attach 70355 %mish703.id%
      wait 30
      г И еще...
      г Пожалуй забери его на память.
      mload obj 70366
      дать перо %actor.name%
    else
      if (%actor.skill(подкрасться)%>=80) && (%actor.level%>=25)
        сказ %actor.name% За это я расскажу тебе как лучше красться.
        сказ %actor.name% В твоей профессии это немаловажно...
        mskilladd %actor.name% подкрасться %random.2%
        wait 30
        г И еще...
        г Пожалуй забери его на память.
        mload obj 70366
        дать перо %actor.name%
      else
        г Пожалуй забери его в подарок.
        mload obj 70366
        дать перо %actor.name%
      end
    end
  end
  case 70368
    wait 1
    mpurge %object%
    if (%actor.class% == 4) && (%actor.level% > 22) && (%actor.skill(осторожный.стиль)% == -1)
      сказ %actor.name% Ух ты! Какой ужас ты приволок!
      сказ %actor.name% Похоже, что эта летучая мышь убивала наших зверей.
      сказ %actor.name% Спасибо тебе! И как обещал я научу тебя...
      wait 10
      дум
      wait 10
      хмур
      wait 15
      сказ %actor.name% Осторожно драться! Вот чему я тебя научу!
      mskillturn %actor.name% осторожный.стиль set
    end
  end
  case 70362
    wait 1
    mpurge %object%
    wait 8
    г Это что такое?
    wait 8
    mecho Лев развернул план капитана и начал его изучать.
    mecho "ВО СВОЛОЧЬ!",- внезапно взревел Лев.
    wait 8
    г Спасибо тебе за то, что избавил нас от этого злодея!
    улы %actor.name%
    *mpurge план
    wait 8
    switch %actor.class%
      *лекарь
      case 0
        %self.gold(+5000)%
        дать 5000 кун %actor.name%
        г Зверям деньги не нужны,а тебе пригодятся...
      break
      *колдун
      case 1
        %self.gold(+5000)%
        дать 5000 кун %actor.name%
        г Зверям деньги не нужны,а тебе пригодятся...
      break
      *тать
      case 2
        if (%actor.skill(заколоть)%>=80) && (%actor.level%>25)
          mskilladd %actor.name% заколоть %random.2%
          сказ %actor.name% Будешь теперь ножиками лучше тыркать...
          wait 15
          сказ %actor.name% И еще...
          %self.gold(+5000)%
          дать 5000 кун %actor.name%
          г Зверям деньги не нужны,а тебе пригодятся...
        else
          %self.gold(+5000)%
          дать 5000 кун %actor.name%
          г Зверям деньги не нужны,а тебе пригодятся...
        end
      break
      *богатырь
      case 3
        %self.gold(+5000)%
        дать 5000 кун %actor.name%
        г Зверям деньги не нужны,а тебе пригодятся...
      break
      *наемник
      case 4
        if (%actor.level% > 23) && (%actor.skill(скрытый.удар)% == -1)
          сказ %actor.name% Я вижу ты еще мал, многого не умеешь и помочь тебе никто не хочет... А потому держи подарочек!
          mload obj 70367
          дат клоч %actor.name%
          сказ %actor.name% К сожалению я не могу тебя научить сам, но этот клочок бересты поможет тебе в твоих планах.
        else
          if (%actor.skill(заколоть)%>=80) && (%actor.level%>25)
            mskilladd %actor.name% заколоть %random.2%
            сказ %actor.name% Будешь теперь ножиками лучше тыркать...
            wait 15
            сказ %actor.name% И еще...
            %self.gold(+5000)%
            дать 5000 кун %actor.name%
            г Зверям деньги не нужны,а тебе пригодятся...
          else
            %self.gold(+5000)%
            дать 5000 кун %actor.name%
            г Зверям деньги не нужны,а тебе пригодятся...
          end
        end
      break
      *друж
      case 5
        %self.gold(+5000)%
        дать 5000 кун %actor.name%
        г Зверям деньги не нужны,а тебе пригодятся...
      break
      *кудесник
      case 6
        %self.gold(+5000)%
        дать 5000 кун %actor.name%
      break
      *Волшебники!
      case 7
        %self.gold(+5000)%
        дать 5000 кун %actor.name%
      break
      *чернок
      case 8
        %self.gold(+5000)%
        дать 5000 кун %actor.name%
      break
      *витязь
      case 9
        %self.gold(+5000)%
        дать 5000 кун %actor.name%
        г Зверям деньги не нужны,а тебе пригодятся...
      break
      *охот
      case 10
        %self.gold(+5000)%
        дать 5000 кун %actor.name%
        г Зверям деньги не нужны,а тебе пригодятся...
      break
      *кузнец
      case 11
        %self.gold(+5000)%
        дать 5000 кун %actor.name%
        г Зверям деньги не нужны,а тебе пригодятся...
      break
      *купец
      case 12
        %self.gold(+5000)%
        дать 5000 кун %actor.name%
        г Зверям деньги не нужны,а тебе пригодятся...
      break
      *волхв
      case 13
        %self.gold(+5000)%
        дать 5000 кун %actor.name%
        г Зверям деньги не нужны,а тебе пригодятся...
      break   
      default
        %self.gold(+5000)%
        дать 5000 кун %actor.name%
        г Зверям деньги не нужны,а тебе пригодятся...
      break
    done
  done
~
#70344
Открываем ворота~
2 c 0
тянуть потянуть дернуть~
if !(%arg.contains(рычаг)%) 
  wsend       %actor% Что это вы хотите опустить???
  return 1
  halt
end
wait 1
wsend       %actor% Вы опустили рычаг в стене.
wechoaround %actor% %actor.name% опустил%actor.u% рычаг в стене.
wait 1s
wecho    Снизу донесся звон цепей и грохот упавшей створки ворот замка.
wechoaround %actor% Вдруг с грохотом перед вами упала створка ворот замка, чуть не придавив.
wdoor  70339 north flags a
wdoor  70339 north room  70357
wdoor  70357 south   flags a
wdoor  70357 south room  70339
calcuid vorot 70381 room
detach 70344 %vorot.id%
~
#70345
Лезть завалы юг 2~
2 c 0
лезть~
if !(%arg.contains(завалы)%) 
  wsend       %actor% Куда это Вы хотите пролезть???
  return 0
  halt
end
wsend       %actor% Вы полезли через завалы.
wechoaround %actor% %actor.name% полез%actor.g% через завалы.
wait 1s
wsend %actor% Вы благополучно перебрались через заставу зверей.
wteleport %actor.name% 70305
wechoaround %actor% Кто-то пролез сюда.
~
#70346
Старичек приветствует~
0 r 100
*~
wait 1
Г здарова мужик!
Г хош дунуть?
~
#70347
Триггер коричневого клочка бересты~
1 h 100
~
if (%actor.class% == 4) && (%actor.level% > 23) && (%actor.skill(Cкрытый удар)% == -1) && (%actor.realroom% == 62138)
  osend %actor%  Вы бросили клочок бересты. Он выспыхнул и исчез, пустив тучку красного дыма.
  oechoaround %actor%  %actor.name% бросил%actor.g% клочок бересты. Он вспыхнул и исчез, пустив тучку красного дыма.
  osend %actor% Вы заметили, как дым взлетел к небу в виде короны...
  osend %actor% Постепенно меняясь в виде знаков, тучка растворилась.
  osend %actor% Ветер донес обрывки чьих-то слов:"Он к хозяину..хозяи.. хозя.."
  calcuid m703 62163 room
  attach 70348 %m703.id%
  run 70348 %m703.id%
end
~
#70348
Замена марба~
2 z 100
~
if %world.curmobs(62108)% == 1
  *убираем марбендила из варягов
  calcuid marb2 62108 mob 
  wpurge %marb2%
  *хз что же за зуб пуржится по имени
  *в 621 перенесу лоад зуба и шкуры на триг чтоб не падали после удаления моба 
  *  wait 5
  *  wpurge зуб
  *  wpurge шкур
  wload mob 70352
  calcuid marb703 70352 mob
  attach 70349 %marb703%
  calcuid mslug703 62143 room
  attach 70351 %mslug703%
  run 70351 %mslug703%
end
~
#70349
Зашел квестор~
0 q 100
~
if (%actor.class% == 4) && (%actor.level% > 23) && (%actor.skill(Cкрытый удар)% == -1)
  wait 1
  msend %actor% Грозным взглядом Марбендилл осмотрел вас... 
  wait 15
  г Слуги передали мне... Но я и сам видел этот знак.
  wait 15
  г Кто тебе дал его ?
  wait 15
  вопр %actor.name%
  calcuid marb703 70352 mob
  attach 70356 %marb703.id%
else
  у %actor.name%
end
~
#70350
берем квест у льва~
0 d 1
помогу хорошо~
wait 5
say Сначала всем зверям в наших джунглях было грустно и скучно. Но потом, откуда не 
say возьмись пришел какой-то купец, и предложил помочь. Я купил его травы и засеял целое 
say поле. Все возрадовались и были счастливы.
wait 5
say Однако вместе с купцом прибыло множество странных людей, построивших за звериным 
say кладбищем свое стойбище, и начавших воровать нашу траву.
wait 5
say Мы не серчали, но вскоре, из их дома стали выползать диковинные насекомые, которые, 
say пожрав травы, вырастали до неимоверных размеров. Слава богу, что нам помогал воробей, и 
say вроде де бы все было тип-топ.
wait 5
say Но вот недавно, появился какой-то усатый монстр, а воробей как на беду пропал.
Плак %actor.name%
wait 5
say Эта тварь чуть нас не сожрала, хорошо еще, что мы успели возвести здесь завал, из 
say того, что под рукой было. Так бы наверняка от нас остались бы рожки да ножки.
say Найди что-либо о воробье. Да к странным людям проберись, разведай, что они замышляют, 
say и не их ли рук это дело?
attach 70343 %self.id%
detach 70303 %self.id%
detach 70350 %self.id%
~
#70351
Убираем слуг1~
2 z 100
~
*помоему автор хотел убрать моба 62113 
*для этого на каждой клетке вызывается 
*мобов в мире 2
*  
if %exist.mob(62113)%
  calcuid m703 62113 mob
  %purge% %m703%
end
if %exist.mob(62113)%
  calcuid m703 62113 mob
  %purge% %m703%
end
calcuid m703 62163 room
detach 70348 %m703.id%
*wpurge слуг
*wpurge слуг
*calcuid mslug703 62144 room
*attach 70352 %mslug703.id%
*run 70352 %mslug703.id%
~
#70352
Убираем слуг2~
2 z 100
~
*ненужен (см 51)
halt
* 
calcuid mslug703 62143 room
detach 70351 %mslug703.id%
wpurge слуг
wpurge слуг
calcuid mslug703 62145 room
attach 70353 %mslug703.id%
run 70353 %mslug703.id%
~
#70353
Убираем слуг3~
2 z 100
~
*ненужен (см 51)
halt
*
calcuid mslug703 62144 room
detach 70352 %mslug703.id%
wpurge слуг
wpurge слуг
calcuid mslug703 62146 room
attach 70354 %mslug703.id%
run 70354 %mslug703.id%
~
#70354
Убираем слуг4~
2 z 100
~
*ненужен (см 51)
halt
*
calcuid mslug703 62145 room
detach 70353 %mslug703.id%
wpurge слуг
wpurge слуг
calcuid mslug703 62146 room
detach 70354 %mslug703.id%
~
#70355
Умерла летучая мышь~
0 f 100
~
if (%actor.class% == 4) && (%actor.level% > 22) && (%actor.skill(осторожный.стиль)% == -1)
  mload obj 70368
end
~
#70356
Разговор марба1~
0 d 100
Лев~
if %actor.vnum% != -1
  halt
end
if (%actor.class% == 4) && (%actor.level% > 23) && (%actor.skill(Cкрытый удар)% == -1)
  wait 1
  г Лев ?!!!
  г Царь зверей ?!!!
  wait 30
  дум
  wait 30
  г Ну чтож... Похоже на то, что ты не врешь.
  wait 15
  msend %actor% Марбендилл сгреб Вас в кулак и начал нюхать! Какой ужас!
  wait 30
  г Должен признаться съел бы тебя с удовольствием.. Но раз Царь дал тебе знак придется помочь.
  г Что тебе надо от меня ?
  calcuid marb703 70352 mob
  attach 70357 %marb703.id%
  calcuid marb703 70352 mob
  detach 70356 %marb703.id%
else
  у %actor.name%
end
~
#70357
Разговор марба 2~
2 d 100
Клык~
if (%actor.class% == 4) && (%actor.level% > 23) && (%actor.skill(Cкрытый удар)% == -1)
  wait 1
  г Клык ?!!!
  г Ну ты обнаглел ?!!!
  wait 15
  дум
  wait 15
  г Ну если бы не Царь! СОЖРАЛ БЫ ТЕБЯ!
  wait 15
  г На твое счастье болит у меня один клык. Шатается, да никак не выпадет.
  msend %actor% Марбендилл полез своими огромными пальцами копаться в клыках...
  wait 60
  г Болит страшно!
  wait 20
  msend %actor% Марбендилл попытался вытащить, шатающийся клык...
  wait 20
  msend %actor% "ОООООО!!!!",- потряс пещеру оглушающий рев Марбендилла.
  wait 20
  г Давай ка лучше ты ударь меня... Только по клыку бей! Вот сюда!
  msend %actor% Марбендилл показал Вам что бить надо в щеку.
  wait 15
  г Только как ударишь...СРАЗУ отбегай. А то ненароком прибью! 
  calcuid marb703 70352 mob
  attach 70358 %marb703.id%
  calcuid marb703 70352 mob
  detach 70357 %marb703.id%
else
  у %actor.name%
end
~
#70358
Разговор марба3~
0 c 100
ударить~
if !(%arg.contains(щеку)%) 
  msend %actor% Ты что ?!! За такую неточность марбендилл тебя щас слопает!
  return 0
  halt
end
if (%actor.class% == 4) && (%actor.level% > 23) && (%actor.skill(Cкрытый удар)% == -1)
  wait 1
  msend %actor% Вы со всего размаху ударили по правой щеке Марбендила.
  msend %actor% "ААААаааа...Оооо!!!!",- снова потряс пещеру оглушающий рев Марбендилла.
  wait 15
  г Как хорошо то стало! Давненько меня так не били.
  wait 15
  г Ух! Не болит!
  wait 20
  г Держи! Теперь он твой.
  mload obj 62104
  дат клык %actor.name%
  wait 15
  г Только смотри! Еще раз придешь. Обязательно сьем. Уж больно ты вкусно пахнешь!
  г Что-то проголодался я. Пойду лучше на охоту схожу...
  msend %actor% Марбендилл навеселе побежал охотиться и, чуть не сломав пару сосен у пещеры, исчез из видимости.
  calcuid marb703 70352 mob
  detach 70349 %marb703.id%
  mpurge %marb703%
else
  у %actor.name%
end
~
#70359
лев2~
0 r 100
~
wait 5
эм с мольбой уставился на Вас.
~
#70360
г да грибнику~
0 d 1
да хочу~
wait 5
mecho Чудной путешественник угостил каждого косяком, и затянулась душевная беседа...
wait 10
mecho Путник спрашивал, что Вы здесь делаете, не страшно ли бродить по таким дебрям, где, 
mecho если что случится, помощи ждать не откуда...
wait 5
mecho Потом он рассказал, где бывал. 
mecho Вы узнали про жаркие страны, где тепло зимой и летом. Там страшные болотные топи 
mecho соседствуют с дикими джунглями, в которых живут причудливые звери, не встречающиеся на Руси.
wait 10
mecho Много про что Вы еще говорили с ним. И про широкие конопляные поля, растущие на 
mecho диких лугах; и про колорадских жуков, сжирающих весь урожай; и про тараканов, 
mecho шныряющих в каждом доме; и про воробьев, успешно борющихся с разными вредными 
mecho насекомыми; и про хитрых и жадных купцов, вечно ищущих себе выгоду; и про надоедливых 
mecho прусов, все еще жаждущих захватить земли нашенские...
wait 15
mecho После очередной тяги, сквозь завесу покидающего Вас сознания, услышались слова:
mecho "Ээээ... мужик! Ты чего на грибы пялишься? Это я их нашел. Это мое место! 
mecho НА ГРИБЫ НЕ ЛОЖИСЬ! ИДИОТ!"
wait 10
mecho Вы провалились в бездну небытия...
wait 5
mecho Кажется, Вы летите...
mecho Нет, не кажется. Вы летите,  заполненные странным ощущением эйфории.
mecho Мимо проносятся облака. Где-то на горизонте появились и тут же скрылись зеленые черти. 
mecho Рядом пробежала красная собака.
mecho Что-то странное творится...
mecho Вскоре под собой Вы заметили странный лес между двумя горами и начали снижаться.
mteleport all 70304
detach 70346 %self.id%
detach 70360 %self.id%
~
#70361
родился зеленыймечник~
0 n 100
*~
if (%world.curobjs(70313)% < 5) && (%random.10% == 1)
  mload obj 70313
end
~
#70362
родился зеленыйщитоносец~
0 n 100
*~
if (%world.curobjs(70319)% < 5) && (%random.10% == 1)
  mload obj 70319
end
~
#70363
родился зеленыйдесятник~
0 n 100
*~
if (%world.curobjs(70322)% < 5) && (%random.10% == 1)
  mload obj 70322
end
if (%world.curobjs(70325)% < 5) && (%random.10% == 1)
  mload obj 70325
end
if (%world.curobjs(70330)% < 5) && (%random.10% == 1)
  mload obj 70330
end
if (%world.curobjs(70331)% < 5) && (%random.10% == 1)
  mload obj 70331
end
if (%world.curobjs(70334)% < 5) && (%random.10% == 1)
  mload obj 70334
end
if (%world.curobjs(70337)% < 5) && (%random.10% == 1)
  mload obj 70337
end
if (%world.curobjs(70340)% < 5) && (%random.10% == 1)
  mload obj 70340
end
~
#70364
родился желтыйкопейщик~
0 n 100
*~
if (%world.curobjs(70311)% < 4) && (%random.10% == 1)
  mload obj 70311
end
~
#70365
родился желтыйлучник~
0 n 100
*~
if (%world.curobjs(70317)% < 4) && (%random.10% == 1)
  mload obj 70317
end
~
#70366
родился желтыймечник~
0 n 100
*~
if (%world.curobjs(70314)% < 4) && (%random.10% == 1)
  mload obj 70314
end
~
#70367
родился желтыйщитоносец~
0 n 100
*~
if (%world.curobjs(70320)% < 4) && (%random.10% == 1)
  mload obj 70320
end
~
#70368
родился желтыйдесятник~
0 n 100
*~
if (%world.curobjs(70323)% < 4) && (%random.10% == 1)
  mload obj 70323
end
if (%world.curobjs(70326)% < 4) && (%random.10% == 1)
  mload obj 70326
end
if (%world.curobjs(70329)% < 4) && (%random.10% == 1)
  mload obj 70329
end
if (%world.curobjs(70332)% < 4) && (%random.10% == 1)
  mload obj 70332
end
if (%world.curobjs(70335)% < 4) && (%random.10% == 1)
  mload obj 70335
end
if (%world.curobjs(70338)% < 4) && (%random.10% == 1)
  mload obj 70338
end
if (%world.curobjs(70341)% < 4) && (%random.10% == 1)
  mload obj 70341
end
~
#70369
родился красныйкопещик~
0 n 100
*~
if (%world.curobjs(70312)% < 3) && (%random.10% == 1)
  mload obj 70312
end
~
#70370
родился красныйлучник~
0 n 100
*~
if (%world.curobjs(70318)% < 3) && (%random.10% == 1)
  mload obj 70318
end
~
#70371
родился красныймечник~
0 n 100
*~
if (%world.curobjs(70315)% < 3) && (%random.10% == 1)
  mload obj 70315
end
~
#70372
родился красныйщитоносец~
0 n 100
*~
if (%world.curobjs(70321)% < 3) && (%random.10% == 1)
  mload obj 70321
end
~
#70373
родился красныйдесятник~
0 n 100
*~
if (%world.curobjs(70324)% < 3) && (%random.10% == 1)
  mload obj 70324
end
if (%world.curobjs(70327)% < 3) && (%random.10% == 1)
  mload obj 70327
end
if (%world.curobjs(70328)% < 3) && (%random.10% == 1)
  mload obj 70328
end
if (%world.curobjs(70333)% < 3) && (%random.10% == 1)
  mload obj 70333
end
if (%world.curobjs(70336)% < 3) && (%random.10% == 1)
  mload obj 70336
end
if (%world.curobjs(70339)% < 3) && (%random.10% == 1)
  mload obj 70339
end
if (%world.curobjs(70342)% < 3) && (%random.10% == 1)
  mload obj 70342
end
~
#70374
к ежику~
0 r 100
*~
wait 5
Осм %actor.name%
wait 10
say Нравишься мне ты.
say Хош курнуть последней травки?
wait 10
Вопр %actor.name%
~
#70375
возврат в реальный мир~
0 d 1
да хочу~
wait 1
mecho Как только Вы раскурили косяк все поплыло перед глазами.
wait 10
mecho Через несколько мгновений Вы почувствовали сильную головную боль и протерли свои зенки.
mteleport %actor% 70397
~
#70376
Лев вознаграждает~
0 j 100
*~
switch %object.vnum%
  case 70301
    wait 5
    wait 8
    г Ух ты! Одолел%actor.g% таракана?!!
    wait 8
    г Молодчина!
    wait 8
    улы %actor.name%
    wait 8
    mecho Лев отвернулся, что-то дернул и издал душераздирающий вопль.
    mecho Лев повернулся обратно со счастливым лицом и выпученными сумашедшими глазами.
    г Держи обещанную награду!
    wait 1
    mpurge %object%
    switch %random.3%
      case 1
        mload obj 70363
        дать пух %actor.name%
      break
      case 2
        mload obj 70364
        дать ус %actor.name%
      break
      default
        mload obj 70365
        дать шерст %actor.name%
      break
    done
  end
  if %object.vnum% == 70302
    wait 8
    г Ах да! Воробей отыскался... Я помню!
    wait 8
    г Молодчина!
    wait 8
    улы %actor.name%
    wait 1
    mpurge перо
    wait 8
    if (%actor.class% == 4) && (%actor.level% > 22) && (%actor.skill(осторожный.стиль)% == -1)
      wait 1    
      сказ %actor.name% Я вижу ты еще мал, многого не умеешь и помочь тебе никто не хочет...
      сказ %actor.name% Пожалуй я смогу тебя кое-чему научить... Но для этого сделай еще одно доброе дело...
      wait 15
      сказ %actor.name% У нас в лесу завелось ужасное ночное созданье... 
      сказ %actor.name% Каждое полнолуние оно прилетает в долину и убивает невинных зверей.
      сказ %actor.name% Оставляет на шее только две дырочки от укуса... Ужас! Брр..
      сказ %actor.name% Избавишь лес от него... Научу тебя чему-нибудь.
      calcuid mish703 70316 mob
      attach 70355 %mish703.id%
      wait 30
      г И еще...
      г Пожалуй забери его на память.
      mload obj 70366
      дать перо %actor.name%
    else
      if (%actor.skill(подкрасться)%>=80) && (%actor.level%>=25)
        сказ %actor.name% За это я расскажу тебе как лучше красться.
        сказ %actor.name% В твоей профессии это немаловажно...
        mskilladd %actor.name% подкрасться %random.2%
        wait 30
        г И еще...
        г Пожалуй забери его на память.
        mload obj 70366
        дать перо %actor.name%
      else
        г Пожалуй забери его в подарок.
        mload obj 70366
        дать перо %actor.name%
      end
    end
  end
  if %object.vnum% == 70368
    if (%actor.class% == 4) && (%actor.level% > 22) && (%actor.skill(осторожный.стиль)% == -1)
      сказ %actor.name% Ух ты! Какой ужас ты приволок!
      сказ %actor.name% Похоже, что эта летучая мышь убивала наших зверей.
      сказ %actor.name% Спасибо тебе! И как обещал я научу тебя...
      wait 10
      дум
      wait 10
      хмур
      wait 15
      сказ %actor.name% Осторожно драться! Вот чему я тебя научу!
      mskillturn %actor.name% осторожный.стиль set
    end
  end
  if %object.vnum% == 70362
    wait 8
    г Это что такое?
    wait 8
    mecho Лев развернул план капитана и начал его изучать.
    mecho "ВО СВОЛОЧЬ!",- внезапно взревел Лев.
    wait 8
    г Спасибо тебе за то, что избавил нас от этого злодея!
    улы %actor.name%
    mpurge план
    wait 8
    switch %actor.class%
      *лекарь
      case 0
        %self.gold(+5000)%
        дать 5000 кун %actor.name%
        г Зверям деньги не нужны,а тебе пригодятся...
      break
      *колдун
      case 1
        %self.gold(+5000)%
        дать 5000 кун %actor.name%
        г Зверям деньги не нужны,а тебе пригодятся...
      break
      *тать
      case 2
        if (%actor.skill(заколоть)%>=80) && (%actor.level%>25)
          mskilladd %actor.name% заколоть %random.2%
          сказ %actor.name% Будешь теперь ножиками лучше тыркать...
          wait 15
          сказ %actor.name% И еще...
          %self.gold(+5000)%
          дать 5000 кун %actor.name%
          г Зверям деньги не нужны,а тебе пригодятся...
        else
          %self.gold(+5000)%
          дать 5000 кун %actor.name%
          г Зверям деньги не нужны,а тебе пригодятся...
        end
      break
      *богатырь
      case 3
        %self.gold(+5000)%
        дать 5000 кун %actor.name%
        г Зверям деньги не нужны,а тебе пригодятся...
      break
      *наемник
      case 4
        if (%actor.level% > 23) && (%actor.skill(Cкрытый удар)% == -1)
          сказ %actor.name% Я вижу ты еще мал, многого не умеешь и помочь тебе никто не хочет... А потому держи подарочек!
          mload obj 70367
          дат клоч %actor.name%
          сказ %actor.name% К сожалению я не могу тебя научить сам, но этот клочок бересты поможет тебе в твоих планах.
        else
          if (%actor.skill(заколоть)%>=80) && (%actor.level%>25)
            mskilladd %actor.name% заколоть %random.2%
            сказ %actor.name% Будешь теперь ножиками лучше тыркать...
            wait 15
            сказ %actor.name% И еще...
            %self.gold(+5000)%
            дать 5000 кун %actor.name%
            г Зверям деньги не нужны,а тебе пригодятся...
          else
            %self.gold(+5000)%
            дать 5000 кун %actor.name%
            г Зверям деньги не нужны,а тебе пригодятся...
          end
        end
      break
      *друж
      case 5
        %self.gold(+5000)%
        дать 5000 кун %actor.name%
        г Зверям деньги не нужны,а тебе пригодятся...
      break
      *кудесник
      case 6
        %self.gold(+5000)%
        дать 5000 кун %actor.name%
      break
      *Волшебники!
      case 7
        %self.gold(+5000)%
        дать 5000 кун %actor.name%
      break
      *чернок
      case 8
        %self.gold(+5000)%
        дать 5000 кун %actor.name%
      break
      *витязь
      case 9
        %self.gold(+5000)%
        дать 5000 кун %actor.name%
        г Зверям деньги не нужны,а тебе пригодятся...
      break
      *охот
      case 10
        %self.gold(+5000)%
        дать 5000 кун %actor.name%
        г Зверям деньги не нужны,а тебе пригодятся...
      break
      *кузнец
      case 11
        %self.gold(+5000)%
        дать 5000 кун %actor.name%
        г Зверям деньги не нужны,а тебе пригодятся...
      break
      *купец
      case 12
        %self.gold(+5000)%
        дать 5000 кун %actor.name%
        г Зверям деньги не нужны,а тебе пригодятся...
      break
      *волхв
      case 13
        %self.gold(+5000)%
        дать 5000 кун %actor.name%
        г Зверям деньги не нужны,а тебе пригодятся...
      break   
      default
        %self.gold(+5000)%
        дать 5000 кун %actor.name%
        г Зверям деньги не нужны,а тебе пригодятся...
      break
    done
~
#70377
Лев вознаграждает~
0 j 100
*~
switch %object.vnum%
  case 70302
    wait 1
    mpurge %object%
    г Ах да! Воробей отыскался... Я помню!
    wait 8
    г Молодчина!
    wait 8
    улы %actor.name%
    wait 1
    *mpurge перо
    wait 8
    if (%actor.class% == 4) && (%actor.level% > 22) && (%actor.skill(осторожный.стиль)% == -1)
      wait 1    
      сказ %actor.name% Я вижу ты еще мал, многого не умеешь и помочь тебе никто не хочет...
      сказ %actor.name% Пожалуй я смогу тебя кое-чему научить... Но для этого сделай еще одно доброе дело...
      wait 15
      сказ %actor.name% У нас в лесу завелось ужасное ночное созданье... 
      сказ %actor.name% Каждое полнолуние оно прилетает в долину и убивает невинных зверей.
      сказ %actor.name% Оставляет на шее только две дырочки от укуса... Ужас! Брр..
      сказ %actor.name% Избавишь лес от него... Научу тебя чему-нибудь.
      calcuid mish703 70316 mob
      attach 70355 %mish703.id%
      wait 30
      г И еще...
      г Пожалуй забери его на память.
      mload obj 70366
      дать перо %actor.name%
    else
      if (%actor.skill(подкрасться)%>=80) && (%actor.level%>=25)
        сказ %actor.name% За это я расскажу тебе как лучше красться.
        сказ %actor.name% В твоей профессии это немаловажно...
        mskilladd %actor.name% подкрасться %random.2%
        wait 30
        г И еще...
        г Пожалуй забери его на память.
        mload obj 70366
        дать перо %actor.name%
      else
        г Пожалуй забери его в подарок.
        mload obj 70366
        дать перо %actor.name%
      end
    end
  end
  switch %object.vnum%
    case 70368
      wait 1
      mpurge %object%
      if (%actor.class% == 4) && (%actor.level% > 22) && (%actor.skill(осторожный.стиль)% == -1)
        сказ %actor.name% Ух ты! Какой ужас ты приволок!
        сказ %actor.name% Похоже, что эта летучая мышь убивала наших зверей.
        сказ %actor.name% Спасибо тебе! И как обещал я научу тебя...
        wait 10
        дум
        wait 10
        хмур
        wait 15
        сказ %actor.name% Осторожно драться! Вот чему я тебя научу!
        mskillturn %actor.name% осторожный.стиль set
      end
    end
    switch %object.vnum%
      case 70362
        wait 1
        mpurge %object%
        wait 8
        г Это что такое?
        wait 8
        mecho Лев развернул план капитана и начал его изучать.
        mecho "ВО СВОЛОЧЬ!",- внезапно взревел Лев.
        wait 8
        г Спасибо тебе за то, что избавил нас от этого злодея!
        улы %actor.name%
        *mpurge план
        wait 8
        switch %actor.class%
          *лекарь
          case 0
            %self.gold(+5000)%
            дать 5000 кун %actor.name%
            г Зверям деньги не нужны,а тебе пригодятся...
          break
          *колдун
          case 1
            %self.gold(+5000)%
            дать 5000 кун %actor.name%
            г Зверям деньги не нужны,а тебе пригодятся...
          break
          *тать
          case 2
            if (%actor.skill(заколоть)%>=80) && (%actor.level%>25)
              mskilladd %actor.name% заколоть %random.2%
              сказ %actor.name% Будешь теперь ножиками лучше тыркать...
              wait 15
              сказ %actor.name% И еще...
              %self.gold(+5000)%
              дать 5000 кун %actor.name%
              г Зверям деньги не нужны,а тебе пригодятся...
            else
              %self.gold(+5000)%
              дать 5000 кун %actor.name%
              г Зверям деньги не нужны,а тебе пригодятся...
            end
          break
          *богатырь
          case 3
            %self.gold(+5000)%
            дать 5000 кун %actor.name%
            г Зверям деньги не нужны,а тебе пригодятся...
          break
          *наемник
          case 4
            if (%actor.level% > 23) && (%actor.skill(Cкрытый удар)% == -1)
              сказ %actor.name% Я вижу ты еще мал, многого не умеешь и помочь тебе никто не хочет... А потому держи подарочек!
              mload obj 70367
              дат клоч %actor.name%
              сказ %actor.name% К сожалению я не могу тебя научить сам, но этот клочок бересты поможет тебе в твоих планах.
            else
              if (%actor.skill(заколоть)%>=80) && (%actor.level%>25)
                mskilladd %actor.name% заколоть %random.2%
                сказ %actor.name% Будешь теперь ножиками лучше тыркать...
                wait 15
                сказ %actor.name% И еще...
                %self.gold(+5000)%
                дать 5000 кун %actor.name%
                г Зверям деньги не нужны,а тебе пригодятся...
              else
                %self.gold(+5000)%
                дать 5000 кун %actor.name%
                г Зверям деньги не нужны,а тебе пригодятся...
              end
            end
          break
          *друж
          case 5
            %self.gold(+5000)%
            дать 5000 кун %actor.name%
            г Зверям деньги не нужны,а тебе пригодятся...
          break
          *кудесник
          case 6
            %self.gold(+5000)%
            дать 5000 кун %actor.name%
          break
          *Волшебники!
          case 7
            %self.gold(+5000)%
            дать 5000 кун %actor.name%
          break
          *чернок
          case 8
            %self.gold(+5000)%
            дать 5000 кун %actor.name%
          break
          *витязь
          case 9
            %self.gold(+5000)%
            дать 5000 кун %actor.name%
            г Зверям деньги не нужны,а тебе пригодятся...
          break
          *охот
          case 10
            %self.gold(+5000)%
            дать 5000 кун %actor.name%
            г Зверям деньги не нужны,а тебе пригодятся...
          break
          *кузнец
          case 11
            %self.gold(+5000)%
            дать 5000 кун %actor.name%
            г Зверям деньги не нужны,а тебе пригодятся...
          break
          *купец
          case 12
            %self.gold(+5000)%
            дать 5000 кун %actor.name%
            г Зверям деньги не нужны,а тебе пригодятся...
          break
          *волхв
          case 13
            %self.gold(+5000)%
            дать 5000 кун %actor.name%
            г Зверям деньги не нужны,а тебе пригодятся...
          break   
          default
            %self.gold(+5000)%
            дать 5000 кун %actor.name%
            г Зверям деньги не нужны,а тебе пригодятся...
          break
        done
~
$~
