#27900
дать20старику~
0 m 1
~
if %actor.vnum% != -1
 halt
end
eval needgold %actor.level%*(%actor.remort%+1)
if %amount% < %needgold%
дать %amount% кун .%actor.name%
tell %actor.name% Маловато будет!
else
mecho Старик крикнул: 'Внучек, поди сюда, отведи мил человека к Киеву.'
wait 5
mecho Откуда-то вдруг появился отрок в крепкой кожаной одежде,
mecho в которой удобно ходить по лесу.
tell %actor.name% Не беспокойся, доведет в целости и сохранности!
tell %actor.name% Можешь фамилию нашу запомнить, так, на память.
tell %actor.name% Сусанины мы. Вот Иван тебя отведет к Киеву.
wait 2
msend %actor% Отрок махнул рукой, указывая следовать за ним, и скрылся в кустах.
mechoaround %actor% Отрок махнул %actor.dname% рукой, указывая следовать за ним, и скрылся в кустах.
mechoaround %actor% %actor.name% уш%actor.y% за отроком в лесную чащу.
mteleport %actor% 27901 horse
*mat 27901 mechoaround %actor% Отрок вывел %actor.vname% из леса.
wait 2
*mat 27901 mechoaround %actor% Отрок быстро скрылся снова в лесу.
wait 3
msend %actor% Отрок вывел Вас на какую-то поляну.
msend %actor% Отрок сказал: 'Все, я свое дело сделал, бывай!'
end
~
#27901
дать20старухе~
0 m 1
~
if %actor.vnum% != -1
 halt
end
eval needgold %actor.level%*(%actor.remort%+1)
if %amount% < %needgold%
дать %amount% кун %actor.name%
tell %actor.name% Маловато будет!
else
mecho Старуха слабо крикнула: 'Внучка, поди сюда, отведи мил человека к Корсуню.'
wait 5
mecho Откуда-то вдруг появилась девица в крепкой кожаной одежде,
mecho в которой удобно ходить по лесу.
tell %actor.name% Не беспокойся, доведет в целости и сохранности!
tell %actor.name% Можешь фамилию нашу запомнить, так, на память.
tell %actor.name% Сусанины мы. Вот Ивана тебя отведет к Корсуню.
wait 2
msend %actor% Девица махнула рукой, указывая следовать за ней, и скрылась в кустах.
mechoaround %actor% Девица махнула %actor.dname% рукой, указывая следовать за ней, и скрылась в кустах.
mechoaround %actor% %actor.name% уш%actor.y% за девицей в лесную чащу.
mteleport %actor% 27900 horse
mat 27900 mechoaround %actor% Девица вывела %actor.vname% из леса.
wait 2
mat 27900 mechoaround %actor% Девица быстро скрылась снова в лесу.
wait 3
mat 27900 msend %actor.name% Девица вывела Вас на какую-то поляну.
mat 27900 msend %actor% Девица сказала: 'Все, я свое дело сделала, бывай!'
end
~
#27902
встречастарик~
0 r 100
~
tell %actor.name% Привет, добр человек!
tell %actor.name% Не заплутал%actor.g%? А то могу проводить тебя к славному городу Киеву.
tell %actor.name% Конечно не я, а мой внучек, но он хорошо знает обходные дороги.
eval needgold %actor.level%*(%actor.remort%+1)
tell %actor.name% Но не даром конечно, кун %needgold% нам на пропитанье и ты там!
tell %actor.name% Сам%actor.g% не дойдешь, поверь моим старым костям.
~
#27903
встречастаруха~
0 r 100
~
tell %actor.name% Привет, добр человек!
tell %actor.name% Не заплутал%actor.g%? А то могу проводить тебя к городищу Корсуню.
tell %actor.name% Конечно не я, а моя внучка, но она хорошо знает обходные дороги.
eval needgold %actor.level%*(%actor.remort%+1)
tell %actor.name% Ну не даром конечно, кун %needgold% нам на пропитанье и ты там!
tell %actor.name% Сам%actor.g% не дойдешь, поверь моим старым костям.
~
$~
