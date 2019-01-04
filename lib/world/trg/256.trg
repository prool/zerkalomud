#25600
заяц удирает~
0 r 100
~
detach 25520 %self.id%
switch %random.4%
case 1
s
w
s
break
case 2
n
e
n
break
case 3
e
n
e
break
default
w
s
s
done
attach 25520 %self.id%
~
#25601
дали шкурку охотнику~
0 j 100
~
wait 1
if ( %object.vnum% != 25511 )
wait 2
вопрос %actor.name%
set objname %object.name%
drop %objname.car%
halt
end
wait 1
%purge% %object%
say Ну-ка, что ты тут принес%actor.q%...
emot принялся кроить и выделывать заячью шкурку
wait 10s
switch %random.3%
case 1
if (( %random.10% < 6 ) && ( %world.curobjs(25600)% < 3 ))
wait 1
mload obj 25600
say Ну вот - неплохая вещь получилась
ул
give рукав %actor.name%
else
say Не получилось ничего, дрянной нынче мех у зайца пошел...
вздох
end
detach 25601 %self.id%
halt
break
case 2
if ( %random.10% < 6 ) && ( %world.curobjs(25601)% < 3 )
mload obj 25601
say Ну вот - неплохая вещь получилась
ул
give шапка %actor.name%
else
say Не получилось ничего, дрянной нынче мех у зайца пошел...
вздох
end
detach 25601 %self.id%
halt
done
say Не получилось ничего, дрянной нынче мех у зайца пошел...
вздох
detach 25601 %self.id%
~
#25602
вошли к охотнику~
0 q 100
~
wait 2
улы
say А, здраве будь, %actor.name%!
say Присаживайся, отдохни с дороги.
wait 2
say Посидим, поболтаем, ну а коли добыл%actor.g% ты чего, шкуру там лисью, али заячью - мне неси.
say Может и сделаю чего - всего-то за 100 кун.
~
#25603
охотнику дали деньги~
0 m 1
~
wait 1
if %amount% < 100
say Нет уж, 100 кун - за меньшее не возьмусь.
give  %amount% кун %actor.name%
halt
end
wait 2
say Вот и славно - показывай добычу!
attach 25601 %self.id%
~
$~
