* BRusMUD trigger file v1.0
#63600
южный ров~
2 c0 0
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
2 c0 0
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
2 c0 0
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
$
$
