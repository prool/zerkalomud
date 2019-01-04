#15800
проверка клан шмота~
1 gj 100
~
wait 1
if %actor.clan% == хрб
  halt
end
osend %actor% %self.name% рассыпал%self.u% в ваших руках.
wait 1
opurge %self%
~
#15801
зовем коня~
1 c 2
звонить~
wait 1
if !%arg.contains(колокольчик)%
  osend %actor% Чего желаете?
  halt
end
osend %actor% Вы позвонили в колокольчик.
if %actor.clan% != хрб
  halt
end
if %world.curmobs(15805)% > 50
  osend %actor% ...и ничего не произошло!
  halt
end
oechoaround %actor% %actor.name% позвонил%actor.g% в колокольчик.
oload mob 15805
oecho Послышался стук копыт и перед Вами предстал вороной конь.
oforce %actor% оседлать конь
wait 1
opurge %self%
~
#15802
даем деньги конюху~
0 m 0
~
wait 1
if %amount% < 50
  wait 2
  say Маловато будет!
  give %amount% кун .%actor.name%
  halt
end
if %world.curobjs(15835)% >= 200
  wait 2
  say Закончились колокольчики, звиняй!
  give %amount% кун .%actor.name%
  halt
end
wait 2
say Вот, держи.
mload obj 15835
give колокольчик .%actor.name%
~
#15803
расседлаем коня~
0 c 0
расседлать~
wait 1
if %self.fighting%
  halt
end
if !%arg.contains(коня)%
  msend %actor%  Кого вы хотите расседлать?
  halt
end
if (%actor.clan% != хрб) || (%actor% != %self.leader%)
  msend %actor% Это не Ваш скакун.
  halt
end
msend %actor% Вы расседлали коня.
mechoaround %actor% %actor.name% расседлал%actor.g% коня.
mload obj 15835
give колокольчик .%actor.name%
wait 1
mecho Конь скрылся вдалеке.
wait 1
mpurge %self%
~
#15804
Дружинник лапает повариху~
0 g 100
~
wait 1s
if (%actor.vnum% == 15810)
  mforce %actor% щупать молод.кухар
  wait 1s
  хих
  смущ
  пощеч %actor.name%
end
~
$~
