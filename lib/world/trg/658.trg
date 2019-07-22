#65800
землеройка прячется~
0 r 100
~
wait 1
if %random.10% == 3
  mecho _Землеройка испуганно пискнула и скрылась в лесной подстилке.
  mpurge %self%
end
~
#65801
входят к леснику~
0 q 100
~
wait 2s
if %actor.sex% == 1
  г Ну здорово, добрый молодец, заходи, гостем будешь.
  wait 2s
  г За небольшую плату в 100 кун могу смастерить из шкурок зверей лесных вещи на загляденье!
end
if %actor.sex% == 2
  г Заходи, гостьюшка дорогая, угощу чем богат.
  wait 1s
  mecho _Лесник достал холодное мясо куропатки, кабаний окорок и свежей ключевой водицы.
  dg_cast 'насыщ' %actor.name%
  wait 2s
  г За небольшую плату в 100 кун могу смастерить из шкурок зверей лесных вещи на загляденье!
end
~
#65802
дают куны леснику~
0 m 100
~
if %amount% >= 100
  г Ну, что ж, давай шкурку, изготовлю шубу али воротник, такую и князю впору надеть будет!
  calcuid lesnik 65812 mob
  attach 65803 %lesnik.id%
  detach 65802 %lesnik.id%
end
~
#65803
дали шкуру леснику~
0 j 100
~
wait 1s
if (%object.vnum% != 65801) && (%object.vnum% != 65802) && (%object.vnum% != 65803) && (%object.vnum% != 65804) && (%object.vnum% != 65805) && (%object.vnum% != 65806)
  хмур %actor.iname%  
  брос все
  halt
end
if %object.vnum% == 65801
  г Что за гадость!
  морщ
  wait 1s
  г Ну ладно, попробую и из этого изготовить чего дельного...
  mecho _Охотник принялся скоблить и отделывать шкуру.
  mpurge %object%
  wait 1s
  if (%random.100% <= 20) && (%world.curobjs(65809)% < 5)
    г Ну вот, возми эти рукава, они защитят тебя от вражьей магии.
    mload obj 65809
    дать все %actor.iname%
  else
    упрек
    г Извини уж, ничего не вышло...
  end
  calcuid lesnik 65812 mob
  attach 65802 %lesnik.id%
  detach 65803 %lesnik.id%
end
if %object.vnum% == 65802
  г Хорошая шкурка!
  сият
  wait 1s
  г Ну ладно, попробую и из этого изготовить чего дельного...
  mecho _Охотник принялся скоблить и отделывать шкуру.
  mpurge %object%
  wait 1s
  if (%random.100% <= 20) && (%world.curobjs(65810)% < 5)
    г Вот, возми этот воротник, согреет тебя в любую непогоду.
    mload obj 65810
    дать все %actor.iname%
  else
    упрек
    г Извини уж, ничего не вышло...
  end
  calcuid lesnik 65812 mob
  attach 65802 %lesnik.id%
  detach 65803 %lesnik.id%
end
if %object.vnum% == 65803
  г Давненько я таких не добывал в здешних лесах.
  дум
  wait 1s
  г Ну ладно, попробую и из этого изготовить чего дельного...
  mecho _Охотник принялся скоблить и отделывать шкуру.
  mpurge %object%
  wait 1s
  if (%random.100% <= 20) && (%world.curobjs(65811)% < 5)
    г Ну вот, возми эти рукавички, пригодятся какому-нибудь хилому чародею.
    mload obj 65811
    дать все %actor.iname%
  else
    упрек
    г Извини уж, ничего не вышло...
  end
  calcuid lesnik 65812 mob
  attach 65802 %lesnik.id%
  detach 65803 %lesnik.id%
end
if %object.vnum% == 65804
  г Знатная шкура!
  мечт
  wait 1s
  г Ну ладно, попробую и из этого изготовить чего дельного...
  mecho _Охотник принялся скоблить и отделывать шкуру.
  mpurge %object%
  wait 1s
  if (%random.100% <= 20) && (%world.curobjs(65812)% < 5)
    г Вот, возми эти шаровары, с ними даже самый умелый следопыт не сможет найти тебя!
    mload obj 65812
    дать все %actor.iname%
  else
    упрек
    г Извини уж, ничего не вышло...
  end
  calcuid lesnik 65812 mob
  attach 65802 %lesnik.id%
  detach 65803 %lesnik.id%
end
if %object.vnum% == 65805
  г Да уж, наверное ты очень умелый охотник.
  апл
  wait 1s
  г Ну ладно, попробую и из этого изготовить чего дельного...
  mecho _Охотник принялся скоблить и отделывать шкуру.
  mpurge %object%
  wait 1s
  if (%random.100% <= 20) && (%world.curobjs(65813)% < 5)
    г Ну вот, возми эту накидку, с ней ты станешь отличным охотником!
    mload obj 65813
    дать все %actor.iname%
  else
    упрек
    г Извини уж, ничего не вышло...
  end
  calcuid lesnik 65812 mob
  attach 65802 %lesnik.id%
  detach 65803 %lesnik.id%
end
if %object.vnum% == 65806
  г Ты убил вожака волков здешних лесов? Отныне ты будешь самым желанным гостем в моем доме!
  wait 1s
  г Ну ладно, попробую и из этого сделать чего дельного...
  mecho _Охотник принялся скоблить и отделывать шкуру.
  mpurge %object%
  wait 1s
  if (%random.100% <= 20) && (%world.curobjs(65814)% < 5)
    г  Возми эти сапоги, только самые проворные воины носят такие!
    mload obj 65814
    дать все %actor.iname%
  else
    упрек
    г Извини уж, ничего не вышло...
  end
  calcuid lesnik 65812 mob
  attach 65802 %lesnik.id%
  detach 65803 %lesnik.id%
end
~
#65804
зашли к белке~
0 q 100
~
wait 1
if %random.6% == 1
  mecho _Белочка резво прыгнула на дерево и убежала.
  mpurge %self%
end
~
#65805
гадюка рип~
0 f 100
~
if (%world.curobjs(65801)% < 6) && (%random.100% <= 70)
  mload obj 65801
  msend %actor% _Вы кое-как содрали шкурку с трупа гадюки.
  mechoaround %actor% _%actor.iname% кое-как содрал%actor.g% шкурку с трупа гадюки. 
end
~
#65806
белка рип~
0 f 100
~
if (%world.curobjs(65802)% < 6) && (%random.100% <= 60)
  mload obj 65802
  msend %actor% _Вы кое-как содрали шкурку с трупа белочки.
  mechoaround %actor% _%actor.iname% кое-как содрал%actor.g% шкурку с трупа белочки. 
end
~
#65807
куница рип~
0 f 100
~
if (%world.curobjs(65803)% < 6) && (%random.100% <= 70)
  mload obj 65803
  msend %actor% _Вы кое-как содрали шкурку с трупа куницы.
  mechoaround %actor% _%actor.iname% кое-как содрал%actor.g% шкурку с трупа куницы. 
end
~
#65808
рысь рип~
0 f 100
~
if (%world.curobjs(65804)% < 6) && (%random.100% <= 55)
  mload obj 65804
  msend %actor% _Вы кое-как содрали шкуру с трупа рыси.
  mechoaround %actor% _%actor.iname% кое-как содрал%actor.g% шкуру с трупа рыси. 
end
~
#65809
медведица рип~
0 f 100
~
if (%world.curobjs(65805)% < 6) && (%random.100% <= 70)
  mload obj 65805
  msend %actor% _Вы кое-как содрали шкуру с трупа медведицы.
  mechoaround %actor% _%actor.iname% кое-как содрал%actor.g% шкуру с трупа медведицы. 
end
~
#65810
матерый волк рип~
0 f 100
~
if (%world.curobjs(65806)% < 6) && (%random.100% <= 75)
  mload obj 65806
  msend %actor% _Вы кое-как содрали шкуру с трупа матерого волка.
  mechoaround %actor% _%actor.iname% кое-как содрал%actor.g% шкуру с трупа матерого волка. 
end
~
#65811
филин охотится~
0 g 70
~
wait 1
if ( %actor.vnum% == 65803 )
  kill %actor.name%
end
~
#65812
нырнуть в речку~
2 c 0
нырнуть прыгнуть~
wait 1
if (%arg.contains(река)%)||(%arg.contains(вода)%)
  wsend %actor% _Немного подумав, вы нырнули в прохладную воду.
  wechoaround %actor% _Немного подумав, %actor.name% нырнул%actor.g% в холодную воду.
  wteleport %actor% 65874
  wechoaround %actor% Кто-то занырнул сюда с берега.
else
  wsend %actor% _Ну и зачем Вам это ??
end
~
#65813
вынырнуть из речки~
2 c 0
вынырнуть выплыть~
wait 1
if (%arg.contains(берег)%)
  wsend %actor% _Вы выбрались на берег.
  wechoaround %actor% _%actor.name% выбрал%actor.u% на берег.
  wteleport %actor% 65868
  wechoaround %actor% Кто-то выбрался из реки.
else
  wsend %actor% _Ну и зачем Вам это ??
end
~
#65814
нырнуть в речку2~
2 c 0
нырнуть прыгнуть~
wait 1
if (%arg.contains(река)%)||(%arg.contains(вода)%)
  wsend %actor% _Немного подумав, вы нырнули в прохладную воду.
  wechoaround %actor% _Немного подумав, %actor.name% нырнул%actor.g% в холодную воду.
  wteleport %actor% 65875
  wechoaround %actor% Кто-то занырнул сюда с берега.
else
  wsend %actor% _Ну и зачем Вам это ??
end
~
#65815
вынырнуть из речки2~
2 c 0
вынырнуть выплыть~
wait 1
if (%arg.contains(берег)%)
  wsend %actor% _Вы выбрались на берег.
  wechoaround %actor% _%actor.name% выбрал%actor.u% на берег.
  wteleport %actor% 65876
  wechoaround %actor% Кто-то выбрался из реки.
else
  wsend %actor% _Ну и зачем Вам это ??
end
~
#65816
волк охотится~
0 g 70
~
wait 1
if ( %actor.vnum% == 65819 )
  kill %actor.name%
end
~
#65817
игрок падает в трясину~
2 e 30
~
wait 1
wecho _Неожиданно казавшаяся плотной и твердой кочка утопла в вязкой трясине
wecho _и Вы рухнули в глубокую мутную воду.
wdamage %actor% 85
~
#65818
Лезем на дуб~
2 c 100
лезть~
if !%arg.contains(дуб)%
  wsend %actor%  Куда это Вы лезть собрались?
  return 0
  halt
end
if %actor.rentable%
  wteleport %actor% 65878 horse
  wsend %actor% Вы залезли в маленький домик на дереве.
  wechoaround %actor% Кто-то вдруг оказался рядом с Вами.
end
~
#65819
слезть вниз~
2 c 100
слезть~
if !%arg.contains(вниз)%
  wsend %actor%  Куда это Вы слезть собрались?
  return 0
  halt
end
wsend %actor% Вы спрыгнули вниз с дерева.
wteleport %actor% 65873
wechoaround %actor% Кто-то вдруг оказался рядом с Вами.
~
#65820
камин~
1 b 100
~
switch %random.60%
  case 1
    oecho В камине весело трещат &yдрова&n.
  break
  case 2
    oecho Из камина вылетела &Rис&Yкор&Rка&n и &Wпогасла&n в воздухе.
  break
  case 3
    oecho &YЯзыки &Rпламени&n сплетаются в красивом &rтанце&n.
  break
  case 4
    oecho Вас окутало &Wтепло &Rогня&n.
  break
done
~
$~
