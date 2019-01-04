#49800
приветствие стражников~
0 r 0
~
wait 1
if (%actor.clan% ==днз)
  if (%actor.clanrank% >= 8)
    msend %actor% При виде Вас, стражник вытянулся в струнку.
    mechoaround %actor% При виде %actor.name%, стражник вытянулся в струнку.
  else
    switch %ramdom.4%
      case 1
        сказ %actor.name% "Долгих лет тебе, %actor.name%"
      case 2
        поклон %actor.name%
    done
  endif
else
  msend %acto.namer% Стражник хмуро посмотрел на Вас.
  mechoaround %actor.name% Стражник хмуро посмотрел на %actor.name%.
endif
~
#49801
привет стражнику~
0 d 100
привет~
wait 1
say Какой вежливый пленник. Ладно, выпущу я тебя. Только больше не буянь!
mteleport %actor% 49818
~
#49802
телепорт~
2 c 100
лететь~
halt
wait 1
if (%actor.vnum% != -1)
   halt
end
if %arg.contains(деревня)%
  eval roomtel 4000+%random.61%
  wait 1
  wsend %actor% Вас подхватил воздушный вихрь и понес Вас в указанном направлении.
  wechoaround %actor% %actor.name% исчез в воздушном вихре.
  wteleport %actor.name% %roomtel%
  wforce %actor.name% смотреть
  wsend %actor% Халява кончилась, нефиг читенными триггерами пользоваться.
  wechoaround %actor% Сверкающая молния ударила %actor.rname% в голову.
  eval hit %actor.hitp% + 15
  wdamage %actor% %hit%
  halt
end
if %arg.contains(корсунь)%
  eval roomtel 27000+%random.69%
  wait 1
  wsend %actor% Вас подхватил воздушный вихрь и понес Вас в указанном направлении.
  wechoaround %actor% %actor.name% исчез в воздушном вихре.
  wteleport %actor.name% %roomtel%
  wforce %actor.name% смотреть
  wsend %actor% Халява кончилась, нефиг читенными триггерами пользоваться.
  wechoaround %actor% Сверкающая молния ударила %actor.rname% в голову.
  eval hit %actor.hitp% + 15
  wdamage %actor% %hit%
  halt
end
if %arg.contains(рыбацкая)%
  eval roomtel 33060+%random.6%
  wait 1
  wsend %actor% Вас подхватил воздушный вихрь и понес Вас в указанном направлении.
  wechoaround %actor% %actor.name% исчез в воздушном вихре.
  wteleport %actor.name% %roomtel%
  wforce %actor.name% смотреть
  wsend %actor% Халява кончилась, нефиг читенными триггерами пользоваться.
  wechoaround %actor% Сверкающая молния ударила %actor.rname% в голову.
  eval hit %actor.hitp% + 15
  wdamage %actor% %hit%
  halt
end
wsend %actor% Воздушный вихрь чуть не сбросил Вас с крыши!
wsend %actor% Осторожнее надо быть! Так и убиться недолго.
wechoaround %actor% Воздушный вихрь чуть не сбросил %actor.name% с крыши.
~
#49803
знахарь колдует~
0 m 1
~
wait 1
фиг %actor.name%
halt
if %amount% < 20
  msend %actor.name% За такие деньги я даже пальцем не пошевелю!
  halt
endif
switch %amount%
  case 20
    mecho Знахарь зачитал свиток.
    dg_cast 'серьезное исцеление' %actor.name%
    break
  case 50
    mecho Знахарь зачитал свиток.
    dg_cast 'защита' %actor.name%
    break
  case 60
    mecho Знахарь зачитал свиток.
    dg_cast 'затуманивание' %actor.name%
    break
  case 70
    mecho Знахарь зачитал свиток.
    dg_cast сила' %actor.name%
    break
  case 80
    mecho Знахарь зачитал свиток.
    dg_cast 'полет' %actor.name%
    break
  default
    msend %actor% Извините, но я не знаю что Вы хотите от меня за эти деньги.
    msend %actor% Вот что я могу сделать для Вас:
    msend %actor% 20 кун - серьезное исцеление.
    msend %actor% 50 кун - защита.
    msend %actor% 60 кун - затуманивание.
    msend %actor% 70 кун - сила.
    msend %actor% 80 кун - полет.
done
~
#49804
взяли колбу~
1 g 100
~
wait 1
if %actor.clan% == днз
  halt
endif
osend %actor% Мерцающая колба в Ваших руках треснула и все ее содержимое разлилось.
~
#49805
взяли сбитень~
1 g 100
~
wait 1
if %actor.clan% == днз
  halt
endif
osend %actor% Сбитень испарился из Ваших рук.
opurge сбитень
~
#49806
взяли шмот~
1 g 100
~
wait 1
if %actor.clan% == днз
  halt
endif
%purge% %self%
~
#49807
в тюрьму~
2 e 0
~
if %actor.clan% == днз
  halt
endif
if %actor.level% < 31
  halt
endif
wsend %actor% Пол под Вами провалился.
wait 1s
wsend %actor% И Вы оказались в тюрьме.
wait 1s
wsend %actor% Вот так вот. Не нужно ходить куда не следует!.
~
$~
