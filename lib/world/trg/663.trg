#66300
Приветствие старика~
0 q 100
~
wait 1
г Здравствуй!
г Охотиться в этом лесу опасно. Можеш заплутать и сгинуть в болотах.
г А коли не боишься, то приноси мне добытые шкуры.
г Я отблагодарю.
~
#66301
Старик вознаграждает~
0 j 100
~
wait 1
if %object.vnum% == 66300
  mpurge %object%
  wait 8
  say Ну чтож. В хозяйстве пригодится.
  wait 8
  say Держи свою награду.
  wait 8
  %self.gold(+100)%
  дать 100 кун %actor.name%
end
wait 1
if %object.vnum% == 66301
  mpurge %object%
  wait 8
  say Ну чтож. В хозяйстве пригодится.
  wait 8
  say Держи свою награду.
  wait 8
  %self.gold(+140)%
  дать 140 кун %actor.name%
end
wait 1
if %object.vnum% == 66302
  mpurge %object%
  wait 8
  say Ну чтож. В хозяйстве пригодится.
  wait 8
  say Держи свою награду.
  wait 8
  %self.gold(+200)%
  дать 200 кун %actor.name%
end
wait 1
if %object.vnum% == 66303
  mpurge %object%
  wait 8
  say Ну чтож. В хозяйстве пригодится.
  wait 8
  say Держи свою награду.
  wait 8
  %self.gold(+260)%
  дать 260 кун %actor.name%
end
wait 1
if %object.vnum% == 66304
  mpurge %object%
  wait 8
  say Ну чтож. В хозяйстве пригодится.
  wait 8
  say Держи свою награду.
  wait 8
  %self.gold(+500)%
  дать 500 кун %actor.name%
end
wait 1
if %object.vnum% == 66305
  mpurge %object%
  wait 8
  say Ух! Какая огромная черная игла.
  wait 8
  say Видать болотного призрака убил.
  wait 8
  say Спасибо тебе за доброе дело!
  wait 8
  if (%actor.level%>10) 
    mecho Старик лесовик заточил иглу и закрепил в рукоятке с кожаной петлей.
    wait 8
    mload obj 66306
    дать черная %actor.name%
  else
    mecho Старик лесовик стал точить иглу и сломал ее. Вот неудача!
  end
end
~
#66302
убили зайца~
0 f 100
~
if (%world.curobjs(66300)% < 30) && (%random.10% <= 5)
  mload obj 66300
end
~
#66303
убили оленя~
0 f 100
~
if (%world.curobjs(66301)% < 30) && (%random.10% <= 5)
  mload obj 66301
end
~
#66304
убили лисенка~
0 f 100
~
if (%world.curobjs(66302)% < 30) && (%random.10% <= 5)
  mload obj 66302
end
~
#66305
убили волка~
0 f 100
~
if (%world.curobjs(66303)% < 30) && (%random.10% <= 5)
  mload obj 66303
end
~
#66306
убили медведя~
0 f 100
~
if (%world.curobjs(66304)% < 30) && (%random.10% <= 5)
  mload obj 66304
end
~
#66307
убили призрака~
0 f 100
~
if (%world.curobjs(66305)% < 10) && (%random.10% <= 5)
  mload obj 66305
end
~
#66308
Лезем в щель~
2 c 100
пролезть~
if !(%arg.contains(щель)%)
  wsend       %actor% Куда это Вы хотите пролезть ?
  return 0
  halt
end
if (%actor.move%>50) && (%actor.level%>10) 
  wsend       %actor% Вы полезли в узкую щель. Ох и тяжело же тут ползти.
  wait 2s
  %actor.move(-100)%
  wsend %actor% Вы тихо вылезли в маленькую пещерку.
  wteleport %actor.name% 66347
else
  wsend %actor% У Вас не хватит сил для этого.
  return 0
end
~
#66309
Лезем из щели~
2 c 100
пролезть~
if !(%arg.contains(щель)%)
  wsend       %actor% Куда это Вы хотите пролезть ?
  return 0
  halt
end
if (%actor.move%>50) && (%actor.level%>10) 
  wsend       %actor% Вы полезли в узкую щель. Ох и тяжело же тут ползти.
  wait 2s
  %actor.move(-100)%
  wsend %actor% Вы тихо вылезли наружу.
  wteleport %actor.name% 66346
else
  wsend %actor% У Вас не хватит сил для этого.
  return 0
end
~
$~
