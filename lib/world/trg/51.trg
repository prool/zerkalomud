* BRusMUD trigger file v1.0
#5100
лестница ~
1 c0 4
приставить~
if %arg.contains(лестниц)%
odoor 5104 up room 5117
osend %actor.name% Поднатужившись, вы приставили лестницу и теперь можно подняться наверх.
oechoaround %actor% %actor.name% приставил лестницу и теперь можно подняться наверх.
oload obj 5105
calcuid target 5104 obj
opurge %target%
else
oecho Чаво ?
  halt
end

~
#5101
ресет ~
2 f0 100
ресет~
wecho ooo %room.up% ooo
if %world.curobjs(5105)% > 0 || %room.up% == up
wdoor 5104 up purge
wecho Лестница пошатнулась и упала на пол.
calcuid target 5105 obj
wpurge %target%
end

~
#5102
открсундук~
1 o0 100
открсундук~
wait 1
oecho Маленький ключ рассыпался в руках.
if %world.curobjs(517)% < 1 && %random.5%==1
osend %actor% Нагнувшись, чтобы отпереть сундук, вы заметили рядом странный 
osend %actor% предмет - это обледеневшая пластина
oechoaround %actor.name% нашел обледеневшую табличку.
oload obj 517
end
calcuid target 5103 obj
opurge %target%

~
$
$
