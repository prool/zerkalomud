#7600
приветствие лесничего~
0 r 100
~
wait 1
if %questor76% == %actor.id%
  say %actor.name%, ты уже выполнил мою просьбу?
  вопр
  halt
end
if %questor76%
  halt
end
wait 1s
say Приветствую тебя, %actor.name%!
ул
say Не сможешь ли ты мне помочь?
~
#7601
соглашаемся помочь лесничему~
0 d 0
могу смогу~
wait 1s
set questor76 %actor%
global  questor76
say Чудесно! Вот, послушай.
say Было хорошо, значиться, в лесу-то моем. Птички, цветочки. Было, да быльем поросло!
say Поселился у нас кто-то и с тех пор лес не тот, что раньше.
взд
say Зверья мало стало, деревья погибают...! Им же жить надо!
wait 1s
say Попробуй отыскать виновников этой беды да образумить... да чтоб кровь не проливать!
say А я уж в долгу не останусь...
wait 1s
if ((%actor.realroom% == %self.realroom) && (%actor.canbeseen%))
  эм задумчиво поскреб в бороде
  dg_cast 'защита' %actor.name%
  wait 1s
  say Вот, это единственные чары, которые я могу на тебя наложить...
end
say А теперь ступай!
detach 7601 %self.id%
~
#7602
лезем в кусты~
2 c 1
лезть пролезть~
if !%arg.contains(кусты)%
  wsend %actor% _Куда лезем?
  halt
end
wait 1
%actor.wait(2)%
wsend %actor% Вы полезли в кусты...
wechoaround %actor% _%actor.name% полез%actor.q% в кусты. Ну точно, чокнут%actor.w%!
wteleport %actor% 7663 horse
wait 1s
wsend %actor% ...и вылезли на какой-то поляне.
~
#7603
лезем обратно~
2 c 0
лезть пролезть~
if !%arg.contains(кусты)%
  wsend %actor% _Куда лезем?
  halt
end
wait 1
%actor.wait(2)%
wsend %actor% Вы полезли в кусты...
wechoaround %actor% _%actor.name% полез%actor.q% в кусты.
wait 2s
wteleport %actor% 7662 horse
wsend %actor% ...и вылезли на какой-то поляне.
~
#7604
получаем награду~
0 d 1
да выполнил выполнила сделал сделала готово угу~
wait 1
if (%questor76.id% != %actor.id%)
  halt
end
if %exist.mob(7609)% || %exist.mob(7610)% || %exist.mob(7611)% || %exist.mob(7612)%
  wait 1s
  say Что-то подсказывает мне, что ты врешь! 
  эм отвернулся от Вас
  halt
end 
if !%exist.obj(7610)%
  wait 1s
  взд
  say Отлично! Молодец! Ты спас наш лес, и это не пустые слова!
  wait 1s
  eval chance %random.100%
  if ( %chance% < 20 ) && ( %world.curobjs(7607)% < 4 )
    mload obj 7607
    г Возьми мой старый посох, с ним ты не потеряешся даже самой темной ночью.
    дат посох %actor.name%
  elseif ( %chance% < 40 ) && ( %world.curobjs(7614)% < 4 )
    say Забирай мои перчатки, с ними ты даже без оружия будешь раскидывать своих врагов.
    mload obj 7614
    дать перчат .%actor.name%
  elseif ( %chance% < 60 ) && ( %world.curobjs(7615)% < 4 )
    say Прими в дар этот топор, наверное его в лесу позабыл дровосек, вот я и прихватил..
    mload obj 7615
    дать топор .%actor.name%
  else
    %self.gold(+300)%
    дат 300 кун %actor.name%
  end
else
  say Жаль, что не удалось избежать кровопролития... Ну уж как вышло.
end
wait 1s
say Давай-ка глянем, как бы наградить тебя.
wait 1s
say Ты, верно, понял%actor.g% - не всегда я простым лесничим был да за лесом следил.
say Был я некогда воем дружинным - служил в самом славном Новгороде.
say А стар стал - поселился тут лесником.
wait 2
switch %actor.class%
  case 2
    say Научу я тебя воинской хитрости одной, в честной битве может и не сгодится
    say Но вот караульного тихо убрать, так чтоб и крикнуть не успел - это да.
    mskillturn %actor% подножка set
  break
  case 3
    say Научу я тебя удару особому, против которого никто не устоит!
    mskillturn %actor% богатырский.молот set
  break
  case 4
    say Научу я тебя как зелье составить, так что даже и малая рана от оружия твоего насмерть разить будет.
    mskillturn %actor% отравить set
  break
  case 5
    say Научу я тебя, как в бою от хитростей вражьей и магии злой защищаться.
    mskillturn %actor% осторожный.стиль set
  break
  case 9
    say Научу я тебя мечом владеть так, чтоб с одного удара мог недругу голову снять!
    mskillturn %actor% точный.стиль set
  break
  case 10
    say Научу я тебя, как друзей да воинов своих в бою и походе вести без потери и с легкостью.
    mskillturn %actor% лидерство set
  break
  case 11
    say Научу я тебя удару, после которого супротивник твой не сразу и вспомнит, кто он, да откуда родом.
    mskillturn %actor% оглушить set
  break
  case 12
    say Научу я тебя, как нож да копье в ворога метать следует, так что, бывает, боле и стараться не придется.
    say Коли попадешь верно.
    ул
    mskillturn %actor% метнуть set
  break
done
mechoaround %actor% Старик-лесничий дал %actor.dname% несколько наставлений по боевому искуству.
msend %actor% Старик-лесничий дал вам несколько наставлений по боевому искуству.
unset questor76
detach 7601 %self.id%
detach 7600 %self.id%
detach 7604 %self.id%
~
#7605
зашли к цыганам~
0 q 100
~
wait 1s
mecho _Усатый цыган раздраженно пнул сломанную телегу.
wait 1s
г Какая-то тварь ночью утащила чеку из колеса 
г Теперь не можем уехать из этих дебрей!
упрек
detach 7605 %self.id%
~
#7606
усатому дали ось~
0 j 100
~
wait 1
if (%object.vnum% != 7610)
  г И не стыдно мусор совать честным людям?
  ухм
  halt
end
wait 1
mpurge %object%
благ
wait 1s
г Наконец-то мы покинем этот чертов лес!
wait 1s
eval chanse %random.100%
if ( %chanse% < 40 ) && ( %world.curobjs(512)% < 1 )
  say Возьми вот эту книжку, прихватили в каком-то селе, да нам она без надобности.
  mload obj 592
  дать книг .%actor.name%
elseif ( %chanse% < 55 ) && ( %world.curobjs(4413)% < 1 )
  say Возьми вот этот свиток, нашли как-то по пути, да купец тот все равно читать не умел.
  mload obj 4413
  дать свит .%actor.name%
else
  say Возьми, вот, за помощь.
  %self.gold(+150)% 
  give 150 кун .%actor.name%
end
wait 1s
mecho _Цыгане шумно собрали телегу, запрягли коней и унеслись прочь.
exec 7607 %world.mob(7609)%
exec 7607 %world.mob(7610)%
exec 7607 %world.mob(7612)%
mteleport %self% 7699
сня все
mjunk all
wait 1
mpurge %self%
~
#7607
цыгане пуржатся~
0 z 100
~
mteleport %self% 7699
сня все
mjunk all
wait 1
mpurge %self%
~
#7608
репоп тригов~
2 f 100
~
calcuid star 7600 mob
detach 7600 %star%
detach 7601 %star%
detach 7604 %star%
attach 7600 %star%
attach 7601 %star%
attach 7604 %star%
calcuid us 7611 mob
detach 7605 %us%
detach 7606 %us%
attach 7605 %us%
attach 7606 %us%
~
#7609
Убит омутник~
0 f 100
~
if %random.1000% <= 300
  %load% obj 517
end
~
#7610
Залезли на дерево~
2 e 100
~
wsend %actor% Большой черный ворон внимательно смотрит на ваши попытки залезть на дерево.
wsend %actor% Когда ваша рука дотянулась до ветки, на которой он сидел,
if (%random.100% < 34)
  wsend %actor% вместо того что бы улететь, ворон хрипло каркнул и внезапно клюнул вас по пальцу.
  wsend %actor% Скорее от неожиданности, чем от боли, вы отпустили ветку и со сдавленным криком полетели вниз.
  eval buf %actor.hitp(-10)%
  wteleport %actor% 7644
  return 0
  wat 7644 wechoaround %actor.name% %actor.name% со сдавленным воплем упал%actor.g% сверху.
else
  wsend %actor% ворон недовольно каркнул, испражнился на Вас и перелетел на соседнее дерево.
end
~
$~
