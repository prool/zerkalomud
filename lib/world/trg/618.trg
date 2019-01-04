#61800
Старик приветствует~
0 r 100
~
if (%quest618.name% == %nil%)
wait 1s
вопр   
г Здорово %actor.iname%.
смотр %actor.iname%
wait 1s
г Хм, я смотрю ты умен и силен, хотя может чуточку и глуп, что пришел суда.
г Но, не обижайся на старика, места уж больно тут не хорошие.
г Но коли пришел ты сюда, помоги, в накладе не останешься.
wait 2s
ждать
г Ну что уставился, как баран на новые ворота, поможешь или нет ?
end
~
#61801
Старик дает квест~
0 d 100
слушаю~
if (%quest618.name% = %nil%)
set quest618 %actor%
global quest618
wait 1s
ухм
г Вот и ладушки, а то стоит смотрит и молчит как дерево.
г Вот тебе магический камень. 
г С его помощью ты сможешь попасть...эээ я тебе не рассказал, что тебе сделать надо ?
wait 1s
г Все глупость твоя.
гнев %actor.iname%
wait 1s
г Ну слушай...
г Есть тут долина.
г И непонятным мне образом появляются после смерти там воины, да маги сильные...
г А правит ими колдун один, да не колдун он, а так самоучка-недомерок.
г Убей его, да принеси голову его мне, а я уж пойму как он мертвых оживляет.
г А, да, там по моему, еще есть камни какие то, но для чего они один бог ведает.
ухм
wait 1s 
mload obj 61800
дать камень %actor.iname%
wait 1s
г Ну все проваливай, не мозоль мне глаза, а то вмиг в жабу превращу.
calcuid for_mb 61800 mob
detach 61800 %for_mb.id%
detach 61801 %for_mb.id%
end
~
#61802
Вход в долину~
2 h 100
~
if (%object.iname% == рунный камень)
wait 1s
wecho   Вдруг померкло все перед глазами, но вот зрение постепенно стало возвращаться к вам.
wecho И не веря своим глазам, вы увидели, как стал появляться проход.
wdoor 61808 east room 61809
wdoor 61809 west room 61808 
wait 2s
wecho Вот он все шире и шире, теперь и пройти дальше можно.
end
~
#61803
Умер владыка~
0 f 100
~
if %world.curobjs(1262)% < 1
if %random.100% <= 2
mload obj 1262
end
end
msend %actor.name% Вот и владыка разума лешился своей головы.
mechoaround %actor.name% %actor.iname% с размаху лешил владуку разума его головы.
mload obj 61802
~
#61804
Главный квест~
0 j 100
~
if (%actor.name% != %quest618.name%)
бросить %object.iname%
вздох
halt
end
if (%actor.name% == %quest618.name%)
if (%object.iname% == голова владыки разума)
wait 1s
г О, да я смотрю не ошибся в тебе!
г Ты все таки убил его!
ухм
wait 1s
г Ну ладно, теперь получи свою награду, а я что нибудь да вытяну из этой головы!
set vnum 61812
set Get_item %random.30%
eval vnum %vnum% + %Get_Item%
if (%vnum% > 61817)  || (%world.curobjs(%vnum%)% > 1)
mload obj 61818
дать мешок %actor.name%
halt
else 
wait 1s
mload obj %vnum%
дать маги  %actor.name%
end
end
~
#61805
Умер воин воздуха~
0 f 100
~
msend %actor.name% Воздушная материя полностью растворилась в воздухе.
mechoaround %actor.name% %actor.iname% вот теперь полностью уничтожил это создание.
mload obj 61822
~
#61806
Умер огненный воин~
0 f 100
~
msend %actor.name% Огненная материя полностью растворилась в воздухе.
mechoaround %actor.name% %actor.iname% вот теперь полностью уничтожил это создание.
mload obj 61824
~
#61807
Умер воин из плоти~
0 f 100
~
msend %actor.name% Со страшным ревом воин отправился в мир теней.
mechoaround %actor.name% %actor.iname% с яростью в глазах добил воина из плоти и крови.
mload obj 61826
~
#61808
Бросает камень со знаком воздуха~
2 h 100
~
if (%object.iname% == камень со знаком воздуха на гранях)
wait 1s
wecho Шум, грохот, скрежет...темнота...
wecho Но, вдруг все приходит на свое место.
wdoor 61836 west room 61827
wdoor 61827 east room 61836         
wait 2s
wecho Но, о чудо! Появился проход.
end
~
#61809
Бросаем камень со знаком огня~
2 h 100
~
if (%object.iname% == камень со знаком огня на гранях)
wait 1s
wecho   Яркие вспышки света на миг ослепили вас.
wdoor 61848 south room 61849
wdoor 61849 north room 61848                    
wait 1s
wecho Но вот зрение стало возвращаться к вам, и вы открыв от удивления рот видите, что
тупик уже и не тупик совсем.
end
~
#61810
Бросаем камень со знаком жизни~
2 h 100
~
if (%object.iname% == камень со знаком жизни на гранях)
wait 1s
wecho Сознание покинуло вас на долю секунды. 
wdoor 61820 east room 61822
wdoor 61822 west room 61820                  
wait 2s
wecho И вот уже вы находитесь не в тупике.
end
~
#61811
Умер волк~
0 f 100
~
if (%world.curobjs(61801)% < 10) && (%random.100% <= 8)
   mload obj 61801
end
~
#61812
Репоп~
2 f 100
~
set quest618 %nil%
global quest618
calcuid delete_trig 61800 mob
attach 61800 %delete_trig.id% 
attach 61801 %delete_trig.id%
attach 61804 %delete_trig.id%
calcuid delete_trig 61802 mob
attach 61803 %delete_trig.id% 
calcuid delete_trig 61807 mob
attach 61805 %delete_trig.id%
calcuid delete_trig 61808 mob
attach 61806 %delete_trig.id% 
calcuid delete_trig 61809 mob
attach 61807 %delete_trig.id%
calcuid delete_trig 61801 mob
attach 61811 %delete_trig.id%
wdoor 61808 east purge room 61809
wdoor 61809 west purge room 61808
wdoor 61836 west purge room 61827
wdoor 61827 east purge room 61836 
wdoor 61848 south purge room 61849
wdoor 61849 north purge room 61848 
wdoor 61820 east purge room 61822
wdoor 61822 west purge room 61820
~
$~
