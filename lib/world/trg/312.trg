#31200
маг кастует~
0 m 1
~
wait 1
фиг %actor.name%
halt
wait 1
if %amount% < 20
  msend %actor% За такие деньги я даже пальцем не пошевелю!
  halt
end
switch %amount%
  case 20
    msend %actor% Мудрый маг взял свиток с полки и зачитал его на Вас.
    mechoaround %actor% Мудрый маг взял свиток с полки и зачитал его на %actor.rname%.
    dg_cast 'серьезное исцеление' %actor.name%
    break
  case 90
    msend %actor% Мудрый маг взял свиток с полки и зачитал его на Вас.
    mechoaround %actor% Мудрый маг взял свиток с полки и зачитал его на %actor.rname%.        dg_cast 'защита' %actor.name%
    break
  case 100
    msend %actor% Мудрый маг взял свиток с полки и зачитал его на Вас.
    mechoaround %actor% Мудрый маг взял свиток с полки и зачитал его на %actor.rname%.        dg_cast 'затуманивание' %actor.name%
    break
  case 110
    msend %actor% Мудрый маг взял свиток с полки и зачитал его на Вас.
    mechoaround %actor% Мудрый маг взял свиток с полки и зачитал его на %actor.rname%.        dg_cast 'сила' %actor.name%
    break
  case 120
    msend %actor% Мудрый маг взял свиток с полки и зачитал его на Вас.
    mechoaround %actor% Мудрый маг взял свиток с полки и зачитал его на %actor.rname%.        dg_cast 'невидимость' %actor.name%
    break  
  case 130
    msend %actor% Мудрый маг взял свиток с полки и зачитал его на Вас.
    mechoaround %actor% Мудрый маг взял свиток с полки и зачитал его на %actor.rname%.        dg_cast 'свет' %actor.name%
    break
  default
    msend %actor% Извините, но я не знаю что Вы хотите от меня за эти деньги.
    msend %actor% Вот что я могу сделать для Вас:
    msend %actor% 20 кун - серьезное исцеление
    msend %actor% 90 кун - защита
    msend %actor% 100 кун - затуманивание
    msend %actor% 110 кун - сила
    msend %actor% 120 кун - невидимость 
    msend %actor% 130 кун - свет
done
~
#31201
зашли к конюху~
0 r 100
~
wait 1
msend %actor% Конюх сказал : 'Если лошадь нужна, то вы правильно сделали, что зашли ко мне.'
msend %actor% Конюх сказал : 'Оседлаю и снаряжу в путь дальний свежего коня за умеренную плату.'
~
#31202
приветсвие стражника~
0 q 100
~
wait 1
if (%actor.clan%==гд)
  if (%actor.clanrank% >= 8)
    msend %actor% При виде Вас, стражник вытянулся в струнку.
    mechoaround %actor% При виде %actor.rname%, стражник вытянулся в струнку.
  else 
    eval rand %random.3%
     if %rand%==1
        сказ %actor.name% "Долгих лет тебе, %actor.name%!"
        mechoaround %actor% Стражник поприветсвовал %actor.rname%.
      elseif %rand%==2
        поклон %actor.name% 
     else
        привет %actor.name%
    end
  end
else
msend %actor% Стражник хмуро посмотрел на Вас.
  mechoaround %actor% Стражник хмуро посмотрел на %actor.vname%.
end
~
#31203
на поваренке~
0 c 100
привал~
wait 1
msend %actor% Вы пристроились поудобнее за столом для отдыха.
msend %actor% Мальчонка мигом поднес Вам кружку светлого пива и закуску.
%actor.wait(5s)%
wait 7s
*dg_cast 'восст' %actor.name%
~
#31204
лезем на крышу~
2 c 100
лезть~
wait 1
if (%actor.vnum% != -1)
   halt
end
if (%arg.contains(крыша)%)
  wait 1
  wsend %actor% Вы вылезли в окно и стали карабкаться на крышу башни.
  wechoaround %actor% %actor.iname% полез в окно и исчез из виду. 
  wteleport %actor% 31245
  halt
end
~
#31205
кланстаф сыпется~
1 g 100
~
wait 1
if (%actor.clan%==гд)
  halt
else
  osend %actor.name% Вспыхнув белым светом %self.iname% исчез%self.q%...
  %purge% %self% 
end
~
#31206
охранник эмоции~
0 b 100
~
wait 5
eval rnd %random.10%
if %rnd%==1
  насторож
elseif %rnd%==2
  язвить
elseif %rnd%==3
  брысь
elseif %rnd%==4
  тоска
elseif %rnd%==5
  сморкаться
elseif %rnd%==6
  мечтать
elseif %rnd%==7
  ждать
elseif %rnd%==8
  нюхать
elseif %rnd%==9
  вопрос
else
  оскал
end
~
#31207
зал совета старших~
2 e 100
~
wait 1
if (%actor.clanrank% < 8)
 wait 2
 wsend %actor% Вдруг перед Вами появилась наглая и недовольная морда десятника.
 wsend %actor% Десятник крикнул Вам в лицо : 'Вашего ранга не достаточно чтобы входить в этот зал!'                           
 wsend %actor% Десятник вытолкал Вас за дверь.
 wechoaround %actor% В зал в попыхах вбежал десятник и с руганью набросился на %actor.rname%.
 wechoaround %actor% Смачным пинком под зад десятник вытолкал %actor.rname% за дверь.
 wait 2
 wteleport %actor% 31210
else
 halt
end
~
#31208
топаем у коня~
0 c 0
топнуть~
wait 1
if (%actor.clan%==гд)  
 mechoaround %actor% %actor.name% топнул%actor.g% ногой.
 msend %actor% Вы громко топнули ногой.
 mload obj 31233              
 дать свисток %actor.iname%
 msend %actor% Крылатый конь фыркнул, расправил крылья и улетел.
 mechoaround %actor% Крылатый конь фыркнул, расправил крылья и улетел.
 calcuid target 31203 mob 
 mpurge %target%
else
 mechoaround %actor% %actor.name% топнул%actor.g% ногой и удивился, что ничего не происходит.    
 mechoaround %actor% Крылатый конь посмотрел на %actor.rname% и сказал: 'Чего растопал%actor.u% то человечина?'
 msend %actor% Крылатый конь посмотрел на Вас и сказал: 'Чего растопал%actor.u% то человечина?'
end
~
#31209
свистим в свисток~
1 c 3
свистнуть~
wait 1
if (%actor.clan%==гд)
  osend %actor% Bы свистнули в чудо-свисток.
  oechoaround %actor% Поднялся сильный ветер! Из рук %actor.rname% вырвался странный предмет и исчез.
  osend %actor% Поднялся сильный ветер! Свисток вырвался из Ваших рук и исчез.
  oecho И откуда ни возьмись прилетел крылатый конь.
  oload mob 31203
  oforce %actor% оседлать конь      
  calcuid svistok 31233 obj 
  opurge %svistok%
else
  oechoaround %actor% %actor.iname% попытал%actor.u% свистнуть в чудо-свисток, но у него ничего не получилось.
  osend %actor% Bы попытались свистнуть в чудо-свисток, но у Вас ничего не получилось.
end
~
#31210
дали деньги конюху~
0 m 1
~
wait 1
if (%amount% < 100)
 msend %actor% Да за такие деньги даже солому не купишь, не то чтобы еще и лошадей прокормить.
msend %actor% Нет уж, так не пойдет. Давай 100 кун и дело сделке.
else
 msend %actor% Конюх призадумался! Пошарил в кармане и что-то достал.
 msend %actor% Конюх сказал : 'Вот держи этот свисток! Свистни в него и конь сам прилетит к тебе.'
 mload obj 31233
 дать свисток %actor.name% 
end
~
#31212
охранник встречает чужого~
0 qr 100
~
wait 1
if (%actor.clan%==гд)||(%actor.haveobj(31244)%)
 halt
else
кричать ТРЕВОГА! ШПИОН В КРЕПОСТИ !
msend %actor% Выхватив меч из ножен он кинулся на Вас.
 if %actor.class%==1
   атаковать .%actor.iname%
 else
   атаковать %actor.iname%
 end
end
~
#31213
пиранья встречает чужого~
0 qr 100
~
wait 1
if (%actor.clan%==гд)||(%actor.haveobj(31244)%)
 halt
else
mecho Пиранья издала непонятный звук издали похожий на человеческое "мясо!".
msend %actor% Раскрыв пасть пошире и оголив острые как серп зубы она кинулась на Вас.
 if %actor.class%==1
   атаковать .%actor.iname%
 else
   атаковать %actor.iname%
 end
end
~
#31214
телепорт~
2 c 0
лететь~
halt
wait 1
if %arg.contains(киев)%
  eval roomtel 49900+%random.70%
  wait 1
  wsend %actor% Вас подхватил воздушный вихрь и понес Вас в указанном направлении.
  wechoaround %actor% %actor.name% исчез в воздушном вихре.
  *wteleport %actor% %roomtel%
  wdamage %actor.name% %actor.exp%-10
  halt
end
wsend %actor% Воздушный вихрь чуть не сбросил Вас с крыши!
wsend %actor% Осторожнее надо быть! Так и убиться недолго.
wechoaround %actor% Воздушный вихрь чуть не сбросил %actor.rname% с крыши.
~
#31215
лезем с крыши~
2 c 100
лезть~
wait 1
if (%actor.vnum%!=-1)
   halt
end
if (%arg.contains(вниз)%)
  wait 1
  wsend %actor% Вы аккуратно стали спускаться с крыши башни.
  wechoaround %actor% %actor.iname% полез вниз, внутрь башни. 
  wteleport %actor% 31244
  halt
end
~
#31216
князь дает знак~
0 c 100
знак~
wait 1
if (%actor.clan%==гд)
  if (%actor.clanrank%>=8)
  mload obj 31244
  дать знак %actor.iname%
  end
end
~
#31217
пнуть статую~
1 c 4
пнуть~
wait 1
if !%arg.contains(задиг)% && !%arg.contains(статуя)%
return 1
halt
end
return 0
osend %actor% Вы БОЛЬНО пнули статую задига.
oechoaround %actor% %actor.name% БОЛЬНО пнул%actor.g% статую Задига.
if (%actor.gold% < 10 ) || (%actor.hitp% < 51 )
oecho __...и ничего не произошло!
halt
end
osend %actor% &RЭто действительно БОЛЬНО!&n
odamage %actor% 50
eval bufer %actor.gold(-10)%
wait 3
oecho Статуя Задига дернулась, и на пол брызнула тонкая струйка.
if %world.corobjs(31269) < 3
oload obj 31269
end
~
#31218
Лоад лужи~
1 n 100
~
wait 120s
oecho Лужица медленно испарилась.
wait 1
opurge %self%
~
$~
