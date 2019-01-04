#85600
Быстрая выдача снаряжения~
0 d 100
снаряжение~
* Триггер повешен на рентера. При желании можно его прицепить к другому мобу
* и добавить/убавить вещи, изменить комплектацию для определенных профессий,
* соответственно меняя стоимость.
wait 1
if %actor.vnum% != -1
  halt
end 
say Сейчас-сейчас...
wait 1
if %actor.bank% < 2856
  дум
  say Эх, а кун-то даже на припасы не хватит!
  halt
end
eval buffer %actor.bank(-2856)%
mload obj 85645
mload obj 85646
mload obj 85648
mload obj 85649
mload obj 85649
mload obj 85649
mload obj 85649
mload obj 85649
mload obj 85649
mload obj 85649
mload obj 85649
mload obj 85649
mload obj 139
mload obj 139
put all рюк
say Вот припасы твои.
give all .%actor.name%
drop all
wait 2
say Сейчас снаряжение тебе подберем...
if %actor.bank% < 600
  дум
  say За снаряжение тоже надо платить, а на него у тебя денег нет!
  halt
end
eval buffer %actor.bank(-600)%
mload obj 85600
mload obj 85600
mload obj 85601
mload obj 85603
mload obj 85604
mload obj 85605
mload obj 85606
mload obj 85607
mload obj 85608
mload obj 85609
mload obj 85610
mload obj 85623
give all .%actor.name% 
drop all
wait 1
say Оружие сам%actor.g% себе в кузне купи - не маленк%actor.w% уже.
~
#85601
Удаление шмота~
1 g 100
~
if ((%actor.clan% == срб) || (%actor.vnum% != -1))
  halt
end
osend %actor% %self.name% рассыпал%self.u% в ваших руках серебристой трухой.
wait 1
opurge %self%
~
#85602
Лоад коня~
1 c 2
свистеть~
* Триггер на лоад кланового коня. Цепляется к уздечке.
* Разумеется, если вы меняете названия предмета (уздечки)
* или коня, то в триггера необходимо внести изменения
wait 1
if !%arg.contains(свистулька)%
  osend %actor% Куда свистим?
  halt
end
osend %actor% Вы поднесли свистульку к губам и раздался тихий свист.
if %actor.clan% != срб
  halt
end
if %world.curmobs(85608)% > 50
  osend %actor% На миг Вам показалось, что Вы заметили прямо перед собой ощерившуюся пасть выдры.
  osend %actor% Но через миг видение исчезло, как не бывало...
  halt
end
oechoaround %actor% %actor.name% поднес%actor.g% свистульку к губам и раздался тихий свист.
oload mob 85621
oecho Послышалось резкое шуршание и из ближайшей щели вылезла боевая выдра.
oforce %actor% оседлать выдра
wait 1
opurge %self%
~
#85603
Расседлать коня~
0 c 100
прогнать~
* Триггер на свертывание кланового коня. Цепляется к мобу-коню.
* Разумеется, если вы меняете названия предмета (уздечки)
* или коня, то в триггера необходимо внести изменения
wait 1
if %self.fighting%
  halt
end
if !%arg.contains(выдру)%
  msend %actor%  Кого вы хотите прогнать?
  halt
end
if (%actor.clan% != срб) || (%actor% != %self.leader%)
  msend %actor% Это не Ваша зверушка.
  halt
end
msend %actor% Вы громко засвистели и Ваша выдра умчалась восвояси.
mechoaround %actor% %actor.name% замахал%actor.g% руками, засвистел и выдра быстро убралась восвояси.
mload obj 85652
give свистулька .%actor.name%
wait 1
mecho Только мелькнул вдалеке белый оскал и тут же испарился в тишине.
wait 1
mpurge %self%
~
#85604
Выдача уздечек~
0 m 1
~
* Триг висит на конюхе
wait 1
if %amount% < 50
  wait 2
  say Маловато будет!
  give %amount% кун .%actor.name%
  halt
end
if %world.curobjs(85652)% >= 10
  wait 2
  say Нету свистулек, кончились!
  give %amount% кун .%actor.name%
  halt
end
wait 2
say Вот, держи!
эм важно помахала хвостом
wait 1s
г Как свистнешь в эту свистульку, так тут же примчится одна из моих учениц!
г А коли не нужна более - прогони ее.
mload obj 85652
give свист .%actor.name%
~
#85605
ВстречаетВыдра~
0 q 100
~
wait 1s
г Добро пожаловать, соседушка!
г С утра до ночи тружусь я, все выдры выдрессерованы.
г 50 кун положи и забирай любую!
~
#85606
ВстречаетСтражЗамка~
0 q 100
~
wait 1s
if %actor.clan% == срб
  mecho _Пенек-топляк радостно заскрипел приветсвуя своих
else
  mecho _Пенек-топляк угрожающе заскрипел, свивая черные ветви в тугую плеть.
end
~
#85607
Сообщения в брюхе живоглота~
2 b 25
~
switch %random.6%
  case 1
    wecho Стенки брюха содрогнулись, и начали сжиматься.
  break
  case 2
    wecho Откуда-то сверху на вас обрушился целый водопад желтой слизи.
  break
  case 3
    wecho Послышался громкий неприятный звук, и в нос вам ударила волна мерзкого запаха.
  break
  case 4
    wecho Капли обжигающей кислоты попали вам за шиворот.
  break
  case 5
    wecho Вы споткнулись, и полетели прямо в кучу полупереваренных потрохов.
  break
  case 6
    wecho Стенки брюха гриба-боброглота принялись неторопливо вас пережевывать.
  break
done
~
#85608
Гриб-боброглот глотает~
0 bq 30
~
wait 1
set victim %random.pc%
if !%victim%
  halt
end
msend %victim% Гриб-боброглот принялся ощупывать вас щупальцами и голодно ухать.
mechoaround %victim% Гриб-боброглот принялся ощупывать %victim.vname% щупальцами и голодно ухать.
if (%random.100% <= 51)
  msend %victim% Гриб-боброглот неожиданно сгреб вас щупальцами, и затащил к себе в пасть!
  mechoaround %victim% Гриб-боброглот сгреб %victim.vname% щупальцами и проглотил!
  mteleport %victim% 50084
  mechoaround %victim% Кто-то со сдавленным воплем вывалился сверху.
end
~
#85609
Выбраться из брюха боброглота~
2 c 1
лезть пролезть залезть~
wait 1
if !%arg.contains(дыра)%
  wsend %actor% Куда это вы лезете?
  halt
end
if (%actor.move% < 30)
  wsend %actor% Вы слишком устали...
  halt
end
wsend %actor% Вы встали на карачки и поползли в дыру.
wechoaround %actor% %actor.name% встал на карачки и принялся протискиваться в пульсирующую дырку.
wait 2s
if (%random.100% < 98)
  wsend %actor% Вы долго ползали по кишкам боброглота, но в конце-концов снова попали в брюхо...
  wechoaround %actor% Густо покрыт%actor.w% дрянью %actor.name% выполз%actor.q% откуда-то.
  eval buf %actor.move(-30)%
  halt
end
wsend %actor% Наконец-то вы выбрались наружу! Но в каком виде...
calcuid mushroom 85622 mob
if %mushroom%
  set room %mushroom.realroom%
else
  eval room 27030+%random.20%
end
wteleport %actor% %room%
wechoaround %actor% Густо покрыт%actor.w% дрянью %actor.name% выполз%actor.q% из-под гриба-боброглота!
~
#85610
Убили боброглота~
0 f 100
~
calcuid troom 50084 room
foreach target %troom.pc%
  mteleport %target% %self.realroom%
  mechoaround %target% Покрытый всякой дрянью %target.name% вывалил%actor.y% из распоротого брюха гриба-боброглота!
  msend %actor% Кто-то вспорол боброглоту брюхо и вы вывалились наружу!
done
~
$~
