* BRusMUD trigger file v1.0
#26500
Убили ужаса~
0 f0 100
~
if ( %random.1000% < 50 ) and ( %world.curobjs(26500)% < 3 ) 
   mload obj 26500
end 
if ( %random.1000% < 50 ) and ( %world.curobjs(26501)% < 3 ) 
   mload obj 26501
end 
if ( %random.1000% < 50 ) and ( %world.curobjs(26502)% < 3 ) 
   mload obj 26502
end 


~
#26501
Создали месть~
0 n0 100
~
mload obj 26516
од все
if ( %random.1000% < 50 ) and ( %world.curobjs(26503)% < 3 ) 
   mload obj 26503
wait 1
воор все
end 
if ( %random.1000% < 50 ) and ( %world.curobjs(26504)% < 3 ) 
   mload obj 26504
wait 1
од все
end 
if ( %random.1000% < 50 ) and ( %world.curobjs(26505)% < 3 ) 
   mload obj 26505
wait 1
од все
end 


~
#26502
убили зависть~
0 f0 100
~
  if ( %random.1000% < 50) and (%world.curobjs(26506)% < 3)
mload obj 26506
  end
  if ( %random.1000% < 50) and (%world.curobjs(26507)% < 3)
mload obj 26507
  end
    if ( %random.1000% < 50) and (%world.curobjs(26508)% < 3)
mload obj 26508
  end


~
#26503
убили ревность~
0 f0 100
~
if ( %random.1000% < 40) and (%world.curobjs(26509)% < 3)
   mload obj 26509
end
if ( %random.1000% < 30) and (%world.curobjs(26510)% < 3)
   mload obj 26510
end


~
#26504
убили гнев~
0 f0 100
~
if ( %random.1000% < 25) and (%world.curobjs(26511)% < 2)
   mload obj 26511
end
   if   (%world.curobjs(26513)% < 1)
    mload obj 26513
  end
 


~
#26505
убили страсть~
0 f0 100
~
if ( %random.1000% < 25) and (%world.curobjs(26512)% < 2)
   mload obj 26512
end
if (%world.curobjs(26513)% < 1)
    mload obj 26513
end
  


~
#26506
Лоадим ненависть~
0 n0 100
~
mload obj 26516
од все
if ( %random.1000% < 50 ) and ( %world.curobjs(26515)% < 2 ) 
   mload obj 26515
   од пояс
end 
if ( %random.1000% < 50 ) and ( %world.curobjs(26514)% < 2 ) 
   mload obj 26514
   воо меч
end 


~
#26507
Вскрываем дверь~
2 c0 0
взломать взломат взлома взлом взло взл~
if !%arg.contains(замок)%
   wsend %actor% ЧТО вы хотите взломать ?
   halt
end
if %actor.skill(взломать)% < 100 
  wsend %actor% Этот замок слишком сложен для вас. Учитесь.
  wechoaround %actor% %actor.name% попытался вскрыть замок, но ему явно не хватает опыта
  halt
end
   wdoor 26503 west purge
   wdoor 26503 west room 26519
  wsend %actor% Вы ловко вскрыли этот несложный замок.
  wechoaround %actor% %actor.name% Ловко всыкрыл этот несложный для него замок.
detach 26507 %self.id%


~
#26508
Заходим к старику 1~
0 q0 100
~
    wait 1 
    кашл
    wait 1
    встать
    wait 1
эм подслеповато прищурился, стараясь разглядеть вас.
    wait 1   
г Вон оно как! Дошли значит! Вот уж не думал...
wait 1
г Что тоже грехи душу жгут?
г это вы тогда в правильное место пришли
г туточки они все
wait 1
   взд
wait 1 
г Каждый раз когда в мире совершается греховное деяние
г в этом подвале добавляется соответствующая мерзость
wait 1
   г я пытался остановить их, но мои грехи тяжкие не дали мне этого сделать
   плак
wait 1
г  помогите мне обрести источник силы самого страшного греха
г и я избавлю людей от него!


~
#26509
согласились со стариком~
0 d0 0
помогу да согласен освобожу убью~
wait 1   
г Спасибо тебе, я знал, что могу расчитывать на вашу помощь.
   wait 2
   г Но я должен рассказать тебе кое-что.
   wait 2
   дум
   wait 2
г Чтобы попасть к самому мерзкому греху, тебе придетеся пройти по одному из двух  путей.
  wait 2
г По пути Силы И Ловкости или по пути Мудрости и Удачи.
  дум
wait 2
г На первом пути тебя ждет нелегкая битва..
wait 2
г Если же ты выберешь второй путь, то битв почти не будет...почти...
г НО!
wait 4
г У тебя не будет возможности ошибиться... Если ты ошибешься на пути Мудрости и Удачи, то
г не сможешь выполнить свою миссию.
эм горько вздохнул
wait 3
г Ну так что, какой путь ты выберешь ? Учти, я слишком слаб сейчас, чтобы открыть тебе оба.
вопр
г Сила ИЛИ Мудрость ?
attach 26510 %self.id%
attach 26511 %self.id%
attach 26520 %self.id%
detach 26508 %self.id%
detach 26509 %self.id%


~
#26510
Выбрали силу.~
0 d0 0
Сила~
wait 3
дум 
г Ну что ж, выбор сделан. Иди..
г Надеюсь, ты справишься и выйдешь победителем из этой битвы..
 mecho Раздался громкий треск и скрежет, будто где-то открывается потайная дверь.
mdoor 26526 south flags a
 mdoor 26526 south room 26534 
detach 26511 %self.id%
detach 26510 %self.id%







~
#26511
Выбрали мудрость~
0 d0 0
Мудрость~
wait 3
 дум 
г Ну что ж, выбор сделан...
г Надеюсь, тебе хватит мудрости и удачи...
г Иди же.
   mecho Раздался громкий треск и скрежет, будто где-то открывается потайная дверь.
 mdoor 26528 south flags a
 mdoor 26528 south  room 26532
detach 26510 %self.id%
detach 26511 %self.id%







~
#26512
Создали отчаяние~
0 n0 100
~
if ( %random.1000% < 50 ) and ( %world.curobjs(26517)% < 2 ) 
   mload obj 26517
   воор трез
end 
if ( %random.1000% < 50 ) and ( %world.curobjs(26518)% < 2 ) 
   mload obj 26518
   воо меч
end 
mload obj 26516
од все


~
#26513
Зашли к мудрецу~
0 q0 100
~
  wait 3
  дум
   wait 5
эм встрепенулся, отвлекся от своих мысле и, кажется, заметил вас.
  wait 6
   г чего вы хотите?
  wait 4
 вопр 
  г Вы хотите пройти...
  wait 7
  г Ну что ж, помоги мне найти на два вопроса и я пропущу тебя...
 wait 10
  г Оба вопроса из великой науки - науки считать...
  г я и сам мог бы на них ответить, но... память подводит меня в последнее время.
  wait 5
  г слушай первый - 
  wait 5
  г если последовательность чисел 
   г ОДИН
  г ШЕСТЬДЕСЯТ ЧЕТЫРЕ
  г ДВЕСТИ СОРОК ТРИ
  г ДВЕСТИ ПЯТЬДЕСЯТ ШЕСТЬ
  г СТО ДВАДЦАТЬ ПЯТЬ
  г ТРИДЦАТЬ ШЕСТЬ 
* Один в седьмой, два в шестой, три в пятой, четыре в четвертой,
*пять в третьей, шесть во второй. Ответ собсна семь в 1 = 7
  wait 5
  г какое следующее число ?
attach 26514 %self.id%
detach 26513 %self.id%


~
#26514
отвечаем на первый вопрос.~
0 d0 0
семь СЕМЬ 7~
г Отлчино, я так и знал ! НО.. не мог вспомнить...
радов
смущ
wait 5
г еще один вопрос.
wait 10
дум
г в этот раз последовательность такая 
дум
г ДВЕНАДЦАТЬ
г ДВАДЦАТЬ ЧЕТЫРЕ
г ТРИДЦАТЬ ВОСЕМЬ
г ПЯТЬДЕСЯТ ШЕСТЬ
г ВОСЕМДЕСЯТ ДВА
вопр
wait 1
г ответь мне цифрами друг мой, а не буквами...
* 10а+б, где б=2 в степени а
*ответ - 6*10+2 в шестой = 60 + 64 = 124
attach 26515 %self.id%
detach 26514 %self.id%   


~
#26515
отвечаем на второй вопрос~
0 d0 0
126~
г ДА ДА ДА...
г это правильный ответ..
г Иди же, я не буду тебе мешать..
mpurge %self.id%







~
#26516
убили уныние~
0 f0 100
~
if ( %random.1000% < 50 ) and ( %world.curobjs(26520)% < 2 ) 
   mload obj 26520
end 
if ( %random.1000% < 50 ) and ( %world.curobjs(26519)% < 2 ) 
   mload obj 26519
end 


~
#26517
убил глупость~
0 f0 100
~
if ( %random.1000% < 100 ) and ( %world.curobjs(26521)% < 10 ) 
   mload obj 26521
end 


~
#26518
убили лень~
0 f0 100
~
if ( %random.1000% < 100 ) and ( %world.curobjs(26520)% < 10 ) 
   mload obj 26522
end 


~
#26519
убили ранодушие~
0 f0 100
~
if ( %random.1000% < 20 ) and ( %world.curobjs(26523)% < 2 ) 
   mload obj 26523
end 
if ( %random.1000% < 20 ) and ( %world.curobjs(26524)% < 2 ) 
   mload obj 26524
end 
   mload obj 26525


~
#26520
принесли шар старику~
0 j0 100
~
   if (%object.vnum% != 26525)
г это не то что мне нужно..
бро все
   halt
  end
  улы
г Отлчино!
г Тебе это удалось, и значит ты заслуживаешь награды..
  switch %random.15%
  case 1
  г я дам тебе свиток, вызубрив который, ты сможешь понять, как ловчее пронзить своего врага.
  mload obj 26526 
   г запомни - возьми его в левую руку и вызубри как следует.
  д свит %actor.name%
  break
   case 2
     г я дам тебе свиток, вызубрив который, ты сможешь понять, как избегать атак вражьих.
  mload obj 26527
   г запомни - возьми его в левую руку и вызубри как следует.
  дать свит %actor.name%
  break
  case 3
    г я дам тебе свиток, вызубрив который, ты сможешь понять, как сбить врага своего, чтобы не встал он.
  mload obj 26528 
   г запомни - возьми его в левую руку и вызубри как следует.
  дать свит %actor.name%
  break
  default
  done
   msend %actor% Вы стали чуть-чуть богаче
  %actor.gold(+5000)%
  detach 26520 %self.id%


~
#26521
читаем свиток укола~
1 c0 1
вызубрить~
 if (!%arg.contains(свиток)%)
osend %actor% что вы хотите вызубрить ?
 halt
 end
switch %actor.class%
 case 2   
if %actor.skill(заколоть)% < 155 
   oskilladd %actor% заколоть %random.7%
 opurge %self%
    end
break
end
 case 4  
if %actor.skill(заколоть)% < 155 
   oskilladd %actor% заколоть %random.7%
   opurge %self%
 end
break


~
#26522
читаем свиток острожки~
1 c0 1
вызубрить~
 if (!%arg.contains(свиток)%)
osend %actor% что вы хотите вызубрить ?
 halt
 end
switch %actor.class%
 case 12   
if %actor.skill(осторожный.стиль)% < 155 
   oskilladd %actor% осторож %random.7%
 opurge %self%
    end
break
end
 case 5  
if %actor.skill(осторожный.стиль)% < 155 
   oskilladd %actor% осторож %random.7%
   opurge %self%
 end
break


~
#26523
читаем свиток щита~
1 c0 1
вызубрить~
 if (!%arg.contains(свиток)%)
osend %actor% что вы хотите вызубрить ?
 halt
 end
switch %actor.class%
 case 5   
if %actor.skill(сбить)% < 155 
   oskilladd %actor% сбить %random.7%
 opurge %self%
    end
break
end
 case 9  
if %actor.skill(сбить)% < 155 
   oskilladd %actor% сбить %random.7%
   opurge %self%
 end
break
 case 10  
if %actor.skill(сбить)% < 155 
   oskilladd %actor% сбить %random.7%
   opurge %self%
 end
break


~
#26524
ресет~
2 f0 100
~
calcuid qroom 26503 room
attach 26507 %qroom.id%
calcuid qmob 26507 mob
attach  26508 %qmob.id%
attach 26509 %qmob.id%
wdoor 26528 south purge
wdoor 26526 south purge






~
#26525
блок для меча~
1 j0 100
~
if  ((%actor.level% > 6 ) || (%actor.str% > 26 ))
  return 0
  osend %actor% Да не такой уж Вы юный герой, каким хотите казаться.
  halt
end


~
#26526
лоадим равнодушие~
0 n0 100
~
mload obj 26516
од все


~
#26527
лоадим безразличие~
0 n0 100
~
if ( %random.1000% < 50 ) and ( %world.curobjs(26529)% < 2 ) 
   mload obj 26529
   од все
end 


~
#26528
Лоадим подлость~
0 n0 100
~
if ( %random.1000% < 75 ) and ( %world.curobjs(26530)% < 4 ) 
   mload obj 26530
   воо стил
end 

~
$
$
