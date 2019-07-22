#27200
встречастарик~
0 r 100
~
msend %actor% Здравствуй, путник!
msend %actor% Большое несчастье свалилось на наше селенье.
msend %actor% Ужасные создания захватили деревню и убили
msend %actor% всех жителей. Да и даже не убили, а превратили
msend %actor% в себе подобных.
msend %actor% Помоги освободить деревню и победи их главаря.
msend %actor% Я вот с трудом здесь в одиночку защищаюсь, жду
msend %actor% подмоги.
msend %actor% Я чем смогу, тем тебя отблагодарю.
~
#27201
умерповелитель~
0 f 100
~
if %world.curobjs(27202)%==0
  mload obj 27202
end
switch %random.4%
  * молния
  case 1
    if %world.curobjs(514)%==0
      mload obj 514
    end
  break
  * контроль погоды
  case 2
    if %world.curobjs(509)%==0
      mload obj 509
    end
  break
  * свет
  case 3
    if %world.curobjs(525)%==0
      mload obj 525
    end
  break
  default
    if %world.curobjs(539)%==0
      mload obj 539
    end
  break
done
~
#27202
датькольцостарик~
0 j 100
~
wait 1
if %object.vnum% != 27202
  say Зачем мне это?
  брос all
  halt
end
wait 1
mpurge %object%
say Спасибо, %actor.iname%, попробую отблагодарить тебя.
* друж
if ((%actor.class% == 5) && !%actor.skill(веерная защита)%)
  if (%actor.can_get_skill(веерная защита)%)
    mecho 
    wait 1
    msend %actor% Я передам тебе свои умения.
    wait 1
    mskillturn %actor% веерная.защита set
    msend %actor% Называется это веерная защита, теперь ты можешь
    msend %actor% один удерживать удары сразу нескольких врагов.
    halt
  else
    msend %actor% Старик посмотрел на Вас.
    mechoaround %actor% Старик посмотрел на %actor.vname%.
    msend %actor% Ты еще мал%actor.g% чтобы получить данное умение, но я отблагодарю тебя.
  end
end
* витязь
if (%actor.class% == 9) && (!%actor.spelltype(освящение)%)
  if (%actor.can_get_spell(освящение)%)
    mecho 
    wait 1
    msend %actor% Я передам тебе свои знания.
    wait 1
    mspellturn %actor% освящение set
    msend %actor% Называется это освящение, теперь ты можешь защитить себя от
    msend %actor% ударов врагов. Но их магия будет наносить по тебе больший урон.
    halt
  else
    msend %actor% Старик посмотрел на Вас.
    mechoaround %actor% Старик посмотрел на %actor.vname%.
    msend %actor% Ты еще мал%actor.g% чтобы получить данное умение, но я отблогадарю тебя.
  end
end
* купец
if (%actor.class% == 12) && (!%actor.spelltype(длительное оцепенение)%)
  if (%actor.can_get_spell(длительное оцепенение)%)
    mecho 
    wait 1
    msend %actor% Я передам тебе свои знания.
    wait 1
    mspellturn %actor% длительное.оцепенение set
    msend %actor% Называется это оцепенение, теперь ты можешь врагов ввести
    msend %actor% в состояние оцепенения, когда они не смогут ничего сделать тебе.
    halt
  else
    msend %actor% Старик посмотрел на Вас.
    mechoaround %actor% Старик посмотрел на %actor.vname%.
    msend %actor% Ты еще мал%actor.g% чтобы получить данное умение, но я отблагодарю тебя.
  end
end
if (%world.curobjs(27208)%<4) && (%random.3%==1)
  mload obj 27208
  дать посох .%actor.name%
elseif (%random.1000% <= 100)
  mload obj 1741
  give трактат .%actor.name%
else
  %send% %actor% %self.iname% протянул вам горстку кун.
  eval temp %actor.gold(+500)%
end
~
#27203
встиспуг~
0 q 100
~
wait 1
mecho _ Глаза испуганного жителя на мгновение остановились на Вас.
mecho _ Вдруг он заорал: ужас, ужас, бегите отсюда, там
хих
wait 1
хох
wait 1
mecho _ там ужас, там смерть, всем смерть.
mecho _ Так же быстро испуганный житель отвернулся от вас и резко отпрыгнул от вас.
~
$~
