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
  if %self.vnum% == 58112
    mechoaround %actor% %actor.name% попробовал%actor.g% погладить %self.vname%, но тот СМЕРТЕЛЬНО укусил%self.g% его за палец.
    msend %actor% Вы попробовали погладить %self.vname%, но он СМЕРТЕЛЬНО укусил%self.g% Вас за палец!
  else
    if %self.vnum% == 58303
      mechoaround %actor% %actor.name% попробовал%actor.g% погладить %self.vname%, но та отлетел%self.g% в сторону.
      msend %actor% Вы попробовали погладить %self.vname%, но она отлетел%self.g% в сторону.
    end
  end
  halt
end
if %self.vnum% == 58112
  mechoaround %actor% %actor.name% осторожно погладил%actor.g% %self.vname%, и %self.name% с громким хлопком изчез%self.q%.
  msend %actor% Вы осторожно погладили %self.vname%, и %self.name% с громким хлопком исчез%self.q%.
else
  if %self.vnum% == 58303
    mechoaround %actor% %actor.name% неосторожно погладил%actor.g% %self.vname%, и внезапно %self.name% лопнул%self.g%! Печально :(.
    msend %actor% Вы неосторожно погладили %self.vname% и как результат она лопнул%self.g%! Что же Вы наделали!?
  end
end
mload obj 58258
wait 1
mpurge %self%
~
#58203
самоцвет => конь2~
1 c 3
лизнуть~
wait 1
if %actor.clan% != ВД
  oechoaround %actor% %actor.name% начал%actor.u% облизывать черный самоцвет. С ним все в порядке?
  osend %actor% Вы начали облизывать магический самоцвет. Достойное занятие.
  halt
end
if %world.curmobs(58303)% < 5
  if %actor.clanrank% < 6
    oechoaround %actor% %actor.name% начал%actor.g% облизывать самоцвет и внезапно тот превратился в резиновую бабу, ну и дела!
    osend %actor% Вы начали облизывать самоцвет и внезапно он превратился в резиновую бабу!
    oload mob 58303
    wait 1
    opurge %self%
  else
    osend %actor% Из-за плохого финансового снабжения, такие развлечения доступны только старшему составу клана! :(.
  end
else
  osend %actor% Вы потерли самоцвет но ничего не произошло.
end
~
#58204
быстрая закупка после рипа~
0 c 1
закупка~
wait 1
if %actor.clan% != вд
  msend %actor.name% Совершай покупки в другом месте!
  halt
end
if %actor.bank% < 2830
  msend %actor.name% Твоих денег в банке не хватает на закупку!
  halt
end
%actor.bank(-2830)
брос все
* Медная лампа = 10 кун
mload obj 58201
* Простое колечко = 2x25=50 кун
mload obj 58203
mload obj 58203
* Простой оберег = 2x400=800 кун
mload obj 58205
mload obj 58205
* Крепкие доспехи = 80 кун
mload obj 58207
* Грубый шлем = 50 кун
mload obj 58209
* Грубые поножи = 50 кун
mload obj 58211
* Грубые сапоги = 30 кун
mload obj 58213
* Грубые перчатки = 30 кун
mload obj 58215
* Грубые наручи = 30 кун
mload obj 58217
* Плетеный щит = 40 кун
mload obj 58219
* Кожаная накидка = 200 кун
mload obj 58221
* Простой пояс = 20 кун
mload obj 58223
* Бронзовый браслет = 35x2=60 кун
mload obj 58225
mload obj 58225
* Походный мешок = 35 кун
mload obj 58229
* Свиток возврата 25*3=75
mload obj 139
mload obj 139
mload obj 139
* Напиток всевидения 100*3=300
mload obj 144
mload obj 144
mload obj 144
* Красный пузырек 300*3=900
mload obj 141
mload obj 141
mload obj 141
* Колба с серой жидкостью 20*3=60
mload obj 142
mload obj 142
mload obj 142
give all %actor.name%
drop all
~
$~
