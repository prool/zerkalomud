* BRusMUD trigger file v1.0
#64700
отдали грамоту~
0 j0 100
~
wait 1
if %object.vnum% == 72721
  wait 3
  say Грамота от брата-лесника?
рад
  wait 4
  say Я уж и не думал, что жив он
  say Почитай уж пол года как сгинул!
  say Вот удружили - так удружили! Хорошую весть принесли!
  wait 5
  улы %actor.name%
эм стал быстро читать грамоту, шевеля губами.
  wait 1
  calcuid dar 72721 obj
  mpurge %dar%
wait 1
say За вести от брата - отблагодарю тебя!
wait 4
say Ну что ж, пожалуй, отдам я тебе самое ценное, что сейчас у меня есть с собой!
   if (%random.1000% < 80) && (%world.curobjs(64700)% < 4)
    mload obj 64700
   else
    mload obj 64701
   end
дать все %actor.name%
end

~
#64701
лоад секиры~
0 f0 100
~
if (%random.1000% < 80) && (%world.curobjs(64702)% < 4)
    mload obj 64702
end

~
#64702
лоад сулицы~
0 n0 100
~
if (%random.1000% < 80) && (%world.curobjs(64703)% < 4)
    mload obj 64703
end
дер сулиц

~
#64703
лоад щита~
0 f0 100
~
if (%random.1000% < 80) && (%world.curobjs(64704)% < 4)
    mload obj 64704
end

~
#64704
лоад рубахи~
0 f0 100
~
if (%random.1000% < 80) && (%world.curobjs(64705)% < 4)
    mload obj 64705
end

~
$
$
