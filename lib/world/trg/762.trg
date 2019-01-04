* BRusMUD trigger file v1.0
#76200
кот~
0 q0 80
~
wait 1
eval  act %random.4%
switch  %act%
case 1
ик
break
case 2
рыг
break
case 3
прич
break
case 4
лиз
break
done


~
#76201
оборотень~
0 q0 70
~
wait 1
mecho Плюгавенький оборотень попытался спрятаться,
mecho но с дасадой слпюнул и заговорил:
wait 1
mecho _- Добрый день! Добрый тень!
mecho _- Я - дак Оборотень!
mecho _- Неловко вчерась обернулся:
mecho _- Хотел превратиться в дырявый плетень,
mecho _- Да вот посередке запнулся.
wait 1
mecho _- И кто я теперь - самому не понять,-
mecho _- Эк меня, братцы, скривило!..
mecho _- Нет, что-то стала совсем изменять
mecho _- Наша нечистая сила!


~
#76202
лесная нечисть~
0 q0 50
~
wait 1
switch %random.5%%
case 1
щек .%actor.name%
break
case 2
щуп .%actor.name%
break
case 3
язвить .%actor.name%
break
case 4
хихик .%actor.name%
break
case 5
ужас .%actor.name%
done



~
$
$
