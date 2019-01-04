#26000
старику дали желудь~
0 j 100
~
context 260
wait 1
switch %object.vnum%
  case 26001
  case 26002
    wait 1
    mpurge %object%
    say Спасибо тебе, %actor.name%, я знал что ты сможешь достать для меня этот желудь.
    wait 5s
    say Теперь внимательно выслушай меня!
    wait 3s
    say Чтобы пробраться к водяному здешних болот, тебе предстоит проделать долгий путь.
    wait 1s
    say Водяного охраняют несколько его верных слуг, но встре.ч..и...
    wait 2s
    mecho На небе возникла огромная грозовая туча.
    mecho Сверкнула молния и насмерть поразила старика...
    mecho Разряд молнии был на столько мощным, что труп старика превратился в кучку пепла.
    makeuid object %self.id%
    calcuid thisroom %self.realroom% room
    attach  26051 %thisroom.id%
    run     26051 %thisroom.id%
    break
  case 26003
    mpurge %object%
    wait 3s
    say Спасибо тебе, %actor.name%, я знал что ты сможешь достать для меня этот желудь.
    say Теперь внимательно выслушай меня!
    wait 2s
    say Чтобы пробраться к водяному здешних болот, тебе предстоит проделать долгий путь.
    say Водяного охраняют несколько его верных слуг, но встре.ч..и...
    mecho На небе возникла огромная грозовая туча.
    wait 3s
    eval    dam %actor.hitp%*19/20
    calcuid thisroom %self.realroom% room
    attach  26052 %thisroom.id%
    run     26052 %thisroom.id%
    mechoaround %actor% Грянул гром и яркая молния поразила %actor.vname%!
    mecho В небе прогремел гром и яркая молния поразила Вас!
    wait 1s
    взд
    wait 1s
    if %actor.sex% == 2
       say Ох, девонька, кто-то явно не желает, чтобы ты очистил%actor.g% болото от нечисти.
    else
       say Ох, мой друг, кто-то явно не желает, чтобы ты очистил%actor.g% болото от нечисти.
    end
    say Я продолжу свой расказ, но буду говорить немного тише.
    say Ммм... О чем я говорил ?
    эмоц погрузился в размышления..
    wait 6s
    эмоц почесал затылок
    wait 8s
    say А-а-а!.. Вспомнил. О страже водяного.
    wait 2s
    say Так вот: бдительность стражи можно усыпить, но как это сделать я не знаю.
    say Знаю только одно, она всегда готова прийти на помощь своему хозяину
    say неизвестно откуда, стража скрыта от глаз человека и дороги к ней нету.
    wait 2s
    say К самому же водяному можно попасть через тайный вход, но те кто знали где он находится
    say давно уже мертвы...
    wait 3s
    say Удачи тебе, %actor.name%! Очисти эту местность от нечисти и тебе воздастся.
    say Прощай %actor.name%, мне надо спешить, ведь мои деньки и так сочтены.
    взд
    mecho Старик прошептал непонятные слова и поднявшийся невесть откуда вихрь
    mecho унес его в неизвестном направлении.
     set    nut260 2
    WORLDS nut260
    makeuid object %self.id%
    calcuid thisroom %self.realroom% room
    attach  26050 %thisroom.id%
    run     26050 %thisroom.id%
    break
  default
    say Конечно мне приятно, что ты заботишься о моем быте, но у меня есть уже %object.name%.
    брос %object.name%
    break
done
~
#26001
триггер леших~
0 j 100
~
context 260
wait 1
switch %object.vnum%
  case 26001
    wait 1s
    if !%self.fighting%
       mecho  Установив желудь на пенек, лешие впали в транс от его завораживающего сияния.
    end
    set    nut260 3
    WORLDS nut260
    break
  case 26002
  case 26003
    wait 1s
    рад
    say    Наконец-то, что-то полезное принесли, теперь будет чем заняться.
    mecho  Лешие с большим удовольствием начал играть желудем.
    set    nut260 9
    WORLDS nut260
    break
  default
    say  О! Это мне пригодится.
    break
done
mpurge %object%
end
~
#26002
тригер камня~
1 c 4
лезть~
context 260
if ((%nut260% !=5) && (%nut260% !=6))
   return 0
   halt
end
if !(%arg.contains(лаз)%)
   return 0
   halt
end
wait 1
osend %actor.name% Присев на корточки, Вы аккуратно спустились вниз.
oechoaround %actor% %actor.name%, присев на корточки, спустил%actor.u% вниз.
wait 5
oteleport %actor% 26027 horse
~
#26003
(желудь)~
1 c 4
установить~
context 260
wait 1
if !(%arg.contains(золотой)%) && !(%arg.contains(изумрудный)%) && !(%arg.contains(малахитовый)%)
   return 0
   halt
end
if !(%nut260% ==2) && !(%nut260% ==3)
   return 0
   halt
end
if !(%actor.haveobj(26001)%) && !(%actor.haveobj(26003)%) && !(%actor.haveobj(26002)%)
   osend %actor.name% - Чего установить ?
   halt
end
if !(%arg.contains(изумрудный)%)
   if (%arg.contains(золотой)%) 
      osend %actor.name% После нескольких неудачных попыток установить желудь, Вы поняли, что
      osend %actor.name% золотой желудь явно не отсюда.
      calcuid gold 26001 obj
      opurge  %gold%
      halt
   elseif (%arg.contains(малахитовый)%)          
      osend %actor.name% После нескольких неудачных попыток установить желудь, Вы поняли, что
      osend %actor.name% малахитовый желудь явно не отсюда.
      calcuid malax 26003 obj
      opurge %malax%
      halt
   end
else
   wait 1
   calcuid izumrud 26002 obj
   opurge %izumrud%
   osend %actor.name% Вы поднесли желудь к выемке на алтаре, и в тот же миг
   osend %actor.name%  магическая сила установила желудь на его прежнее место.
   oechoaround %actor% %actor.name% установил%actor.g% желудь в углубление на алтаре.
   wait 6s
   oechoaround %actor% Вы услышали глухой звук двигающегося камня.
   osend %actor.name% С глухим скрежетом окровавленный алтарь подался в сторону,
   osend %actor.name% и Вы заметили небольшой лаз.
end
if %nut260% == 2
   set nut260 5
   WORLDS nut260
elseif %nut260% == 3
   set nut260 6
   WORLDS nut260
end
~
#26004
дубовый триггер~
2 c 0
преклонить наклонить~
context 260
if !(%arg.contains(колен)%)
   wecho Дуб зашевелил своей могучей кроной.
   halt
end
if (%world.curobjs(26001)% < 1) && (%world.curobjs(26002)% < 1) && (%world.curobjs(26003)% < 1)
   wechoaround %actor% %actor.name% встал%actor.g% на колени и начал%actor.g% шептать слова молитвы.
   wechoaround %actor.name% Ветви дуба зашевелились и Вам под ноги что-то упало.
   wsend %actor.name% Преклонив колени, Вы услышали, как зашевелились ветви дуба, и что-то упало Вам под ноги.
   wload obj 26001
   wload obj 26002
   wload obj 26003
   set    nut260 1
   WORLDS nut260
else
   wecho Дуб зашевелил своей могучей кроной, и несколько листочков упало на землю.
end
~
#26005
береза~
2 c 0
колоть рубить~
context 260
if %shalash260%
   return 0
   halt
end
if !(%arg.contains(полен)%) && !(%arg.contains(берез)%)
  wechoaround %actor% %actor.name% решил%actor.g% что-то порубить, но так и не придумал%actor.g%, что.
  if %actor.sex%==2
    wechoaround %actor% Интересно, что у нее на уме?...
  else
    wechoaround %actor% Интересно, что у него на уме?...
  end
  wsend %actor.name% Что вы хотите порубить? Может начать с окружающих?...
  halt
end
wechoaround %actor% %actor.name% начал%actor.g% рубить дрова, щепки полетели во все стороны.
wsend %actor.name% Обнажив свое оружие, Вы начали колоть полено.
wsend %actor.name% После нескольких мастерских выпадов, трухлявое полено разлетелось на мелкие щепки.
wload obj 26005
wpurge полено
set shalash260 1
worlds shalash260
~
#26006
дрова~
2 c 0
зажечь поджечь~
context 260
if %shalash260% != 1
   return 0
   halt
end
if !(%arg.contains(дрова)%) && !(%arg.contains(щепки)%)
   wechoaround %actor% %actor.name% достал%actor.g% из кармана что-то странного вида и начал%actor.g% сильно махать руками.
   wechoaround %actor% Сразу видно, что он%actor.g% ничего не умеет.
   wsend %actor.name% Не быть тебе великим  мастером, если даже костер разжечь не можешь.
   halt
end
wechoaround %actor% %actor.name% чем-то чиркнул%actor.g%, и разгорелся костер, который поднялся высоко над деревьями.
wsend %actor.name% Вспомнив, как в древние времена разжигали костер, Вы выбили искру и подожгли мох.
wsend %actor.name% Пламя костра вознеслось высоко над деревьями.
wsend %actor.name% Сквозь мглу, в северном направлении, Вы увидели узенькую тропинку.
wdoor 26016 north flags a
wdoor 26016 north room 26017
wpurge дрова
set shalash260 2
worlds shalash260
wait 30s
wecho Костер погас.
wdoor 26016 north purge
wdoor 26016 north flags a
wdoor 26016 north room 26010
~
#26008
Начало квеста~
0 h 100
~
wait  1
context 260
if (%actor.vnum% != -1)
   halt
end
if !%nut260%
   wait 1s
   say - Низкий поклон тебе,  %actor.name%!
   say Много лет назад я отправился на поиски священного желудя, который сделает меня молодым и сильным.
   wait 2s
   say Но злая нечисть, живущая в этом болоте, заколдовала меня, и я не могу далеко отойти от сторожки.
   wait 2s
   say Если ты согласишься помочь мне, я раскажу тебе историю, как в давние времена славный богатырь победил всю болотную нечисть.
   say Найди священный дуб и принеси мне желудь.
end
~
#26009
дупло~
2 c 0
влезть залезть лезть~
context 260
if (%nut260% !=7)
   return 0
   halt
end
if !(%arg.contains(дупло)%)
      wechoaround  %actor% %actor.name%, после неудачных попыток попасть в дупло, упал%actor.g% на землю.
      wsend %actor.name% Добравшись до самого дупла, Вы уцепились за ветку, которая с треском обломилась.
      wsend %actor.name% Ломая остальные ветки дуба, Вы с грохотом упали на землю.
      halt
end
wsend %actor.name% После долгих неудачных попыток, Вам все-таки удалось взлезть в дупло.
if %actor.sex% == 2
  wechoaround  %actor% %actor.name% запрыгнул%actor.g% на одну из ветвей, которая подкинула ее в дупло.
else
  wechoaround  %actor% %actor.name% запрыгнул%actor.g% на одну из ветвей, которая подкинула его в дупло.
end
wteleport  %actor%  26045 horse
~
#26010
водяной рип~
0 f 100
~
if %world.curobjs(1273)% < 1
if %random.100% <= 2
mload obj 1273
end
end
context 260
if %nut260% == 5
   set nut260 10
   WORLDS nut260
end
if %nut260% == 6
   set nut260 7
   WORLDS nut260
end
if (%world.curobjs(26022)% < 10) && (%random.100% <= 12)
   mload obj 26022
end
~
#26012
ключ мельника~
0 h 100
~
context 260
wait  1
if (%actor.vnum% != -1)
   halt
end
if !%key260%
   wait 1
   say Наконец-то я встретил тебя, %actor.name%!
   wait 1
   say Недавно я потерял ключ от сундука.
   wait 1
   say %actor.name%, помоги мне найти ключ и я тебе что-то раскажу.
end
~
#26013
принесли ключ мельника~
0 j 100
~
context 260
wait 1
if (%object.vnum% != 26025)
   if (%object.vnum% == 26018)
      mecho Старик начал усердно рассматривать ключ.
      взд
      say Извини, %actor.name%, но этот ключ не мой.
      wait 1s
      say Хотя спасибо, я найду ему применение.
      mpurge %object%
      halt
   elseif (%object.type% == 18)
      mecho Старик начал усердно рассматривать %object.vname%.
      взд
      say Извини, %actor.name%, может это и ключ, но точно не мой.
      wait 2
      брос %object.name%
      halt
   else
      say %actor.name%! за кого ты меня принимаешь?
      say Я ведь просил принести ключ, а не %object.vname%.
      wait 2
      брос %object.name%
      halt
   end
end
wait 1s
say Спасибо тебе, %actor.name%, что б я без тебя делал!
wait 1s
say Где-то на острове в пещере есть выход к черной мельнице.
say Там ты, став подмастерьем, сможешь обрести навыки мельника, они пригодяться тебе в дальнейшем.
say Возми это перо, оно поможет тебе найти путь к мельнице.
mload obj 26026
wait 2
дать перо %actor.name%
mpurge %object%
~
#26014
путь к мельне~
2 h 100
~
context 260
if (%object.vnum% == 26026)
   wait   1
   wdoor  26096 west flags a
   wdoor  26016 west room 26100
*261 зона - черная мельница - не существует :)
   wpurge %object%
   wait   30s
   wdoor  26096 west purge
end
~
#26015
квест полный~
2 g 100
~
if (%actor.vnum% != -1)
   halt
end
context 260
if (%nut260% !=7)
   halt
else
   wait 2s
   wecho Дуб зашевелил своей кроной.
   wecho Ветви дуба заколыхались и сквозь листву Вы увидели дупло.
end
~
#26016
Рипседстарик~
0 f 20
~
if %world.curobjs(216)% < 50
mload obj 216
end
~
#26023
260 - Zone reset~
2 f 100
~
context 260
unset   shalash260
unset   nut260
unset   key260
~
#26050
260 - Purge mob object~
2 z 100
~
return 0
wpurge %object%
detach 26050 %thisroom.id%
~
#26051
260 - Purge mob object~
2 z 100
~
return 0
wload obj 26023
wpurge %object%
detach 26051 %thisroom.id%
~
#26052
261 - Damage PC's~
2 z 100
~
wdamage %actor% %dam%
return 0
detach 26052 %thisroom.id%
~
#26053
Рипстарик~
0 f 100
~
if %world.curobjs(513)% == 0
mload obj 513
end
~
#26054
Рипвепрь~
0 f 100
~
if %world.curobjs(515)% == 0
mload obj 515
end
if (%world.curobjs(205)% < 50) && (%random.5% == 2)
  mload obj 205
end
~
#26055
кости~
1 h 100
~
eval kost2601 %random.6%
eval kost2602 %random.6%
wait 3
oecho Костяные бабки упали на землю и выпало %kost2601% и %kost2602%
worlds kost2601
worlds kost2602
 
~
$~
