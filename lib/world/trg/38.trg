#3800
Запуск движения кораблей~
2 f 100
~
wait 5s
* список комнат кораблей
set ship1 3800 3801 3802 3803 3804 3805 3806 3807 3808
set ship2 3809 3810 3811 3812 3813 3814 3815 3816 3817
global ship1
global ship2
* отсчет точки маршрута
set point1 1
set point2 1
global point1
global point2
* Будье внимательны при добавлении новых точек!
* Количество параметров должно быть одинаково.
* записываем первый маршрут
set cities1 Корсунь Переяславль Любеч Путивль Тотьму Великий_Новгород Руссу Торжок Стольный_Киев
set shiprooms1 3801 3802 3802 3802 3800 3802 3802 3801 3800
set dirs1 north north east east west east east north west
set rdirs1 south south west west east west west south east
set whardes1 27141 25064 69098 64086 62079 60091 35046 24006 67601
set speaker1 27000 25000 69001 64000 62000 60000 35000 24000 49900
global cities1
global shiprooms1
global dirs1
global rdirs1
global whardes1
global speaker1
* записываем второй маршрут
set cities2 Торжок Руссу Псков Туров Минск Стольный_Киев Корсунь Переяславль Любеч Великий_Новгород
set shiprooms2 3809 3809 3809 3809 3809 3810 3809 3809 3809 3809
set dirs2 north north north north north west east north west north
set rdirs2 south south south south south east west south east south
set whardes2 24007 35046 75098 32473 77089 67602 27139 25063 69096 60091
set speaker2 24000 35000 75100 32400 77000 49900 27000 25000 69001 60000
global cities2
global shiprooms2
global dirs2
global rdirs2
global whardes2
global speaker2
* перекидываем инфу на моба (для табличек)
calcuid data 3898 mob
global data
remote whardes1 %data.id%
remote whardes2 %data.id%
remote point1 %data.id%
remote point2 %data.id%
remote cities1 %data.id%
remote cities2 %data.id%
* Собственно запуск движения кораблей
exec 3805 %self.id%
eval pause 20+%random.20%
wait %pause%s
exec 3806 %self.id%
* удаляем триг, чтоб не стартовал снова 
detach 3800 %self.id%
~
#3801
Очистка первого корабля 3800-3808~
2 z 100
~
foreach target %self.pc%
  wsend %target% _Корабелы шустро выставили вас на пристань, и принялись вытаскивать корабль на берег.
  wteleport %target% %wharf1%
  wechoaround %target% _Корабелы выставили %target.vname% с корабля.
done
~
#3802
Очистка второго корабля 3809-3817~
2 z 100
~
foreach target %self.pc%
  wsend %target% _Корабелы шустро выставили вас на пристань, и принялись вытаскивать корабль на берег.
  wteleport %target% %wharf2%
  wechoaround %target% _Корабелы выставили %target.vname% с корабля.
done
~
#3803
Стоянка первого корабля~
2 z 100
~
eval pause 500+%random.100%
wait %pause%s
while %stop%
  wait 30s
done
exec 3805 %self.id%
~
#3804
Стоянка второго корабля~
2 z 100
~
eval pause 500+%random.100%
wait %pause%s
while %stop%
  wait 30s
done
exec 3806 %self.id%
~
#3805
Перемещение первого корабля по маршруту~
2 z 100
~
*если счетчик точек равен числу точек, значит маршрут пройден, начинаем с начала
if (%point1% > %cities1.words%)
  set point1 1
  global point1
end
*запоминаем следующий город 
set city %cities1.words(%point1%)%
global city
*Выдаем сообщение на корабле
foreach room1 %ship1%
  wat %room1% wecho _&GКорабелы засуетились, поднимая сходню&n
  wat %room1% wecho _&Y"Шевелитесь!" - прикрикнул на них купец - "Отправляемся в %city%!"&n
done
set cond1 1
global cond1
remote cond1 %data.id%
wait 30s
foreach room2 %ship1%
  wat %room2% wecho _&GКорабелы налегли на весла, и корабль покачиваясь отвалил от пристани.&n
done
*убираем сходню
eval ratchet %world.room(%whard%)%
if %ratchet%
  attach 3808 %ratchet.id%
  exec 3808 %ratchet.id%
end
*удаляем вход на корабль
wdoor %shiproom% %dir% purge
wdoor %whard% %rdir% purge
set cond1 2
global cond1
remote cond1 %data.id%
*запоминаем новую точку причаливания
set shiproom %shiprooms1.words(%point1%)%
set dir %dirs1.words(%point1%)%
set rdir %rdirs1.words(%point1%)%
set whard %whardes1.words(%point1%)%
global shiproom
global dir
global rdir
global whard
*Выдаем антуражные сообщения в комнату и ждем.
set i 0
while (%i% < 24)
  switch %random.20%
    case 1
      set msg &gГустой лес покрывает берега реки.&n
    break
    case 2
      set msg &YНесколько всадников пронеслись по берегу, махая вам руками.&n
    break
    case 3
      set msg &CСгустились тучи, и холодные струи дождя заколотили по палубе.&n
    break
    case 4
      set msg &WГустой туман поднялся над рекой.&n
    break
    case 5
      set msg &GЧешуйчатая спина невиданного чудища поднялась из воды и снова скрылась.&n
    break
    case 6
      set msg &YВатага ушкуйников на челнах вылетела было из протоки, но оценив размеры корабля ретировалась.&n
    break
    case 7
      set msg &YНесколько корабелов устроились на носу и громко горланят песни.&n
    break
    case 8
      set msg &CСильные порывы ветра поднимают тучи брызг и раскачивают корабль.&n
    break
    case 9
      set msg &GЧто-то проскребло по днищу корабля, заставив его качнуться.&n
    break
    case 10
      set msg &YУсатый корабел закинул за борт кожаное ведро на веревке и окатил палубу водой.&n
    break
    case 11
      set msg &CКормчий качнул корабль, и палубу обдало веером брызг.&n
    break
    case 12
      set msg &YБольшое селение показалось на берегу.&n
    break
    case 13
      set msg &YБерег гол и пустынен -- одни скалы и неприветливые холмы.&n
    break
    case 14
      set msg &RМаковое поле простирается по левую руку на берегу.&n
    break
    case 15
      set msg &YНизкие заболоченные берега переходят в трясину, из которой раздаются странные звуки.&n
    break
    case 16
      set msg &GПарочка корабелов устроилась под навесом и играет в зернь.&n
    break
    case 17
      set msg &KГрозовая туча закрыла небо, и кормчий то и дело озабоченно поглядывает вверх.&n
    break
    case 18
      set msg &YНа берегу показался разбитый и истлевший остов корабля.&n
    break
    case 19
      set msg &KКрупный град заколотил по палубе, заставив всех укрыться под кожанными навесами.&n
    break
    case 20
      set msg &GПротянувшиеся над водой ветви столетнего дерева скребнули по борту.&n
    break
  done
  eval i %i%+1
  wait 10s
  foreach room3 %ship1%
    wat %room3% wecho %msg%
  done
  unset room3
done
*причаливаем
wdoor %shiproom% %dir% room %whard%
wdoor %whard% %rdir% room %shiproom%
eval ratchet %world.room(%whard%)%
attach 3807 %ratchet.id%
set speak %speaker1.words(%point1%)%
remote speak %ratchet.id%
exec 3807 %ratchet.id%
eval point1 %point1%+1
global point1
foreach room4 %ship1%
  wat %room4% wecho _&YНаконец вы прибыли в %city%!&n
done
set cond1 3
global cond1
remote cond1 %data.id%
unset room1
unset room2
unset room3
unset room4
*запускаем таймер стоянки
exec 3803 %self.id%
halt
~
#3806
Перемещение второго корабля по маршруту~
2 z 100
~
*если счетчик точек равен числу точек, значит маршрут пройден, начинаем с начала
if (%point2% > %cities2.words%)
  set point2 1
  global point2
end
*запоминаем следующий город 
set city2 %cities2.words(%point2%)%
global city2
*Выдаем сообщение на корабле
foreach room1 %ship2%
  wat %room1% wecho _&GКорабелы засуетились, поднимая сходню&n
  wat %room1% wecho _&Y"Шевелитесь!" - прикрикнул на них купец - "Отправляемся в %city2%!"&n
done
set cond2 1
global cond2
remote cond2 %data.id%
wait 30s
foreach room2 %ship2%
  wat %room2% wecho _&GКорабелы налегли на весла, и корабль покачиваясь отвалил от пристани.&n
done
*убираем сходню
eval ratchet %world.room(%whard2%)%
if %ratchet%
  attach 3808 %ratchet.id%
  exec 3808 %ratchet.id%
end
*удаляем вход на корабль
wdoor %shiproom2% %dir2% purge
wdoor %whard2% %rdir2% purge
set cond2 2
global cond2
remote cond2 %data.id%
*запоминаем новую точку причаливания
set shiproom2 %shiprooms2.words(%point2%)%
set dir2 %dirs2.words(%point2%)%
set rdir2 %rdirs2.words(%point2%)%
set whard2 %whardes2.words(%point2%)%
global shiproom2
global dir2
global rdir2
global whard2
*Выдаем антуражные сообщения в комнату и ждем.
set i 0
while (%i% < 24)
  switch %random.20%
    case 1
      set msg &gГустой лес покрывает берега реки.&n
    break
    case 2
      set msg &YНесколько всадников пронеслись по берегу, махая вам руками.&n
    break
    case 3
      set msg &CСгустились тучи, и холодные струи дождя заколотили по палубе.&n
    break
    case 4
      set msg &WГустой туман поднялся над рекой.&n
    break
    case 5
      set msg &GЧешуйчатая спина невиданного чудища поднялась из воды и снова скрылась.&n
    break
    case 6
      set msg &YВатага ушкуйников на челнах вылетела было из протоки, но оценив размеры корабля ретировалась.&n
    break
    case 7
      set msg &YНесколько корабелов устроились на носу и громко горланят песни.&n
    break
    case 8
      set msg &CСильные порывы ветра поднимают тучи брызг и раскачивают корабль.&n
    break
    case 9
      set msg &GЧто-то проскребло по днищу корабля, заставив его качнуться.&n
    break
    case 10
      set msg &YУсатый корабел закинул за борт кожаное ведро на веревке и окатил палубу водой.&n
    break
    case 11
      set msg &CКормчий качнул корабль, и палубу обдало веером брызг.&n
    break
    case 12
      set msg &YБольшое селение показалось на берегу.&n
    break
    case 13
      set msg &YБерег гол и пустынен -- одни скалы и неприветливые холмы.&n
    break
    case 14
      set msg &RМаковое поле простирается по левую руку на берегу.&n
    break
    case 15
      set msg &YНизкие заболоченные берега переходят в трясину, из которой раздаются странные звуки.&n
    break
    case 16
      set msg &GПарочка корабелов устроилась под навесом и играет в зернь.&n
    break
    case 17
      set msg &KГрозовая туча закрыла небо, и кормчий то и дело озабоченно поглядывает вверх.&n
    break
    case 18
      set msg &YНа берегу показался разбитый и истлевший остов корабля.&n
    break
    case 19
      set msg &KКрупный град заколотил по палубе, заставив всех укрыться под кожанными навесами.&n
    break
    case 20
      set msg &GПротянувшиеся над водой ветви столетнего дерева скребнули по борту.&n
    break
  done
  eval i %i%+1
  wait 10s
  foreach room3 %ship2%
    wat %room3% wecho %msg%
  done
  unset room3
done
*причаливаем
wdoor %shiproom2% %dir2% room %whard2%
wdoor %whard2% %rdir2% room %shiproom2%
eval ratchet %world.room(%whard2%)%
attach 3807 %ratchet.id%
set speak %speaker2.words(%point2%)%
remote speak %ratchet.id%
exec 3807 %ratchet.id%
eval point2 %point2%+1
global point2
foreach room4 %ship2%
  wat %room4% wecho _&YНаконец вы прибыли в %city2%!&n
done
set cond2 3
global cond2
remote cond2 %data.id%
unset room1
unset room2
unset room3
unset room4
*запускаем таймер стоянки
exec 3804 %self.id%
halt
~
#3807
Сообщение о прибытии корабля и лоад сходни~
2 z 100
~
eval one %speak%/100
eval two %self.vnum%/100
if (%one% != %two%)
  wzoneecho %speak% _&Y"К пристани причалил купеческий корабль!" -- прокричал наблюдатель на стене.&n
end
wzoneecho %self.vnum% _&Y"К пристани причалил купеческий корабль!" -- прокричал наблюдатель на стене.&n
wload obj 3899
~
#3808
Удаление сходни~
2 z 100
~
foreach item %self.objects%
  if (%item.vnum% == 3899)
    wpurge %item%
    wecho &YНесколько крепких корабелов сноровисто втащили сходню на лодью.&n
  break
end
done
~
#3809
Управление движением кораблей~
2 c 0
управление~
wait 1
if (%actor.level% < 32)
  wsend %actor% _Ты еще кто такое?
  halt
end
if %arg.contains(стоп)%
  wecho _&G * * * ОСТАНАВЛИВАЕМ ДВИЖЕНИЕ КОРАБЛЕЙ * * *&n
  set stop 1
  global stop
  halt
end
if %arg.contains(старт)%
  wecho _&R * * * ЗАПУСКАЕМ ДВИЖЕНИЕ КОРАБЛЕЙ, В СТВОРЕ НЕ СТОЯТЬ! * * *&n
  set stop 0
  global stop
  halt
end
if %arg.contains(перезапуск)%
  wecho _&Y * * * ПЕРЕЗАПУСК ДВИЖЕНИЯ КОРАБЛЕЙ * * *&n
  wecho _&Y __________* остановка кораблей *&n
  set stop 1
  global stop
  detach 3800 %self.id%
  detach 3805 %self.id%
  detach 3806 %self.id%
  wecho _&Y __________* очистка выходов *&n
  set m %shiprooms1.words%
  set i 1
  while (%i% <= %m%) 
    set shiproom %shiprooms1.words(%i%)%
    set dir %dirs1.words(%i%)%
    set rdir %rdirs1.words(%i%)%
    set whard %whardes1.words(%i%)%
    wdoor %shiproom% %dir% purge
    wdoor %whard% %rdir% purge
    eval i %i%+1
  done
  wait 1s
  set m %shiprooms2.words%
  set i 1
  while (%i% <= %m%) 
    set shiproom %shiprooms2.words(%i%)%
    set dir %dirs2.words(%i%)%
    set rdir %rdirs2.words(%i%)%
    set whard %whardes2.words(%i%)%
    wdoor %shiproom% %dir% purge
    wdoor %whard% %rdir% purge
    eval i %i%+1
  done
  wait 1s
  wecho _&Y __________* подключение триггеров *&n
  attach 3800 %self.id%
  attach 3805 %self.id%
  attach 3806 %self.id%
  set stop 0
  global stop
  %world.zreset(38)%
  wecho _&Y __________* корабли перезапущены *&n
  halt
end
wsend %actor% Возможные команды: "стоп", "старт" и "перезапуск".
~
#3810
Информация о местоположении кораблей~
1 c 4
рассмотреть~
if !%arg.contains(записку)%
  %send% %actor% Чего рассматривать будем?
  halt
end
calcuid data 3898 mob
set whardes1 %data.global(whardes1)%
set whardes2 %data.global(whardes2)%
%send% %actor% Вы внимательно присмотрелись к табличке, пытаясь разобрать текст на записке.
set i 1
while (%i% <= %whardes2.words%)
  if (%self.room% == %whardes1.words(%i%)%)
    set route1place %i%
  end
  if (%self.room% == %whardes2.words(%i%)%)
    set route2place %i%
  end
  eval i %i%+1
done
eval tmp %route1place%+%route2place%
if (%tmp% < 1)
  %send% %actor% Однако, сколько вы ни старались, ниодного слова различить не смогли.
  halt
end
set point1 %data.global(point1)%
set point2 %data.global(point2)%
set cities1 %data.global(cities1)%
set cities2 %data.global(cities2)%
set cond1 %data.global(cond1)%
set cond2 %data.global(cond2)%
if (%route1place% > 0)
  %send% %actor% "Светлый" корабль артели
  if (%cond1% <= 1)
    %send% %actor% вот-вот отправится в плавание,
    %send% %actor% местоположение -
    eval temp %point1%-1
    if (%temp% < 1)
      set temp %whardes1.words%
    end
    %send% %actor% %cities1.words(%temp%)%
    %send% %actor% пункт назначения -
  elseif (%cond1% == 2)
    %send% %actor% уже в пути,
    %send% %actor% пункт назначения -
  else
    %send% %actor% пришвартован к пристани,
    *    eval point1 %point1%-1
    *    if (%point1% < 1)
    *      set point1 %whardes1.words%
    *    end
    %send% %actor% город -
  end
  %send% %actor% %cities1.words(%point1%)%
end
if (%route2place% > 0)
  %send% %actor% "Тёмный" корабль артели
  if (%cond2% <= 1)
    %send% %actor% вот-вот отправится в плавание,
    %send% %actor% местоположение -
    eval temp %point2%-1
    if (%temp% < 1)
      set temp %whardes2.words%
    end
    %send% %actor% %cities2.words(%temp%)%;
    %send% %actor% пункт назначения -
  elseif (%cond2% == 2)
    %send% %actor% уже в пути,
    %send% %actor% пункт назначения -
  else
    %send% %actor% пришвартован к пристани,
    %send% %actor% местоположение -
    *    eval point2 %point2%-1
    *    if (%point2% < 1)
    *      set point2 %whardes2.words%
    *    end
  end
  %send% %actor% %cities2.words(%point2%)%.
end
~
#3898
Dummy trig~
0 g 100
~
wait 1
say Что вы здесь делаете? Проваливайте пока не поздно!
~
$~
