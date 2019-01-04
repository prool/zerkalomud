* Сгенерировано BZEditor
* Количество триггеров : 7
* Сохранено 04.08.2008 16:24:03
#21200
Быстрая выдача снаряжения~
0 d 100
снаряжение~
wait 1
if %actor.vnum% != -1
halt
end 
say Сейчас-сейчас...
wait 1
if %actor.bank% < 360
дум
say Э, да у тебя кун-то даже на припасы не хватит!
halt
end
eval buffer %actor.bank(-360)%
mload obj 21245
mload obj 21246
mload obj 21248
mload obj 21249
mload obj 21249
mload obj 21249
mload obj 21249
mload obj 21249
mload obj 21249
mload obj 21249
mload obj 21249
mload obj 21249
mload obj 139
mload obj 139
put all сум
say Вот припасы твои.
give all .%actor.name%
drop all
wait 2
say Сейчас снаряжение тебе подберем...
if %actor.bank% < 600
дум
say Хм... а вот на него у тебя денег нет.
halt
end
eval buffer %actor.bank(-600)%
switch %actor.class%
*боевой маг
case 1
*вор
case 2
*наемник
case 4
*маг-кудесник
case 6
*маг-волшебник
case 7
*маг-некромант
case 8
*охотник
case 10
*купец
case 12
*волхв
case 13
mload obj 21211
mload obj 21212
mload obj 21211
mload obj 21212
mload obj 21214
mload obj 21215
mload obj 21216
mload obj 21217
mload obj 21218
mload obj 21219
mload obj 21221
mload obj 21221
break
*лекарь
case 0
*богатырь
case 3
*дружинник
case 5
*витязь
case 9
*кузнец
case 11
mload obj 21200
mload obj 21201
mload obj 21200
mload obj 21201
mload obj 21203
mload obj 21204
mload obj 21205
mload obj 21206
mload obj 21207
mload obj 21208
mload obj 21209
mload obj 21210
mload obj 21210
done
mload obj 21222
mload obj 21223
give all .%actor.name% 
drop all
wait 1
say Оружие сам%actor.g% себе в кузне купи - не маленк%actor.w% уже.






~
#21201
Удаление шмота~
1 gj 100
~
if %actor.clan% == пюм
halt
end
osend %actor% %self.name% рассыпал%self.u% в ваших руках.
wait 1
opurge %self%






~
#21202
Лоад коня~
1 c 2
встряхнуть~
wait 1
if !%arg.contains(лепешку)%
osend %actor% Что вы трясете?
halt
end
osend %actor% Вы встряхнули коровью лепешку и сразу почувствовали запах навоза.
if %actor.clan% != пюм
halt
end
if %world.curmobs(21208)% > 50
osend %actor% ...и ничего не произошло!
halt
end
oechoaround %actor% %actor.name% встряхнул%actor.g% коровью лепешку и Вы сразу почувствовали запах навоза.
oload mob 21208
oecho Послышался грохот, все затряслось и перед вами из-под земли вылез огромный навозный жук.
oforce %actor% оседлать жук
wait 1
opurge %self%



~
#21203
Расседлать жука~
0 c 100
Расседлать~
wait 1
if %self.fighting%
halt
end
if !%arg.contains(жука)%
msend %actor%  Кого вы хотите расседлать?
halt
end
if (%actor.clan% != пюм) || (%actor% != %self.leader%)
msend %actor% Это не Ваш скакун.
halt
end
msend %actor% Вы расседлали огромного навозного жука.
mechoaround %actor% %actor.name% расседлал%actor.g% огромного навозного жука.
mload obj 21252
give лепешка .%actor.name%
wait 1
mecho Огромный навозный жук покрутился и убежал, почуяв запах свежей еды.
wait 1
mpurge %self%


~
#21204
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
if %world.curobjs(21252)% >= 9400
wait 2
say Нету коровьих лепешек, кончились!
give %amount% кун .%actor.name%
halt
end
wait 2
say Вот, извольте.
mload obj 21252
give лепешка .%actor.name%













~
#21205
Серый пес~
0 q 30
~
след %actor.iname%
wait 1
msend %actor% Серый пес подбежал к Вам, понюхал сапоги и задрал заднюю лапу.
mechoaround %actor% Серый пес подбежал к %actor.dname%, понюхал сапоги и задрал заднюю лапу.
wait 3
msend %actor% Серый пес испустил мощную струю, наполнив до самых краев Ваши сапоги, и весело побежал дальше.
mechoaround %actor% Серый пес испустил мощную струю, наполнив до самых краев сапоги %actor.rname%, и весело побежал дальше.
след пес



~
#21206
Серый кот~
0 q 30
~
след %actor.iname%
wait 1
msend %actor% Жирный серый кот подбежал и прыгнул на Вашу ногу, вцепившись когтями.
mechoaround %actor% Жирный серый кот подбежал к %actor.dname%, и прыгнул на ногу, вцепившись когтями.
wait 5
msend %actor% Жирный серый кот, вися на Вашей ноге, начал делать нелепые движения тазом вперед и назад, громко подвывая.
mechoaround %actor% Жирный сервый кот, вися на ноге %actor.rname%, начал делать нелепые движения тазом вперед и назад, громко подвывая.
wait 5
msend %actor% Жирный серый кот издал оглушительный затяжной стон и свалился с Вашей ноги, оставив мокрый след на штанине.
mechoaround %actor% Жирный серый кот издал оглушительный затяжной стон и свалился с ноги %actor.rname%, оставив мокрый след на штанине.
след кот



~
$
$
