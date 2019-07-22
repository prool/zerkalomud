* Сгенерировано BZEditor
* Количество триггеров : 31
* Сохранено 08.08.2015 13:12:46
#56900
зашли к охотнику за сокровищами~
0 r 100
~
привет
wait 1s
г Как же вовремя ты появил%actor.u%!
г Может быть, у тебя найдется время выслушать мое предложение?
attach 56901 %self.id%

~
#56901
берем квест 1~
0 d 1
найдется~
wait 1s
улыб
wait 1s
г Я, эм.. историк, и недавно наткнулся на записи о древней империи, чья столица была разрушена извержением вулкана. Конечно, у меня возник научный интерес и я решил его найти.
г Город этот сейчас находится под нами, а с помощью найденных карт, я определил где находилось самое высокое здание.
г Я уже собирался под землю, но у меня кончились деньги, и копатели, которых я нанял, отказались работать дальше.
г Так вот, я хочу, чтобы ты спустил%actor.u% туда, наш%actor.y% дворец правителя и доставил%actor.g% мне его кольцо. Оно нужно мне для, м.. исторической выставки.
г Мне нужен только этот артефакт, остальное можешь взять себе. Все равно никому оно уже не понадобится.
wait 1s
г Ну, что молчишь? Кивни, если договорились.

attach 56902 %self.id%
detach 56900 %self.id%
detach 56901 %self.id%
~
#56902
берем квест 2~
0 c 0
кивнуть~
%send% %actor% Вы утвердительно кивнули.
%echoaround% %actor% %actor.name% согласно кивнул%actor.g%.
wait 1s

г Отлично! Тогда слушай.
г Тамошние жрецы пытались спасти знатных горожан, живших возле дворца, от извержения и создавали магические барьеры.
г Поэтому дорогу до дворца найти будет проще. Когда попадешь во дворец и найдешь кольцо, тебе нужно будет как-то вернуться.
г Я дам тебе порошок перемещения. Чтобы вернуться, брось его на пол и назови местность, куда тебе надо попасть, а попасть тебе надо ко мне.
г Только выбери место, напитанное магической энергией, иначе может не сработать.
wait 1s

mload obj 56920
дать все .%actor.name% 

wait 1s

г Удачи тебе с поисками!

attach 56920 %self.id%
detach 56902 %self.id%
~
#56903
репоп~
2 f 100
~
*Ресетим триггера на квестере
*eval tmpid %world.mob(56900)%
*attach 56900 %tmpid%
*detach 56901 %tmpid%
*detach 56902 %tmpid%

*Удаляем проходы "рыть дальше 1" и ресетим триг
%door% 56901 east purge
%door% 56902 west purge
attach 56904 %world.room(56901)%
 
*Удаляем проходы "треснуть стена" и ресетим триг
%door% 56923 west purge
%door% 56924 east purge
attach 56905 %world.room(56923)%

*Удаляем проходы "рыть дальше 2" и ресетим триг
%door% 56949 east purge
%door% 56950 west purge
attach 56907 %world.room(56949)%

*Удаляем проходы "рыть дальше 3" и ресетим триг
%door% 56950 east purge
%door% 56951 west purge
attach 56908 %world.room(56950)%

*Удаляем проходы "смачно долбануть" и ресетим триг
%door% 56971 north purge
%door% 56972 south purge
attach 56909 %world.room(56971)%

*Удаляем проходы "разгрести завал" и ресетим триг
%door% 56912 north purge
%door% 56913 south purge
attach 56910 %world.room(56912)%

*Удаляем груду камней от колонны и ресетим триг
%purge% %world.obj(56923)%
attach 56918 %world.room(56910)%

*триги пенты
detach 56919 %world.room(56995)%
attach 56917 %world.room(56995)%


~
#56904
рыть дальше 1~
2 c 100
рыть~
if !%arg.contains(дальше)%
	%send% %actor.name% Могилу рыть собрались?
else
	%send% %actor.name% Вы стали копать.
	%echoaround% %actor% %actor.name% начал%actor.g% копать.
	wait 2s

	%door% 56901 east room 56902
	%door% 56902 west room 56901

	%send% %actor.name% Вы раскопали проход в пепле, и теперь можно двигаться дальше.
    %echoaround% %actor% %actor.name% завершил%actor.g% проход, по которому можно идти дальше.
	%load% obj 56915

	detach 56904 %self.id%
end
~
#56905
треснуть стена~
2 c 100
треснуть~
if !%arg.contains(стена)%
	%send% %actor.name% Что вы хотите треснуть?
else
	%send% %actor.name% Вы с силой треснули по стене, и она с грохотом обрушилась.
	
	%door% 56923 west room 56924
	%door% 56924 east room 56923

	detach 56905 %self.id%
end
~
#56906
ключ с инфернала~
0 f 100
~
if ((%random.100% <= 70) && (%world.curobjs(56929)% < %world.maxobj(56929)%)) 
	%load% obj 56929
end

if ((%random.100% <= 23) && (%world.curobjs(56903)% < %world.maxobj(56903)%)) 
	%load% obj 56903
end
~
#56907
рыть дальше 2~
2 c 100
рыть~
if !%arg.contains(дальше)%
	%send% %actor.name% Что или Куда роем-то?
else
	%send% %actor.name% Вы начали копать проход...
	%echoaround% %actor% %actor.name% начал%actor.g% копать.
	wait 2s

	%door% 56949 east room 56950
	%door% 56950 west room 56949

	%send% %actor.name% Вы раскопали проход в пепле, и теперь можно ползти дальше...
	%echoaround% %actor% %actor.name% завершил%actor.g% проход, по которому можно идти дальше.
	%load% obj 56915

	detach 56907 %self.id%
end
~
#56908
рыть дальше 3~
2 c 100
рыть~
if !%arg.contains(дальше)%
	%send% %actor.name% Что или Куда роем-то?
else
	%send% %actor.name% Вы начали копать проход...
	%echoaround% %actor% %actor.name% начал%actor.g% копать.
	wait 2s

	%door% 56950 east room 56951
	%door% 56951 west room 56950

	%send% %actor.name% Вы раскопали проход в пепле, и теперь можно ползти дальше...
	%echoaround% %actor% %actor.name% завершил%actor.g% проход, по которому можно идти дальше.
	%load% obj 56915

	detach 56908 %self.id%	
end
~
#56909
смачно долбануть~
2 c 100
смачно~
if %arg.contains(долбануть)%
	%send% %actor.name% Вы смачно долбанули по стене.
	
	wait 1s
	
	%echo% Земля задрожала под вашими ногами. Стена осыпалась, подняв клубы пыли.
	
	%door% 56971 north room 56972
	%door% 56972 south room 56971
	
	detach 56909 %self.id%
end
~
#56910
разгрести завал~
2 c 100
разгрести~
if !%arg.contains(завал)%
	%send% %actor.name% Что вы хотите разгрести?
else
	%send% %actor.name% Вы разгребли завал, освободив проход к лестнице.

	%door% 56912 north room 56913
	%door% 56913 south room 56912

	detach 56910 %self.id%	
end
~
#56911
зашли к императору - загрузка вулкана~
0 r 100
~
г Живые... Люди...
wait 1s
г Что? Ты приш%actor.y%, чтобы забрать мой перстень? Но ты опоздал%actor.g%.
г Злой дух горы поработил всех нас, оставшихся в живых после извержения. Он же и забрал главный символ моей власти - перстень императора. 
г Я уже тысячу раз сбивался со счета времени, которое сижу здесь ни живой ни мертвый.
wait 1s
*загрузка Вулкаана
mat 56979 mload mob 56908
*загрузка лавы в комнатах рядом с Вулкааном
exec 56915 %world.room(56979)%
exec 56916 %world.room(56980)%
wait 1s
г Он уже знает, что ты здесь. Скоро ты присоединишься к нам.
detach 56911 %self.id%
~
#56912
Вулкан загрузка - кричит~
0 n 100
~
крич Даже смерть не спасет вас от меня!

exec 56926 %world.room(56978)%
~
#56913
смерть Вулкана~
0 f 100
~
%load% obj 56906

if ((%random.100% <= 50) && (%world.curobjs(56924)% < %world.maxobj(56924)%)) 
	%load% obj 56924
end

attach 56914 %world.mob(56906)%
~
#56914
зашли к императору после смерти вулкана~
0 r 100
~
г Вул Каан мертв... Теперь нам недолго осталось мучаться.
г Я уже разучился радоваться, но в знак моей благодарности прими ключ от моего сундука.
%load% obj 56919
дать все %actor.name%
г Может быть, ты найдешь там что-нибудь полезное для себя.
exec 56917 %world.obj(56922)%
detach 56914 %self.id%
~
#56915
загрузка лавы 1~
2 z 100
~
%load% obj 56909
~
#56916
загрузка лавы 2~
2 z 100
~
%load% obj 56910
%load% obj 56911
~
#56917
пента назад~
2 h 100
~
if (%object.vnum% != 56920)
	halt
end

wait 1

%purge% %object%

%echo% Порошок вспыхнул ярким пламенем.

attach 56919 %self.id%
detach 56917 %self.id%
~
#56918
ломаем колонну~
2 c 100
сломать~
if (%arg.contains(колонну)%)
	%send% %actor.name% Какую именно колонну вы хотите сломать?
elseif (%arg.contains(крепкую)%)
	%echo% Крепкая колонна развалилась на куски, и потолок рухнул вам на голову.
	%purge% %world.obj(56917)%
	%load% obj 56923
	eval gopa %actor.pc% 
	foreach i %gopa% 
 		%damage% %i% 1200
	done
	detach 56918 %self.id%
elseif (%arg.contains(треснувшую)%)
	%echo% Треснувшая колонна развалилась на куски.
	%purge% %world.obj(56918)%
	%load% obj 56923
	if (%world.curobjs(56923)% < %world.maxobj(56923)% && %random.100% <= 55)
		%echo% При обвале от скалы откололся кусок твердого пепла.
		%load% obj 56912
	end
	eval gopa %actor.pc% 
	foreach i %gopa% 
 		%damage% %i% 500
	done
	detach 56918 %self.id%
else
	%send% %actor.name% Что вы хотите сломать?
end
~
#56919
пента назад 2~
2 d 100
раскопки~
%portal% 56900 2
~
#56920
квест айтем квестеру~
0 j 100
~
if %object.vnum% != 56906
  msend %actor% %self.dname% нужен другой предмет.
  return 0
  halt
end
wait 1
mpurge %object%

г Это он! Сейчас проверим...
г Aliquid igni tractare! 

wait 1

%echo% Перстень в руках историка загорелся, вспыхнул и поджарил его до хрустящей корочки.
%load% mob 56909

mpurge %self%
~
#56921
огненный дух агрит~
0 n 100
~
wait 1s
г Тебе не уйти от гнева огненного духа!
mkill .%random.pc%
~
#56922
лоад стафа с 56901~
0 f 100
~
if ((%random.100% <= 9) && (%world.curobjs(56900)% < %world.maxobj(56900)%)) 
	%load% obj 56900
end
~
#56923
лоад стафа с 56902~
0 f 100
~
if ((%random.100% <= 10) && (%world.curobjs(56900)% < %world.maxobj(56900)%)) 
	%load% obj 56900
end

if ((%random.100% <= 10) && (%world.curobjs(56901)% < %world.maxobj(56901)%)) 
	%load% obj 56901
end
~
#56924
лоад стафа с 56903~
0 f 100
~
if ((%random.100% <= 8) && (%world.curobjs(56900)% < %world.maxobj(56900)%)) 
	%load% obj 56900
end

if ((%random.100% <= 8) && (%world.curobjs(56901)% < %world.maxobj(56901)%)) 
	%load% obj 56901
end

if ((%random.100% <= 8) && (%world.curobjs(56914)% < %world.maxobj(56914)%)) 
	%load% obj 56914
end
~
#56925
лоад стафа с 56904~
0 f 100
~
if ((%random.100% <= 12) && (%world.curobjs(56902)% < %world.maxobj(56902)%)) 
	%load% obj 56902
end

if ((%random.100% <= 12) && (%world.curobjs(56914)% < %world.maxobj(56914)%)) 
	%load% obj 56914
end
~
#56926
лоад браслета над пропастью~
2 z 100
~
if ((%random.100% <= 40) && (%world.curobjs(56925)% < %world.maxobj(56925)%)) 
	%load% obj 56925
end
~
#56927
панталоны с предателя~
0 f 100
~
if ((%random.100% <= 33) && (%world.curobjs(56926)% < %world.maxobj(56926)%)) 
	%load% obj 56926
end
~
#56928
перстень с раба кольца~
0 f 100
~
if ((%random.100% <= 33) && (%world.curobjs(56921)% < %world.maxobj(56921)%)) 
	%load% obj 56921
end
~
#56929
лоад сердец~
0 f 100
~
if ((%random.100% <= 23) && (%world.curobjs(56903)% < %world.maxobj(56903)%)) 
	%load% obj 56903
end
~
#56930
лоад пояса~
0 f 100
~
if ((%random.100% <= 20) && (%world.curobjs(56930)% < %world.maxobj(56930)%)) 
	%load% obj 56930
end
~
$
$
