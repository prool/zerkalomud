#5100
лестница ~
1 c 4
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
2 f 100
ресет~
if %world.curobjs(5105)% > 0 || %room.up%
  wdoor 5104 up purge
  wecho Лестница пошатнулась и упала на пол.
  calcuid target 5105 obj
  wpurge %target%
end
~
#5102
открсундук~
1 o 100
открсундук~
wait 1
oecho Маленький ключ рассыпался в руках.
switch %random.5%
  case 1
    if %world.curobjs(517)% < 1
      osend %actor% Нагнувшись, чтобы отпереть сундук, вы заметили рядом странный 
      osend %actor% предмет - это обледеневшая пластина
      oechoaround %actor.name% нашел обледеневшую табличку.
      oload obj 517
    end
  break
  case 2
    if %world.curobjs(1730)% < 1
      osend %actor% Нагнувшись, чтобы отпереть сундук, вы заметили рядом странный 
      osend %actor% предмет - это какая-то старая книга.
      oechoaround %actor.name% нашел в пыли старую книгу.
      oload obj 1730
    end
  break
done
calcuid target 5103 obj
opurge %target%
~
#5113
Незахотели давать денег ефимию~
0 d 0
нет~
say My trigger commandlist is not complete!
~
#5114
Белый паук рип~
0 f 100
~
mload obj 5103
~
$~
