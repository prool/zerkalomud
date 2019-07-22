#93600
к сыну старосты вошли~
0 q 100
~
say Привет %actor.name%!
wait 1
switch %actor.class%
  case 0
    say Ты случайно не лекарь?
  break
  case 1
    say Ты случайно не колдун?
  break
  case 2
    say Ты случайно не тать?
  break
  case 3
    say Ты случайно не богатырь?
  break
  case 4
    say Ты случайно не наемник?
  break
  case 5
    say Ты случайно не дружинник?
  break
  case 6
    say Ты случайно не кудесник?
  break
  case 7
    say Ты случайно не волшебник?
  break
  case 8
    say Ты случайно не чернокнижник?
  break
  case 9
    say Ты случайно не витязь?
  break
  case 10
    say Ты случайно не охотник?
  break
  case 11
    say Ты случайно не кузнец?
  break
  case 12
    say Ты случайно не купец?
  break
  case 13
    say Ты случайно не волхв?
  break
  default
    дум
  break
done
attach 93601 %self.id%
attach 93602 %self.id%
detach 93600 %self.id%
~
#93601
сказали нет~
0 d 1
нет~
say А жаль... 
взд
detach 93601 %self.id%
~
#93602
сказали да первый раз~
0 d 1
да ессно конечно ато дык~
switch %actor.class%
  case 0
    say Да я и сам вижу, что из Северян.
  break
  case 1
    say Да я и сам вижу, что из Полян.
  break
  case 2
    say Да я и сам вижу, что из Кривичей.
  break
  case 3
    say Да я и сам вижу, что из Вятичей.
  break
  case 4
    say Да я и сам вижу, что из Велян.
  break
  case 5
    say Да я и сам вижу, что из Древлян.
  break
  default
    say Да я и сам вижу, что не наших кровей.
  break
done
say Тут вот какая проблема у меня, отец поручил воды набрать. 
say Не поможешь?
attach 93603 %self.id% 
detach 93602 %self.id%
~
#93603
первый квест~
0 d 1
да помогу~
say Вот дал отец два ведра. Одно восемь литров, одно пять.
say Нужно набрать в пятилитровое ведро один литр.
say Как это сделать - никак не соображу...
wait 1
mload obj 93601
mload obj 93602
дать все.ведр .%actor.name%
say может ты разберешься.
attach 93604 %self.id%
detach 93603 %self.id%
~
#93604
сыну дали предмет~
0 j 100
~
if %object.vnum% != 93601
  say Зачем мне эта дрянь?
  return 0
  halt
end
set water %object.val1%
wait 1
mpurge %object%
if %water% != 1
  say Так я и думал, что ничего не получится...
else 
  say Ты смог!
  say Спасибо, отблагодарить только нечем мне тебя!
  дум
  say Хотя... вот есть у меня штучка одна...потерял ее этот...как его...
  wait 3
  эм начал рыться по карманам штанов
  say Вот она! 
  рад
  эм достал откуда-то из штанов что-то
  wait 1 
  say Если отнесешь это ему... как его.. забыл... будь он не ладен
  кирпич
  say Ну, да ты и сам знаешь, короче кому!
  say Так вот он обрадуется и точно тебя наградит!
  mload obj 93603
  дать штуч .%actor.name%
end
~
#93605
умер конокрад~
0 f 100
~
if (%world.curobjs(93604)% < 4) && (%random.15% <= 2)
  mload obj 93604
end
~
#93606
конокрад в бою~
0 k 15
~
wait 1
г Почему не на лошадках? Что мне воровать прикажете?
~
$~
