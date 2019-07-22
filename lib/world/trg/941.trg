#94100
Роем себе яму~
2 c 0
Рыть~
if !(%arg.contains(яму)%)
  wsend %actor% Роем что?
  return 0
  halt
else
  wsend %actor% Поплевав на руки, Вы начали рыть землю.
  wechoaround %actor% %actor.iname% вздохнул%actor.g%, взял%actor.g% лопату в руки и начал%actor.g% рыть яму.
  wait 1s
  wecho Прошло немного времени
  wait 1s
  wecho Потом еще немного времени
  wait 1s
  wecho И еще чуть чуть...
  wait 1s
  wsend %actor% Лопата ушла в пустоту и Вы вместе с ней.
  %teleport% %actor% 94101
  wechoaround %actor% %actor.iname% с диким криком провалил%actor.u% в пустоту.
  %door% 94100 down room 94101
  wait 1s
  wecho Вы постояли, постояли у ямы...
  wecho Но товарища надо выручать
  wecho И скрепив сердце, прыгнули в бездну.
  wait 1s
  %teleport% all 94101
end
~
#94101
Ползем лаз 1~
2 c 0
Ползти~
if !(%arg.contains(лаз)%)
  wsend %actor% Куда ползем?
  return 0
  halt
else
  wsend %actor% Скорчившись в три погибели, вы поползли вперед.
  wechoaround %actor% %actor.iname% вздохнул%actor.g%, скорчил%actor.u% в три погибели и пополз%actor.q% вперед.
  %teleport% %actor% 94102
end
~
#94102
Ползем лаз 2~
2 c 0
Ползти~
if !(%arg.contains(лаз)%)
  wsend %actor% Куда ползем?
  return 0
  halt
else
  wsend %actor% Скорчившись в три погибели, вы поползли вперед.
  wechoaround %actor% %actor.iname% вздохнул%actor.g%, скорчил%actor.u% в три погибели и пополз%actor.q% вперед.
  %teleport% %actor% 94103
end
~
#94103
Ползем лаз 3~
2 c 0
Ползти~
if !(%arg.contains(лаз)%)
  wsend %actor% Куда ползем?
  return 0
  halt
else
  wsend %actor% Скорчившись в три погибели, вы поползли вперед.
  wechoaround %actor% %actor.iname% вздохнул%actor.g%, скорчил%actor.u% в три погибели и пополз%actor.q% вперед.
  %teleport% %actor% 94104
end
~
#94104
Ползем лаз 4 неукреплен~
2 c 0
Ползти~
if !(%arg.contains(лаз)%)
  wsend %actor% Куда ползем?
  return 0
  halt
else
  if %actor.class% == 2
    wsend %actor% Скорчившись в три погибели, вы поползли вперед.
    wechoaround %actor% %actor.iname% вздохнул%actor.g%, скорчил%actor.u% в три погибели и пополз%actor.q% вперед.
    %teleport% %actor% 94105
  else
    wsend %actor% Скорчившись в три погибели, вы поползли вперед.
    wechoaround %actor% %actor.iname% вздохнул%actor.g%, скорчил%actor.u% в три погибели и пополз%actor.q% вперед.
    wait 5
    switch %random.3%
    break
    case 1
      wsend %actor% Неуклюже проползая, Вы зацепили края лаза. Сверху посыпались комья земли.
      wsend %actor% Пласты земли, нависшие над Вами, обвалились, похоронив Вас под собой.
      wsend %actor% Вы мертвы. Нам очень жаль. Правда жаль. Покойтесь с миром.
      wdamage %actor% %actor.maxhitp%+1
      wecho Пласты земли обвалились, похоронив %actor.vname% под собой.
      wecho Недолго думая, Вы выдернули бездыханное тело из под завалов.
    break
    case 2
      wsend %actor% Неуклюже проползая, Вы зацепили края лаза. Сверху посыпались комья земли.
      wsend %actor% Пласты земли, нависшие над Вами, обвалились, похоронив Вас под собой.
      wsend %actor% Вы мертвы. Нам очень жаль. Правда жаль. Покойтесь с миром.
      wdamage %actor% %actor.maxhitp%+10
      wecho Пласты земли обвалились, похоронив %actor.vname% под собой.
      wecho Недолго думая, Вы выдернули бездыханное тело из под завалов.
    break
    case 3
      wsend %actor% Неуклюже проползая, Вы зацепили края лаза. Сверху посыпались комья земли.
      wsend %actor% Пласты земли, нависшие над Вами, обвалились, похоронив Вас под собой.
      wsend %actor% Вы мертвы. Нам очень жаль. Правда жаль. Покойтесь с миром.
      wdamage %actor% %actor.maxhitp%
      wecho Пласты земли обвалились, похоронив %actor.vname% под собой.
      wecho Недолго думая, Вы выдернули бездыханное тело из под завалов.
    break
  done
end
end
~
#94105
Укрепляем лаз~
2 c 0
Укрепить~
if !(%arg.contains(лаз)%)
  wsend %actor% Укрепить что?
  return 0
  halt
else
  wsend %actor% Поплевав на руки, Вы принялись за работу.
  wait 1s
  wecho Прошло немного времени
  wait 1s
  wecho Потом еще немного времени
  wait 1s
  wecho И еще чуть чуть...
  wait 1s
  wsend %actor% И вот работа завершена и теперь лаз безопасен.
  calcuid lazzhopa 94104 room
  detach 94104 %lazzhopa.id%
  attach 94106 %lazzhopa.id%
end
~
#94106
Ползем лаз 4 укреплен~
2 c 0
Ползти~
if !(%arg.contains(лаз)%)
  wsend %actor% Куда ползем?
  return 0
  halt
else
  wsend %actor% Скорчившись в три погибели, вы поползли вперед.
  wechoaround %actor% %actor.iname% вздохнул%actor.g%, скорчил%actor.u% в три погибели и пополз%actor.q% вперед.
  %teleport% %actor% 94105
end
~
#94107
Пробиваем свод~
2 c 0
Пробить~
if !(%arg.contains(свод)%)
  wsend %actor% Пробить что?
  return 0
  halt
else
  wsend %actor% Вы попытались пробить свод.
  wechoaround %actor% %actor.iname% попытал%actor.u% пробить свод.
  wecho &yПласты земли, нависшие над Вами, обвалились, едва не похоронив Вас под собой.&n
  eval gopa %actor.pc% 
  foreach i %gopa% 
    %damage% %i% 1000
  done
  wecho Это ж надо додуматься до такого, потолок над собой пробивать.
end
~
#94108
Долбимся в стену~
2 c 0
Долбить~
if !(%arg.contains(стену)%)
  wsend %actor% Долбить что?
  return 0
  halt
else
  wsend %actor% Поплевав на руки, вы начали долбить стену
  wechoaround %actor% %actor.iname% поплевал%actor.g% на руки и начал%actor.g% долбить стену.
  wecho Пласты земли обвалились, обнажив породу.
  wsend %actor% Вы аккуратно откололи камень.
  switch %random.9%
  break
  case 1
    %load% obj 909
  break
  case 2
    %load% obj 910
  break
  case 3
    %load% obj 911
  break
  case 4
    %load% obj 912
  break
  case 5
    %load% obj 913
  break
  case 6
    %load% obj 914
  break
  case 7
    %load% obj 915
  break
  case 8
    %load% obj 916
  break
  case 9
    %load% obj 917
  break
done
end
detach 94108 %self.id%
~
#94109
Роем яму 2~
2 c 0
Рыть~
if !(%arg.contains(яму)%)
  wsend %actor% Роем что?
  return 0
  halt
else
  wsend %actor% Поплевав на руки, Вы начали рыть землю.
  wechoaround %actor% %actor.iname% вздохнул%actor.g%, взял%actor.g% лопату в руки и начал%actor.g% рыть яму.
  wait 1s
  wecho Прошло немного времени
  wait 1s
  wecho Потом еще немного времени
  wait 1s
  wecho И еще чуть чуть...
  wait 1s
  wsend %actor% Лопата ушла в пустоту и Вы вместе с ней.
  %teleport% %actor% 94107
  wechoaround %actor% %actor.iname% с диким криком провалил%actor.u% в пустоту.
  %door% 94107 down room 94108
  wait 1s
  wecho Вы постояли, постояли у ямы...
  wecho Но товарища надо выручать
  wecho И скрепив сердце, прыгнули в бездну.
  wait 1s
  %teleport% all 94108
end
~
#94110
Наступили на змею~
2 g 0
~
eval victim %random.char%
switch %random.3%
  case 1
    if (%random.100% <= 31)
      wsend %victim% Неловко перемещаясь по комнате, вы наступили на змеиный хвост. 
      wechoaround %victim% %victim.iname%, будучи крабом, наступил%victim.g% на змеинный хвост.
      wsend %victim% Змея бросилась на Вас и сбила с ног.
      wechoaround %victim% Змея резко дернула свой хвост, свалив %victim.vname% с ног.	
      wait 1
      %victim.wait(2)%
      %victim.position(6)%
    end
  break
  case 2
    if (%random.100% <= 25)
      wsend %victim% Неловко перемещаясь по комнате, вы наступили на змеиный хвост. 
      wechoaround %victim% %victim.iname%, будучи крабом, наступил%victim.g% на змеинный хвост.
      wsend %victim% Змеинные глаза сверкнули в темноте. Вы уснули сладким сном.
      wechoaround %victim% Змеинные глаза сверкнули в темноте, %victim.iname% уснул как младенец.
      wait 1
      %victim.position(4)%
    end
  break
  case 3
    if (%random.100% <= 10)
      wsend %victim% Неловко перемещаясь по комнате, вы наступили на змеиный хвост.
      wechoaround %victim% %victim.iname%, будучи крабом, наступил%victim.g% на змеинный хвост.
      wsend %victim% Змея вонзала свои ядовитые зубы в вашу шею. Вы умираете.
      wechoaround %victim% Змея вцепилась в шею %victim.rname%, лишив сознания.
      wait 1
      %victim.position(2)%
    end
  break
done
detach 94109 %self.id%
~
#94111
Протыкаем пелену~
2 c 0
Проткнуть~
if !(%arg.contains(пелену)%)
  wsend %actor% Проткнуть что?
  return 0
  halt
else
  if %actor.class% == 2
    wsend %actor% Вы проткнули пелену, как ни в чем не бывало.
    wechoaround  %actor.iname% с легкостью проткнул пелену.
    %door% 94113 west room 94114
    wait 1
    wecho ___&KТемная густая пелена заполнила комнату.&n
    wload mob 94116	
    detach 94111 %self.id%
  else
    wsend %actor% Вы проткнули пелену. С громким хлопком пелена лопнула.
    foreach pc %self.pc%
      wdamage %pc% %random.1000%
    done
  end
end
~
#94112
Баха встречает~
0 r 100
~
switch %random.6%
break
case 1
  say Привет!
  wait 1
  say Есть отличный план.
  say Собираем народ для войны с КВ, состав имеется.
  say Как сам думаешь?
  say Ты только скажи мне пароль, ты же знаешь я лучший.
break
case 2
  say Привет!
  wait 1
  say Займи кун по возможности.
  say Купим скутумы.
  say НВО разденем.
  say Ты только скажи мне пароль, ты же знаешь я лучший.
break
case 3
  say Привет!
  wait 1
  say Знаешь воеводу ДНЗ Кайрата?
  say Передай ему, что его ратник ищет.
  say Только добавь - лучший ратник!
break
case 4
  say Привет!
  wait 1
  say Слыхал про Тешигнева?
  say Ну и где тот Тешигнев.
  say А я вот тут!
  say И лучше меня никого нет.
break
case 5
  say Привет!
  wait 1
  say Чо, лидером себя считаешь?
  say Да я прошел эту игру!
  say Да я лучший лидер во всех Былинах.
break
case 6
  say Привет!
  wait 1
  say ПК! ПК! Пентись.
  wait 2
  say А не, все, не надо.
  say Убили.
  say Лучшие пентятся резко, а не как ты.
break
done
~
#94113
Сдохли змеи~
0 f 100
~
switch %random.4%
  case 1
    if (( %random.100% < 25 ) && ( %world.curobjs(94100)% < %world.maxobj(94100)%  ))
      mload obj 94100
    end 
  break
  case 2
    if (( %random.100% < 25 ) && ( %world.curobjs(94101)% < %world.maxobj(94101)% ))
      mload obj 94101
    end 
  break
  case 3
    if (( %random.100% < 15 ) && ( %world.curobjs(94102)% < %world.maxobj(94102)% ))
      mload obj 94102
    end 
  break
  case 4
    if (( %random.100% < 25 ) && ( %world.curobjs(94103)% < %world.maxobj(94103)% ))
      mload obj 94103
    end 
  break
  default 
    halt
  break 
done
~
#94114
Сдохли змеелюди~
0 f 100
~
switch %random.4%
  case 1
    if (( %random.100% < 25 ) && ( %world.curobjs(94108)% < %world.maxobj(94108)%  ))
      mload obj 94108
    end 
  break
  case 2
    if (( %random.100% < 25 ) && ( %world.curobjs(94109)% < %world.maxobj(94109)% ))
      mload obj 94109
    end 
  break
  case 3
    if (( %random.100% < 25 ) && ( %world.curobjs(94110)% < %world.maxobj(94110)% ))
      mload obj 94110
    end 
  break
  case 4
    if (( %random.100% < 25 ) && ( %world.curobjs(94111)% < %world.maxobj(94111)% ))
      mload obj 94111
    end 
  break
  default 
    halt
  break 
done
~
#94115
Сдох танцор~
0 f 100
~
switch %random.3%
  case 1
    if (( %random.100% < 25 ) && ( %world.curobjs(94112)% < %world.maxobj(94112)%  ))
      mload obj 94112
    end 
  break
  case 2
    if (( %random.100% < 25 ) && ( %world.curobjs(94113)% < %world.maxobj(94113)% ))
      mload obj 94113
    end 
  break
  case 3
    if (( %random.100% < 25 ) && ( %world.curobjs(94114)% < %world.maxobj(94114)% ))
      mload obj 94114
    end 
  break
  default 
    halt
  break 
done
~
#94116
Сдохла танцорша~
0 f 100
~
switch %random.3%
  case 1
    if (( %random.100% < 25 ) && ( %world.curobjs(94115)% < %world.maxobj(94115)%  ))
      mload obj 94115
    end 
  break
  case 2
    if (( %random.100% < 25 ) && ( %world.curobjs(94116)% < %world.maxobj(94116)% ))
      mload obj 94116
    end 
  break
  case 3
    if (( %random.100% < 25 ) && ( %world.curobjs(94117)% < %world.maxobj(94117)% ))
      mload obj 94117
    end 
  break
  default 
    halt
  break 
done
~
#94117
Сдох Айсул~
0 f 100
~
switch %random.2%
  case 1
    if (( %random.100% < 25 ) && ( %world.curobjs(94132)% < %world.maxobj(94132)%  ))
      mload obj 94132
    end 
  break
  case 2
    if (( %random.100% < 25 ) && ( %world.curobjs(94133)% < %world.maxobj(94133)% ))
      mload obj 94133
    end 
  break
  default 
    halt
  break 
done
~
#94118
Зашли к бабе~
0 r 100
~
wait 1
emote прекратила рыдания и уставилась на вас удивленным взглядом
wait 1
say Здравствуй, воин.
say Даже не представляю, как ты смог сюда добраться.
say Но раз уж ты тут, не откажи в помощи, помоги, выручи.
~
#94119
Помогу бабе~
0 d 0
помогу~
say Похитил меня царь змеиный Полоз
say Да сказал, что рожать заставит меня
say А потом убьет
say Спаси меня, воин.
wait 1
say Убей Полоза, а в доказательство хвост его принеси мне
say Уж найдется у меня, чем тебя вознаградить
emote обворожительно улыбнулась
calcuid baba 94153 mob
detach 94118 %baba.id%
~
#94120
Полоз сдох~
0 f 100
~
mecho _&RПоследним ударом вы отрубили хвост Царю Змеиному&n
mecho _&WС криками ругани Бахыт прибыл на зов.&n
calcuid baha 94117 mob
mteleport %baha% 94197
mload obj 94136
switch %random.3%
  case 1
    if ((%world.curobjs(94134)% < %world.maxobj(94134)%) && (25 >= %random.100%))
      mload obj 94134
    end 
  break
  case 2
    if ((%world.curobjs(94135)% < %world.maxobj(94135)%) && (25 >= %random.100%))
      mload obj 94135
    end 
  break
  case 3
    if ((%world.curobjs(94137)% < %world.maxobj(94137)%) && (25 >= %random.100%))
      mload obj 94137
    end 
  break
  default 
    halt
  break 
done
~
#94121
Сдох телох~
0 f 100
~
if (( %random.100% < 25 ) && ( %world.curobjs(94138)% < %world.maxobj(94138)%  ))
  mload obj 94138
end 
~
#94122
Сдох элитка~
0 f 100
~
if (( %random.100% < 25 ) && ( %world.curobjs(94139)% < %world.maxobj(94139)%  ))
  mload obj 94139
end 
~
#94123
Сдохла пелена~
0 f 100
~
calcuid pelena 94104 room
attach 94124 %pelena.id%
exec 94124 %pelena.id%
detach 94124 %pelena.id%
if (( %random.100% < 25 ) && ( %world.curobjs(94104)% < %world.maxobj(94104)%  ))
  mload obj 94104
end 
~
#94124
Делаем дверь~
2 z 0
~
%door% 94113 west room 94114 
~
#94125
Баба раздает подарки~
0 j 100
~
if (%object.vnum% != 94136)
  msend %actor% Ей не нужен этот хлам!
  return 0
  halt
end
wait 1
if %object.vnum% == 94136
  wait 1
  mjunk all
  wait 5
  emote улыбнулась самой восхитительной улыбкой
  say Я верила в тебя!
  wait 1s
  switch %random.4%
  break
  case 1
    if %world.curobjs(94140)% < %world.maxobj(94140)%
      mecho Невеста стянула с пальца &Wобручальное кольцо.&n
      mecho Камень на кольце засиял мертвым ледяным светом.
      wait 1s
      mload obj 94140
      дать кольцо %actor.iname%
      say Мне оно уже не пригодится. Бери его себе на память.
    else
      say Хотела бы я тебя отблагодарить, да нет ничего у меня
    end
  break
  case 2
    if %world.curobjs(94141)% < %world.maxobj(94141)%
      mecho Невеста стянула с головы &Rфату.&n
      mecho &RФата&n замерцала призрачным светом.
      wait 1s
      mload obj 94141
      дать фата %actor.iname%
      say Мне она уже не пригодится. Бери ее себе на память.
    else
      say Хотела бы я тебя отблагодарить, да нет ничего у меня
    end
  break
  case 3
    if %world.curobjs(94142)% < %world.maxobj(94142)%
      mecho Невеста стянула с себя &Wплатье подвенечное.&n
      mecho &WПлатье&n вспыхнуло ярким пламенем
      wait 1s
      mload obj 94142
      дать платье %actor.iname%
      say Мне оно уже не пригодится. Бери его себе на память.
    else
      say Хотела бы я тебя отблагодарить, да нет ничего у меня
    end
  break
done
calcuid pent 94191 room
attach 94126 %pent.id%
exec 94126 %pent.id%
detach 94126 %pent.id%
end
~
#94126
Пента от бабы~
2 z 0
~
wportal 94100 2
~
#94127
Ресет зоны~
2 f 100
~
*двери закрываются
wdoor 94100 down purge
wdoor 94107 down purge
wdoor 94113 west purge
*сужаем лаз и готовим обвал
calcuid obval 94104 room
detach 94106 %obval.id%
attach 94104 %obval.id%
*готовим камни
calcuid tupik 94107 room
attach 94108 %tupik.id%
*бросок змеи
calcuid zmei 94109 room
attach 94110 %zmei.id%
*вернем бабе разговоры
calcuid baba 94153 mob
attach 94118 %baba.id%
attach 94111 %world.room(94113)%
~
#94128
Кузнец помер~
0 f 100
~
if (( %random.100% < 25 ) && ( %world.curobjs(94118)% < %world.maxobj(94118)%  ))
  mecho Добив кузнеца, вы сняли с него фартук. Авось пригодится.
  mload obj 94118
end 
~
#94129
Ведунья умерла~
0 f 100
~
if (( %random.100% < 25 ) && ( %world.curobjs(94119)% < %world.maxobj(94119)%  ))
  mecho Убив ведунью, вы сняли с нее накидку. Не пропадать же трофею.
  mload obj 94119
end 
~
#94130
Маг помер~
0 f 100
~
if (( %random.100% < 25 ) && ( %world.curobjs(94120)% < %world.maxobj(94120)%  ))
  mecho Убив мага, вы сняли с него накидку. Не пропадать же трофею.
  mload obj 94120
end 
~
#94131
Корчмарь рип~
0 f 100
~
if (( %random.100% < 25 ) && ( %world.curobjs(94121)% < %world.maxobj(94121)%  ))
  mecho Убив корчмаря, вы сняли с него передник. В хозяйстве пригодится.
  mload obj 94121
end 
~
#94132
Убили лентяя~
0 f 100
~
switch %random.2%
  case 1
    if (( %random.100% < 25 ) && ( %world.curobjs(94122)% < %world.maxobj(94122)%  ))
      mecho Убив лентяя, вы сняли с него доспех. В таком и при дворе показаться не стыдно.
      mload obj 94122
    end 
  break
  case 2
    if (( %random.100% < 25 ) && ( %world.curobjs(94123)% < %world.maxobj(94123)%  ))
      mecho Убив лентяя, вы сняли с него кольцо. Такого ни у кого нет.
      mload obj 94123
    end 
  break
  default 
    halt
  break 
done
~
#94133
Сектанты рип~
0 f 100
~
if (( %random.100% < 25 ) && ( %world.curobjs(94124)% < %world.maxobj(94124)%  ))
  mecho С диким криком сектант скончался. Вы сняли с трупа тунику.
  mload obj 94124
end 
~
#94134
Предводитель рип~
0 f 100
~
if (( %random.100% < 25 ) && ( %world.curobjs(94125)% < %world.maxobj(94125)%  ))
  mecho Умирая предводитель выкрикнул проклятие, но захлебнулся кровью и не закончил.
  mload obj 94125
end 
~
#94135
Фокусник рип~
0 f 100
~
if (( %random.100% < 25 ) && ( %world.curobjs(94126)% < %world.maxobj(94126)%  ))
  mecho Умирая, фокусник попытался спрятаться в цилиндр. Однако не поместился.
  mload obj 94126
end 
~
#94136
Подмастерье рип~
0 f 100
~
if (( %random.100% < 25 ) && ( %world.curobjs(94127)% < %world.maxobj(94127)%  ))
  mload obj 94127
end 
~
#94137
Дворцовый страж рип~
0 f 100
~
if (( %random.100% < 25 ) && ( %world.curobjs(94128)% < %world.maxobj(94128)%  ))
  mload obj 94128
end 
~
#94138
Патрульный рип~
0 f 100
~
if (( %random.100% < 25 ) && ( %world.curobjs(94129)% < %world.maxobj(94129)%  ))
  mecho _&RПоследним ударом вы снесли голову патрульного с плеч.&n
  mecho Вы сняли шлем с отрубленной головы.
  mload obj 94129
end 
~
#94139
Патрульный маг рип~
0 f 100
~
if (( %random.100% < 25 ) && ( %world.curobjs(94130)% < %world.maxobj(94130)%  ))
  mecho Убив змея вы попытались снять с него кольцо, но не смогли
  mecho _&RВы отрубили палец и аккуратно срезали кольцо&n
  mload obj 94130
end 
~
#94140
Командир рип~
0 f 100
~
if (( %random.100% < 25 ) && ( %world.curobjs(94131)% < %world.maxobj(94131)%  ))
  mecho Командир пал смертью храбрых, но вы все равно сняли с него доспех.
  mload obj 94131
end 
~
#94141
трансформ полоза~
0 k 100
~
set victim %random.char%
if !%victim%
  halt
end
switch %random.3%
  case 1
    set victim2 %random.char%
    set victim3 %random.char%
    if (!(%victim2%) && !(%victim3%))
      halt
    end
    mecho ___%self.iname% издал%self.g% непонятный звук!
    mecho ___&RОгненные стрелы разлетелись в разные стороны.&n
    mechoaround %victim% ___&RОгненная стрела пронзила %victim.vname%!&n
    msend %victim% ___&RОгненная стрела пронзила вас.&n
    eval dmg 200+%random.200%
    mdamage %victim% %dmg%
    mechoaround %victim2% ___&RОгненная стрела пронзила %victim2.vname%!&n
    msend %victim2% ___&RОгненная стрела пронзила вас.&n
    eval dmg 200+%random.200%
    mdamage %victim2% %dmg%
    mechoaround %victim3%___&RОгненная стрела пронзила %victim3.vname%!&n
    msend %victim3% ___&RОгненная стрела пронзила вас.&n
    eval dmg 200+%random.200%
    mdamage %victim3% %dmg%
  break
  case 2
    mechoaround %victim% ___&yГрохот разорвал тишину,&n &rогненная волна&n &yразошлась во все стороны&n
    dg_cast 'звук волн'
    foreach victim %self.pc%
      msend %victim% ___&RПламя обожгло вас!&n
      mechoaround %victim% ___&RПламя обожгло %victim.vname%!&n
      mdamage %victim% 340
    done
  break
  case 3
    msend %victim% ___&rМеткое попадание Полоза тяжело ранило вас.&n
    mechoaround %victim% ___&rМеткое попадание Полоза тяжело ранило %victim.vname%.&n
    eval damag %random.450%
    mdamage %victim% %damag%
  break
done
~
#94142
батл триг файтеров~
0 k 40
~
set victim %random.char%
if !%victim%
  halt
end
switch %random.3%
  case 1
    msend %victim% ___&RМощная атака %self.rname% сбила вас с ног!&n
    mechoaround %victim% ___&GОглушающий удар %self.rname% сбил %victim.vname% с ног!&n
    mdamage %victim% 275
    %victim.position(6)%
    %victim.wait(2)%
  break
  case 2
    msend %victim% ___&RМощная атака %self.rname% оглушила вас!&n
    mechoaround %victim% ___&c%self.iname% оглушил %victim.vname%!&n
    mdamage %victim% 175
    %victim.position(3)%
    %victim.wait(2)%
  break
  case 3
    mechoaround %victim% ___&g%self.iname% выпустил кислотное облако из своей пасти!&n
    dg_cast 'мас слеп'
    foreach victim %self.pc%
      msend %victim% ___&gКислота обжигает вашу кожу, оставляя раны!&n
      mechoaround %victim% ___&gКислотное облако оставило ожоги на коже %victim.rname%!&n
      mdamage %victim% 150
    done
  break
done
~
#94143
триг для кастеров~
0 k 100
~
if %self.position% < 7
  halt
end
eval rip %random.10%
switch %rip%
  case 1
    mecho %self.name% пробормотал%self.g% древнее заклинание!
    dg_cast 'лед шторм'
  break
  case 2
    mecho %self.name% пробормотал%self.g% древнее заклинание!
    dg_cast 'мас молч'
  break
  case 3
    mecho %self.name% пробормотал%self.g% древнее заклинание!
    dg_cast 'суд бог'
  break
  default
    mecho %self.name% пробормотал%self.g% древнее заклинание!
    if %self.hitp% < 3000
      dg_cast 'исцелен'
    end
  break
done
~
#94144
батл триг мглы~
0 k 100
~
eval rip %random.10%
switch %rip%
  case 1
    mecho ___&KТьма вокруг вас сгустилась, стало нечем дышать, горло сковала боль!&n
    dg_cast 'мас молч'    
  break
  case 2
    mecho ___&KПелена обрушила на вас гнев тьмы!&n
    dg_cast 'суд бог' 
  break
  case 3
    mecho ___&KПелена взорвалась оглушительным грохотом!&n
    dg_cast 'звук волн'
  break
  case 4
    mecho ___&KПелена взорвалась оглушительным грохотом, земля под ногами задрожала!&n
    dg_cast 'землетряс'
  break
done
~
#94145
бахыта разводим на стаф~
0 d 100
баха~

~
$
$
