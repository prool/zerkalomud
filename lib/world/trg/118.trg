#11800
Приветствие монахини~
0 r 100
~
wait 1
крест 
wait 1
say Здравствуй, мил человек
wait 1
say Страшная беда постигла нашу обитель!
wait 1
say Дьявол совратил многих наших сестер и забрал себе их души!
wait 1
say Одна из лучших наших сестер - "Кровавый Ворон" была первой
say захвачена дьяволом и теперь поднимает зомби на монастырском кладбище.
wait 1
say Если ты сумеешь очистить кладбище я вновь обрету доверие к людям
wait 1
say и щедро отблагодарю тебя.
~
#11801
В воротах кладбища~
2 e 100
~
wait 1
wecho Это святое место было осквернено
~
#11802
Кровавый ворон предлагает~
2 e 100
~
wait 1
wecho Присоединись к моей армии!
~
#11803
Встает из могилы.~
1 t 100
~
wait 1
if (%self.vnum%==11800)
  oecho Могильная плита раскололась...
end
if (%self.vnum%==11801)
  oecho Земля под крестом провалилась...
end
if (%self.vnum%==11802)
  oecho Надгробный камень отлетел в сторону...
end
switch %random.3%
case 1
  oload mob 11802
  oecho ...и ужасный зомби вылез из раскрывшейся ямы.
  break
case 2
  oload mob 11803
  oecho ...и темная лучница прыгнула на поверхность.
  break
default
  oload mob 11804
  oecho ...и страшный скелет восстал из мертвых.
  break
done
opurge %self%
~
#11804
лоад обьекта в труп трупа~
0 f 100
~
eval svzem %world.curobjs(11800)%+%world.curobjs(11801)%+%world.curobjs(11800)%+%world.curmobs(11802)%+%world.curmobs(11803)%+%world.curmobs(11804)%
if (%svzem% < 2)
mload obj 11888
end
if (%random.20%==1)
 switch %random.11%
 case 1
   if (%world.curobjs(11810)%<3)
     mload obj 11810
   end
   break
 case 2
   if (%world.curobjs(11811)%<3)
     mload obj 11811
   end
   break
 case 3
   if (%world.curobjs(11812)%<2)
     mload obj 11812
   end
   break
 case 4
   if (%world.curobjs(11813)%<1)
     mload obj 11813
   end
   break
 case 5
   if (%world.curobjs(11814)%<1)
     mload obj 11814
   end
   break
 case 6
   mload obj 11815
   break
 case 7
   if (%world.curobjs(11816)%<2)
     mload obj 11816
   end
   break
 case 8
   if (%world.curobjs(11817)%<1)
     mload obj 11817
   end
   break
 case 9
   if (%world.curobjs(11818)%<2)
     mload obj 11818
   end
   break
 case 10
   if (%world.curobjs(11819)%<1)
     mload obj 11819
   end
   break
 default
   if (%world.curobjs(11820)%<1)
     mload obj 11820
   end
   break
 done
end
~
#11805
на смерть ворона~
0 f 100
~
mecho Ворон упала на землю без сил.
mecho Душа вылетела из ее проклятого тела и унеслась вверх.
mecho Сноп молний вылетел из земли.
mecho Старая крыша мавзолея не выдержав упала на вас.
mecho %actor.name%, убив ворона позабыл%actor.g% об осторожности 
mecho и не успел%actor.g% вовремя отскочить.
mdamage %actor% 200
calcuid monah 11800 mob
detach 11800 %monah.id%
attach 11808 %monah.id%
if %world.curobjs(1242)% < 1
if %world.curobjs(1241)% < 1
if %random.100% < 3
mload obj 1242
end
end
end
~
#11806
ворон хиляется~
0 p 100
~
mecho Из проклятой земли под вашими ногами вырвался луч тьмы, который восстановил Ворона!
%self.hitp% = %self.maxhitp%
~
#11807
освятили землю~
1 h 100
~
if (%actor.realroom% == 11819)
 oecho Святая земля вспыхнула ярким светом и тьма развеялась.
 calcuid voron 11801 mob
 detach 11806 %voron.id%
end
wait 1
opurge %self%
~
#11808
Приветствие монахини 2~
0 r 100
~
wait 1
switch %random.20%
case 1
  say Спасибо путник, теперь я отблагодарю тебя!
  mload obj 11804
  дать все %actor.name%
  break
case 2
  say Спасибо путник, теперь я отблагодарю тебя!
  mload obj 11805
  дать все %actor.name%
  break
case 3
  say Спасибо путник, теперь я отблагодарю тебя!
  mload obj 548
  дать все %actor.name%
  break
case 4
if %world.curobjs(3305)% < 2  
mload obj 3305
дать перст %actor.name%
end
case 5
case 6
case 7
 if (%world.curobjs(218)%<50)
  say Спасибо путник, вот возьми, это осколок от ее гробницы!
  mload obj 218
  дать все %actor.name%
  break
 end
default
  say Спасибо путник!
  wait 10
  say Отныне ты в любой момент желанный гость в нашей скромной обители!
  дать 5000 кун %actor.name%
done
detach 11808 %self.id%
~
#11809
Репоп зоны "кровавый ворон"~
2 f 100
~
calcuid graven 11801 mob
detach 11806 %graven.id%
attach 11806 %graven.id%
~
$~
