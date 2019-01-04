* BRusMUD trigger file v1.0
#50100
Сон часового~
0 c0 0
спеть~
if !(%arg.contains(колыбельную)%)
   wsend        %actor%         _Что будем петь?
   return 0
   halt
else
wait 1s
вопр
г Кто тут поет колыбельную?
wait 2s
г А ну ка пошли отсюда, щенки!
г Мне нельзя спать!
хмур
wait 1s
г нельзя
зев
wait 1s
г нель..
wait 1s
зев
спать
wait 2s
храп
wait 9s
проснуться
встать
эмоц настороженно посмотрел по сторонам
end




















~
#50101
Лезем в подвал~
2 c0 0
лезть ~
if !(%arg.contains(в подвал)%)
   wsend       %actor% _Куда лезть-то собрались?
   return 0
   halt
 else
 %actor.wait(2)%
 wsend %actor% _Отбросив в сторону старые бочки, Вы полезли в подвал.
 wechoaround %actor% _%actor.name% полез%actor.q% в подвал.
 wait 2s
 wteleport %actor% 50180
 end





























~
#50102
Вылезаем из подвала~
2 c0 0
вылезти~
if !(%arg.contains(из подвала)%)
   wsend       %actor% _Куда лезть-то собрались?
   return 0
   halt
 else
 %actor.wait(2)%
 wsend %actor% _Пробравшись сквозь паутину и грязь, Вы вылезли из подвала.
 wechoaround %actor% _%actor.name% вылез%actor.q% из подвала.
 wait 2s
 wteleport %actor% %number%
 end

~
#50103
Cумонят стража~
0 r0 100
~
wait 1
if (%actor.dex% < 22) && (%random.10% <= 5)
проснут
вст
кри Ах ты ворюга! Стража!!!
mkill %random.pc%
wait 4s
if %world.curmobs(50133)% < 10
mecho _Огромный стражник неожиданно появился из-за угла.
mload mob 50133
end
*detach 50106 %self.id%
end
if (%actor.dex% < 25) && (%random.10% <= 3)
проснут
вст
кри Ах ты ворюга! Стража!!!
mkill %random.pc%
wait 4s
if %world.curmobs(50133)% < 10
mecho _Огромный стражник неожиданно появился из-за угла.
mload mob 50133
end
*detach 50106 %self.id%
end
if (%actor.dex% < 30) && (%random.10% <= 2)
проснут
вст
кри Ах ты ворюга! Стража!!!
mkill %random.pc%
wait 4s
if %world.curmobs(50133)% < 10
mecho _Огромный стражник неожиданно появился из-за угла.
mload mob 50133
end
*detach 50106 %self.id%
end
end

~
#50104
Жители грызут орехи.~
0 a0b0 25
~
wait 1
if %self.fighting% || (%self.position% == 4 )
halt
end
switch %random.3%
case 3
emot разгрыз%self.q% орех и сплюнул%self.g% скорлупу в ладонь.
break
case 2
emot разгрыз%self.q% орех и сплюнул%self.g% скорлупу в ладонь.
wait 1s
mload obj 50115
брос горсть
done

~
#50105
Торговка орет~
0 b0 7
~
кри Пирожки! Горячие пирожки, налетай - раскупай!


~
#50106
Пьяница бузит~
0 b0 30
~
eval pian %random.5%
eval pl %random.npc%
switch %pian%
case 5
рыг %pl.name%
г Ой, и-и-иик, дай ка я, и-ик, протру твой камзол..
wait 1s
эмо свалился на пол
break
case 4
eval mo %random.npc%
рыг %mo.name%
break
case 3
ик
wait 1s
eval mo2 %random.npc%
пет %mo2.name%
break
case 2
бух
break
case 1
тоск
end


~
#50107
Репоп зоны~
2 f0 100
~
if %exit%
detach 50101 %exit.id%
end
switch %number.8%
case 1
set number 50161
break
case 2
set number 50162
break
case 3
set number 50156
break
case 4
set number 50158
break
case 5
set number 50100
break
case 6
set number 50179
break
case 7
set number 50169
break
case 8
set number 50173
done
calcuid exit %number% room
attach 50101 %exit.id%
calcuid cavern 50180 room
remote number %cavern.id%

~
$
$
