#10600
срабатывания ловушки огня~
0 r 100
~
eval save %actor.dex%+%actor.int%+%actor.intadd%+%actor.dexadd%-30
if (%actor.affect(настороженность)%)
  eval save %save%+30
end
if (%random.100%<=%save%)
  halt
end
%echo% Один неосторожный шаг, и ловушка пришла в действие!
dg_cast 'огн шар' %actor.name%
%load% obj 10622
%purge% %self%
~
#10601
Ставим ловушку~
1 c 2
установить~
if (%arg%==ловушку)
  %send% %actor% Вы поставили ловушку на землю и аккуратно нажали на рычажок.
  %echoaround% %actor% %actor.iname% поставил коробочку на землю и нажал на рычажок.
  set i %random.5%
  switch %i%
    case 1
      set dragon дух огня
      %load% mob 10600
    break
    case 2
      set dragon дух воздуха
      %load% mob 10605
    break
    case 3
      set dragon дух земли
      %load% mob 10602
    break
    case 4
      set dragon дух льда
      %load% mob 10603
    break
    case 5
      set dragon дух времени
      %load% mob 10604
    break
  done
  %echo% Ловушка угрожающе щелкнула и мгновенно перешла в боевое положение!
  %echo% Теперь, главное, самому в нее бы не угодить.
  %purge% %self%
else
  %send% %actor% Я, конечно, дико извиняюсь, но что именно вы хотите установить?
  halt
end
~
#10602
срабатывания ловушки земли~
0 r 100
~
eval save %actor.dex%+%actor.int%+%actor.intadd%+%actor.dexadd%-30
if (%actor.affect(настороженность)%)
  eval save %save%+30
end
if (%random.100%<=%save%)
  halt
end
%echo% Один неосторожный шаг, и ловушка пришла в действие!
dg_cast 'землетр'
%load% obj 10622
%purge% %self%
~
#10603
срабатывание ловушки льда~
0 r 100
~
eval save %actor.dex%+%actor.int%+%actor.intadd%+%actor.dexadd%-30
if (%actor.affect(настороженность)%)
  eval save %save%+30
end
if (%random.100%<=%save%)
  halt
end
%echo% Один неосторожный шаг, и ловушка пришла в действие!
%echo% Ловушка взорвалась, осыпав все ледяными осколками!
dg_cast 'ледяной шторм'
%load% obj 10622
%purge% %self%
~
#10604
Срабатывание ловушки времени~
0 r 100
~
eval save %actor.dex%+%actor.int%+%actor.intadd%+%actor.dexadd%-30
if (%actor.affect(настороженность)%)
  eval save %save%+30
end
if (%random.100%<=%save%)
  halt
end
%echo% Один неосторожный шаг, и ловушка пришла в действие!
dg_cast 'масс оцепен'
%load% obj 10622
%purge% %self%
~
#10605
Срабатывание ловушки воздуха~
0 r 100
~
eval save %actor.dex%+%actor.int%+%actor.intadd%+%actor.dexadd%-30
if (%actor.affect(настороженность)%)
  eval save %save%+30
end
if (%random.100%<=%save%)
  halt
end
%echo% Один неосторожный шаг, и ловушка пришла в действие!
dg_cast 'суд богов'
%load% obj 10622
%purge% %self%
~
#10606
Именная сумка - нисон~
1 gpr 100
~
if %actor.level% > 30 && %actor.vnum% == -1
  halt
end
if %actor.name% != Нисон
  otransform 3798
  osend %actor% Вы не можете это взять!
  return 0
  halt
else
  wait 1
  %echo% &WКольца&n на &Yсуме&n оглушающе зазвенели, Ваши уши заполнились &Rкровью&n.
end
~
#10610
Смерть лага~
0 f 100
~
%echo% Лаг зловеще захихикал: А вот хрен тебе!
%echo% Совершенно из ниоткуда перед Вами появился новый лаг! Еще хитрее и коварнее!
%load% mob 10610
~
#10611
тест~
1 c 1
изучить~
wait 1
%skilladd% %actor.name% сбить 10
%echo% + сбить
%purge% %self.id%
~
#10612
Дед Мороз скачет по клеткам~
0 ab 100
~
eval limjump 10
eval i 0
while (%i% < %limjump%)
  eval rndroom %random.95599%
  %echoaround% %self% %self.iname% залихватски гикнул на оленей, и упряжка полетела дальше.
  if ((%world.room(%rndroom%)%) && (%rndroom% > 3999) && (!%rndroom.flag(замок)%))
    %teleport% %self.id% %rndroom%
    %load% obj 10630
    брос снеж
  else
    %teleport% %self.id% 4099
    wait 20s
  end
  %echoaround% %self% Откуда не возьмись донесся переливчатый звон колокольчиков, и Вы увидели упряжку самого %self.rname%!
  wait 4s
  eval i (%i% + 1)
done
~
#10613
Просят подарок~
0 c 1
попросить~
if !%arg.contains(подарочек)%
  %send% %actor% Что именно просить то хотите?
else
  %send% %actor% Вы смущенно начали просить Деда Мороза о подарке.
  %echoaround% %actor% %actor.name% начал%actor.a% просить Деда Мороза о подарке. Какова наглость?!
  wait 1
  г Подарочек ему...
  дум
  г Ну держи, Новый Год как ни как!
  %echo% Дед Мороз кряхтя начал что-то искать в своем огромном мешке.
  wait 1
  eval rnd %random.50%
  if %rnd% < 10
    %load% obj 10709
    дать кинжал .%actor.name%
  elseif %rnd% < 20
    %load% obj 10710
    дать наручи .%actor.name%
  elseif %rnd% < 30
    %load% obj 10711
    дать поножи .%actor.name%
  elseif %rnd% < 40
    %load% obj 10712
    дать доспех .%actor.name%
  elseif %rnd% <= 50
    %load% obj 10713
    дать шлем .%actor.name%
  end
end
~
#10614
подарки забираем под елкой~
1 c 4
забрать~
if ((%cmd% != забрать) || (%arg% != подарок))
  %send% %actor% Чаво-чаво?
  halt
end
if (%actor.level% < 25)
  %send% %actor% - Мал%actor.q% ты еще подарки просить.
  halt
end
*получаем метку года
if (%date.month% > 6)
  eval nyear %date.year%+1
else
  set nyear %date.year%
end
if (%actor.getquest(10600)% == %nyear%)
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
set buf %actor.setquest(10600 %nyear%)%
~
#10615
Трансформ крошечной снежинки~
1 g 100
~
wait 1
set count 0
foreach items %actor.objs%
  if (%items.vnum% == %self.vnum%)
    eval count %count%+1
  end
done
if (%count% < 10)
  halt
end
eval count 0
foreach snow %actor.objs%
  if ((%snow.vnum% == %self.vnum%) && (%snow% != %self%))
    %purge% %snow%
    eval count %count%+1
  end
  if (%count% == 9)
  break
end
done
wait 1
oecho &WКрошечные снежинки завертелись в стремительном танце и через мгновение слились в маленькую снежинку.&n
oload obj 10631
eval t %world.obj(10631)%
%t.put(%actor.id%)%
opurge %self.id%
~
#10616
Трансформ мелкой снежинки~
1 g 100
~
wait 1
set count 0
foreach items %actor.objs%
  if (%items.vnum% == %self.vnum%)
    eval count %count%+1
  end
done
if (%count% < 10)
  halt
end
eval count 0
foreach snow %actor.objs%
  if ((%snow.vnum% == %self.vnum%) && (%snow% != %self%))
    %purge% %snow%
    eval count %count%+1
  end
  if (%count% == 9)
  break
end
done
wait 1
oecho &WМаленькие снежинки завертелись в стремительном танце и через мгновение слились в небольшую снежинку.&n
oload obj 10632
eval t %world.obj(10632)%
%t.put(%actor.id%)%
opurge %self.id%
~
#10617
Трансформ небольшой снежинки~
1 g 100
~
wait 1
set count 0
foreach items %actor.objs%
  if (%items.vnum% == %self.vnum%)
    eval count %count%+1
  end
done
if (%count% < 10)
  halt
end
eval count 0
foreach snow %actor.objs%
  if ((%snow.vnum% == %self.vnum%) && (%snow% != %self%))
    %purge% %snow%
    eval count %count%+1
  end
  if (%count% == 9)
  break
end
done
wait 1
oecho &WНебольшие снежинки завертелись в стремительном танце и через мгновение слились в ...снежинку.&n
oload obj 10633
eval t %world.obj(10633)%
%t.put(%actor.id%)%
opurge %self.id%
~
#10618
Трансформ просто снежинки~
1 g 100
~
wait 1
set count 0
foreach items %actor.objs%
  if (%items.vnum% == %self.vnum%)
    eval count %count%+1
  end
done
if (%count% < 10)
  halt
end
eval count 0
foreach snow %actor.objs%
  if ((%snow.vnum% == %self.vnum%) && (%snow% != %self%))
    %purge% %snow%
    eval count %count%+1
  end
  if (%count% == 9)
  break
end
done
wait 1
oecho &WСнежинки завертелись в стремительном танце и через мгновение слились в большую снежинку.&n
oload obj 10644
eval t %world.obj(10644)%
%t.put(%actor.id%)%
opurge %self.id%
~
#10620
пурж стафа~
0 d 100
пурж~
calcuid st 3714 obj
%purge% %st.id%
~
#10621
Триг на сапоги-скороходы~
1 c 1
*~
eval pl %self.worn_by%
eval cm %cmd.mudcommand%
*%echo% %cm% %pl.name%
if (%cm% == south || %cm% == юг)
  oforce %pl% south
  oforce %pl% south
  oforce %pl% south
  oforce %pl% south
  oforce %pl% south
  oforce %pl% south
elseif (%cm% == north || %cm% == север)
  oforce %pl% north
  oforce %pl% north
  oforce %pl% north
  oforce %pl% north
  oforce %pl% north
  oforce %pl% north
elseif (%cm% == east || %cm% == восток)
  oforce %pl% east
  oforce %pl% east
  oforce %pl% east
  oforce %pl% east
  oforce %pl% east
  oforce %pl% east
elseif (%cm% == west || %cm% == запад)
  oforce %pl% west
  oforce %pl% west
  oforce %pl% west
  oforce %pl% west
  oforce %pl% west
  oforce %pl% west
elseif (%cm% == up || %cm% == вверх)
  oforce %pl% up
  oforce %pl% up
  oforce %pl% up
  oforce %pl% up
  oforce %pl% up
  oforce %pl% up
elseif (%cm% == down || %cm% == вниз)
  oforce %pl% down
  oforce %pl% down
  oforce %pl% down
  oforce %pl% down
  oforce %pl% down
  oforce %pl% down
end
return 0
~
#10627
кукиш~
1 c 2
показать~
%echoaround% %actor.name% Большой многозначительный &Rкукиш&n внезапно оказался прям перед Вашим носом !
%send% %actor.name% Вы показали всем многозначительный &Rкукиш&n
~
#10639
разрываем лотерейный билетик~
1 c 2
разорвать~
wait 1
%send% %actor.name% Дрожайшими руками вы разорвали билетик...
eval rnd %random.100%
if %rnd% < 5
  %load% obj 1912
  %echo% Из разорванного билетика выпал черный свиток.
elseif (%rnd% < 15)
  %load% obj 10621
  %echo% Из разорванного билетика выпала пара добротных сапог!
elseif (%rnd% < 25)
  %load% obj 10648
  %echo% На землю тихо опустился легкий лук.
elseif (%rnd% < 50)
  %load% obj 33938
  %echo% Из разорванного билетика выпало именно то, о чем желает каждый герой. Плюшка!!!
elseif (%rnd% < 75)
  %load% obj 10603
  %echo% Из разорванного билетика выпал... цветочек! Ну всегда можно подарить его даме сердца!
elseif (%rnd% <= 100)
  %load% obj 10627
  %echo% Из разорванного билетика что-то упало на землю. Думаю, досталось оно вам по заслугам!
end
%purge% %self.id%
~
#10650
Триг на стаф кровавый~
1 gj 100
~
wait 1
if %actor.level% > 30 && %actor.vnum% == -1
  halt
end
if %actor.name% != Дыбарь
  %send% %actor.id% И охота Вам руки пачкать?
  %purge% %self.id%
  return 0
  halt
end
~
#10651
на стаф чародея-душегуба~
1 gj 100
~
wait 1
if %actor.level% > 30 && %actor.vnum% == -1
  halt
end
if %actor.name% != Жаровень
  %send% %actor.id% Ой не надо это трогать!
  %purge% %self.id%
  return 0
  halt
end
~
#10652
Триг на сып стафа целителя~
1 gj 100
~
wait 1
if %actor.level% > 30 && %actor.vnum% == -1
  halt
end
if %actor.name% != Вервень
  %send% %actor.id% Ой не надо это трогать!
  %purge% %self.id%
  return 0
  halt
end
~
#10653
Привязка предмета к игроку~
1 g 100
~
wait 1
if !%self.owner%
  %self.owner(%actor.uniq%)%
  osend %actor% %self.name% мягко засветил%self.u% в ваших руках и угас%self.q%.
  oechoaround %actor% %self.name% мягко засветил%self.u% в руках %actor.rname% и угас%self.q%.
end
~
#10654
Разбить шар или гроздь~
1 c 2
разбить~
wait 1
if !%arg%
  osend %actor% Что вы хотите разбить?
  halt
end
if (%arg.contains(шар)% && (%self.vnum% == 10671))
  osend %actor% &GВы резким ударом разбили волшебный шар на осколки...&n
  oechoaround %actor% &G%actor.name% резким ударом разбил%actor.q% волшебный ледяной шар на осколки!&n
  set i 0
  while %i% < 5
    oload obj 10670
    calcuid ice 10670 obj
    %ice.owner(%self.owner%)%
    %ice.put(%actor%)%
    eval i %i%+1
  done
  wait 1
  opurge %self%
  halt
end
if (%arg.contains(гроздь)% && (%self.vnum% == 10672))
  osend %actor% &GВы резким ударом разбили гроздь шаров на части...&n
  oechoaround %actor% &G%actor.name% резким ударом разбил%actor.q% гроздь волшебных ледяных шаров!&n
  set i 0
  while %i% < 5
    oload obj 10671
    calcuid ice 10671 obj
    %ice.owner(%self.owner%)%
    %ice.put(%actor%)%
    eval i %i%+1
  done
  wait 1
  opurge %self%
  halt
end
~
#10655
Загрузка ледышек (флаг "нового льда)~
1 n 100
~
%self.val0(1)%
~
$~
