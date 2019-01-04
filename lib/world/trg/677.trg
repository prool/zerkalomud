#67700
Вылазим на поверхность~
2 c 100
карабкаться~
if !%arg.contains(вверх)% 
  wsend %actor% _Куда это Вы карабкаться собрались!?
  return 0
  halt 
end
wsend %actor%  Вы начали карабкаться вверх, цепляясь за камни.
wechoaround %actor%  %actor.name% начал%actor.g% карабкаться и изчез%actor.q% из виду.
wteleport %actor% 69151
wsend %actor% _Вы вылезли на поверхность.
wechoaround %actor%  Кто-то поднялся сюда из провала.
end
~
#67701
В бою со скелетом(1)~
0 k 20
~
mecho _Окаменевший скелет метнул одну из своих костей прямо в Вас!
foreach char %self.char%
  if %random.2% == 1
    msend %char% _В Вас попала острая кость скелета!
    mechoaround %actor% _Кость угодила прямо в руку %actor.rname%
    mdamage %char% 50
  end
done
~
#67702
В бою со скелетом(2)~
0 k 5
~
mecho  Окаменевший скелет выкрикнул древнее заклинание, вызвав жгучий огонь!
foreach char %self.char%
  if %random.2% == 1
    msend %char%  В Вас попал жгучий огонь, вызванный скелетом!!!
    mechoaround %actor%  Жгучий огонь угодил прямо в %actor.rname%, сильно поранив его!
    mdamage %char% 100
  end
done
~
#67703
Убили прородителя огня~
0 f 100
~
mload obj 67727
~
#67704
В бою с прородителем огня~
0 k 20
~
mecho  Прародитель огня плюнул огненным шаром в Вашу сторону!
foreach char %self.char%
  if %random.2% == 1
    msend %char%  В Вас попал огненный шар Прародителя огня!
    mechoaround %actor%  Огненный шар Прародителя огня угодил прямо в лицо %actor.rname%
    mdamage %char% 125
  end
done
~
#67705
Хлюпанье у реки~
2 e 100
~
wait 1s
wecho  Послышалось ужасное хлюпанье, доносящееся с огненной реки!
~
#67706
Огненные брызги~
2 e 100
~
wait 1s
wecho _Вдруг к вашим ногам упали капли лавы, выброшенные из огненной реки!
~
$~
