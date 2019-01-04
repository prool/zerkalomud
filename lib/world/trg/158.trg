#15802
духи~
0 q 30
~
wait 1
if (%actor.clan% ==хрб)
  if (%actor.clanrank% >= 8)
    msend %actor% При виде Вас, дух дружинника встал на ноги.
    mechoaround %actor% При виде %actor.name%, дух дружинника встал на ноги.
  else
    switch %ramdom.4%
      case 1
        сказ %actor.name% "Приветствую тебя, %actor.name%"
      case 2
        лизн %actor.name%
    done
  endif
else
  msend %acto.namer% Дух дружинника внимательно осмотрел Вас.
  mechoaround %actor.name% Дух дружинника внимательно посматрел на %actor.name%.
        кул %actor.name%
        insult %actor.name%
endif
~
#15803
хрб~
1 gj 100
~
wait 1
if (%actor.clan% == хрб) || (%actor.vnum% != -1)
halt
end
wait 1
opurge %self%
~
#15804
девочка~
0 m 1
~
wait 1s
восторг
wait 2
цел .%actor.name%
ласк .%actor.name%
wait 3
флирт .%actor.name%
halt
wait 1
if %amount% < 100
  msend %actor.name% За такие деньги я даже пальцем не пошевелю!
  halt
endif
switch %amount%
  case 100
    mecho Девочка зачитала свиток.
    dg_cast 'серьезное исцеление' %actor.name%
    break
  case 200
    mecho Девочка зачитала свиток.
    dg_cast 'защита' %actor.name%
    break
  case 300
    mecho Девочка зачитала свиток.
    dg_cast 'затуманивание' %actor.name%
    break
  case 400
    mecho Девочка зачитала свиток.
    dg_cast сила' %actor.name%
    break
  case 500
    mecho Девочка зачитала свиток.
    dg_cast 'полет' %actor.name%
    break
  default
    msend %actor% Извините, но я не знаю что Вы хотите от меня за эти деньги.
    msend %actor% Вот что я могу сделать для Вас:
    msend %actor% 100 кун - серьезное исцеление.
    msend %actor% 200 кун - защита.
    msend %actor% 300 кун - затуманивание.
    msend %actor% 400 кун - сила.
    msend %actor% 500 кун - полет.
done
~
$~
