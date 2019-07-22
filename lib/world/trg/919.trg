#91900
триггер 1-я лодка корма~
2 z 100
~
wecho Лодка достигла середины реки.
wteleport all 91904
wteleport моб_91914 91904
~
#91901
триггер 1-я лодка середина~
2 z 100
~
wecho Лодка достигла середины реки.
wteleport all 91905
~
#91902
триггер 1-я лодка нос~
2 z 100
~
wecho Лодка достигла середины реки.
wteleport all 91906
~
#91903
триггер 2-я лодка корма~
2 z 100
~
wecho Лодка вышла из клубов пара.
wteleport all 91908
wteleport моб_91914 91908
~
#91904
триггер 2-я лодка середина~
2 z 100
~
wecho Лодка вышла из клубов пара.
wteleport all 91909
~
#91905
триггер 2-я лодка нос~
2 z 100
~
wecho Лодка вышла из клубов пара.
wteleport all 91910
~
#91906
триггер 3-я лодка корма~
2 z 100
~
wecho Вы заметили берег.
wteleport all 91928
wteleport моб_91914 91928
eval timer 40+%random.100%
wait %timer%s
exec 91918 %self.id%
~
#91907
триггер 3-я лодка середина~
2 z 100
~
wecho Вы заметили берег.
wteleport all 91929
~
#91908
триггер 3-я лодка нос~
2 z 100
~
wecho Вы заметили берег.
wteleport all 91930
~
#91909
триггер 4-я лодка корма~
2 z 100
~
wecho Лодка причалила к берегу.
wteleport all 91943
wteleport моб_91914 91943
~
#91910
триггер 4-я лодка середина~
2 z 100
~
wecho Лодка причалила к берегу.
wteleport all 91944
~
#91911
триггер 4-я лодка нос~
2 z 100
~
wecho Лодка причалила к берегу.
wteleport all 91945
~
#91912
потеряли лодку из вида север~
2 z 100
~
wecho Вы потеряли лодку из вида.
wteleport all 91923
~
#91913
потеряли лодку из вида восток~
2 z 100
~
wecho Вы потеряли лодку из вида.
wteleport all 91924
~
#91914
потеряли лодку из вида юг~
2 z 100
~
wecho Вы потеряли лодку из вида.
wteleport all 91925
~
#91915
потеряли лодку из вида запад~
2 z 100
~
wecho Вы потеряли лодку из вида.
wteleport all 91926
~
#91916
На старике - таймер движения и действий~
0 d 1
готов да поплыли~
wait 2s
say Ну что? 
say Все устроились?
say Тогда поплыли.
wait1s
mecho Лодка стронулась с места и медленно поплыла сквозь огонь.
say Пламя за бортом жаркое, смотрите не высуньтесь.
say Подумать не успеете как Вас испепелит.
eval timer 800+%random.200%
wait %timer%s
calcuid korma 91900 room
calcuid centr 91901 room
calcuid nos 91902 room
exec 91900 %korma.id%
exec 91901 %centr.id%
exec 91902 %nos.id%
say Смотрите не расслабляйтесь, пар ничуть не лучше огня!
eval timer 150+%random.200%
wait %timer%s
calcuid korma 91904 room
calcuid centr 91905 room
calcuid nos 91906 room
exec 91903 %korma.id%
exec 91904 %centr.id%
exec 91905 %nos.id%
say Тут уже поспокойнее, хоть дышать полегче.
say Правда воды легкие очень, даже перышка на себе не удержат.
say И как только ракшасы в них плавают.
wait 2s
say Кстати, готовьте оружие!
say Меня ракшасы не тронут, а вот Вас...
say Давно они живого теплого мяса не пробовали.
хих
wait 3s
say И смотрите, от лодки далеко не отлетайте!
say Знаю я вас героев, все бы повыделываться.
say Если потеряетесь - искать не буду.
say Да и еще, вода тут такая - всю магию поглощает, осторожнее будьте.
wait 3s
calcuid room8 91908 room
calcuid room9 91909 room
calcuid room10 91910 room
attach 91918 %room8.id%
attach 91918 %room9.id%
attach 91918 %room10.id%
eval timer 450+%random.200%
wait %timer%s
detach 91918 %room8.id%
detach 91918 %room9.id%
detach 91918 %room10.id%
exec 91906 %room8.id%
exec 91907 %room9.id%
exec 91908 %room10.id%
calcuid room11 91911 room
calcuid room12 91912 room
calcuid room13 91913 room
calcuid room14 91914 room
calcuid room15 91915 room
calcuid room16 91916 room
calcuid room17 91917 room
calcuid room18 91918 room
calcuid room19 91919 room
calcuid room20 91920 room
calcuid room21 91921 room
calcuid room22 91922 room
exec 91913 %room11.id%
exec 91913 %room12.id%
exec 91912 %room13.id%
exec 91912 %room14.id%
exec 91912 %room15.id%
exec 91915 %room16.id%
exec 91915 %room17.id%
exec 91915 %room18.id%
exec 91914 %room19.id%
exec 91914 %room20.id%
exec 91914 %room21.id%
exec 91913 %room22.id%
say Во сколько понаплыло!
say Ого, даже ледяной змей на берег выполз!
say Ну герои, думайте, назад я вас не повезу!
calcuid room8 91928 room
calcuid room9 91929 room
calcuid room10 91930 room
attach 91919 %room8.id%
attach 91919 %room9.id%
attach 91919 %room10.id%
eval timer 450+%random.200%
wait %timer%s
detach 91919 %room8.id%
detach 91919 %room9.id%
detach 91919 %room10.id%
exec 91909 %room8.id%
exec 91910 %room9.id%
exec 91911 %room10.id%
calcuid room11 91931 room
calcuid room12 91932 room
calcuid room13 91933 room
calcuid room14 91934 room
calcuid room15 91935 room
calcuid room16 91936 room
calcuid room17 91937 room
calcuid room18 91938 room
calcuid room19 91939 room
calcuid room20 91940 room
calcuid room21 91941 room
calcuid room22 91942 room 
exec 91913 %room11.id%
exec 91913 %room12.id%
exec 91912 %room13.id%
exec 91912 %room14.id%
exec 91912 %room15.id%
exec 91915 %room16.id%
exec 91915 %room17.id%
exec 91915 %room18.id%
exec 91914 %room19.id%
exec 91914 %room20.id%
exec 91914 %room21.id%
exec 91913 %room22.id%
say Ну все, я свое дело сделал, прощайте!
detach 91916 %self.id%
~
#91917
Боевой тригг ледяного змея~
0 k 100
~
eval sniper %random.pc%
if %sniper.fighting%   
  if (%sniper.class% == 6)
    eval value %sniper.cha%
  elseif (%sniper.class% == 3)
    eval value %sniper.cha%-4
  elseif (%sniper.class% == 8)
    eval value %sniper.cha%-8
  elseif (%sniper.class% == 7)
    eval value %sniper.cha%-12
  elseif (%sniper.class% == 5)
    eval value %sniper.cha%-16
  else 
    eval value 1+1
  end
  if (%value% < 2)
    eval value 1+1
  end
  if (%random.100% < %value%)
    msend %sniper.name% Вы нанесли Ледяному змею ужасную рану!
    mechoaround %sniper.name% Ударив с плеча %sniper.name% оставил%sniper.g% на шкуре Ледяного змея ужасную рану!
    eval kritdam 500+%random.200%+%random.200%
    if %self.hitp% > %kritdam% 
      %self.hitp(-%kritdam%)%
    else
      %self.hitp(1)%
    end
  end
end
unset value
unset sniper
unset kritdam
unset sniper
if (%random.5% == 1) && (%self.hitp%<1000)
  mecho Первая голова Ледяного змея произнесла исцеляющее заклинание!
  dg_cast 'исцелени'
end
if %random.5% == 1
  mecho Вторая голова Ледяного змея дыхнула холодом!
  eval target %random.pc% 
  dg_cast 'ледя вете' %target.name%
  unset target
end
if %random.15% == 1
  mecho Четвертая голова Ледяного змея вызвала ледяной шторм!
  dg_cast 'лед шторм' 
end
if %random.10% == 1
  mecho Третья голова Ледяного змея разгневалась!
  eval target %random.pc% 
  dg_cast 'гне бог' %target.name%
  unset target
end
~
#91918
вызов етих самых... ракшасов маленьких мало~
2 ab 100
~
if %random.15% == 1
  eval number %random.6%
  if %number% < 4
    wload mob 91900
    wload mob 91900
    wload mob 91900
    wecho Несколько небольших ракшасов запрыгнули в лодку!
  elseif %number% < 6
    wload mob 91900
    wload mob 91900
    wload mob 91900
    wload mob 91900
    wload mob 91900
    wecho Группа небольших ракшасов запрыгнула в лодку!
  else
    wload mob 91900
    wload mob 91900
    wload mob 91900
    wload mob 91900
    wload mob 91900
    wload mob 91900
    wload mob 91900
    wecho Куча небольших ракшасов запрыгнула в лодку!
  end
end
~
#91919
вызов етих самых... ракшасов маленьких много~
2 ab 100
~
if %random.11% == 1
  eval number %random.6%
  if %number% <4
    wload mob 91900
    wload mob 91900
    wload mob 91900
    wecho Несколько небольших ракшасов запрыгнули в лодку!
  elseif %number% < 6
    wload mob 91900
    wload mob 91900
    wload mob 91900
    wload mob 91900
    wload mob 91900
    wecho Группа небольших ракшасов запрыгнула в лодку!
  else
    wload mob 91900
    wload mob 91900
    wload mob 91900
    wload mob 91900
    wload mob 91900
    wload mob 91900
    wload mob 91900
    wecho Куча небольших ракшасов запрыгнула в лодку!
  end
end
~
#91920
перезарядка посоха бури~
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
      osend %actor% Кусок льда на посохе слегка засветился!
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
      osend %actor% Кусок льда на посохе сильно засветился!
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
      osend %actor% Кусок льда на посохе ярко вспыхнул и погас!
      detach 91815 %self.id%
      otransform 91902
~
#91921
Умер ледяной  змей~
0 f 100
~
if (%world.curobjs(91905)% < 2) && (%random.10% == 1)
  mload obj 91905
elseif (%world.curobjs(91903)% < 3) && (%random.8% == 1)
  mload obj 91903
elseif (%world.curobjs(91907)% < 3) && (%random.6% == 1)
  mload obj 91907
elseif (%world.curobjs(91904)% < 3) && (%random.5% == 1)
  mload obj 91904
elseif (%world.curobjs(91906)% < 3) && (%random.5% == 1)
  mload obj 91906
end
if (%world.curobjs(91902)% < 1) && (%random.3% == 1)
  mload obj 91902
end
~
#91922
триггер перемещения большого ракшаса 91912~
0 ab 100
~
if (%random.2% == 1) && (%self.realroom% == 91908)
  запад
end
if (%random.2% == 1) && (%self.realroom% == 91908)
  север
end
if (%random.2% == 1) && (%self.realroom% == 91908)
  юг
end
if (%random.2% == 1) && (%self.realroom% == 91909)
  юг
end
if (%random.2% == 1) && (%self.realroom% == 91909)
  север
end
if (%random.2% == 1) && (%self.realroom% == 91910)
  восток
end
if (%random.2% == 1) && (%self.realroom% == 91910)
  север
end
if (%random.2% == 1) && (%self.realroom% == 91910)
  юг
end
~
#91923
триггер перемещения большого ракшаса 91903~
0 ab 100
~
if (%random.2% == 1) && (%self.realroom% == 91928)
  запад
end
if (%random.2% == 1) && (%self.realroom% == 91928)
  север
end
if (%random.2% == 1) && (%self.realroom% == 91928)
  юг
end
if (%random.2% == 1) && (%self.realroom% == 91929)
  юг
end
if (%random.2% == 1) && (%self.realroom% == 91929)
  север
end
if (%random.2% == 1) && (%self.realroom% == 91930)
  восток
end
if (%random.2% == 1) && (%self.realroom% == 91930)
  север
end
if (%random.2% == 1) && (%self.realroom% == 91930)
  юг
end
~
$~
