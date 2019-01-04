#99900
Призываем в казино~
1 c 1
призвать~
if %actor.name% == Ослад
  oteleport %arg% 99905
  oecho %arg% перемещен на Арену
  log  Ослад призвал %arg% на Арену!
end
~
#99901
проверяем наличие крови~
2  0
~
if %actor.level% > 30
  halt
end
if !%actor.name%
  halt
end
if %actor.rentable% == 1
  halt
end
wecho %actor.iname% попытался зайти сюда, но кровь невинных жертв не стекла с него еще.
wzoneecho 1101 %actor.iname% вы в &RКРОВИ&n, поэтому не сможете учавствовать в турнире! %actor.iname%, Покиньте Арену!
wsend %actor% Вы находитесь в БД, покинте турнир!
return 0
~
#99902
Понева только для женщин, поэтому делаем триг~
1 j 100
~
if %actor.sex%  != 2
  osend %actor% Не кажетьтся ли Вам что о Вас плохо подумают если вы одените %self.vname%?
  return 0
else
  return 1
end
~
#99903
Получаю стаф~
0 c 100
получить~
if %actor.iname% == Ослад
  mload obj 99900
  mload obj 99901
  mload obj 99902
  mload obj 99903
  mload obj 99904
  mload obj 99905
  mload obj 99906
  mload obj 99907
  mload obj 99908
  mload obj 99909
  mload obj 99910
  mload obj 99911
  mload obj 99912
  mload obj 99913
  mload obj 99914
  mload obj 99915
  mload obj 99916
  mload obj 99917
  mload obj 99918
  mload obj 99919
  mload obj 99920
  mload obj 99921
  mload obj 99922
  mload obj 99923
  mload obj 99924
  пол все сум
  mload obj 99925
  mload obj 99926
  mload obj 99927
  mload obj 99928
  mload obj 99929
  mload obj 99930
  mload obj 99931
  mload obj 99932
  mload obj 99933
  mload obj 99934
  mload obj 99935
  mload obj 99936
  mload obj 99937
  mload obj 99938
  mload obj 99939
  mload obj 99940
  mload obj 99941
  mload obj 99942
  mload obj 99943
  mload obj 99944
  mload obj 99945
  mload obj 99946
  mload obj 99947
  mload obj 99948
  mload obj 99949
  mload obj 99950
  пол все сум
  mload obj 99951
  mload obj 99952
  mload obj 99953
  mload obj 99954
  mload obj 99955
  mload obj 99956
  mload obj 99957
  mload obj 99958
  mload obj 99959
  mload obj 99960
  mload obj 99961
  mload obj 99962
  mload obj 99963
  mload obj 99964
  mload obj 99965
  mload obj 99966
  mload obj 99967
  mload obj 99968
  mload obj 99969
  mload obj 99970
  пол все сум
  дать все ослад
  wait 1
end
~
#99904
Лоудим тушканчика~
2 c 100
тушканначать~
mload mob 99902
~
#99905
Играем в кости~
1 cfg 0
~
wait 1
eval val1 %random.6%
eval val2 %random.6%
oecho Выпало %val1% и %val2%.
~
#99906
Сапоги Ослада~
1 c 100
призвать~
if %actor.name% == Ослад
  set vnum  %actor.realroom%
  if %vnum% <  99900 || %vnum% > 99999
    oteleport %arg% %vnum% 99905
    oecho %arg% перемещен на Арену
    log  Ослад призвал %arg% на Арену в комнату %vnum% !
  end
end
~
$~
