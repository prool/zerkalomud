* BRusMUD trigger file v1.0
#161600
репоп зоны~
2 f0 100
~
calcuid m161602 161602 mob
attach 161608 %m161602.id%
detach 161607 %m161602.id%
detach 161609 %m161602.id%
detach 161610 %m161602.id%
detach 161613 %m161602.id%


~
#161601
двигаем люк 1~
2 c0 0
двигать сдвинуть отодвинуть~
if !%arg.contains(люк)%
%echo% Вы начали усиленно двигать тазом, но ничего не произошло.
   return 1
   halt
end
wait 1
if %actor.str% < 25
   wsend %actor% Вам слишком тяжело сдвинуть этот люк...
   wechoaround %actor% %actor.name% попытал%actor.u% подвинуть люк...
   halt
end
wsend %actor%       Вы напряглись и сдвинули крышку люка с места...
wechoaround %actor% %actor.name% напряг%actor.u% и сдвинул%actor.g% крышку люка...
wecho               Вам открылся проход, быстро уходящий вниз...
wdoor 161619 down room 161618
wdoor 161618 up room 161619
detach 161601 %self.id%
end




~
#161602
двигаем люк 2~
2 c0 0
двигать сдвинуть отодвинуть~
if !%arg.contains(люк)%
%echo% Вы начали усиленно двигать тазом, но ничего не произошло.
   return 1
   halt
end
wait 1
if %actor.str% < 25
   wsend %actor% Вам слишком тяжело сдвинуть этот люк...
   wechoaround %actor% %actor.name% попытал%actor.u% подвинуть люк...
   halt
end
wsend %actor%       Вы напряглись и сдвинули крышку люка с места...
wechoaround %actor% %actor.name% напряг%actor.u% и сдвинул%actor.g% крышку люка...
wecho               Вам открылся проход, быстро уходящий вниз...
wdoor 161681 down room 161624
wdoor 161624 up room 161681
detach 161602 %self.id%
end




~
#161603
освобождаем пленника 1~
0 c0 0
освободить развязать~
if !%arg.contains(пленника)% 
msend %actor%  Кого Вы хотите освободить ?!
return 0
halt
end
msend %actor%       Вы освободили пленника от цепей.
mechoaround %actor% освободил%actor.g% пленника от цепей.
mecho               Пленник встал, разминая кости.
mload mob 161614
mpurge пленный


~
#161604
что там под подушкой~
2 c0 0
отбросить отодвинуть приподнять поднять~
if !%arg.contains(подушку)% 
%send% %actor%  Что именно ?
return 0
halt
end
%send% %actor%      Вы заглянули под подушку.
%echoaround% %actor% приподнял%actor.g% подушку.
eval priznum 161617+%random.5%
if  ((%world.curobjs(%priznum%)%<4)&&(%random.10%<5))
     %echo%               Под подушкой что-то блеснуло.
     %load% obj %priznum%
end
detach 161604 %self.id%


~
#161605
благодарность пленника~
0 n0 100
~
г Спасибо...
%echo% Бедняга пошатнулся от слабости.
г Страшное место, но отсюда можно выбраться...
г Ключ, золотой клявс сспрраии.. мм.сч...ыыв.
%echo% Голос несчастного стал неразборчивым.
г там... в дар.. ей... те... под... под... подккхххххххрррррррррр............
%echo% Степной лучник потерял сознание.
%self.position(1)%
%self.hitp(0)%
%self.hitp(-1)%
detach 161605 %self.id%


~
#161606
зверь идет~
0 r0t0 100
~
%self.wait(1)%
wait 1s
%echo% Огромный страшный зверь приготовился к прыжку и оскалил клыки.
%echo% Боже, что за жуткое чудовище !
%echo% Бегите !
wait 1s
%echo% Ну же, бегите скорее !!!



~
#161607
Богра помер~
0 f0 0
~
calcuid r161610 161610 room
attach 161604 %r161610.id%






~
#161608
Богра вам рад~
0 h0 100
~
wait 1s
г О-хо-хо! Сам%actor.g% %actor.name% к нам пожаловал%actor.g% !!!
%echo% Богра заметно оживился и поудобнее устроился на подушках.
wait 1
г Молодец ты, %actor.name%, однако!
г Сам%actor.g% оброк принес%actor.q% !!! И просить не пришлось.
wait 2s
г Ну давай, 10000 ваших денег - тебе со скидкой.
ухм
attach 161609 %self.id%
attach 161610 %self.id%
attach 161613 %self.id%
detach 161608 %self.id%


~
#161609
Богра считает деньги~
0 m0 1
~
wait 1s
if (%amount%<10000)
%echo% Лицо Хана покраснело от ярости, глаза выкатились из орбит.
г Ты что, %actor.name%, надурить меня вздумал%actor.g%?!?!?!!
крич Взять их!!!
run 161610 %self.id%
halt
end
if (%amount%>=10000)
%echo% Лицо Хана расплылось в довольной улыбке.
г Хаш-Харашооо, %actor.name%, уважил%actor.g% старика.
г Все, можешь проваливать, приходи еще, как денег насобираешь.
миг %actor.name%
%echo% Богра взмахнул рукой.
eval pcs %self.pc%
foreach pc %pcs%
%teleport% %pc% 161689
done
wait 1s
%self.gold(1)%
attach 161608 %self.id%
detach 161610 %self.id%
detach 161613 %self.id%
detach 161609 %self.id%
end


~
#161610
Всех в тюрьму~
0 z0 0
~
Wait 1s
%echo% На крик Хана сбежалось множество охранников, они очень ловко повязали Вас.
eval pcs %self.pc%
foreach pc %pcs%
%pc.wait(10)%
done
г Ах, шайтан! Не хотите по-хорошему - будем по-плохому.
%echo% Богра скомандовал своим воинам: "Бросить их в темницу!"
Wait 1s
%echo% Один из слуг наклонился к уху хана и что-то ему зашептал.
%echo% На лице илекхана отразилась напряженная умственная деятельность.
Wait 1s
г Умер раб, говоришь, работать некому? Ну так выбирай из этих одного!
г Или нет, не выбирай, я сам.
Wait 1s
%echo% Изверг начал бормотать что-то на незнакомом языке, 
%echo% тыкая в каждого из Вас поочередно пальцем.
%echo% 
wait 1s
%echo% В приблизительном переводе с караханидского это звучало бы так:
г Вышел степной-воин-караханид из тумана
г Вынул короткое-колющее-оружие-караханида из кармана
г Будет резать, будет бить и всячески издеваться
г Все-равно тебе...
eval zhertva1616 %random.pc%
%echo% Палец Богры остановился на %zhertva1616.pname%.
г                 ...Горшки за нами мыть!!!
ржа
г Вот и наш новый раб.
ул .%zhertva1616.name%
г Иди, работай.
%send% %zhertva1616% Вас схватили, проволокли по лагерю и бросили на ковер в другом шатре.
%echoaround% %zhertva1616% Стражники схватили ~~%zhertva1616.vname% под руки и уволокли в неизвестном направлении.
wait 1s
%teleport% %zhertva1616% 161672 horse
wait 1s
г Так, с одним разобрались.
г Остальным - пожизненная темница без удобств вплоть до выкупа.
г Увести.
wait 2s
%echo% Вы почуствовали как Вас куда-то волокут.
eval pcs1 %self.pc%
foreach pc1 %pcs1%
eval rnum1616 161633+%random.4%
%teleport% %pc1% %rnum1616% horse
done
calcuid r161672 161672 room
attach 161611 %r161672.id%
attach 161607 %self.id%
detach 161613 %self.id%


~
#161611
ищем ключик~
2 c0 0
поднять приподнять отодвинуть~
if !%arg.contains(ковер)% 
%send% %actor%  Что именно ?
return 0
halt
end
%send% %actor%      Вы заглянули под ковер.
%echoaround% %actor% приподнял%actor.g% ковер.
if  (%world.curobjs(161622)%<1)
     %echo%               В пыли что-то блеснуло.
     %load% obj 161622
end
detach 161611 %self.id%





~
#161612
тормозим наемника~
0 r0t0 100
~
%self.wait(1)%
wait 1s
%echo% Вы почуствовали чье-то странное присутствие.
%echo% Вам стало очень неуютно тут, безумно захотелось покинуть это место.
wait 1s
%echo% Шевелите ногами, а то может быть хуже !!!



~
#161613
Молчать!~
0 d0 0
*~
г Чего ты там бормочешь? Деньги давай гони, и проваливай !



~
#161614
смерть стражника~
0 f0 100
~
if (%world.curobjs(161604)% < 6) && (%random.10% <= 1)
   mload obj 161604
end

~
#161615
смерть стражника чигиля~
0 f0 100
~
if (%world.curobjs(161603)% < 6) && (%random.10% <= 1)
   mload obj 161603
end

~
#161616
смерть чигильского стрелка~
0 f0 100
~
if (%world.curobjs(161601)% < 6) && (%random.10% <= 1)
   mload obj 161601
end

~
#161617
смерть воина степняка~
0 f0 100
~
if (%world.curobjs(161606)% < 6) && (%random.10% <= 1)
   mload obj 161606
end

~
#161618
смерть карлукского воина~
0 f0 100
~
if (%world.curobjs(161605)% < 6) && (%random.10% <= 1)
   mload obj 161605
end

~
#161619
смерть Сабука~
0 f0 100
*~
if (%world.curobjs(161600)% < 4) && (%random.10% <= 1)
   mload obj 161600
end
if (%world.curobjs(161615)% < 4) && (%random.10% <= 1)
   mload obj 161615
end
if (%world.curobjs(161616)% < 4) && (%random.10% <= 1)
   mload obj 161616
end

~
#161620
смерть степного наемника~
0 f0 100
~
if (%world.curobjs(161602)% < 6) && (%random.10% <= 1)
   mload obj 161602
end

~
#161621
смерть Насра~
0 f0 100
*~
if (%world.curobjs(161613)% < 4) && (%random.10% <= 1)
   mload obj 161613
end
if (%world.curobjs(161614)% < 4) && (%random.10% <= 1)
   mload obj 161614
end

~
#161622
смерть степного лучника~
0 f0 100
~
if (%world.curobjs(161607)% < 6) && (%random.10% <= 1)
   mload obj 161607
end

~
#161623
смерть Абд Ал Мерика~
0 f0 100
*~
if (%world.curobjs(161610)% < 4) && (%random.10% <= 1)
   mload obj 161610
end
if (%world.curobjs(161611)% < 4) && (%random.10% <= 1)
   mload obj 161611
end
if (%world.curobjs(161612)% < 4) && (%random.10% <= 1)
   mload obj 161612
end

~
#161624
смерть Али Тегина~
0 f0 100
*~
if (%world.curobjs(161608)% < 6) && (%random.10% <= 1)
   mload obj 161608
end
if (%world.curobjs(161609)% < 6) && (%random.10% <= 1)
   mload obj 161609
end

~
$
$
