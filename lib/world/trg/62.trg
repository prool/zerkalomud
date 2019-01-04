#6200
убилижука~
0 f 100
~
if %world.curobjs(6200)% < 1
  mload obj 6200
end
~
#6201
убилиплесень~
0 f 100
~
if %world.curobjs(6205)% < 1
  mload obj 6205
  mecho Плесень умерла, превратившись в маленький комок грязи.
  mecho Там, где раньше была плесень блеснуло что-то металлическое.
end
if (%world.curobjs(6206)% < 50) && (%random.5%==1)
  mload obj 6206
  mecho Среди мусора еще что-то блеснуло.
end
~
#6202
открсундук~
1 o 100
~
oecho Маленький банный ключ рассыпался в руках.
switch %random.10%
  case 1
    case 2
      osend %actor% Осмотрев сундук, Вы заметили внутри странный предмет, обледеневшую пластину.
      oechoaround %actor.name% наш%actor.g% обледеневшую табличку.
      oload obj 517
    break
    case 3
      osend %actor% Осмотрев сундук, Вы нашли внутри старую книгу.
      oechoaround %actor.name% наш%actor.g% в судуке старую книгу.
      oload obj 1712
    break
  done
  calcuid target 6200 obj
  opurge %target%
~
#6203
ищемклад~
1 c 4
набрать~
if !%exist.obj(6205)%
  halt
end
if !%arg.contains(воды)%
  osend %actor% Чего?
  halt
end
calcuid vedro62 6205 obj
if ( %actor.eq(17)% != %vedro62% )
  osend %actor% Во что???
  halt
end
* держим в руке
osend %actor% Наклонившись, Вы попробовали набрать воды в ведро.
oechoaround %actor% %actor.name% наклонился, чтобы набрать воды из колодца.
osend %actor% Вдруг, за одним из бревен внутри колодца Вы что-то заметили.
osend %actor% Просунули туда руку и у Вас в руках оказался сверток.
osend %actor% Ведро выскользнуло из рук и упало в колодец.
if (%random.1000% <= 400)
  oload obj 6208
  oforce %actor.name% взять сверток
else
  osend %actor% Сверток выскользнул из рук и упал в колодец. 
end
calcuid target 6205 obj
opurge %target%
~
#6204
убилиулитку~
0 f 50
~
if %world.curobjs(6209)% < 10000
  mload obj 6209
end
~
#6205
Репоп~
2 f 100
~
calcuid colodec 6207 obj
detach 6203 %colodec.id%
attach 6203 %colodec.id%
~
$~
