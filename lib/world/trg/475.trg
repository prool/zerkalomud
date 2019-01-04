#47500
reset~
2 f 100
~
calcuid reset 47545 room
detach 47503 %reset.id%
attach 47503 %reset.id%
calcuid reset 47537 room
detach 47516 %reset.id%
attach 47516 %reset.id%
eval i 6
eval num 0
while %i% > 0
  eval reset 47569+%num%
  calcuid reset %reset% room
  detach 47504 %reset.id%
  attach 47504 %reset.id%
  eval i %i%-1
  eval num %num%+1
done 
eval i 3
eval num 0
while %i% > 0
  eval reset 47577+%num%
  calcuid reset %reset% room
  detach 47504 %reset.id%
  attach 47504 %reset.id%
  eval i %i%-1
  eval num %num%+1
done 
calcuid reset 47503 mob
detach 47517 %reset.id%
attach 47517 %reset.id%
detach 47522 %reset.id%
attach 47522 %reset.id%
detach 47518 %reset.id%
calcuid reset 47505 mob
detach 47519 %reset.id%
attach 47519 %reset.id%
detach 47520 %reset.id%
attach 47520 %reset.id%
detach 47521 %reset.id%
~
#47501
умер лесничий~
0 f 100
~
if (%world.curobjs(47512)% < 10) && (%random.5% == 1)
  mload obj 47512
end     
~
#47502
умер оборотень~
0 f 100
~
mecho _Оборотень злобно посмотрел на Вас и упал на землю замертво
mecho _Тут же его кожа сгорела и скелет восстал из его трупа
if (%world.curobjs(47530)% < 10) && (%random.5% == 2)
  mload obj 47530  
end
mload mob 47508
~
#47503
Ставим портал~
2 e 100
1~
wait 3ms
if %world.curmobs(47507)% == 0
  wportal 47580 2
  wait 1s
  wecho &bИз портала повеяло холодом&n
  detach 47503 %self.id%
end
~
#47504
Лоудим трупаков~
2 e 100
~
wait 1ms 
eval i 0
foreach zom %self.pc%
  eval i %i%+1
done
if %i% == 0
  halt
end
wecho _Земля под Вами треснула, и скозь трещину начали вылезать мертвецы
wait 1s
while %i% > 0
  eval npc 47507+%random.3%
  wload mob %npc%
  calcuid npc %npc% mob
  wecho _Из земли вылез%npc.q% %npc.name%
  eval i %i%-1
done
detach 47504 %self.id%
~
#47505
Дамаг в Ледяных пещерах~
2 e 100
~
wait 2ms
while 1 > 0
  foreach pc %self.pc%
    if %pc.affect(ледяная аура)% != 1
      wsend %pc% _Вы постепенно замерзаете на этом холоде
      wdamage %pc% 20
      if (%random.15% == 1) && (%pc.affect(обездвижен)% == 0)
        wsend %pc.name% _От этого холода вы превратились в ледяную статую
        wechoaround %pc% %pc.name% превратился в ледяную статую
        dg_affect %pc.name% обездвижен оцепенение 1 30 1
      end   
    end   
    
  done
  eval pc 000
  eval i 0
  foreach pc %self.pc%
    eval i %i% + 1
  done
  eval pc 000
  if %i% == 0
  break
  halt
end  
wait 15s  
done
~
#47506
Заблудились в лесу~
2 e 100
~
wait 1ms
if %random.10% == 1
  wecho Земля под ногами затрещала и перед Вами возник Скелет
  wait 2ms
  wload mob  47508
end
eval pol %actor.realroom%
while 1 > 0
  wait 1s
  eval room 47553+%random.11%
  wdoor %pol% west room %room% 
  eval room 47553+%random.11%
  wdoor %pol% south room %room%
  eval room 47553+%random.11%   
  wdoor %pol% north room %room%
  eval room 47553+%random.11%  
  wdoor %pol% east room %room%
  switch %random.4%
    case 1 
      wdoor %pol% north purge
    break     
    case 2 
      wdoor %pol% south purge
    break
    case 3 
      wdoor %pol% east purge 
    break
    case 4
      wdoor %pol% west purge 
    break 
  done       
  eval i 0
  foreach pc %self.pc%
    eval i %i% + 1
  done
  eval pc 000
  if %i% == 0
  break
  halt
end  
done
~
#47507
Слуга печатает комнату~
0 q 100
~
wait 1s 
mecho %self.name% произнес : 'вороги не войдут'.
mecho %self.name% запечатал магией все входы.
mdoor 47574 east purge
mdoor 47545 west purge
while 1 > 0
  wait 1s
  eval i 0
  foreach pc %self.pc%
    eval i %i% + 1
  done
  eval pc 000
  if %i% == 0
    mdoor 47574 east room 47576
    mdoor 47545 west room 47576
  break
  halt
end  
done
~
#47508
Выход из леса 1~
2 e 100
~
wait 1ms
wdoor 47559 north room 47565
~
#47509
Умер слуга~
0 f 100
~
detach 47507 %self.id%
detach 47508 %self.id%
mdoor 47574 east room 47576
mdoor 47545 west room 47576
switch %random.9%
  case 1 
    if (%world.curobjs(47500)% < 5) && (%random.5% == 1)
      mload obj 47500  
    end
  break
  case 2 
    if (%world.curobjs(47501)% < 5) && (%random.5% == 1)
      mload obj 47501  
    end
  break
  case 3 
    if (%world.curobjs(47513)% < 5) && (%random.5% == 1)
      mload obj 47513  
    end
  break
  case 4 
    if (%world.curobjs(47514)% < 5) && (%random.5% == 1)
      mload obj 47514  
    end
  break
  case 5 
    if (%world.curobjs(47515)% < 5) && (%random.5% == 1)
      mload obj 47515  
    end
  break
  case 6 
    if (%world.curobjs(47516)% < 5) && (%random.5% == 1)
      mload obj 47516  
    end
  break
  case 7 
    if (%world.curobjs(47517)% < 5) && (%random.5% == 1)
      mload obj 47517  
    end
  break
  case 8 
    if (%world.curobjs(47518)% < 5) && (%random.5% == 1)
      mload obj 47518  
    end
  break
  case 9 
    if (%world.curobjs(47519)% < 5) && (%random.5% == 1)
      mload obj 47519  
    end
  break
done
~
#47510
Выход из леса 2~
2 e 100
~
wait 1ms
wdoor 47554 south room 47552
~
#47511
помер медведь~
0 f 100
~
if (%world.curobjs(47509)% < 10) &&  (%random.5% == 1)
  mload obj 47509
elseif (%world.curobjs(47510)% < 10) &&  (%random.5% == 1)
  mload obj 47510
end
~
#47512
помер волк~
0 f 100
~
if (%world.curobjs(47509)% < 10) &&  (%random.5% == 1)
  mload obj 47511
end
~
#47513
умер опытный~
0 f 100
~
if (%world.curobjs(47512)% < 10) && (%random.5% == 1)
  mload obj 47512
end   
~
#47514
Дамаг в огненных пещерах~
2 e 100
~
wait 2ms
while 1 > 0
  foreach pc %self.pc%
    if %pc.affect(огненная аура)% != 1
      wsend %pc% _Языки пламени медленно поджаривают Вас
      wdamage %pc% 40
    end   
    
  done
  eval pc 000
  eval i 0
  foreach pc %self.pc%
    eval i %i% + 1
  done
  eval pc 000
  if %i% == 0
  break
  halt
end  
wait 15s  
done
~
#47515
вспышки кристала~
1 b 30
~
oecho _Кристал ярко вспыхнул и тут же погас
~
#47516
пента 2~
2 e 100
~
wait 3ms
if %world.curmobs(47521)% == 0
  wecho _Кристал ярко засветился и стал мигать все чаще
  wait 1s
  wportal 47545 3
  detach 47516 %self.id%
end
~
#47517
лесник направляет~
0 q 100
~
wait 1s
say Беда приключилась в наших лесах.
say Пришли сюда как-то молодые охотники поохотиться и опыту набраться.
дум
wait 2ms
say Но вот беда приключилась с четырьмя из них.
say Предупеждал я их, что нечистая сила поселилась в глуши нашего леса
say Не послушали они, забрели туда и более никто их невидел.
wait 1s
эм поковырял пальцем в ухе и продолжил
wait 1s
say Но после того, как они пропали, стали происходить странные вещи.
say Я здесь живу уже давно, зверье меня знает и без причины не нападает.
say Но как-то одичали они все разом, небезопасно теперь ходить
say А что творится там в глуши сам черт не знает
ик
wait 1s
say Так вот и не могут вернуться оставшиеся здесь охотники.
say Неведомая сила не пускает их, видимо злой колдун заточил души тех четверых в темницы
say И проклял их на вечное мучение.
wait 1s
дум
wait 2ms
say Прознал я, что у колдуна этого есть некий источник силы, питающий его
say Просьба к тебе будет, уничтожь его, верни мой лес в прежнее состояние
say За наградой я не постою, богатство у меня есть, не волнуйся.
say Ну как поможешь мне?
~
#47518
леснику дали амулет амулет~
0 j 100
~
if %object.vnum% != 47524
  wait 1s
  Say Что-то не то ты мне принес
  Say Мне нужет амулет силы злобного колдуна
  дат %obj.iname% %actor.iname%
  выб все
  halt
else 
  wait 1s
  сия
  say Ты действительно смог это сделать
  say Как я и обещал, за наградой я не постою.
  mload obj 47525
  дат куча %actor.name%
end
detach 47518 %self.id%
~
#47519
квест у опыного~
0 q 100
~
wait 1s
say Пришли мы сюда поохотиться и разбогатеть
say Славятся здешние места своими животными и диковинными вещами
say Но вот не послушались четыре алчных охотничка местного лесника и отправились в глушь
say С тех пор никто их и невидел
буб
wait 1s
say Но вот узнал я, что в лесу живет очень странный колдун
say Поклоняется он нечистой силе и, наверное, самому черту
say Околдовал он нас, и теперь мы вынуждены до самой смерти жить в этом лесу
say А дело все в том, что заточил этот колдун духов тех охотничков в магическую тюрьму
дум
wait 1s
say И сказал, пока они там, нам нет пути отсюда
say Наших сил спасти их не хватает, но вот у колдуна этого есть источник силы
say Будь бы он у нас, мы бы смогли свободно вернуться к своим детям и женам.
say Помоги нам!!! 
~
#47520
сказал помогу опытному~
0 d 1
помогу~
wait 2s
say Вот и чудненько, подожду тебя здесь
attach 47521 %self.id%
detach 47519 %self.id%
detach 47520 %self.id%
~
#47521
дали амулет опытному~
0 j 100
~
if %object.vnum% != 47524
  wait 1s
  Say Что-то не то ты мне принес
  Say Мне нужет амулет силы злобного колдуна
  дат %obj.iname% %actor.iname%
  выб все
  halt
else 
  сия
  say Ты действительно смог это сделать
  say Спасибо тебе большое, так уж и быть научу я тебя премудростям всяким
  switch %actor.class%
    case 1
      if %actor.skill(лидерство)% <100
        mskilladd %actor.name% лидерство 5
      else 
        say Ты уже очень умен, я ничему тебя не научу
      end
    break
    case 2
      if %actor.skill(заколоть)% <100
        mskilladd %actor.name% заколоть 5
      else 
        say Ты уже очень умен, я ничему тебя не научу
      end
    break
    case 3
      if %actor.skill(богатырский молот)% <100
        mskilladd %actor.name% богатырский.молот 5
      else 
        say Ты уже очень умен, я ничему тебя не научу
      end
    break
    case 4
      if %actor.skill(заколоть)% <100
        mskilladd %actor.name% заколоть 5
      else 
        say Ты уже очень умен, я ничему тебя не научу
      end
    break
    case 5
      if %actor.skill(осторожный стиль)% <100
        mskilladd %actor.name% осторожный.стиль 5
      else 
        say Ты уже очень умен, я ничему тебя не научу
      end
    break
    case 7
      if %actor.skill(врата)% <100
        mskilladd %actor.name% врата 5
      else 
        say Ты уже очень умен, я ничему тебя не научу
      end
    break
    case 9
      if %actor.skill(точный стиль)% <100
        mskilladd %actor.name% точный.стиль 5
      else 
        say Ты уже очень умен, я ничему тебя не научу
      end
    break
    case 10
      if %actor.skill(луки)% <100
        mskilladd %actor.name% луки 5
      else 
        say Ты уже очень умен, я ничему тебя не научу
      end
    break    
    case 11
      if %actor.skill(оглушить)% <100
        mskilladd %actor.name% оглушить 5
      else 
        say Ты уже очень умен, я ничему тебя не научу
      end
    break       
    case 12
      if %actor.skill(метнуть)% <100
        mskilladd %actor.name% метнуть 5
      else 
        say Ты уже очень умен, я ничему тебя не научу
      end
    break
    default
      дум
      say Извини, но ты очень умен и мне самому следовало бы поучиться у тебя
    break
  done
end
detach 47521 %self.id%
~
#47522
сказали помогу леснику~
0 d 1
помогу~
wait 5ms
attach 47518 %self.id%
detach 47517 %self.id%
say Вот и чудненько, подожду здесь
detach 47522 %self.id%
~
#47523
умерла тень~
0 f 100
*~
switch %random.4%
  case 1 
    if (%world.curobjs(47520)% < 10) && (%random.5% == 1)
      mload obj 47520  
    end
  break
  case 2 
    if (%world.curobjs(47521)% < 10) && (%random.5% == 1)
      mload obj 47521  
    end
  break
  case 3 
    if (%world.curobjs(47522)% < 10) && (%random.5% == 1)
      mload obj 47522 
    end
  break
  case 4 
    if (%world.curobjs(47532)% < 10) && (%random.5% == 1)
      mload obj 47532 
    end
  break
done
~
#47524
умер скелет~
0 f 100
~
if %random.5% == 3
  mecho _Кажется скелет был уничтожен, но его кости стали снова срастаться
  mecho _Как новенький скелет восстал перед Вами
  mload mob 47508
end
if (%world.curobjs(47529)% < 10) && (%random.5% == 1)
  mload obj 47529
end
~
#47525
умерла ведьма~
0 f 100
~
if (%world.curobjs(47531)% < 10) && (%random.5% == 1)
  mload obj 47531
end
~
$~
