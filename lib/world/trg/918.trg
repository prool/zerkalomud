#91800
баттлетригг Усыни~
0 k 100
~
if %self.position% < 7
  halt
end
eval sniper %random.pc%
if (%sniper.class% == 9)
  eval value %sniper.cha%-5
elseif (%sniper.class% == 3)
  eval value %sniper.cha%-9
elseif (%sniper.class% == 11)
  eval value %sniper.cha%-13
elseif (%sniper.class% == 10)
  eval value %sniper.cha%-17
elseif (%sniper.class% == 5)
  eval value %sniper.cha%-21
else 
  eval value 1+1
end
if (%value% < 2)
  eval value 1+1
end
if (%random.100% < %value%)
  msend %sniper.name% Вы метким ударом повредили язык Усыне.
  mechoaround %sniper.name% %sniper.name% метким ударом повредил%sniper.g% Усыне язык.
  detach 91800 %self.id%
end
unset value
unset sniper
if %random.4% == 1
  eval target %random.pc% 
  dg_cast 'кислота' %target.name%
  unset target
end
~
#91801
баттлетригг Дубыни(3 головы)~
0 k 100
~
if %self.position% < 7
  halt
end
eval sniper %random.pc%
if (%sniper.class% == 9)
  eval value %sniper.cha%
elseif (%sniper.class% == 3)
  eval value %sniper.cha%-4
elseif (%sniper.class% == 11)
  eval value %sniper.cha%-8
elseif (%sniper.class% == 10)
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
  msend %sniper.name% Вы метким ударом снесли Дубыне левую голову!
  mechoaround %sniper.name% %sniper.name% метким ударом снес%sniper.g% Дубыне левую голову!
  attach 91802 %self.id%
  detach 91801 %self.id%
end
unset value
unset sniper
if %random.10% == 1
  dg_cast 'исцел' дубыня
  dg_cast 'исцел' усыня
  dg_cast 'исцел' горыня
  mecho Правая голова Дубыни произнесла исцеляющее заклинание!
end
if %random.7% == 1
  eval tmp %random.pc%
  dg_cast 'масс слеп' %tmp.name%
  mecho Левая голова Дубыни произнесла ослепляющее заклинание!
end
~
#91802
баттлетригг Дубыни (2 головы)~
0 k 100
~
if %self.position% < 7
  halt
end
eval sniper %random.pc%
if (%sniper.class% == 9)
  eval value %sniper.cha%-3
elseif (%sniper.class% == 3)
  eval value %sniper.cha%-7
elseif (%sniper.class% == 11)
  eval value %sniper.cha%-11
elseif (%sniper.class% == 10)
  eval value %sniper.cha%-15
elseif (%sniper.class% == 5)
  eval value %sniper.cha%-19
else 
  eval value 1+1
end
if (%value% < 2)
  eval value 1+1
end
if (%random.100% < %value%)
  msend %sniper.name% Вы метким ударом снесли Дубыне правую голову!
  mechoaround %sniper.name% %sniper.name% метким ударом снес%sniper.g% Дубыне правую голову!
  detach 91802 %self.id%
end
unset value
unset sniper
if (%random.8% == 1)
  dg_cast 'исцел' дубыня
  if (%exist.mob(91802)%)
    dg_cast 'исцел' усыня
  end
  if (%exist.mob(91800)%)
    dg_cast 'исцел' горыня
  end
  mecho Правая голова Дубыни произнесла исцеляющее заклинание!
end
~
#91803
баттлетригг Горыни (6 голов)~
0 k 100
~
if %self.position% < 7
  halt
end
eval sniper %random.pc%
if (%sniper.class% == 9)
  eval value %sniper.cha%
elseif (%sniper.class% == 3)
  eval value %sniper.cha%-4
elseif (%sniper.class% == 11)
  eval value %sniper.cha%-8
elseif (%sniper.class% == 10)
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
  msend %sniper.name% Вы метким ударом снесли Горыне шестую голову!
  mechoaround %sniper.name% %sniper.name% метким ударом снес%sniper.g% Горыне шестую голову!
  attach 91804 %self.id%
  detach 91803 %self.id%
end
unset value
unset sniper
if %random.11% == 1
  mecho Шестая голова Дубыни произнесла заклинание суда!
  dg_cast 'суд бог' 
end
if %random.10% == 1
  mecho Пятая голова Дубыни дыхнула огнем!
  dg_cast 'огн пот' 
end
if %random.9% == 1
  mecho Четвертая голова Дубыни вызвала метеоритный дождь!
  dg_cast 'метеор дож' 
end
if %random.8% == 1
  mecho Третья голова Дубыни разгневалась!
  eval target %random.pc% 
  dg_cast 'гне бог' %target.name%
  unset target
end
if %random.7% == 1
  mecho Вторая голова Дубыни плюнула огненным шаром!
  eval target %random.pc% 
  dg_cast 'огн шар' %target.name%
  unset target
end
~
#91804
баттлетригг Горыни (5 голов)~
0 k 100
~
if %self.position% < 7
  halt
end
eval sniper %random.pc%
if (%sniper.class% == 9)
  eval value %sniper.cha%-1
elseif (%sniper.class% == 3)
  eval value %sniper.cha%-5
elseif (%sniper.class% == 11)
  eval value %sniper.cha%-9
elseif (%sniper.class% == 10)
  eval value %sniper.cha%-13
elseif (%sniper.class% == 5)
  eval value %sniper.cha%-17
else 
  eval value 1+1
end
if (%value% < 2)
  eval value 1+1
end
if (%random.100% < %value%)
  msend %sniper.name% Вы метким ударом снесли Горыне пятую голову!
  mechoaround %sniper.name% %sniper.name% метким ударом снес%sniper.g% Горыне пятую голову!
  attach 91805 %self.id%
  detach 91804 %self.id%
end
unset value
unset sniper
if %random.9% == 1
  mecho Пятая голова Дубыни дыхнула огнем!
  dg_cast 'огн пот' 
end
if %random.8% == 1
  mecho Четвертая голова Дубыни вызвала метеоритный дождь!
  dg_cast 'метеор дож' 
end
if %random.7% == 1
  mecho Третья голова Дубыни разгневалась!
  eval target %random.pc% 
  dg_cast 'гне бог' %target.name%
  unset target
end
if %random.6% == 1
  mecho Вторая голова Дубыни плюнула огненным шаром!
  eval target %random.pc% 
  dg_cast 'огн шар' %target.name%
  unset target
end
~
#91805
баттлетригг Горыни (4 головы)~
0 k 100
~
if %self.position% < 7
  halt
end
eval sniper %random.pc%
if (%sniper.class% == 9)
  eval value %sniper.cha%-2
elseif (%sniper.class% == 3)
  eval value %sniper.cha%-6
elseif (%sniper.class% == 11)
  eval value %sniper.cha%-10
elseif (%sniper.class% == 10)
  eval value %sniper.cha%-14
elseif (%sniper.class% == 5)
  eval value %sniper.cha%-18
else 
  eval value 1+1
end
if (%value% < 2)
  eval value 1+1
end
if (%random.100% < %value%)
  msend %sniper.name% Вы метким ударом снесли Горыне четвертую голову!
  mechoaround %sniper.name% %sniper.name% метким ударом снес%sniper.g% Горыне четвертую голову!
  attach 91806 %self.id%
  detach 91805 %self.id%
end
unset value
unset sniper
if %random.7% == 1
  mecho Четвертая голова Дубыни вызвала метеоритный дождь!
  dg_cast 'метеор дож' 
end
if %random.6% == 1
  mecho Третья голова Дубыни разгневалась!
  eval target %random.pc% 
  dg_cast 'гне бог' %target.name%
  unset target
end
if %random.5% == 1
  mecho Вторая голова Дубыни плюнула огненным шаром!
  eval target %random.pc% 
  dg_cast 'огн шар' %target.name%
  unset target
end
~
#91806
баттлетригг Горыни (3 головы)~
0 k 100
~
if %self.position% < 7
  halt
end
eval sniper %random.pc%
if (%sniper.class% == 9)
  eval value %sniper.cha%-3
elseif (%sniper.class% == 3)
  eval value %sniper.cha%-7
elseif (%sniper.class% == 11)
  eval value %sniper.cha%-11
elseif (%sniper.class% == 10)
  eval value %sniper.cha%-15
elseif (%sniper.class% == 5)
  eval value %sniper.cha%-19
else 
  eval value 1+1
end
if (%value% < 2)
  eval value 1+1
end
if (%random.100% < %value%)
  msend %sniper.name% Вы метким ударом снесли Горыне третью голову!
  mechoaround %sniper.name% %sniper.name% метким ударом снес%sniper.g% Горыне третью голову!
  attach 91807 %self.id%
  detach 91806 %self.id%
end
unset value
unset sniper
if %random.5% == 1
  mecho Третья голова Дубыни разгневалась!
  eval target %random.pc% 
  dg_cast 'гне бог' %target.name%
  unset target
end
if %random.4% == 1
  mecho Вторая голова Дубыни плюнула огненным шаром!
  eval target %random.pc% 
  dg_cast 'огн шар' %target.name%
  unset target
end
~
#91807
баттлетригг Горыни (2 головы)~
0 k 100
~
if %self.position% < 7
  halt
end
eval sniper %random.pc%
if (%sniper.class% == 9)
  eval value %sniper.cha%-4
elseif (%sniper.class% == 3)
  eval value %sniper.cha%-8
elseif (%sniper.class% == 11)
  eval value %sniper.cha%-12
elseif (%sniper.class% == 10)
  eval value %sniper.cha%-16
elseif (%sniper.class% == 5)
  eval value %sniper.cha%-20
else 
  eval value 1+1
end
if (%value% < 2)
  eval value 1+1
end
if (%random.100% < %value%)
  msend %sniper.name% Вы метким ударом снесли Горыне вторую голову!
  mechoaround %sniper.name% %sniper.name% метким ударом снес%sniper.g% Горыне вторую голову!
  detach 91807 %self.id%
end
unset value
unset sniper
if %random.3% == 1
  mecho Вторая голова Дубыни плюнула огненным шаром!
  eval target %random.pc% 
  dg_cast 'огн шар' %target.name%
  unset target
end
~
#91808
баттлетригг грифон~
0 k 100
~
if %self.position% < 7
  halt
end
dg_cast 'крит исцел' я
if %random.7% == 1
  eval target %random.pc% 
  dg_cast 'цеп молн' %target.name%
  unset target
end
if %random.17% == 1
  eval target %random.pc% 
  eval affect %random.10%
  if (%affect% == 1)
    msend %target.name% Крик Грифон выбил из Вас сознание.
    mechoaround %target.name% От крика Грифон %target.name% потерял %target.g% сознание.
    атак %target.name%
    %target.position(3)%
    %target.wait(3)%
  elseif (%affect% < 4)
    dg_cast 'гнев бог' %target.name%
  elseif (%affect% < 7)
    dg_cast 'оцепен' %target.name%
  else
    dg_cast 'лед вете' %target.name%
  end
  
  unset target
  unset affect
end
if (%world.curmobs(91804)% < 4) && %random.5%==1
  mload mob 91804
  mecho Птенец птицы грифон прилетел в гнездо!
end
~
#91809
баттлетригг птенца грифон~
0 k 100
~
dg_cast 'сер исц' я
~
#91810
баттлетригг чернокнижника~
0 k 100
~
dg_cast 'легк исц' я
if %random.3% == 1
  eval target %random.pc% 
  dg_cast 'высо жиз' %target.name%
  unset target
end
if %random.12% == 1
  mload mob 91806
  mecho Дух чернокнижника поднял костяную гончую!
elseif %random.24% == 1
  mload mob 91807
  mecho Дух чернокнижника поднял костяного дракона!
elseif %random.36% == 1
  mload mob 91808
  mecho Дух чернокнижника поднял костяного голема!
elseif %random.50% == 1
  mload mob 91809
  mecho Дух чернокнижника поднял упыря!
end
~
#91811
баттлетригг упыря~
0 k 100
~
eval target %random.pc% 
dg_cast 'высо жиз' %target.name%
unset target
~
#91812
вошли к старику~
0 q 100
~
mecho Старик посмотрел на Вас.
wait 3s
say Вот неймется кому-то.
say Еще живые, а уже в царство мертвых идут.
взд
wait 3s
say Переправится стало быть хочешь?
say Я вобще-то только души на тот берег перевожу, да и то не всякие.
wait 4s
say Хотя постой!
say Могу я перевезти смертного, если он золотую ветвь мне принесет.
say Так что или давай ветвь, или ступай отседова.
say У меня работы много еще, недосуг со смертными разговаривать.
~
#91813
Дали ветвь старику~
0 j 100
~
if %object.vnum% == 91900
  wait 1s
  detach 91812 %self.id%
  say Принес таки!
  say Ну чтож, иди за мной.
  wait 2s
  mecho Старик повел Вас к лодке. 
  say Как будешь готов - говори.
  mat 91900 Кто-то ещё уселся в лодку.
  mteleport all 91900
  detach 91813 %self.id%
else
  wait 1s
  say Эту ерунду оставь себе!
  бро all
end
~
#91814
перезарядка  посоха власти~
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
      osend %actor% Изумруд на посохе слегка засветился!
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
      osend %actor% Изумруд на посохе сильно засветился!
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
      osend %actor% Изумруд на посохе ярко вспыхнул и погас!
      detach 91815 %self.id%
      otransform 91802
~
#91815
попытка отдать посох во время перезарядки~
1 hi 100
~
oecho Посох взорвался и исчез в вихре пламени!
eval dam %actor.hitp%+9
odamage %actor% %dam%
otransform 91803
detach 91616 %self%
detach 91711 %self%
detach 91814 %self%
detach 91816 %self%
detach 91817 %self%
detach 91818 %self%
detach 91920 %self%
detach 92000 %self%
detach 92008 %self%
detach 92117 %self%
detach 92507 %self%
detach 91815 %self%
~
#91816
перезарядка  посоха справедливости~
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
      osend %actor% Алмаз на посохе слегка засветился!
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
      osend %actor% Алмаз на посохе сильно засветился!
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
      osend %actor% Алмаз на посохе ярко вспыхнул и погас!
      detach 91815 %self.id%
      otransform 91804
~
#91817
перезарядка  посоха пламени~
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
      osend %actor% Рубин на посохе слегка засветился!
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
      osend %actor% Рубин на посохе сильно засветился!
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
      osend %actor% Рубин на посохе ярко вспыхнул и погас!
      detach 91815 %self.id%
      otransform 91805
~
#91818
перезарядка посоха смерти~
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
      osend %actor% Череп на посохе слегка засветился!
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
      osend %actor% Череп на посохе сильно засветился!
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
      osend %actor% Череп на посохе ярко вспыхнул и погас!
      detach 91815 %self.id%
      otransform 91806
~
#91819
умер грифон~
0 f 100
~
if (%world.curobjs(91808)% < 2) && (%random.4% == 1)
  mload obj 91808
elseif (%world.curobjs(91818)% < 2) && (%random.4% == 1)
  mload obj 91818
end
if (%world.curobjs(91807)% < 2) && (%random.7% == 1)
  mload obj 91807
elseif (%world.curobjs(91809)% < 2) && (%random.7% == 1)
  mload obj 91809
elseif (%world.curobjs(91810)% < 2) && (%random.7% == 1)
  mload obj 91810
end
if (%world.curobjs(91815)% < 2) && (%random.5% == 1)
  mload obj 91815
elseif (%world.curobjs(91816)% < 2) && (%random.5% == 1)
  mload obj 91816
elseif (%world.curobjs(91817)% < 2) && (%random.5% == 1)
  mload obj 91817
end
if (%world.curobjs(91811)% < 2) && (%random.6% == 1)
  mload obj 91811
elseif (%world.curobjs(91812)% < 2) && (%random.6% == 1)
  mload obj 91812
elseif (%world.curobjs(91813)% < 2) && (%random.6% == 1)
  mload obj 91813
elseif (%world.curobjs(91814)% < 2) && (%random.6% == 1)
  mload obj 91814
end
~
#91820
умер горыня~
0 f 100
~
if (%world.curobjs(91819)% < 2) && (%random.1000% < 250)
  mload obj 91819
elseif (%world.curobjs(91820)% < 2) && (%random.1000% < 250)
  mload obj 91820
end
if (%world.curobjs(91821)% < 2) && (%random.1000% < 143)
  mload obj 91821
elseif (%world.curobjs(91822)% < 2) && (%random.1000% < 143)
  mload obj 91822
elseif (%world.curobjs(91823)% < 2) && (%random.1000% < 143)
  mload obj 91823
end
if (%world.curobjs(91828)% < 2) && (%random.1000% < 200)
  mload obj 91828
elseif (%world.curobjs(91829)% < 2) && (%random.1000% < 200)
  mload obj 91829
elseif (%world.curobjs(91830)% < 2) && (%random.1000% < 200)
  mload obj 91830
end
if (%world.curobjs(91824)% < 2) && (%random.1000% < 180)
  mload obj 91824
elseif (%world.curobjs(91825)% < 2) && (%random.1000% < 180)
  mload obj 91825
elseif (%world.curobjs(91826)% < 2) && (%random.1000% < 180)
  mload obj 91826
elseif (%world.curobjs(91827)% < 2) && (%random.1000% < 180)
  mload obj 91827
end
~
#91821
умер дубыня~
0 f 100
~
if (%world.curobjs(91830)% < 2) && (%random.1000% < 250)
  mload obj 91830
elseif (%world.curobjs(91831)% < 2) && (%random.1000% < 250)
  mload obj 91831
end
if (%world.curobjs(91832)% < 2) && (%random.1000% < 143)
  mload obj 91832
elseif (%world.curobjs(91833)% < 2) && (%random.1000% < 143)
  mload obj 91833
elseif (%world.curobjs(91834)% < 2) && (%random.1000% < 143)
  mload obj 91834
end
if (%world.curobjs(91839)% < 2) && (%random.1000% < 200)
  mload obj 91839
elseif (%world.curobjs(91840)% < 2) && (%random.1000% < 200)
  mload obj 91840
elseif (%world.curobjs(91841)% < 2) && (%random.1000% < 200)
  mload obj 91841
end
if (%world.curobjs(91835)% < 2) && (%random.1000% < 180)
  mload obj 91835
elseif (%world.curobjs(91836)% < 2) && (%random.1000% < 180)
  mload obj 91836
elseif (%world.curobjs(91837)% < 2) && (%random.1000% < 180)
  mload obj 91837
elseif (%world.curobjs(91838)% < 2) && (%random.1000% < 180)
  mload obj 91838
end
~
#91822
умер усыня~
0 f 100
~
if (%world.curobjs(91843)% < 2) && (%random.1000% < 250)
  mload obj 91843
elseif (%world.curobjs(91842)% < 2) && (%random.1000% < 250)
  mload obj 91842
end
if (%world.curobjs(91846)% < 2) && (%random.1000% < 143)
  mload obj 91846
elseif (%world.curobjs(91844)% < 2) && (%random.1000% < 143)
  mload obj 91844
elseif (%world.curobjs(91845)% < 2) && (%random.1000% < 143)
  mload obj 91845
end
if (%world.curobjs(91851)% < 2) && (%random.1000% < 200)
  mload obj 91851
elseif (%world.curobjs(91852)% < 2) && (%random.1000% < 200)
  mload obj 91852
elseif (%world.curobjs(91853)% < 2) && (%random.1000% < 200)
  mload obj 91853
end
if (%world.curobjs(91847)% < 2) && (%random.1000% < 180)
  mload obj 91847
elseif (%world.curobjs(91848)% < 2) && (%random.1000% < 180)
  mload obj 91848
elseif (%world.curobjs(91849)% < 2) && (%random.1000% < 180)
  mload obj 91849
elseif (%world.curobjs(91850)% < 2) && (%random.1000% < 180)
  mload obj 91850
end
~
$~
