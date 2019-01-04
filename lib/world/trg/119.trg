#11900
Награда~
0 j 100
~
wait 1
if %object.vnum% == 11907
wait 1s
mjunk all
mecho Лианор поднял руки вверх, прошептал пару слов, комнату осветил яркий блик.
switch %random.10%
 case 1
 if (%world.gameobs(11901)% < 2)
 mecho Лианор создал что-то стоящее!
 mload obj 11901 
дать рун.наручни %actor.name%
 end
 break
case 2
 if (%world.gameobs(11902)% < 2)
 mecho Лианор создал что-то стоящее!
mload obj 11902
дать рун.меч %actor.name%
end
break
case 3
 if (%world.gameobs(11903)% < 2)
 mecho Лианор создал что-то стоящее!
 mload obj 11903 
дать рун.доспех %actor.name%
 end
 break
case 4
 if (%world.gameobs(11904)% < 2)
 mecho Лианор создал что-то стоящее!
 mload obj 11904 
дать рун.топор %actor.name%
 end
break
case 5
 if (%world.gameobs(11905)% < 2)
 mecho Лианор создал что-то стоящее!
 mload obj 11905 
дать рун.браслет %actor.name%
 end
 break
default
 mecho Лианор попробывал сосредоточится, но ничего не вышло.
done
elseif %object.vnum% == 11908
wait 1
mjunk all
  say Опа!!! Ну нифига себе!
  say Ты хоть знаешь че ты мне щас принес? Хотя куда тебе... 
  say Короче ща попробую че нить сворганить. А ты не мешай.   
  wait  1s
if %random.3% == 1 && %world.curobjs(11906)% < 3
  mecho Лианор тихо закрыл глаза и, прошептав несколько невнятных, слов создал Амулет!
  mload obj 11906
  дать все %actor.name%
  break
else 
 mecho Лианор тихо закрыл глаза и, прошептав несколько невнятных слов, создал что-то, и положил себе в карман. 
  wait 1s
  say Это мне самому пригодится, а тебя я награжу по другому.
 *поставишь что нужно
  if %actor.class% == 3 && !%actor.skill(ярость)%
  mskillturn %actor.name% ярость set
  else  
  %self.gold(500)%
  дать 500 кун %actor.name%
  end
end  
detach 11900 %self.id%
end
~
#11901
Приветствие~
0 q 100
~
wait 1
say Еще один смертник!
say И ты туда же?
say Дохляк ты посмотри на себя... 
say Оттуда и настоящие богатыри не возвращались...    
if %actor.class% == 3
wait 2s                                               
хмур %actor% 
say Ты еще тут? Ты либо тупой, либо смелый...Скоро узнаем.
say Ладно слушай... на юге обосновался отряд варваров. 
say И я знаю, что у них есть несколько  редких камней, нужных мне для опытов.
say Коль справишься приходи я в долгу не останусь...
say Коль не справишься вспомнишь перед смертью мои слова.
say Ну так что, богатырь, осилишь этих бездарей? 
attach 11902 %self.id%
else
say А ну марш домой и чтоб я тебя тут больше не видел.
wait 3s
end
~
#11902
сама дача квеста~
0 d 1
да помогу~
if %actor.class% != 3
   say Нету в тебе жилки богатырской, только зря голову сложишь.
   halt
end
wait 1
say Топай на юг тут не потеряшься.
say А я пока поставлю свечку за здравие твое.
say И одну приготовлю за упокой... 
mteleport %actor% 11909
attach 11900 %self.id%
detach 11901 %self.id%
detach 11902 %self.id%
~
#11903
разбить~
2 c 1
разбить проломить разрушить~
if !%arg.contains(стена)% 
   return 0
   halt
end
wait 1
wdoor 11953 north room 11960
wsend %actor.name% Мощным ударом вы пробили в стене широкий проход.
wechoaround %actor% %actor.name% мощным ударом разби%actor.q% стену, открыв широкий проход.
detach 11903 %self.id%
~
#11905
репоп прохода~
2 f 100
~
wdoor 11953 s purge
attach 11903 %self.id%
~
#11906
репоп тригера прохода~
2 f 100
~
attach 11903 %self.id%
~
#11907
репоп квеста~
0 n 100
~
attach 11901 %self.id%
attach 11902 %self.id%
~
#11908
глава варваров убит~
0 f 100
~
mload obj 11908
~
#11909
Шамана убили~
0 f 100
~
mload obj 11907
~
$~
