* BRusMUD trigger file v1.0
#91700
мужик умер~
0 f0 100
~
mecho Мужик злобно зарычал и перекинулся в большого черного волка.
mload mob 91702
mpurge %self.id%












~
#91701
огненный хранитель в бою 1~
0 k0 100
~
if %random.12% == 1
   eval target %random.pc% 
   dg_cast 'огнен шар' %target.name%
   unset %target%
else
if %random.7% == 1
   eval target %random.pc% 
   dg_cast 'огнен пото' %target.name%
   unset %target%
end
* не могу понять почему  огненный поток не кастится, может вы разберетесь












~
#91702
Гамаюн в бою 1 ~
0 k0 100
~
if %random.7% == 1
   mecho Гамаюн создала огненного защитника!
   mload mob 91718
detach 91702 %self.id%
end












~
#91703
Гамаюн в бою 2~
0 k0 100
~
if %random.21% == 1
   mecho Гамаюн создала огненного защитника!
   mload mob 91718
detach 91703 %self.id%
end












~
#91704
Гамаюн в бою 3~
0 k0 100
~
if %random.63% == 1
   mecho Гамаюн создала огненного защитника!
   mload mob 91718
detach 91704 %self.id%
end












~
#91705
умер тур~
0 f0 100
~
if (%world.curobjs(91702)% < 6) && (%random.7% == 1)
      mload obj 91702
elseif (%world.curobjs(91703)% < 6) && (%random.6% == 1)
      mload obj 91703
elseif (%world.curobjs(91704)% < 6) && (%random.5% == 1)
      mload obj 91704
end












~
#91706
умер волк~
0 f0 100
~
if (%world.curobjs(91707)% < 6) && (%random.5% == 1)
   mload obj 91707
end












~
#91707
умер змей~
0 f0 100
~
if (%world.curobjs(91705)% < 6) && (%random.5% == 1)
   mload obj 91705
end












~
#91708
умер грифон~
0 f0 100
~
if (%world.curobjs(91706)% < 6) && (%random.5% == 1)
   mload obj 91706
end












~
#91709
умер василиск~
0 f0 100
~
if (%world.curobjs(91708)% < 5) && (%random.5% == 1)
   mload obj 91708
end












~
#91710
вошли к Гамаюн~
0 q0 100
~
wait 1s
say Здраве будь %actor.name%
wait 2s
say Ничего от тебя я не скрою.
say Все что знаю - поведаю.
wait 2s
say Победил ты сынов Виевых.
say Горыню, Усыню с Дубынею.
wait 2s
say Не простили они поражения.
say Обернулись они в чуда юдища.
say В страшных змеев многоголовых.
wait 2s
say И втроем караулят тебя на мосту.
say Что ведет через реку Смородину.
wait 2s
say Коли прямо к ним по мосту ты пойдешь.
say Сложишь там  свою буйну головушку.
detach 91710 %self.id%










~
#91711
перезарядка посоха грома~
1 c0 1
зарядить~
attach 91815 %self.id%
eval damag %random.90% + %random.90% + %random.90% + %random.90% +150

switch (%actor.class%)
   case 0
   case 1
   case 10
      eval rdam %damag%+10
   break
   case 3
   case 5
      eval rdam %damag%*2
   break
   default
      eval rdam %damag%*2/3
   break
done

osend %actor% Посох начал вбирать в себя Вашу жизненную силу!
   if %actor.level%<28
        eval rdam %actor.hitp%+11
        osend %actor% Вы не смогли справится с властью посоха!
        oechoaround %actor% Посох выпил всю жизненную силу %actor.rname%!
   odamage %actor% %rdam%
   end


   if %actor.hitp%>%rdam%
   odamage %actor% %rdam%
   else
   odamage %actor% %actor.hitp%
   end
eval  waitt 150+%random.100%
wait %waitt%s

osend %actor% Гранат на посохе слегка засветился!

eval damag %rdam%-%random.90%
   if %actor.hitp%>%damag%
osend %actor% Посох вобрал в себя часть Вашей жизненой силы!
   odamage %actor% %damag%
   else
   osend %actor% Посох вытянул из Вас почти всю жизненную силу!
   odamage %actor% %actor.hitp%
   end
eval  waitt 150+%random.100%
wait %waitt%s

osend %actor% Гранат на посохе сильно засветился!
eval rdam %damag%-%random.90%
   if %actor.hitp%>%rdam%
   osend %actor% Посох вобрал в себя часть Вашей жизненой силы!
   odamage %actor% %rdam%
else
   osend %actor% Посох вытянул из Вас почти всю жизненную силу!
   odamage %actor% %actor.hitp%
end
eval  waitt 150+%random.100%
wait %waitt%s

osend %actor% Гранат на посохе ярко вспыхнул и погас!
detach 91815 %self.id%

otransform 91709







~
$
$
