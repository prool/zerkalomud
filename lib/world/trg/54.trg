* BRusMUD trigger file v1.0
#5400
охотник2 ~
0 j 100
~
wait 2
switch %object.vnum%
case 5402
  say  - Я так давно его искал, жена говорит не возвращайся из леса,
  say  пока не найдешь глухариное перо!
  say  - Спасибо, получи плату.
  %self.gold(+100)%
  дать 100 кун %actor.name%
  mpurge глухариное перо
  if (%world.curobjs(229)% < 50) && (%random.10% == 1)
   mload obj 229
   дать рун %actor.name%
  end
break
default
  say  Твою м@^*, зачем мне это?
  eval getobject %object.name%
  броси %getobject.car%.%getobject.cdr%
  break
done
~
#5401
охотник1 ~
0 q0 100
~
ругать
msend %actor.name% - Искать, Мухтар, искать, мне надоело здесь шататься!
msend %actor.name% - Путник, если найдешь ... ээээ, блин забыл, я в долгу не останусь.
~
$
$
