#67200
вошли к старку-годовику~
0 q 100
~
tell %actor.name% _ Здравствуй, %actor.name%!
tell %actor.name% _ Не в добрый час встретил тебя я, ох не в добрый!
tell %actor.name%   Сынок мой, Матюша-богатырь,  пропал как три дня назад.
tell %actor.name% _ Ушел он со Змеем Змеюковичем воевать, да так и не вернулся.
tell %actor.name% _ Сердцем отцовским чую, беда с ним случилась, злые чары на нем.
tell %actor.name% _ Ты уж помоги ему, чары злые сними с него, а я уж отблагодарю тебя.
вопрос %actor.name%
attach 67218 %self.id%
~
#67201
в бою с Змеем~
0 k 33
~
switch %random.20%
case 1
         msend %actor% _Змей Змеюкович свом ударом вбил Вас по щиколотку в землю!
         mechoaround %actor% _Змей Змеюкович одним ударом вогнал %actor.dname% землю по щиколотку!
         mdamage %actor% 50
break
case 2
         msend %actor% _Змей Змеюкович свом ударом вбил Вас по колено в землю!
        mechoaround %actor% _Змей Змеюкович одним ударом вогнал %actor.dname% землю по колено!
         mdamage %actor% 100
break
case 3
         msend %actor% _Змей Змеюкович свом ударом вбил Вас по пояс в землю!
         mechoaround %actor% _Змей Змеюкович одним ударом вогнал %actor.dname% землю по пояс!
         mdamage %actor% 150
break
case 4
       msend %actor% Змей Змеюкович свом ударом вбил Вас по грудь в землю!
        mechoaround %actor% _ Змей Змеюкович одним ударом вогнал %actor.dname% землю по грудь!
        mdamage %actor% 200
break
     default
break
done
end
~
#67202
вошли к Змею~
0 q 100
~
tell %actor.name% _Фу, фу, русского духа слыхом не слыхано, видом не видано, 
tell %actor.name% _а нынче русский дух сам пришел.
tell %actor.name% _Вот изжарю тебя огнем-пламенем да съем и на косточках покатаюсь.
ржа
wait 3s
tell %actor.name% _Что, убить меня пришел, горе-богатырь? Да я тебя на одну руку
tell %actor.name% _посажу, а второй прихлопну!
хих
~
#67203
лезть на дуб~
2 c 0
лезть~
if !(%arg.contains(дуб)%) 
   wsend       %actor% Куда Вы хотите лезть?
   halt
end
if %actor.sex%==1
   wechoaround %actor% %actor.name% ловко полез на дуб.
  else 
   wechoaround %actor% %actor.name% ловко полезла на дуб.
end
wsend       %actor% Вы ловко вскарабкались вверх по дубу.
wteleport %actor%  67217
wechoaround %actor% Кто-то забрался сюда.
~
#67204
помер Змей~
0 f 100
~
if %world.curobjs(1260)% < 1
if %random.100% < 3
mload obj 1260
end
end
if (%world.curobjs(67229)% <1) && (%random.33% == 1)
   mload obj 67229
end
if %world.curobjs(67203)% == 0
mload obj 67203
end
~
#67205
слезть с дуба~
2 c 0
прыгнуть~
if !(%arg.contains(вниз)%) 
   wsend       %actor% Куда Вы хотите прыгнуть?
   halt
end
if %actor.sex%==1
   wechoaround %actor% %actor.name% неуклюже спрыгнул с дуба.
else 
   wechoaround %actor% %actor.name% неуклюже спрыгнула с дуба.
end
wsend       %actor% Вы прыгнули с дуба на землю.
wteleport %actor%  67203
wechoaround %actor% Кто-то неуклюже спрыгнул с дуба.
~
#67206
ворошить гнездо~
2 c 0
ворошить~
if !(%arg.contains(гнездо)%) 
   wsend       %actor% Что вы хотите разворошить???
   halt
end
wsend       %actor% Вы начали варварски ворошить гнездо.
wechoaround %actor% %actor.name% со злобной гримассой на лице начал%actor.g% ворошить гнездо.
wait 1
wecho _Вдруг воздух наполнился шумом крыльев и яростным клекотом.
wait 2
wecho _Разъяренный орел поднебесный прилетел невесть откуда.
wload mob 67208
detach 67206 %self.id%
~
#67207
сдохла змеюка~
0 f 100
~
if %world.curobjs(67207)% == 0
mload obj 67207
end
~
#67208
сдохла львюка~
0 f 100
~
if %world.curobjs(67216)% == 0
mload obj 67216
end
~
#67209
сдохла горушка~
0 f 100
~
if %world.curobjs(67217)% == 0
mload obj 67217
end
~
#67210
даем орлу шмот1~
0 j 100
~
wait 2s
if %object.vnum% == 67207
mjunk all
if (%world.curobjs(67221)% <5) & (%random.4% == 1)
wait 2s
mload obj 67221
дат меч %actor.name%
else
say Эх, не везет... Трудное это дело - чудеса творить. 
end
end
wait 2s
if %object.vnum% ==67216 
mjunk all
if (%world.curobjs(67224)% < 5) & (%random.3% == 1)
wait 2s
mload obj 67224
дат перевязь %actor.name%
else
say Эх, не везет... Трудное это дело - чудеса творить. 
end
end
wait 2s
if %object.vnum% ==67217 
mjunk all
if (%world.curobjs(67218)% < 5) & (%random.3% == 1)
wait 2s
mload obj 67218
дат амулет %actor.name%
else
say Эх, не везет... Трудное это дело - чудеса творить. 
end
end
~
#67211
даем шмот2 орлу~
0 j 0
~
  wait 2s
if %object.vnum% ==67216 
wait 1
mjunk all
if (%world.curobjs(67221)% < 5) && (%random.3% == 1)
  wait 2s
  mload obj 67221
 дат меч %actor.name%
end
end
~
#67212
базар орла~
0 n 100
~
mecho Орел умоляюще взглянул на Вас.
say  Не тронь гнезда!
say Оставь его в покое, а я тебе кое-чем помогу.
wiat 1s
say Есть у меня волшебное перо, им я могу чудеса творить.
ул 
~
#67213
даем шмот3 орлу~
0 j 0
~
  wait 2s
if %object.vnum% ==67217 
wait 1
mjunk all
if (%world.curobjs(67224)% < 5) && (%random.3% == 1)
  wait 2s
  mload obj 67224
 дат перевязь %actor.name%
end
end
~
#67214
красная сдохла~
0 f 100
~
if (%world.curobjs(67228)% <1) && (%random.3% == 1)
   mload obj 67228
end
~
#67215
черная сдохла~
0 f 100
~
if (%world.curobjs(67227)% <1) && (%random.3% == 1)
   mload obj 67227
end
~
#67216
коснуться земли~
2 c 0
коснуться тронуть поцеловать~
if !(%arg.contains(земля)%) 
   wsend       %actor% К чему Вы хотите притронуться здесь???
   return 0
   halt
end
wsend       %actor% Поклонившись, Вы коснулись рукой Земли Русской Матушки.
wechoaround %actor% %actor.name% черпнул%actor.g% силы из Земли Русской.
DG_CAST 'исцеление' %actor.name%
DG_CAST 'восстановление' %actor.name%
DG_CAST 'сила' %actor.name%
if %actor.sex%==1
   wsend  %actor% Матушка Земля Русская передала Вам, ее верному сыну, часть своих сил.
else 
   wsend  %actor% Матушка Земля Русская передала Вам, ее прекрасной дочери, часть своих сил.
end
if (%random.100% < 66 )
detach 67216 %self.id%
end
~
#67217
репоп зоны~
2 f 100
~
calcuid starik 67201 mob
detach 67200 %starik.id%
detach 67218 %starik.id%
attach 67200 %starik.id%
calcuid kowch1 67232 room
detach 67219 %kowch1.id%
attach 67219 %kowch1.id%
calcuid dikowin 67205 mob
detach 67220 %dikowin.id%
calcuid ldroom 67216 room
detach 67226 %ldroom.id%
attach 67226 %ldroom.id%
calcuid ldroom 67219 room
detach 67226 %ldroom.id%
attach 67226 %ldroom.id%
calcuid ldroom 67221 room
detach 67226 %ldroom.id%
attach 67226 %ldroom.id%
calcuid ldroom 67223 room
detach 67227 %ldroom.id%
attach 67227 %ldroom.id%
calcuid ldroom 67224 room
detach 67227 %ldroom.id%
attach 67227 %ldroom.id%
calcuid ldroom 67225 room
detach 67227 %ldroom.id%
attach 67227 %ldroom.id%
calcuid ldroom 67234 room
detach 67225 %ldroom.id%
attach 67225 %ldroom.id%
calcuid ldroom 67238 room
detach 67225 %ldroom.id%
attach 67225 %ldroom.id%
calcuid ldroom 67239 room
detach 67225 %ldroom.id%
attach 67225 %ldroom.id%
calcuid ldroom 67250 room
detach 67225 %ldroom.id%
attach 67225 %ldroom.id%
calcuid eagleroom 67217 room
detach 67206 %eagleroom.id%
attach 67206 %eagleroom.id%
~
#67218
гриш да~
0 d 0
да помогу~
wait 1s
tell %actor.name% _ Ну добре. Сидит Змей тот поганый со своею ратью где-то на Горынь-реке.
detach 67200 %self.id%
detach 67218 %self.id%
~
#67219
наполняем ковш~
2 c 0
налить набрать заполнить~
if !(%arg.contains(ковш)%) 
   wsend       %actor% Что вы хотите заполнить водой???
   return 0
   halt
end
wait 1s
  wsend       %actor% Вы взяли ковш и до краев наполнили его студеной водицей.
  wechoaround %actor% Склонившись, %actor.name% наполнил%actor.g% ковш студеной водицей.
calcuid kovsh 67212 obj
wait 1
wpurge %kovsh%
   wload obj 67201
calcuid dikowin 67205 mob
attach 67220 %dikowin.id%
calcuid kowch1 67232 room
detach 67219 %kowch1.id%
~
#67220
напоить зверя диков~
0 c 0
напоить поить~
if !(%arg.contains(зверь)%) 
   msend       %actor% Кого Вы хотите напоить???
   return 0
   halt
end
wait 1s
msend       %actor% Вы взяли ковш и поднесли его к зверю диковинному.
mechoaround %actor% Взяв ковш, %actor.name% поднес%actor.q% его к зверю диковинному.
mecho Зверь диковинный расплакался от радости!
wait 1
mecho С жадностью он начал лакать водицу из ковша.
wait 1
mecho Напившись вдоволь, зверь свернулся калачиком и заснул.
if %actor.level% > 22
 msend       %actor% _За доброе дело Вы получили 40000 очков опыта...
 %actor.exp(+40000)%  
end
calcuid kov 67201 obj
mpurge  %kov%
mload mob 67211
calcuid dikow 67205 mob
mpurge  %dikow%
~
#67221
бросаем кровь у богатыря~
1 h 100
~
wait 1s
calcuid krowi 67203 obj
if (%krowi.room%==67247)
oecho Кровь упала на землю и случайно несколько капель ее оросили окаменелого богатыря.
wait 1s
oecho Сначала ожили только глаза богатыря.
wait 1s
oecho Потом он смог двигать головой и удвиленно смотреть вокруг.
wait 1s
oecho Медленно ожило все тело славного богатыря!!!
oload mob 67212
calcuid statu 67206 obj
opurge  %statu%
wait 1
opurge  %self%
end
~
#67222
матюша парится~
0 b 50
~
switch %random.6%
case 1
mecho Матюша-богатырь повел плечами, разминаясь.
break
case 2
mecho Матюша-богатырь покрутил головушкою, разминясь.
break
say Ой застоялась сила молодецкая.
foreach target %self.pc%
ул %target.name%
done
wait 2
say Ой силу чую в себе небывалую!
foreach target %self.pc%
флирт %target.name%
done
break
case 4
mecho Матюша-богатырь взманул руками, разминаясь
break
default
break
done
end
~
#67223
гриш матюше хая~
0 d 0
привет здорово здравствуй поклон~
wait 1s
say Гой еси, коли не врешь как тот боров...
say Спасибо за избавление, вы славные витязи, и в вашу честь я...
дум
wait 1s
say ... ну... выпью пару ведер медовухи.
wait 1s
say А зараз я должен продолжать свой бой с врагами Земли Русской.
wait 1s
say Пойду на этот раз супротив Хазарских полчищ змеиных неведомых.
say Вы бы тоже время за зря не теряли, да в те страны южные далекие отправлялись бы.
say Одно токо прошу - передайте весточку мому тяте.
wait 1s
mload obj 67204
дать вест %actor.name%
mecho Матюша помахал булавой и быстро ушел на запад.
wait 1
%purge% %self%
~
#67224
даеш весть старику~
0 j 100
~
if %object.vnum% == 67204 then
  wait 2s
 mpurge  вест
  say Так это ты спас%actor.q% мово Матюшу...Вот радость то...
  wait 2s
 if %actor.level% > 26
if %actor.level% < 29
 msend       %actor% _За доброе дело Вы получили 400000 очков опыта...
 %actor.exp(+400000)%  
end
end 
say О горе горькое... Нет у меня наград никаких и почестей тоже нет.
say Но верю я! Что победив в бою ратном неравном с ворогами, получил ты нечто гораздо большее.
say Чем слава и почести - бесценный опыт жизни и боя.
ул
mecho Старичок осенил Вас крестом и вновь задумался о вечном.
end
~
#67225
лоад горушек ~
2 b 40
~
if ( %random.100% < 60 )
detach 67225 %self.id%
end
if (%world.curmobs(67204)% < 1)
   halt
end
if (%world.curmobs(67206)% < 6)
wecho Горушка толкучая вылезла из норы.
wload mob 67206
end
~
#67226
лоад змеюк~
2 b 100
~
if ( %random.100% < 60 )
detach 67226 %self.id%
end
if (%world.curmobs(67204)% < 1)
   halt
end
if (%world.curmobs(67200)% < 5)
 wecho Змеюка поклевучая вылезла из под камня.
wload mob 67200
end
~
#67227
лоад львюк~
2 b 80
~
if ( %random.100% < 60 )
detach 67227 %self.id%
end
if (%world.curmobs(67207)% < 1)
   halt
end
if (%world.curmobs(67203)% < 5)
wecho Львюка поедучая выскочила из темноты леса.
wload mob 67203
end
~
$~
