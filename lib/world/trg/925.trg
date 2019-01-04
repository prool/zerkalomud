#92500
тест дамага~
0 p 100
~
mecho %damager.name% атаковал %self.name% с помощью %skill% цифра %weapon.val3%
return 10
~
#92501
касты пронырливого черта~
0 k 100
~
dg_cast 'горящ руки'  
dg_cast 'горящ руки'
~
#92502
каст одноглазого черта~
0 k 100
~
dg_cast 'крит вред'
~
#92503
касты змея-воина ~
0 k 100
~
dg_cast 'кислот'  
~
#92504
змей приползает на помощь~
2 e 100
~
eval wait %random.5%+2
wait %wait%s
foreach char %self.pc%  
  if %char.fighting%
    wecho Змей-воин приполз на шум!
    wteleport змей_92507 %self.vnum%    
    wait 10s
    halt
  end
done
~
#92505
нельзя войти пока  жива Пераскея~
2 g 100
~
if %world.curmobs(92508)% > 0
  wsend %actor% Вы не можете туда пройти..
  return 0
else
  return 1
end
~
#92506
попытка одеть  женскую вещь~
1 j 100
~
if %actor.sex%  != 2
  osend %actor% Вы хоть подумали как будете выглядеть в %self.pname%?
  return 0
else
  return 1
end
~
#92507
перезарядка посоха неуязвимости~
1 c 1
зарядить~
attach 91815 %self.id%
eval damag %random.90% + %random.90% + %random.90% + %random.90% +150
switch (%actor.class%)
  case 0
    case 1
      case 10
        eval rdam %damag%+10
      break
      case 3
        case 5
          eval rdam %damag%*2
        break
        default
          eval rdam %damag%*2/3
        break
      done
      osend %actor% Посох начал вбирать в себя Вашу жизненную силу!
      if %actor.level%<28
        eval rdam %actor.hitp%+11
        osend %actor% Вы не смогли справится с властью посоха!
        oechoaround %actor% Посох выпил всю жизненную силу %actor.rname%!
        odamage %actor% %rdam%
      end
      if %actor.hitp%>%rdam%
        odamage %actor% %rdam%
      else
        odamage %actor% %actor.hitp%
      end
      eval  waitt 150+%random.100%
      wait %waitt%s
      osend %actor% Сияющая сфера на посохе слабо засветилась!
      eval damag %rdam%-%random.90%
      if %actor.hitp%>%damag%
        osend %actor% Посох вобрал в себя часть Вашей жизненой силы!
        odamage %actor% %damag%
      else
        osend %actor% Посох вытянул из Вас почти всю жизненную силу!
        odamage %actor% %actor.hitp%
      end
      eval  waitt 150+%random.100%
      wait %waitt%s
      osend %actor% Сияющая сфера на посохе сильно засветилась!
      eval rdam %damag%-%random.90%
      if %actor.hitp%>%rdam%
        osend %actor% Посох вобрал в себя часть Вашей жизненой силы!
        odamage %actor% %rdam%
      else
        osend %actor% Посох вытянул из Вас почти всю жизненную силу!
        odamage %actor% %actor.hitp%
      end
      eval  waitt 150+%random.100%
      wait %waitt%s
      osend %actor% Сияющая сфера на посохе ярко вспыхнула и вновь засверкала!
      detach 91815 %self.id%
      otransform 92508
~
#92508
одели жезл~
1 j 100
~
wait 1
oechoaround %actor% Покрывало Тьмы окутало %actor.vname%.
osend %actor% Посох великой тьмы задрожал.
~
#92509
сняли жезл~
1 l 100
~
wait 1
osend %actor% Посох великой тьмы успокоился.
oechoaround %actor% Великая ночь отступила!
~
#92510
умерла  служанка~
0 f 100
~
if %random.7% == 1 && %world.curobjs(92512)% < 2
  mload obj 92512
elseif %random.6% == 1 && %world.curobjs(92513)% < 2
  mload obj 92513
end
~
#92511
умер телохранитель~
0 f 100
~
if %random.7% == 1 && %world.curobjs(92514)% < 2
  mload obj 92514
end
~
#92512
умер советник~
0 f 100
~
if %random.7% == 1 && %world.curobjs(92509)% < 2
  mload obj 92509
elseif %random.6% == 1 && %world.curobjs(92510)% < 2
  mload obj 92510
elseif %random.5% == 1 && %world.curobjs(92511)% < 2
  mload obj 92511
end
~
#92513
лоад стаффа  пераскеи~
0 ab 100
~
wait 15s
if %random.5% == 1 && %world.curobjs(92504)% < 1
  mload obj 92504
elseif %random.4% == 1 && %world.curobjs(92505)% < 1
  mload obj 92505
elseif %random.3% == 1 && %world.curobjs(92506)% < 1
  mload obj 92506                                     
elseif %random.2% == 1 && %world.curobjs(92507)% < 1
  mload obj 92507
elseif !%world.curobjs(92508)%
  mload obj 92508
end     
detach 92513 %self.id%
*этот стафф должен локейтится!
~
#92514
нельзя одеть мобстафф~
1 j 100
~
if ((%actor.vnum% < 92500 ) || (%actor.vnum% > 92599 ))
  return 0
  osend %actor% Посмотрите на себя повнимательней - вы похожи на змеечеловека ?
  osend %actor% Тогда как Вы собираетесь это одеть ?
end
~
$~
