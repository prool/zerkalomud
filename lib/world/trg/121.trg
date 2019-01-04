#12100
Голова говорит~
0 r 100
~
wait 1
switch %random.5%
  case 1
    say А Руслан то, смелее был.
  break
  case 2
    say Иди сюда, урод!
  break
  case 3
    say Да я тебя .... одним ударом
  break
  case 4
    say Какие слабые герои пошли!
  break
  default
    say Давай биться, кто кого! В очередь, сукины дети!
  break
done
~
#12101
Рыбка говорит~
0 q 100
~
wait 1
ск %actor.name% Чего тебе надобно, старче! Только на сей раз губу не раскатывай.
~
#12102
рыбку попросили~
0 d 0
корыто~
wait 1
if (%random.1000% <= 100)
  ск %actor.name% Вот, возьми, да отдай своей старухе! 
  ск %actor.name% И что она у тебя с ними делает в таком количестве?
  mload obj 12108
  дат корыт %actor.name%
else
  ск %actor.name% Все, достал ты меня своими корытами, нет больше! 
end
detach 12101 %self.id%
detach 12102 %self.id%
~
#12103
Деду дали обьект~
0 j 100
~
wait 1
if %object.vnum% == 12108
  wait 8
  say Задрали уже с этими корытами.
  wait 8
  say Ну куда мне их девать!!!!
  wait 8
  say Вся деревня уже ими топит, но ведь не горят проклятые!!!
  wait 8
  mecho Дед смачно плюнул и крепко выругался
  wait 8
  руг
  wait 8
  mecho Бабка испуганно заткнула уши.
  wait 8
  calcuid var 12108 obj
  mjunk all
  say Засунь его лучше себе... На голову!
end
if %object.vnum% == 12100
  wait 1
  mpurge %object%
  wait 8
  say Вот спасибо странник, выручил!!!!
  wait 8
  улы
  wait 8
  say У меня на 100 штук заказ, а одного не хватает...
  wait 8
  %self.gold(+100)%
  дать 100 кун %actor.name%
  wait 1
  *mpurge %var%
end
if %object.vnum% == 12101
  wait 8
  say Мне это не нужно. Лучше бабке отдай.
  дать коло %actor.name%
end
~
#12104
Дали бабке обьект~
0 j 100
~
wait 1
if %object.vnum% == 12108
  wait 8
  ск %actor.name% ы
  wait 8
  say Ты это на что намекаешь!!!!!
  wait 8
  улы %actor.name%
  wait 8
  say Принесли бы лучше цветы или шоколадку!
  wait 1
  mpurge %object%
end
if %object.vnum% == 12100
  wait 8
  say По этому делу у нас дед специалист. Ему и отдавай.
  дать яич %actor.name%
end
if %object.vnum% == 12101
  wait 8
  say Спасибо, добрый человек! Выручил стариков.
  wait 8
  %self.gold(+100)%
  дать 100 кун %actor.name%
  wait 1
  mpurge %object.iname%
  wait 8
  msend %actor% Бабка съела колобка.
  wait 8
  улы
  say Семья у нас бедная, каждая корка хлеба на счету.
end
~
#12105
Леший здоровается~
0 g 25
~
wait 1
if %actor.vnum%==12102
  щупать русалка
end
~
#12106
курочку убили~
0 f 10
~
mload obj 12110
~
#12107
кот~
0 q 25
~
wait 1
заумн
~
#12108
померлихо~
0 f 100
~
if (%world.curobjs(547)%) == 0 && (%random.12%==1)
  mload obj 547
end
~
#12109
голова рип~
0 f 100
~
mload obj 12106
~
$~
