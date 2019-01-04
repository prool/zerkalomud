#12500
енот встречает ~
0 r 100
~
if (%actor.clan% == лз)
  wait 1s
  msend %actor% _Большой барсук обнюхал Вас...
  mechoaround %actor% _Признав своего, барсук ласково ткнулся в ладони %actor.rname% и стал выпрашивать сладкое...
else
  switch %random.3%
    case 3
      рыч %actor.name%  
    break
    case 2
      дум %actor.name%  
    break
    default
      msend %actor% _Большой барсук сердито зарычал на Вас.
      mechoaround %actor% _Большой барсук зарычал на %actor.vname%. Похоже кому-то придеться стирать штаны.
    done
  end
~
#12501
дикей кланшмота~
1 j 100
~
if %actor.clan% == лз
  halt
end
osend %actor% Внезапно поднялся сильный ветер и духи леса вырвали %self.vname% из ваших рук.
wait 1
opurge %self%
~
#12502
выдача клан-шмота~
0 d 3
одеться бы~
wait 1
if %actor.vnum% != -1
  halt
end 
say Эх, молодежь, горит она на вас что ли? Сейчас-сечас...
wait 1
if %actor.bank% < 580
  взд
  say А денег-то у тебя и нет... Иди отсюда и не возвращайся пока не заработаешь.
  halt
end
eval buffer %actor.bank(-580)%
mload obj 12500
mload obj 12501
mload obj 12502
mload obj 12503
mload obj 12504
mload obj 12505
mload obj 12506
mload obj 12507
mload obj 12508
mload obj 12509
mload obj 12510
put all меш
say Смотри с одежей поаккуратнее будь 
give all .%actor.name%
drop all
wait 1
say Оружие сам%actor.g% себе купишь - не маленк%actor.w% уже.
~
#12503
попугай орет~
0 c 1
выдернуть вырвать дернуть~
if !(%arg.contains(перо)%) 
  msend       %actor% Что вы желаете вырвать?
  return 0
  halt
end
if (%actor.clan% != лз)
  msend %actor% Стоило вам протянуть руку, как попугай БОЛЬНО клюнул вас.
  halt
end
switch %random.4%
  case 4
    msend %actor% _Почуяв неладное, попугай захлопал крыльями и улетел в соседнюю комнату.
    mechoaround %actor% _При виде %actor.name% заморская птица взвилась под потолок и улетела в соседнюю комнату.
    wait 1s 
    юг
    wait 1s
    север
    wait 1s
    запад
    wait 1s
    восток
    halt
  break
  case 3
    msend %actor% _Почуяв неладное, попугай захлопал крыльями и заорал благим матом
    mechoaround %actor% _При виде %actor.name% заморская птица взвилась под потолок и заорала на весь дом.
    wait 1s 
    кричать Помогите, хулиганы перьев лишают!
    мат
    halt
  break
  case 2
    msend %actor% _При виде Вас попугай щелкнул клювом и недобро повел глазами.
    mechoaround %actor% _Увидев %actor.name% заморская птица сверкнула глазами. Похоже намечается потасовка.
    wait 1s 
    говор Протянешь руки - будешь без пальцев. Зад и так голый, а у меня сегодня свидание.
    плюнуть %actor.name% 
    halt
  break
done
msend %actor% _Вы выдернули цветное перо из хвоста попугая.
mechoaround %actor% _%actor.name% выдернул%actor.g% перо из хвоста попугая.
wait 1s
кричать ЛЗ, ПО ДУПЛАМ!
мат
wait 1s
if (%world.curobjs(12523)% < 100)
  mecho _У вас в руках оказалось разноцветное перо.
  mload obj 12523
  брос перо
  mecho _Попугай обиженно захлопал крыльями и взлетел под потолок.
end
~
#12504
вызываем духа~
1 c 2
дыхнуть~
wait 1
if !%arg.contains(колечко)%
  osend %actor% Что это вы так тяжко вздыхаете?
  halt
end
osend %actor% Вы согрели своим дыханием узорчатое дерево.
if %actor.clan% != лз
  halt
end
if %world.curmobs(12508)% > 50
  osend %actor% ...и ничего не произошло!
  halt
end
oechoaround %actor% %actor.name% аккуратно дунул%actor.g% на деревянное колечко.
oload mob 12508
oecho Земля под ногами вдруг вспучилась, и какое-то оргромное животное вылезло из свежей норы.
oforce %actor% оседлать барсук
wait 1
opurge %self%
~
#12505
убираем коня~
0 c 1
отослать~
wait 1
if %self.fighting%
  halt
end
if !%arg.contains(барсук)%
  msend %actor%  О чем вы больше не хотите вспоминать?
  halt
end
if (%actor.clan% != лз) || (%actor% != %self.leader%)
  msend %actor% Это не Ваш барсук!
  halt
end
mecho Барсук подозрительно принюхался, обиженно фыркнул и ушел.
mload obj 12510
give колечко .%actor.name%
wait 1
mpurge %self%
~
#12506
Выдача амулетов у офени~
0 m 100
~
wait 1
if %amount% < 400
  wait 2
  say Гм, за такие деньги просить защиты грех!
  give %amount% кун .%actor.name%
  halt
end
if %world.curobjs(12520)% >= 200
  wait 2
  say Нет ничего - все распродал.
  give %amount% кун .%actor.name%
  halt
end
wait 2
say Вот, возьми
mload obj 12520
give оберег .%actor.name%
~
#12507
выдача амулетов у лекаря~
0 m 100
~
wait 1
if %amount% < 400
  wait 2
  say Вот ты какой жадный.
  give %amount% кун .%actor.name%
  halt
end
if %world.curobjs(12521)% >= 200
  wait 2
  say А нету ничего - все раздала
  give %amount% кун .%actor.name%
  halt
end
wait 2
say Возьми, будет тебе от богов удача.
mload obj 12521
give оберег .%actor.name%
~
#12508
выдача амулетов у песенницы~
0 m 100
~
wait 1
if %amount% < 400
  wait 2
  say Маловато будет!
  give %amount% кун .%actor.name%
  halt
end
if %world.curobjs(12522)% >= 200
  wait 2
  say Нету оберегов, кончились!
  give %amount% кун .%actor.name%
  halt
end
wait 2
say Вот, он сохранит тебя в бою
mload obj 12522
give оберег .%actor.name%
~
#12509
попугай летает~
0 c 100
~
eval popugaj %random.4%
if %popugaj% == 3
  msend _Почуяв неладное, попугай захлопал крыльями и улетел в соседнюю комнату.
  mechoaround _При виде %actor.name% заморская птица взвилась под потолок и улетела в соседнюю комнату.
  wait 1s 
  юг
  wait 1s
  север
  wait 1s
  запад
  wait 1s
  восток
elseif %popugaj% == 2
  msend _Почуяв неладное, попугай захлопал крыльями и заорал благим матом
  mechoaround _При виде %actor.name% заморская птица взвилась под потолок и заорала на весь дом.
  wait 1s 
  кричать Помогите, хулиганы перьев лишают!
  мат
elseif %popugaj% == 1
  msend _При виде Вас попугай щелкнул клювом и недобро повел глазами.
  mechoaround _Увидев %actor.name% заморская птица сверкнула глазами. Похоже намечается потасовка.
  wait 1s 
  говор Протянешь руки - будешь без пальцев.  Зад и так голый, а у меня сегодня свидание.
  плюнуть %actor.name% 
else вздох
end
~
#12510
лезем по веревке~
2 c 1
лезть спуститься карабкаться~
if !%arg.contains(веревка)%
  wsend %actor% Куда лезем?
  halt
end
wechoaround %actor% %actor.name% быстро соскользнул%actor.g% по веревке.
wteleport %actor% 12522
wechoaround %actor% %actor.name% спустил%actor.y% по веревке сверху.
wsend %actor% Вы быстро спустились вниз
~
#12511
лезем вверх~
2 c 1
лезть карабкаться~
if (!%arg.contains(вверх)% && !%arg.contains(веревка)%)
  wsend %actor% Куда лезем?
  halt
end
wechoaround %actor% %actor.name% перебирая руками полез%actor.y% на дерево.
wteleport %actor% 12511 
wechoaround %actor% %actor.name% пыхтя выполз%actor.y% на площадку.
wsend %actor% Вы начали карабкаться по веревке вверх
~
$~
