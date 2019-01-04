#46100
Зашли к волхву~
0 q 100
~
*Предлогают нам взять главный квест.
if (%quest461.name% == %nil%)
  wait 1s
  ул   
  г Не думал, не гадал, что встречу в этих краях кого-то...
  wait 1s
  г Вижу, силен ты, да мудрен, много мест повидал, во многом разобрался...
  wait 2s
  взд
  г Да что это я...
  г Видно дела тебя ждут ратные, не до меня тебе.
  wait 1s
  mecho _Волхв еще раз взглянул на вас и замолк, задумавшись о чем-то своем. 
end
~
#46101
Разговариваем с волхвом~
0 d 100
расскажи~
*Берем главный квест
if (%quest461.name% = %nil%)
  set quest461 %actor%
  global quest461
  wait 1s
  ул
  wait 2s
  г Ну, если уж сам просишь, поведаю что приключилось в этих местах...
  wait 1s
  взд  
  г Долгое время я жил в этом лесу.
  г Травы лечебные собирал, да за живностью местной приглядывал...
  г Но нагрянула беда нежданно негаданно.
  wait 2s
  г От куда не возьмись, появились птицы да змеи!
  г Да все не простые! Все огненные!
  взд
  wait 3s
  г Где пролетят - проползут, пожарище начинается...
  wait 1s
  г И как только я с ними не боролся.
  г Какую только магию не перепробовал! 
  г Не что их не берет окаянных!
  wait 3s
  г Вот уже и лес весь пожгли.
  wait 1s
  г Звери да птицы, что обитали в здешних краях, все разбежались-разлетелись кто куда.
  г Да и что им тут делать? На пожарище этом? 
  wait 2s
  г Вот и я думаю куда податься...
  wait 3s
  г Но раз уж ты здесь, разберись с ними!
  г Прогони окаянных!
  wait 1s
  г Я уж в накладе не оставлю!
  wait 1s 
  calcuid formb 46100 mob
  detach 46100 %formb.id%
  detach 46101 %formb.id%
end
~
#46102
Огненная птица улетает~
0 k 100
~
if %self.hitp% < 750
  mecho _-Огненная птица взмахнула крыльями!
  mecho _-Огненная птица улетела в более безопасное место!  
  mteleport %self% 46164
  detach 46102 %self.id%
end
~
#46103
Птенец1 улетает~
0 k 100
~
if %self.hitp% < 650
  mecho _-Огненный птенец взмахнул крыльями!
  mecho _-Огненный птенец улетел в более безопасное место!  
  mteleport %self% 46164
  detach 46103 %self.id%
end
~
#46104
Птенец2 улетает ~
0 k 100
~
if %self.hitp% < 650
  mecho _-Огненный птенец взмахнул крыльями!
  mecho _-Огненный птенец улетел в более безопасное место!  
  mteleport %self% 46164
  detach 46104 %self.id%
end
~
#46105
В бою с ярким огнем~
0 k 100
~
mecho _Яркий огонь ВСПЫХНУЛ еще сильнее, ПОДЖИГАЯ все вокруг себя!
mload mob 46105
wait 3s 
~
#46106
Огненная птаха улетает~
0 k 100
~
if %self.hitp% < 750
  mecho _-Огненная птаха взмахнула крыльями!
  mecho _-Огненная птаха улетела в более безопасное место!  
  mteleport %self% 46173
  detach 46106 %self.id%
end
~
#46107
Птенец огненной птахи1 улетает~
0 k 100
~
if %self.hitp% < 650
  mecho _-Птенец огненной птахи взмахнул крыльями!
  mecho _-Птенец огненной птахи улетел в более безопасное место!  
  mteleport %self% 46173
  detach 46107 %self.id%
end
~
#46108
Птенец огненной птахи2 улетает~
0 k 100
~
if %self.hitp% < 650
  mecho _-Птенец огненной птахи взмахнул крыльями!
  mecho _-Птенец огненной птахи улетел в более безопасное место!  
  mteleport %self% 46173
  detach 46108 %self.id%
end
~
#46109
Крыл.огн змей улетает~
0 k 100
~
if %self.hitp% < 850
  mecho _-Крылатый огненный змей взмахнул огромными крыльями!
  mecho _-Крылатый огненный змей скрылся из Вашего вида!  
  mteleport %self% 46168
  detach 46109 %self.id%
end
~
#46110
Детенышь кр.огн змея1 улетает~
0 k 100
~
if %self.hitp% < 650
  mecho _-Крылатый змееныш взмахнул крыльями!
  mecho _-Крылатый змееныш скрылся из Вашего вида!  
  mteleport %self% 46168
  detach 46110 %self.id%
end
~
#46111
Детенышь кр.огн змея2 улетает~
0 k 100
~
if %self.hitp% < 650
  mecho _-Крылатый змееныш взмахнул крыльями!
  mecho _-Крылатый змееныш скрылся из Вашего вида!  
  mteleport %self% 46168
  detach 46111 %self.id%
end
~
#46112
Рекол огненного духа1~
0 k 100
~
if %self.hitp% < 650
  mecho _-Дух огня вспыхнул ярким пламенем и пропал из Вашего вида!  
  mteleport %self% 46156
  detach 46112 %self.id%
end
~
#46113
Рекол огненной твари~
0 k 100
~
if %self.hitp% < 650
  mecho _-Огненная тварь вспыхнула ярким огнем и пропала из Вашего вида!
  mteleport %self% 46127
  detach 46113 %self.id%
end
~
#46114
Убили огненного демона~
0 f 100
~
mload obj 46131
~
#46115
Рекол огненного духа2~
0 k 100
~
if %self.hitp% < 650
  mecho _-Дух огня вспыхнул ярким пламенем и пропал из Вашего вида!  
  mteleport %self% 46156
  detach 46115 %self.id%
end
~
#46116
Рекол огненного духа3~
0 k 100
~
if %self.hitp% < 650
  mecho _-Дух огня вспыхнул ярким пламенем и пропал из Вашего вида!  
  mteleport %self% 46156
  detach 46116 %self.id%
end
~
#46117
Рекол огн.духа4~
0 k 100
~
if %self.hitp% < 650
  mecho _-Дух огня вспыхнул ярким пламенем и пропал из Вашего вида!  
  mteleport %self% 46156
  detach 46117 %self.id%
end
~
#46118
Рекол огн.духа5~
0 k 100
~
if %self.hitp% < 650
  mecho _-Дух огня вспыхнул ярким пламенем и пропал из Вашего вида!  
  mteleport %self% 46156
  detach 46118 %self.id%
end
~
#46119
Рекол огн.твари2~
0 k 100
~
if %self.hitp% < 650
  mecho _-Огненная тварь вспыхнула ярким огнем и пропала из Вашего вида!
  mteleport %self% 46127
  detach 46119 %self.id%
end
~
#46120
Рекол огн.твари3~
0 k 100
~
if %self.hitp% < 650
  mecho _-Огненная тварь вспыхнула ярким огнем и пропала из Вашего вида!
  mteleport %self% 46127
  detach 46120 %self.id%
end
~
#46121
Рекол огн.твари4~
0 k 100
~
if %self.hitp% < 650
  mecho _-Огненная тварь вспыхнула ярким огнем и пропала из Вашего вида!
  mteleport %self% 46127
  detach 46121 %self.id%
end
~
#46122
Рекол огн.твари5~
0 k 100
~
if %self.hitp% < 650
  mecho _-Огненная тварь вспыхнула ярким огнем и пропала из Вашего вида!
  mteleport %self% 46127
  detach 46122 %self.id%
end
~
#46123
Награда~
0 j 100
~
wait 1
if (%actor.id% != %quest461.id%)
  say Гм.. я тебя о помощи не просил, но все равно благодарствую.
  halt
end
if %object.vnum% != 46131 
  хмур
  drop %object.name%
  halt
end
wait 1
mpurge %object%
wait 3
г Ты сделал это! Теперь с помощью магии я оживлю лес!
г Спасибо тебе %actor.iname%
wait 1s
switch %random.20%
break
case 1
  wait 1s
  г Вот возьми, это тебе пригодится!
  wait 1s
  mload obj 46137
  дать книг %actor.name%
break
case 2
  wait 1s
  г Вот возьми, это тебе пригодится!
  mload obj 46139
  дать копье %actor.name%
break
case 3
  wait 1s
  г Вот возьми, это тебе пригодится!
  mload obj 46140
  дать секир %actor.name%
break
default
  wait 1s
  г Вот возьми, это тебе пригодится!
  mload obj 46138
  дать мешок .%actor.name% 
break
done
~
#46124
Репоп~
2 f 100
~
set quest461 %nil%
global quest461  
calcuid deletetrig 46100 mob
attach 46100 %deletetrig.id% 
attach 46101 %deletetrig.id%
attach 46123 %deletetrig.id%
calcuid deletetrig 46101 mob
attach 46102 %deletetrig.id% 
calcuid deletetrig 46102 mob
attach 46103 %deletetrig.id%
calcuid deletetrig 46103 mob
attach 46104 %deletetrig.id%
calcuid deletetrig 46104 mob
attach 46105 %deletetrig.id%
calcuid deletetrig 46106 mob
attach 46106 %deletetrig.id%
calcuid deletetrig 46107 mob
attach 46107 %deletetrig.id%
calcuid deletetrig 46108 mob
attach 46108 %deletetrig.id%
calcuid deletetrig 46110 mob
attach 46109 %deletetrig.id%
calcuid deletetrig 46111 mob
attach 46110 %deletetrig.id%
calcuid deletetrig 46112 mob
attach 46111 %deletetrig.id%
calcuid deletetrig 46114 mob
attach 46112 %deletetrig.id%
calcuid deletetrig 46115 mob
attach 46113 %deletetrig.id%
calcuid deletetrig 46116 mob
attach 46114 %deletetrig.id%
calcuid deletetrig 46117 mob
attach 46115 %deletetrig.id%
calcuid deletetrig 46118 mob
attach 46116 %deletetrig.id%
calcuid deletetrig 46119 mob
attach 46117 %deletetrig.id%
calcuid deletetrig 46120 mob
attach 46118 %deletetrig.id%
calcuid deletetrig 46121 mob
attach 46119 %deletetrig.id%
calcuid deletetrig 46122 mob
attach 46120 %deletetrig.id%
calcuid deletetrig 46123 mob
attach 46121 %deletetrig.id%
calcuid deletetrig 46124 mob
attach 46122 %deletetrig.id%         
~
$~
