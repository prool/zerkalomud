#58200
клан шмот ДВ подняли с земли или взяли из контейнера~
1 g 100
~
* триг дикеит клан-стаф при попытке взять его игроком нейтрально-враждебным к клану ХЗ
if ( %actor.vnum% != -1 )
  halt
end
wait 1
* союзники если такие есть -- могут носить
if %actor.clan% == НД || %actor.clan% == СО2 || %actor.clan% == СО3
  halt
end
* Не ДВ и не союзники -- не могут
if ( %actor.clan% != ВД )
  oecho Внезапно %self.iname% исчез%self.q% в яркой вспышке.
  wait 1
  opurge %self.id%
end
~
#58201
самоцвет => конь~
1 c 3
потереть~
wait 1
if (%actor.clan%!=ВД)
  oechoaround %actor% %actor.name% начал%actor.u% тереть черный самоцвет. С ним все в порядке?
  osend %actor% Вы начали тереть самоцвет. Достойное занятие.
  halt
end
if %world.curmobs(58112)% < 50
  oechoaround %actor% %actor.name% начал%actor.g% тереть самоцвет и тот превратился в КОНЯ.
  osend %actor% Вы потерли самоцвет и он превратился в КОНЯ!
  oload mob 58112
  wait 1
  opurge %self%
else
  osend %actor% Вы потерли самоцвет но ничего не произошло.
end
~
#58202
конь => самоцвет~
0 c 0
погладить~
wait 1
if (%actor.clan%!=ВД)
  mechoaround %actor% %actor.name% попробовал%actor.g% погладил КОНЯ, но тот СМЕРТЕЛЬНО укусила его за палец.
  msend %actor% Вы попробовали погладить КОНЯ, но он СМЕРТЕЛЬНО укусил Вас за палец!
  halt
end
mechoaround %actor% %actor.name% осторожно погладил%actor.g% КОНЯ. КОНЬ с громким хлопком изчез.
msend %actor% Вы осторожно погладили КОНЯ. КОНЬ с громким хлопком исчезл.
mload obj 58258
wait 1
mpurge %self%
~
$~
