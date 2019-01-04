#68000
награда за квест с дочкой (квест глашатого)~
0 g 100
~
if %actor.vnum% == -1
  halt
end
wait 1
if %actor.vnum% != 27020
  halt
end
wait 1s
set questor %actor.leader%
teleport questmob2703 68099
%purge% questmob2703
улы
say Велеслава, дочка! Давно не бывала, забыла старика...
emot ласково обнял Велеславу
say Ступай покуда в дом, я с провожатым твоим поговорю.
mecho Дочка воеводы кивнула и быстро взбежала по всходу в горницу.
wait 2
say Что ж, спасибо за помощь... Как бы наградить тебя?
switch %random.3%
  case 2
    if %random.100% < 60
      if %world.curobjs(68057)% < 5
        mload obj 68057
        дать плащ .%questor.name%
      end
    else
      say Возьми червонцев несколько за помощь.
      set bufer %self.gold(+2000)%
      дать 2000 кун %questor.name%
    end
  break
  case 1
    if %random.100% < 60
      if %world.curobjs(68056)% < 10
        mload obj 68056
        дать кольчуг .%questor.name%
      end
    else
      say Возьми червонцев несколько за помощь.
      set bufer %self.gold(+2000)%
      дать 2000 кун %questor.name%
    end
  break
  default
    say Возьми червонцев несколько за помощь.
    set bufer %self.gold(+2000)%
    дать 2000 кун %questor.name%
  done
~
#68001
Платные порталы~
0 m 1
~
wait 1
emot пересчитал%self.g% монеты
eval target 0
switch %amount%
  * Галич
  case 3800
    eval target 34410
  break
  * Ладога
  case 5800
    eval target 30224
  break
  default
    дум
    say И чего же ты за эти деньги хочешь?
    give %amount% кун .%actor.name%
    halt
  done
  кив
  emot сделал%self.g% несколько странных жестов
  mechoaround %actor% %actor.name% исчез%actor.q% в клубах дыма.
  msend %actor% У вас закружилась голова, и на миг вы потеряли сознание...
  msend %actor% 
  mteleport %actor% %target% horse
  mechoaround %actor% %actor.name% появил%actor.u% здесь в клубах дыма.
~
$~
