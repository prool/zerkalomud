* BRusMUD trigger file v1.0
#4500
раскопать лаз~
2 c0 0
раскопать разгрести расширить~
if !%arg.contains(лаз)%
   return 1
   halt
end
wait 1
wsend       %actor% Вы начали расширять лаз.
wechoaround %actor% %actor.name% попытал%actor.u% расширить лаз.
wait 2s
wecho       Земля с шумом обвалилась, открыв старый проход...
wdoor  4510 down flags a
wdoor  4510 down room  4522
wdoor  4522 up   flags a
wdoor  4522 up   room  4510
detach 4500 %self.id%

~
#4501
Убита душа~
0 f0 100
~
calcuid corpse 4500 obj
if %corpse%
    calcuid qroom 4525 room
    attach  4502 %qroom.id%
end
return 1
calcuid room 4525 room
mecho   Душа со сдавленным стоном растворилась в пустоте...
attach  4503 %room.id%
run     4503 %room.id%

~
#4502
Оплата квеста~
2 c0 0
воткнуть вонзить~
calcuid corpse 4500 obj
if !%corpse% || !%arg.contains(меч)%
   return  1
   halt
end
calcuid gladius 4700 obj
if %actor.eq(16)% != %gladius%
   return  1
   halt
end
wait       1
wsend      %actor% Вы воткнули старинный меч в полуразвалившийся коястяк...
wechoaround %actor% %actor.name% воткнул%actor.g% старинный меч в полуразвалившийся коястяк...
wecho      Меч вспыхнул ярким пламенем и костяк исчез...
wpurge %corpse%
wpurge %gladius%
switch %random.5%
 case 1
 wecho На этом месте осталась лишь потрескавшаяся пластинка...
 wload obj 4501 
 break

 case 2
 if (%world.gameobs(4502)% < 20)
    wecho На этом месте осталось лишь почерневшее от времени лезвие...
    wload obj 4502 
 end
 break

 case 3
 if (%world.curobjs(4503)% < 20)
    wecho На этом месте осталось лишь темное колечко...
    wload obj 4503 
 end
 break

 case 4
 wecho На этом месте осталась лишь обугленная кость...
 wload obj 4501 
 break

 case 5
 if (%world.curobjs(4505)% < 15)
    wecho На этом месте осталась лишь погнутая железная пластина...
    wload obj 4501 
 end
 break

done
detach 4502 %self.id%

~
#4503
Исчезновение души~
2 z0 0
~
return   1
calcuid spirit 4500 mob
wpurge  %spirit%

~
#4510
Обновление переменных~
2 f0 100
0~
wdoor   4510 down purge
wdoor   4522 up   purge
calcuid qroom 4510 room
attach   4500 %qroom.id%
wpurge  костяк
wload   obj 4500
detach  4502 %self.id%

~
$
$
