#47600
reset~
2 f 100
~
calcuid reset 47610 room
wdoor 47610 north room 47613
wdoor 47613 south room 47610
attach 47601 %reset.id%
attach 47603 %reset.id%
eval num 47612
while %num% < 47632
  calcuid reset %num% room
  detach 47602 %reset.id%
  eval num %num%+1
done 
calcuid reset 47608 room
attach 47604 %reset.id%
calcuid reset 47624 room
attach 47610 %reset.id%
attach 47611 %reset.id%
wdoor 47624 east room 47625
wdoor 47625 west room 47624
wdoor 47632 east purge
wdoor 47633 west purge
wdoor 47647 east purge
wdoor 47653 west purge
calcuid reset 47667 room
attach 47618 %reset.id%
wdoor 47614 west purge
wdoor 47629 north purge
calcuid reset 47632 room
attach 47612 %reset.id%
calcuid reset 47647 room
attach 47616 %reset.id%
wdoor 47654 east purge
wdoor 47675 west purge
calcuid reset 47654 room
attach 47621 %reset.id%
calcuid reset 47632 room
attach 47612 %reset.id%
calcuid reset 47647 room
attach 47616 %reset.id%
calcuid reset 47654 room
attach 47621 %reset.id%
~
#47601
Ловушка с големами 1~
2 e 100
~
wait 1ms
wdoor 47610 north purge
wdoor 47613 south purge
wait 1s
wecho _Вы почувствовали как под вашей ногой что-то щелкнуло
wait 2ms
wecho _Проход впереди стал закрываться, вам низачто не успеть
wait 3ms
wecho _Звук ломающегося камня донесся до вас, сейчас что-то случиться
calcuid num 47605 obj
exec 47607 %num%
detach 47601 %self.id%
~
#47602
лоад големов~
2 e 100
~
wait 1ms
wload mob 47600
wecho _Часть каменной стены как будто растворилась в воздухе и из проема вышел Каменный великан
wait 1s
wecho Каменный великан грозно зарычал и кинулся в бой
detach 47602 %self.id%
~
#47603
умерло 2 голема~
2 e 100
~
wait 1s
if %world.curmobs(47600)% == 2
  wecho _Каменная стена медленно поползла вбок
  wdoor 47610 north room 47613
  wdoor 47613 south room 47610
  detach 47603 %self.id%
end
~
#47604
рандомный аттач ловушки~
2 e 100
~
eval i 6
while %i% > 0
  eval roomnum 47612+%random.19%
  if %roomnum% == 47621
    eval roomnum %roomnum%+1
  end
  if %roomnum% == 47626
    eval roomnum %roomnum%-1
  end
  calcuid roomid %roomnum% room
  attach 47602 %roomnum.id%
  eval i %i%-1
  wait 1s
done
detach 47604 %self.id%
~
#47605
одеваем големов~
0 n 100
~
mload obj 47603
wait 5ms
одеть все
wait 1s
if %random.5% == 3
  wecho Великан выломал у себя из брюха огромную каменную дубину
  mload obj 47604
  воор дуб
end
detach 47605 %self.id%
~
#47606
антуражные удары великана~
0 k 5
~
mecho &yВеликан со всей силы ударил по земле, вызвав землетрясение&w
foreach pc %actor.pc%
  msend %pc% Мощное землетрясение повалило Вас на землю
  %pc.wait(1)% 
  %pc.position(6)%
  mdamage %pc% 100
done
switch %random.6%
  case 1
    wait 2s
    set target %random.pc%
    msend %target% В результате землетрясения потолок пещеры обрушился прямо на Вас
    mechoaround %target% Из-за землетрясения потолок пещеры рухнул, заваливая %target.rname%
    mdamage %target% 200
  break
  case 2
    wait 2s
    set target %random.pc%
    msend %target% Огромный каменный кулак обрушился прямо на Вас
    mechoaround %target% Огромный каменный кулак великана раздавил %target.rname%
    mdamage %target% 150
    оскал
  break
done
~
#47607
поджигаем факелы~
1 z 100
~
wait 2ms
oecho Небольшая искра промелькнула у факела и тот вспыхнул ярким пламенем
otransform 47606
~
#47608
тушим факел~
1 g 1
~
wait 2ms
osend %actor% Вы осторожно потушили факел рукой, какой же вы мужественный
oechoaround %actor% %actor.name% плюнул на руку и потушил факел
otransform 47605
~
#47609
людоед кидаеться костями~
0 k 15
~
switch %random.5%
  case 1
    mecho Людоед пошарил рукой вокруг и наткнулся на кость
    msend %actor% Людоед размахнулся и метнул в Вас кость, которая попала Вам в грудь!
    mechoaround %actor% Людоед метнул кость, которая попала %actor.dname% в грудь!
    mdamage %actor% 100
    рыч
  break
  case 2
    mecho Людоед пошарил рукой вокруг и наткнулся на кость
    msend %actor% Людоед размахнулся и метнул в Вас кость, которая попала Вам в живот!
    mechoaround %actor% Людоед метнул кость, которая попала %actor.dname% в живот!
    mdamage %actor% 150 
    ржа
  break
done
~
#47610
ловушка с големами 2~
2 e 100
~
wdoor 47624 east purge
wdoor 47625 west purge
wait 1s
wecho _Вы почувствовали как под вашей ногой что-то щелкнуло
wait 2ms
wecho _Проход впереди стал закрываться, вам низачто не успеть
wait 3ms
wecho _Звук ломающегося камня донесся до вас, сейчас что-то случиться
detach 47610 %self.id%
~
#47611
умерли все големы~
2 e 100
~
wait 1s
if %world.curmobs(47600)% == 0
  wecho _Каменная стена медленно поползла вбок
  wdoor 47624 east room 47625
  wdoor 47625 west room 47624
  wdoor 47614 west room 47681
  wait 60s
  wdoor 47614 west purge
  detach 47611 %self.id%
end
~
#47612
создаем проход в вторую часть зоны~
2 e 100
~
wait 1s
wecho Рунные письмена на стене загорелись ярким светом, озаряя все вокруг
wait 3ms
wecho Стена впереди вас стала сдвигаться вбок, открывая проход вперед
wdoor 47632 east room 47633
wdoor 47633 west room 47632
wdoor 47629 north room 47679
wait 60s
wdoor 47629 north purge
detach 47612 %self.id% 
~
#47613
(доспех) одели весь комплект~
1 b 100
~
wait 5s 
if (%self.vnum% == 47608) || (%self.vnum% == 47613)
  if !%self.worn_by%
    halt
  end
  set char %self.worn_by%
  set i 0  
  set num 0
  while %i% < 18
    eval i %i%+1
    set item %char.eq(%i%)%  
    if %item.vnum% > 47607  && %item.vnum% < 47616
      eval num %num%+1
    end
  done
  if %num%>4 
    otransform 47613                     
  else
    otransform 47608
  end
end
~
#47614
(наручи) одели весь комплект~
1 b 100
~
wait 5s 
if (%self.vnum% == 47609) || (%self.vnum% == 47614)
  if !%self.worn_by%
    halt
  end
  set char %self.worn_by%
  set i 0  
  set num 0
  while %i% < 18
    eval i %i%+1
    set item %char.eq(%i%)%  
    if %item.vnum% > 47607  && %item.vnum% < 47616
      eval num %num%+1
    end
  done
  if %num%>4 
    otransform 47614                     
  else
    otransform 47609
  end
end
~
#47615
(сапоги) одели весь комплект~
1 b 100
~
wait 5s 
if (%self.vnum% == 47612) || (%self.vnum% == 47615)
  if !%self.worn_by%
    halt
  end
  set char %self.worn_by%
  set i 0  
  set num 0
  while %i% < 18
    eval i %i%+1
    set item %char.eq(%i%)%  
    if %item.vnum% > 47607  && %item.vnum% < 47616
      eval num %num%+1
    end
  done
  if %num%>4 
    otransform 47615                     
  else
    otransform 47612
  end
end
~
#47616
делаем проход~
2 e 100
~
wait 1s
if %world.curmobs(47611)% == 0
  wecho &RРунный символы на стене загорелись ярким пламенем&w
  wait 2ms
  wecho Камення стена отъехала вбок
  wdoor 47647 east room 47653
  wdoor 47653 west room 47647
  detach 47616 %self.id%
end
~
#47617
лоудим ключ в чудище~
0 cfg 0
~
*триг убит
wait 1ms
mload obj 47600
~
#47618
ломаем палку~
2 c 1
сломать выломать срубить~
if !%arg.contains(палку)%
  wsend %actor% Что вы хотите выломать?
  halt
else 
  wsend %actor% Вы поднатужились и выломали длинную палку
  wechoaround %actor.name% %actor.name% выломал длинную палку из сухого дерева
  wload obj 47617
  wforce %actor.name% взять палк
  wait 1s
  if %random.15% == 2
    wforce %actor.name% г блин, ну че тупим то?
    set target %random.pc%
    wait 5ms
    wforce %target.name% г я не туплю, чесное слово, ну скажите что не туплю, блин
  end
  if %world.curobjs(47617)% == 3
    detach 47618 %self.id%
  end
end
~
#47619
тонем в болоте без палки~
2 e 100
~
wait 2ms
set i 0  
set num 0
while %i% < 18
  eval i %i%+1
  set item %actor.eq(%i%)%  
  if %item.vnum% == 47617
    eval num %num%+1
  end
done
if %num% == 1
  wsend %actor% Вы осторожно идете вперед прощупывая палкой каждый шаг
  wechoaround %actor.name% %actor.name% осторожно прощупывает дно болота своей палкой 
  halt
else 
  wecho Вы оступились и Вас стало засасывать в болотные топи, но у вас есть еще секунда на рекол
  wait 3s
  wecho Шанса спастить больше нет, как и воздуха, чтобы дышать
  set ind 0
  set flat 47668 47669 47670 47672 47673
  foreach pcr %flat%
    if %actor.realroom%==%pcr%
      eval ind 1
    end      
  done
  if %ind%==0
    halt
  end
  foreach pc %actor.pc%
    wdamage %pc% 1000
  done
end
~
#47620
умер волколак~
0 f 100
~
mload obj 47619
~
#47621
вставить камень~
2 c 1
вставить~
if !%arg.contains(камень)%
  wsend %actor% Что вы хотите вставить?
  halt
else 
  wecho Камень в стене слегка провернулся
  wait 1s
  wecho &WРунные письмена на стене ярко вспыхнули&w
  wdoor 47654 east room 47675
  wdoor 47675 west room 47654
  detach 47621 %self.id%
end
~
#47622
вооружаем болотника~
0 n 100
~
wait 2ms
mload obj 47618
воор палк
~
#47623
одеваем мобов~
0 n 100
~
set i 47620
while %i% < 47629
  mload obj %i%
  eval i %i%+1
done
wait 2ms
од все
воор меч
detach %self.id%
~
#47624
умер ледяной дракон~
0 f 100
~
mload obj 47612
if (%world.curobjs(47633)% < 6) && (%random.5% == 1)
  mload obj 47633
end     
~
#47625
умер огненный дракон~
0 f 100
~
mload obj 47611
if (%world.curobjs(47637)% < 6) && (%random.5% == 1)
  mload obj 47637
end     
~
#47626
умер зеленый дракон~
0 f 100
~
mload obj 47610
mload obj 47608
if (%world.curobjs(47639)% < 6) && (%random.5% == 1)
  mload obj 47639
end     
~
#47627
умерло трехголовое~
0 f 100
~
mload obj 47609
mload obj 47600
if (%world.curobjs(47636)% < 4) && (%random.1000% <= 90)
  mload obj 47636
end     
~
#47628
умер голем~
0 f 100
~
if (%world.curobjs(47629)% < 6) && (%random.5% == 1)
  mload obj 47629
end     
~
#47629
умер людоед~
0 f 100
~
if (%world.curobjs(47630)% < 6) && (%random.5% == 1)
  mload obj 47630
end   
~
#47630
умерла душа(хотя как может душа умереть:-) )~
0 f 100
~
if (%world.curobjs(47631)% < 6) && (%random.5% == 1)
  mload obj 47631
end   
~
#47631
умерла свинья~
0 f 100
~
if (%world.curobjs(47632)% < 6) && (%random.4% == 1)
  mload obj 47632
end   
~
#47632
умер волк~
0 f 100
~
if (%world.curobjs(47634)% < 6) && (%random.5% == 1)
  mload obj 47634
end   
~
#47633
порубили дерево~
0 f 100
~
if (%world.curobjs(47635)% < 13) && (%random.5% == 1)
  mload obj 47635
end   
~
#47634
загнулся болотник~
0 f 100
~
if (%world.curobjs(47638)% < 6) && (%random.5% == 1)
  mload obj 47638
end   
~
#47635
рыцарь окачурился~
0 f 100
~
if (%world.curobjs(47640)% < 6) && (%random.5% == 1)
  mload obj 47640
end   
~
#47636
стражник отбросил копыта~
0 f 100
~
mload obj 47601
~
#47637
упинали князя~
0 f 100
~
if (%world.curobjs(47641)% < 6) && (%random.5% == 1)
  mload obj 47641
end  
~
#47666
приветствие странного типа~
0 q 100
~
wait 1
say Приветствую тебя путешественник!
улы .%actor.name%
wait 1
mecho Странный тип достал трубку, и стал ее раскуривать.
wait 1
say Все что ты увидишь дальше - всего лишь сон, а виновата во всем дурман-трава.
mecho Странный тип вдохнул дым и замолчал.
detach 47666 %self.id%
~
$~
