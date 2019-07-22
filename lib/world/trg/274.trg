#27400
входвловушку~
2 e 20
ловушка~
wait 1
wteleport %actor% 27400 horse
wsend %actor.name% Вы с криком ужаса провалились в ловушку, искуссно спрятанную на дороге.
if %actor.sex%==1
  wechoaround %actor% %actor.name% с криком ужаса провалился в ловушку.
  wat 27400 wechoaround %actor% %actor.name% свалился сверху в ловушку.
else
  wechoaround %actor% %actor.name% с криком ужаса провалилась в ловушку.
  wat 27400 wechoaround %actor% %actor.name% свалилась сверху в ловушку.
end
wsend %actor.name% При падении вы сильно ударились.
wsend %actor.name% Надо было наверное поискать другой путь.
wdamage %actor.name% 100
~
#27401
лезтьдерево1~
2 c 0
идти лезть~
if (%arg.contains(дерев)%)
  if %actor.fighting%
    wsend %actor% Какие деревья?! С противником разберитесь сначала.
    halt
  end
  wechoaround %actor% %actor.name% аккуратно прош%actor.y% по дереву.
  wteleport %actor% 27466 horse
  wat 27466 wechoaround %actor% %actor.name% приш%actor.y% по дереву с востока.
  wsend %actor% Вы аккуратно прошли по дереву на запад.
else
  return 0
end
~
#27402
лезтьдерево2~
2 c 0
идти лезть~
if (%arg.contains(дерев)%)
  if %actor.fighting%
    wsend %actor% Какие деревья?! С противником разберитесь сначала.
    halt
  end
  wechoaround %actor% %actor.name% аккуратно прош%actor.y% по дереву.
  wteleport %actor% 27402 horse
  wat 27402 wechoaround %actor% %actor.name% приш%actor.y% по дереву с запада.
  wsend %actor% Вы аккуратно прошли по дереву на восток.
else
  return 0
end
~
#27403
смертьгорбуна~
0 f 100
~
if (%world.curobjs(554)%==0) and (%random.10%==1)
  mload obj 554
end
~
#27404
лезть корни~
2 c 0
лезть~
if (%arg.contains(корн)%)
  wechoaround %actor% %actor.name% аккуратно полез%actor.q% по корням вверх.
  wteleport %actor% 27483
  wechoaround %actor% %actor.name% вылез%actor.q% по корням с оврага.
  wsend %actor% Вы начали подниматься по корням вверх.
else
  return 0
end
~
#27498
дать20старику~
0 m 1
~
if %actor.vnum% != -1
  halt
end
eval needgold %actor.level%*(%actor.remort%+1)
if %amount% < %needgold%
  дать %amount% кун .%actor.name%
  tell %actor.name% Маловато будет!
else
  mecho Старик крикнул: 'Внучек, поди сюда, отведи мил человека к Киеву.'
  wait 5
  mecho Откуда-то вдруг появился отрок в крепкой кожаной одежде,
  mecho в которой удобно ходить по лесу.
  tell %actor.name% Не беспокойся, доведет в целости и сохранности!
  tell %actor.name% Можешь фамилию нашу запомнить, так, на память.
  tell %actor.name% Сусанины мы. Вот Иван тебя отведет к Киеву.
  wait 2
  msend %actor% Отрок махнул рукой, указывая следовать за ним, и скрылся в кустах.
  mechoaround %actor% Отрок махнул %actor.dname% рукой, указывая следовать за ним, и скрылся в кустах.
  mechoaround %actor% %actor.name% уш%actor.y% за отроком в лесную чащу.
  mteleport %actor% 33698 horse
  wait 3
  msend %actor% Отрок вывел Вас на какую-то поляну.
  msend %actor% Отрок сказал: 'Все, я свое дело сделал, бывай!'
end
~
#27499
встречастарик~
0 r 100
~
tell %actor.name% Привет, добр человек!
tell %actor.name% Не заплутал%actor.g%? А то могу проводить тебя к славному городу Киеву.
tell %actor.name% Конечно не я, а мой внучек, но он хорошо знает обходные дороги.
eval needgold %actor.level%*(%actor.remort%+1)
tell %actor.name% Но не даром конечно, кун %needgold% нам на пропитанье и ты там!
tell %actor.name% Сам%actor.g% не дойдешь, поверь моим старым костям.
~
$~
