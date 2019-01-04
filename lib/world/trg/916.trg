#91600
умер меднокрылый василиск~
0 f 100
~
if (%world.curobjs(91608)% < 3) && (%random.5% == 1)
  mload obj 91608
end
~
#91601
умер старый меднокрылый василиск~
0 f 100
~
if (%world.curobjs(91607)% < 3) && (%random.5% == 1)
  mload obj 91607
end
~
#91602
умер молодой грифон~
0 f 100
~
if (%world.curobjs(91610)% < 3) && (%random.5% == 1)
  mload obj 91610
end
~
#91603
умер медноперый грифон ~
0 f 100
~
if (%world.curobjs(91609)% < 3) && (%random.5% == 1)
  mload obj 91609
end
~
#91604
умерла Алконост~
0 f 100
~
if (%world.curobjs(91600)% < 3) && (%random.7% == 1)
  mload obj 91600
elseif (%world.curobjs(91601)% < 3) && (%random.6% == 1)
  mload obj 91601
elseif (%world.curobjs(91602)% < 3) && (%random.5% == 1)
  mload obj 91602
elseif (%world.curobjs(91603)% < 3) && (%random.4% == 1)
  mload obj 91603
end
~
#91605
умерла Стратим~
0 f 100
~
if (%world.curobjs(91604)% < 3) && (%random.7% == 1)
  mload obj 91604
elseif (%world.curobjs(91605)% < 3) && (%random.6% == 1)
  mload obj 91605
elseif (%world.curobjs(91606)% < 3) && (%random.5% == 1)
  mload obj 91606
end
~
#91606
в бурной реке 54~
2 ab 100
~
wait 1s
wecho Река уносит Вас по течению.
wteleport all 91655
~
#91607
в бурной реке 55~
2 ab 100
~
wait 1s
wecho Река уносит Вас по течению.
wteleport all 91656
~
#91608
в бурной реке 56~
2 ab 100
~
wait 1s
wecho Река уносит Вас по течению.
wteleport all 91657
~
#91609
в бурной реке 57~
2 ab 100
~
wait 1s
wecho Река уносит Вас по течению.
wteleport all 91658
~
#91610
в бурной реке 58~
2 ab 100
~
wait 1s
wecho Река уносит Вас по течению.
wteleport all 91659
~
#91611
в бурной реке 59~
2 ab 100
~
wait 1s
wecho Река уносит Вас по течению.
wteleport all 91660
~
#91612
в бурной реке 60~
2 ab 100
~
wait 1s
wecho Река уносит Вас по течению.
wteleport all 91661
~
#91613
в бурной реке 61~
2 b 100
~
if %random.4% == 1
  wait 1s
  wecho Река уносит Вас по течению.
  wteleport all 91665
end
~
#91614
старый дракон в бою~
0 k 100
~
if %random.4% == 1
  eval target %random.pc%
  dg_cast 'кислота' %target.name%
  unset %target%
end
~
#91615
вошли к Ладе~
0 q 100
~
wait 1s
mecho Лада подняла голову и посмотрела на Вас.
wait 1s
дума 
wait 3s
say Эх, куда мир катится!
say Cмертные в Ирий как к себе домой ходят.
wait 2s
say Да еще и Скипер-зверь дочерей моих украл.
рыда
wait 4s
say Кто им теперь поможет?
wait 1s
всхлип
wait 3s
mecho Лада отвернулась и тихонько заплакала.
wait 50s
halt
~
#91616
перезарядка посоха  песка~
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
      osend %actor% Кварц на посохе слегка засветился!
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
      osend %actor% Кварц на посохе сильно засветился!
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
      osend %actor% Кварц на посохе ярко вспыхнул и погас!
      detach 91815 %self.id%
      otransform 91616
~
$~
