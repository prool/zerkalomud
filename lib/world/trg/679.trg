#67900
Лоадим каменного демона~
2 e 100
~
wait 3s
wecho _Вдруг одна стена пещеры отделилась и из образовавшегося проема появился демон!
wload mob 67901
detach 67900 %self.id%
~
#67901
Убили каменного демона~
0 f 100
~
mload obj 67903 
~
#67902
Бросаем темный камень~
2 h 100
~
if (%object.iname% == темный камень)
wait 1s
wecho _Стена вспыхнула темным светом и чтала медленно растворяться.
wait 1s
wdoor 67904 north room 67912
wdoor 67912 south room 67904 
wait 1s
wecho _Вот стена полностью растворилась, и сейчас уже можно пройти дальше. 
end
~
#67903
Умер огненный шар~
0 f 100
~
mecho _Огненный шар разлетелся на множество мелких огоньков!
mload mob 67908
mload mob 67909
mload mob 67910 
~
#67904
Умер огненный морок~
0 f 100
~
return 0
mecho _Огненный морок ярко вспыхнул, распростроняя жар по всей пещере и пропал.
msend %actor% _Жар, идущий от огненного морока, Сильно повредил вас!
mechoaround %actor% _%actor.name% закрычал когда жар идущий от морока опалил его!
eval damage %actor.hitp%/5
mdamage %actor% %damage%
~
#67905
Убили вонючего скелета~
0 f 100
~
mecho  &g Вонючий скелет разлетелся на множество костей, оставив после себя нестерпимую вонь! &n
foreach victim %self.char%
mdamage %victim% 75 
done
~
#67906
В бою с трехглавым цербером-1~
0 k 10
~
set char %random.pc%
msend %char% _Трехглавый цербер взмахнул своим огромным хвостом!
  %char.position(6)%
  %char.wait(2)%
mechoaround %char% _Трехглавый цербер ударил своим хвостом %actor.rname% 
уронив его на землю!
~
#67907
В бою с трехглавым цербером-2~
0 k 10
~
mecho _Трехглавый цербер выпустил струю кислоты из одной своей пасти!
foreach char %self.char%
  if %random.2% == 1
    msend %char% _В Вас попала кислота трехглавого цербера!
    mechoaround %actor% _Кислота попала прямо в лицо %actor.rname%
    mdamage %char% 75
  end
done
~
#67908
В бою с трехглавым цербером-3~
0 k 5
~
mecho _Трехглавый цербер выпустил огненную струю из одной своей пасти!
foreach char %self.char%
  if %random.2% == 1
    msend %char% _В Вас попала огненная струя трехглавого цербера!
    mechoaround %actor% _Огненная струя попала прямо в лицо %actor.rname%
    mdamage %char% 100
  end
done
~
#67909
Убили трехглавого цербера~
0 f 100
~
mload obj 67917
~
#67910
Лоадим череп(50%)~
2 e 50
~
wait 4s
wecho _Вдруг из груды костей вылетел череп и громка клацая зубами бросился на Вас!
wload mob 67923
detach 67910 %self.id%
~
#67911
Разбираем завал~
2 c 100
разобрать~
if !%arg.contains(завал)% 
wsend %actor% _Что разобрать то вы хотите?!
return 0
halt 
end
wsend %actor% _Крехтя и отплевывоясь Вы разобрали зовал, освободив путь.
wechoaround %actor% _%actor.name% разобрал%actor.q% завал.
wdoor 67971 north room 67973
wdoor 67973 south room 67971
end
~
#67912
Убили ледяного демона~
0 f 100
~
if (%random.7% == 1) && (%world.curobjs(67931)% < 1)
mload obj 1218
end
~
#67913
репоп~
2 f 100
~
wdoor 67904 north purge
wdoor 67912 south purge
wdoor 67971 north purge
wdoor 67973 south purge
~
$~
