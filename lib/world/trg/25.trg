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
1 c 3
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
$~
