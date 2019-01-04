#105200
субсутай помер~
0 f 100
~
mechoaround %actor% %actor.name% наклонил%actor.u% и ловко оттяпал%actor.g% уши Субсутая.
msend %actor% Вы наклонились и ловко оттяпали уши Субсутая.
mload obj 105226
~
#105201
черный мус помер~
0 f 100
~
if ((%random.3% == 1) && (%world.curobjs(105223)% < 2)) 
  mload obj 105223
else
  if ((%random.2% == 1) && (%world.curobjs(105224)% < 2))
    mload obj 105224
  end
end    
~
#105202
сырчан приветствует~
0 q 100
~
эм поднял взгляд, полный глубокой задумчивости
wait 4
г Здравствуй, %actor.name%!
г Долгий путь проделал%actor.g% ты к нашему хотону.
г Не видал%actor.g% ли в степи злокозненного охотника Субсутая?
рыч
wait 4
г Живет он в моих землях, а ясак не платит!
г Уж послал я за ним своих гулямов, да что-то ни один не вернулся.
г Больно он хитер и ловок.
взд
wait 4
г Встретишь его в дороге - сослужи службу, убей как собаку.
wait 2s
эм всплеснул руками
г Йах! Прости, %actor.name%, совсем я поглупел от горя.
г Держу тебя в дверях, словно черного человека!
г Будь гостем, прошу, проходи в юрту.
г Ешь и пей мои яства, садись рядом со мной у очага.
calcuid syrchan 105200 mob
attach 105203 %syrchan.id%
attach 105204 %syrchan.id%
~
#105203
пройти в юрту~
0 c 0
пройти войти зайти~
if (%razulsya.iname% != %actor.iname%)
  msend %actor% Куда же ты не разувшись-то прешь?!
  halt
end
if (%arg.contains(по)%)
  msend %actor% Вы прошли по солнцу и сели рядом с ханом.
  mechoaround %actor% %actor.iname% прош%actor.y% по солнцу и сел%actor.g% подле хана.
  wait 4
  ул %actor.iname%
  г %actor.iname%, ты знаешь и уважаешь наши обычаи.
  г Я всегда буду рад видеть тебя в своей юрте.
  wait 4
  г Не хочешь ли сыграть на домбре, показать свое искусство?
  calcuid syrchan 105200 mob
  attach 105205 %syrchan.id%
else
  if (%arg.contains(против)%)
    msend %actor% Вы прошли против солнца и сели рядом с ханом.
    mechoaround %actor% %actor.iname% прош%actor.y% против солнца и сел%actor.g% подле хана.
    wait 4
    гнев %actor.iname%
    г Ах ты, невежда!
    г Приш%actor.y% в чужой дом, а обычаев не соблюдаешь?!
    wait 4
    г Вон из моей юрты!
    unset razulsya
    * телепортимся
    eval pcs %self.pc%
    foreach i %pcs%
      mteleport %i% 105271
    done
  else
    msend %actor% Пройти можно по солнцу или против солнца.
  end
end
~
#105204
разуться~
0 c 0
разуться~
if (%arg.contains(справа)%) 
  msend %actor% Вы разулись направо от входа.
  eval obuvka %actor.eq(ступни)%
  if (%obuvka%)
    mforce %actor% снять %obuvka.iname%
  end
  unset razulsya
  wait 4
  эм грозно нахмурил брови
  г Не знаешь ты наших обычаев, %actor.iname%.
  г Иди-ка лучше прочь, не гневи меня.
  * телепортимся
  eval pcs %self.pc%
  foreach i %pcs%
    mteleport %i% 105271
  done
else
  if (%arg.contains(слева)%)
    msend %actor% Вы разулись налево от входа.
    eval obuvka %actor.eq(ступни)%
    if (%obuvka%)
      mforce %actor% снять %obuvka.iname%
    end
    eval razulsya %actor%
    global razulsya
    wait 4
    эм одобрительно крякнул
  else
    msend %actor% Разуться можно справа или слева от входа. 
  end 
end
~
#105205
хотим сыграть~
0 d 1
хочу сыграю да~
эм подал знак степному певцу
wait 4
calcuid pevec 105205 mob
attach 105206 %pevec.id%
remote razulsya %pevec.id%
exec 105206 %pevec.id%
calcuid urta 105286 room
attach 105207 %urta.id%
~
#105206
певец передает домбру~
0 z 100
~
снять домбр
эм чуть заметно улыбнулся
поклон %razulsya.iname%
wait 4 
дать домбр %razulsya.iname%
~
#105207
играть домбра~
2 c 0
играть сыграть заиграть~
eval dombra %actor.eq(18)%
if !(%arg.contains(домбр)% && (%dombra.vnum%==105203)) 
  wsend %actor% Вы достали из кармана деревянные ложки и давай наяривать.
  wsend %actor% Похоже, это не произвело ни на кого впечатления...
  wechoaround %actor% %actor.iname% достал%actor.g% из кармана деревянные ложки и давай наяривать.
  wechoaround %actor% Нда, получилось как-то не очень...
  halt
end
wsend %actor% Вы тронули чуткие струны домбры и она запела нежным голосом.
wechoaround %actor% %actor.iname% тронул%actor.g% чуткие струны домбры и она запела нежным голосом.
wait 4
* дорожная песня. исполняется впервые.
wforce %actor% г Лети, о красавец джейран,
wforce %actor% г По волнам степного ковыля
wforce %actor% г И пыльная ляжет пусть миля,
wforce %actor% г Под потом лоснящийся стан.
wait 4
wforce %actor% г Отдавшись свободе ветров,
wforce %actor% г Скачи же на юг, к Алатау,
wforce %actor% г Где несколько юрт на джайляу
wforce %actor% г Кочуют у синих снегов.
wait 4
wforce %actor% г Там белый и мудрый акын,
wforce %actor% г Там домбры звенящие струны,
wforce %actor% г По травам зеленых равнин
wforce %actor% г Волнистые ходят буруны.
wait 4
wforce %actor% г Мой лук, мой табун, моя кровь-
wforce %actor% г Простился со всем бы на свете,
wforce %actor% г Чтоб только когда - нибудь вновь 
wforce %actor% г Увидеть бескрайние степи!
wait 1s
wforce %actor% поклон
wforce %actor% снять домбра
wforce %actor% дать домбра певец
calcuid syrchan 105200 mob
attach 105208 %syrchan.id%
exec 105208 %syrchan.id%
~
#105208
сырчан наконец дает квест~
0 z 100
~
счас
г Потешил%razulsya.g% ты меня, %razulsya.iname%!
г В тебе живет душа настоящего степняка.
wait 4
г Полюбил я тебя и потому расскажу о своей беде.
плак %razulsya.iname%
г Был у меня младший брат, хан Отрок - лихой батыр.
г Как-то взяли мы из Руси великий полон и устроили пир горой.
г Рекою лился кумыс во всем хотоне, всяк был пьян и весел.
всхлип
wait 4
г И вдруг раздался звон мечей, отовсюду послышался шум и крик.
г Пришла кровь и смерть - и никому не было пощады.
г То был русский князь с великою дружиной.
бледн
wait 4
г Словно спугнутая ловцами стая лебедей побежали мы врозь.
г Я с малым отрядом скрылся в степи.
г А Отрок пропал, и не было его ни среди выживших, ни среди мертвых.
взд
wait 4
г И вот прошло много лет...
г Услышал я, что в далекой стране живет в золотом шатре грозный хан.
г Чевствует он подвластных князей, величавый будто солнце.
г Я знаю, это брат мой.
wait 4
г Пойди к нему, о %razulsya.iname%!
г Спой ему наших песен, а если на песнь не отзовется
г Свяжи в пучок емшан-травы и дай ему, и он вернется.
благосл %razulsya.iname%
г Ступай же.
* уфф. это тебе не помогу сказать.
eval quester1052 %actor%
global quester1052
calcuid otrok 105201 mob
attach 105216 %otrok.id%
remote quester1052 %otrok.id%
calcuid syrchan 105200 mob
detach 105202 %syrchan.id%
detach 105203 %syrchan.id%
detach 105204 %syrchan.id%
detach 105205 %syrchan.id%
detach 105206 %syrchan.id%
detach 105207 %syrchan.id%
detach 105208 %syrchan.id%

~
#105209
субсутай приветствует~
0 q 100
~
wait 4
изум %actor.iname%
г Эгей, кто это бродит в моем лесу?!
г Чтоли тебя прислала старая карга Сяяда?
смея
wait 4
г Ох уж эта мне Сяяда - уже половины зубов нет,
г А все туда же - в невесты метит!
хих
wait 4
г Ну да а мне не в тягость, пусть считает меня хоть мужем.
г Лишь бы поила почаще арзой да кумысом.
хохот
wait 1s
г Ну чего молчишь? Немой чтоли?
г Давай чего прислали.
~
#105210
даем кумыс~
0 j 100
~
wait 4
if !(%object.vnum% == 105208)
  г Что ты мне всякую дрянь даешь?!
  halt
end
calcuid bortho 105208 obj
mpurge %bortho%
рад
г Ох, целый бортхо кумыса прислала моя милая карга!
смея
wait 1s
эм отхлебнул изрядный глоток
г Хорошо!
wait 4s
эм отхлебнул изрядный глоток
г Ох, хорошо!
wait 4s
эм отхлебнул изрядный глоток
wait 4
эм посмотрел на вас мутным взглядом.
г Дбрый кумыс.
ик
wait 4
г Нада пйти к Сяяде, отблгдрить.
г Я знаю тут крткий путь, бстра дойдем.
ик
wait 4
г Пшли, пшли, в нутук прдем - пить будем, плсать будем.
хих
msend %actor% Субсутай схватил вас под руку и потащил куда-то через лес.
mechoaround %actor% Субсутай схватил %actor.vname% под руку и потащил куда-то через лес.
* телепортимся
eval pcs %self.pc%
foreach i %pcs%
  mteleport %i% 105228
done
calcuid subsutay 105206 mob
mteleport %subsutay% 105228
wait 1s
г Пчти пршли! Дгоняй, я впред пбегу - душа горит!
wait 4
mecho Субсутай припустил еще быстрее, и вот его уже и след простыл.
eval wepun %subsutay.eq(18)%
mpurge %wepun%
mpurge %subsutay%
mecho Ну и куда это он вас завел?
~
#105211
великан приветствует~
0 q 100
~
wait 4
эм медленно поставил на землю здоровенную глыбу
wait 4
г Хм.
ворч
wait 1s
г Ты чего это здесь, %actor.iname%, позабыл%actor.g%?
wait 1s
ухм
г Вижу, вижу - хочешь пройти.
г Но только я тебя просто так не пущу.
wait 4
г Понимаешь, %actor.iname%, скучно мне в одиночестве горы-то двигать.
г Ну и придумываю я разные загадки для развлеченья.
wait 4
г Давно хотел кому-нибудь загадать, да никто не ходит в этих местах.
бубн
wait 4
г Стало быть, отгадаешь - уберу скалу, а не отгадаешь - сам убирай.
хохот
~
#105212
говорим загадывай~
0 d 1
загадывай готов готова согласен согласна слушаю~
эм хитро прищурился
wait 4
eval zagadka %random.28%
global zagadka
calcuid velikan 105273 mob
attach 105213 %velikan.id%
switch %zagadka%
  case 1
    г Три белых.
    wait 4
    г Когда растешь - белеют зубы,
    г Стареешь - белеют волосы,
    г А умрешь.. ? 
    * белеют кости.
  break
  case 2
    г Три темных
    wait 4
    г Темен хотон без овец,
    г Темен дом без лампады,
    г Темна душа.. ?
    * без знаний
  break
  case 3
    г Три из тех, кому недостает
    wait 4
    г Богачу сна недостает,
    г Иноходцу жира недостает,
    г Дураку.. ?
    * ума недостает
  break
  case 4
    г Три чистых
    wait 4
    г Маленького озера вода чиста,
    г Скупого человека котел чист,
    г Доброго человека.. ?
    * душа чиста.
  break 
  case 5
    г Три холодных
    wait 4
    г Холоден северный ветер,
    г Холодна змея, заползшая за пазуху,
    г Холодно сердце.. ?
    * злого человека.
  break
  case 6
    г Три ненасытных
    wait 4
    г Не насытится водой сухая земля,
    г Не насытится богатством скряга,
    г Не насытится учебой.. ?
    * ученый.
  break
  case 7
    г Три серых
    wait 4
    г Серо тело умершего,
    г Сера зола печи,
    г Серо сердце.. ?
    * дурного человека.
  break
  case 8
    г Три несуществующих
    wait 4
    г Нет у моря мутовки,
    г Нет у горы лестницы,
    г Нет у птицы.. ?
    * грудей.
  break
  case 9
    г Три пыльных
    wait 4
    г Пыльна дорога скакуна,
    г Плохого человека сердце пыльно,
    г Полон пыли дом.. ?
    * неряхи.
  break
  case 10
    г Три говорливых
    wait 4
    г Стареющий человек - говорлив,
    г Говорлива птица голубь,
    г Говорливо весеннее.. ?
    * небо.
  break
  case 11
    г Три из того, что хорошо
    wait 4
    г Хорошо, когда окажешь помощь уставшему,
    г Хорошо, когда поможешь нищему,
    г Хорошо, когда поднимешь.. ?
    * упавшего.
  break
  case 12
    г Три несуществующих
    wait 4
    г Нет подпорки у неба,
    г Нет у моря мешалки,
    г Нет крышки.. ?
    *у океана.
  break
  case 13
    г Три мечтающих
    wait 4
    г Птица о грудях мечтает,
    г Бездетная женщина о ребенке мечтает,
    г Недоучка-ученик.. ?
    * о знаниях мечтает.
  break
  case 14
    г Три отвратных
    wait 4
    г Отвратна змея, охватившая ноги,
    г Отвратна грязь, налипшая на подол,
    г Отвратно сердце.. ?
    * дурного человека.
  break
  case 15
    г Три легких
    wait 4
    г Мысли недалекого человека легки,
    г Высохшее сено легко,
    г Легка вина, разделенная.. ?
    * с людьми.
  break
  case 16
    г Три быстрых
    wait 4
    г Весенний ветер быстр,
    г Бег хорошего скакуна быстр,
    г Когда думаешь.. ?
    * мысль быстра.
  break
  case 17
    г Три черных
    wait 4
    г После смерти тело черно,
    г У негодяя с рождения мысли черны,
    г У разбойника.. ?
    * сердце черно.
  break
  case 18
    г Три крепких
    wait 4
    г Крепки корни дерева,
    г Крепки мысли умного,
    г Крепки когти.. ?
    * ястреба.
  break
  case 19
    г Три радостных
    wait 4
    г Радостно войско, победившее врагов,
    г Радостен сокол, схвативший зверя,
    г Радостен вор.. ?
    * с добычею.
  break
  case 20
    г Три мечтающих
    wait 4
    г Дерево сухое о листьях мечтает,
    г Неграмотный о знаниях мечтает,
    г Бездетный.. ?
    * о ребенке мечтает.
  break
  case 21
    г Три малых
    wait 4
    г Мало озеро заросшее травой,
    г Мала всегда женщина без мужа,
    г Мал народ.. ?
    * без предводителя.
  break
  case 22
    г Три помехи
    wait 4
    г Много денег - человеку помеха,
    г Большой дом - хозяину помеха,
    г Высокая ограда.. ?
    * табуну помеха.
  break
  case 23
    г Три невозможных
    wait 4
    г Невозможно взобраться на небо,
    г Невозможно увидеть свои уши,
    г Невозможно укусить.. ?
    * свою ладонь.
  break
  case 24
    г Три мечтающих
    wait 4
    г Плешивая голова о волосах мечтает,
    г Сухое дерево о листьях мечтает,
    г Черный чай.. ?
    * о молоке мечтает.
  break
  case 25
    г Три из того, что покрыто
    wait 4
    г Небо облаками покрыто,
    г Пастбища снегом покрыты,
    г Широкое море.. ?
    * льдом покрыто.
  break
  case 26
    г Три холодных
    wait 4
    г У плохого хозяина дом холоден,
    г У плохой хозяйки пища холодна,
    г У недружелюбного человека.. ?
    * мысли холодны.
  break
  case 27
    г Три далеких
    wait 4
    г Далеко пастбище для пастуха,
    г Далека подушка для покойника,
    г Далеко богатство.. ?
    * для нищего.
  break
  case 28
    г Три изначальных
    wait 4
    г Начало еды - чай,
    г Начало ткани - хадак,
    г Начало живых существ.. ?
    * рыба.
  break
done
wait 4
ул
г Ну, %actor.iname%, продолжай.
detach 105211 %velikan.id%
detach 105212 %velikan.id%
~
#105213
отгадываем~
0 d 1
*~
switch %zagadka%
  case 1
    if !(%speech.contains(кост)% || %speech.contains(череп)%)
      halt
    end
    * белеют кости.
  break
  case 2
    if !(%speech.contains(знан)% || %speech.contains(любв)%)
      halt
    end
    * без знаний
  break
  case 3
    if !(%speech.contains(ума)% || %speech.contains(знан)%)
      halt
    end
    * ума недостает
  break
  case 4
    if !(%speech.contains(душа)% || %speech.contains(совесть)%)
      halt
    end
    * душа чиста.
  break 
  case 5
    if !(%speech.contains(злого)% || %speech.contains(дурного)%)
      halt
    end
    * злого человека.
  break
  case 6
    if !(%speech.contains(учен)% || %speech.contains(мудр)%)
      halt
    end
    * ученый.
  break
  case 7
    if !(%speech.contains(дурн)% || %speech.contains(злого)%)
      halt
    end
    * дурного человека.
  break
  case 8
    if !(%speech.contains(груд)% || %speech.contains(рук)%)
      halt
    end
    * грудей.
  break
  case 9
    if !(%speech.contains(нерях)% || %speech.contains(грязн)%)
      halt
    end
    * неряхи.
  break
  case 10
    if !(%speech.contains(небо)%)
      halt
    end
    * небо.
  break
  case 11
    if !(%speech.contains(упавш)% || %speech.contains(падш)%)
      halt
    end
    * упавшего.
  break
  case 12
    if !(%speech.contains(океан)%)
      halt
    end
    *у океана.
  break
  case 13
    if !(%speech.contains(знан)%)
      halt
    end
    * о знаниях мечтает.
  break
  case 14
    if !(%speech.contains(дурного)% || %speech.contains(злого)%)
      halt
    end
    * дурного человека.
  break
  case 15
    if !(%speech.contains(людьм)% || %speech.contains(друг)%)
      halt
    end
    * с людьми.
  break
  case 16
    if !(%speech.contains(мысл)%)
      halt
    end
    * мысль быстра.
  break
  case 17
    if !(%speech.contains(сердц)% || %speech.contains(душа)%)
      halt
    end
    * сердце черно.
  break
  case 18
    if !(%speech.contains(ястреб)% || %speech.contains(сокол)%)
      halt
    end
    * ястреба.
  break
  case 19
    if !(%speech.contains(добыч)% || %speech.contains(краж)%)
      halt
    end
    * с добычею.
  break
  case 20
    if !(%speech.contains(ребен)% || %speech.contains(детях)%)
      halt
    end
    * о ребенке мечтает.
  break
  case 21
    if !(%speech.contains(предвод)% || %speech.contains(хан)%)
      halt
    end
    * без предводителя.
  break
  case 22
    if !(%speech.contains(табун)% || %speech.contains(стад)%)
      halt
    end
    * табуну помеха.
  break
  case 23
    if !(%speech.contains(ладон)% || %speech.contains(локоть)%)
      halt
    end
    * свою ладонь.
  break
  case 24
    if !(%speech.contains(молок)% || %speech.contains(кумыс)%)
      halt
    end
    * о молоке мечтает.
  break
  case 25
    if !(%speech.contains(льдом)% || %speech.contains(льдами)%)
      halt
    end
    * льдом покрыто.
  break
  case 26
    if !(%speech.contains(мысл)% || %speech.contains(сердц)%)
      halt
    end
    * мысли холодны.
  break
  case 27
    if !(%speech.contains(нищ)% || %speech.contains(бедн)%)
      halt
    end
    * для нищего.
  break
  case 28
    if !(%speech.contains(рыба)% || %speech.contains(рыбы)%)
      halt
    end
    * рыба.
  break
done
wait 4
г Гляди-ка! Отгадал%actor.g%!
апл %actor.iname%
wait 5
г Ну, раз обещал - пропущу.
эм легко поднял здоровенную глыбу и зашвырнул ее далеко-далеко
calcuid glyba 105206 obj
mpurge %glyba%
mdoor 105241 north room 105248
calcuid velikan 105273 mob
detach 105213 %velikan.id%
~
#105214
организуем обвал~
2 e 100
~
calcuid westroom 105241 room
calcuid eastroom 105234 room
wait 4
wsend %actor% Подвернув ногу вы громко заорали.
wechoaround %actor% Подвернув ногу %actor.iname% громко заорал%actor.g%.
wait 4
wecho Громадные валуны высоко наверху зашатались.
wait 4
wecho Вниз посыпались мелкие камушки.
wdamage %actor% 50
wait 4
wecho Со страшным грохотом валуны обрушились вниз.
wecho Вы еле-еле увернулись от здоровенного камня.
if (%direction.contains(west)%)
  exec 105223 %westroom.id%
else
  exec 105224 %eastroom.id%
end
wait 4
wforce %actor% пот
wait 1s
wecho Ну вот. Теперь узкий проход завален напрочь.
calcuid prohod 105235 room
wload obj 105230
wdoor 105235 %direction% purge
detach 105214 %prohod.id% 
~
#105215
отрок приветствует~
0 q 100
~
wait 4
эм с усмешкой взглянул на вас
г Что тебе нужно в моем шатре, %actor.iname%?
г Повелеваю тебе, говори!
wait 4
msend %actor% Вы принялись горячо звать хана Отрока в родимые степи.
mechoaround %actor% %actor.iname% принялся горячо звать хана Отрока в родимые степи.
wait 4
эм принял угрюмый вид и отвел взгляд
if (%actor.sex% == 1)
  г Уведите его!
else
  г Уведите еe!
end
wait 4
mecho Повинуясь знаку своего повелителя послушливые кунаки двинулись в вашу сторону.
wait 10s
mecho Послушливые кунаки выставили вас вон из шатра.
* телепортимся
eval pcs %self.pc%
foreach i %pcs%
  mteleport %i% 105255
done
~
#105216
даем пучок емшан-травы~
0 j 100
~
wait 4
if !(%object.vnum% == 105204)
  хму
  г Ты в своем уме?!
  halt
end
msend %actor% Побледнев, вы подали хану пучок емшан-травы.
mechoaround %actor% Побледнев, %actor.iname% подал%actor.g% хану пучок емшан-травы.
wait 1s
эм схватился за грудь, словно почуя в сердце рану
эм со слезами на глазах поднес пучок емшан-травы к губам
wait 4
эм резко взмахнул кулаком
г Не царь я больше вам отныне!
г Смерть в краю родном милей, чем слава на чужбине!
wait 4
mecho Хан Отрок с немногою дружиной немедленно тронулся в путь.
mecho Ну и славненько. Пора и вам.
calcuid otrok 105201 mob
mteleport %otrok% 105286
calcuid syrchan 105200 mob
mpurge %syrchan%
mload mob 105202
mload mob 105203
calcuid newsyrchan 105202 mob
remote quester1052 %newsyrchan.id%
eval wepun %otrok.eq(16)%
mpurge %wepun%
mpurge %otrok%
~
#105217
ну и награда за квест~
0 q 100
~
wait 4
встать
wait 4
if (%actor.iname% == %quester1052.iname%)
  обнять %quester1052.iname%
  г Спасибо тебе, %quester1052.iname%!
  г Я теперь навеки твой должник.
  wait 4
  г Прими пока хоть этот скромный дар.
  if ((%random.3% == 1) && (%world.curobjs(105209)% < 2)) 
    mload obj 105209
    дать семис %actor.iname%
  else
    if ((%random.2% == 1) && (%world.curobjs(105210)% < 2))
      mload obj 105210
      дать семис %actor.iname%
    else
      mload obj 105216
      дать мешок %actor.iname%
    end
  end   
  wait 4
  г Ну, ты забегай если что.
  пожать %actor.iname%
end
отд
calcuid newsyrchan 105202 mob
detach 105217 %newsyrchan.id%
~
#105218
даем уши сырчану~
0 j 100
~
wait 4
if !(%object.vnum% == 105226)
  г Ты должно быть спутал%actor.g%, мне это не нужно.
  halt
end
calcuid ushi 105226 obj
mpurge %ushi%
г Да это же уши ловкача Субсутая!
г Ты с ним разделал%actor.u%?
г Славно.
эм с довольством кивнул
wait 4
г За это я тебя награжу.
mload obj 105216
дать мешок %actor.iname%
~
#105219
тукэ-красный приветствует~
0 q 100
~
wait 4
eval pcs %self.pc%
eval btr 0
foreach i %pcs%
  if ((%i.class% == 3) && (%i.sex% == 1))
    eval btr 1
  break
end
done
if (%btr%)
  эм выпятил волосатую грудь колесом
  г Эгей, %i.iname%-батыр!
  г Давай мерять силу плеч и лопаток!
end
~
#105220
хитрый эдг бухтит~
0 q 20
~
wait 4
дум
г Булмук надо есть с края, там он быстрее охлаждается.
г Так и царство хана Джаным нужно завоевывать с края, со слабого места.
wait 4
вмазать
эм отвлекся от своих мыслей и удивленно посмотрел на вас
~
#105221
репоп зоны~
2 f 100
~
calcuid newotrok 105203 mob
wpurge %newotrok%
calcuid newsyrchan 105202 mob
wpurge %newsyrchan%
calcuid pevec 105205 mob
exec 105225 %pevec.id%
calcuid obval 105230 obj
wpurge %obval%
wdoor 105235 west room 105241
wdoor 105235 east room 105234
wdoor 105234 west room 105235
wdoor 105241 east room 105235
wdoor 105241 north purge
calcuid prohod 105235 room
attach 105214 %prohod.id%
calcuid velikan 105273 mob
attach 105211 %velikan.id%
attach 105212 %velikan.id%
detach 105213 %velikan.id%
~
#105222
будя-мерген нападает~
0 q 100
~
wait 4
встать
г Берегись, %actor.iname%!
г Срежу я у тебя жирную брюшину, брошу тебе ее в рот!
г Ташир-башир!
msend %actor% Будя-Мерген бросился на Вас.
mechoaround %actor% Будя-Мерген бросился на %actor.vname%.
mkill %actor%
~
#105223
обвал на востоке~
2 z 100
~
wecho С востока донесся чей-то отчаянный вопль.
wait 4
wecho Громадные камни посыпались в узкий проход на востоке.
wecho Теперь он завален напрочь.
wdoor 105241 east purge
~
#105224
обвал на западе~
2 z 100
~
wecho С запада донесся чей-то отчаянный вопль.
wait 4
wecho Громадные камни посыпались в узкий проход на западе.
wecho Теперь он завален напрочь.
wdoor 105234 west purge
~
#105225
лоадим домбру певцу~
0 z 100
~
if (%world.curobjs(105203)% == 0)
  mload obj 105203
end
воор домбра
~
#105226
великан помер~
0 f 100
~
mechoaround %actor% Встряхнул%actor.g% %actor.name% великана на своем бронзово-серебряном бедре и ударил%actor.g% об землю.
msend %actor% Вы встряхнули великана на своем бронзово-серебряном бедре и ударили об землю.
mecho Затряслась земля от удара, а каменная глыба на тысячу кусков раскололась.
calcuid glyba 105206 obj
if %glyba%
  mpurge %glyba%
end
mdoor 105241 north room 105248
~
$~
