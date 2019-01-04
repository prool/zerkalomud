#21100
страж осматривает~
0 r 60
~
wait 1
mecho Страж оглядел Вас с головы до пят.
хих
wait 1
say ну ты КРаСавЧеГГГГГ!!!
хих
~
#21101
удаление стафа для неклановых~
1 ghit 0
~
* Триггер предовращает возможность использовния клан-стафа
* неприписанными чарами. Предпочтительно просто добавить
* всей экипировке описание, свидетельствующее о ее принадлежности, но
* можно использовать этот триггер - однако не подключайте его к емкостям и сумкам.
* Вместо "абв" надо указать аббревиатуру названия клана в нижнем регистре
if %actor.vnum% != -1
  halt
end 
wait 1
if %actor.clan% == тз
  halt
endif
osend %actor% %self.name% сгорел%self.g% в ваших руках.в очертаниях огня вы увидели буквы &RТЗ&n 
oechoaround %actor% в очертаниях огня, охватившего %self.name%, Вы лишь заметили кровавый знак &RТЗ&n
wait 1
opurge %self%
~
#21102
шут жжот!~
-1  0
~
-1  -1
-1  -1
0  0
wait 1  
switch  %random.10%
  case 10
    say вахахахаххахахахха!
  break
  case 9
    say Смерть иродам!!!
    хих
  break
  case 8
    say Я злой и страшный серый волк! Я в поросятах знаю толк!
    ухмыл
  break
  case 7
    say Ща как дам по башке!
    mecho Шут взял БАЛЬШой шприц в обе руки.
    wait 1
    mecho &yШут не смог причинить Вам вред&n.
    wait 1
    буб
    wait 1
    mecho Шут прекратил использовать БАЛЬШой шприц.
    wait 1
    say ну ничего! подрасту - стану большим папкой в это маде, вот тогда и посмотрим!
  break
  case 6
    say Эх! Юрина бы Вам в дружину, вот тогда бы вы бы и порулили! А так вата-ватой!
    взд
  break
  case 5
    say Никто мои ладанки с горстью русской земли не видел ? Потерял тут где-то недавно...
    вопр
    wait 1
    say Если кто найдет - сразу мне давайте ее!
  break
  case 4
    say Подамагаю! Куплю стаф! Сниму стаф! Отдам стаф! Обменяю стаф! Дорого!
  break
  case 3
    say Возмите меня в ПК! Я больше тупить не буду!
    wait 1
    взд
    wait 1
    say Ну не хотите - как хотите! Такого овера теряете!
  break
  case 2
    say Никому не приношу никаких извенений! Обещаю агрить на всех при первой возможности!
    хих
  break
  case 1
    say Дай сет-стаф! Ну дай сет-стаф!
    mecho Скелет оглядел Вас с головы до пят.
    морщ
    say Ты бы хоть клан-стаф одел что ли.
    хих
    
~
#21103
выдача комплекта стафа~
0 c 0
получить~
drop all
if %actor.bank% < 1220
  дум
  say Э, да у тебя кун-то даже на припасы не хватит!
  halt
end
say о оптовый покупатель !
сиять
eval buffer %actor.bank(-1220)%
mload obj 21121
mload obj 21113
mload obj 21114
mload obj 21115
mload obj 21116
mload obj 21117
mload obj 21118
mload obj 21119
mload obj 21120
mload obj 21121
mload obj 21122
mload obj 21123
mload obj 21122
mload obj 21106
mload obj 21105
mload obj 139
mload obj 144
mload obj 141
mload obj 142
put all узелок
give узелок .%actor.name%
хих .%actor.name%
say одевай доспехи и иди в бой!!!
~
#21104
звать проводника~
2 c 0
свистнуть~
wsend %actor%  Вы громко засвистели,
wsend %actor%  Из тени появился Тотемский проводник
wsend %actor%  Тотемский проводник сказал Вам : 'Сударь следуйте за мной пожалуйста'
wsend %actor%  Вы последовали за проводником.
if (!%actor.rentable% && !%actor.fighting% && (%actor.clan% == тз ))
  wechoaround %actor% %actor.name% скрылся в тени.
  wteleport %actor% 21109
done
wechoaround %actor% %actor.name% появился из потайной двери.
halt
elseif (!%actor.fighting% && (%actor.clan% == тз))
wechoaround %actor% %actor.name% исчез в тени.
switch %random.5%
  case 5
    wteleport %actor% 21195
  break
  case 4
    wteleport %actor% 21190
  break
  case 3
    wteleport %actor% 21189
  break
  case 2
    wteleport %actor% 21199
  break
  case 1
    wteleport %actor% 21196
  break
done
wechoaround %actor% %actor.name% появился из потайной двери.
return 0
halt
end
else
wsend %actor% Чаво? 
~
#21105
лезем в канализацию~
2 c 0
лезть щель~
wsend %actor%  Вы начали рыскать в куче мусора, и заметили щель.
wsend %actor%  Вас засосало прямо в трубу.
wechoaround %actor% %actor.name% что-то начал искать.
wechoaround %actor% %actor.name% засосало в гнилую трубу.
wteleport %actor% 21198
%actor.position(6)%
done
wechoaround %actor% %actor.name% с грохотом упал по средине лужи.В его глаза вы видите помуутнение.
halt
~
#21106
ловушка 1 к двери закрытой~
2 e 100
~
* %actor.wait(5)%
* wecho  Как только вы вошли в комнату сверху на Вас упали камни.
* wecho  Вы попытались увернуться...
* wecho  &RНо камни ударили по Вам!&n
* foreach victim %self.all%
*  wdamage %victim% 200
~
#21107
смотрим из замка~
2 e 1
север~
* calcuid troom 21048 room
* wecho Вы посмотрели на север:
* foreach char %troom.all%
*  if %char%
*    wecho Вы увидели %char.vname%
*  else
*  break
~
#21108
смотрим из замка~
2 e 1
запад~
* calcuid troom 21048 room
* wecho Вы посмотрели на запад:
* foreach char %troom.all%
*  if %char%
*    wecho Вы увидели %char.vname%
*  else
*  break
~
#21109
смотрим из замка~
2 e 1
юг~
* calcuid troom 21048 room
* wecho Вы посмотрели на юг:
* foreach char %troom.all%
*  if %char%
*    wecho Вы увидели %char.vname%
*  else
*  break
~
#21110
смотрим из замка~
2 e 1
вверх~
* calcuid troom 21048 room
* wecho Вы посмотрели на вверх:
* foreach char %troom.all%
*  if %char%
*    wecho Вы увидели %char.vname%
*  else
*  break
~
#21111
зашли к воротам!~
0 q 100
~
if %actor.clan% == тз
  wait 3
  mecho Средний дозорный воин произнес : 'Добро пожаловать защитник наших земель'
else
  крич %actor.iname% хочет войти к нам в гости!!!
end
~
#21112
камни сыпятся~
2 e 100
~
wechoaround %actor.name% разогнавшись побежал%actor.u% на восток.
wsend %actor% Как только вы вошли в комнату сверху на Вас упали камни.
wsend %actor% Вы попытались увернуться...
wsend %actor% &RВы БОЛЬНО ударились головой.&n
wsend %actor% Вас отшвырнуло назад.
wsend %actor% В глазах у Вас померкло.
wsend %actor% Вы очнулись. 
wteleport %actor% 21126
eval dam124 %actor.hitp%/2
wait 1
wdamage %actor% %dam124%
wechoaround %actor.name% с криками прилетел%actor.u% с запада,
~
#21113
смотрим из замка~
2 e 1
восток~
* calcuid troom 21048 room
* wecho Вы посмотрели на восток:
* foreach char %troom.all%
*  if %char%
*    wecho Вы увидели %char.vname%
*  else
*  break
~
#21114
проходим ловушку1~
2 c 0
пробежать~
wsend %actor% Разогнавшись вы устремились на восток.
wteleport %actor% 21187
if !%arg.contains(слева)%
  %actor.wait(5)%
  wecho  Как только вы вошли в комнату сверху на Вас упали камни.
  wecho  Вы попытались увернуться...
  wecho  &RНо камни ударили по Вам!&n
  foreach victim %self.all%
    eval dam124 %actor.hitp%/2
    wait 1
    wdamage %actor% %dam124%        
  done                     
  return 0
  halt
end
else
wsend %actor% Вам повезло.
~
#21115
копья летят в чара~
2 e 100
~
wechoaround %actor.name% разогнавшись побежал%actor.u% на восток.
wsend %actor% Как только вы вошли в комнату сверху на Вас упали камни.
wsend %actor% Вы попытались увернуться...
wsend %actor% &RВы БОЛЬНО ударились головой.&n
wsend %actor% В глазах у Вас померкло.
wsend %actor% Вы очнулись. 
wteleport %actor% 21186
foreach victim %self.all%   
  wdamage %victim% 250   
  wechoaround %actor.name% с криками прибежал%actor.u% с кровью на лице, и упал%actor.u% на землю.
~
#21116
пробегаем ловушку2~
2 c 0
пробежать~
wsend %actor% Разогнавшись вы устремились на восток.
wteleport %actor% 21188
%actor.wait(5)%
if !%arg.contains(справа)%
  %actor.wait(5)%
  wecho  Как только вы вошли в комнату Вы увидели огромную тучу копий летящих в вашу сторону.
  wecho  Вы попытались увернуться...
  wecho  &RНо несколько копий воткнулись в Вас!&n
  foreach victim %self.all%   
    wdamage %victim% 250   
  done                     
  return 0
  halt
end
else
wsend %actor% Вам повезло. Вы спрятались за камень.
~
#21117
перезарядка камней~
2 z 100
~
calcuid lov 21186 room
detach 21112 %lov.id%
wait 3s
attach 21112 %lov.id%
~
#21118
перезарядка копий~
2 z 100
~
calcuid lov 21187 room
detach 21115 %lov.id%
wait 3s
attach 21115 %lov.id%
~
#21119
вошли к среднему~
0 r 100
~
if %actor.clan% == тз
  wait 3
  mecho Средний дозорный воин произнес : 'Добро пожаловать защитник наших земель'
else
  крич %actor.iname% подходит к нашему замку !!!
end
~
#21120
вошли к маленькому~
-1 h 0
~
if %actor.clan% == тз
  wait 3
  mecho Маленький дозорный воин произнес : 'Добро пожаловать защитник наших земель'
else
  крич %actor.iname% вошел в потайной лаз!!!
end
~
$~
