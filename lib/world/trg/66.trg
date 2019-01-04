* BRusMUD trigger file v1.0
#6600
умер огородник~
0 f0 100
~
if (%world.curobjs(6600)% < 50) && (%random.5% == 1)
   mload obj 6600
elseif (%world.curobjs(6601)% < 10) && (%random.5% == 1)
   mload obj 6601
elseif (%world.curobjs(6602)% < 10) && (%random.5% == 1)
   mload obj 6602
end

~
#6601
умер сторож~
0 f0 100
~
if (%world.curobjs(6603)% < 10) && (%random.5% == 1)
   mload obj 6603
end



~
$
$
