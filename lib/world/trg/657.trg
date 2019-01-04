#65700
приветствие паромщика~
0 r 90
~
wait 1
взд
say Переправа через реку - 100 кун.
say Или вплавь добирайтесь.
wait 1s
ворч
~
#65701
Дали бабки паромщику~
0 mz 1
~
wait 1
if %amount% < 100
кулак .%actor.name%
say сотню монет - и ни единой меньше!
say Или за ворот, да в реку - так добрешься!
give %amount% кун .%actor.name%
halt
end
detach 65702 %self.id%
mecho Паромщик пересчитал монеты.
кив
wait 1
mecho Паромщик взялся за ворот, и принялся тянуть паром через реку.
calcuid parom1 %self.realroom% room
if %parom1.south%
mdoor 65744 s purge
mdoor 65746 n purge
wait 3s
mecho Паром покачивается на речных волнах - вот уже и берегов не видать.
wait 3s
mecho Паром мягко ткнулся в берег, покачнулся и замер.
mdoor 65744 w room 65729
mdoor 65729 e room 65744
else
mdoor 65744 w purge
mdoor 65729 e purge
wait 3s
mecho Паром покачивается на речных волнах - вот уже и берегов не видать.
wait 3s
mecho Паром мягко ткнулся в берег, покачнулся и замер.
mdoor 65744 s room 65746
mdoor 65746 n room 65744
end
attach 65702 %self.id%
~
#65702
Паромщик услышал крик~
0 z 0
~
wait 1
С противоположного берега реки донесся невнятный крик.
wait 1s
mecho Паромшик прислушался и встал.
хму
say Ну, что ли.. Либо за проезд платите, либо свой дорогой проваливайте.
wait 1
mecho Паромщик вытолкал всех с парома.
calcuid parom1 %self.realroom% room
foreach target %self.pc%
if %parom1.south%
mforce %target% south
else
mforce %target% west
end
done
mecho Паромщик взялся за ворот, и принялся тянуть паром через реку.
if %parom1.south%
mdoor 65744 s purge
mdoor 65746 n purge
wait 3s
mecho Паром покачивается на речных волнах - вот уже и берегов не видать.
wait 3s
mecho Паром мягко ткнулся в берег, покачнулся и замер.
mdoor 65744 w room 65729
mdoor 65729 e room 65744
else
mdoor 65744 w purge
mdoor 65729 e purge
wait 3s
mecho Паром покачивается на речных волнах - вот уже и берегов не видать.
wait 3s
mecho Паром мягко ткнулся в берег, покачнулся и замер.
mdoor 65744 s room 65746
mdoor 65746 n room 65744
end
~
#65703
Зовут паромщика~
2 c 1
кри крич крича кричат кричать~
return 0
wait 1
if %time.month% < 3 || %time.month% > 11
halt
end
if !%arg.contains(паром)%
return 0
halt
end
calcuid parom1 65744 room
if ((%actor.realroom% == 65746 ) && %parom1.south%)
wait 1
wsend %actor% А чего глотку-то драть, коли паром рядом?
halt
end
if ((%actor.realroom% == 65729 ) && %parom1.west%)
wait 1
wsend %actor% А чего глотку-то драть, коли паром рядом?
halt
end
wecho С противоположного берега донесся неясный отклик.
calcuid parom 65701 mob
exec 65702 %parom.id%
~
$~
