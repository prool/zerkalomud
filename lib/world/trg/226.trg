#22600
Мандос лечит своих зверушек~
0 t 10
убить~
eval Mob %random.npc%
if (%Mob.fighting%)
  wait 1
  mecho О, Валар ! Бедн%Mob.w% %Mob.name% ! Опять зверушку мучуть !
  mecho Мандос протянул руку и тихонько прошептал: "пзарр"...
  eval Hit %Mob.maxhitp%
  eval Exp ((%Mob.maxhitp%-%Mob.hitp%)*%Mob.level%+1)/2
  %Mob.hitp(%Hit%)% 
  %Mob.exp(+%Exp%)%
end
~
#22601
сдули песок~
2 c 0
разгрести сгрести смести сдуть раскопать раскидать разрыть~
if (%arg.contains(песок)% || %arg.contains(куч)%)
  if (%world.curobjs(22628)% <= 0)
    wsend  %actor% Раззуй очи! 
    wforce %actor% см
    wait 1s
    wsend Раззул%actor.g%? Вот так-то вот...
    halt
  end
  wsend %actor% Вы сгребли песчаную кучку...
  wechoaround %actor% %actor.name% сгреб%actor.q% песчаную кучку...
  wecho Гля-ка, а вот и ключик! Уря, нашли! Да, где же Вы его видели?
  wforce all дум
  calcuid Stone 22628 obj
  wpurge %Stone%
  wload  obj 22630 
else
  wsend %actor% Учтите - Мандос увидит Ваши извращения - прибьет !!!
end
~
#22602
камень сдвинули~
2 c 0
двигать сдвинуть~
if (%arg.contains(камень)%)
  wsend %actor% Угу, щаз, нетути туточки каменюки - рассыпалась...
else
  wsend %actor% Чего Вам так мешает жить ?
end
~
#22603
прыгнуть в колодец~
2 c 100
прыгнуть~
if (%actor.fighting% || %actor.hitp% <= 0) 
  halt 
end   
if (!%arg.contains(колодец)% && !%arg.contains(сруб)%)
  wsend %actor% Совсем обленил%actor.u%! Тут Вам не здесь, мы Вас быстро
  wsend %actor% научим вводить команды полностью.
  halt
end
%send% %actor% Вы прыгнули в колодец.
wechoaround %actor% %actor.name% прыгнул%actor.g% в колодец.
wteleport %actor% 22601
wforce    %actor% см
~
#22604
зашли к выдре~
0 q 100
~
if (!%self.fighting% && %self.hitp% > 0)
  wait 1
  switch (%random.4%)                 
    case 1
      mecho Выдра обреченно подняла глаза и прошептала:
      mecho - Опять! Скоко можно! Мандос, когда ж я наконец сдохну...
    break
    case 2
      mecho Выдра жалобно запричитала:
      mecho - Людоньки, шо ж робыться! Адамантовцы прыдуть - вбивають, былинивци - вбывають...
    break
    case 3
      if (%actor.room% == %self.room%)
        mecho Выдра проворно вскочила на ноги:
        mecho - Адамантовцы не сдаются! Банзай! Но пасаран! Патриа о муэрте! Вали москалей!
        просн
        вста
        mkill  %actor%
      break;
    end
    case 4
      if (%random.20% == 1 && %world.curobjs(22632)% < 10)
        mecho Выдра покорно стянула шкуру:
        mecho - Бери, все бери! Уйду я от вас, злые вы...
        mload obj 22632
        *mforce %self% брос все
        mecho Выдра собрала свои убогие пожитки, и отправилась куда глаза глядят...
        mpurge %self%
      break
    end     
    default   
    break
  done
end
~
#22605
попытка нападения на Мандоса~
0 k 100
~
set crazy 0
if (%actor.vnum% == -1)
  set crazy %actor%
elseif (%actor.leader%)
  set crazy %actor.leader%
  if (%crazy.vnum% >= 0)
    set crazy 0
  end
end
if (%crazy%)
  mteleport %crazy% 22626
end
say %crazy.name%
~
#22606
Убили выдру~
0 ft 5
убить~
if (%world.curobjs(22632)% < 20)  
  mload obj 22632
end
~
$~
