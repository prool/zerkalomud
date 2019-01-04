* BRusMUD trigger file v1.0
#25400
камень~
2 c0 1
толкнуть качать~
if !%arg.contains(камень)%
return 0
halt
end
%send% %actor% _Вы сильно толкнули камень, и он неожиданно качнулся в сторону, приоткрыв проход.
wdoor 25453 s room 25454
wdoor 25454 n room 25453
wait 1s
wdoor 25453 s purge
wdoor 25454 n purge











~
#25401
кусты~
2 c0 1
раздвинуть~
if !%arg.contains(кусты)%
return 0
halt
end
%send% %actor% _Вы раздвинули колючие кусты и увидели за ними широкий лаз в чью-то нору.
wdoor 25441 e room 25413
wait 1s
%echo% _Кусты выпрямились и закрыли лаз.
wdoor 25441 e purge









~
#25402
зашел к чайке~
0 q0 85
~
msend %actor% _Чайка явно решила, что вы хотите отобрать у нее улов!
mkill %actor.name%


















~
#25403
зашел к перевозчику~
0 q0 85
~
wait 2
вздох
say Поздорову... Я - перевозчик тутошний.
say Хочешь на тот берег добраться - так плати полста кун.
say А не хочешь платить - вплавь добирайся
wait 1
смея











~
#25404
зашел к мальчишке~
0 q0 85
~
wait 2
ул
say Здорову, добры люди.
say Коли вам на тот берег - платите мне полсотни кун.
say Мой отец-перевозчик честь-честью вас переправит.











~
#25405
дал деньги перевозчику~
0 m0 1
~
wait 1
if %amount% < 50
say Поболе надо бы.
give %amount% кун %actor.name%
вопрос %actor.name%
halt
end
wait 1s
say Вот и хорошо - пожалуйте на паром 
stand
msend %actor% _Вы поднялись на паром, и перевозчик принялся тянуть канат.
mechoaround %actor% _~~%actor.name% взош%actor.y% на паром и перевозчик принялся тянуть канат.
mteleport %actor% 25430 horse
msend %actor% _Прошло немного времени - и вы уже на противоположном берегу.
mechoaround %actor% _Кто-то прибыл сюда на пароме.











~
#25406
дал деньги мальчишке~
0 m0 1
~
wait 1
if %amount% < 50
say Добавить надо...
give %amount% кун %actor.name%
вопрос %actor.name%
halt
end
wait 1s
say Вот и хорошо. 
stand
emot оглушительно засвистел
mecho паромщик на противоположном берегу встал и принялся тянуть паром к вашему берегу
msend %actor% _Вы поднялись на паром, и перевозчик принялся тянуть канат.
mechoaround %actor% _~~%actor.name% взош%actor.y% на паром и перевозчик принялся тянуть канат.
mteleport %actor% 25428 horse
msend %actor% _Прошло немного времени - и вы уже на противоположном берегу.
mechoaround %actor% _Кто-то прибыл сюда на пароме.











~
#25407
лиса охотится~
0 h0 40
~
if ((%actor.vnum% == 25411) || (%actor.vnum% == 25412))
stand
mkill %actor.iname%
end















~
#25408
лезть в грот~
2 c0 1
лезть пролезть~
if !%arg.contains(расщелин)%
%send% %actor% _Куда вы лезете?!
halt
end
%send% %actor% _Обдираясь о камни, Вы полезли в расщелину.
%echoaround% %actor% _%actor.name% полез%actor.q% в расщелину между камнями.
%teleport% %actor% 25491
%echoaround% %actor% _Кто-то пролез сюда.











~
#25409
лезть наружу~
2 c0 1
лезть пролезть~
if !%arg.contains(наружу)%
%send% %actor% _Куда лезем?
halt
end
%send% %actor% _Обдираясь о камни Вы полезли в расщелину.
%echoaround% %actor% _%actor.name% полез%actor.q% в расщелину между камнями.
%teleport% %actor% 25404
%echoaround% %actor% _Кто-то пролез сюда.











~
$
$
