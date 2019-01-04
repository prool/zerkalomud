#70300
Лезть завалы север~
2 c 0
лезть~
if !(%arg.contains(завалы)%) 
   wsend       %actor% Куда это Вы хотите пролезть???
   return 0
   halt
end
  wsend       %actor% Кряхтя и охая, вы полезли через завалы. Ох и высота же тут!
  wechoaround %actor% %actor.name% полез%actor.q% через завалы.
  wait 1s
  wsend %actor% Вы на северной стороне завала.
  wteleport %actor% 70306
  %actor.wait(1)%
  wat 70306  wechoaround %actor% Кто-то пролез сюда.
~
#70301
Лезть завалы юг~
2 c 0
лезть~
if !(%arg.contains(завалы)%) 
   wsend       %actor% Куда это Вы хотите пролезть???
   return 0
   halt
end
switch %random.3%
case 1
  wsend       %actor% Вы полезли через завалы.
  wechoaround %actor% %actor.name% полез%actor.g% через завалы. 
  wait 5s
  wsend %actor% Вы благополучно перебрались через заставу зверей.
  wteleport %actor.name% 70305
  wat 70305 wechoaround %actor% Кто-то пролез сюда.
break
case 2
 wsend       %actor% Вы полезли через завалы.
 wechoaround %actor% %actor.name% полез%actor.g% через завалы.
  wait 5s
  wsend %actor% Случайно вы подскользнулись на табакерке волка и свалились вниз.
  wteleport %actor.name% 70306
   wdamage %actor% 50
  wat 70306 wechoaround %actor% _%actor.name% свалился обратно. Вот дела!
break
case 3
  wsend       %actor% Вы полезли через завалы.
  wechoaround %actor% %actor.name% полез%actor.g% через завалы.
  wait 5s 
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
 wat 70306 wechoaround %actor% _%actor.name% получил%actor.g% горшком по голове! 
  wdamage %actor% 60
  wait 1
  wecho Лиса флиртует сверху:"Простите! Извините! Я не хотела!"
 break
case 2
  wsend       %actor% Вдруг ваш нос УЖАСНО обожгло чем-то, прилетевшим сверху. Вам даже понравилось!
  wat 70306 wechoaround %actor% %actor.name% словил%actor.g% носом горстку табака из табакерки волка. 
  wdamage %actor% 50
  wait 1
  wecho Волк крикнул сверху:"Извините! Ветер понимаешь.."
 break
case 3
  wsend       %actor% Вдруг на вас сверху свалилось нечто большое... Дальше вы ничего не помните...
 wat 70306  wechoaround %actor% _%actor.name% получил%actor.g% пнем по голове. 
  wdamage %actor% 100
  wait 5
  wecho Медведь пробасил сверху:"Ну.. Э-Э-Э Простите, что ли!"
 break
case 4
 wsend       %actor% Вдруг вас накрыло тучей шелухи, прилетевшей сверху. О! Как приятно!
 wat 70306  wechoaround %actor% _%actor.name% скрылся%actor.g% в туче шелухи от семечек. 
  wdamage %actor% 30
  wait 5
  wecho Заяц промямлил сверху:"Иззввинните други.. Яяя неччаянно!"
 break
case 5
 wecho Мимо вас пролетела деревянная вилка с огурцом."Каким добром раскидываются!",-подумали Вы. 
 break
done
~
#70303
Лев говорит~
0 q 100
~
wait 1
 msend %actor% Дорогой гость! Я очень рад видеть тебя в нашей волшебной стране! Гмм...
 msend %actor% Беда у нас стряслась! БЕДА!
 msend %actor% Дело в том, что один злостный купчина пришел к нам и предложил купить картошку!
 msend %actor% Ох! Сколько у нас голодает зверей! А переселенцев то из соседних лесов!
 msend %actor% Я думал куплю мешок. Засадим картошкой общее поле.
wait 1
mechoaround %actor% Лев задумался над тяжелой жизнью звериного царства. 
wait 1
msend %actor% Так вот посадили мы поле. И вдруг откуда то прилетели жуки колорадские.
msend %actor% Стали есть нашу картошку. Но мы не серчали, ведь воробей нам помогал...
msend %actor% А как выкопали картошку, как наварили ее. Собрались всем лесом!
msend %actor% Только сели есть и вдруг вылазит ОН! Таракан!
крест
wait 1
msend %actor% Он как усами зашевелил у меня сразу волосы дыбом встали...
боя
msend %actor% Все врассыпную! Кто куда.. Я сам еле пятки унес. Ой негоже царю то бегать!
wait 1
msend %actor% Вобщем собрал я всех зверей и общими силами отделились завалом от того конца леса.
msend %actor% А зараза эта! Колорадские жуки по всему лесу теперь разползлись... Погибель нам! Ой погибель!
msend %actor% Хотел я одно время воробья найти, да пропал кудато сорванец! Улетел! Бросил нас на погибель!
msend %actor% Может поможешь нам справиться с напастью? Я добром отплачу!
~
#70304
Лев согласен~
0 d 0
помогу~
if %actor.vnum% != -1
   halt
end
say Звери не забудут твой подвиг! Удачи тебе!
attach 70343 %self.id%
detach 70303 %self.id%
detach 70304 %self.id%
~
#70305
Лезем в грот~
2 c 0
лезть пролезть~
if !(%arg.contains(лаз)%) 
   wsend       %actor% Куда это Вы хотите пролезть???
   return 0
   halt
end
  wsend       %actor% Вы полезли в узкий лаз.
  wechoaround %actor% %actor.name% полез%actor.g% в лаз. 
  wait 5s
  wsend %actor% Вы вылезли на поверхность.
  wteleport %actor.name% 70350
  wat 70350 wechoaround %actor% Кто-то пролез сюда
~
#70306
Лезем из грота~
2 c 0
лезть пролезть~
if !(%arg.contains(лаз)%) 
   wsend       %actor% Куда это Вы хотите пролезть???
   return 0
   halt
end
  wsend       %actor% Вы полезли в узкий лаз.
  wechoaround %actor% %actor.name% полез%actor.g% в лаз. 
  wait 5s
  wsend %actor% Вы вылезли на поверхность.
  wteleport %actor.name% 70333
  wat 70333 wechoaround %actor% Кто-то пролез сюда.
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
  wsend       %actor% Вы полезли в узкую щель. Ох и тяжело же тут ползти!
  wechoaround %actor% %actor.name% полез%actor.g% в лазейку. 
  wait 1s
  %actor.move(-200)%
  wsend %actor% Ваши старания были не напрасны? Вы пролезли в расширение длинной щели из известняка.
  wteleport %actor.name% 70386
  wat 70386 wechoaround %actor% Кто-то пролез сюда.
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
  %actor.move(-200)%
  wsend %actor% Вы пролезли в грот.
  wteleport %actor.name% 70351
  wat 70351 wechoaround %actor% Кто-то пролез сюда.\
end
~
#70309
Открываем проход в зад~
2 c 0
надавить давить нажать вдавить~
if !(%arg.contains(кирпич)%) 
   wsend       %actor% Что это вы хотите вдавить???
   return 1
   halt
end
wait 1
wsend       %actor% Вы вдавили кирпич.
wechoaround %actor% %actor.name% вдавил%actor.u% кирпич.
wait 2s
wecho    По гроту покатился грохот и звон цепей. Северная кирпичная стена отворилась, открыв секретный проход.
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
  wsend       %actor% Вы полезли под гобелен, всеми силами пытаясь приподнять его над полом.
  wechoaround %actor% %actor.name% полез%actor.g% под гобелен. 
  wait 5s
  wsend %actor% Вы пролезли на другую сторону гобелена.
  wteleport %actor.name% 70371
  wat 70371 wechoaround %actor% Кто-то пролез сюда
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
  wsend       %actor% Вы полезли под гобелен, всеми силами пытаясь приподнять его над полом.
  wechoaround %actor% %actor.name% полез%actor.g% под гобелен. 
  wait 5s
  wsend %actor% Вы пролезли на другую сторону гобелена.
  wteleport %actor.name% 70363
  wat 70363 wechoaround %actor% Кто-то пролез сюда
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
г Сами же заслали купца с заколдованной картошкой.
г Все, насекомые, которые отведают этой картошки вырастут до невероятных размеров!
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
wpurge худой
wload mob 70318
calcuid gavrur 70363 room
detach 70310 %tolst.id%
calcuid gavrur 70371 room
detach 70311 %gavrur.id%
calcuid tolst 70318 mob
attach 70315 %tolst.id%
run 70315 %tolst.id%
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
say УРОДЫ!!!
mecho Толстый стражник схватил вас за шиворот и поволок в камеру.
eval  zekchar %self.people%
eval  numer 0
while %zekchar% & (%num% < 20)
      set komp %zekchar.next_in_room%
      if %zekchar.vnum% == -1
         mechoaround %zekchar% %zekchar.name% отправлен%actor.g% в камеру! 
         mteleport %zekchar% 70370
         wait 1
         if %zekchar.realroom% == 70370
            msend %zekchar% Вы теперь заключенный! Как интересно!
            eval  numer (%numer%+1)
         end 
      end
      if %komp%
         makeuid zekchar %komp.id%
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
wait 180
wecho Прошло немного времени.
wait 60
wecho Прошло еще немного времени.
wait 60
wecho Прошло и еще немного времени.
wait 60
wecho Вам это начало уже надоедать.
wait 60
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
wecho Послышался звон доставаемых из ножен мечей и крики:"УРАА!!"
wecho Уже знакомый голос крикнул:"УРОДЫ!!!"
wait 30
wecho "БАНЗззЗАЙ!!!",- завизжал чей то голосок.
wecho Затем какой то шелест и чьи крики:"Ничего не вижу!!!"
wait 30
wecho Звук подсечьки сменился звуком разбившегося горшка.
wait 10
wecho "Будеш знать как меня за попку трогать!",- флиртующе сказал чей-то лукавый голосок.
wait 30
wecho Вам показалось, что звуки все ближе и ближе.
wait 30
wecho Слышен топот ног перед дверью... Звон стали... 
wecho Кажется за дверью идет драка и чья-то сторона несет потери...
wecho Тупой удар чьего-то тела о дверь, чуть не сорвал ее с петель...
wait 30
wecho Где-то рядом оглушающе кто-то гавкнул на кого-то:"ТАБАЧКУ НЕ НАЙДЕТСЯ?!!"
wecho Слышен мощный удар по чьей то каске, а затем звук хруста сменился тишиной.
wait 30
wecho За восточной стеной вашей темницы послышался звон хорошо отточенного меча.
wecho "УРОДЫ!!!",- снова заорал знакомый голос.
wecho "НУ ТЫ ДОСТАЛ!!!!",- взревел чей то бас.
wait 30
wecho Мощный удар крупного тела о восточную стену вашей темницы снес ее напрочь.
wecho Вас накрыло падающими кирпичами... Из-за пыли ничего не видно.
wait 30
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
wpurge толст
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
if %world.curobjs(70303)% == 0
г Да кстати мы тут у одного гада ключ отобрали, может тебе пригодится.
mload obj 70303
дат ключ %actor.name%
end
calcuid lisa 70320 mob
attach 70320 %lisa.id%
run 70320 %lisa.id%
~
#70320
Лиса~
0 z 100
~
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
0 cfg 0
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
закол копей
calcuid medved 70319 mob
attach 70323 %medved.id%
run 70323 %medved.id%
~
#70323
Медведь на юг~
0 z 100
~
ю
у лучн
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
~
*хальт - пока зона отключена (спамит еррорлог)
halt
calcuid vorob1 70371 mob
attach 70312 %vorob1.id%
calcuid vorob2 70371 mob
detach 70328 %vorob2.id%
calcuid zverk 70307 room
attach 70302 %zverk.id%
calcuid rasx 70355 room
attach 70340 %rasx.id%
calcuid gavrur1 70363 room
attach 70310 %gavrur1.id%
calcuid gavrur2 70371 room
attach 70311 %gavrur2.id%
calcuid proxod 70351 room
attach 70309 %proxod.id%
calcuid lev1 70300 mob
detach 70343 %lev1.id%
calcuid lev2 70300 mob
attach 70303 %lev2.id%
calcuid lev3 70300 mob
attach 70304 %lev3.id%
calcuid vorota 70381 room
attach 70344 %vorota.id%
calcuid kapitan 70355 room
attach 70340 %kapitan.id%
calcuid zverik 70306 room
attach 70302 %zverik.id%
calcuid zveriyug 70306 room
attach 70301 %zveriyug.id%
calcuid zveriyug2 70306 room
detach 70345 %zveriyug2.id%
calcuid mish703 70316 mob
detach 70355 %mish703.id%
calcuid marb703 70352 mob
detach 70349 %marb703.id%
calcuid marb703 70352 mob
detach 70356 %marb703.id%
calcuid marb703 70352 mob
detach 70357 %marb703.id%
calcuid marb703 70352 mob
detach 70358 %marb703.id%
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
  wsend       %actor% Вы полезли в узкую дыру. Ох и тяжело же тут ползти, да еще и незамеченным остаться.
  wait 5s
  %actor.move(-200)%
  wsend %actor% Вы тихо вылезли рядом за печкой.
  wteleport %actor.name% 70396
  wat 70396 wechoaround %actor% Кто-то тихо пролез сюда.
end
~
#70327
Лезть дыра обратно~
2 c 100
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
  wait 5s
  %actor.move(-200)%
  wsend %actor% Вы пролезли в узкую комнатушку.
  wteleport %actor.name% 70355
  wat 70355 wechoaround %actor% Кто-то пролез сюда.
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
г Сами же заслали купца с заколдованной картошкой.
г Все, насекомые, которые отведают этой картошки вырастут до невероятных размеров!
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
calcuid vorob2 70371 room
attach 70329 %vorob2.id%
run 70329 %vorob2.id%
~
#70329
последствия воробей2~
2 z 100
~
wpurge худой
~
#70330
умер толстый~
0 f 100
~
if %world.curobjs(70303)% == 0
mload obj 70303
end
calcuid vorob1 70371 mob
detach 70312 %vorob1.id%
calcuid vorob2 70371 mob
attach 70328 %vorob2.id%
~
#70331
Повариха померла~
0 f 100
~
if %world.curobjs(70309)% == 0
mload obj 70309
end
~
#70332
Помер капитан~
0 f 100
~
if (%world.curobjs(70359)% < 5) && (%random.10% == 1)
   mload obj 70359
end
if (%world.curobjs(70360)% < 5) && (%random.10% == 1)
   mload obj 70360
end
if (%world.curobjs(70362)% == 0)
   mload obj 70362
end
~
#70333
Помер шпион~
0 f 100
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
Помер сотник~
0 f 100
~
if (%world.curobjs(70343)% < 5) && (%random.10% == 1)
   mload obj 70343
end
if (%world.curobjs(70344)% < 5) && (%random.10% == 1)
   mload obj 70344
end
if (%world.curobjs(70345)% < 5) && (%random.10% == 1)
   mload obj 70345
end
if (%world.curobjs(70346)% < 5) && (%random.10% == 1)
   mload obj 70346
end
if (%world.curobjs(70347)% < 5) && (%random.10% == 1)
   mload obj 70347
end
if (%world.curobjs(70348)% < 5) && (%random.10% == 1)
   mload obj 70348
end
if (%world.curobjs(70349)% < 5) && (%random.10% == 1)
   mload obj 70349
end
if %random.100% < 3
if %world.curobjs(1240)% < 1
mload obj 1240
end
end
~
#70335
Помер оруженосец~
0 f 100
~
if (%world.curobjs(70361)% < 3) && (%random.10% == 1)
   mload obj 70361
end
~
#70336
Помер рыцарь~
0 f 100
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
wpurge шпион
wpurge капит
wait 1
calcuid kapit 70377 room
attach 70341 %kapit.id%
run 70341 %kapit.id%
~
#70340
Воевода и шпион расходятся~
2 e 100
~
wait 15
wecho "Хер капитан!",- пробасил грубый голос.
wait 15
wecho "Что тебе надо Вермухт?",- ответил другой голос.
wait 15
wecho "В моем замке выше сотника тебе не дослужиться!",- видимо сказал капитан.
wait 15
wecho "Вернулся наш шпион с докладной",- сказал сотник. 
wait 15
wecho "Давай его сюда!",- резко ответил капитан.
wait 15
wecho Слышен стук дверей.
wait 15
wecho "Хер капитан! Я тчательно изучил окрестности трех родовых деревень, а также на обратном пути разведал обстановку в стане Льва",- начал доклад шпион.
wait 15
wecho "У меня есть две новости: Одна плохая, а другая хорошая. С какой начать?",- юлит шпион.
wait 15
wecho "Пожалуй, лучше начать с плохой, а закончить с хорошей",- рявнул сотник.
wait 15
wecho "Спасибо Вермухт. Ты знаешь мои вкусы.",- добавил капитан.
wait 15
wecho "Плохие новости из родовых деревень. Они не имеют укреплений. Немного местных воинов не смогли бы справиться с нами...",- рассказывает шпион.
wait 15
wecho "Если бы не проходимцы. Их немного, но они хорошовооружены и опытны. Некоторые арендуют комнаты в трактирах, другие же идут мимоходом. Пара таких может отразить атаку всего нашего зеленого звена!",- внезапно закончил рассказ шпион.
wait 15
wecho "Чтож... Действительно плохие новости. Наш маленький гарнизон в полсотни бойцов сможет набегом уничтожить только одну из трех деревень...",- мыслит вслух капитан.
wait 15
wecho "Пожалуй сначала подождем подкрепления!",- оборвал свои мысли капитан.
wait 15
wecho "А что за хорошие новости?",- несдержался сотник.
wait 15
wecho "Наша затея с заколдованной картошкой получилась наславу! На земле зверей разгуливают огромные колорадские жуки. А тот самый таракан вырос до неимоверных размеров!",- хитрым голосом докладывает шпион.
wait 15
wecho "Должен добавить, что на юге остатки зверей под командованием льва перекрыли вход в долину огромными завалами...",- говорит шпион.
wait 15
wecho "И еще... На западном берегу круглого пруда осталось небольшое количество зверья. Странно, что жуки не доползли до туда...",- закончил докладываться шпион.
wait 15
wecho "Вот это славные новости! Подождем немного и остатки зверей сами сдохнут без еды!",- обрадовался капитан.
wait 15
wecho "Вольная тебе до утра, а я пойду подумаю над дальнейшими планами...",- отдал приказ капитан.
wait 15
wecho "Да и еще! Вермухт проследи за охраной и выставь десятников. У меня предчувствие, что на нас нападут!",- отдал распоряжения капитан.
wait 15 
wecho "Есть! Капитан!",- рявнули два оглушительных голоса.
wait 15
wecho Спустя некоторое время топот и стук дверей сменился тишиной.
calcuid kapit 70375 room
attach 70339 %kapit.id%
run 70339 %kapit.id%
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
~
if %object.vnum% == 70301
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
  mpurge ус
   switch %random.3%
     case 1
       mload obj 70316
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
    wait 20
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
wait 20
дум
wait 20
хмур
wait 20
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
wait 2s
wecho    Снизу донесся звон цепей и грохот упавшей створки ворот замка.
  wat 70339 wechoaround %actor% Вдруг с грохотом перед вами упала створка ворот замка, чуть не придавив.
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
  wait 5s
  wsend %actor% Вы благополучно перебрались через заставу зверей.
  wteleport %actor.name% 70305
  wat 70305 wechoaround %actor% Кто-то пролез сюда.
~
#70346
Старичек приветствует~
0 r 100
~
г Привет!
wait 15
г Что ты здесь делаешь ? В такие дебри забрел.
хмур
wait 15
г Здесь вокруг чудища лесные бродят.
г Не боишься ?
вопр %actor.name%
wait 15
г Здесь если что случится с тобой помощи не позовешь..
wait 15
г Тут не ходит никто.
wait 15
г Этот лес на север аж до самого Новгорода идет. А может быть и дальше. А на запад даже и не знает никто.
wait 15
г Давным давно мне мой прадед сказку рассказывал, что в этом лесу есть дивная долина.
wait 15
г Там тепло и летом и зимой. И живут в ней говорящие звери...
wait 30
г А еще здесь болота есть и топи страшные. Идешь по лесу и вдруг чувствуешь, как тебя засасывает.
wait 15
г Еще сам помню, когда молодым был. Послал прусский царь одну из дружин в обход Новгорода к югу.
wait 15
г Шли они, говорят, через этот лес. Только где-то далеко на западе.
wait 15
г Да сгинули прусы треклятые!
wait 15
г Никто так и не знает зачем он эту дружину посылал.
wait 15
г Благо не видать и не слыхать про них ничего.
wait 15
г Хотя мне сын в дружине Корсуньской говаривал, что они опять войной хотят идти на Русь.
wait 30
г И вообще ты тут зря бродишь! А на грибы не смотри! Это я их нашел!
wait 30
г И вообще идика ты отсюдова!
wait 30
г Мое ето место! Иди отсюда! И ГРИБЫ НЕ ТОПЧИ! ИДИОТ!
рыч %actor.name%
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
if %world.curmobs(62108)% == 1 then
wpurge марб
wait 5
wpurge зуб
wpurge шкур
wload mob 70352
calcuid marb703 70352 mob
attach 70349 %marb703.id%
calcuid mslug703 62143 room
attach 70351 %mslug703.id%
run 70351 %mslug703.id%
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
#70351
Убираем слуг1~
2 z 100
~
calcuid m703 62163 room
detach 70348 %m703.id%
wpurge слуг
wpurge слуг
calcuid mslug703 62144 room
attach 70352 %mslug703.id%
run 70352 %mslug703.id%
~
#70352
Убираем слуг2~
2 z 100
~
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
msend %actor% Марбендилл показал Вам место, куда ударить.
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
if !(%arg.contains(правую щеку)%) 
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
mpurge марб
else
у %actor.name%
end
~
$~
