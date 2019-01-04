* BRusMUD trigger file v1.0
#66700
Приветствие охотника~
0 r0 100
~
if (%quest683.name% == %nil%)
wait 1
г Приветствую %actor.iname%.
г Редко я вижу таких гостей
г Я всегда рад увидеть новые лица
улыб
wait 1s
г В лесу обитает множество животных
г Принеси мне их шкуры и возможно я смогу что-нибуть из них изготовить
end


~
#66701
Смерть лисы~
0 f0 100
0~
if (%world.curobjs(66700)% < 8) && (%random.20% <= 7)
   mload obj 66700
end







~
#66702
Смерть кабана~
0 f0 100
~
if (%world.curobjs(66701)% < 10) && (%random.20% <= 6)
   mload obj 66701
end







~
#66703
Смерть рыси~
0 f0 100
~
if (%world.curobjs(66702)% < 3) && (%random.20% <= 7)
   mload obj 66702
end







~
#66704
Смерть старшего лиходея~
0 f0 100
~
 mload obj 66703
end







~
#66705
Приветствие и прозьба странника~
0 r0 100
~
if (%quest683.name% == %nil%)
wait 1
шляп %actor.iname%.
г Здравствуй %actor.iname%.
г Вижу пред собой опытного воина
wait 2s
взд
wait 1s
г Беда случилась со мной 
г Карту мою украли здешние лиходеи
г Если вернешь ее в целости и сохранности, то я тебя отблагодарю
умол %actor.iname%
end


~
#66706
Помощь и награда странника~
0 j0 100
~
switch %object.vnum%
case 66703
wait 10
mpurge  %object%
if %random.100% < 16 && %world.curobjs(232)% < 50 
mload obj 232
дать рун.бла .%actor.name%
elseif %random.100% < 31 && %world.curobjs(512)% < 3
mload obj 512
дать кни.кры .%actor.name%
else
   msend %actor% Странник дал Вам немного денег.
   %actor.gold(+1500)%
end
say Да благословит тебя святейший Ангел Михаил
mecho Странник, посмотрев на карту, продолжил свои путешествия, положив ее в карман
wait 1
mpurge %self%
end





~
#66707
Награда охотника~
0 j0 100
~
switch %object.vnum%
case 66700
wait 1s
say Отлично, попытаюсь что-нибуть изготовить
wait 2s
if %random.100% < 23 && %world.curobjs(66706)% < 10 
mload obj 66706
дать все.сап .%actor.name%
say Носи на здоровье
mpurge  %object%
break
case 66701
wait 1s
say Отлично, попытаюсь что-нибуть изготовить
wait 2s
if %random.100% < 20 && %world.curobjs(66705)% < 9 
mload obj 66705
дать все.шап .%actor.name%
say Носи на здоровье
mpurge  %object%
break
case 66702
wait 1s
say Отлично, попытаюсь что-нибуть изготовить
wait 2s
if %random.100% < 17 && %world.curobjs(66704)% < 8
say Носи на здоровье
mload obj 66704
дать все.курт .%actor.name%
mpurge  %object% 
break
done




~
$
$
