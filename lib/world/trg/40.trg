#4000
триггер на скорняке ~
0 j 100
~
wait 2
switch %object.name% 
case труп мыши
  say  Благодарствую, ты меня выручаешь, получи плату. 
  %self.gold(+1)%
  дать 1 кун %actor.name%
  mpurge труп 
break
case труп норки
  say    Благодарствую, получится хорошая шкурка на шубу, получи плату. 
  %self.gold(+20)%
  дать   20 кун %actor.name%
  mpurge труп 
break
case труп лисы
  say    Благодарствую, получится хорошая шкурка на шубу, получи плату. 
  %self.gold(+30)%
  дать   30 кун %actor.name%
  mpurge труп 
break
case труп медведя
  say    Благодарствую, получится превосходный тулуп, получи плату. 
  %self.gold(+80)%
  дать   80 кун %actor.name%
  mpurge труп 
break
case труп зайца
  say    Благодарствую, получится хорошая шапка, получи плату. 
  %self.gold(+10)%
  дать   10 кун %actor.name%
  mpurge труп 
break
case труп ондатры
  say    Благодарствую, получится хороший воротник, получи плату. 
  %self.gold(+40)%
  дать   40 кун %actor.name%
  mpurge труп 
break
case труп бобра
  say    Благодарствую, хороший мех, получи плату. 
  %self.gold(+25)%
  дать   25 кун %actor.name%
  mpurge труп 
break
case труп барсука
  say    Благодарствую, хороший мех, получи плату. 
  %self.gold(+25)%
  дать   25 кун %actor.name%
  mpurge труп 
break
case труп выдры
  say    Благодарствую, хороший мех, получи плату. 
  %self.gold(+22)%
  дать   22 кун %actor.name%
  mpurge труп 
break
default
  say  Зачем мне это? 
  eval getobject %object.name%
  if  %getobject.car% == труп
     mpurge труп
  else
     броси %getobject.car%.%getobject.cdr%
  end
  break
done 
~
#4001
триггер на хозяйке мельницы ~
0 q 100
~
if %actor.level% >= 10 || (%actor.gold% >= 20) || (%actor.bank% >= 20) 
   halt
end
wait  1
msend %actor% Хозяйка сказала Вам:
if %actor.sex% == 1
   msend %actor% - Эх ты горемычный, голодный наверное, %actor.name%.
elseif
   %actor.sex% == 2
   msend %actor% - Эх ты горемычная, голодная наверное, %actor.name%.
end
  msend %actor% - Что мы нехристи чтоли, чтоб не накормить. 
*  msend %actor% - всегда найду чем накормить, 
  msend   %actor% - Сейчас, подожди...
dg_cast 'насыщение' %actor.name%
~
#4002
входнапостой~
0 r 100
~
wait 1
eval factor %self.people%
while %factor%
  eval pc %factor.next_in_room%
  if (%factor.vnum% == -1) && (%factor.level%>19) && (%factor.level%<31)
    if %factor.sex%==1
      tell %factor.name% Вырос ты уже, нечего тебе здесь штаны просиживать.
    else
      tell %factor.name% Выросла ты уже, нечего тебе здесь юбку просиживать.
    end
    tell %factor.name% Не пушу я тебя здесь на постой, иди в город, там где большие нужны.
    tell %factor.name% А от вас только проблемы здесь будут.
    mechoaround %factor% Хозяин вытолкнул %factor.vname% на улицу.
    msend %factor.name% Хозяин вытолкнул вас на улицу.
    mteleport %factor.name% 4014
    mteleport %factor.name% 4014
    mteleport %factor.name% 4014
    mteleport %factor.name% 4014
    mteleport %factor.name% 4014
    mteleport %factor.name% 4014
    mteleport %factor.name% 4014
    if %factor.sex%==1
      mat 4014 mechoaround %factor% Немного взлохмаченный %factor.name% пришел с запада.
    else
      mat 4014 mechoaround %factor% Немного взлохмаченная %factor.name% пришла с запада.
    end
  end
  if %pc.id% && %pc.id%!=%factor.id%
    makeuid factor %pc.id%
  else
    unset factor
  end
done
~
#4003
нападениежителя~
0 k 100
~
set name2 %actor%
if %actor.leader%
   set name1 %actor.leader%
   if (%name1.vnum% == -1) && (%actor.vnum% != -1))
     set name2 %actor.leader%
   end
end
if !%name2.rentable%
msend %actor% %self.name% СМЕРТЕЛЬHО ударил%self.g% Вас.
mdamage %actor% 300
бежать
   halt
end
г %name2.name%, у нас найдется управа на таких обидчиков!
msend %actor.name% Вдруг прибежал здоровый парень и оглушил вас.
mechoaround %actor% Прибежал здоровый парень, оглушил %actor.rname% и куда-то уволок.
wait 1
msend %name2.name% Вы потеряли сознание.
wait 1
msend %name2.name% Вы пришли в сознание в глубокой яме от удара о землю.
if %name2.hitp%>0
msend %name2% Кто-то сверху сильно руганулся, помянул всех ваших родственников до десятого колена.
msend %name2% Кто-то сверху сказал: Посиди здесь пока не успокоишься.
msend %name2% Да, если хочешь выйти говори: простите меня дурака, может и выпущу.
mteleport %name2% 4058
*mat 4058 mechoaround %name2% Решетка в яме открылась и %name2.name% упал%name2.a% сверху в яму.
*mat 4058 mechoaround %name2% Кто-то сильно руганулся, помянул всех родственников %actor.rname% до десятого колена.
*mat 4058 mechoaround %name2% Кто-то сверху сказал: 
*mat 4058 mechoaround %name2% Посиди здесь пока не успокоишься.
*wait 1
*if %name2.sex%==1
*mat 4058 mechoaround %name2% Да, если хочешь выйти говори: простите меня дурака, может и выпущу.
*else
*mat 4058 mechoaround %name2% Да, если хочешь выйти говори: простите меня дуру, может и выпущу.
*end
end
~
#4004
выходаизямы~
2 d 0
"простите меня дурака" "простите меня дуру"~
wait 1
if %random.10%<2
wecho Решетка в яме окрылась, оттуда показалась здоровенная полубритая физиономия.
wecho Ладно, хватит хныкать, выпущу!
wecho В следующий раз думай, прежде чем жителей обижать наших!
if %actor.hitp%>0
wteleport %actor.name% 4000
wat 4000 wechoaround %actor% К решетке подошел здоровый парень, открыл замок.
wat 4000 wechoaround %actor% Поднял решетку и одним движением вытащил кого-то.
wat 4000 wechoaround %actor% Снова повесил массивный замок.
if (%actor.sex% == 1)
wat 4000 wechoaround %actor% %actor.name% размял кости, похоже в яме ему было неудобно.
else
wat 4000 wechoaround %actor% %actor.name% размяла кости, похоже в яме ей было неудобно.
end
end
else
wechoaround %actor% Никто не прореагировал на слова %actor.rname%.
wsend %actor% Никто не прореагировал на ваши слова.
wsend %actor% Наверное не очень искренне все прозвучало, повторите с чувством.
end
~
#4005
призовой триг на лисе~
0 f 100
~
%actor.exp(+200000)%
~
#4006
ПКиллер заходит к помощникам~
0 q 80
~
wait 1
if %actor.clan% != null
halt
end
if !%actor.agressor%
halt
end
if %actor.agressor% > 4000
if %actor.agressor% < 4099
set agr 1
end
end
if %actor.agressor% > 4300
if %actor.agressor% < 4399
set agr 1
end
end
if %actor.agressor% > 4800
if %actor.agressor% < 4899
set agr 1
end
end
if %agr% == 1
if %actor.sex% == 1
крича %actor.name%, - вот он, убивец, хватай его! Вяжи его!
else
крича %actor.name%, мерзавка, хватай ее! Вяжи ее!
end
Крича %actor.name% - вот он%actor.g% где, хватай, ребяты!
mkill %actor% 
end
~
#4007
Помощник заходик к ПКиллеру~
0 t 100
~
wait 1
if %actor.clan% != null
halt
end
foreach char %self.pc%
if %char.agressor% > 4000
if %char.agressor% < 4099
set target %char%
break
end
end
if %char.agressor% > 4300
if %char.agressor% < 4399
set target %char%
break
end
end
if %char.agressor% > 4800
if %char.agressor% < 4899
set target %char%
break
end
end
done
if !%target%
halt
end
if %target.sex% == 1
крича %target.name%, - вот он, убивец, хватай его! Вяжи его!
else
крича %target.name%, мерзавка, хватай ее! Вяжи ее!
end
Крича %target.name% - вот он%target.g% где, хватай, ребяты!
появ
mforce %target.name% трепет
mkill %target% 
~
$~
