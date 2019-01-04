#42100
поют ратники~
0 b 8
~
mecho _Ратник затянул бравую военную песню.
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
wat 42110 wechoaround %actor% Кто-то пробрался сюда.
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
wat 42113 wechoaround %actor% Кто-то пробрался сюда.
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
  wait 1
  mpurge %object%
  wait 1s
  %echo% _Пузатая крыса убежала в дальний угол норы.
  if %world.curmobs(42113)% >= 5
    halt
  end
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
1 gj 100
~
wait 1
if ((%actor.clan% == ир) || (%actor.vnum% != -1))
  halt
end
osend %actor% %self.name% рассыпал%self.u% в ваших руках.
wait 1
opurge %self%
~
#42105
Накуриваем себе коня~
1 c 2
закурить~
wait 1
if !%arg.contains(самокрутка)%
  osend %actor% Что курить то будем?
  halt
end
osend %actor% Вы с наслаждением затянулись самокруткой, мир поплыл у вас перед глазами...
if %actor.clan% != ир
  halt
end
if %world.curmobs(42110)% > 50
  osend %actor% ...и как-то сразу вас отпустило, что за дерьмовая трава?!?!
  halt
end
oechoaround %actor% %actor.name% закурил%actor.g% самокрутку, потянуло сладким запахом конопли...
oload mob 42110
oecho Под легким порывом ветра из дыма возник красивый туманный скакун!
oforce %actor% оседлать скак
wait 1
opurge %self%
~
#42106
трава отпускает~
0 c 100
раздуть~
if %self.fighting%
  halt
end
if !%arg.contains(скакуна)%
  msend %actor%  Легкие то у вас сильные, только незачем понапрасну воздух гонять?!
  halt
end
if (%actor.clan% != ир) || (%actor% != %self.leader%)
  return 0
  halt
end
msend %actor% Вы дунули своей богатырской грудью...
mechoaround %actor% %actor.name% дунул%actor.g% что есть мочи...
mload obj 42154
give самокрутка .%actor.name%
wait 1s
mecho И дымчатый конь растворился в воздухе.  Хмм, да и был ли он?
wait 1
mpurge %self%
~
#42107
кони ржут~
0 b 5
~
mecho _Дымчатый конь радостно заржал, до вас донеслось его конопляное дыхание.
~
#42108
раздача~
0 m 1
~
wait 1
if %amount% < 50
  wait 2
  say Ну ты ведь знаешь, у меня всегда по полтиннику!!
  give %amount% кун .%actor.name%
  halt
end
if %world.curobjs(42154)% >= 200
  wait 2
  say Браток, ты уж извини, но кончилось все. Приходи попозже...
  give %amount% кун .%actor.name%
  halt
end
wait 2
say На держи, только аккуратнее, щас городская стража пацанов шмонает... 
mload obj 42154
give самокрутка .%actor.name%
~
$~
