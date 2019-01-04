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
$~
