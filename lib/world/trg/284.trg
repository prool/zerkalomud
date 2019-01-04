#28400
встречакупец~
0 q 100
~
wait 1
msend %actor% Здраве будь, %actor.name%!
wait 1
грусть
wait 1
msend %actor% Говорят снова басурманы решили напасть на наши земли.
msend %actor% Вот и застрял я здесь со своим товаром, не знаю что и делать.
msend %actor% Вот в Корсунь надо.
wait 1
msend %actor% Ну да ладно, не буду тебя беспокоить, надеюсь скоро
msend %actor% прибудет дружина княжеская, очистит дорогу.
~
#28401
встречаополчен~
0 q 100
~
wait 1
msend %actor.name% Добрый день, %actor.name%!
msend %actor.name% Мне почему то кажется, что у тебя есть вещь которая нужна мне.
msend %actor.name% Даже не знаю почему, но внутренний голос мне говорит об этом.
wait 1
ул
~
#28402
ресетзоны~
2 f 100
~
context 284
unset hero284
~
#28403
взкопье~
1 g 100
~
wait 1
context 284
set hero284 %actor.name%
WORLDS hero284
calcuid hmob 28402 mob
attach 28401 %hmob.id%
attach 28404 %hmob.id%
detach 28403 %self.id%
~
#28404
далиополчкопье~
0 j 100
~
context 284
wait 1
if (%object.vnum%!=28402)
дать %object.name% %actor.name%
tell %actor.name% Зачем мне это?
end
if (%object.vnum%==28402) && (%actor.name%==%hero284%)
msend %actor.name% О, узнаю копье, с ним мой прадед ушел на битву со степняками
msend %actor.name% и не вернулся. Вот, да древке его имя даже написано.
msend %actor.name% Сильный боец был, много он ворогов земли нашей
msend %actor.name% к своим предкам отправил, все его хорошо помнят.
msend %actor.name% Повешу копье у себя в горнице на память для сыновей.
wait 1
mpurge копье
if %world.curobjs(28403)%<3
msend %actor.name% А тебе дам не хуже копье, мастера у нас стали еще
msend %actor.name% искуснее в изготовлении копей, любую вражину положишь.
mload obj 28403
дать длинное %actor.name%
else
msend %actor.name% Спасибо тебе, %actor.name%.
%self.gold(+150)%
дать 150 кун %actor.name%
end
благ %actor.name%
detach 28401 %self.id%
detach 28404 %self.id%
end
~
$~
