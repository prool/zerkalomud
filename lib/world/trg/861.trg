#86100
ломаем дверь (сила 24+)~
2 c 1
ломать вышибить выбить толкнуть выломать~
if !%arg.contains(дверь)%
  return 1
  halt
end
wait 1s
if (%actor.str% => 24)
  wsend %actor% Вы мощным ударом выбили дверь, открыв проход на запад.
  wechoaround %actor% %actor.name% выбил%actor.g% дверь, открыв проход на запад.
  wait 1s
  wdoor 86134 west flags a
  wdoor 86134 west room 86115
  wdoor 86115 east purge
  wdoor 86115 east room 86134
  detach 86100 %self.id%
else
  wsend %actor% Вы попытались выломать дверь, но силенок маловато...
  wechoaround %actor% %actor.name% попытал%actor.u% выломать дверь, но силенок маловато.
end
~
#86101
одеваем рыцарей~
0 n 90
~
*триггер отключен - предметы выложены на руки мобам
wait 3s
if (( %random.25% == 1 ) && ( %world.curobjs(86104)% < 3 ))
  mload obj 86104
elseif (( %random.25% == 1 ) && ( %world.curobjs(86105)% < 3 ))
  mload obj 86105
elseif (( %random.25% == 1 ) && ( %world.curobjs(86106)% < 3 ))
  mload obj 86106
elseif (( %random.25% == 1 ) && ( %world.curobjs(86110)% < 3 ))
  mload obj 86110
elseif (( %random.25% == 1 ) && ( %world.curobjs(86111)% < 3 ))
  mload obj 86111
elseif (( %random.25% == 1 ) && ( %world.curobjs(86107)% < 3 ))
  mload obj 86107
end
if (( %random.35% == 1 ) && ( %world.curobjs(86114)% < 2 ))
  mload obj 86114
end
if (( %random.35% == 1 ) && ( %world.curobjs(86109)% < 2 ))
  mload obj 86109
end
if (( %random.35% == 1 ) && ( %world.curobjs(86108)% < 2 ))
  mload obj 86108
end
if (( %random.35% == 1 ) && ( %world.curobjs(86113)% < 2 ))
  mload obj 86113
end
if (( %random.35% == 1 ) && ( %world.curobjs(86102)% < 2 ))
  mload obj 86102
end
if (( %random.35% == 1 ) && ( %world.curobjs(86103)% < 2 ))
  mload obj 86103
end
if (( %random.35% == 1 ) && ( %world.curobjs(86112)% < 2 ))
  mload obj 86112
end
if (( %random.35% == 1 ) && ( %world.curobjs(86117)% < 2 ))
  mload obj 86117
end
if (( %random.35% == 1 ) && ( %world.curobjs(86100)% < 2 ))
  mload obj 86100
end
if (( %random.35% == 1 ) && ( %world.curobjs(86101)% < 2 ))
  mload obj 86101
end
if (( %random.35% == 1 ) && ( %world.curobjs(86118)% < 2 ))
  mload obj 86118
end
if (( %random.35% == 1 ) && ( %world.curobjs(86119)% < 2 ))
  mload obj 86119
end
wait 1s
воор фальши
воор арба
воор шесто
воор меч
воор клевец
оде все
wait 1s
detach 86101 %self.id%
~
#86102
отпираем ворота тремя ключами~
2 c 0
отп отпе отпер отпере отперет отпереть un unl unlo unloc unlock~
wait 1
if !%arg.contains(дверь)%
  %send% %actor% _Что вы хотите отпереть?
  halt
end
if ((%actor.haveobj(86122)%) && (%actor.haveobj(86123)% && (%actor.haveobj(86124)%))
  wait 1s
  wsend %actor.name% Вы аккуратно вставили все три ключа в скважины и повернули.
  wait 1
  wecho Двери со скрипом отворились.
  wdoor  86147 east flags a
  wdoor  86147 east room  86148
  detach 86102 %self.id%
else 
  wsend %actor.name% Чтобы отпереть эту дверь - необходимо три ключа.
end
~
#86103
умер казначей (ключ)~
0 f 100
~
mload obj 86122
~
#86104
конный тевтонский дозор~
0 q 100
~
wait 1s
wecho Тевтонский рыцарь внимательно оглядел Вас.
wecho Оруженосец что-то ему шепнул, и он медленно закивал
wait 1s
say Я знать кто вы есть, здесь польский страна.
wait 1s
say Я предлагать вам уходить, не мешать орден очищать страна от язычник
wait 1s
wecho - медленно, с расстановкой, и жутким акцентом заговорил он.
wait 1s
wecho Тевтонский рыцарь дернул поводья, и стал дальше вглядывается на восток.
~
#86105
баттл триг часового (для моба)~
0 k 80
~
mecho Град стрел и арбалетных болтов сыпется на Вас из недоступных бойниц. 
wait 1s
foreach target %self.pc%   
  if (%random.100% < 51)
    msend %target% Что-то острое пробило доспехи, и Вы почувствовали, как кровь хлынула из раны.
    eval dmg %random.70%+30
    mdamage %target.name% 60
  else 
    msend %target%  _Вы всеми способами уворачиваетесь от стрел, но долго Вам так не простоять! 
  end
done
~
#86106
репоп зона 861 тевтонский замок -1 ~
2 f 100
~
*дверь в потайном входе
wdoor   86134 west purge
wdoor   86115 east purge
calcuid droom 86134 room
detach 86100 %droom.id%
attach 86100 %droom.id%
*репоп триггера на сокровищнице
wdoor   86147 east purge
calcuid sroom 86147 room
detach 86102 %sroom.id%
attach 86102 %sroom.id%
*аттач трига к палачу
calcuid killer 86114 mob
detach 86113 %killer.id%
attach 86113 %killer.id% 
*репоп рыцарей-игроков
calcuid knight1 86109 mob 
detach 86118 %knight1.id%
detach 86115 %knight1.id%
detach 86120 %knight1.id%
detach 86116 %knight1.id%
attach 86118 %knight1.id%
attach 86115 %knight1.id%
attach 86120 %knight1.id%
attach 86116 %knight1.id%
calcuid knight2 86112 mob
detach 86118 %knight1.id%
detach 86115 %knight1.id%
detach 86117 %knight1.id%
detach 86115 %knight1.id%
attach 86118 %knight1.id%
attach 86115 %knight1.id%
attach 86117 %knight1.id%
attach 86115 %knight1.id%
* 
~
#86107
выстрел баллисты~
2 c 1
повернуть зарядить~
wait 1
if ( %cmd% == зарядить )
  %send% %actor% Баллиста уже заряжена.
  halt
end
if !%arg.contains(рычаг)%
  %send% %actor% Что вы хотите повернуть?
  halt
end
%echoaround% %actor% %actor.name% повернул%actor.g% рычаг и огромное бревно взвилось в воздух!
%send% %actor% Вы рванули рычаг баллисты и огромное бревно устремилось в воздух!
switch %random.10% 
  case 1
    exec 86109 %world.room(86126)%
  break
  case 2
    exec 86109 %world.room(86127)%
  break
  case 3
    exec 86109 %world.room(86128)%
  break
  case 4
    exec 86109 %world.room(86129)%
  break
  case 5
    exec 86109 %world.room(86130)%
  break
  case 6
    exec 86109 %world.room(86160)%
  break
  case 7
    exec 86109 %world.room(86165)%
  break
  case 8
    exec 86109 %world.room(86166)%
  break
  case 9
    exec 86109 %world.room(86158)%
  break
  case 10
    exec 86109 %world.room(86146)%
  done
  attach 86108 %self.id%
  detach 86107 %self.id%
~
#86108
зарядка баллисты~
2 c 1
повернуть зарядить~
wait 1
if ( %cmd% == повернуть )
  %send% %actor% Что толку что-то крутить на незаряженой баллисте?
  halt
end
if !%arg.contains(баллисту)%
  %send% %actor% Что вы хотите зарядить?
  halt
end
if ( %actor.str% < 23 )
  %send% %actor%  Вы попытались повернуть зарядный ворот, но не смогли даже стронуть его с места.
  %echoaround% %actor% %actor.name% попытал%actor.u% повернуть зарядный ворот баллисты, но силенок не достало.
  halt
end
if ( %actor.move% < 60 ) 
  %send% %actor% Вы попытались зарядить баллисту.
  %echoaround% %actor% %actor.name% попытал%actor.u% повернуть зарядный ворот баллисты.
  %send% %actor% Вы слишком устали - ворот вырвался из ваших рук и БОЛЬНО ударил вас!
  %echoaround% %actor% %actor.name% слишком устал%actor.g% - ворот вырвался из его рук и наградил %actor.vname% мощным ударом!
  %actor.move(-50)%
  %damage% %actor% 80
  halt
end
eval buffer %actor.move(-50)%
if ( %random.100% > 20 )
  wait 5s
  %echoaround% %actor% %actor.name% натянул%actor.g% тетиву баллисты - орудие готово к бою.
  %send% %actor% Вы натянули тетиву баллисты - орудие готово к бою!
  attach 86107 %self.id%
else
  %echo% Вы обнаружили, что заряды закончились.
end
detach 86108 %self.id%
~
#86109
попадание~
2 z 0
~
%echo% Внезапно послышался резкий свист, и со стены расположнного поблизости замка на вас обрушилось громадное бревно!
foreach victim %self.char%
  if ( %random.100% < 75 )
    eval dmg 150+%random.500%
    mdamage %vicitm% %dmg%
  end
done
~
#86110
бросили кости~
1 h 100
~
wait 1
eval val1 %random.6%
eval val2 %random.6%
oecho Кости упали и покатились.
oecho Выпало %val1% и %val2%.
~
#86111
одеваем рыцарей в антуражный шмот~
0 n 100
~
halt
wait 1
if ( (%self.realroom% > 86100) && (%self.realroom% < 86199) )
  *лоад экипировки в 861 зоне
  mload obj 86134
  mload obj 86135
  mload obj 86136
  mload obj 86137
  mload obj 86138
  mload obj 86139
  одеть все
  mload obj 86140
  mload obj 86141
  mload obj 86143
  mload obj 86144
  mload obj 86145
  одеть все
  *лоад прайма
  if (( %self.vnum% == 86105 ) || ( %self.vnum% == 86108 ))
    mload obj 86149
    воор арбалет
    wait 2
    mjunk all
    halt
  end 
  switch %random.3%
    case 1
      mload obj 86150
      воор двуруч
      wait 2
      mjunk all
      halt
    break
    case 2
      mload obj 86146
      wield меч
    break
    case 3
      mload obj 86148
      wield топор
    done
    *лоад оффа
    if ( %random.100% < 20 )
      mload obj 86142
      оде щит
    else
      mload obj 86147
      держа кинжал
    end
  else
    *лоад экипировки в 862 зоне
    mload obj 86208
    mload obj 86209
    mload obj 86210
    mload obj 86211
    mload obj 86212
    mload obj 86212
    одеть все
    mload obj 86214
    mload obj 86215
    mload obj 86217
    mload obj 86218
    mload obj 86219
    одеть все
    *лоад прайма
    if (( %self.vnum% == 86105 ) || ( %self.vnum% == 86108 ))
      mload obj 86223
      воор арбалет
      wait 2
      mjunk all
      halt
    end  
    switch %random.3%
      case 1
        mload obj 86224
        воор двуруч
        wait 2
        mjunk all
        halt
      break
      case 2
        mload obj 86220
        wield меч
      break
      case 3
        mload obj 86222
        воор топор
      done
      *лоад оффа
      if ( %random.100% < 20 )
        mload obj 86216
        оде щит
      else
        mload obj 86221
        держа кинжал
      end
    end
    *удаляем все лишние предметы
    mjunk all
~
#86112
блокирование использования антуражного шмота~
1 j 100
~
if ( %actor.vnum% == -1 )
  osend %actor% _%self.name% явно не предназн%self.g% для Вас!
  halt
end
eval lid %actor.leader%
if ( %lid.vnum% == -1 )
  %echoaround% %actor% _%actor.iname% попытался использовать %self.vname%, но у него ничего не вышло.
  return 0
  halt
end
~
#86113
вошли к палачу~
0 q 100
~
wait 1
emot заметил Вас и схватился за оружие!
detach 86113 %self.id%
~
#86114
бросили фальшивые кости~
1 h 100
~
wait 1
oecho Кости упали и покатились.
oecho Выпало 6 и 6.
~
#86115
умирает караульный~
0 f 100
~
emot захрипел, захлебываясь кровью, и опустился на одно колено
if ( %self.vnum% == 86109 )
  calcuid alter 86112 mob
else
  calcuid alter 86109 mob
end
detach 86115 %alter.id%
mecho Уже умирая, %self.name% изловчился, и нанес противнику СМЕРТЕЛЬНЫЙ удар.
eval dmg %alter.hitp%+10
mdamage %alter% %dmg%
~
#86116
рыцари играют в кости 1~
0 b 100
~
mforce gamer861n2 drop кости
wait 1s
взя кости
wait 2s
if ( !%self.haveobj(86152)% && !%self.haveobj(86131)% )
  halt
end
if %self.haveobj(86152)%
  emot внимательно осмотрел кости и вдруг грозно нахмурился
  say Donnerwetter! Du ist Swindler!!!
  ярость
  stand
  calcuid gamer 86112 mob
  detach 86117 %gamer.id%
  attac gamer861n2
  detach 86116 %self.id%
  halt
end
брос кости
wait 2
switch %random.5%
  case 1
    руг
    дать 10 кун gamer861n2
  break
  case 2
    say Himmeldonnerwetter!
    дать 20 кун gamer861n2
  break
  case 3
    say So! Herrlich!
    mforce gamer861n2 дать 20 кун gamer861n1
  break
  case 4
    хохот
    say La-la! Gluck!
    mforce gamer861n2 дать 60 кун gamer861n1
  break
  case 5
    буб
    дать 50 кун gamer861n2
  break
done
exec 86117 %world.mob(86112)%
~
#86117
рыцари играют в кости 2~
0 z 0
~
wait 2s
взя кости
if ( !%self.haveobj(86152)% && !%self.haveobj(86131)% )
  halt
end
if %self.haveobj(86152)%
  emot внимательно осмотрел кости и вдруг грозно нахмурился
  say Donnerwetter! Du ist Swindler!!!
  ярость
  stand
  calcuid gamer 86109 mob
  detach 86116 %gamer.id%
  attac gamer861n1
  detach 86117 %self.id%
  halt
end
wait 2s
брос кости
wait 2
switch %random.5%
  case 1
    emot отхлебнул чего-то из большой фляги
    взд
    дать 10 кун gamer861n1
  break
  case 2
    say Teufel!
    дать 20 кун gamer861n1
  break
  case 3
    say Hhaa!!!
    mforce gamer861n1 дать 20 кун gamer861n2
  break
  case 4
    хохот
    say La-la! Gluck!
    mforce gamer861n1 дать 60 кун gamer861n2
  break
  case 5
    say Ya?! Eiiiii...
    дать 50 кун gamer861n1
  break
done
mforce gamer861n1 взя кости
~
#86118
напали на караульных~
0 k 100
~
eval enemy %self.fighting%
if ( (%enemy.vnum% < 86109) || (%enemy.vnum%  > 86112) ) 
  mecho ___\&Y%self.iname% дико заорал, поднимая тревогу!!!\&n
  masound ___\&Y%self.iname% дико заорал, поднимая тревогу!!!\&n
  mecho Отовсюду начали сбегаться встревоженные рыцари!
  exec 86119 %world.room(86122)%
  calcuid alter 86112 mob
  calcuid alter2 86109 mob
  detach 86116 %alter.id%
  detach 86116 %alter2.id%
  detach 86117 %alter.id%
  detach 86117 %alter2.id%
  detach 86115 %self.id%
  detach 86118 %self.id%
end
~
#86119
телепорт хельперов~
2 z 0
~
wteleport helper861 86175
wteleport helper861 86175
wteleport helper861 86175
wteleport helper861 86175
wteleport helper861 86175
wteleport helper861 86175
wteleport helper861 86175
wteleport helper861 86175
wteleport helper861 86175
wteleport helper861 86175
~
#86120
одеваем молодого рыцаря~
0 n 100
~
mload obj 86134
mload obj 86135
mload obj 86136
mload obj 86137
mload obj 86138
mload obj 86139
одеть все
mload obj 86140
mload obj 86141
mload obj 86143
mload obj 86144
mload obj 86145
одеть все
*лоад прайма
mload obj 86150
воор двуруч
*удаляем все лишние предметы
mjunk all
mload obj 86131
~
#86121
телепорт хельперов в виртуалку~
2 f 100
~
wteleport helper861 86122
wteleport helper861 86122
wteleport helper861 86122
wteleport helper861 86122
wteleport helper861 86122
wteleport helper861 86122
wteleport helper861 86122
wteleport helper861 86122
wteleport helper861 86122
wteleport helper861 86122
~
#86122
блокирование лута трупов рыцарей~
1 g 100
~
*без этого триггера при перезагрузке зоны мобы лутили трупы уже убитых рыцарей -
*в результате у них получалась в инвентаре страшная гора шлемов, лат и т.п.
if ( %actor.vnum% != -1 )
  wait 1
  %purge% %self%
  wait 1
  halt
end
~
#86123
помер палач~
0 f 100
~
if !%exist.mob(86115)%
  if (%world.curobjs(86154)% < 1)
    mload obj 86154
  end
  if %exist.mob(86116)%
    calcuid plennik 86116 mob
    exec 86126 %plennik.id%
  end
end
~
#86124
помер прелат~
0 f 100
~
if !%exist.mob(86114)%
  if %exist.mob(86116)%
    calcuid plennik 86116 mob
    exec 86126 %plennik.id%
  end
  mload obj 86154
  if ( %random.100% > 69 )
    mload obj 86153
  end
end
~
#86125
читают книгу~
1 c 2
изучить~
if !%arg.contains(трактат)%
  %send% %actor% Что именно?
  return 0
  halt
end
wait 1
osend %actor% Вы начали перелистывать страницы трактата, надеясь найти что-нибудь полезное.
oechoaround %actor% %actor.iname% начал%actor.g% перелистывать трактат.
switch %actor.class%
  *тать
  case 2
    if !%actor.skill(проникающее оружие)%
      oskillturn %actor% проникающее.оружие set
    elseif (%actor.skill(проникающее оружие)% < 120)
      eval val %random.5%
      oskilladd %actor% проникающее.оружие %val%
    end
  break
  *богатырь  
  case 3
    if !%actor.skill(кулачный бой)%
      oskillturn %actor% кулачный.бой set
    elseif (%actor.skill(кулачный бой)% < 120)
      eval val %random.5%
      oskilladd %actor% кулачный.бой %val%
    end
  break 
  *наемник
  case 4
    if !%actor.skill(короткие лезвия)%
      oskillturn %actor% короткие.лезвия set
    elseif (%actor.skill(короткие лезвия)% < 120)
      eval val %random.5%
      oskilladd %actor% короткие.лезвия %val%
    end
  break
  *дружинник
  case 5
    *витязь
    case 9
      if !%actor.skill(длинные лезвия)%
        oskillturn %actor% длинные.лезвия set
      elseif (%actor.skill(длинные лезвия)% < 120)
        eval val %random.5%
        mskilladd %actor% длинные.лезвия %val%
      end
    break
  break
  *охотник
  case 10
    if !%actor.skill(луки)%
      oskillturn %actor% луки set
    elseif (%actor.skill(луки)% < 120)
      eval val %random.5%
      oskilladd %actor% луки %val%
    end
  break 
  *кузнец
  case 11
    if !%actor.skill(топоры)%
      oskillturn %actor% топоры set
    elseif (%actor.skill(топоры)% < 120)
      eval val %random.5%
      oskilladd %actor% топоры %val%
    end
  break
  *купец
  case 12
    if !%actor.skill(копья и пики)%
      oskillturn %actor% копья.и.пики set
    elseif (%actor.skill(копья и пики)% < 120)
      eval val %random.5%
      oskilladd %actor% копья.и.пики %val%
    end
  break  
  *волхв
  case 13
    if !%actor.skill(посохи и дубины)%
      oskillturn %actor% посохи.и.дубины set
    elseif (%actor.skill(посохи и дубины)% < 120)
      eval val %random.5%
      oskilladd %actor% посохи.и.дубины %val%
    end
  break
  default
    %send% %actor% Вы так и не сумели что-либо прочесть - видно ума маловато.
  break
done
osend %actor% Вы с изумлением увидели, как книга вдруг вспыхнула и сгорела.
wait 1
%purge% %self%
~
#86126
триг на пленнике~
0 z 0
~
wait 3s
emot застонал и приоткрыл глаза
%echo% Взгляд старика медлнно прошелся по темнице, видимо он не сразу понял, что видит.
wait 1s
emot вздрогнул и посмотрел на вас
say Вы убили этих.. этих нехристей?
кашель
wait 4 
say Кто бы вы ни были.. благодарю вас.. Но уже слищком поздно
emot снова застонал и по его подбородку потекла кровь
wait 2 
say Спасите хотя бы тех, кого схватили вместе со мной. Они где-то здесь, в подземельях...
say Сними с меня нательный крест - все равно ироды поганые сорвут... покажи его...
кашель
wait 2
calcuid serg 86118 mob 
attach 86127 %serg.id%
mload obj 86155
emot вдруг страшно захрипел и задергался
eval room1 %self.realroom%
exec 86135 %room1.id%
*eval dmg %self.hitp%+11
*mdamage %self% %dmg%
~
#86127
дали крестик послушнику~
0 j 100
~
wait 1
if ( %object.vnum% != 86155 )
  emot слегка недоуменно посмотрел на вас, затем быстро шмыгнул за дверь и был таков
  wait 1
  calcuid krest 86155 obj
  %purge% %krest%
  %purge% %self%
end
emot бросил на крестик короткий взгляд и повернулся к вам
say Это нательный крест настоятеля Анохия
say Раз он у вас, значит его уже, верно, нет в живых
say Расскажите - что с ним случилось?
wait 5s
emot выслушав ваш рассказ, юноша вздохнул и низко наклонил голову. 
%echo% Вам показалось, что он шепчет молитву.
wait 2s
say Настоятель не успел сказать, как мы попались к ним в лапы
say Три года назад, когда орден вторгся сюда, неподалеку отсюда стоял
%echo% - наш монастырь. Рыцари начали разорять страну, грабить 
%echo% - и убивать. Мы бежали, схватив лишь то, что удалось унести в руках и
%echo% - подожгли перед уходом обитель, чтоб не досталась нехристям.
wait 2
say Но икону Божьей матери и монастырскую казну мы унести не сумели, и укрыли 
%echo% - все в тайнике. Лишь теперь сумели вернуться сюда за святыней - и повстречали
%echo% - разъезд латынян... Остальное ты знаешь - воины схватили меня, настоятеля и кого-то
%echo% - из монахов и привели сюда.
wait 5
say Помоги мне выбраться из их владений и отыскать тайник.
say Может быть, его еще не разграбили - и тогда я смогу наградить тебя за помощь.
wait 1
%purge% %object%
follow %actor.name%
mtransform 86120
detach 86127 %self.id%
~
#86128
убили слугу-мошенника~
0 f 100
~
mload obj 86152
~
#86129
слуга играет в кости~
0 ab 18
~
wait 1
emot взял игральные кости
wait 2
emot бросил игральные кости
%echo% Кости упали и покатились.
wait 1
switch %random.6%
  case 1
    %echo% Выпало 6 и 6.
    хих
  break
  case 2
    %echo% Выпало 6 и 6
    рад
  break
  case 3
    %echo% выпало 6 и 2
    хмур
    emot взял кости и принялся зачем-то ковырять их щепкой
  break
  case 4
    %echo% выпало 6 и 6
    хваст
  break
  case 5
    %echo% выпало 6 и 4
    рыч
    emot схватил кости и с силой потряс их в руке
    case 6
      %echo% выпало 6 и 6
      пальц
    done
~
#86130
кто-то видимый зашел к слуге~
0 q 100
~
wait 1
emot заметил вас и заполошенно заорал
встать
emot запаниковал и попытался сбежать!
emot сбежал вверх
%purge% %self%
~
#86131
заходят в госпиталь к рыцарю~
0 q 30
~
emot застонал
say О, майн готт, подлые язычники!
say Разиве можно благородный рыцарь бить оглобля по голова!
emot снова застонал и тихонько выругался
~
#86132
послушника привели в развалины или вывели из зоны~
0 t 100
~
wait 1
if (( %self.realroom% < 86100 ) || (%self.realroom% > 86299))
  say Куда-то мы не туда идем... Поищу-ка я сам дорогу.
  emot ушел на восток
  wait 1
  %purge% %self%
end
if ( %self.realroom% ==  86120)
  emot внимательно огляделся по сторонам
  след я
  кив
  say Это здесь...
  emot еще раз огляделся, отошел в сторону и принялся разгребать кучу битого камня
  wait 2s
  emot поднатужился, пытаясь вывернуть из остатков пола массивную плиту
  %echo% ...Вы подумали, что бедняга сейчас надорвется, и уже хотели поспешить на помощь...
  emot неожиданно легко вывернул плиту и под ней открылась пустота
  wait 1s
  emot достал несколько предметов из тайника
  emot бережно извлек на свет икону и стал заворачивать ее в кусок чистого навощеного полотна
  eval char %random.pc%
  if (%random.1000% <= 45)
    mload obj 103
    дать чекуш %char.name%
  end
  if (( %random.1000% <= 100 ) && ( %world.curobjs(578)% < 1 ))
    *место под лоад буки !групповое освящение! после перекладывания
    *if (( %random.100% < 11 ) && ( %world.curobjs(545)% < 1 )) 
    *mload obj 545
    mload obj 580
    дать книг %char.name%
  else
    eval buf %self.gold(+10000)%
    дать 10000 кун .%char.name%
  end
  wait 2
  поклон
  say Благодарю за спасение жизни моей, а более того за спасение святыни
  say теперь мне дорога дальняя - на остров Валаам... прощайте!
  emot быстро удалился
  %purge% %self%
end
~
#86133
не даем пройти мимо караульных~
2 e 100
~
if ( %direction% != west )
  return 1
  halt
end
if ( %exist.mob(86109)% && %exist.mob(86109)% )
  return 0
  %send% %actor% Караульный преградил вам дорогу.
end
~
#86134
напали на слугу~
0 l 100
~
detach 86129 %self.id%
detach 86134 %self.id%
~
#86135
смерть пленника~
2 z 0
~
calcuid target 86116 mob
eval val %target.hitp%+11
wdamage %target% %val%
~
$~
