#40000
Входим к вору~
0 r 100
~
if %actor.class%==2 
  say Здраве буде, %Actor.name%
  say Вижу я, знакомо тебе искусство воровское.
  вздох
  wait 1s
  say Мне нужна помощь опытного вора, подсобишь?
else
  хих
  wait 1s
  say Я - честный старик и не хочу иметь с тобой дел
end
~
#40001
Соглашаемся с вором~
0 d 0
согласен помогу да ~
if %actor.class%==2 
  say Отлично! Я знал, что ты не сможешь отказаться.
  ssy Дело такое - живет здесь рядом боярин богатый. 
  say Чего в его доме только нету.
  say Но меня интересует трава волшебная, от всех болезней излечающая.
  say Хранит ее боярин за дверью секретной, в сундуке огромном да за ловушками.
  say Я бы и сам все сделал да годы уже не те..
  say А ты, вроде, мне подходишь.
  say Иди же.
  mdoor 40000 south purge
  mdoor 40000 south room 40001
  detach 40000 %self.id%
  attach 40005 %self.id%
  detach 40001 %self.id%
end
~
#40002
Взламываем дверь~
2 c 0
взломать~
if !%arg.contains(Дверь)% 
  wsend %actor% Что ломаем?
  halt
else
  if %actor.skill(взломать)%<50
    wsend %actor% Вы вставили отмычки в замок, но не смогли разобраться с конструкцие и сломали их
  else 
    wsend %actor% Вы ловко вскрыли замок
    wdoor 40082 south purge
    wdoor 40082 south room 40061
  end
end
~
#40003
Открываем сундук~
2 c 0
Обезвредить~
if !%arg.contains(ловушка)% 
  wsend %actor% Что обезвреживаем?
  halt
else 
  if %actor.skill(взломать)%<75
    wsend %actor% Вы попытались обезвредить ловушку, но вам не хватило умения. Она сработала.
    wdamage %actor% 450
  else
    wsend %actor% Вы ловко обезвредили ловушку.
    calcuid sun1  40012 obj
    wpurge %sun1%
    wload obj 40015
    wsend %actor% Видимо, кто-то услышал вас - вы различили четкие шаги, приближающегося сюда человека.
    wsend %actor% Пожалуй, стоит спрятаться и подождать
    wait 3s
    if %actor.skill(спрятаться)%<40 
      wsend %actor% Несмотря на ваши старания, вас заметили.
      wecho %actor% Модным ударом вас оглушили
      wteleport %actor% 40077
    else 
      wsend %actor% Вы благополучно притаились в тени и вскоре шаги стихли вдалеке.
    end
    attach 40004 %self.id%
    detach 40003 %self.id%
  end
end
~
#40004
Взламываем сундук~
2 c 0
взломать взл взло взлом взлома взломат~
if !%arg.contains(сундук)%
  wsend %actor% что вскрываем?
  halt
else
  if %actor.skill(взломать)%<80
    wsend %actor% Вы не смогли вскрыть этот замок.
  else 
    wsend %actor% Вы вскрыли замок.
    wload obj 40013 
    detach 40004 %self.id%
  end
end
~
#40005
Дали мешок вору~
0 j 100
~
wait 1
if %object.vnum%!=40013
  хму
  say Что это? 
  say Я думал, ты честный вор
  бро все
  halt
end
wait 1
mpurge %object%
улы
wait 1s
say Я так и знал, что ты справишься! Даже и не сомневался! Разьве это дело для таких как ты?
say А теперь награда
wait 1s
say Как ты, наверное, заметил, успех дела во многом зависит от того, смог ли ты укрыться
say Так вот, научу я тебя грамотно уходить в тень.  
mecho Вы не успели и глазом моргнуть, как старик исчез.
wait 1s 
mecho и  вскоре появился у вас за спиной
if ((%actor.skill(спрятаться)% < 100) && (%actor.class% == 2)) 
  mecho Позже он объяснил вам как это сделать
  eval val 5+%.random.5%
  mskilladd %actor.name% спрятаться %val%
else
  mecho но тут же разачарованно отвернулись. Ничего нового для вас не случилось.
end
detach 40005 %self.id%
~
#40006
Будим вора~
0 c 0
будить разбудить~
mecho вор проснулся и встал на ноги
say привет тебе, воришка..
say видно сидеть нам теперь вместе.
say уже полгода сижу я.. Зрение от побоев совсем потерял
say слышал я, что собака хозяйская носит на шее чудодейственный камень, исцеляющий слепоту
say Может, если ты сможешь сбежать, принесешь ты мне такой?
attach 40007 %self.id%
detach 40006 %self.id%
~
#40007
Даем вору камень~
0 j 100
~
wait 1
if %object.vnum%!=40014
  say не то это.. 
  бро все
  halt
end
wait 1
mpurge %object%
say Да, это то самое!
say награжу я тебя.
say ничего у меня нету, только опыт.
say раньше я был вором маститым и умел украсть из кармана у кого-угодно что-угодно.
say расскажу тебе, как это сделать
if ((%actor.skill(украсть)% < 80) && (%actor.class% == 2))
  eval val 5+%.random.5%
  mskilladd %actor% украсть %val%
else
  eval val %actor.level%*2500
  eval val2 %val%+(%val%*%actor.remort%/10)
  %actor.exp(+%val2%)%
end
%purge% %self.id%
~
#40008
reset~
2 f 100
~
calcuid room 40082 room
attach 40082 %room.id%
calcuid mob 40011 mob
attach 40000 %mob.id%
attach 40001 %mob.id%
calcuid mob 40017 mob
attach 40006 %mob.id%
~
#40009
Входим в тюрьму~
2 e 100
~
wecho Оставь надежду всяк сюда попавший.
~
#40010
дверь~
2 c 0
нажать~
if !%arg.contains(косяк)%
  wsend %actor% куда жмем ?
else
  wsend %actor% Вы нажали на косяк и дверь отползла в сторону.
  wdoor  40061 north purge
  wdoor 40061 north room 40082
~
#40011
боярин агрит~
0 q 100
~
wait 1
хмур
say Ты кто таков, смерд?
say Что тут шляешься?
вопр
wait 2
say А ну пошел вон!
кирп %actor.name%
wait 2
say До трех считаю и стражу кличу!
wait 3
атак %actor.name%
~
#40012
убили повара~
0 f 100
~
if (%world.curobjs(40006)% < 5) && (%random.10% <= 2)
  mload obj 40006
end
if (%world.curobjs(40007)% < 5) && (%random.10% <= 2)
  mload obj 40007
end
if (%world.curobjs(40008)% < 5) && (%random.10% <= 2)
  mload obj 40008
end
~
#40013
убили боярина~
0 f 100
~
if (%world.curobjs(40010)% < 3) && (%random.25% <= 2)
  mload obj 40010
end
~
#40014
убили боярыню~
0 f 100
~
if (%world.curobjs(40011)% < 3) && (%random.25% <= 2)
  mload obj 40011
end
~
#40015
убили грустного вора~
0 f 100
~
if (%world.curobjs(40000)% < 3) && (%random.25% <= 2)
  mload obj 40000
end
~
#40016
убили стрельца1~
0 f 100
~
if (%world.curobjs(40001)% < 4) && (%random.20% <= 2)
  mload obj 40001
end
~
#40017
убили мечника1~
0 f 100
~
if (%world.curobjs(40002)% < 4) && (%random.20% <= 2)
  mload obj 40002
end
~
#40018
убили мечника2~
0 f 100
~
if (%world.curobjs(40003)% < 4) && (%random.20% <= 2)
  mload obj 40003
end
~
#40019
убили мечника3~
0 f 100
~
if (%world.curobjs(40004)% < 4) && (%random.20% <= 2)
  mload obj 40004
end
~
#40020
убили мечника4~
0 f 100
~
if (%world.curobjs(40026)% < 4) && (%random.20% <= 2)
  mload obj 40026
end
~
#40021
убили мечника5~
0 f 100
~
if (%world.curobjs(40027)% < 4) && (%random.20% <= 2)
  mload obj 40027
end
~
#40022
убили десятника1~
0 f 100
~
if (%world.curobjs(40005)% < 3) && (%random.20% <= 2)
  mload obj 40005
end
~
#40023
убили десятника2~
0 f 100
~
if (%world.curobjs(40009)% < 3) && (%random.20% <= 2)
  mload obj 40009
end
~
#40024
убили десятника3~
0 f 100
~
if (%world.curobjs(40020)% < 3) && (%random.20% <= 2)
  mload obj 40020
end
if (%world.curobjs(40023)% < 6) && (%random.20% <= 2)
  mload obj 40023
end
~
#40025
убили стрельца2~
0 f 100
~
if (%world.curobjs(40016)% < 5) && (%random.20% <= 2)
  mload obj 40016
end
~
#40026
убили ловкача~
0 f 100
~
if (%world.curobjs(40017)% < 2) && (%random.25% <= 2)
  mload obj 40017
end
~
#40027
убили начальника стражи~
0 f 100
~
if (%world.curobjs(40019)% < 3) && (%random.20% <= 2)
  mload obj 40019
end
~
#40028
убили пса~
0 f 100
~
if (%world.curobjs(40014)% < 4) && (%random.10% <= 2)
  mload obj 40014
end
~
#40029
убили чернявку~
0 f 100
~
if (%world.curobjs(40021)% < 5) && (%random.15% <= 2)
  mload obj 40021
end
~
#40030
убили чернявку2~
0 f 100
~
if (%world.curobjs(40025)% < 5) && (%random.15% <= 2)
  mload obj 40025
end
~
#40031
убили стрельца3~
0 f 100
~
if (%world.curobjs(40022)% < 5) && (%random.15% <= 2)
  mload obj 40022
end
~
#40032
убили дьячка~
0 f 100
~
if (%world.curobjs(40024)% < 5) && (%random.15% <= 2)
  mload obj 40024
end
~
#40033
СнимаемПогремушку~
2 c 0
снять~
if %arg.contains(погремушку)%
  *wait 1s
  wecho _Зашелестел воздух тысячью упавших листьев.
  wecho _Зазвенел сотней стеклянных колокольчиков.
  if %actor.quested(640104)% && !%actor.quested(640105)%
    %send% %actor% _Погремушка, которую Вы так усиленно тащили упала на каменный пол.
    %echoaround% %actor% Погремушка, которую так усиленно тащи%actor.q% %actor.name% упала на каменный пол.
    wload obj 40028
    wait 1s
    wecho _Проснулась маленькая Лада, заплакала.
    if %exist.mob(40013)% && %exist.mob(40013)% 
      wecho _Сбежались на шум мать со свитою, да отец с охраною
      wecho _Видит бог - не поздоровится Вам!
      *если живы переносим мобов 
      calcuid nMob1 40013 mob
      wteleport %nMob1% 40080
      calcuid nMob2 40012 mob
      wteleport %nMob2% 40080
      wforce боярин атак %actor.name%
      wforce боярыня атак %actor.name%
      halt
    end
    *если жива только мать
    if %exist.mob(40013)% && !%exist.mob(40012)% 
      wecho _Сбежались на шум мать со свитою, с кочергами, да ухватами.
      wecho _Видит бог - не поздоровится Вам!
      *если живы переносим мобов 
      calcuid nMob1 40013 mob
      wteleport %nMob1% 40080
      wforce боярыня атак %actor.name%
      halt
    end 
    *если жив только отец
    if !%exist.mob(40013)% && %exist.mob(40012)% 
      wecho _Сбежались на шум отец с дружиной ратною, с мечами, да острыми стрелами.
      wecho _Видит бог - не поздоровится Вам!
      *если живы переносим мобов 
      calcuid nMob1 40012 mob
      wteleport %nMob1% 40080
      wforce боярин атак %actor.name%
      halt
    end 
  else
    %send% %actor% _Вы хотели снять самую красивую погремушку, но не посмели дотронуться до нее.
    %echoaround% %actor% %actor.name% хоте%actor.q% снять погремушку, но не посме%actor.q% даже дотронуться.
  end
else
  wsend %actor.name% Что Вы хотите снять?
end
~
#40034
ОбнаружениеКвестера6402~
2 e 100
~
if %actor.quested(640201)%
  if %exist.mob(40034)%
    *атачим триг лоад ножа у лагоды (посмертно)
    calcuid m2 40034 mob
    attach 40035 %m2.id% 
  end
end
~
#40035
УмерлаЛагода~
0 f 0
~
mload obj 40029
~
#40036
ОбнаружениеКвестера6403~
2 e 100
~
if %actor.quested(640301)%
  if %exist.mob(40035)%
    *атачим триг лоад ножа у лагоды (посмертно)
    calcuid m2 40035 mob
    attach 40037 %m2.id% 
  end
end
~
#40037
УмерлаЛебедь~
0 f 0
~
mload obj 64067
~
$~
