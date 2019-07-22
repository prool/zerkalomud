#5400
охотник2 ~
0 j 100
~
wait 1
switch %object.vnum%
  case 5402
    %purge% %object%
    say - Я так давно его искал, жена говорит не возвращайся из леса,  пока не найдешь глухариное перо!
    say - Спасибо. Вот, возьми.
    %self.gold(+100)%
    дать 100 кун %actor.name%
    if ((%world.curobjs(229)% < 50) && (%random.100% < 11))
      mload obj 229
      дать рун %actor.name%
    end
  break
  default
    say Твою м@^*, зачем мне это?
    eval getobject %object.name%
    броси %getobject.car%.%getobject.cdr%
  break
done
~
#5401
охотник1 ~
0 q 100
~
ругать
msend %actor.name% - Искать, Мухтар, искать, мне надоело здесь шататься!
msend %actor.name% - Путник, если найдешь ... ээээ, блин забыл, я в долгу не останусь.
~
$~
