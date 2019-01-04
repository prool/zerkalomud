#14200
лоад пирата~
0 n 100
~
if (%world.curobjs(14200)% < 10) && (%random.5% == 1)
  mload obj 14200
end
воор сабля
if (%world.curobjs(14202)% < 10) && (%random.5% == 1)
  mload obj 14202
end
од перст
~
#14201
лоад абориген~
0 n 100
~
if (%world.curobjs(14201)% < 10) && (%random.5% == 1)
  mload obj 14201
end
од повязка
~
#14202
плыть остров~
2 c 100
плыть~
if !%actor.rentable%
  return 0
  halt
end
if !(%arg.contains(остров)%) 
  wsend %actor% Куда это Вы хотите плыть???
  return 0
  halt
end
wsend %actor.name% _Вы встали за штурвал.
wechoaround %actor% %actor.name% встал%actor.g% за штурвал.
wait 3
wecho _Ладья тронулась и поплыла в открытое море.
wteleport all 14250
calcuid more 14250 room
attach 14203 %more.id%
exec 14203 %more.id%
detach 14202 %self.id%
end
~
#14203
на море~
2 z 100
~
wait 1s
wecho _Вы в открытом море, какая красота!
wecho _А ладья Вас несет и несет!
wteleport all 14251
calcuid more1 14251 room
attach 14204 %more1.id%
exec 14204 %more1.id%
detach 14203 %more.id%
end
~
#14204
около острова~
2 z 100
~
wait 1s
wecho  Впереди Вы видите чудо остров.
calcuid more2 14208 room
wteleport all 14208
attach 14205 %more2.id%
exec 14205 %more2.id%
detach 14203 %more1.id%
end
~
#14205
на острове~
2 z 100
~
wait 1s
wecho Вы очутились на чудо острове!
detach 14205 %more2.id%
calcuid message 14205 room
attach 14207 %message.id%
attach 14208 %message.id%
end
~
#14206
резет зоны~
2 f 100
~
attach 14202 %self.id%
~
#14207
пробуют плыть на остров после отправления корабля~
2 c 100
плыть~
if !(%arg.contains(остров)%)
  wsend %actor% Куда это Вы хотите плыть???
  return 0
  halt
end
wait 5
wecho Видно корабль уже отошел...
~
#14208
резет зоны~
2 f 100
~
calcuid message 14205 room
detach 14207 %message.id%
detach 14208 %message.id%
~
$~
