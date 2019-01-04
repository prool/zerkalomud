#5000
на чуже~
0 r 100
~
tell %actor.name% Не подскажете, люди добрые, как добраться до Киева?
ухмылка
~
#5001
на чуже1~
0 d 100
запад~
if %speech%==запад
tell %actor.name% Спасибо!
умница %actor.name%
endif
~
#5002
триггер на знахаре ~
0 j 100
труп~
wait 1
switch %object.name%
case труп таракана
  say  Еще одним гадом меньше! Молодец, продолжай дальше, держи премию.
  %self.gold(+1)%
  дать 1 кун %actor.name%
  mpurge труп
 break
case труп клопа
  say  Еще одним гадом меньше! Молодец, продолжай дальше, держи премию.
  %self.gold(+1)%
  дать 1 кун %actor.name%
  mpurge труп
 break
case труп моли
  say  Еще одним гадом меньше! Молодец, продолжай дальше.
  mload obj 101
  дать ломоть %actor.name%
  mpurge труп
 break
case труп блохи
  say  Еще одним гадом меньше! Молодец, продолжай дальше.
  mload obj 101
  дать ломоть %actor.name%
  mpurge труп
 break
case труп серой мыши
  say  О, грызун, разносщик заразы! Получи премию.
  %self.gold(+5)%
  дать 5 кун %actor.name%
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
#5003
триггер на охотнике ~
0 j 100
труп~
wait 1
switch %object.name%
case труп белки
  say  Из белки хорошая шкурка получится, продам потом иноземцу!
  улыб
  %self.gold(+10)%
  дать 10 кун %actor.name%
  mpurge труп
 break
case труп бобра
  say  Из бобра шикарная шкурка получится, продам потом иноземцу!
  %self.gold(+75)%
  дать 75 кун %actor.name%
  mpurge труп
 break
case труп рыси
  say  Из рыси шикарная шкурка получится, продам потом иноземцу!
  %self.gold(+100)%
  дать 100 кун %actor.name%
  mpurge труп
 break
case труп волка
  say  О ты убил волка! Это опасно, их целая стая!
  %self.gold(+20)%
  дать 20 кун %actor.name%
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
#5004
входнарентухая~
0 r 100
~
wait 1
set factor %self.people%
while %factor%
       set pc %factor.next_in_room%
if (%factor.vnum% == -1) && (%factor.level%>19) && (%factor.level%<31)
if %factor.sex%==1
tell %factor.name% Вырос ты уже, нечего тебе здесь штаны просиживать.
else
tell %factor.name% Выросла ты уже, нечего тебе здесь юбку просиживать.
end
tell %factor.name% Не пушу я тебя здесь на постой, иди в город, там где большие нужны.
tell %factor.name% А от вас только проблемы здесь будут.
mechoaround %factor% Хозяйка вытолкнула %factor.rname% в трактир.
msend %factor.name% Хозяйка вытолкнула вас в трактир.
mteleport %factor.name% 5001
if %factor.sex%==1
mat 5001 mechoaround %factor% Немного взлохмоченный %factor.name% пришел сверху.
else
mat 5001 mechoaround %factor% Немного взлохмоченная %factor.name% пришла сверху.
end
end
end
       if %pc%
         makeuid factor %pc.id%
       else
         set factor 0
       end
done
~
#5005
триггер на дочке~
0 q 100
~
if %actor.level% >= 10 || %actor.bank% >= 20
   halt
end
wait  1
msend %actor% Дочка сказала Вам:
if %actor.sex% == 1
   msend %actor% - Эх ты горемычный, голодный наверное, %actor.name%.
elseif
   %actor.sex% == 2
   msend %actor% - Эх ты горемычная, голодная наверное, %actor.name%.
end
  msend %actor% - Что мы нехристи чтобы не накормить. 
*  msend %actor% - всегда найду чем накормить, 
  msend   %actor% - Сейчас, подожди...
dg_cast 'насыщение' %actor.name%
~
#5006
Стражник заходит к ПКиллеру~
0 t 75
~
wait 1
if %actor.clan% != null
halt
end
foreach char %self.pc%
if %char.agressor% > 5000
if %char.agressor% < 5099
set target %char%
break
end
end
if %char.agressor% > 5100
if %char.agressor% < 5199
set target %char%
break
end
end
if %char.agressor% > 5600
if %char.agressor% < 5699
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
mforce %target.name% просн
mforce %target.name% stand
появ
mforce %target.name% трепет
mforce %target.name% следовать r1guarg
group all
kill %target.name% 
~
#5007
ПКллер заходит к стражнику~
0 q 80
~
wait 1
if %actor.clan% != null
halt
end
if !%actor.agressor%
halt
end
if %actor.agressor% > 5000
if %actor.agressor% < 5099
set agr 1
end
end
if %actor.agressor% > 5100
if %actor.agressor% < 5199
set agr 1
end
end
if %actor.agressor% > 5600
if %actor.agressor% < 5699
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
mforce %actor.name% stand
mforce %actor.name% следовать r2guard
group all
kill %actor.name% 
end
~
$~
