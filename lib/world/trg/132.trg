#13200
Убиваем сокола~
0 f 100
~
msend %actor.name% Сокол впоследний раз взмахнул крыльями и умер.
mechoaround %actor.name% %actor.iname% мощным ударом добил сокола.
mload obj 13212
~
#13201
На дерево~
2 c 0
лезть залезть влезть взобраться~
if !%arg.contains(дерево)% 
wsend %actor% _Куда это Вы лезете?!
return 0
halt 
end
wsend %actor% _Вы начали корабкаться на дерево.
wechoaround %actor% _%actor.name% влез%actor.q% на дерево.
wteleport %actor% 13289
wsend %actor% _Вы залезли на дерево.
wechoaround %actor% _Кто-то влез на дерево. 
end
~
#13202
С дерева~
2 c 0
слезть спрыгнуть спуститься~
if !%arg.contains(дерево)% 
wsend %actor%  Откуда вы хотите спуститься ?!
return 0
halt 
end
wsend %actor% _Вы начали спускаться с дерева.
wechoaround %actor% _%actor.name% начал спускаться%actor.q% с дерева. 
wteleport %actor% 13260
wsend %actor% _Вы слезли с дерева.
wechoaround %actor% _Кто-то спустился с дерева на землю. 
end
~
#13203
Убиваем бабу-ягу~
0 f 100
~
msend %actor.name% Мощным ударом вы добили умирающую Бабу-Ягу.
mechoaround %actor.name% %actor.iname% мощным ударом добил Бабу-Ягу.
mload obj 13215
~
#13204
Мурлычет кот~
0 qt 100
~
wsend %actor.iname% _Большой черный кот замурлыкал и начал тереться об вашу ногу.
wechoaround %actor.iname% _Большой черный кот замурлыкал и начал тереться о ногу %actor.rname%.
~
#13205
Через окошко в избушку~
2 c 0
влезть залезть просунуться пролезть~
if !%arg.contains(окошко)% 
wsend %actor% _Куда это Вы влезть пытаетесь?!
return 0
halt 
end
wsend %actor% _Вы выдохнули и тихонько полезли в окошко.
wechoaround %actor% _%actor.name% выдохнул%actor.q% и полез в окошко, вот с кем на татьбу ходить то надо!
wteleport %actor% 13204
wsend %actor% _Вы влезли в избушку.
wechoaround %actor% _Кто-то, через узкое окошко, влез в избушку. 
end
~
#13206
Через окошко из избушки~
2 c 0
влезть вылезти выпрыгнуть~
if !%arg.contains(окошко)% 
wsend %actor%  Куда это Вы вылезти пытаетесь?!
return 0
halt 
end
wsend %actor% _Вы выдохнули и тихонько полезли в окошко.
wechoaround %actor% _%actor.name% выдохнул%actor.q% и полез в окошко, вот с кем на татьбу ходить то надо!
wteleport %actor% 13200
wsend %actor% _Вы влезли из избушки.
wechoaround %actor% _Кто-то, через узкое окошко, вылез из избушки. 
end
~
#13207
Пес у избушки нападает~
0 r 100
~
рыч %actor.iname%
убить %actor.iname%
~
#13208
Ворон каркает~
0 qt 100
~
г Каррррррр
~
#13209
Убиваем старшую сестру бабы яги~
0 f 100
~
msend %actor.name% Мощным ударом вы добили умирающую сестру Бабу-Ягу.
mechoaround %actor.name% %actor.iname% мощным ударом добил сестру Бабу-Ягу.
mload obj 13204
~
#13210
Убиваем младшую сестру бабы яги~
0 f 100
~
msend %actor.name% Мощным ударом вы добили умирающую сестру Бабу-Ягу.
mechoaround %actor.name% %actor.iname% мощным ударом добил сестру Бабу-Ягу.
mload obj 13206
~
#13211
Упырь нападает~
0 r 100
~
г Ты пришел освободить его ?!
рыч %actor.iname%
г Не выйдет !!!
убить .%actor.iname%
calcuid for_mb 13206 mob
detach 13211 %for_mb.id%
~
#13212
Старик просит освободить сынишку~
0 r 100
~
wait 1s
плак
г Помоги мне, о храбрый и сильный воин.
wait 1s
г Стряслась беда у нас в доме.
wait 1s
плак
г Ушел сынишка в лес да не вернулся!
г Как не искали его так и не наши...
плак
wait 1s
г Думаю я поймала его Баба-Яга, да съесть хочет, и съест если не поможешь!
wait 1s
г Освободи его, я прошу тебя...
~
#13213
Нашли сына старика~
0 r 100
~
wait 1s
г Ой...
г Кто тут !?
wait 1s
улыб
г Ты наверно пришел освободить меня ?
wait 1s
радов
wait 1s
г А ты наверно хочешь отвести меня к нему ?
г Не надо, я не маленький, сам дойду !!!
wait 1s
г Вот отдай батьке моему, он поймет, что ты нашел меня!
mload obj 13207
wait 1s
дать колеч  %actor.name%
calcuid for_mb 13211 mob
detach 13213 %for_mb.id%
~
#13214
Старику отдали колечко~
0 j 100
~
if %object.name% == колечко  
wait 10
mpurge %object.name%
г Да это колечко сынишки моего !!!
г Ты нашел его ?
wait 1s
г Говоришь, сказал, что не маленький сам дойдет ?
г Ну не надо было его слушать.
взд
wait 1s
г Ну да ладно, главно ты его освободил, и впрямь, сам прибежит.
wait 1s
г А за помошь свою, на возьми, это все, что есть у меня. 
mload obj 13208
дать монет %actor.name%
end   
~
#13215
Репоп~
2 f 100
~
calcuid deletetrig 13210 mob
attach 13200 %deletetrig.id%
calcuid deletetrig 13201 mob
attach 13203 %deletetrig.id%
calcuid deletetrig 13212 mob
attach 13209 %deletetrig.id%
calcuid deletetrig 13213 mob
attach 13210 %deletetrig.id%
calcuid deletetrig 13206 mob
attach 13211 %deletetrig.id%
calcuid deletetrig 13219 mob
attach 13212 %deletetrig.id%
attach 13214 %deletetrig.id%
calcuid deletetrig 13211 mob
attach 13213 %deletetrig.id%
~
#13216
С крыши на дерево~
2 c 100
прыгнуть~
if !%arg.contains(дерево)% 
wsend %actor% _Куда это Вы прыгнуть хотите?!
return 0
halt 
end
wsend %actor% _Разбежавшись вы прыгнули с крыши на дерево.
wechoaround %actor% _%actor.name% прыгну%actor.q% с крыши на дерево.
wteleport %actor% 13289
wsend %actor% _Вы прыгнули на дерево.
wechoaround %actor% _Кто-то прыгнул на дерево. 
end
~
$~
