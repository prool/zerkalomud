#15900
Ставим печать~
1 c 2
поставить~
if !%arg.contains(печать)%
  osend %actor% Что вы хотите поставить?
  halt
end
if (%actor.clan% !=сб)
  return 0
  halt
end
if %world.curobjs(15945)% > 4
  osend %actor% Вы думаете, что игра только для вас одних?
  halt
end
osend %actor% Вы поставили тут печать Северного Братства.
oechoaround %actor% %actor.name% поставил%actor.g% тут печать Северного Братства.
oload obj 15945
~
#15901
затераем печать~
1 c 4
стереть~
if !%arg.contains(печать)%
  osend %actor% Что вы хотите стереть?
  halt
end
if (%actor.clan% !=сб)
  return 0
  halt
end
oecho Ярко вспыхнув, печать Северного Братства исчезла.
opurge %self%
~
#15902
дикей клан шмота~
1 ghj 100
~
if %actor.vnum% != -1
  halt
end
if (%actor.clan% !=сб)
  wait 1
  oecho Яркая вспышка ослепила вас!
  osend %actor% Этой вещью может пользоваться только ратник Северного Братства!
  opurge %self%
end
~
#15903
разрешить носить клан экипировку не клановым~
1 c 2
разрешить~
if (%actor.clan% !=сб)
  return 0
  halt
end
osend %actor% Теперь %self.iname% может носить любой игрок.
detach 15902 %self%
detach 15903 %self%
~
#15904
Клан Стаф~
0 c 0
доспехи~
drop all
if %actor.bank% < 250
  брык %actor.name%
  wait 1
  говор %actor.name%, у тебя нехватает денег на экипировку
  halt
end
говор Сейчас, погоди минутку я соберу все что тебе необходимо
wait 1s
eval buffer %actor.bank(-250)%
mload obj 15901
mload obj 15902
mload obj 15903
mload obj 15904
mload obj 15905
mload obj 15906
mload obj 15906
mload obj 15907
mload obj 15907
mload obj 15908
mload obj 15909
mload obj 15910
mload obj 15912
mload obj 15912
mload obj 15913
mload obj 15919
mload obj 15935
put all сум
give сум .%actor.name%
говор Вот, держи
ул .%actor.name%
~
#15967
Смена ренты~
0 q 100
~
wait 1
if %actor.level% < 31
  %actor.loadroom(60036)%
end
log %actor.name%
~
#15968
Перенос ренты~
2 e 100
~
wait 1
if %actor.level% < 31
  %actor.loadroom(60036)%
end
log %actor.name%
~
#15969
Слезть с дерева~
2 c 1
слезть спуститься соскользнуть~
wait 1
wsend %actor%  Вы ухватились за свисающую с ветки сосны веревку и соскользнули вниз.
wechoaround %actor% _  %actor.name% ухватил%actor.u% за свисающую с ветки сосны веревку и соскользнул%actor.g% вниз.
wteleport %actor% 15903
wechoaround %actor% _  %actor.name% спустил%actor.u% с дерева.
~
#15970
Лезть на сосну~
2 c 1
лезть влезть залезть забраться вскарабкаться~
wait 1
if !%actor.rentable%
  return 0
  halt
end
if !%arg.contains(сосна)% && !%arg.contains(дерево)%
  wsend %actor% _Куда вы лезете?
  halt
end
wsend %actor% _Вы ухватились за свисающую с ветки сосны веревку и полезли наверх.
wechoaround %actor% _  %actor.name% ухватил%actor.u% за свисающую с ветки сосны веревку и полез%actor.g% наверх.
wteleport %actor% 15952
wechoaround %actor% _  %actor.name% забрал%actor.u% сюда.
~
#15971
Геша выдает хвосты~
0 m 1
~
wait 1
if %amount% < 150
  say Маловато будет!
  give %amount% кун .%actor.name%
  halt
end
if %world.curobjs(15933)% < 100
  mload obj 15933
  give хвост .%actor.name%
  взд
  halt
end
say Нетути... Кончились!
взд
give %amount% кун .%actor.name%
~
#15972
прогнать тушканчика~
0 c 1
прогнать~
wait 1
if %self.fighting%
  halt
end
if !%arg.contains(тушканчика)%
  msend %actor% Что вы хотите сделать?
  halt
end
if %actor.clan% != сб
  msend %actor%  Не ваш зверь - вот и не троньте!
  halt
end
msend %actor% Вы решили прогнать тушканчика.
mechoaround %actor% %actor.name% решил%actor.g% прогнать своего ручного тушканчика.
wait 1
рыда
emot откусил себе хвост с тоски
mload obj 15933
give хвост .%actor.name%
emot грустно побрел куда глаза глядят
wait 1
mpurge %self%
~
#15973
Лоад тушканчиков~
1 c 2
встряхнуть~
wait 1
if !%arg.contains(хвост)%
  osend %actor% Вы начали ожесточенно трясти головой.
  halt
end
if %actor.clan% != сб
  return 0
  halt
end
if %world.curmobs(15907)% > 50
  osend %actor% ...и ничего не произошло!
  halt
end
oload mob 15907
osend %actor% Вы встряхнули хвост тушканчика.
oechoaround %actor% %actor.name% взял%actor.g% в руку хвост тушканчика и встряхнул%actor.g% его.
oecho _Хвост тушканчика с мелодичным звоном исчез.
oecho _Лупоглазый тушканчик вылез из-под земли и вылупился на вас.
oforce %actor% оседлать тушкан
wait 1
opurge %self%
~
#15974
Батл триггер куролисков~
0 k 10
~
flee
flee
hide
camouf
~
#15977
Удаление мобов~
2 c 1
удалить~
wait 1
calcuid smotr 15911 mob
detach 15987 %smotr.id%
while %exist.mob(15912)%
  calcuid target 15912 mob
  exec 15979 %target.id%
  wait 1s
done
wait 1
while %exist.mob(15913)%
  calcuid target 15913 mob
  exec 15979 %target.id%
  wait 1s
done
wait 1
while %exist.mob(15914)%
  calcuid target 15914 mob
  exec 15979 %target.id%
  wait 1s
done
wait 1
while %exist.mob(15915)%
  calcuid target 15915 mob
  exec 15979 %target.id%
  wait 1s
done
wait 1
while %exist.mob(15916)%
  calcuid target 15916 mob
  exec 15979 %target.id%
  wait 1s
done
wait 1
while %exist.mob(15917)%
  calcuid target 15917 mob
  exec 15979 %target.id%
  wait 1s
done
wait 1
wait 10s
attach 15987 %smotr.id%
~
#15978
Чарм богатырей~
2 c 1
следуй~
wait 1
if %actor.vnum% != -1
  halt
end
wforce arenmob159 follow .%actor.name%
~
#15979
Делет зверей~
0 z 100
~
mecho толпа служителей загнала %self.vname% в клетку.
wait 1
mpurge %self%
~
#15980
Груп-триггер у зверья~
0 n 100
~
wait 2
follow див
wait 1
if %self.name% == див
  group all
end
wait 2s
if !%self.leader%
  follow альфин
end
wait 2s
if !%self.leader%
  follow грифон
end
wait 2s
if !%self.leader%
  follow куролиск
end
~
#15981
Лоад Сильфа~
2 z 100
~
wload mob 15917
~
#15982
Лоад Куролиска~
2 z 100
~
wload mob 15916
~
#15983
Лоад Наги~
2 z 100
~
wload mob 15915
~
#15984
Лоад Альфина~
2 z 100
~
wload mob 15914
~
#15985
Лоад дива~
2 z 100
~
wload mob 15913
~
#15986
Лоад грифона~
2 z 100
~
wload mob 15912
~
#15987
Лоад зверей на арену~
0 m 1
~
wait 1                   
if %world.curmobs(15912)% > 5
  say На арене и так зверья уже полно. 
  say С ним сначала побейтесь, или уж прикажите в клетки загнать.
  halt
end
if %world.curmobs(15913)% > 5
  say На арене и так зверья уже полно. 
  say С ним сначала побейтесь, или уж прикажите в клетки загнать.
  halt
end
if %world.curmobs(15914)% > 5
  say На арене и так зверья уже полно. 
  say С ним сначала побейтесь, или уж прикажите в клетки загнать.
  halt
end
if %world.curmobs(15915)% > 5
  say На арене и так зверья уже полно. 
  say С ним сначала побейтесь, или уж прикажите в клетки загнать.
  halt
end
if %world.curmobs(15916)% > 5
  say На арене и так зверья уже полно. 
  say С ним сначала побейтесь, или уж прикажите в клетки загнать.
  halt
end
if %world.curmobs(15917)% > 5
  say На арене и так зверья уже полно. 
  say С ним сначала побейтесь, или уж прикажите в клетки загнать.
  halt
end
calcuid arena 15936 room
switch %amount%
  case 1
    exec 15986 %arena.id%
  break
  case 2
    exec 15985 %arena.id%
  break
  case 3
    exec 15984 %arena.id%
  break
  case 4
    exec 15983 %arena.id%
  break
  case 5
    exec 15982 %arena.id%
  break
  case 6
    exec 15981 %arena.id%
  break
  case 7
    exec 15986 %arena.id%
    exec 15986 %arena.id%
    exec 15986 %arena.id%
  break
  case 8
    exec 15985 %arena.id%
    exec 15984 %arena.id%
  break
  case 9
    exec 15985 %arena.id%
    exec 15984 %arena.id%
    exec 15983 %arena.id%
  break
  case 10
    exec 15985 %arena.id%
    exec 15984 %arena.id%
    exec 15983 %arena.id%
    exec 15981 %arena.id%
  break
  case 11
    exec 15985 %arena.id%
    exec 15984 %arena.id%
    exec 15983 %arena.id%
    exec 15986 %arena.id%
    exec 15981 %arena.id%
  break
  case 12
    exec 15985 %arena.id%
    exec 15984 %arena.id%
    exec 15983 %arena.id%
    exec 15982 %arena.id%
    exec 15981 %arena.id%
  break
  case 13
    exec 15985 %arena.id%
    exec 15984 %arena.id%
    exec 15983 %arena.id%
    exec 15986 %arena.id%
    exec 15982 %arena.id%
    exec 15981 %arena.id%
  break
  case 14
    exec 15985 %arena.id%
    exec 15984 %arena.id%
    exec 15984 %arena.id%
    exec 15986 %arena.id%
    exec 15986 %arena.id%
    exec 15982 %arena.id%
    exec 15981 %arena.id%
  break
  case 15
    exec 15985 %arena.id%
    exec 15985 %arena.id%
    exec 15984 %arena.id%
    exec 15984 %arena.id%
    exec 15983 %arena.id%
    exec 15986 %arena.id%
    exec 15982 %arena.id%
    exec 15981 %arena.id%
  break
  case 16
    exec 15984 %arena.id%
    exec 15986 %arena.id%
  break
  case 17
    exec 15984 %arena.id%
    exec 15982 %arena.id%
    exec 15982 %arena.id%
  break
  case 18
    exec 15985 %arena.id%
    exec 15984 %arena.id%
    exec 15981 %arena.id%
  break
  case 19
    exec 15984 %arena.id%
    exec 15983 %arena.id%
  break
  case 20
    exec 15982 %arena.id%
    exec 15982 %arena.id%
    exec 15982 %arena.id%
  break
  case 1000
    halt
    set list 15912 15913 15914 15915 15916 15917
    foreach mobs %list%
      while %exist.mob(%mobs%)%
        calcuid target %mobs% mob
        exec 15979 %target.id%
      done
    done
    wait 1
  done
  кив
~
#15988
Убрать батыра с арены~
0 d 100
ступай к себе~
wait 1
if %self.realroom% == 15950
  дум .%actor.name%
  halt
end
if %self.leader%
  фиг .%actor.name%
  halt
end
set text ступай к себе
if %speech% != %text%
  вопрос .%actor.name%
  halt
end
соглас
emot ушел в зверинец
wait 1
mpurge %self%
~
#15989
Блокируем выход чармисов~
2 g 100
~
if ( %actor.vnum% > 15900 ) && ( %actor.vnum% < 15999 )
  return 0
  halt
end
~
#15990
Куролиск хиляется~
0 b 25
~
if !self.fighting%
  dg_cast 'исцеление' куролиск
end
stand
~
$~
