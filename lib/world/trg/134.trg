#13400
Разворачиваем богатырского коня~
1 c 2
гладить~
wait 1
if !%arg.contains(статуэтка)%
  osend  %actor% Что Вы хотите погладить?
  halt
end
osend %actor% Вы нежно погладили статуэтку.
if %actor.clan% != вз
  halt
end
if %world.curmobs(13400)% > 50
  osend %actor% ...и ничего не произошло!
  halt
end
oechoaround %actor% %actor.name% нежно погладил%actor.g% статуэтку.
wait 1s
oload mob 13400
oecho Послышлся стук копыт и перед Вами предстал Богатырский конь.
oforce %actor% оседлать конь
wait 1
opurge %self%  
~
#13401
Сворачиваем богатырского коня~
0 c 1
топнуть~
if  (%actor% != %self.leader%)
  msend %actor% Это не Ваш скакун.
  halt
end
if (%actor.clan% != вз) 
  mechoaround %actor% %actor.name% попытал%actor.u% топнуть, но нога так и застыла в воздухе.
  msend %actor% Вы попытались топнуть, но Ваша нога так и застыла в воздухе.
  halt
end
mechoaround %actor% %actor.name% громко топнул%actor.g%.
msend %actor% Вы громко топнули ногой оземь. 
mload obj 13401
дать стату .%actor.name%
wait 1s
mecho Богатырский конь испарился на Ваших глазах.
wait 1
mpurge %self%
~
#13402
спуск в повал~
2 c 1
спуститься~
if !%arg.contains(подвал)%
  wsend       %actor% Куда это Вы хотите спуститься???
  halt
end
wsend %actor% Вы спустились по лестнице в подвал.
wechoaround %actor% %actor.name% спустил%actor.u% в подвал.
wteleport %actor% 13446
wechoaround %actor% Кто-то спустилься в подвал.
~
#13403
удаление шмота~
1 gj 100
~
if (%actor.clan% == вз) 
  halt
end
osend %actor% %self.name% рассыпал%self.u% в ваших руках.
oechoaround %actor% %self.name% рассыпал%self.u% в руках %actor.rname%.
wait 1
opurge %self%
~
#13404
карабкаемся в замок~
2 c 1
подняться~
if !%arg.contains(замок)%
  wsend %actor%  Куда это Вы хотите подняться???
  halt
end
if !%actor.rentable%
  wsend %actor% _Вы попытались вскарабкаться наверх, но испачканные кровью руки скользят на камнях.
  halt
end
wsend %actor%  Вы поднялись по лестнице.
wechoaround %actor%  %actor.name% поднял%actor.u% по лестнице.
wait 1s
wsend %actor.name%   Вы очутились внутри замка Вышгородской Заставы!
wteleport %actor.name% 13445
wechoaround %actor%  Кто-то поднялся по лестнице в замок.
~
#13405
тригерный проход в замок через лаз1~
2 c 100
лезть~
if !%arg.contains(лаз)%
  wsend  %actor% Куда это Вы хотите пролезть?
  halt
end
wsend %actor%  Вы протиснулись в лаз.
wechoaround %actor%  %actor.name% протиснул%actor.u% в лаз.
wteleport %actor% 13465
wechoaround %actor%  Кто-то протиснул%actor.u% в лаз вслед за Вами.
~
#13406
тиргерный проход в замок через лаз2~
2 c 100
лезть~
if !%arg.contains(лаз)%
  wsend  %actor% Куда это Вы хотите пролезть?
  halt
end
wsend %actor%  Вы протиснулись в лаз.
wechoaround %actor%  %actor.name% протиснул%actor.u% в лаз.
wteleport %actor% 13467
wechoaround %actor%  Кто-то протиснул%actor.u% в лаз вслед за Вами.
~
#13407
лезть лаз из замка1~
2 c 100
лезть~
if !%arg.contains(лаз)%
  wsend  %actor% Куда это Вы хотите пролезть?
  halt
end
wsend %actor%  Вы протиснулись в лаз.
wechoaround %actor%  %actor.name% протиснул%actor.u% в лаз.
wteleport %actor% 13471
wechoaround %actor%  Кто-то протиснул%actor.u% в лаз вслед за Вами.
~
#13408
лезть в лаз из замка2~
2 c 100
лезть~
if !%arg.contains(лаз)%
  wsend  %actor% Куда это Вы хотите пролезть?
  halt
end
wsend %actor%  Вы протиснулись в лаз.
wechoaround %actor%  %actor.name% протиснул%actor.u% в лаз.
wteleport %actor% 13474
wechoaround %actor%  Кто-то протиснул%actor.u% в лаз.
~
#13409
проход в замок через лаз3~
2 c 100
лезть~
if !%arg.contains(лаз)%
  wsend  %actor% Куда это Вы хотите пролезть?
  halt
end
wsend %actor%  Вы протиснулись в лаз.
wechoaround %actor%  %actor.name% протиснул%actor.u% в лаз.
wteleport %actor% 13481
wechoaround %actor%  Кто-то протиснул%actor.u% в лаз.
~
#13410
лезть лаз из замка3~
2 c 100
лезть~
if !%arg.contains(лаз)%
  wsend  %actor% Куда это Вы хотите пролезть?
  halt
end
wsend %actor%  Вы протиснулись в лаз.
wechoaround %actor%  %actor.name% протиснул%actor.g% в лаз.
wteleport %actor% 13401
wechoaround %actor%  Кто-то протиснул%actor.u% в лаз вслед за Вами.
~
#13411
триг дружа~
0 q 100
~
if %actor.clan% == вз
  halt
end
крич &BНепрошеный гость &R%actor.name%&n &Bк нам на Заставу пожаловал.&n
~
#13412
выдача клан стафа~
0 d 100
экипировка~
wait 1
if %actor.vnum% != -1
  halt
elseif %actor.clan% == вз
  say Сейчас-сейчас...
  wait 1
  if %actor.bank% < 665
    дум
    say Э, да у тебя денег то совсем нету!
    halt
  end
  eval buffer %actor.bank(-665)%
  mload obj 13403
  mload obj 13404
  mload obj 13405
  mload obj 13406
  mload obj 13407
  mload obj 13408
  mload obj 13409
  mload obj 13409
  mload obj 13410
  mload obj 13410
  mload obj 13411
  mload obj 13412
  mload obj 13412
  mload obj 13413
  mload obj 13414
  mload obj 13415
  * mload obj 13425
  mload obj 139
  полож все баул
  say Вот твое добро.
  give all .%actor.name%
  drop all
  wait 1
  say Оружие сам%actor.g% себе в кузне купи - не маленк%actor.w% уже.
else 
  say Чужакам не положено ходить в оверном стафе!
  say И ваще ты че тут трешся? А ну канай отседова!
  msend %actor%  %self.name% сделал несколько непонятных жестов, и Вы потеряли ориентацию в пространстве.
  mteleport .%actor.name% 13403
  mecho %self.name% сделал несколько непонятных жестов, и %actor.name% изчез%actor.g% из виду.
end
~
#13413
Лезим в трещину~
2 c 1
лезть~
if !%arg.contains(трещин)%
  wsend  %actor% Куда это Вы хотите пролезть?
  halt
end
wsend %actor%  Вы с трудом пролезли в трещину.
wechoaround %actor%  %actor.name% с трудом пролез%actor.g% в терщину.
wteleport %actor% 13479
wechoaround %actor%  Кто-то пролез в трещину вслед за Вами.
~
#13414
выдача плана~
0 d 100
план~
wait 1
if %actor.vnum% != -1
  halt
end
if %actor.clan% != вз
  say Сейчас я дам тебе план...
  say Чужакам не положено курить чужой план!
  say И ваще ты че тут трешся? А ну канай отседова!
  msend %actor%  %self.name% сделал несколько непонятных жестов, и Вы потеряли ориентацию в пространстве.
  mteleport .%actor.name% 13403
  mecho %self.name% сделал несколько непонятных жестов, и %actor.name% изчез%actor.g% из виду.
  halt
end
wait 1
if %world.curobjs(13443)% > 100
  say Нету! Кончилось...
  рыда .%actor.name%
  всхлип
end
mload obj 13443
if %actor.bank% < 50
  дум
  say Э, да у тебя денег то совсем нету!
  halt
end
eval buffer %actor.bank(-50)%
say Ну куда же я его дел?
пож
wait 2s
say Ах вот же он...
give план .%actor.name%
drop план
~
#13415
Пошутить, исключительно пошутить...~
0 d 1
я Я~
wait 2
set text я очень большой дракон
if (%speech% == %text%) && (%actor.name% == Некрас)
  say С очень маленькими яйцами!
end
~
$~
