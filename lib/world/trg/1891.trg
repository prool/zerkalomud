* BRusMUD trigger file v1.0
#189100
ресет зоны~
2 f0 100
~
calcuid m189124 189124 mob
attach 189101 %m189124.id%
attach 189102 %m189124.id%


~
#189101
пришли к магу~
0 r0 100
~
context 1892
wait 2s
эм поднял взгляд
if (%actor.name%==%quest1892.name%)
  внимательно посмотрел на %actor.vname%
  г Говори...
  halt
end  
эм отвернулся


~
#189102
просят яду~
0 d0 0
дай хочу принеси~
context 1892
if (%actor.name%!=%quest1892.name%)
  %send% %actor%  Тебя не спрашивают!
  halt
end 
if !%speech.contains(яду)%
  г Нельзя ли выражать свои желания поконкретнее?
  halt
end
wait 1s
г Что, у Евпатора новый слуга?
ухм
г Ну ладно, держи...
%load% obj 189105
дать крупинка .%actor.name%
detach 189102 %self.id%


~
$
$
