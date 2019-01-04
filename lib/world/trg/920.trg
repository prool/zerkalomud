#92000
перезарядка посоха земли~
1 c 3
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
      osend %actor% Жемчужина на посохе слегка засветилась!
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
      osend %actor% Жемчужина на посохе сильно засветилась!
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
      osend %actor% Жемчужина на посохе ярко вспыхнула и погасла!
      detach 91815 %self.id%
      otransform 92012
~
#92001
тригг шаровой молнии~
0 l 25
~
mecho Шаровая молния взорвалась
dg_cast 'огн поток'
mpurge %self%
~
#92002
боевой тригг Рарог~
0 k 100
~
if ((%random.9% == 1) && (%world.curmobs(92010) < 100))
  mecho Рарог бросил шаровую молнию!
  mload mob 92010
end
~
#92003
Рарог умер!~
0 f 100
~
if %random.100% < 3 && %world.curobjs(3342)% < 1 && %world.curobjs(3343)% < 1 
  mload obj 3342
end
if (%world.curobjs(92007)% < 5) && (%random.8% == 1)
  mload obj 92007
elseif (%world.curobjs(92008)% < 5) && (%random.7% == 1)
  mload obj 92008
elseif (%world.curobjs(92009)% < 5) && (%random.6% == 1)
  mload obj 92009
elseif (%world.curobjs(92010)% < 5) && (%random.5% == 1)
  mload obj 92010
end
if (%world.curobjs(92012)% < 1) && (%random.3% == 1)
  mload obj 92012
elseif (%world.curobjs(92011)% < 5) && (%random.6% == 1)
  mload obj 92011
elseif (%world.curobjs(92013)% < 5) && (%random.5% == 1)
  mload obj 92013
end
if (%world.curobjs(91900)% < 2)
  mload obj 91900
end
~
#92004
боевой тригг волша~
0 k 100
~
if (%world.curmobs(92016)% < 3) && (%random.20% == 1)
  mecho Волшебник создал хранителя!
  mload mob 92016
end
if %world.curmobs(92016)% == 3
  detach 92004 %self.id%
end
~
#92005
боевой тригг мага~
0 k 100
~
if (%world.curmobs(92017)% < 4) && (%random.15% == 1)
  mecho Маг создал ледяного защитника!
  mload mob 92017
end
if %world.curmobs(92017)% == 4
  detach 92005 %self.id%
end
~
#92006
боевой тригг лекаря~
0 k 100
~
if (%world.curmobs(92018)% < 2) && (%random.25% == 1)
  mecho Лекарь призвал святого духа!
  mload mob 92018
end
if %world.curmobs(92018)% == 2
  detach 92006 %self.id%
end
~
#92007
боевой тригг воина~
0 k 100
~
if  %random.30% == 1
  mecho Бывалый воин раздвоился!
  mload mob 92019
  detach 92007 %self.id%
end
~
#92008
перезарядка посоха исцеления~
1 c 3
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
      osend %actor% Золотой крест на посохе слегка засветился!
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
      osend %actor% Золотой крест на посохе ярко засветился!
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
      osend %actor% Золотой крест на посохе ярко вспыхнул и погас!
      detach 91815 %self.id%
      otransform 92015
~
#92009
умер старый лекарь~
0 f 100
~
if (%world.curmobs(92015)% == 1) && (%random.2% ==1) && (!%world.curobjs(92015)%)
  mload obj  92015
end
~
$~
