#28500
киллмедведь~
0 f 100
~
if (%random.30%==1) && (world.curobjs(28500)<2)
  mload obj 28500
end
~
#28501
киллвожак~
0 f 100
~
if (%random.30%==1) && (world.curobjs(28501)<2)
  mload obj 28501
end
~
#28502
встречараненный~
0 r 100
~
wait 1
осм
say Будь осторожнее, %actor.name%!
say Половцы внезапно перешли Днепр и напали на прибрежные поселения.
say Где-то рядом у них расположен лагерь, да и разведчики их вокруг шныряют.
тревога
~
#28503
киллящерица~
0 f 100
~
if (%random.80%==1) && (world.curobjs(28503)<20)
  mload obj 28503
end
~
#28504
киллворона~
0 f 100
~
if (%random.90%==1) && (world.curobjs(28504)<20)
  mload obj 28504
end
~
#28505
Подквест "нападение половцев"~
0 q 100
~
wait 1
*%actor.wait(4)%
foreach char %self.pc%
  if %char.haveobj(11407)% && !%char.quested(27015)%
    %char.wait(4)%
    %char.setquest(27014)%
    say А ну, стой!
    рыч
    say Половцы перешли реку и готовы напасть на наши селения! А ты тут бродишь по полям!
    руг .%char.name%
    say Это еще что у тебя?!
    msend %char% Ополченец выхватил мешок у вас из рук.
    mechoaround %char% Ополченец выхватил мешок из рук %char.name%.
    mforce %char% drop questitem11401
    mpurge questitem11401
    say Наш%char.y% чем заниматься! Бери оружие и в бой! Надо дать отпор половцам!
    say Твое барахло я верну не раньше, чем увижу бунчук их сотника!
    halt
  end
done
~
#28506
Сдали бунчук ополченцу~
0 j 100
~
wait 1
if %object.vnum% != 28021
  drop %object.name%
  halt
end
wait 1
mpurge %object%
if !%actor.quested(27014)%
  drop бунчук
  halt
end
челю
say Как видно, ты чего-то все же стоишь...
say Ладно, так и быть, забирай свой мешок и проваливай!
ворч
say Но иди осторожно - в округе могли остаться половецкие лазутчики!
%actor.unsetquest(27014)%
%actor.setquest(27015)%
mload obj 11407
дать мешок .%actor.name%
бросить мешок
~
$~
