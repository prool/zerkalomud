* BRusMUD trigger file v1.0
#6200
убилижука~
0 f0 100
~
if %world.curobjs(6200)% < 1
   mload obj 6200
end








~
#6201
убилиплесень~
0 f0 100
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
1 o0 100
~
oecho Маленький банный ключ рассыпался в руках.
if %world.curobjs(517)% < 1 && %random.5%==1
osend %actor% Осмотрев сундук, вы заметили рядом странный предмет, обледеневшую пластину.
oechoaround %actor.name% нашел обледеневшую табличку.
oload obj 517
end
calcuid target 6200 obj
opurge %target%
detach %self.id%



~
#6203
ищемклад~
1 c0 4
набрать~
if (%arg%==воды) && (%actor.eq(18)%=6205)
osend %actor.name% Наклонившись, вы попробовали набрать воды в ведро.
oechoaround %actor% %actor.name% наклонился, чтобы набрать воды из колодца.
osend %actor.name% Вдруг, за одним из бревен внутри колодца вы что-то заметили.
osend %actor.name% Просунули туда руку и у вас в руках оказался сверток.
osend %actor.name% Ведро выскользнуло из рук и упало в колодец.
oload obj 6208
if %random.5%<2
oforce %actor.name% взять сверток
else
osend %actor.name% Сверток выскользнул и рук и упал в колодец. 
end
calcuid target 6205 obj
opurge %target%
detach 6203 %self.id%
else
oecho Чаво ?
  halt
end

~
$
$
