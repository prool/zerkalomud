#76400
кусты~
2 g 100
~
wait 1
wecho Кусты больно царапают Вас.
eval dmg %random.50%
foreach fchar %self.pc%
  wdamage %fchar% %dmg%
done
~
#76401
Камень~
0 c 100
присесть~
wait 1
wecho Камень на мгновение засветился голубым светом и погас.
dg_cast 'восст' %actor.name%
~
#76402
Старик увидел~
0 r 100
~
wait 1
say Ты еще что за гусь?!
вопр
wait 1
say А сколько гусь суток пролетит без отдыха?
дум
wait 1
say Где же мои счеты..
ворч
wait 1
say Потерял! Что же мне теперь делать?!
плак
attach  76403 %self.id%
detach  76402 %self.id%
~
#76403
ответ старику~
0 d 100
спать~
say Точно!
спать
attach  76402 %self.id%
detach  76403 %self.id%
~
#76404
муравейник~
1 c 4
разворошить~
wait 1
%send% %actor% Вы с разбегу треснули ногой в центр муравейника...
%echoaround% %actor% %actor.name% с разбегу вдарил%actor.q% ногой по муравенику!
oload mob 76407
oload mob 76407
oload mob 76407
oload mob 76407
oload mob 76407
wait 1
opurge %self%
~
#76405
load set on witch~
0 f 100
~
if ((%world.curobjs(3326)% < 1) && (%random.100% < 4))
  mload obj 3326
end
~
$~
