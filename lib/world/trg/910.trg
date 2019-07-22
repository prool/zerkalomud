#91000
<910 - Obida killed>~
0 f 100
~
if (%world.curobjs(91004)% < 4) && (%random.20% <= 5)
  mload obj 91004
end               
~
#91001
<910 - Usinya killed>~
0 f 100
~
if (%world.curobjs(91020)% < 4) && (%random.20% <= 5)
  mload obj 91020
end               
~
#91002
<910 - Three-headed zmey killed>~
0 f 100
~
if (%world.curobjs(91013)% < 4) && (%random.20% <= 5)
  mload obj 91013
elseif (%world.curobjs(91008)% < 4) && (%random.20% <= 5)
  mload obj 91008
elseif (%world.curobjs(91007)% < 4) && (%random.20% <= 5)
  mload obj 91007
elseif (%world.curobjs(91006)% < 4) && (%random.20% <= 5)
  mload obj 91006
elseif (%world.curobjs(91003)% < 4) && (%random.20% <= 5)
  mload obj 91003
end               
~
#91003
<910 - Two-headed zmey killed>~
0 f 100
~
if (%world.curobjs(91005)% < 4) && (%random.20% <= 5)
  mload obj 91005
end               
~
#91004
<910 - Usinya keeper killed>~
0 f 100
~
if (%world.curobjs(91019)% < 2) && (%random.20% <= 5)
  mload obj 91019
end               
~
#91005
<910 - Zmey killed>~
0 f 100
~
if (%world.curobjs(91014)% < 4) && (%random.20% <= 5)
  mload obj 91014
end               
~
#91006
<910 - Lebed killed>~
0 f 100
~
if (%world.curobjs(91018)% < 4) && (%random.20% <= 5)
  mload obj 91018
end
~
#91007
<910 - PC's enter to uzkiy karniz>~
2 g 100
~
wait  1
set   pc %self.people%
while %pc%
  if %pc.vnum% == -1
  break
end
set pc %pc.next_in_room%
done
if !%pc%
  halt
end
wait 10s
set   pc   %self.people%
set   used 0
while %pc%
  if %pc.vnum% == -1
    if !%used%
      wecho Карниз с грохотом оборвался...
    end
    set used  %pc%
    wteleport %pc% 91052
    set pc %used%
  end
  set pc %pc.next_in_room%
done
if %used%
  detach 91007 %self.id%
end
~
#91008
<910 - PC's command SEARCH TREE>~
2 c 0
раздвинуть развести~
if %actor.vnum% != -1
  halt
end
if !%arg.contains(ветв)% && !%arg.contains(ветк)%
  return 0
  halt
end
if !%world.gameobj(91000)%
  wait   1
  wload obj 91000
  wechoaround %actor% %actor.name% раздвинул%actor.g% ветви кипариса...
  wsend %actor% Вы раздвинули ветви кипариса.
  wsend %actor% На свет появилась темная чаша, наполненная ледяной водой.
else
  return 1
end
detach 91008 %self.id%

~
#91010
<910 - Start zone - resets triggers>~
2 f 100
~
%echo% RESET!!!
calcuid room 91043 room
attach  91007 %room.id%
calcuid room 91047 room
attach  91008 %room.id%
~
$~
