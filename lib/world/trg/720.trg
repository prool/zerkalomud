#72000
платный телепорт~
0 m 1
~
wait 1
emot пересчитал%self.g% куны
eval target 0
switch %amount%
  *русса
  case 2500
    eval target 35010
  break
  * ВН
  case 3500
    eval target 60016
  break
  default
    say И чего же ты хочешь?
    give %amount% кун .%actor.name%
    halt
  done
  кив
  emot сделал%self.g% загадочные пассы руками
  mechoaround %actor% %actor.name% исчез%actor.q% в клубах дыма.
  msend %actor% У вас закружилась голова, и на миг вы потеряли сознание...
  msend %actor%
  mteleport %actor% %target% horse
  mechoaround %actor% %actor.name% появил%actor.u% здесь в клубах дыма.
~
$~
