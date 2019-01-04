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
$~
