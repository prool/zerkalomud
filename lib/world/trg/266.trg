* BRusMUD trigger file v1.0
#26600
Охотник просит грибочки~
0 r0 100
~
say Здраве буде, вам.
say Я - мирный охотник - живу здесь уже много лет, заготовляю себе мясо, травы, грибы.
say Но вот недавно нашел я книгу своей бабки, в которой рассказывается про
say грибной отвар вкуса неведанного. Но для него нужен гриб, растущий в пещерах в горах,
say а одному мне идти туда очень опасно. Быть может, ты принесешь мне его ?


~
#26601
Согласие~
0 d0 0
да согласен~
say Отлично, я так и знал, что ты мне поможешь.
detach 26600 %self.id% 
attach 26602 %self.id%


~
#26602
Охот берет гриб~
0 j0 100
~
if %object.vnum% != 26600
  хму
 wait 1s 
  say На что мне это ?
 бро все
 halt
 end 
 say я так и знал что ты мне поможешь
 say прими это в награду от меня
  %self.gold(+2000)%
д 2000 кун %actor%
  if (%actor.class%==10) & (%actor.skill(допол)% < 121)
  say %actor.name%, Вижу я, ты тоже охотник.
  say  Поделюсь я с тобой одним секретом, как выжить в бою с зверем гораздо сильнее тебя.
  say  Всего - то нужно уметь выпускать по нескольбко стрел за раз.
  say  Вот так - смотри.
   mskilladd %actor% допо 20
   end
detach 26602 %self.id%

~
#26603
рвем гриб~
2 c0 0
сорвать рвать ~
if !%arg.contains(гриб)% 
  wsend %actor.name% что рвем-то ?
 halt
else if 
  wsend  %actor% Вы сорвали красный грибочек.
 wechoaround %actor% %actor.name% сорвал красный гриб.
 wload obj 26600
  detach 26603 %self.id%
end



~
#26604
Бъем стену~
2 c0 0
ударить бить выбить~
if !%arg.contains(стен)%
  wsend %actor.name% Куда бьем-то ?
halt
end
  wsend %Actor% навалившись на стену, вы выбили ее.
  wechoaround %actor% %actor.name% выбил стену мощным ударом плеча.
wdoor 26659 south flags a
wdoor 26659 south room 26661
wdoor 26661 north flags a
wdoor 26661 north room 26659
detach 26604 %self.id%



~
#26605
reset~
2 f0 100
~
wdoor 26659 south  purge
wdoor 26661 north  purge
calcuid room 26659 room
attach 26604 room
calcuid room 26663 room
attach 26603 room
calcuid mob 26602 mob
attach 26601 %mob.id%
attach 26600 %mob.id%
detach 26602 %mob.id%


~
#26606
крылан в бою~
0 k0 100
~
dg cast !выс ж!


~
#26607
Дразним хозяина~
0 c0 0
дразнить злить~
if !%arg.contains(хозяин)%
  halt
end
  убить %actor.name%

~
#26608
убили господина горных дорог~
0 f0 100
~
if (%world.curobjs(26602)% < 5) && (%random.20% <= 2)
   mload obj 26602
end

~
#26609
убили каменного истукана~
0 f0 100
~
if (%world.curobjs(26601)% < 5) && (%random.20% <= 2)
   mload obj 26601
end

~
#26610
убили хозяина лесных троп~
0 f0 100
~
if (%world.curobjs(26603)% < 5) && (%random.20% <= 2)
   mload obj 26603
end

~
#26611
убили хозяйку гатей~
0 f0 100
~
if (%world.curobjs(26604)% < 5) && (%random.20% <= 2)
   mload obj 26604
end

~
#26612
убили крылана~
0 f0 100
~
if (%world.curobjs(26605)% < 5) && (%random.20% <= 2)
   mload obj 26605
end

~
$
$
