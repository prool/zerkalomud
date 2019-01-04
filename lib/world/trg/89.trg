#8900
Приветствие охотника~
0 q 100
~
wait 1s
say Здравствуй!
say Коли хочешь немного денег заработать, то приноси мне шкуры со зверей убитых.
say Я отблагодарю. А то недавно ногу подвернул неудачно, самому никак, жду когда поправится.
взд
~
#8901
Старый охотник вознаграждает~
0 jz 100
~
wait 1s
if !(%object.vnum% == 8900 || %object.vnum% == 8901 || %object.vnum% == 8902 || %object.vnum% == 8903 || %object.vnum% == 8904 || %object.vnum% == 8905 || %object.vnum% == 8907 || %object.vnum% == 8915)
  say Мне это не нужно.
  брос все
  halt
end
wait 1
if %object.vnum% == 8900
  wait 8
  say Ну чтож. В хозяйстве пригодится.
  wait 8
  say Держи свою награду.
  wait 8
  %self.gold(+100)%
  дать 100 кун %actor.name%
  calcuid shkura 8900 obj
  mpurge %shkura.name%
end
wait 1
if %object.vnum% == 8901
  wait 8
  say Ну чтож. В хозяйстве пригодится.
  wait 8
  say Держи свою награду.
  wait 8
  %self.gold(+140)%
  дать 140 кун %actor.name%
  calcuid shkura 8901 obj
  mpurge %shkura.name%
end
wait 1
if %object.vnum% == 8902
  wait 8
  say Ну чтож. В хозяйстве пригодится.
  wait 8
  say Держи свою награду.
  wait 8
  %self.gold(+200)%
  дать 200 кун %actor.name%
  calcuid shkura 8902 obj
  mpurge %shkura.name%
end
wait 1
if %object.vnum% == 8903
  wait 8
  say Ну чтож. В хозяйстве пригодится.
  wait 8
  say Держи свою награду.
  wait 8
  %self.gold(+260)%
  дать 260 кун %actor.name%
  calcuid shkura 8903 obj
  mpurge %shkura.name%
end
wait 1
if %object.vnum% == 8904
  wait 8
  say Ну чтож. В хозяйстве пригодится.
  wait 8
  say Держи свою награду.
  wait 8
  %self.gold(+500)%
  дать 500 кун %actor.name%
  calcuid shkura 8904 obj
  mpurge %shkura.name%
end
wait 1
if %object.vnum% == 8907
  wait 8
  say Ну чтож. В хозяйстве пригодится.
  wait 8
  say Держи свою награду.
  wait 8
  %self.gold(+500)%
  дать 500 кун %actor.name%
  calcuid shkura 8907 obj
  mpurge %shkura.name%
end
wait 1
if %object.vnum% == 8915
  wait 8
  say На первый взгляд неплохая беличья шкурка.
  wait 8
  say Попробуем ее обработать.
  wait 8  
  if (%world.curobjs(8916)% < 30)
    mecho Старик лесовик умело обработал беличью шкурку и сделал из нее прекрасный воротник.
    wait 8
    mload obj 8916
    дать беличий.воротник %actor.name%
    calcuid shkura 8915 obj
    mpurge %shkura.name%
  else
    mecho Старик лесовик испортил беличью шкурку. Вот неудача!
    calcuid shkura 8915 obj
    mpurge %shkura.name%
  end
end
wait 1
if %object.vnum% == 8905
  wait 8
  say Ух! Какая огромная черная игла.
  wait 8
  say Видать болотного призрака убил.
  wait 8
  say Спасибо тебе за доброе дело!
  wait 8
  if (%actor.level%>20) &&  (%random.100% <= 50) 
    mecho Старик лесовик заточил иглу и закрепил в рукоятке с кожаной петлей.
    wait 8
    mload obj 8906
    дать черная %actor.name%
    calcuid shkura 8905 obj
    mpurge %shkura.name%
  else
    mecho Старик лесовик стал точить иглу и сломал ее. Вот неудача!
    calcuid shkura 8905 obj
    mpurge %shkura.name%
  end
end
~
#8902
убили зайца~
0 f 100
~
if (%world.curobjs(8900)% < 30) && (%random.10% <= 5)
  mload obj 8900
end
~
#8903
убили оленя~
0 f 100
~
if (%world.curobjs(8901)% < 30) && (%random.10% <= 5)
  mload obj 8901
end
~
#8904
убили лисенка~
0 f 100
~
if (%world.curobjs(8902)% < 30) && (%random.10% <= 5)
  mload obj 8902
end
~
#8905
убили волка~
0 f 100
~
if (%world.curobjs(8903)% < 30) && (%random.10% <= 5)
  mload obj 8903
end
~
#8906
убили медведя~
0 f 100
~
if (%world.curobjs(8904)% < 30) && (%random.10% <= 5)
  mload obj 8904
end
~
#8907
убили призрака~
0 f 100
~
if (%world.curobjs(8906)% < 10) && (%random.10% <= 5)
  mload obj 8905
end
~
#8908
Лезем в щель~
2 c 100
лезть~
if !(%arg.contains(щель)%)
  wsend       %actor% Куда это Вы хотите пролезть ?
  return 0
  halt
end
if ((%actor.move%>100) && (%actor.level%>10))
  wsend       %actor% Вы полезли в узкую щель. Ох и тяжело же тут ползти.
  wait 2s
  eval buf %actor.move(-75)%
  wsend %actor% Вы тихо вылезли в маленькую пещерку.
  wteleport %actor.name% 8947
else
  wsend %actor% У Вас не хватит сил для этого.
  return 0
end
~
#8909
Лезем из щели~
2 c 100
лезть~
if !(%arg.contains(щель)%)
  wsend       %actor% Куда это Вы хотите пролезть ?
  return 0
  halt
end
if ((%actor.move%>80) && (%actor.level%>10))
  wsend       %actor% Вы полезли в узкую щель. Ох и тяжело же тут ползти.
  wait 2s
  eval buf %actor.move(-80)%
  wsend %actor% Вы тихо вылезли наружу.
  wteleport %actor.name% 8946
else
  wsend %actor% У Вас не хватит сил для этого.
  return 0
end
~
#8910
Раздвинуть ветки~
2 c 100
раздвинуть~
if !%arg.contains(ветки)%
  return 1
  halt
end
wait 1
wsend       %actor% Вы начали раздвигать ветки, закрывающие проход.
wechoaround %actor% %actor.name% попытал%actor.u% раздвинуть ветки.
wait 2s
wecho       Толстая ветвь хрустнула и все нагромождение переплетенных ветвей упало, открыв проход...
wdoor  8945 down flags a
wdoor  8945 down room  8951
wdoor  8951 up   flags a
wdoor  8951 up   room  8945
detach 8910 %self.id%
~
#8911
РепопЗоны~
2 f 100
0~
wdoor   8945 down purge
wdoor   8951 up   purge
calcuid qroom 8945 room
attach   8910 %qroom.id%
wdoor   8955 west purge
wdoor   8958 east purge
calcuid qroom2 8955 room
attach   8915 %qroom2.id%
calcuid qroom2 8970 room
attach   8916 %qroom2.id%
~
#8912
Отшельник просит~
0 q 100
~
wait 1s
хмур %actor.name%
wait 1s
say Расходились тут всякие...
взд
wait 1s
say Раз уж ты здесь, утихомирь медведя, что живет недалече.
say А то орет, как больной постоянно, думы думать мешает.
detach 8912 %self.id%
~
#8913
Отшельник вознаграждает~
0 j 100
~
wait 1s
if !(%object.vnum% == 8907) 
  say И что я с этим буду делать? Только выкинуть.
  брос все
  halt
end
wait 1
if %object.vnum% == 8907
  wait 8
  say Во, угодил. Хоть поживу теперь в покое.
  wait 8
  say Держи свою награду.
  wait 8
  %self.gold(+500)%
  дать 500 кун %actor.name%
  calcuid shkura 8907 obj
  mpurge %shkura.name%
  wait 1s
  if (%random.100% <= 40) &&  (world.curobjs(8909) < world.maxobj(8908))
    mecho Отшельник прищурился, и полез в шкафчик что-то бормоча.
    wait 8
    mload obj 8908
    say Заходили ко мне крестьяне, что живут рядом, да подарили за одну услугу перчаточки.
    say А на черта они мне нужны?! На, забери, может тебе пригодятся.
    дать кожан.перч.орнамент %actor.name%
  end
end
~
#8914
убили большого медведя~
0 f 100
~
if (%world.curobjs(8907)% < 5)
  mload obj 8907
end
~
#8915
Нажать на ручку~
2 c 100
нажать~
if !(%arg.contains(ручка)% || %arg.contains(ручку)% || %arg.contains(на ручку)%)
  return 1
  wsend       %actor% На что Вы хотите нажать?
  halt
end
wait 1
wsend       %actor% Вы нажали на резную ручку.
wechoaround %actor% %actor.name% попытал%actor.u% нажать на резную ручку.
if %random.1000% <= 70
  wsend %actor% _Вы случайно уронили какую-то книжку на пол, ранее лежавшую на окошке.
  wechoaround %actor Какая-то книжка, ранее лежавшая на окошке, упала на пол.
  %load% obj 1738
end
wait 2s
wecho       Часть стены, вместе с маленьким окошечком, ушла в сторону, открыв проход на запад.
wdoor  8955 west flags a
wdoor  8955 west room  8958
wdoor  8958 east flags a
wdoor  8958 east room  8955
detach 8915 %self.id%
~
#8916
Чиркаем по огниву~
2 c 100
чиркнуть~
set Key 0
wait 1
wsend %actor% Вы провели кремнем по огниву высекая искры.
wechoaround %actor% %actor.name% чиркнул%actor.a% кремнем по огниву высекая искры.
wait 2s
wecho Яркие искры полетели к сухому мху, который тут же вспыхнул и костер загорелся ярким светом.
wload obj 8910
foreach mob %self.npc%
  if (%mob.vnum% == 8926)
    set Key 1
    
  end
done
if ((%world.curmobs(8926)% < 3) && (%Key% != 1))
  wait 3s
  wecho Охотник за пушниной пришел с севера.     
  wait 8
  wload mob 8926
  wecho Охотник за пушниной поклонился Вам.
  wait 8
  wecho Охотник за пушниной сказал : 'Удивительная полянка. Этот огонь отпугнет хищников.'     
  wecho - Тут зверей можно не бояться.
  wecho - Зайцев в этом году много, а за зайцем и рысь пришла.
  wait 8
  wecho Охотник за пушниной стал греться у костра. 
end
detach 8916 %self.id%
~
#8917
убили рысь~
0 f 100
~
if (%world.curobjs(8912)% < 20) && (%random.10% <= 5)
  mload obj 8912
end
~
#8918
убили бобра~
0 f 100
~
if (%world.curobjs(8913)% < 10) && (%random.10% <= 9)
  mload obj 8913
end
~
#8919
убили белку~
0 f 100
~
if (%world.curobjs(8915)% < 10) && (%random.10% <= 5)
  mload obj 8915
end
~
#8920
достать огонек~
2 cz 100
достать~
if !(%arg.contains(огонек)%)
  wsend       %actor% Что Вы хотите достать?
  return 0
  halt
end
if (%exist.mob(8909)%)
  wsend       %actor% Вы протянули руку, пытаясь достать огонек, но что то задели.
  wsend       %actor% Вспыхнул яркий свет и огонек засиял, зато призрак ежа стал намного слабее.
  wait 8
  calcuid prizrak89 8909 mob
  attach   8925 %prizrak89.id%  
else 
  wsend       %actor% Свет выходит из самого камня, вряд ли его можно достать.
end
~
#8921
дочь крестьянина приветствует~
0 q 100
~
wait 1s
if %exist.mob(8915)%
  say Ой как я рада вас видеть!
  say Попыталась отнести еду моим братьям на поле, но увидела рысь.
  say Испугалась. Не сможешь ли ты отнести узелок на поле?
  wait 1
  mecho Дочь крестьянина протянула вам узелок с едой.  
  attach 8922 %self.id%
  halt
end
~
#8922
дочь крестьянина дает узелок~
0 d 1
хорошо помогу да~
if !(%exist.mob(8915)%)
  halt
end
wait 1s
say Ты меня выручил%actor.g%. Отнеси этот узелок моему отцу.
say Он работает с братьями на поле, что на западе.
wait 1
mload obj 8917
дать узелок.едой %actor.name%
wait 1s
mecho Крестьянская дочка продолжила готовить у печки.
detach 8921 %self.id%
detach 8922 %self.id%
~
#8923
крестьянину дали узелок~
0 j 100
~
wait 1
if !(%object.vnum% == 8917)
  say Потом погляжу где бы это применить в хозяйстве.
  брос все
  halt
end
wait 1s
say Никак дочка еду нам послала. Чтож спасибо за помощь.
wait 1s
mload obj 8928
wait 8
отпереть дубовый.сундук
wait 8
открыть дубовый.сундук
wait 8
mecho Крестьянин положил узелок в дубовый сундук.
calcuid yzelok 8917 obj
mpurge %yzelok.name%
calcuid yzelok 8928 obj
mpurge %yzelok.name%
if (%world.curobjs(8920)% < 5)
  wait 1s
  mecho Крестьянин взял вилы из затемненного угла землянки.
  wait 8
  mload obj 8920
  wait 8
  сня все
  воо крестьянские.вилы
end
wait 1
say Чтож отдохнул, пора идти дальше на поле работать
~
#8924
убили крысу~
0 f 100
~
if (%world.curobjs(8924)% < 8) && (%random.10% <= 5)
  mload obj 8924
end
~
#8925
призрак теряет ХП~
0 k 100
~
mecho &RПризрак черного ежа дернулся, когда в него попал луч света!&n
calcuid prizrak89 8909 mob
%prizrak89.hitp(-150)%
~
$~
