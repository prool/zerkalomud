#802
опохмел~
1 c 2
осушить~
wait 1
dg_affect %actor% под_мухой 1
~
#810
<выпить эликсир> - действие  эликсира  молодости~
1 c 1
выпить~
if %actor.realroom% != %actor.loadroom%
osend %actor% Вы уверены что отдыхаете именно здесь? Поищите место отдыха получше!
halt
end
set pow %self.val0%
if %pow% < 15
set vozrast %actor.age%
if %vozrast% < 100
*если напиток плохой и возраст  меньше 100 -старение (строка 9)
eval i 15-%pow%
%actor.age(+%i%)%
osend %actor% Выпив напиток вы... постарели. Кто-то поскупился на ингридиенты когда готовил этот элкисир.
else
*если возраст больше 100 и напиток плохой, то дамаг с вероятностью смерти 50%(строка  14)
eval i %actor.maxhitp%*2
eval i %random.%i%%
osend %actor% Для вашего %vozrast%-летнего тела употребление поддельных эликсиров молодости строго противопоказано... А вы не послушались...
%actor.wait(2)%
wait 1s
odamage %actor% %i%
end
halt
end
eval i %pov%-14
%actor.age(-%i%)%
osend %actor% Вы почувстввовали себя моложе!
%actor.wait(2)%
wait 1s
opurge %self%
~
$~
