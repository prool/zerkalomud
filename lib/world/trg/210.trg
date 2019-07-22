#21000
Вход на арену~
2 e 100
~
wait 2
wsend %actor.name% Вы оказались на ристалище! 
wsend %actor.name% Вот где можно показать свою силушку богатырскую
wsend %actor.name% И испробовать магию, людям обычным недоступную. 
~
#21001
Десятник орет~
0 r 100
~
wait 1
указ %actor.name%
say  Смерть идет!  
wait 1
паник
~
#21002
Выход с арены~
2 c 100
выйти~
wait 1
wechoaround %actor% %actor.name% ушел на юг.
wsend %actor.name% &WВас выпустили с ристалища.&n
wsend %actor.name% &WВы пошли на юг.&n
wteleport %actor% 21006
wechoaround %actor% %actor.name% пришел с севера.
~
#21003
боязнь~
0 r 100
~
wait 1
дрож
say не бейте меня! У меня ничего нету!
~
#21004
хозяин погреба~
0 r 100
~
wait 1
ухм %actor.name%
say Попробуй мое адское зелье, злой колдун говорит что после него ты станешь злее!
хих
~
#21005
получить кость~
0 m 10
~
wait 1
if %world.curobjs(21035)% > 500
  say Кости кончились - переходим на зубы.
  halt
end
say Возьми кость.
say %actor.name%, не забывай, что при помощи нее ты сможешь приманить своего питомца.
mload obj 21035
дат кост %actor.name%    
~
#21006
манить пса~
1 c 2
манить~
wait 1
if (%actor.clan%==вс)
  oechoaround %actor% %actor.name% начал%actor.g% манить костью.
  oechoaround %actor% На зов из под земли появився костяной пес.
  osend %actor% Вы начали манить костью животное.
  oload mob 21015
  oforce %actor% оседлать пес
  wait 1
  opurge %self%
else
  oechoaround %actor% %actor.name% попытал%actor.u% приманить кого-то, но никто не появився.
  osend %actor% Вы попытались приманить кого-то, но ничего не вышло.
end
~
#21007
прогнать пса~
0 c 1
прогнать~
wait 1
if (( %actor.clan% == вс ) && (%self.leader% ==  %actor%))
  mechoaround %actor% %actor.name% прогнал%actor.g% пса.
  mechoaround %actor% Пес закопался в землю.
  msend %actor% Вы прогнали пса.
  msend %actor% Убегая, пес отдал Вам кость.
  mload obj 21035
  дать кост %actor.name% 
  wait 1
  mpurge %self%
else
  mechoaround %actor% %actor.name% попытал%actor.u% прогнать пса, но он остався на месте.
  msend %actor% Вы попытались прогнать пса, но он остався на месте.
end
~
#21008
Скелет угарает~
0 s 30
~
wait 1  
switch  %random.10%
  case 10
    say Бугага!
  break
  case 9
    say Всэх зарэжу!
    хих
  break
  case 8
    say Я злой и страшный серый волк! Я в поросятах знаю толк!
    ухмыл
  break
  case 7
    say Ща как дам шалыгой по башке!
    mecho Скелет взял шалыгу в обе руки.
    wait 1
    mecho &yСкелет не смог причинить Вам вред&n.
    wait 1
    буб
    wait 1
    mecho Скелет прекратил использовать шалыгу.
    wait 1
    say ну ничего! подрасту - стану большим костяным драконом - вот тогда и посмотрим!
  break
  case 6
    say Эх! Кэлоса бы Вам в дружину, вот тогда бы вы бы и порулили! А так вата-ватой!
    взд
  break
  case 5
    say Никто мои ладанки с горстью русской земли не видел ? Потерял тут где-то недавно...
    вопр
    wait 1
    say Если кто найдет - сразу мне давайте ее!
  break
  case 4
    say Подамагаю! Куплю стаф! Сниму стаф! Отдам стаф! Обменяю стаф! Дорого!
  break
  case 3
    say Возмите меня в ПК! Я больше тупить не буду!
    wait 1
    взд
    wait 1
    say Ну не хотите - как хотите! Такого овера теряете!
  break
  case 2
    say Никому не приношу никаких извенений! Обещаю агрить на всех при первой возможности!
    хих
  break
  case 1
    say Дай сет-стаф! Ну дай сет-стаф!
    mecho Скелет оглядел Вас с головы до пят.
    морщ
    say Ты бы хоть клан-стаф одел что ли.
    хих
  done
  
~
#21009
скелет осматривает~
0 r 60
~
wait 1
mecho Скелет оглядел Вас с головы до пят.
хих
wait 1
say ну ты овер просто!
хих
~
#21010
взяли шмот~
1 g 100
~
halt
*триг выключен за (временной) ненадобностью
wait 1
if %actor.clan% == вс || %actor.clan% == рсп || %actor.clan% == вд 
  halt
end
osend %actor% %self.iname% рассыпал%self.u% в ваших руках.
wait 1
opurge %self%
~
#21011
проход в канализацию~
2 c 1
спуститься лезть~
if !%arg.contains(вниз)%
  wsend       %actor% Куда это Вы хотите спуститься???
  return 0
  halt
end
wsend       %actor% Вы начали спускаться вниз по лестнице в куда-то вниз.
wechoaround %actor% %actor.name% полез%actor.q% вниз, держась за лестницу.
wait 1s
wsend %actor% .- Вы спустились в канализацию.
wteleport %actor% 21035
%actor.wait(1)%
wechoaround %actor% %actor.name% спрыгнул%actor.q% сюда сверху.
~
#21012
триг цербера~
0 r 100
~
wait 1  
рыч %actor.name%
mechoaround Злой цербер оскалил свои &Rкровавые&n клыки.
~
#21013
закопаться~
2 c 0
закопаться земля~
* закопаться | Rooms | Command | 0 | закопаться земля
wait 1
if (!%arg.contains(земля)%)
  wsend %actor% Куда это вы хотите закопаться?
  return 0
  halt
end
if ((!%actor.fighting%) && ((%actor.clan% == вс) || (%actor.clan% == сп) || (%actor.clan% == тдн) || (%actor.level% > 30)))
  if (!%actor.rentable%)
    wsend %actor% Вы закопались под землю.
    wechoaround %actor% %actor.iname% начал%actor.g% активно копать и вскоре скрыл%actor.u% под землей.
    switch %random.5%
      case 5
        wteleport %actor% 21046
      break
      case 4
        wteleport %actor% 21060
      break
      case 3
        wteleport %actor% 21069
      break
      case 2
        wteleport %actor% 21038
      break
      case 1
        wteleport %actor% 21059
      break
    done
    wechoaround %actor% %actor.iname% выкопал%actor.u% откуда-то снизу.
    halt
  else
    wteleport %actor% 21017
    wechoaround %actor% %actor.iname% выкопал%actor.u% откуда-то снизу.
  end
else
  return 0
  halt
end
~
#21014
орет большой дозорный~
0 r 100
~
if %actor.clan% == вс
  wait 3
  mecho Большой Дозорный Скелет подтянувся и встал в стойку &K"Смирно"&n.
else
  крич Легион Смерти все к оружию, %actor.iname% рядом!!!
end
~
#21015
Запутывание в лабиринте~
2 c 1
при приг пригл пригля пригляд пригляде приглядет приглядеть приглядетьс приглядеться приглядеться!~
wait 1
wsend %actor% Вы посмотрели по сторонам.
wsend %actor% &yСевер:&n Лабиринт
wsend %actor% &yВосток:&n Лабиринт
wsend %actor% &yЮг:&n Лабиринт
wsend %actor% &yЗапад:&n Лабиринт
wsend %actor% &yВерх:&n Лабиринт
wsend %actor% &yНиз:&n Лабиринт
~
#21016
доложись~
0 q 100
~
wait 1
if (%actor.clan% != вс )
  halt
end
if %actor.level% < 24
  halt
end
if (%actor.vname% == %char1%) || (%actor.vname% == %char2%) || (%actor.vname% == %char3%) || (%actor.vname% == %char4%) || (%
  actor.vname% == %char5%) || (%actor.vname% == %char6%) || (%actor.vname% == %char7%) || (%actor.vname% == %char8%) || (%
  actor.vname% == %char9%) || (%actor.vname% == %char10%) || (%actor.vname% == %char11%) || (%actor.vname% == %char12%) |   
  halt
end
eval num %num%+1
global num
switch %num%
  case 1
    eval char1 %actor.vname%
    global char1
  break
  case 2
    eval char2 %actor.vname%
    global char2
  break
  case 3
    eval char3 %actor.vname%
    global char3
  break
  case 4
    eval char4 %actor.vname%
    global char4
  break
  case 5
    eval char5 %actor.vname%
    global char5
  break
  case 6
    eval char6 %actor.vname%
    global char6
  break
  case 7
    eval char7 %actor.vname%
    global char7
  break
  case 8
    eval char8 %actor.vname%
    global char8
  break
  case 9
    eval char9 %actor.vname%
    global char9
  break
  case 10
    eval char10 %actor.vname%
    global char10
  break
  case 11
    eval char11 %actor.vname%
    global char11
  break
  default
    eval char12 %actor.vname%
    global char12
    eval num 0
    global num
  done
~
#21017
орет средний~
0 r 100
~
if %actor.clan% == вс
  wait 3
  mecho Средний Дозорный Скелет подтянувся и встал в стойку &K"Смирно"&n.
else
  крич %actor.iname% рядом!!!
end
~
#21018
дернуть веревку~
2 c 0
дернуть веревка~
wait 1
if (%actor.vnum% != -1)
  return 0
  halt
end
if !%arg.contains(веревка)% 
  wsend %actor%  Что вы хотите дернуть?
  return 0
  halt
end
wsend %actor%  Вы дернули за веревку.
wechoaround %actor.name%  %actor.name% дернул%actor.g% веревку.
wechoaround  Что-то стукнуло глухо.
wdoor 21063 w room 21064
wdoor 21063 e room 21046
wait 10s
wechoaround  Раздался звонкий стук.
wdoor 21063 w purge
wdoor 21063 e purge
~
#21019
!христы~
0 r 100
~
wait 1
if (%actor.religion% == 1)
  say выйди отсюда христианское отродие
else
  улыб
  say &rалтарь ждет &n.
end
~
#21020
запутывание в лабиринте2~
2 c 1
присл прислу прислуш прислуша прислушат прислушать прислушатьс прислушаться прислушаться!~
wsend %actor% Вы начали сосредоточенно прислушиваться.
wsend %actor% &yСевер:&n
wsend %actor% &g Тишина и покой.&n
wsend %actor% &yВосток:&n
wsend %actor% &g Тишина и покой.&n
wsend %actor% &yЮг:&n
wsend %actor% &g Тишина и покой.&n
wsend %actor% &yЗапад:&n
wsend %actor% &g Тишина и покой.&n
wsend %actor% &yВерх:&n
wsend %actor% &g Тишина и покой.&n
wsend %actor% &yНиз:&n
wsend %actor% &g Тишина и покой.&n
~
#21021
напоминание о ловушке~
2 e 100
~
wait 1
if %actor.clan% == вс
  wait 3
  wsend %actor% Вы знали о камне и ловко перепрыгнули через него.
  halt
else
  wait 3
  wsend %actor% Вы споткнулись о камень и упали.
  wsend %actor% Вам захотелось его пнуть.
  %actor.position(6)%
  %actor.wait(5)%
end
~
#21022
ловушка~
2 e 100
~
wait 1
%actor.wait(5)%
wecho  Как только вы вошли в комнату сверху на Вас упали камни.
wecho  Вы попытались увернуться...
wecho  &RНо камни ударили по Вам!&n
foreach victim %self.all%
  wdamage %victim% 200
done                                        
~
#21023
снимание трига~
2 c 0
поднять~
wait 1
if (%actor.vnum% != -1)
  return 0
  halt
end
if !%arg.contains(камень)% 
  wsend %actor% 
  return 0
  halt
end
wsend %actor%  Вы аккуратно наступили на камень.
wechoaround  %actor.name% аккуратно наступил%actor.g% на камень.
wechoaround  Раздался чуть слышный щелчок, но ничего не произошло.
wait 1
exec 21024 %world.room(21040)%
end
~
#21024
перезарядка ловушки~
2 z 100
~
calcuid lov 21042 room
detach 21022 %lov.id%
wait 5s
attach 21022 %lov.id%
~
#21025
пнуть камень~
2 c 0
пнуть камень~
if (%actor.vnum% != -1)
  return 0
  halt
end
if !%arg.contains(камень)% 
  wsend %actor%  Чаво?
  return 0
  halt
end
wsend %actor%  Вы со всей силы пнули камень.
wechoaround %actor.name% со всей силой пнул%actor.g% камень.
wecho Камень улетел на Восток.
wecho Кровушка стынет в жилах от чьего-то предсмертного крика.
~
#21026
пнуть камень2~
2 c 0
пнуть камень~
if (%actor.vnum% != -1)
  return 0
  halt
end
if !%arg.contains(камень)% 
  wsend %actor%  Чаво?
  return 0
  halt
end
wsend %actor%  Вы со всей силы пнули камень.
wechoaround %actor.name% со всей силой пнул%actor.g% камень.
wecho Камень улетел на Юг.
wecho Вы ничего не услышали.
~
#21027
падение в яму~
2 e 100
~
wait 1
%actor.wait(3s)%
wechoaround %actor.name% оступился и с криком ужаса провалил%actor.u% вниз.
wsend %actor% Вдруг вы оступились и с криком ужаса полетели вниз.
wsend %actor% &RВы БОЛЬНО ударились головой.&n
wsend %actor% В глазах у Вас померкло.
wsend %actor% Вы очнулись. 
wteleport %actor% 21068
eval dam124 %actor.hitp%/2
wait 1
wdamage %actor% %dam124%
wechoaround %actor.name% с криками упал%actor.u% сверху.
~
#21028
снятие ловушки2~
2 c 1
надавить~
wait 1
if (%actor.vnum% != -1)
  return 0
  halt
end
if !%arg.contains(камень)% 
  wsend %actor%  Чаво?
  return 0
  halt
end
wsend %actor%  Вы аккуратно отодвинули камень.
wechoaround %actor.name% аккуратно отодвинул%actor.g% камень.
wechoaround  Раздался чуть слышный щелчок, но ничего не произошло.
exec 21029 %world.room(21049)%
end
~
#21029
перезарядка ловушки2~
2 z 100
~
calcuid lov2 21063 room
detach 21027 %lov2.id%
wait 4s
attach 21027 %lov2.id%
~
#21030
нельзя бросать в лабиринте~
2 c 1
бр бро брос броси бросит бросить бросить! dro drop drop!~
wsend %actor% Вы захотели бросить что-то, но Вам не захотелось с этим расставаться.
~
#21031
нельзя давать в лабиринте~
2 c 1
д да дат дать дать! gi giv give give!~
wsend %actor% Вы попробовали дать что-то, но Вам не захотелось с этим расставаться
~
#21032
запутывание в лабиринте3~
2 c 1
ог огл огля огляд огляде оглядет оглядеть оглядетьс оглядеться оглядеться! см смо смот смотр смотре смотрет смотреть смотреть!~
wsend %actor% Вы посмотрели по сторонам.
wsend %actor% &yСевер:&n Лабиринт
wsend %actor% &yВосток:&n Лабиринт
wsend %actor% &yЮг:&n Лабиринт
wsend %actor% &yЗапад:&n Лабиринт
wsend %actor% &yВерх:&n Лабиринт
wsend %actor% &yНиз:&n Лабиринт
~
#21033
запутывание в лабиринте 4~
2 c 1
sc sca scan scan!~
wsend %actor% Вы посмотрели по сторонам.
wsend %actor% &yСевер:&n Лабиринт
wsend %actor% &yВосток:&n Лабиринт
wsend %actor% &yЮг:&n Лабиринт
wsend %actor% &yЗапад:&n Лабиринт
wsend %actor% &yВерх:&n Лабиринт
wsend %actor% &yНиз:&n Лабиринт
~
#21034
Запутывание в лабиринте5~
2 c 1
най найт найти найти! sens sense sense!~
wsend %actor% Ваши чувства молчат.
~
#21035
катапульта мочит~
2 z 100
~
foreach victim2 %self.all%
  wdamage %victim2% 200
  wecho &R Груда камней облитых полыхающей горючей смесью обрушились на Вас со стороны замка
  wasound &Y Что-то сильно громыхнуло рядом! &n
done
~
#21036
баллиста мочит~
2 z 100
~
set victim %random.pc%
if %victim%
  wdamage %victim% 200
  wecho  &r_Огромная стрела с острым стальным наконечником прилетела со стороны замка!&n
  wasound &R Вы услышали глухой удар и крик боли! &n
end
~
#21037
запуск катапульты~
2 c 1
выстрелить~
eval drct %arg.car%
switch %drct%
  case север
    wsend %actor% _Вы освободили рычаг катапульты.
    wechoaround %actor% _~~%actor.name% высвободил%actor.g% рычаг катапульты.
    wecho Рычаг резко прыгнул вверх и со страшным грохотом врезался в поперечную балку.
    wecho Заряд взмыл по крутой дуге и резко пошел вниз.
    exec 21035 %world.room(21048)%
  break
  case восток
    wsend %actor% _Вы освободили рычаг катапульты.
    wechoaround %actor% _~~%actor.name% высвободил%actor.g% рычаг катапульты.
    wecho Рычаг резко прыгнул вверх и со страшным грохотом врезался в поперечную балку.
    wecho Заряд взмыл по крутой дуге и резко пошел вниз.
    exec 21035 %world.room(21040)%
  break
  case запад
    wsend %actor% _Вы освободили рычаг катапульты.
    wechoaround %actor% _~~%actor.name% высвободил%actor.g% рычаг катапульты.
    wecho Рычаг резко прыгнул вверх и со страшным грохотом врезался в поперечную балку.
    wecho Заряд взмыл по крутой дуге и резко пошел вниз.
    exec 21035 %world.room(21076)%
  break
  case вниз
    wsend %actor% _Вы освободили рычаг катапульты.
    wechoaround %actor% _~~%actor.name% высвободил%actor.g% рычаг катапульты.
    wecho Рычаг резко прыгнул вверх и со страшным грохотом врезался в поперечную балку.
    wecho Заряд взмыл по крутой дуге и резко пошел вниз.
    exec 21035 %world.room(21033)%
  break
  case вверх
    wsend %actor% _Вы освободили рычаг катапульты.
    wechoaround %actor% _~~%actor.name% высвободил%actor.g% рычаг катапульты.
    wecho Рычаг резко прыгнул вверх и со страшным грохотом врезался в поперечную балку.
    wecho Заряд взмыл по крутой дуге и резко пошел вниз.
    exec 21035 %world.room(21052)%
  break
  default
    wsend %actor% Куда-куда?
  done
  wait 6s
~
#21038
запуск самострела~
2 c 1
целиться~
eval drct %arg.car%
switch %drct%
  case север
    wsend %actor% _Вы освободили держатель самострела.
    wechoaround %actor% _~~%actor.name% освободил%actor.g% держатель самострела.
    wecho Толстая тетива низко ухнула и вытолкнула стрелу.
    wecho Стрела устремилась к воротам замка.
    exec 21036 %world.room(21048)%
  break
  case восток
    wsend %actor% _Вы освободили держатель самострела.
    wechoaround %actor% _~~%actor.name% освободил%actor.g% держатель самострела.
    wecho Толстая тетива низко ухнула и вытолкнула стрелу.
    wecho Стрела устремилась к воротам замка.
    exec 21036 %world.room(21066)%
  break
  case запад
    wsend %actor% _Вы освободили держатель самострела.
    wechoaround %actor% _~~%actor.name% освободил%actor.g% держатель самострела.
    wecho Толстая тетива низко ухнула и вытолкнула стрелу.
    wecho Стрела устремилась к воротам замка.
    exec 21036 %world.room(21069)%
  break
  case вниз
    wsend %actor% _Вы освободили держатель самострела.
    wechoaround %actor% _~~%actor.name% освободил%actor.g% держатель самострела.
    wecho Толстая тетива низко ухнула и вытолкнула стрелу.
    wecho Стрела устремилась к воротам замка.
    exec 21036 %world.room(21033)%
  break
  case вверх
    wsend %actor% _Вы освободили держатель самострела.
    wechoaround %actor% _~~%actor.name% освободил%actor.g% держатель самострела.
    wecho Толстая тетива низко ухнула и вытолкнула стрелу.
    wecho Стрела устремилась к воротам замка.
    exec 21036 %world.room(21052)%
  break
  default
    wsend %actor% Куда-куда?
  done
  wait 4s
~
#21039
смотрят из замка~
2 c 1
север~
calcuid troom 21048 room
wecho Вы посмотрели на север:
foreach char %troom.all%
  if %char%
    wecho Вы увидели %char.vname%
  else
  break
end
done
~
#21040
смотрят из замка~
2 c 1
восток~
calcuid troom 21040 room
wecho Вы посмотрели на восток:
foreach char %troom.all%
  if %char%
    wecho Вы увидели %char.vname%
  else
  break
end
done
~
#21041
смотрят из замка~
2 c 1
запад~
calcuid troom 21076 room
wecho Вы посмотрели на запад:
foreach char %troom.all%
  if %char%
    wecho Вы увидели %char.vname%
  else
  break
end
done
~
#21042
смотрят из замка~
2 c 1
вниз~
calcuid troom 21033 room
wecho Вы посмотрели вниз:
foreach char %troom.all%
  if %char%
    wecho Вы увидели %char.vname%
  else
  break
end
done
~
#21043
смотрят из замка~
2 c 1
вверх~
calcuid troom 21052 room
wecho Вы посмотрели на вверх:
foreach char %troom.all%
  if %char%
    wecho Вы увидели %char.vname%
  else
  break
end
done
~
#21044
вход на арену~
2 cz 1
арена~
wait 1
wechoaround %actor% %actor.name% ушел на арену.
wsend %actor.name% &WВы пошли на арену.&n
wteleport %actor% 21004
wechoaround %actor% %actor.name% пришел с юга.
~
#21045
скелет угорает~
0 c 1
iGyvgsifbusfgousv~
say Пнх
~
#21046
вход на арену2~
1 c 1
итем~
osend %actor% А по мозгам хошь? Ну считай уже получил.
log &G%actor.name%  - ЧИТИТ с тригом на определение ЧИСЛА ПРЕДМЕТОВ В МИРЕ!!!&n
~
#21047
пурж шмоток~
2 z 0
~
wait 1
%purge%
wait 1
wecho Комната осветилась ярким пламенем и смела все на своем пути.
~
#21048
пурж2~
2 cz 0
убрать~
wait 1s
%echo% Неизвестно откуда взявшаяся волна, смела все на своем пути!
%purge%
~
#21049
Мелкий дозорный орет~
0 r 100
~
if %direction% == west  
  if %actor.clan% == вс
    wait 3
    mecho Мелкий Дозорный Скелет подтянулся и встал в стойку "Смирно".
  else
    крич %actor.iname% совсем рядом!
  end
end
~
#21050
вихрь фсасывает~
0 bj 100
~
wait 1
set items %self.objs%
set item %items.car%
if %item%
  mecho Черная воронка с громким хлюпаньем всосала %item.vname%.
  wait 1
  mpurge %item%
end
~
#21051
тьму офф с ренты!~
0 b 20
~
foreach victim %self.pc%
  if %victim.affect(затемнение)%
    wait 10s
    say %victim.name%, опять, троллья морда, ты на ренте с тьмой тусишь.
    mechoaround %victim.name% Мертвяк мощным пинком отправил %victim.vname% к Церберу на перевоспитание.
    msend %victim.name% После болезненного пинка мертвяка вы очутились перед носом Цербера.
    msend %victim.name% Мда, пожалуй не стоит на ренте стоять в тьме, - решили вы, потирая попу.
    mforce %victim% wake
    mforce %victim% stand
    mforce %victim% север
    mforce %victim% север
    mforce %victim% север
  end
done
~
#21052
тестовый триг для левой зоны. спасибо за рекламное место!~
2 g 100
~
wait 1s
%echo% Вы оказались в яме. Глубокой.
%echo% И стоите прямо на дровах.
wait 2s
%echo% Волхв закричал : 'да хранят вас Боги!'
wait 1s
%echo% Сам волхв, конечно, стоял над ямой и производил какие-то приготовления.
wait 3s
%echo% Невысокий, как ранняя весення трава, &Yогонь&n покрыл всю поверхность ямы.  
%echo% &RОсторожно, легко огонь лизнул ваши ноги.&n
wdamage %actor% 50
wait 10s
%echo% &RОгонь разгорается все жарче, жжет кожу, одежда начинает тлеть!&n
wdamage %actor% 150
~
#21053
Головы коня, рандом фразы~
2 b 20
~
switch %random.20%
  case 1
    wecho Глупая голова сказала : 'ни один клан ни получит виры'
    wait 1
    wecho Глупая голова сказала : 'с вз'
    wait 2
    wecho Глупая голова сказала : 'максимум обещания не агрить )'
    wait 1
    wecho &KУмная голова зашлась в приступе кашля.&n
    wait 1
    wecho Умная голова сказала : 'и сколько ты заплатил в итоге?'
    wait 2 
    wecho Глупая голова сказала : 'да какие то 2 башки'
  break
  case 2
    wecho Глупая голова сказала : 'мастер тактики это да пожалуй я)'
    wait 1
    wecho &KУмная голова подавилась от смеха.&n
  break
  case 3
    wecho Глупая голова сказала : 'лан свалил на обкурку )'
    wait 3
    wecho Глупая голова сказала : 'блин, я так обкурился что мне кажеца осталась одна голова!'
    wait 1
    wecho &KУмная голова осмотрела глупую.&n
    wait 1
    wecho Умная голова сказала : 'тебе не кажется'
  break
  case 4
    wecho Глупая голова сказала : 'слышь слышь'
    wait 2
    wecho &KУмная голова вопросительно посмотрела на глупую.&n
    wait 2
    wecho Глупая голова сказала : 'мне седня сон'
    wait 1 
    wecho Глупая голова сказала : 'снился'
    wait 2
    wecho Глупая голова сказала : 'адский'
    wait 2
    wecho Глупая голова сказала : 'про бабку'
    wait 1
    wecho Глупая голова сказала : 'и добермана'
    wait 1
    wecho Глупая голова сказала : 'огромного злого добермана'
    wait 2
    wecho Глупая голова сказала : 'типа бабуля на меня его натравила'
    wait 1
    wecho Глупая голова сказала : 'я через забор от него'
    wait 1
    wecho Глупая голова сказала : 'он короче перепргынул и жрать меня скотина начал))'
    wait 2
    wecho Умная голова сказала : 'это же сон'
    wait 2
    wecho Глупая голова сказала : 'но ваще реально страшно было'
  break
  case 5
    wecho Глупая голова сказала : 'я философию на 3 сдал)'
    wait 2
    wecho Глупая голова сказала : 'самому профессору рябову )'
    wait 2
    wecho Глупая голова сказала : 'он мне даже глубоко философскую фраза написал'
    wait 1
    wecho Глупая голова сказала : 'типа в надежде на развитие'
    wait 1
    wecho Глупая голова сказала : 'и поставил 3'
    wait 2
    wecho Умная голова сказала : 'оправдаются ли его надежды?..:('
  break
  case 6
    wecho Глупая голова сказала : 'АААаааааааааааааа!'
    wait 2
    wecho &KУмная голова вздрогнула.&n
    wecho Глупая голова сказала : 'Уроды!'
    wait 1
    wecho Глупая голова сказала : 'Мразюки!'
    wait 1
    wecho Глупая голова сказала : 'Ублюдки!'
    wait 1
    wecho Глупая голова сказала : 'Крысы!'
    wait 1
    wecho &KУмная голова в ужасе отпрянула от глупой.&n
    wait 1
    wecho Умная голова сказала : 'Чего орешь? Опять сон про добермана приснился?
    wait 2
    wecho Глупая голова сказала : 'Нет. Вспоминаю как меня убивали'
  break
  case 7
    wecho Глупая голова сказала : 'а если ты такая умная то где ты раньше была?'
    wait 1
    wecho Умная голова сказала : 'предвидела вот все это и не ввязывалась. А ты где был?'
    wait 1
    wecho Глупая голова сказала : 'пиво пил, дурь дул'
    wait 1
    wecho Умная голова сказала : 'ну и довело до добра?'
    wait 1
    wecho &KГлупая голова гневно зыркнула на умную и отвернулась.&n
    wait 2
    wecho Глупая голова сказала : 'ладно с чертями говорить самому запачкаться можно)'
  break
  case 8
    wecho Глупая голова сказала : 'давай может так как нить решим'
    wait 1
    wecho Глупая голова сказала : 'ты чо такой мудак'
    wait 2
    wecho Глупая голова сказала : 'вот нафиг тебе делет витязя моего?'
    wait 2
    wecho Глупая голова сказала : 'от тебя чо убудет?'
    wait 3
    wecho Глупая голова сказала : 'ну давай вирой )'
    wait 1
    wecho Глупая голова сказала : 'ну отпиши меня'
    wait 1
    wecho Глупая голова сказала : 'нуууууу отпиииишиииииииииииииии )'
    wait 3
    wecho Глупая голова сказала : 'токо не на делит)'
    wait 1
    wecho Умная голова сказала : 'чо это за чушканскимй базар?'
    wait 1
    wecho Глупая голова сказала : 'да вот вспоминаю как речь тренировал чтобы отписаться'
    wait 1
    wecho Умная голова сказала : 'ну и что помогло ?'
    wait 1
    wecho Глупая голова сказала : 'конечно, теперь мы свободны'
    wait 1
    wecho &KУмная голова осмотрела глупую.&n
    wait 1
    wecho Умная голова сказала : 'И по твоему  - это свобода?'
    wait 1
    wecho &KУмная голова разрыдалась.&n
  break
  case 9
    wecho &YГлупая голова заметила : 'куплю нарядную корону'&n
    wait 1
    wecho &YГлупая голова заметила : 'у царя должна быть корона!'&n
    wait 1
    wecho &KУмная голова достала шапку шута из за пазухи и повертела в руках.&n
    wait 1
    wecho &KУмная голова дала шапку глупой.&n
    wait 1
    wecho Умная голова сказала : 'твой размер'
  break
  case 10
    wecho Глупая голова сказала : 'я кстатии понял как из вашего гребаного замка выбираться)'
    wait 1
    wecho Глупая голова сказала : 'Но без ног не могу :('
  break
  case 11
    wecho Глупая голова сказала : 'бойтесь папа вышел на охоту)'
    wait 2
    wecho Умная голова сказала : 'а ты такая ганста)'
    wait 1
    wecho Глупая голова сказала : 'замолчи а'
    wait 1
    wecho Умная голова сказала : 'над тобой стебаться прикольно)))'
  break
  case 12
    wecho Глупая голова сказала : 'я и так понял что я был не прав раз виру предлагаю так?)'
    wait 2
    wecho Глупая голова сказала : 'слух авай мирится а?'
    wait 2
    wecho Глупая голова сказала : 'ты меня игнорируеш или внатуре все время афк?'
    wait 1
    wecho Глупая голова сказала : 'аааааааа??? '
    wait 1
    wecho Глупая голова сказала : 'ауууууууу'
    wait 2
    wecho Глупая голова сказала : 'друг скажи чо нить уже )))'
  break
  case 13
    wecho Глупая голова сказала : 'тыж понимаеш что вернутся казаки и все поменяется?'
    wait 1
    wecho Глупая голова сказала : 'а вы без нво, рсп, много сможете?'
    wait 2
    wecho Умная голова сказала : 'ты сам в это веришь?'
  break
  case 14
    wecho Глупая голова сказала : 'раньше я бы наверно не чо не платил а для себя виры требывал)))'
    wait 2
    wecho Умная голова сказала : 'но жизнь она такая)))'
    wait 1
    wecho Умная голова сказала : 'никогда не знаеш что будет завтра'
  break
  case 15
    wecho Глупая голова сказала : 'чо есть желающие 1 на 1 ?:))'
  break
  case 16
    wecho &KГлупая голова затянулась самокруткой.&n
  break
  case 17
    wecho Умная голова сказала : 'если уважать не будут'
    wait 1
    wecho Умная голова сказала : 'это фигово очень)'
    wait 2
    wecho Глупая голова сказала : ' жить то можно'
  break
  case 18
    wecho Умная голова сказала : 'давай жить дружно леопольд!'
  break
  case 19
    wecho Глупая голова сказала : 'чо война окончена7??'
    wait 1
    wecho Глупая голова сказала : 'я был последним жмуром войны?:)'
  break
  case 20
    wecho Глупая голова сказала : 'отпиши меня и все'потом придумаеш, если чо назад припишешь.'
    wait 1
    wecho Глупая голова сказала : 'ну отпиши меня'
    wait 1
    wecho Глупая голова сказала : 'нуууууу отпиииишиииииииииииииии )'
  break
done
~
#21054
Головы коня, кто-то вошел~
2 eg 30
~
wait 1
if (%actor.affect(подкрадывается)% == 1) || (%actor.affect(маскировка)% == 1)
  switch %random.2%
    case 1
      wecho Глупая голова сказала : 'мразюка, ты тут?)'
      wait 1
      wecho &KГлупая голова хитро прищурилась, поглядывая по сторонам.&n
    break
    case 2
      wecho Глупая голова сказала : 'мы тебя вычислим ) и искореним )'
      wait 1
      wecho &KГлупая голова грозно нахмурилась.&n
    break
  done
  halt
end
if (%actor.clan% != вс)
  switch %random.9%
    case 1
      wechoaround %actor% Глупая голова осмотрела %actor.vname%.
      %send% %actor% &WГлупая голова осмотрела Вас.&n
      wait 1
      wecho Глупая голова сказала : 'как оденешься  я тебя у...убью))'
    break
    case 2
      wecho Глупая голова сказала : 'слышь ты че тут делаешь ! это частная территория'
      wait 1
      wecho Умная голова сказала : 'просто пасажир ваще попутался'
    break
    case 3
      wecho Глупая голова сказала : 'ты куда лезиш то малыш)'
    break
    case 4
      wecho Глупая голова сказала : 'курнем?'
    break
    case 5
      wecho Глупая голова сказала : 'чепушила ты чо???'
    break
    case 6
      wecho Глупая голова сказала : 'мразюка и чепушила)))'
    break
    case 7
      wecho &WГлупая голова игриво подмигнула Вам.&n'
    break
    case 8
      wecho Глупая голова сказала : 'какого черт я влезал за лыдвиц тилеев и прочих пассажиров'
      wait 1
      wecho Глупая голова сказала : 'а они первые свалили )'
      wait 2
      wecho Умная голова сказала : 'если бы ты думал мной тогда, то мы так же сделали бы'
      wait 1
      wecho &KУмная голова задумалась...&n
      wait 1
      wecho Умная голова сказала : 'или ваще не влезали бы'
    break
    case 9
      wecho Глупая голова сказала : 'не накрашеная страшная'
      wait 1
      wecho Глупая голова сказала : 'и накрашенная'
      wait 1
      wecho Глупая голова сказала : 'ты такая страшная ))'
    break
  done
else
  switch %random.6%
    case 1
      wecho Глупая голова сказала : 'на 3 процента папе скиллы сбил'
      wait 1
      wechoaround %actor% Глупая голова с укором посмотрела на %actor.vname%.
      %send% %actor% Глупая голова с укором посмотрела на Вас.
    break
    case 2
      wecho Глупая голова сказала : 'отстаньте вы отнас уже дайте спокойно жить а'
      wait 1
      wecho Глупая голова сказала : 'круто намутить себе все сеты и с оналйном в 4 - 5 раз больше осаждать 1 клан типа'
      wait 1
      wecho Глупая голова сказала : 'это не война уже, это геноцид !:)'
    break
    case 3
      wecho Глупая голова сказала : 'нормальные есть пацаны в маде отвечаю'
    break
    case 4
      wecho Глупая голова сказала : 'выпишите из листа чтоли)'
    break
    case 5
      wecho Глупая голова сказала : 'ну чо мерзкие твари, так и бум в замке сидеть?)'
      wait 3
      wecho Глупая голова сказала : 'прости братишка не признал ))'
    break
    case 6
      wecho &KГлупая голова захныкала.&n
      wait 1
      wecho Глупая голова сказала : 'только не делит!'
    done
  end
~
$~
