#2500
вручение подарка~
2 c 100
вручитьподарки~
*из комнаты 2500 призываем моба который вручает подарки, пуржится и резетит зону заново
wait 1
unset mobpozdravitel
calcuid mobpozdravitel 2500 mob
if (%mobpozdravitel% && (%mobpozdravitel.position% != 7))
  wteleport %mobpozdravitel% %self.vnum%
  wecho Внезапно в комнату робко вошел слуга, что-то сжимая запазухой.
  wait 1 s
  wforce %mobpozdravitel% поклон
  wait 2 s
  wforce %mobpozdravitel% аплоди .стрибог
  wait 1 s
  wforce %mobpozdravitel% дать все .стрибог
  wait 1 s
  wforce %mobpozdravitel% г ПОЗДРАВЛЯЕМ С НОВЫМ ГОДОМ!
  wait 1 s
  wforce %mobpozdravitel% кивнуть
  wait 3 s
  wecho Слуга не задерживаясь отправился по другим (менее значимым, но всеже необходимым) поручениям.
  wpurge %mobpozdravitel%
  %world.zreset(25)%
else
  wecho Откуда-то послышались звуки новогодних хлопушек и питард.
end
~
#2501
пить из кружки~
1 c 3
*~
* если выполняется команда "пить" или "drink" и аргумент похож на нашу шмотку -- то выполняем
if (%cmd.mudcommand% == пить || %cmd.mudcommand% == drink || %cmd.mudcommand% == пробовать || %cmd.mudcommand% == taste)
  if (%arg.contains(бол)% || %arg.contains(кру)%)
    osend %actor% Вы глотнули &Cсилы жизни&n из &WБольшой &YКружки &RБосса&n.
    osend %actor% Вы почувствовали прилив &Gжизненных сил&n!
    osend %actor% Приятное настроение наполнило Вас!
    osend %actor% Откуда-то Вы услышали голоса: "&RСлава и хвала отцу МАДа нашего!&n"
    if !%actor.name%
      oechoaround Стрибог выпил напиток &Cсилы жизни&n из &WБольшой &YКружки &RБосса&n.
    else
      oechoaround %actor% %actor.name% выпил%actor.g% напиток &Cсилы жизни&n из &WБольшой &YКружки &RБосса&n.
    end
    wait 1
  end
end
return 0
~
#2502
пить из бутылки шампанского~
1 c 2
*~
* если выполняется команда "пить" или "drink" и аргумент похож на нашу шмотку -- то выполняем
if !%actor.name%
  return 0
  halt
end
if (%cmd.mudcommand% == пить || %cmd.mudcommand% == drink || %cmd.mudcommand% == пробовать || %cmd.mudcommand% == taste)
  if (%arg.contains(бут)% || %arg.contains(шам)%)
    osend %actor% Вы выпили шампанского из &Kбу&gтылки &Kша&gмпанского&n.
    oechoaround %actor% %actor.name% выпил%actor.g% шампанского из &Kбу&gтылки &Kша&gмпанского&n.
    wait 1
    %actor.wait(2)%
  end
end
return 0
~
#2503
Трясти новогоднюю елочку~
0 c 4
трясти~
wait 1
mechoaround %actor% %actor.name% начал%actor.g% трясти &Gвысоченную новогоднюю ёлочку&n.
msend %actor% Вы начали трясти &Gвысоченную новогоднюю ёлочку&n.
%actor.wait(5s)%
wait 5
if %random.100% < 20
  mecho Внезапно &Rш&Yа&Gр&Cи&Bк &Rд&Yл&Gя &Rн&Yо&Gво&Cго&Bдн&Mей&R е&Yл&Gк&Cи&n упал с &Gвысоченной новогодней ёлочки&n!
end
~
#2504
Вешаем новогодний шарик на елочку~
0 j 100
~
wait 1
if %object.vnum% == 2504
  wait 1
  mpurge %object%
  mechoaround %actor% %actor.name% повесил%actor.g% &Rш&Yа&Gр&Cи&Bк &Rд&Yл&Gя &Rн&Yо&Gво&Cго&Bдн&Mей&R е&Yл&Gк&Cи&n на &Gвысоченную новогоднюю елочку&n.
  msend %actor% Вы повесили &Rш&Yа&Gр&Cи&Bк &Rд&Yл&Gя &Rн&Yо&Gво&Cго&Bдн&Mей&R е&Yл&Gк&Cи&n на &Gвысоченную новогоднюю елочку&n.
  * Выдача приза за сбор новогодних шариков
  eval randomnum2504 %random.1000%
  if %randomnum2504% < 10
    mload obj 1144
    log &YВНИМАНИЕ: &R%actor.name%&G получил с новогодней елки (&Wсупер-приз :)&G): &Mмоск Ясны&G
  elseif %randomnum2504% < 50
    switch %random.6%
      case 1
        mload obj 1130
        log &YВНИМАНИЕ: &R%actor.name%&G получил с новогодней елки: &Mкираса повелителя волн&G
      break
      case 2
        mload obj 1131
        log &YВНИМАНИЕ: &R%actor.name%&G получил с новогодней елки: &Mнагрудник повелителя ночи&G
      break
      case 3
        mload obj 1132
        log &YВНИМАНИЕ: &R%actor.name%&G получил с новогодней елки: &Mдоспех повелителя ветра&G
      break
      case 4
        mload obj 1133
        log &YВНИМАНИЕ: &R%actor.name%&G получил с новогодней елки: &Mамулет повелителя недр&G
      break
      case 5
        mload obj 1134
        log &YВНИМАНИЕ: &R%actor.name%&G получил с новогодней елки: &Mкираса повелителя пламени&G
      break
      case 6
        mload obj 1135
        log &YВНИМАНИЕ: &R%actor.name%&G получил с новогодней елки: &Mнагрудник повелителя солнца&G
      break
    done
  elseif %random.1000% < 300
    * бутылка шампанского + коробка с конфетами - 10% лоад
    mload obj 2506
    mload obj 2505
    mload obj 11225
    mload obj 11225
    mload obj 11225
    mload obj 11225
    mload obj 11225
    положить все.конф коробк
    * Выдача утешительного приза 
  elseif %random.10% < 5
    mload obj 2508 * пельмени новгодние
  else
    mload obj 11225 * конфета мишка в киеве
  end
  give all .%actor.name%
  drop all
else
  tell %actor.name% Если у Вас есть &Rш&Yа&Gр&Cи&Bк &Rд&Yл&Gя &Rн&Yо&Gво&Cго&Bдн&Mей&R е&Yл&Gк&Cи&n то принесите его.
  wait 2
  drop all
end
~
#2505
Даем Ньюбам Конфетку~
0 q 100
~
wait 1
if !%actor.name%
  halt
end
if %actor.remort% == 0 && %actor.level% < 29 && %actor.age% < 25
  wait 3
  mload obj 2506
  mload obj 2505
  mload obj 11225
  mload obj 11225
  mload obj 11225
  mload obj 11225
  mload obj 11225
end
положить все.конф коробк
give all .%actor.name%
~
#2506
срубить елку~
0 c 1
срубить~
wait 1
log %actor.name% &C срубил новогоднюю елку.
mecho &GВысоченная новогодняя ёлка&n с грохотом упала на землю!
if %random.5% > 3
  mecho &RШ&Yа&Gр&Cи&Bк &Rд&Yл&Gя &Rн&Yо&Gво&Cго&Bдн&Mей &Rе&Yл&Gк&Cи&n упал на землю.
  mload obj 2504
end
%purge% %self%
~
#2507
Полет летучего корабля~
0 z 100
~
*Определяем, куда летим
set target 27015
switch %random.25%
  case 1
    set city Корсунь
    set target 27015
  break
  case 2
    set city Торжок
    set target 24027
  break
  case 3
    set city Киев
    set target 49974
  break
  case 4
    set city Великий новгород
    set target 60029
  break
  case 5
    set city Муром
    set target 76067
  break
  case 6
    set city Галич
    set target 34420
  break
  case 7
    set city Брянск
    set target 66027
  break
  case 8
    set city Владимир
    set target 18212
  break
  case 9
    set city Вышгород
    set target 63605
  break
  case 10
    set city Искоростень
    set target 13570
  break
  case 11
    set city Курск
    set target 63040
  break
  case 12
    set city Ладога
    set target 30211
  break
  case 13
    set city Любеч
    set target 69075
  break
  case 14
    set city Минск
    set target 77047
  break
  case 15
    set city Переяславль
    set target 25001
  break
  case 16
    set city Полоцк
    set target 72008
  break
  case 17
    set city Псков
    set target 75066
  break
  case 18
    set city Путивль
    set target 64033
  break
  case 19
    set city Ростов
    set target 85125
  break
  case 20
    set city Русса
    set target 35031
  break
  case 21
    set city Рязань
    set target 73085
  break
  case 22
    set city Тверь
    set target 60265
  break
  case 23
    set city Тотьма
    set target 62027
  break
  case 24
    set city Туров
    set target 32408
  break
  case 25
    set city Чернигов
    set target 68078
  break
done
if (%where% == %target%)
  halt
end
крича Проходите, люди добрые, поспешайте!
крича Наш летучий корабль отправляется в город славный, %city% называемый!
крича А коли желаете с нами в путь-дорогу пуститься - так и оставайтесь.
wait 30s
mdoor 2501 d purge
mdoor %where% u purge
calcuid ladder 2598 obj
mpurge %ladder%
set where %target%
global where
mecho Заскрипели натянутые снасти, парус наполнился воздухом, и корабль двинулся в путь.
wait 10s
set i 0
while (%i% < 12)
  switch %random.17%
    case 1
      mecho &RСтая птиц с железными клювами пронеслась прямо у борта!&n
    break
    case 2
      mecho &WОбрывки облаков облизывают верхушку мачты.&n
    break
    case 3
      mecho &CЗемля почти скрылась в туманной дымке.&n
    break
    case 4
      mecho &WВетер свистит в снастях.&n
    break
    case 5
      mecho &GПарус бешенно захлопал, и по палубе забегали переполошенные корабелы. &n
    break
    case 6
      mecho &YСолнечные лучи пронизывают облака, озаряя палубу.&n 
    break
    case 7
      mecho &CЛуна и солнце одновременно повисли в небе.&n 
    break
    case 8
      mecho &GВы повстречали другой летучий корабль, и ваши корабелы приветственно махали ему руками.&n
    break
    case 9
      mecho &RСтая крылатых летучих змеев накинулась было на корабль, но корабелы отогнали их стрелами и гарпунами.&n
    break
    case 10
      mecho &CБеззвучная молния сверкнула высоко в небе.&n 
    break
    case 11
      mecho &GСтайка ведьм верхом на помелах со свистом и хохотом промчалась мимо.&n 
      mecho &GОдна из них кинула вам колдовской цветок, но едва вы его коснулись - он рассыпался тучей искр.&n 
    break
    case 12
      mecho &YВнизу видны огни какого-то города.&n 
    break
    case 13
      mecho &WСтая больших белых птиц увязалась за кораблем.&n 
    break
    case 14
      mecho &CКорабль закачался в потоках сильного ветра.&n
    break
    case 15
      mecho &RБагровый и косматый шар солнца висит над покровом облаков, слепя глаза.&n 
    break
    case 16
      mecho &KЧерные тяжелые тучи заслонили землю.&n
    break
    case 17
      mecho &YДалеко внизу проплывают леса, поля, города и веси.&n
    break
  done
  eval i %i%+1
  wait 10s
done
mdoor 2501 d room %target%
mdoor %target% u room 2501
mload obj 2598
calcuid ratchet %target% room
calcuid ladder 2598 obj
%ladder.put(%ratchet%)%
mecho Наконец вы прибыли в город %city%.
mecho %self.name% приказал спустить парус и сбросил вниз веревочную лестницу.
attach 2509 %ratchet%
exec 2509 %ratchet%
орать Летучий корабль прибыл в город %city%! Поспешай-налетай!
~
#2508
Запуск полета корабля~
2 f 100
~
if !%shkiper%
  calcuid shkiper 2504 mob
  global shkiper
end
exec 2507 %shkiper.id%
~
#2509
Оповещение о прибытии корабля~
2 z 100
/ra 'wzoneecho' 'wzoneecho %self.vnum%'~
wzoneecho %self.vnum% &Y'Поспешайте люди добрые, налетайте!' - Закричал белобородый купчина.&n
wzoneecho %self.vnum% &Y'Летучий корабль привез на торг товары невиданные, диковины да чудеса!' - продолжил он.&n
detach 2508 %self.id%
~
#2510
Взрывается петарда~
1 h 100
~
wait 1
oecho &YПетарда рассыпалась яркими искрами!&n
calcuid target %self.room% room
attach 2511 %target%
exec 2511 %target%
opurge %self%
~
#2511
Сообщения петарды.~
2 z 100
~
wait 1
wzoneecho %self.vnum% __________&M*  &Y*  &C*  &YТРРАХ! ТАР-РАРРАХ! БУМ! БАБАБХ! - послышался взрыв петарды.  &C*  &M*  &C*&n
~
#2512
Выдача подарков елочкой~
1 c 4
забрать~
if (%actor.vnum% != -1)
  halt
end
if ((%cmd% != забрать) || (%arg% != подарок))
  %send% %actor% Чаво-чаво?
  halt
end
if (%actor.level% < 2)
  %send% %actor% - Мал%actor.q% ты еще подарки просить.
  halt
end
*получаем метку года
if (%date.month% > 6)
  eval nyear %date.year%+1
else
  set nyear %date.year%
end
if (%actor.getquest(2500)% == %nyear%)
  %send% %actor% - Ты уже получал%actor.q% в этом году подарки!
  %send% %actor% - Приходи в следующем году.
  %send% %actor% &gЕлочка широко улыбнулась.&n
  halt
end
set listpresents 2505 2506 2507 2508 2509 2510 2511 2512 2513 2514 2515 2516 2517 2518 2519 2520 2521 2522 2523 2524 2525 2526 2527 2528 2529 2530 2531 2532 2533 2534 2535
eval rnd %random.31%
eval presentvnum %listpresents.words(%rnd%)%
%load% obj %presentvnum%
calcuid present %presentvnum% obj
%present.put(%actor%)%
%send% %actor% &gЕлочка достала для Вас подарок..&n
%send% %actor% - Тебе, %actor.iname%, Дед Мороз принес %present.vname% на Новый Год.
%send% %actor% - Счастливого Нового Года, %actor.iname%!
%echoaround% %actor% %actor.iname% развернул%actor.q% свой подарок и завизжал%actor.q% от радости!
set buf %actor.setquest(2500 %nyear%)%
log &G%actor.name% получил подарок %present.vname%!&n
~
#2513
Запустить снежком~
1 c 3
кинуть~
wait 1
set item %arg.words(1)%
set target %arg.words(2)% 
if ((%item% != снежок) && (%item% != снежком))
  osend %actor% Чем вы швыряетесь?
  halt
end
if (!%target% || (%target.realroom% != %actor.realroom%))
  osend %actor% Вы не видите цели.
  halt
end
%actor.wait(5)%
oechoaround %actor% &C %actor.name% запустил%actor.g% снежком в %target.vname%!&n
osend %actor% &CВы метко запустили снежком в %target.vname%!&n
osend %target% &C %actor.name% метко запустил в вас снежком! Бррр! Холодно!&n
oecho &CСнежок рассыпался кучей холодных снежинок...&n
opurge %self%
~
#2514
Бросили пентаграмму~
1 h 100
~
wait 1
oload mob 49965
opurge %self%
~
#2515
Блокировка приема предметов, кроме осколков, шаров и гроздей~
0 j 100
~
if ((%object.vnum% != 10670) && (%object.vnum% != 10671) && (%object.vnum% != 10672))
  msend %actor%  Вряд ли ему это нужно...
  return 0
  halt
end
wait 1
*отсеиваем старые ледышки
set i 0
foreach fake %self.objs%
  if (%fake.val0% != 1)
    mpurge %fake%
    eval i %i%+1
  end
done
if (%i% > 0)
  tell .%actor.name% Подделок %i% штук, эхх-ма...
  msend %actor% _Василь иваныч смахнул поддельные ледышки в бадейку.
end
*считаем сданные осколки/сферы/грозди
set debris 0
set sphere 0
set cluster 0
foreach item %self.objs%
  switch %item.vnum%
    case 10670
      eval debris %debris%+1
    break
    case 10671
      eval sphere %sphere%+1
    break
    case 10672
      eval cluster %cluster%+1
    break
  done
done
*удаляем все из ивентаря
mjunk all
*говорим чару сколько чего он сдал
wait 1
mecho %self.name% заскрипел пером по пергаменту.
tell .%actor.name% Итак, в этот раз ты принес%actor.q%:
if (%debris% > 0)
  tell %actor.name% Осколков - %debris% штук.
end
if (%sphere% > 0)
  tell %actor.name% Шаров - %sphere% штук.
end
if (%cluster% > 0)
  tell %actor.name% Гроздей - %cluster% штук.
end
tell %actor.name% Отлично, заходи еще.
*суммируем с числом ранее сданных предметов и записываем
eval debris %debris%+%actor.getquest(2503)%
eval sphere %sphere%+%actor.getquest(2504)%
eval cluster %cluster%+%actor.getquest(2505)%
%actor.setquest(2503 %debris%)%
%actor.setquest(2504 %sphere%)%
%actor.setquest(2505 %cluster%)%
~
#2516
Озвучивание счета~
0 d 1
счет счёт~
wait 1
eval debris %actor.getquest(2503)%
eval sphere %actor.getquest(2504)%
eval cluster %actor.getquest(2505)%
if ((%debris% == 0) && (%sphere% == 0) && (%cluster% == 0))
  say У вас на счету ровным счетом ничего нет...
  halt
end
tell %actor.name% На твоем счету:
if (%debris% != 0) 
  tell %actor.name% Осколков - %debris%.
end
if (%sphere% != 0)
  tell %actor.name% Шаров - %sphere%.
end
if (%cluster% != 0)
  tell %actor.name% Гроздьев - %cluster%.
end
wait 1s
~
#2517
Выдача ледышек обратно по требованию~
0 d 0
дай~
wait 1
extract item 2 %speech%
if (%item% == осколок)
  eval debris %actor.getquest(2503)%
  if (%debris% > 0)
    eval debris %debris%-1
    %actor.setquest(2503 %debris%)%
    mload obj 10670
    calcuid object 10670 obj
    %object.val0(1)%
    %object.owner(%actor.uniq%)%
    give осколок .%actor.name%
  else
    say Извиняйте, на вас ни одного осколочка не записано.
  end
  halt
end
if (%item% == шар)
  eval sphere %actor.getquest(2504)%
  if (%sphere% > 0)
    eval sphere %sphere%-1
    %actor.setquest(2504 %sphere%)%
    mload obj 10671
    calcuid object 10671 obj
    %object.val0(1)%
    %object.owner(%actor.uniq%)%
    give шар .%actor.name%
  else
    say Извиняйте, на вас ни единого шарика не записано.
  end
  halt
end
if (%item% == гроздь)
  eval cluster %actor.getquest(2505)%
  if (%cluster% > 0)
    eval cluster %cluster%-1
    %actor.setquest(2505 %cluster%)%
    mload obj 10672
    calcuid object 10672 obj
    %object.val0(1)%
    %object.owner(%actor.uniq%)%
    give гроздь .%actor.name%
  else
    say Извиняйте, на вас ни одной грозди не записано.
  end
  halt
end
~
#2518
Антуражные сообщения у приемщика льда~
0 b 12
~
wait 1
switch %random.5%
  case 1
    mecho _&WВасиль Иванович усиленно заскрипел пером по пергаменту.&n
  break
  case 2
    mecho _&WВасиль Иванович довольно крякнул, и разгладил усы ногтем большого пальца.&n
  break
  case 3
    mecho _&WВасиль Иванович озабоченно нахмурился и принялся пересыпать ледяные шары, бормоча что-то под нос.&n
  break
  case 4
    mecho _&WВасиль Иванович хмыкнул, покопался под столом, извлек на свет пузатую баклажку и сделал хороший глоток.&n
  break
  case 5
    mecho _&WВасиль Иванович выглянул в окошко, пробормотал "эххх-ма..." и снова уселся за стол.&n
  break
done
~
#2519
Антуражные сообщения у раздатчика призов~
0 b 16
~
wait 1
switch %random.5%
  case 1
    mecho "Три корзна замшевых..," -- пробубнил Иван Васильевич, копаясь в свитках.
  break
  case 2
    mecho _"Три заморския машины бесовския мах.. мыхфо... а пес шелудивый с ними, пусть так будет" -
    mecho _Иван Васильевич черкнул пером по пергаменту.
  break
  case 3
    mecho _Иван Васильевич сделал глоток из кружки и вкусно захрустел огурчиком.
  break
  case 4
    mecho _Иван Васильевич гаркнул: "Васька, остатний раз говорю, в оба гляди! Опять шелудивую ледышку пропустил!
  break
  case 5
    mecho _"И куда этот дьяк подевался..." - пробурчал Иван Васильевич и зашуршал свитками.
  break
done
~
#2520
Выдача призов за лед~
0 d 0
куплю~
wait 1
set clustercost 0
set spherecost 0
set debriscost 0
set item %speech.cdr%
set itamname обруч Теплого Снега
if (%item% == %itamname%)
  set itemvnum 2550
  set debriscost 5
  set spherecost 0
  set clustercost 0
end
set itamname куртка Теплого Снега
if (%item% == %itamname%)
  set itemvnum 2551
  set debriscost 5
  set spherecost 0
  set clustercost 0
end
set itamname сума Теплого Снега
if (%item% == %itamname%)
  set itemvnum 2552
  set debriscost 5
  set spherecost 0
  set clustercost 0
end
set itamname амулет Теплого Снега
if (%item% == %itamname%)
  set itemvnum 2553
  set debriscost 5
  set spherecost 0
  set clustercost 0
end
set itamname оберег сотканный из снега
if (%item% == %itamname%)
  set itemvnum 2554
  set debriscost 5
  set spherecost 0
  set clustercost 0
end
set itamname повязка сотканная из снега
if (%item% == %itamname%)
  set itemvnum 2555
  set debriscost 5
  set spherecost 0
  set clustercost 0
end
set itamname плащ сотканный из снега
if (%item% == %itamname%)
  set itemvnum 2556
  set debriscost 5
  set spherecost 0
  set clustercost 0
end
set itamname посох сотканный из снега
if (%item% == %itamname%)
  set itemvnum 2557
  set debriscost 5
  set spherecost 0
  set clustercost 0
end
set itamname колечко из синего льда
if (%item% == %itamname%)
  set itemvnum 2558
  set debriscost 0
  set spherecost 5
  set clustercost 0
end
set itamname платок из синего льда
if (%item% == %itamname%)
  set itemvnum 2559
  set debriscost 0
  set spherecost 5
  set clustercost 0
end
set itamname сапожки из синего льда
if (%item% == %itamname%)
  set itemvnum 2560
  set debriscost 0
  set spherecost 5
  set clustercost 0
end
set itamname браслеты из синего льда
if (%item% == %itamname%)
  set itemvnum 2561
  set debriscost 0
  set spherecost 5
  set clustercost 0
end
set itamname ошейник зимней вьюги
if (%item% == %itamname%)
  set itemvnum 2562
  set debriscost 0
  set spherecost 5
  set clustercost 0
end
set itamname жезл зимней вьюги
if (%item% == %itamname%)
  set itemvnum 2563
  set debriscost 0
  set spherecost 5
  set clustercost 0
end
set itamname поножи зимней вьюги
if (%item% == %itamname%)
  set itemvnum 2564
  set debriscost 0
  set spherecost 5
  set clustercost 0
end
set itamname перчатки зимней вьюги
if (%item% == %itamname%)
  set itemvnum 2565
  set debriscost 0
  set spherecost 5
  set clustercost 0
end
set itamname наручи зимнего солнца
if (%item% == %itamname%)
  set itemvnum 2566
  set debriscost 0
  set spherecost 0
  set clustercost 5
end
set itamname сапожки зимнего солнца
if (%item% == %itamname%)
  set itemvnum 2567
  set debriscost 0
  set spherecost 0
  set clustercost 5
end
set itamname повязка зимнего солнца
if (%item% == %itamname%)
  set itemvnum 2568
  set debriscost 0
  set spherecost 0
  set clustercost 5
end
set itamname обруч зимнего солнца
if (%item% == %itamname%)
  set itemvnum 2569
  set debriscost 0
  set spherecost 0
  set clustercost 5
end
set itamname амулет Cеверного Сияния
if (%item% == %itamname%)
  set itemvnum 2570
  set debriscost 0
  set spherecost 0
  set clustercost 5
end
set itamname доспех Cеверного Сияния
if (%item% == %itamname%)
  set itemvnum 2571
  set debriscost 0
  set spherecost 0
  set clustercost 5
end
set itamname корона Cеверного Сияния
if (%item% == %itamname%)
  set itemvnum 2572
  set debriscost 0
  set spherecost 0
  set clustercost 5
end
set itamname браслет Cеверного Сияния
if (%item% == %itamname%)
  set itemvnum 2573
  set debriscost 0
  set spherecost 0
  set clustercost 5
end
set itamname маленькая книга
if (%item% == %itamname%)
  set itemvnum 519
  set debriscost 3
  set spherecost 0
  set clustercost 0
end
set itamname книга усыпления
if (%item% == %itamname%)
  set itemvnum 541
  set debriscost 3
  set spherecost 0
  set clustercost 0
end
set itamname трактат о довольстве
if (%item% == %itamname%)
  set itemvnum 415
  set debriscost 3
  set spherecost 0
  set clustercost 0
end
set itamname инкрустированная золотом книга
if (%item% == %itamname%)
  set itemvnum 531
  set debriscost 3
  set spherecost 0
  set clustercost 0
end
set itamname книга освобождения
if (%item% == %itamname%)
  set itemvnum 561
  set debriscost 3
  set spherecost 0
  set clustercost 0
end
set itamname книга света
if (%item% == %itamname%)
  set itemvnum 525
  set debriscost 3
  set spherecost 0
  set clustercost 0
end
set itamname книга тьмы
if (%item% == %itamname%)
  set itemvnum 526
  set debriscost 3
  set spherecost 0
  set clustercost 0
end
set itamname книга странствий
if (%item% == %itamname%)
  set itemvnum 540
  set debriscost 7
  set spherecost 0
  set clustercost 0
end
set itamname слово о чертах и резах
if (%item% == %itamname%)
  set itemvnum 414
  set debriscost 7
  set spherecost 0
  set clustercost 0
end
set itamname книга о высшем Порядке
if (%item% == %itamname%)
  set itemvnum 578
  set debriscost 7
  set spherecost 0
  set clustercost 0
end
set itamname книга с рубином в переплете
if (%item% == %itamname%)
  set itemvnum 529
  set debriscost 7
  set spherecost 0
  set clustercost 0
end
set itamname трактат о свойствах теней
if (%item% == %itamname%)
  set itemvnum 405
  set debriscost 7
  set spherecost 0
  set clustercost 0
end
set itamname книга со словами умерших
if (%item% == %itamname%)
  set itemvnum 534
  set debriscost 0
  set spherecost 1
  set clustercost 0
end
set itamname книга о волшебных свойствах зеркал
if (%item% == %itamname%)
  set itemvnum 417
  set debriscost 0
  set spherecost 0
  set clustercost 1
end
set itamname книга о заповедных дорогах
if (%item% == %itamname%)
  set itemvnum 416
  set debriscost 0
  set spherecost 0
  set clustercost 2
end
set itamname волшебное зеркальце
if (%item% == %itamname%)
  set itemvnum 50024
  set debriscost 0
  set spherecost 2
  set clustercost 0
end
set itamname заговоренный манок
if (%item% == %itamname%)
  set itemvnum 50041
  set debriscost 0
  set spherecost 3
  set clustercost 0
end
wait 1
if ((%debriscost% == 0) && (%spherecost% == 0) && (%clustercost% == 0))
  tell .%actor.name% Нет такого товара в списках, гляди зорче.
  halt
end
eval debris %actor.getquest(2503)%
eval sphere %actor.getquest(2504)%
eval cluster %actor.getquest(2505)%
if ((%debriscost% > %debris%) || (%spherecost% > %sphere%) || (%clustercost% > %cluster%))
  *say ((%debriscost% > %debris%) || (%spherecost% > %sphere%) || (%clustercost% > %cluster%))
  tell .%actor.name% Маловато льда-то у вас на счету... Поболе надоть.
  halt
end
eval debris %debris%-%debriscost%
eval sphere %sphere%-%spherecost%
eval cluster %cluster%-%clustercost%
%actor.setquest(2503 %debris%)%
%actor.setquest(2504 %sphere%)%
%actor.setquest(2505 %cluster%)%
mload obj %itemvnum%
calcuid object %itemvnum% obj
if ((%object.vnum% >= 2500) && %object.vnum% <= 2599))
  %object.owner(%actor.uniq%)%
end
tell .%actor.name% С вашего счета списано:
tell %actor% Вот, извольте.
if (%debriscost% > 0)
  tell %actor.name% Осколков - %debriscost% штук.
end
if (%spherecost% > 0)
  tell %actor.name% Шаров - %spherecost% штук.
end
if (%clustercost% > 0)
  tell %actor.name% Гроздей - %clustercost% штук.
end
give all .%actor.name%
~
#2521
Блокировка забивания инвентаря торговцу~
0 j 100
~
msend %actor% _&RА ежели он вас посохом по лбу?!&n
return 0
halt
~
#2522
Раскладной чармис - снежный вихрь~
1 c 2
встряхнуть~
wait 1
if !%arg.contains(шар)%
  osend %actor% Что вы хотите встряхнуть?
  halt
end
oechoaround %actor.name% встряхнуд%actor.g% стеклянный шар, и вокруг закружился снежный вихрь!
osend %actor% Вы встряхнули стеклянный шар и вокруг закружился снежный вихрь!
set charmis %self.val0%
if ((%self.val0% == 0) || !%charmis.vnum%))
  wait 1s
  oecho Вихрь быстро кружась сжался в смерч.
  wait 1s
  oecho Снежный вихрь повис перед вами, и в нем медленно появались пара светящихся глаз.
  oechoaround %actor% Снежный вихрь повис перед %actor.vname%
  oload mob 2510
  calcuid tornado 2510 mob
  oforce %tornado% г Не работает насяльника
  %self.val0(%tornado.id%)%
  halt
end
set charmis %self.val0%
if ((%charmis.realroom% == %charmis.realroom%) && !%charmis.leader%)
  wait 1s
  oecho Снежный вихрь бешенно закружился, и рассыпался в воздухе.
  wait 1
  opurge %charmis%
  halt
end
if ((%charmis.realroom% == %actor.realroom%) && (%charmis.leader% == %actor%))
  wait 1s
  oechoaround %actor% Снежный вихрь кружится вокруг %actor.vname%
  oecho Снежный вихрь закружился вокруг вас.
  halt
end
if ((%charmis.realroom% == %actor.realroom%) && (%charmis.leader% != %actor%))
  wait 1s
  oecho Снежный вихрь с гулом зккружился на месте.
  oforce %charmis% follow я
  wait 3
  oechoaround %actor% Снежный вихрь подлетел ближе к %actor.dname%
  oecho Снежный вихрь подлетел поближе к вам.
  halt
end
if (%charmis.realroom% != %actor.realroom%)
  wait 1s
  oechoaround %charmis% Снежный вихрь вдруг взвился и растаял в воздухе.
  oecho Снежный вихрб со свистом причался откуда-то, и подлетел к вам.
  oteleport %charmis% %actor.realroom%
end
~
#2523
Снятие персональности с предметов~
0 j 100
~
if ((%object.vnum% < 2550) || (%object.vnum% > 2573))
  msend %actor% Вы поглядели на суетящихся вокруг мускулистых корабелов и раздумали мошенничать.
  return 0
  halt
end
wait 1
миг .%actor.name%
set objname %object.name%
set objname %objname.car%
if %object.owner%
  mecho Белобородый купчина осмотрел диковину и ловко оторвал приклееный в потайном месте ярлычок.
  %object.owner(0)%
else
  mecho Белобородый купчина сноровисто наклеил неболшой ярлычок в потайном месте диковинки.
  %object.owner(%actor.uniq%)%
end
say Носи на здоровье!
give %objname% .%actor.name%
~
$~
