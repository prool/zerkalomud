* Сгенерировано BZEditor
* Количество триггеров : 7
* Сохранено 13.12.2009 21:13:04
#21300
Быстрая выдача снаряжения~
0 d 100
снаряжение~
wait 1
if %actor.vnum% != -1
halt
end 
say Жди, бродяга!
wait 1
if %actor.bank% < 675
дум
say Ты совсем нищий! Иди, хотя бы займи у кого-нибудь!
halt
end
eval buffer %actor.bank(-675)%
mload obj 21311
mload obj 21311
mload obj 21312
mload obj 21312
if (actor.sex==1) then
mload obj 21314
else
mload obj 21356
end 
mload obj 21315
mload obj 21316
mload obj 21317
mload obj 21318
mload obj 21319
mload obj 21320
mload obj 21321
mload obj 21322
mload obj 21323
mload obj 21345
mload obj 21348
give all .%actor.name% 
drop all
~
#21301
Быстрая выдача свитков~
0 d 100
свитки~
* 10 реколов, 10 познания, 10 теплых, 10 красных, 10 серых, 10 белых, бочка черных, бочка синих,
wait 1
if %actor.vnum% != -1
halt
end 
say Жди, бродяга!
wait 1
if %actor.bank% < 11750
дум
say Ты совсем нищий! Иди, хотя бы займи у кого-нибудь!
halt
end
eval buffer %actor.bank(-11750)%
set i 0
while (i < 10)
mload obj 138
mload obj 139
mload obj 141
mload obj 142
mload obj 144
done
mload obj 153
mload obj 149
give all .%actor.name% 
drop all

~
#21302
Лоад коня~
1 c 2
песня~
* Триггер на лоад кланового коня. Цепляется к уздечке.
* Разумеется, если вы меняете названия предмета (уздечки)
* или коня, то в триггера необходимо внести изменения
wait 1
osend %actor% Вы тихонько заиграли завывающую мелодию снежной бури.
if %actor.clan% != ТВ
halt
end
if %world.curmobs(2008)% > 50
osend %actor% ...и ничего не произошло!
halt
end
oechoaround %actor% %actor.name% заиграл%actor.g% на ледяной дудочке.
oload mob 2008
oecho Воздух вокруг Вас заклубился, повеяло холодом, и налетела страшная снежная буря.
wait 1s
oecho Постепенно все успокоилось, и Вы увидели прекрасного белогоривого скакуна.
wait 1s
oecho Конь огляделся, улыбнулся и облизнул Вас.
wait 1s
oforce %actor% оседлать конь
wait 1
opurge %self%








~
#21303
Расседлать коня~
0 c 1
отпустить~
* Триггер на свертывание кланового коня. Цепляется к мобу-коню.
* Разумеется, если вы меняете названия предмета (уздечки)
* или коня, то в триггера необходимо внести изменения
wait 1
if %self.fighting%
halt
end
if !%arg.contains(коня)%
msend %actor%  Кого вы хотите расседлать?
halt
end
if (%actor.clan% != ТВ) || (%actor% != %self.leader%)
msend %actor% Это не Ваш скакун.
halt
end
msend %actor% Вы отпустили снежного коня на волю.
mechoaround %actor% %actor.name% расседлал%actor.g% коня.
mload obj 21352
give песн .%actor.name%
wait 1
mecho Конь понесся навстречу ветрам.
wait 1
mpurge %self%








~
#21304
Выдача уздечек~
0 m 1
~
* Триг висит на конюхе
wait 1
if %amount% < 50
wait 2
say Маловато будет!
give %amount% кун .%actor.name%
halt
end
if %world.curobjs(21352)% >= 200
wait 2
say Нету дудок, кончились!
give %amount% кун .%actor.name%
halt
end
wait 2
say Вот, извольте.
mload obj 21352
give песн .%actor.name%








~
#21305
перемещение к воротам~
0 d 100
вези меня в вечность~
wait 1
if %actor.vnum% != -1
halt
end
msend %actor% Вы вскочили на спину оленя и понеслись скозь вихри и бураны
mechoaround %actor% %actor.name% вскочил%actor.g% на спину оленя и они понеслись скозь вихри и бураны
mteleport %actor% 21381
wait 1
msend %actor% Вскоре олень остановился и Вы очутились прямо перед владениями Творцов Вечности
wait 1
mechoaround %actor% %actor.name% появился здесь верхом на северном олене
mecho Освободившись от седока, олень умчался прочь, оставляя за собой облако вихрящегося снега.
~
#21306
перемещение к ворожее~
2 c 1
топнуть ногой~
wait 1
if %actor.vnum% != -1
halt
end
wsend %actor%Вы топнули ногой, но мягкий снег полностью поглотил звук
wechoaround %actor% %actor.name% топнул%actor.g% ногой, но мягкий снег полностью поглотил звук
wait 1
wecho Однако вскоре с юга послышался какой то гул
wait 1
wecho Гул постепенно приближался и скоро вы увидели прекрасного северного оленя с умным пронзительным взглядом.
wsend %actor% Вы вскочили на спину оленя и понеслись скозь вихри и бураны
wechoaround %actor% %actor.name% вскочил%actor.g% на спину оленя и они понеслись скозь вихри и бураны
wteleport %actor% 21383
wait 1
wsend %actor% Вскоре олень остановился и Вы очутились на тропе, ведущей в город.
wait 1
wechoaround %actor% %actor.name% появился здесь верхом на северном олене
wecho Освободившись от седока, олень умчался прочь, оставляя за собой облако вихрящегося снега.
~
$
$
