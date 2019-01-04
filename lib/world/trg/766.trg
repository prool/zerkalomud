* BRusMUD trigger file v1.0
#76600
Подходят к северному караульному~
0 q0 100
~
wait 1
if %direction% == north
взд
wait 2
say Пошлина за проезд 200 кун.
say Коли платить не желаете - поворачивайте себе обратно.
halt
end
wait 3s
закрыть ворота






~
#76601
Северному караульному дали деньги~
0 m0 1
~
wait 1
emot пересчитал монеты
if %amount% < 200
say Надуть меня хочешь?
хмур
say 200 кун заплатишь тогда и пропущу!
give %amount% кун .%actor.name% 
halt
end
if %amount% > 200
say Мне чужого не надобно
eval gold %amount%-200
give %gold% кун .%actor.name% 
end
mtransform 76610
wait 10s
mtransform 76600
закрыть ворота






~
#76602
Подходят к южному караульному~
0 q0 100
~
wait 3s
закрыть ворота






~
#76603
триг зайца~
0 0 100
~
wait 3
switch %random.6%
case 1
s
w
break
case 2
w
n
break
case 3
e
s
break
case 4
n
e
done




~
$
$
