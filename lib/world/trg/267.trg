#26700
Пытаемся открыть дверь~
2 c 0
надавить нажать давить жать толкать толкнуть~
if !%arg.contains(Ворота)%
  wsend %actor% Ну, и куда жмем-с ?
  halt       
end
if %actor.str% < 27 
  wsend %actor% Слабоваты Вы еще, чтобы открыть эту дверь.
  wechoaround %actor% %actor.name% с криком навалился на дверь, но ничего не смог сделать.
else if 
  wdoor 26700 east purge
  wdoor 26700 east room 26701
  wsend %actor% Мощным ударом плеча Вы выбили дверь.   
  wechoaround %actor% %actor.name% мощным ударом плеча выбил дверь.  
  detach 26700 %self.id%
end
~
#26701
Поднимаемся по лестнице~
2 e 100
~
if %actor.move% > 100 
  wsend %actor% С трудом, но вы забрались по лестнице.
  %actor.move(-99)%
else
  wait 1s
  wsend %actor% Подъем забрал у вас последние силы, но Вы, так и не достигнув 
  wsend %actor% конца, упали и сильно ударились.
  wechoaround  %actor% %actor.name% из последних сил схватился за поручень,   
  wechoaround  но не смог удержаться и упал вниз.      
  
  wteleport %actor% 26716
  %actor.move(-99)%
  mdamage %actor% 100
end
~
#26702
Горящий колдун в бою~
0 k 100
~
dg cast !ледяной шторм!  %target.name%
~
#26703
темный страж в бою~
0 k 100
~
спасти колдун
~
#26704
Темный страж умер~
0 f 100
~
if (%world.curobjs(26701)% < 3) && (%random.100% <= 5)
  mload obj 26701
  mecho страж растворился в пустоте, оставив на земле плащ.        
end
if (%world.curobjs(26700)% < 3) && (%random.100% <= 5)
  mload obj 26700
  mecho страж растворился в пустоте, оставив на земле двуручный меч.        
end
~
#26705
духи в бою~
0 k 100
~
dg cast !мас оцеп!
if %random.100% < 10 
  mecho Дух издал жуткий крик, пугающий и леденящий душу.
  mdamage %actor.name% 75
end
~
#26706
Развязываем пленника~
0 c 0
развязать~
say  спасибо тебе, %actor.name% за освобождение.
say прими это от меня в дар.
%actor.gold(+300)%   
mecho пленник дал вам 300 кун.
say а я побегу отсюда скорее.
mecho пленник встал и выбежал из комнаты.
%purge% %self%
end
~
#26707
Дергаем рычаг  1~
2 c 0
дернуть нажать давить надавить~
if !%arg.contains(рычаг)%
  wsend %actor% что вы хотите дернуть?
  halt
end
if %random.4% < 4
  wsend %actor% Вы сильно надавили на рычаг и дверь отодвинулась, освободив    
  wsend %actor% проход.
  wechoaround %actor% %actor.name% сильно надавил на рычаг и дверь отодвинулась 
  wechoaround %actor% в сторону.  
  wdoor 26727 south purge  
  wdoor 26727 south room 26729  
  detach 26707 %self.id%
else       
  wsend %actor% Вы превратились в облако пыли, потеряли сознание и пришли в 
  wsend %actor% себя в какой-то пустой темной комнате.
  wechoaround %actor% %actor.name% превратился в облако пыли и исчез из виду.   
  wteleport %actor.name% 26780
end
~
#26708
Умер хрустальный голем~
0 f 100
~
mecho Голем распался на несколько осколков.
mload  mob 26706
mload  mob 26706
mload  mob 26706  
if (%world.curobjs(26705)% < 4) && (%random.100% <= 5)
  mload obj 26705
end
~
#26709
дергаем рычаг 2~
2 c 0
дернуть нажать давить надавить~
if !%arg.contains(рычаг)%
  wsend %actor% Что вы хотите дернуть ?
  halt
end
if %random.3% < 3    
  wsend %actor% Вы сильно надавили на рычаг и дверь отодвинулась,
  wsend %actor% освободив проход.
  wdoor 26734 south purge
  wdoor 26734 south room 26736
  mechoaround %actor% %actor.name% сильно надавил на рычаг, после чего дверь
  mechoaround %actor%отодвинулась, освободив проход.
  detach 26709 %self.id%
else 
  wsend %actor% Вы потеряли сознание, превратились в обалчко пыли и очнулись в 
  wsend %actor% какой-то тесной комнате. 
  mechoaround %actor% %actor.name% превратился в облачко пыли и исчез.
  wteleport %actor.name% 26780
end
~
#26710
каменный голем умер.~
0 f 100
~
mecho Голем распался на множество кусков камня.
mload mob 26709
mload mob 26709  
mload mob 26709     
if  (%world.curobjs(26704)% < 4) && (%random.100% <= 5)
  mload obj 26704
end
~
#26711
Дуем на дверь~
2 c 0
дуть дышать остудить~
wsend %actor% вы подули на дверь, от этого она остыла и сама открылась.
wechoaround %actor% %actor.name% начал дуть на дверь, от чего она 
wechoaround %actor% распахнулась.
wdoor    26744 up purge       
wdoor 26744 up room  26753
detach 26711 %self.id%
~
#26712
Вас жгет в комнате~
2 e 100
~
wsend  %actor.name%  Языки пламени облизали ваши ноги
wdamage %actor% 100
~
#26713
Убили столб~
0 f 100
~
if (%world.curobjs(26703)% < 2) && (%random.100% <= 5)
  mload obj 26703
end
~
#26714
Умер дух огня~
0 f 100
~
if (%world.curobjs(26706)% < 5) && (%random.100% <= 5)
  mload obj 26706
end
~
#26715
Смерть элементаля~
0 f 100
~
if (%world.curobjs(26707)% < 4) && (%random.100% <= 5)
  mload obj 26707
end
~
#26716
темный маг в бою~
0 k 100
~
if %random.2% < 2
  dg cast !камн!
elseif 
  dg cast !лед шторм!
end
~
#26717
Одеваем магов~
0 n 100
~
if (%world.curobjs(26708)% < 3) && (%random.100% <= 5)
  mload obj 26708
  вооруж посох
end
~
#26718
наград 2~
0 d 1
да буду хочу~
if %actor.level% >=28
  switch %actor.class%
    *лекарь
    case 0
      if (!%actor.spelltype(защита богов)%) && (%actor.level%>=28) && (%random.100% <= 2)
        mspellturn %actor.name% защита.богов set
        %send% %actor% Отныне умеешь ты ставить щит богов.
      else
        msend %actor.name% Вы стали гораздо опытнее.
        %actor.exp(+1000000)%
      end
    break
    *колдун
    case 1
      if (!%actor.spelltype(переместиться)%) & (%actor.level%>=28) & (%random.100% <= 2)
        mspellturn %actor.name% переместиться set
        say О, %actor.name%. Да сможешь ты переместиться к недругу или другу!
      else
        msend %actor.name% Вы стали гораздо опытнее.
        %actor.exp(+1000000)%
      end            
    break
    *тать
    case 2
      if (%actor.skill(заколоть)% < 141) && (%actor.level%>28)
        mskilladd %actor.name% заколоть 10 
        msend %actor.name% Отныне ты можешь поразить врага своего в спину с большим искусством.
      else
        msend %actor.name% Вы стали гораздо опытнее.
        %actor.exp(+1000000)%
      end
    break
    *богатырь
    case 3
      if %actor.skill(ярость)% < 141
        mskilladd %actor.name% ярость 10
        msend %actor.name% ярость твою не остановить..
      else
        msend %actor.name% Вы стали гораздо опытнее.
        %actor.exp(+1000000)%
      end
    break
    *наемник
    case 4
      if %actor.skill(скрытый)% < 141
        mskilladd %actor.name% скрытый 10
        msend %actor.name% Скрытые твои удары отныне всегда найду цель.
      else
        msend %actor.name% Вы стали гораздо опытнее.
        %actor.exp(+1000000)%
      end
    break
    *друж
    case 5
      if %actor.skill(осторожный)% < 141
        mskilladd %actor.name% осторожный 10
        msend %actor.name% Ворожьи подлые приемчики на тебя более не подействуют.
      else
        msend %actor.name% Вы стали гораздо опытнее.
        %actor.exp(+1000000)%
      end
    break
    *кудесник
    case 6
      if (!%actor.spelltype(зеркало)%) && (%actor.level%>=28) && (%random.100% <= 2)
        mspellturn %actor.name% зеркало set
        msend %actor.name%  Теперь вражьи заклинания ничто для тебя.
      else
        msend %actor.name% Вы стали гораздо опытнее.
        %actor.exp(+1000000)%
      break
      *Волшебники!
      case 7
        if (!%actor.spelltype(массовое оцеп)%) && (%actor.level%>=28) && (%random.100% <= 2)
          mspellturn %actor.name% масс.оцеп set
          say О, %actor.name%.  Сможешь остановить всех врагов своих
        else
          msend %actor.name% Вы стали гораздо опытнее.
          %actor.exp(+1000000)%
        end
      break
      *чернок
      case 8
        if (!%actor.spelltype(силы зла%) && (%actor.level%>=28) && (%random.100% <= 2)
          mspellturn %actor.name% силы.зла set
          say О, %actor.name%. Теперь последователи твои силой злой наполнятся.
        else
          msend %actor.name% Вы стали гораздо опытнее.
          %actor.exp(+1000000)%
        end
      break
      *витязь
      case 9
        if %actor.skill(точный)% < 141
          mskilladd %actor.name% точный 10
          msend %actor.name% Удары твои точны как никогда!
        else
          msend %actor.name% Вы стали гораздо опытнее.
          %actor.exp(+1000000)%
        end
      break
      *охо
      case 10
        if %actor.skill(найти)% < 141
          mskilladd %actor.name% найти 10
          msend %actor.name% Любого в этом мире найти ты сможешь
        else
          msend %actor.name% Вы стали гораздо опытнее.
          %actor.exp(+2000000)%
          
        end
      break
      *кузнец
      case 11
        if %actor.skill(оглушить)% < 141
          mskilladd %actor.name% оглушить 10
          msend %actor.name% Своими ударами напрочь глушишь ты врага!
        else
          msend %actor.name% Вы стали гораздо опытнее.
          %actor.exp(+1000000)%
          вздох
        end
      break
      *купец
      if %actor.skill(осторожный)% < 141
        mskilladd %actor.name% осторожный 10
        msend %actor.name% Воржьи подлые приемчики на тебя не действуют.
      else
        msend %actor.name% Вы стали гораздо опытнее.
        %actor.exp(+1000000)%
      end
    break
    *волхв
    case 13
      mload obj 226
      say Получи награду... Это очень мощная руна, в которую я вложил все свою энергию
      дать руна %actor.name%
    break   
    default
      %self.gold(+100000)%
      дать 100000 кун %actor.name%
    break
  done
else
  say Мал ты еще слишком, расти дальше
  %actor.exp(+500000)
end
detach 99198 %self.id%
%purge% %self%
~
#26719
Одеваем дружа~
0 n 100
~
if (%world.curobjs(26709)% < 3) && (%random.100% <= 5)     
  mload obj 26709
  воор меч
end
~
#26720
Смерть барона~
0 f 100
~
if (%world.curobjs(26710)% < 2) && (%random.100% <= 8)
  mload obj 26710
end
~
#26721
Дополнтельный баш у вити~
0 k 100
~
if %random.100% < 60 
  dg_affect %actor.name% обездвижен оцепенение 2 2
  mdamage %actor.name% 100
  msend  %actor.name% Вы замерли на месте от мощного удара Витязя
  mechoaround %actor% %actor.name% замер на месте от мощного удара витязя
end
~
#26722
жидкометалический голем умер.~
0 f 100
~
mecho Голем распался на множество кусков металла.
if  (%world.curobjs(26711)% < 3) && (%random.100% <= 4)
  mload obj 26711
end
~
#26723
награда собсвтенно1~
2 c 0
разбить~
wsend %actor% Шар разлетелся на куски, одарив вас знаниями
wechoaround %actor% Шар разлетелся на куски, одарив %actor.rname% знаниями.
wait 2
%actor.exp(+800000)
wechoaround %actor% из стекла появился призрак.
wload mob 26718
%echo% Здраве Буде Вам, Люди.
%echo% Множество веков провел я будучи заперт в этом шаре.
%echo% И множество знаний впитал я в себя
%echo%   Если вы желаете, я поделюсь с вами этими знаниями.
makeuid trg 26718 
detach 26723 %self.id%
~
#26724
reset~
2 f 100
~
calcuid room 26700 room 
attach 26700 %room.id%
calcuid room 26727 room
attach 26707 %room.id%
calcuid room 26734 room
attach 26709 %room.id% 
calcuid room 26744 room
attach  26711 %room.id%
calcuid room 26779 room
attach 26723 %room.id%
~
#26725
Смерть колдуна ликом~
0 f 100
~
if (%world.curobjs(26712)% < 4) && (%random.100% <= 4)
  mload obj 26712
end
~
#26726
Смерть оружейника~
0 f 100
*~
if (%world.curobjs(26713)% < 4) && (%random.100% <= 4)
  mload obj 26713
end
if (%world.curobjs(26714)% < 4) && (%random.100% <= 4)
  mload obj 26714
end
~
#26727
Смерть тюремщика~
0 f 100
~
if (%world.curobjs(26715)% < 4) && (%random.100% <= 5)
  mload obj 26715
end
~
#26728
Смерть витязя~
0 f 100
~
if (%world.curobjs(26716)% < 5) && (%random.100% <= 5)
  mload obj 26716
end
~
#26729
Смерть лекаря~
0 f 100
~
if (%world.curobjs(26717)% < 4) && (%random.100% <= 5)
  mload obj 26717
end
~
$~
