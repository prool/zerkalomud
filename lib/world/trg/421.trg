#42100
поют ратники~
0 b 100
~
if %random.50% == 1
mecho _Ратник затянул бравую военную песню.
end
~
#42101
пробраться тайник~
2 c 0
пробраться лезть~
if !(%arg.contains(тайник)%) 
   wsend       %actor% Куда это Вы хотите пролезть???
   return 0
   halt
end
  wsend       %actor% Вы полезли в тайник Игоревой рати.
  wechoaround %actor% %actor.name% полез%actor.q% куда то.
  wait 1s
  wsend %actor% .- Вы оказались в тесной комнате.
  wteleport %actor.name% 42110
  wat 42110 wechoaround %actor% Кто то пробрался сюда.
~
#42102
вылазим назад~
2 c 0
пробраться лезть~
if !(%arg.contains(назад)%) 
   wsend       %actor% Куда это Вы хотите пролезть???
   return 0
   halt
end
  wsend       %actor% Вы полезли из тайника.
  wechoaround %actor% %actor.name% полез%actor.q% куда то.
  wait 1s
  wsend %actor% .- Вы оказались в комнате Воеводы.
  wteleport %actor.name% 42113
  wat 42113 wechoaround %actor% Кто то пробрался сюда.
~
#42103
рождение новых крысят (в прямом смысле)~
0 j 100
~
%echo% _Пузатая крыса обнюхала %object.iname%.
if (%object.type%==19)
  wait 2s
  if %exist.mob(42113)%
    %echo% _Пузатая крыса отдала %object.iname% крысенышу.
    %echo% _Крысеныш быстро съел %object.iname%.
    %purge% %object.name%
    halt
  endif
  wait 1s
  %echo% _Пузатая крыса съела %object.iname%.
  %purge% %object.name%
  wait 1s
  %echo% _Пузатая крыса убежала в дальний угол норы.
  wait 5s
  %load% mob 42113
  %load% mob 42113
  %load% mob 42113
  %load% mob 42113
  %load% mob 42113
  %echo% _Пузатая крыса прибежала из угола в сопровождении нового выводка крыс.
elseif
  %echo% _Пузатая крыса недовольно фыркнула.
  return 0
  halt
endif
~
#42104
взяли шмот~
1 ghijl 100
~
wait 1
if %actor.clan% == ир
  halt
end
%purge% %self%
~
$~
