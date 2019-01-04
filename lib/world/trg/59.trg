#5900
дать20старому~
0 m 1
~
if %actor.vnum% != -1
  halt
end
eval needgold %actor.level%
if %amount% < %needgold%
  дать %amount% кун %actor.name%
  tell %actor.name% Маловато будет!
else
  mecho Цыган обернулся куда-то к кустам и громко свистнул.
  mecho Из-за кустов выскочил цыганенок с телегой.
  msend %actor.name% С ветерком довезут, глазом моргнуть не успеешь!
  mecho Цыганенок быстро подвел телегу, вскочил на лошадь:
  mecho А ну залетные!
  msend %actor.name% Слезай приехали!
  mecho Цыганенок быстро развернул телегу и уехал обратно.
  mteleport %actor.name% 5901 horse
end
~
#5901
дать20молодому~
0 m 1
~
if %actor.vnum% != -1
  halt
end
eval needgold %actor.level%
if %amount% < %needgold%
  дать %amount% кун %actor.name%
  tell %actor.name% Маловато будет!
else
  mecho Цыган обернулся куда-то к кустам и громко свистнул.
  mecho Из-за кустов выскочил цыганенок с телегой.
  msend %actor.name% С ветерком довезут, глазом моргнуть не успеешь!
  mecho Цыганенок быстро подвел телегу, вскочил на лошадь:
  mecho А ну залетные!
  msend %actor.name% Слезай приехали!
  mecho Цыганенок быстро развернул телегу и уехал обратно.
  mteleport %actor.name% 5900 horse
end
~
#5902
встречамолодой~
0 r 100
~
tell %actor.name% Хочешь довезут тебя до одного места, сам туда ты не проберешься!
eval needgold %actor.level%
tell %actor.name% Всего-то кун эдак %needgold% и ты там!
~
#5903
встречастарый~
0 r 100
~
tell %actor.name% Хочешь довезут тебя до одного места, сам туда ты не проберешься!
eval needgold %actor.level%
tell %actor.name% Всего-то кун эдак %needgold% и ты там!
~
$~
