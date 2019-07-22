#27700
Девочка~
0 q 100
~
wait 1s
say   Что ты здесь делаешь???
wait 2s
say   Тебя наверное послал мой дедушка
wait 2s
плак
wait 1s
say   Убегай быстрее!!! Разбойники не пощадят тебя...
~
#27701
Расплести~
2 c 100
расплести~
if !%arg.contains(ветви)% 
  return 0
  halt
end
wait 1
wdoor 27745 north flags a
wdoor 27745 north room 27746
wsend %actor.name% вы раздвинули ветви и открыли скрытый проход.
wechoaround %actor% %actor.name% раздвинул%actor.g% ветви и открылся проход.
detach 27701 %self.id%
~
#27702
Задание~
0 r 100
~
wait 1s
mecho Хмурый охотник печально взглянул на Вас.
wait 1s
вздох
wait 2s
say Здравствуй, мил человек. 
say Каким ветром занесло тебя в наши края?
wait 2s
say К нам давно уже никто не заходит.
wait 2s
say Несчастье пришло к нам...
say Появились в лесу разбойники,
say Спасу от них нет - мерзавцы полные.
say Грабят, убивают, насилуют..
wait 2s
say Все в округе знают про них и не ходят в лес.
say Да вот приехала ко мне внучка, не поверила мне
say и пошла-таки в лес по ягоды.
wait 2s
say Второй день минул как ушла она, и не вернулась.
say Наверное попала в лапы разбойников.
say Если б был я еще молод, я бы показал им где раки зимуют!
say Только годы уже не те. Не совладать мне с ними.
wait 2s
say Может ты поможешь? Выручишь мою внучку из плена?
wait 2s
emot вопросительно взглянул на Вас.
attach 27703 %self.id%
detach 27702 %self.id%
~
#27703
задание2~
0 d 100
помогу~
wait 2
say Спасибо тебе...
say Иди на юг, за мост, а потом на северо-восток, где-то там их логово...
wait 2
mecho Охотник пропустил Вас на юг.
mdoor 27719 south room 27727
mdoor 27719 south flags a
detach 27703 %self.id%
~
#27704
Открывание двери.~
2 d 100
помогу~
wait 4
wdoor 27719 south flags a
wdoor 27719  south  room 27727
~
#27705
развязать девочку~
0 c 100
развязать~
if !(%arg.contains(девочк)%) 
  msend  %actor% А что именно?
  return 0
  halt
end
wait 1
msend %actor% Вы развязали девочку и помогли ей встать.
mechoaround %actor% %actor.name% освободил%actor.q% девочку
wait 3s
mecho Девочка, продолжая плакать, пролепетала слова благодарности.
say Я побегу к дедушке, не могу ни секунды оставаться здесь больше.
wait 3
mecho Девочка быстро выбежала из комнаты.
calcuid ohotni 27706 mob
attach 27706 %ohotni.id%
set questor277 %actor%
remote questor277 %ohotni.id%
wait 1
mpurge %self%
~
#27706
вошли к охоту после девочки~
0 q 100
~
wait 1
if ((%actor.id% != %questor277.id%) && !%exist.mob(27700)%)
  halt
end
say Спасибо тебе, %actor.name%, за внучку. Натерпелась она, бедная, от извергов этих.
mecho _- Я ее покормил и отправил в избушку отдыхать. 
mecho _- А тебя отблагодарю за дело доброе.
wait 3
mecho Охотник вынул что-то из котомки
wait 3
switch %random.25%
  case 1
    mload obj 27709
    дать все %actor.name%
  break
  case 2
    mecho Охотник вынул что-то из котомки.
    mload obj 27710
    дать все %actor.name%
  break
  case 3
    mecho Охотник вынул что-то из котомки.
    mload obj 27711
    дать все %actor.name%
  break
  default
    mecho Охотник вынул что-то из котомки.
    %self.gold(1000)%
    дать 1000 кун %actor.name%
  done
  detach 27706 %self.id%
~
#27707
репоп~
2 f 100
~
wdoor 27745 north purge
wdoor 27719 south purge
calcuid branch 27745 room
detach 27701 %branch.id%
attach 27701 %branch.id%
~
#27708
умер тать~
0 f 100
~
if (%world.curobjs(27704)% < 10) && (%random.10% <= 2)
  mload obj 27704
end
~
#27709
умер северянин~
0 f 100
~
if (%world.curobjs(27705)% < 10) && (%random.10% <= 2)
  mload obj 27705
end
~
#27710
умер древлянин~
0 f 100
~
if (%world.curobjs(27708)% < 10) && (%random.10% <= 2)
  mload obj 27708
end
~
#27711
умер полянин~
0 f 100
~
if (%world.curobjs(27703)% < 10) && (%random.10% <= 2)
  mload obj 27703
end
~
#27712
умер лихоимец~
0 f 100
~
if (%world.curobjs(27700)% < 10) && (%random.10% <= 2)
  mload obj 27700
end
~
#27713
умер злой~
0 f 100
*~
if (%world.curobjs(27702)% < 10) && (%random.10% <= 2)
  mload obj 27702
end
if (%world.curobjs(27706)% < 10) && (%random.10% <= 2)
  mload obj 27706
end
~
$~
