* BRusMUD trigger file v1.0
#95500
лезем наверх по груде камней~
2 c0 100
лезть~
wait 1
if !%arg.contains(вверх)%
wsend %actor% _Куда вы хитите лезть?
halt
end
wechoaround %actor% _%actor.iname% пыхтя и ворча полез%actor.q% наверх.
wsend %actor% _Ворча и пыхтя Вы полезли наверх по камням.
wteleport %actor% 95544




~
#95501
лезем вниз по груде камней~
2 c0 100
лезть~
wait 1
if !%arg.contains(вниз)%
wsend %actor% _Куда вы хитите лезть?
halt
end
wechoaround %actor% _%actor.iname% пыхтя и ворча полез%actor.q% вниз.
wsend %actor% _Ворча и пыхтя Вы полезли вниз по камням.
wteleport %actor% 95543




~
#95502
чернокнижник~
0 k0 100
~
calcuid target 95520 mob
if %target.affect(слепота)% 
mecho _Чернокнижник взревел и указал пальцем на обглоданный труп !
dg_cast 'вылеч слеп' %target%
end
if %target.affect(обездвижен)% 
mecho _Чернокнижник взревел и указал пальцем на обглоданный труп !
dg_cast 'снять оцеп' %target%
end
if %target.affect(молчание)% 
mecho _Чернокнижник взревел и указал пальцем на обглоданный труп !
dg_cast 'снять молчание' %target%
end
if %target.hitp% < 400 
mecho _Чернокнижник взревел и указал пальцем на обглоданный труп !
mecho _В этот же момент раны на его израненном теле стали затягиваться !
dg_cast 'исцеление' %target%
end






















~
#95503
убили ключника~
0 f0 100
~
mload obj 95523



















~
#95504
нажимаем рычаг~
2 c0 100
нажать~
* Проверка аргумента
if !%arg.contains(рычаг)%
wsend %actor% _На что Вы хотите нажать ?
halt
end
* Если выход есть, значит триггер уже срабатывал
if %room.north% == north
halt
end
* Решетку можно сдвинуть имея 25+ силы
if %actor.str% > 24 
wsend %actor% _Приложив немного усилий, Вы нажали на рычаг.
wechoaround %actor% _Немного попыхтев, %actor.iname% нажал%actor.g% на рычаг.
wdoor 95592 south room 95591
wdoor 95591 north room 95592
else
wsend %actor% _Вы попытались нажать на рычаг, но не смогли сдвинуть его.
wechoaround %actor% _%actor.iname% попыта%actor.u% нажать рычаг, но не смог%actor.q%.
end 




~
#95505
РЕПОП~
2 f0 100
~
wdoor 95592 south purge room 95591
wdoor 95591 north purge room 95592
calcuid mobid 95531 mob
attach 95508 %mobid.id% 
calcuid mobid 95530 mob
attach 95509 %mobid.id%
attach 95510 %mobid.id%











~
#95506
проваливаемся в темном проходе~
2 g0 10
~
wsend %actor% _Пол под ногами разошелся и Вы кубарем полетели вниз !
wteleport %actor% 95555


















~
#95507
убили жуткое отродье~
0 f0 100
~
mload obj 95532















~
#95508
священник говорит~
0 r0 100
~
wait 10
mecho _Дух священника:
mecho _- Стой, живой !
mecho _- Не ходи в этот город !
mecho _- Не ходи в эту башню.
mecho _- Там тебя ждет только смерть...
detach 95508 %self.id%














~
#95509
зашли к темному владыке~
0 r0 100
~
wait 10
mecho _Темный владыка:
mecho _- Вот ты и приш%actor.y% %actor.iname% !
mecho _- Я ждал тебя.
ухм
wait 20
mecho _- Теперь у тебя есть выбор.
mecho _- Или служить мне или умереть !
mecho _- Выбор за тобой.
mecho _- Готов%actor.g% или ты мне служить?
detach 95509 %self.id%




~
#95510
говорим с темным владыкой~
0 d0 100
готов~
wait 10
mecho _Темный владыка:
mecho _- Тогда отправляйся с горы.
mecho _- Там ты поймешь, что делать дальше.
* Телепортим игроков следующую зону
mteleport все 95400
detach 95510 %self.id% 



~
$
$
