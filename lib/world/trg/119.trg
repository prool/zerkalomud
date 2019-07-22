#11900
(r11937) Пролезаем в кусты~
2 c 100
пролезть~
if %arg.contains(кусты)%
  %send% %actor% Пыхтя и отдуваясь, Вы пролезли сквозь кусты.
  %teleport% %actor% 11938 horse
else
  %send% %actor% Куда Вы хотите пролезть?
end
~
#11901
(r11953) Вошли к детине~
2 g 100
~
wait 5
%echo% Из леса раздался страшный треск...
%echo% Вы не поверили глазам, когда из чащи вылетело... дерево, вырванное с корнем.
%echo% Пролетев несколько саженей, оно с треском повалилось поперек дороги.
%door% 11953 east purge
%load% obj 11902
detach 11901 %self%
~
#11902
(o11902) Пытаемся взять дерево~
1 g 100
~
if %actor.vnum% == -1
  %send% %actor% Куда уж Вам деревья то таскать?
  return 0
  halt
end
otransform 11901
return 1
%door% 11953 east room 11954
detach 11902 %self%
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
#11911
(r11900) Начало квеста~
2 z 100
~
wait 3
eval dam %actor.hitp%+2
%damage% %actor% %dam%
~
#11999
(r11901) РЕПОП~
2 f 100
~
%echo% RESETTING
attach 11901 %world.room(11953)%
%door% 11953 east room 11954
~
$~
