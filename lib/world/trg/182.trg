#18200
Городские стражники ловят вооруженных~
0 q 50
~
wait 1
if %actor.clan% != null
halt
end
set item1 %actor.eq(16)%
set item2 %actor.eq(17)%
set item3 %actor.eq(18)%
set weapon 0
if (%item1.type% == 4 ) || (%item1.type% == 5 )
set weapon 1
elseif (%item2.type% == 4 ) || (%item2.type% == 5 )
set weapon 1
elseif (%item3.type% == 4 ) || (%item3.type% == 5 )
set weapon 1
end
if %weapon% == 0
halt
end
гнев .%actor.name%
say В нашем городе княжим приказом воспрещено по улицам бродить оружным,
say О том тебе воротная стража говорила!
say Получай теперь на орехи!
mkill %actor%
~
#18201
блокируем вход вооруженных в город~
2 e 100
~
if %actor.clan% != null
halt
end
if %direction% != south
halt
end
set item1 %actor.eq(16)%
set item2 %actor.eq(17)%
set item3 %actor.eq(18)%
set weapon 0
if (%item1.type% == 4 ) || (%item1.type% == 5 )
eval weapon 1
end
if (%item2.type% == 4 ) || (%item2.type% == 5 )
eval weapon 1
end
if (%item3.type% == 4 ) || (%item3.type% == 5 )
eval weapon 1
end
if ( %weapon% == 1 )
calcuid guardroom 18226 room
set victim %actor%
remote victim %guardroom%
exec 18205 %guardroom%
return 0
halt
end
~
#18202
Сообщения у стражей на воротах~
0 q 100
~
wait 2
if %actor.clan% == рк
emot выпрямился и перехватил протазан "на караул"
mload obj 18232
отпереть ворота
открыть ворота
wait 5s
закрыть ворота
запереть ворота
mjunk all
halt
end
set item1 %actor.eq(16)%
set item2 %actor.eq(17)%
set item3 %actor.eq(18)%
set weapon 0
if (%item1.type% == 4 ) || (%item1.type% == 5 )
set weapon 1
elseif (%item2.type% == 4 ) || (%item2.type% == 5 )
set weapon 1
elseif (%item3.type% == 4 ) || (%item3.type% == 5 )
set weapon 1
end
if (%weapon% == 1 ) &&  (%actor.clan% == null )
msend %actor% Воротный стражник преградил вам дорогу протазаном.
mechoaround %actor% Воротный стражник преградил %actor.dname% дорогу протазаном.
say В наш город запрещено входить оружным и по улицам расхаживать!
say Убери-ка ты железки, пока не порезал%actor.u%.
say Городским стражам попадешься - у них разговор с тобой короткий выйдет.
wait 2
say Кроме того, на починку городских стен введен сбор за вход в город
say Полсотни кун серебром.
else
emot выпрямился и перехватил поудобней протазан
say На починку городских стен введен сбор за вход в город
say Полста кун серебром.
ухм
end
~
#18203
стражнику дали деньги~
0 m 1
~
wait 1
emot пересчитал монеты
if %amount% < 50
say Пошлина за вход в город пять десятков кун. Не больше, но никак не меньше!
хмур
give %amount% кун %actor.name% 
else
mload obj 18232
отпереть ворота
открыть ворота
wait 5s
закрыть ворота
запереть ворота
mjunk all
end
~
#18204
стража внутри города попросили открыть ворота~
0 d 0
"открой ворота"~
wait 1
emot осмотрел Вас с ног до головы
взд
wait 2
mload obj 18232
отпереть ворота
открыть ворота
wait 5s
закрыть ворота
запереть ворота
mjunk all
~
#18205
сообщения стражей~
2 z 0
~
wait 1
wsend %victim% Воротный стражник преградил вам дорогу протазаном.
wechoaround %victim% Воротный стражник преградил %victim.dname% дорогу протазаном.
wecho Воротный стражник сказал : 'В наш город запрещено входить оружным и по улицам расхаживать!'
wecho Воротный стражник сказал : 'Убери-ка ты железки, пока не порезал%victim.u%.'
wecho Воротный стражник сказал : 'Городским стражам попадешься - у них разговор с тобой короткий выйдет.'
~
#18206
блокируем вход вооруженных в город~
2 e 100
~
if %actor.clan% != null
halt
end
if %direction% != north
halt
end
set item1 %actor.eq(16)%
set item2 %actor.eq(17)%
set item3 %actor.eq(18)%
set weapon 0
if (%item1.type% == 4 ) || (%item1.type% == 5 )
eval weapon 1
end
if (%item2.type% == 4 ) || (%item2.type% == 5 )
eval weapon 1
end
if (%item3.type% == 4 ) || (%item3.type% == 5 )
eval weapon 1
end
if ( %weapon% == 1 )
calcuid guardroom 18216 room
set victim %actor%
remote victim %guardroom%
exec 18205 %guardroom%
return 0
halt
end
~
#18207
блокируем вход вооруженных в город~
2 e 100
~
if %actor.clan% != null
halt
end
if %direction% != west
halt
end
set item1 %actor.eq(16)%
set item2 %actor.eq(17)%
set item3 %actor.eq(18)%
set weapon 0
if (%item1.type% == 4 ) || (%item1.type% == 5 )
eval weapon 1
end
if (%item2.type% == 4 ) || (%item2.type% == 5 )
eval weapon 1
end
if (%item3.type% == 4 ) || (%item3.type% == 5 )
eval weapon 1
end
if ( %weapon% == 1 )
calcuid guardroom 18242 room
set victim %actor%
remote victim %guardroom%
exec 18205 %guardroom%
return 0
halt
end
~
$~
