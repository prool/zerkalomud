#12300
Поклон лекаря~
0 q 50
~
wait 1
поклон %actor.name%
~
#12301
Дозорный смотрит.~
0 b 25
~
%echo% Дозорный что-то заметил вдали и начал пристально вглядываться
~
#12302
Дум~
0 b 25
~
дум
~
#12303
Умнич~
0 b 25
~
заумно
~
#12304
Мечт~
0 b 25
~
мечт
~
#12305
руг~
0 b 15
~
руг
~
#12306
призрак стонет~
0 b 25
~
%echo% Призрак принялся стонать и жаловаться на свою ужасную жизнь после смерти.
~
#12307
Вход на арену~
2 e 100
~
wait 2
wsend %actor.name% Вы на ристалище! 
wsend %actor.name% Вот где может разгуляться душа русская, к бою привычная. 
~
#12308
Выход с арены~
2 c 100
ждать~
wait 1
wechoaround %actor% %actor.name% ушел на юг.
wsend %actor.name% _Вас выпустили с ристалища.
wsend %actor.name% _Вы пошли на юг.
wteleport %actor% 12338
wat 12338 wechoaround %actor% %actor.name% пришел с севера.
~
#12309
Богатырь смотрит на вас.~
0 r 25
~
if %actor.name%==адиту
  поклон %actor.name%
else
  оскал %actor.name%
end
~
#12310
получить шмот~
2 c 100
получить~
if ((%actor.clan% != дсс) || (%actor.clanrank% < 9))
  return 1
  halt
end
wait 1
if (%arg.contains(знамя)% && (%world.curobjs(12320)% < 25 ))
  wecho Стрибог появился в клубах дыма и бросил знамя Северного Союза.
  wload obj 12320
  halt
elseif (%arg.contains(медаль)% && (%world.curobjs(12321)% < 25 ))
  wecho Стрибог появился в клубах дыма и бросил медаль Северного союза.
  wload obj 12321
  halt
elseif (%arg.contains(орден)% && (%world.curobjs(12322)% < 25 ))
  wecho Стрибог появился в клубах дыма и бросил орден Северного Союза.
  wload obj 12322
  halt
elseif (%arg.contains(перстень)% && (%world.curobjs(12323)% < 25 ))
  wecho Стрибог появился в клубах дыма и бросил перстень с эмблемой Северного Союза.
  wload obj 12323
  halt
end
wait 1s
wsend %actor% ...и ничего не произошло.
~
#12311
Получить ковер.~
0 m 0
500~
if (%world.curobjs(12305)% <= 300)
  ск %actor.name% Получи скакуна.
  ск %actor.name% Не забудь что его можно развернуть и свернуть.
  mload obj 12305
  дать коврик %actor.name%   
else
  say Нету ковров - кончились!
end
~
#12312
Развернуть ковер.~
1 c 3
развернуть~
if ((%actor.clan% == дсс ) && (%world.curmobs(12311)% <= 50))
  oechoaround %actor% %actor.name% аккуратно расправил%actor.g% ковер.
  osend %actor% Вы аккуратно расправили ковер.
  oload mob 12311
  wait 1
  opurge %self%
else
  oechoaround %actor% %actor.name% попытал%actor.u% развернуть ковер, но ничего не получилось.
  osend %actor% Вы попытались расправить ковер, но ничего не получилось.
end
~
#12313
Свернуть ковер.~
0 c 0
свернуть~
if (%actor.clan%==дсс)
  mechoaround %actor% %actor.name% аккуратно сложил%actor.g% ковер.
  msend %actor% Вы аккуратно сложили ковер.
  mload obj 12305
  calcuid target 12311 mob 
  mpurge %target%
else
  mechoaround %actor% %actor.name% попытал%actor.u% сложить ковер, но тот вырвался из рук.
  msend %actor% Вы попытались сложить ковер, но он вырвался из ваших рук.
end
~
#12314
дали девке~
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
    mecho Девка зачитала свиток.
    dg_cast 'серьезное исцеление' %actor.name%
  break
  case 50
    mecho Девка зачитала свиток.
    dg_cast 'защита' %actor.name%
  break
  case 60
    mecho Девка зачитала свиток.
    dg_cast 'затуманивание' %actor.name%
  break
  case 70
    mecho Девка зачитала свиток.
    dg_cast 'сила' %actor.name%
  break
  case 80
    mecho Девка зачитала свиток.
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
#12315
на башне~
2 c 100
лететь~
wait 1
halt
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
#12316
проверка пола для розы 12397~
1 ghjlt 100
~
wait 1
if %actor.sex% == 2
  halt
endif
oecho Роза затрепыхалась и завяла.
wait 1
opurge %self%
~
#12317
check DSS item~
1 ghi 100
~
wait 1
if %actor.clan% == дсс
  halt
endif
oecho Раздался легкий хлопок воздуха.
wait 1
%purge% %self%
~
#12318
именная шмотка~
1 gj 100
взмахнуть~
wait 1
if %actor.level%>30
  halt
end
if %actor.name% == Прокиус
  foreach i %self.pc%
    if %i.name% != Прокиус
      osend %i% Лазурная пентаграмма на посохе Прокиуса медленно повернулась.
    end
    * comm 10
  done
  osend %actor% Пентаграмма на посохе медленно повернулась.
  halt
endif
osend %actor% Посох с лазурной пентаграммой вырвался из Ваших рук.
osend %actor% Яркая вспышка ослепила Вас на мгновение.
wait 1
%purge% %self%
~
#12319
проверка видимости~
0 z 100
~
foreach pers %self.pc%
  if %pers.name% == Прокиус
    if %pers.canbeseen%
      msend %actor% Пентаграмма на посохе в руках Прокиуса медленно повернулась.
    end
  end
done
~
#12320
Знамя ДСС не берется неклановыми~
1 g 100
~
if ((%actor.name% == Женя) && (%actor.clan% == дсс))
  *if %actor.clan% == дсс
  halt
end
return 0
osend %actor% _Вас обожгло при попытке взять стяг Северного Союза!
oechoaround %actor%  %actor.name% попытал%actor.u% взять стяг Северного Союза - и чудом не сгорел%actor.g%!
~
#12321
Сообщение о стяге~
1 t 100
~
wait 1
if %actor.clan% != дсс
  osend %actor% &CВы заметили развевающийся на ветру стяг Северного Союза.&n
end
~
$~
