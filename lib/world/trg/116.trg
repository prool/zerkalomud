#11600
Лесничий ругается~
0 q 100
~
wait 1
stand
switch %random.2%
  case 1
    say Ах, ты сучий потрох! В княжеском лесу браконьерить вздумал%actor.g%!?!
    say Ну дык получи на орехи!
    уби .%actor.name%
  break
  default
    ___say Ага, браконьеришь! Ну вот я сейчас тебе задам!
    уби .%actor.name%
  break
done
~
#11601
убили куницу~
0 f 20
~
if %world.curobjs(11600)% < 50
  mload obj 11600
end
~
$~
