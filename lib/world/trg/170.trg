#17000
Приветствие охотника~
0 q 100
~
wait 2s
г Приветствую %actor.iname%.
г Редко я вижу таких гостей
г Я всегда рад увидеть новые лица
улыб
wait 1s
г В лесу обитает множество животных
г Принеси мне их шкуры и возможно я смогу что-нибуть из них изготовить.
~
#17001
Смерть лисы~
0 f 100
0~
if (%world.curobjs(17000)% < 8) && (%random.20% <= 7)
  mload obj 17000
end
~
#17002
Смерть кабана~
0 f 100
~
if (%world.curobjs(17001)% < 10) && (%random.20% <= 6)
  mload obj 17001
end
~
#17003
Смерть рыси~
0 f 100
~
if (%world.curobjs(17002)% < 3) && (%random.20% <= 7)
  mload obj 17002
end
~
#17004
Смерть старшего лиходея~
0 f 100
~
mload obj 17003
~
#17005
Приветствие и просьба странника~
0 q 100
~
wait 2s
шляп %actor.iname%.
г Здравствуй %actor.iname%.
г Вижу пред собой опытного воина
wait 2s
взд
wait 1s
г Беда случилась со мной 
г Карту мою украли здешние лиходеи
г Если вернешь ее в целости и сохранности, то я тебя отблагодарю
умол .%actor.iname%
~
#17006
Помощь и награда странника~
0 j 100
~
if %object.vnum% == 17003
  wait 1s
  mpurge  %object%
  eval chance %random.100%
  if %chance% < 16 && %world.curobjs(214)% < 50 
    mload obj 214
    дать рун.душ .%actor.name%
  elseif %chance% < 31 && %world.curobjs(512)% < 3
    mload obj 535
    дать книг .%actor.name%
  else
    msend %actor% Странник дал Вам немного денег.
    %actor.gold(+1000)%
  end
  say Да благословит тебя святейший Ангел Михаил!
  mecho Странник, помахав вам рукой на прощание, продолжил свое путешествие.
  wait 1s
  mpurge %self%
else
  say Не надо мне оно...
  drop %object%
end
~
#17007
Награда охотника~
0 j 100
~
switch %object.vnum%
  case 17000
    wait 1s
    say Отлично, попытаюсь что-нибуть изготовить
    wait 2s
    if %random.100% < 23 && %world.curobjs(17006)% < 10 
      mload obj 17006
      дать все.сап .%actor.name%
      say Носи на здоровье
      mpurge  %object%
    else
      say Ну... не судьба, однако
      взд
    end
  break
  case 17001
    wait 1s
    say Отлично, попытаюсь что-нибуть изготовить
    wait 2s
    if %random.100% < 20 && %world.curobjs(17005)% < 9 
      mload obj 17005
      дать все.шап .%actor.name%
      say Носи на здоровье
      mpurge  %object%
    else
      say Ну... не судьба, однако
      взд
    end
  break
  case 17002
    wait 1s
    say Отлично, попытаюсь что-нибуть изготовить
    wait 2s
    if %random.100% < 17 && %world.curobjs(17004)% < 8
      say Носи на здоровье
      mload obj 17004
      дать все.курт .%actor.name%
      mpurge  %object% 
    else
      say Ну... не судьба, однако
      взд
    end
  break
  default
    say Спасибо, авось пригодится в хозяйстве.
  break
done
~
$~
