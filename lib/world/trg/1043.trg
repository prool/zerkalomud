* BRusMUD trigger file v1.0
#104300
Приветствие Странника~
0 r0 100
~
if (%quest1043.name% == %nil%)
wait 2s
mecho Печальный странник поднял на Вас полные слез глаза.
г Кто Ты? Что делаешь в этих краях? Я знаю! Ты один из них!
вопрос %actor.iname%
attach 104301 %self.id%
end




~
#104301
Ответили страннику~
0 d0z0 100
нет~
г Действительно? Тогда выслушай меня, может Ты сможешь мне помочь.
г Моя лошадь пала в степи, пища и вода закончились - и как назло по пути не 
г попадалось ни одного источника. Я обессилел, и как раз тогда меня нашли 
г разведчики из лагеря. Я знатного рода, но хан даже слушать меня не стал, а 
г просто отобрал у меня все ценное и выпнул из лагеря. На золото мне наплевать - 
г Главное мой фамильный кинжал! Если ты вернешь его мне я уж в долгу не 
останусь...
wait 2s
г Ну как возьмешься мне помогать?
вопрос %actor.iname%
wait 1s
attach 104305 %self.id%
detach 104300 %self.id%
detach 104301 %self.id%
end


~
#104302
Отдали страннику кинжал~
0 j0 100
~
wait 1
if %object.vnum% != 104300
  брос все
  halt
END
mpurge %object%
switch %random.20%
  case 1
    г Вот тебе как я и обещал, награда от меня
    mecho  Печальный странник достал что-то из кармана.
    mload obj 104317
    дать все %actor.name%
    г Пошел я путешевствовать дальше.
    mecho Печальный странник ушел на запад.
    wait 1
    mpurge %self%
  break
  case 2
    г Вот тебе как я и обещал, награда от меня
    mecho  Печальный странник достал что-то из кармана.  
    mload obj 104318
    дать все %actor.name%
  г Пошел я путешевствовать дальше.
  mecho Печальный странник ушел на запад.
    wait 1
    mpurge %self%
  break
  case 3
    г Вот тебе как я и обещал, награда от меня
  mecho  Печальный странник достал что-то из кармана.
    mload obj 104319
    дать все %actor.name%
  г Пошел я путешевствовать дальше.
  mecho Печальный странник ушел на запад.
    wait 1
    mpurge %self%
 break
  default
    г Вот тебе как я и обещал, награда от меня
    %self.gold(600)%
    дать 600 кун %actor.name%
   г Пошел я путешевствовать дальше.
  mecho Печальный странник ушел на запад.
    wait 1
    mpurge %self%
  done
  


~
#104303
Хан в бою~
0 k0 50
~
switch %random.15%
case 1
     msend %actor% Огненный шар, пущенный в Вас попал Вам прямо в лицо!
     mechoaround %actor% Огненный шар, пушенный Ханом попал %actor.dname% прямо в лицо!
     mdamage %actor% 30
break
case 2
        
         msend %actor% Мощный порыв ветра исходящий от Хана повалил Вас на землю!
         mechoaround %actor% Мощный порыв ветра исходящий от Хама сбил %actor.dname% 
         %actor.position(6)%
         %actor.wait(2)%
         mdamage %actor% 20
end
break
 default 
end



~
#104304
лошади ржут ~
2 b0e0 100
~
 wecho Вы услышали лошадиное ржание.




~
#104305
Соглашаеся помочь~
0 d0z0 100
да~
set quest1043 %actor.name%
global quest1043
г Тогда иди принеси мне мой кинжал!
wait 1s
detach 104305 %self.id%
end



~
#104306
бой старшего дозора~
0 k0 60
~
  msend %actor% Одним ударом Старший дозора повалил Вас на землю 
  msend %actor% У вас в голове помутилось...
  mechoaround %actor% Одним ударом Старшего дозора сбил %actor.vname% на землю! 
  mdamage %actor% 40
  %target.position(6)%
  %target.wait(3)%
  if %random.3% == 2
  cast !вред! %actor.name%
 end



~
#104307
Бой кузнеца~
0 k0 60
~
  msend %actor% &RСМЕРТЕЛЬНО&n удаил вас! 
  msend %actor% &RСМЕРТЕЛЬНО&n удаил вас! 
  msend %actor% &RСМЕРТЕЛЬНО&n удаил вас! 
  msend %actor% &RСМЕРТЕЛЬНО&n удаил вас! 
  mechoaround %actor% СМЕРТЕЛЬНО ударил %actor.vname%
  mechoaround %actor% СМЕРТЕЛЬНО ударил %actor.vname% 
  mechoaround %actor% СМЕРТЕЛЬНО ударил %actor.vname% 
  mechoaround %actor% СМЕРТЕЛЬНО ударил %actor.vname%  
  mdamage %actor% 90
  



~
#104308
убили хана~
0 f0 100
~
mload obj 104300
if (%world.curobjs(104316)% < 4) && (%random.10% <= 1)
   mload obj 104316


~
#104309
убили стрельщика~
0 f0 100
~
if (%world.curobjs(104301)% < 6) && (%random.10% <= 1)
   mload obj 104301


~
#104310
убили щитника~
0 f0 100
~
if (%world.curobjs(104302)% < 6) && (%random.10% <= 1)
   mload obj 104302


~
#104311
убили ветерана~
0 f0 100
~
if (%world.curobjs(104303)% < 6) && (%random.10% <= 1)
   mload obj 104303


~
#104312
убили нукера~
0 f0 100
~
if (%world.curobjs(104304)% < 6) && (%random.10% <= 1)
   mload obj 104304


~
#104313
убили младшего нукера~
0 f0 100
~
if (%world.curobjs(104305)% < 6) && (%random.10% <= 1)
   mload obj 104305


~
#104314
убили десятника~
0 f0 100
~
if (%world.curobjs(104306)% < 6) && (%random.10% <= 1)
   mload obj 104306


~
#104315
убили десятника в кибитке~
0 f0 100
~
if (%world.curobjs(104307)% < 6) && (%random.10% <= 1)
   mload obj 104307


~
#104316
убили шамана~
0 f0 100
~
if (%world.curobjs(104308)% < 6) && (%random.10% <= 1)
   mload obj 104308


~
#104317
убили ученика~
0 f0 100
~
if (%world.curobjs(104309)% < 6) && (%random.10% <= 1)
   mload obj 104309


~
#104318
убили копейщика~
0 f0 100
~
if (%world.curobjs(104310)% < 6) && (%random.10% <= 1)
   mload obj 104310


~
#104319
убили старшего~
0 f0 100
~
if (%world.curobjs(104311)% < 6) && (%random.10% <= 1)
   mload obj 104311


~
#104320
убили внутреннего~
0 f0 100
~
if (%world.curobjs(104312)% < 6) && (%random.10% <= 1)
   mload obj 104312


~
#104321
убили акына~
0 f0 100
~
if (%world.curobjs(104313)% < 6) && (%random.10% <= 1)
   mload obj 104313


~
#104322
убили лучника~
0 f0 100
~
if (%world.curobjs(104314)% < 6) && (%random.10% <= 1)
   mload obj 104314


~
#104323
убили прачку~
0 f0 100
~
if (%world.curobjs(104315)% < 6) && (%random.10% <= 1)
   mload obj 104315


~
#104324
убили ночного~
0 f0 100
~
if (%world.curobjs(104320)% < 6) && (%random.10% <= 1)
   mload obj 104320


~
#104325
убили сотника~
0 f0 100
~
if (%world.curobjs(104321)% < 6) && (%random.15% <= 1)
   mload obj 104321


~
$
$
