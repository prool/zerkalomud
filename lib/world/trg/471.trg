* Сгенерировано BZEditor
* Количество триггеров : 14
* Сохранено 10.09.2009 13:42:11
#47100
умирающий~
0 d 1
здравствуй~
wait 1
set questor471 %actor%
global questor471
calcuid grove 47171 room
remote questor471 %grove.id%
calcuid master 47176 room
remote questor471 %master.id%
say Как видишь изранен я, умру скоро
mecho _- Ведь ты хочешь пройти по этой дороге, не так ли?
mecho _- Так вот, на этой дороге нежить лютует.
mecho _- И главный у всей этой пакости, волхв темный, силы злой великой!!
wait 2s
mecho _- Поклонись могиле моих братьев...
mecho Витязь захрипел и замолчал.
calcuid selfroom 47107 room
run 47112 %selfroom.id%
~
#47101
привет~
0 q 100
~
wait 3
mecho При виде вас раненый витязь с трудом приподнялся.
wait 1s
if %actor.sex% == 1
  say Здравствуй, парень.
else
  say Здравствуй, красна девица.
end
кашель
~
#47102
гости~
0 r 100
~
wait 1
say Я думаю вы пришли по мою душу...
say Поэтому умрите!!
wait 3
закол %actor.name%
mkill %actor%
~
#47103
могилка~
2 c 1
поклониться могила~
wait 1
if !%arg.contains(могил)%
  wsend %actor% Вы раскланялись на все четыре стороны света.
end
if %questor471.id% != %actor.id% 
  wsend %actor% Вы поклонились могиле, почтив память павшего
  wechoaround %actor%   %actor.name% поклонил%actor.u% могиле, почтя память павшего.
  wecho ...но более ничего интересного не случилось.
  halt
end
wecho Над могилкой неожиданно возник дух изрубленного воина.
wecho Дух павшего сказал: 'Да пребудет с тобой удача и падет нежить!'
wecho _- Когда будешь биться с их предводителем я помогу тебе.
wecho _- Только топни ногой.
wecho _- Дух исчез.
detach 47103 %self.id%
~
#47104
хоп~
2 c 1
топнуть топать~
if %questor471% != %actor.id% 
  return 0
  halt
end
wait 1
wsend %actor% Вы резко топнули ногой.
wechoaround %actor%   %actor.name% резко топнул%actor.g% ногой.
wecho В воздухе появился дух Воина и произнес:
wecho Да пребудет с тобой сила!
%actor.hitp(+500)%
detach 47104 %self.id%
~
#47105
убили ворона~
0 f 100
~
mload mob 47107
mforce  адепт уб %actor.name%
return 0
~
#47106
появление адепта~
0 n 100
~
mload obj 47107
од все
mecho Над трупом ворона занялось кровавое марево...
mecho Через секунду перед вами уже стояла фигура в темном балахоне.
mecho Адепт тьмы недовольно зыркнул на Вас и заорал:
mecho - Кто помешал моему перевоплощению ?!
~
#47107
Убили предводителя~
0 f 100
~
if (%world.curobjs(47114)% < 3) && (%random.10% <= 2)
  mload obj 47114
end
if (%world.curobjs(47108)% < 5) && (%random.10% <= 1)
  mload obj 47108
end
~
#47108
Убили скелет~
0 f 100
~
if (%world.curobjs(47110)% < 6) && (%random.15% <= 2)
  mload obj 47110
end
if (%world.curobjs(47112)% < 6) && (%random.15% <= 2)
  mload obj 47112
end
~
#47109
Убили его~
0 f 100
~
if (%world.curobjs(47111)% < 6) && (%random.15% <= 2)
  mload obj 47111
end
~
#47110
Убили волхва~
0 f 100
~
if (%world.curobjs(47103)% < 6) && (%random.15% <= 2)
  mload obj 47103
end
~
#47111
Убили воина~
0 f 100
~
if (%world.curobjs(47109)% < 6) && (%random.15% <= 2)
  mload obj 47109
end
~
#47112
Убиваем витязя~
2 z 100
~
calcuid target 47105 mob
wdamage %target% 1000
~
#47113
репоп зоны 471~
2 f 100
~
calcuid grove 47171 room
attach 47103 %grove.id%
calcuid master 47176 room
attach 47104 %master.id%
~
$
$
