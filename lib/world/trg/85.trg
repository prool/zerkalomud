#8500
лезем на верхушку дуба~
2 c 0
лезть карабкаться забраться~
wait 1
if !%arg.contains(дуб)%
  wsend    %actor% Куда Вы лезть-то собрались?
  halt
end
wsend %actor% Вы начали карабкаться вверх по дереву.
wechoaround %actor% %actor.name% начал%actor.g% карабкаться вверх по дереву.
wait 1s
if %actor.rentable%
  wteleport %actor% 8591 horse     
  wait 1
  wsend %pc% _Вы вскарабкались на верхушку дуба.
  wechoaround %actor% %actor.name% залез%actor.g% на верхушку дуба.
end 
end
~
#8501
спрыгиваем~
2 c 0
прыгнуть спрыгнуть~
wait 1
if !%arg.contains(вниз)%
  wsend    %actor% Определитесь, куда прыгать-то собрались?
  halt
end
wsend %actor% Набравшись смелости, Вы спрыгнули с дуба и приземлились на пятую точку.
wechoaround %actor% %actor.name% спрыгнул%actor.g% с дуба, чуть не сбив Вас с ног.
wait 1
wteleport %actor% 8571 horse     
~
#8502
дуб валим~
2 c 1
рубить валить пилить~
wait 1
if !%arg.contains(дерево)%
  wsend %actor% Что Вы собираетесь уничтожать?
  halt
end
wsend %actor% Вы собрались, чего бы то ни стоило, повалить дерево.
wechoaround %actor% %actor.name% начал%actor.g% придумывать подходящий способ повалить дуб.
wait 1s
wecho __В листве кто-то зашевелился. Сверху на Вас рухнула ошалелая белка.
wload mob 8503
calcuid target 8503 mob
wforce %target% kill .%actor.name%
detach 8502 %self.id%
~
#8503
мужик трепется~
0 q 100
~
wait 5
switch %random.4%
  case 1
    эмо осмотрел Вас и захихикал.
    say И куда это ты в таких шмотках?
  break
  case 2
    say Помоги-ка деревце выбрать да вырубить
    ул
  break
  case 3
    выть
    say и де я? и де я нахожусь?
  break
  case 4
    say Хату новую хочу, чтоб всем завидно было. Надо бы деревце увалить.
    морщ
  break
done
~
#8504
Паромщик называет цену~
0 q 100
~
wait 1
if %self.fighting%
  halt
end
say Поздорову будь. 
say Переправиться хочешь? Это можно.
set j 0
set needgold 30
foreach target %self.pc%
  eval needgold %needgold%+%target.level%*(%target.remort%+1)
  eval j %j%+1
done
if %j% > 1
  say За переправу с вас всех станет...
else 
  say За переправу с тебя будет...
end
mecho Паромщик оценивающе осмотрел вас с ног до головы.
wait 2
say ...%needgold% кун ровно, а коли вплавь - то бесплатно.
ухм
~
#8505
Дали денег паромщику.~
0 m 1
~
wait 1
if %self.fighting%
  рыч
  say Не до тебя сейчас, пш%actor.q% вон!
  halt
end
set needgold 30
foreach target %self.pc%
  eval needgold %needgold%+%target.level%*(%target.remort%+1)
done
mecho Паромщик пересчитал монеты.
wait 1s
if %amount% < %needgold%
  хмур
  say Сказано же - %needgold% кун! И ни куной меньше.
  give %amount% кун .%actor.name%
  halt
end
emot согласно кивнул
wait 1
mecho Паромщик окликнул помощника, и они вместе навалились на ворот.
mecho Паром с плеском и скрипом отвалил от причала.
mdoor 8512 south purge
mdoor 8511 north purge
wait 4s
mecho Паром покачивается на волнах Тверцы.
wait 4s
mecho Уже показались городские пристани.
wait 4s
mecho Паром с деревянным стуком ткнулся в причал.
mdoor 8512 south room 24007
mdoor 24007 north room 8512
wait 2s
say Проходите, господа хорошие, не задерживайте.
wait 5s
if %self.fighting%
  halt
end
mecho Паромщик вытолкал всех с парома.
mforce all stand
foreach target %self.pc%
  mforce %target% south
done
mecho Паромщик с помощником вновь взялись за ворот.
mdoor 8512 south purge
mdoor 24007 north purge
mdoor 8512 south room 8511
mdoor 8511 north room 8512
%self.gold(0)%
~
$~
