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
say %actor.name% Не забывай, что при помощи нее, ты сможешь приманить своего питомца.
mload obj 21035
дат кост %actor.name%    
~
#21006
манить пса~
1 c 2
манить~
wait 1
if (%actor.clan%==вс)
  oechoaround %actor% %actor.name% начал манить костью%actor.g%.
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
  mechoaround %actor% Пес закопався в землю
  msend %actor% Вы прогнали пса.
  msend %actor% Убегая пес отдал Вам кость.
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
wait 1
if %actor.clan% == вс
  halt
end
osend %actor% %self.name% рассыпал%self.u% в ваших руках.
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
wait 1
if !%arg.contains(земля)%
  wsend %actor% Куда это вы хотите закопаться?
  return 0
  halt
end
if (!%actor.rentable% && !%actor.fighting% && (%actor.clan% == вс ))
  wsend %actor%  Вы закопались под землю.
  wechoaround %actor% %actor.name% скрылся под землей.
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
  wechoaround %actor% %actor.name% выполз откуда-то снизу.
  halt
elseif (%actor.rentable% && !%actor.fighting% && (%actor.clan% == вс )) 
  wteleport %actor% 21017
  wechoaround %actor% %actor.name% выполз откуда-то снизу.
  halt
else
  wsend %actor% Чаво? 
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
$~
