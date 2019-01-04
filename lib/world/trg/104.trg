#10400
<104 - PC enter to Kupchikha>~
0 h 100
~
if %self.fighting%
  halt
end
wait 1
set  pc %self.people%
set  men 0
while %pc%
  if %pc.vnum% == -1
    if     %pc.sex% == 1
      makeuid men %pc.id%
    elseif %pc.sex% == 2
      mecho - Ах ты подлая разлучница, сейчас я тебе покажу, - закричала 
      mecho купчиха и вцепилась %pcr.dname% в волосы.
      attack %pc.name%
      halt
    end
  end
  set pc %pc.next_in_room%
done
if %men%
  mecho - Заходи, %actor.name%, приляг, отдохни с дороги дальней, - сказала 
  mecho купчиха, указав на кровать.
end
~
#10401
<104 - Kupchikha killed>~
0 f 100
~
mload obj 10401
if (%world.curobjs(10405)% < 1) && (%random.100% <= 5)
  mload obj 10405
end
if %actor.vnum% == -1
  calcuid room     10427 room
  attach  10409 %room.id%
  exec    10409 %room.id%
  detach  10409 %self.id%
  calcuid Merchant 10419 mob
  if %Merchant%
    makeuid Killer %actor.id%
    global  Killer
    remote  Killer %Merchant.id%
  end
end
~
#10402
<104 PC enter to Svakha>~
0 h 100
~
if %self.fighting%
  halt
end
wait 1
set  men   0
set  women 0
set  pc %self.people%
while %pc%
  if %pc.vnum% == -1
    if     %pc.sex% == 1
      makeuid men %pc.id%
    elseif %pc.sex% == 2
      if %random.100% < 30
        mecho - Так ты решила всех женихов отбить у нашей лебедушки, на, получай, - закричала
        mecho сваха и бросилась на %pc.vname%.
        attack %pc.name%
        halt
      end
      makeuid women %pc.id%
    end
  end
  set pc %pc.next_in_room%
done
if     %women%
  mecho - Ступай отсюда, %women.name%, не смей отбивать женихов у нашей молодушки, пока 
  mecho я тебе все патлы не повыдергивала, - зло закричала сваха.
elseif %men%
  mecho - Заходи, милок, глянь на нашу молодушку, на нашу лебедушку, ждет она тебя в 
  mecho - опочивалинке, ступай к ней, не томи ее душу - елейно протянула сваха.
end
~
#10403
<104 - Svakha killed>~
0 f 100
~
if (%world.curobjs(10405)% < 10)
end
~
#10404
<104 PC enter to Kumushka>~
0 h 100
~
wait 1
if %self.fighting%
  halt
end
set men   0
set women 0
set pc %self.people%
while %pc%
  if %pc.vnum% == -1
    if     %pc.sex% == 1
      makeuid men %pc.id%
    elseif %pc.sex% == 2
      makeuid women %pc.id%
    end
  end
  set pc %pc.next_in_room%
done
if     %women%
  mecho - Шла бы ты, девонька, от греха подальше, а то увидит сваха,
  mecho - а хуже того - хозяйка - не сдобровать, - сердобольно начала кумушка.
elseif %men%
  mecho - А вот и купец на наш товар, - радостно объявила кумушка.
  mecho - Ступай скорей к нашей молодушке, нашей лебедушке, ждет она тебя,
  mecho - не дождется, все глазоньки просмотрела в окошко глядючи.
end
~
#10405
<104 - Kumushka killed>~
0 f 100
~
if (%world.curobjs(10405)% < 10)
end
~
#10406
<104 - PC open cofr>~
1 p 100
~
wait 1s
oload  mob 10410
osend  %actor% Откуда ни возьмись появился приказчик, и с криком "Держи вора" накинулся на
osend  %actor% Вас.
oechoaround  %actor% Откуда ни возьмись появился приказчик, и с криком "Держи вора" накинулся на
oechoaround  %actor% %actor.vname%.
oforce приказчик attack %actor.name%
detach 10406 %self.id%
~
#10407
<104 command LAY BAD>~
2 c 0
лечь прилечь спать~
if %actor.vnum% != -1
  halt
end
if !%arg.contains(кровать)% && !%arg.contains(постель)%
  halt
end
wait 1
wsend       %actor% Кровать повернулась на петлях и Вы упали глубоко вниз...
wechoaround %actor% Кровать повернулась на петлях и %actor.name% провалил%actor.u%...
set  hitdec %actor.hitp%
eval hitdec %hitdec%/4
wdamage     %actor% %hitdec%
wteleport   %actor% 10427
~
#10408
<104 Merchant recive eat>~
0 j 100
~
return 0
if %actor.vnum% != -1
  halt     
end
if %actor.id% != %Killer.id%
  halt
end
if %object.type% != 19
  halt
end
return 1
wait   1
mecho  ___Спасибо тебе, %actor.name%, спас ты меня от голодной смерти.
%actor.exp(+200000)%
mesend %actor%  Вы получили 200000 очков опыта.
wait 1
mpurge %object%
mpurge %self%
~
#10409
<104 Virtual load Merchant>~
2 x 100
~
return 0
wload  mob 10419
~
$~
