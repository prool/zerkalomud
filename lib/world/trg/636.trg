#63600
южный ров~
2 c 0
лезть~
if (%arg% == ров)
  wsend %actor% Вы принялись карабкаться по отвесной стене рва.
  wsend %actor% Вы благополучно ее преодолели.
  if (%self.vnum% == 63638)
    wteleport %actor% 63658
  else
    wteleport %actor% 63638
  end
  wechoaround %actor% %actor.iname% спрыгнул%actor.g% рядом с Вами.
  wecho %actor.iname% полез%actor.g% по стенке рва и скрылся из виду
else
  wsend %actor% Куда вы лезете-то?
end
~
#63601
восточный ров~
2 c 0
лезть~
if (%arg% == ров)
  wsend %actor% Вы принялись карабкаться по отвесной стене рва.
  wsend %actor% Вы благополучно ее преодолели.
  if (%self.vnum% == 63626)
    wteleport %actor% 63665
  else
    wteleport %actor% 63626
  end
  wechoaround %actor% %actor.iname% спрыгнул%actor.g% рядом с Вами.
  wecho %actor.iname% полез%actor.g% по стенке рва и скрылся из виду
else
  wsend %actor% Куда вы лезете-то?
end
~
#63602
северный ров~
2 c 0
лезть~
if (%arg% == ров)
  wsend %actor% Вы принялись карабкаться по отвесной стене рва.
  wsend %actor% Вы благополучно ее преодолели.
  if (%self.vnum% == 63617)
    wteleport %actor% 63662
  else
    wteleport %actor% 63617
  end
  wechoaround %actor% %actor.iname% спрыгнул%actor.g% рядом с Вами.
  wecho %actor.iname% полез%actor.g% по стенке рва и скрылся из виду
else
  wsend %actor% Куда вы лезете-то?
end
~
#63603
междугородный портал, касса~
0 m 1
~
wait 1
emot пересчитал%self.g% монеты
switch %amount%
  case 4500
    eval target 75063
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
#63604
междугородный портал, отправка~
2 z 100
~
wportal 75063 2
~
#63605
load set on voevoda~
0 f 100
~
mload obj 64425
~
$~
