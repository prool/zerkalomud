#5600
зашел к рыбаку~
0 q 100
~
if %world.curmobs(5611)% > 0
wait 5
say Здраве тебе, %actor.name%!
say Не поможешь ли ты мне в одном деле?
else
attach 5606 %self.id%
detach 5601 %self.id%
detach 5603 %self.id%
detach 5600 %self.id%
end
~
#5601
сказал хорошо~
0 d 100
хорошо~
detach 5600 %self.id%
wait 5
say Вот и хорошо!
say Теперь я не хожу на рыбалку, старым стал..
say А кушать хотца!
say А вот мелкую рыбу я не ем, привык к большой, к щуке например!
say Принеси мне кусочек, и я тебе за это заплачу!
~
#5602
убил щуку~
0 f 100
~
mload obj 5600
~
#5603
дал феле рыбаку~
0 j 100
~
wait 1
if  %object.name% == филе
mpurge филе
mecho Рыбак съел филе.
wait 3
облиз
say Вот спасибо тебе %actor.name%!
wait 3
say Спас ты меня от голода!
say Вот возьми денег в награду!
%self.gold(+50)%
дать 50 кун %actor.name%
detach 5601 %self.id%
detach 5603 %self.id%
else 
say Мне это не нужно!
drop all
end
~
#5604
резет зоны~
0 n 100
~
attach 5600 %self.id%
attach 5601 %self.id%
attach 5603 %self.id%
detach 5606 %self.id%
~
#5605
reset 56~
2 f 100
~
wpurge рыбак
wload mob 5612
~
#5606
дал что-нить рыбаку~
0 j 100
~
if %object.name% == филе
  say  Ну это может и пригодиться..
  wait 1
  mpurge филе
else 
  say Зачем мне это?
end
~
#5607
убилокуня~
0 f 10
~
if %world.curobjs(5601)% < 100
   mload obj 5601
end
~
$~
