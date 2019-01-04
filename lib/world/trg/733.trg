* BRusMUD trigger file v1.0
#73300
триг у мудреца~
0 d0 2
научи~
if ((%actor.class% != 4) && (%actor.class% != 10) && (%actor.dex% > 40))
mskilladd %actor.name% скрытый.удар 200
else 
msend %actor% - Проваливай, проходимец!
halt
end


~
#73301
триг на загрузку вещей~
0 f0 100
~
if (%random.1000% > 900)
eval loadok 5
eval anticycle 1
while ((%anticycle% != 20) && (%loadok% == 5))
eval stfnum (73299 + %random.20%)
if %exist.obj(%stfnum%)% != 1
%load% obj %stfnum%
eval loadok 1
else
eval anticycle (%anticycle% + 1)
end
done
end


~
#73302
приветствие у мудреца~
0 h0 100
~
wait 2
mecho - Привет тебе, путник!
wait 10
взд
mecho - Мало кто добирался сюда.
mecho - Но раз уж ты - один из этих немногих...
mecho - Не хочешь ли усвоить скромную толику знаний?
mecho - Учти только, что они недолговечны и забудутся на следующий день!


~
$
$
