#68000
награда за квест с дочкой (квест глашатого)~
0 g 100
~
if %actor.vnum% == -1
halt
end
wait 1
if %actor.vnum% != 27020
halt
end
wait 1s
set questor %actor.leader%
teleport questmob2703 68099
%purge% questmob2703
улы
say Велеслава, дочка! Давно не бывала, забыла старика...
emot ласково обнял Велеславу
say Ступай покуда в дом, я с провожатым твоим поговорю.
mecho Дочка воеводы кивнула и быстро взбежала по всходу в горницу.
wait 2
say Что ж, спасибо за помощь... Как бы наградить тебя?
switch %random.3%
case 2
if %random.100% < 60
  if %world.curobjs(68057)% < 5
mload obj 68057
дать плащ .%questor.name%
end
else
say Возьми червонцев несколько за помощь.
set bufer %self.gold(+2000)%
дать 2000 кун %questor.name%
end
break
case 1
if %random.100% < 60
if %world.curobjs(68056)% < 10
mload obj 68056
дать кольчуг .%questor.name%
end
else
say Возьми червонцев несколько за помощь.
set bufer %self.gold(+2000)%
дать 2000 кун %questor.name%
end
break
default
say Возьми червонцев несколько за помощь.
set bufer %self.gold(+2000)%
дать 2000 кун %questor.name%
done
~
$~
