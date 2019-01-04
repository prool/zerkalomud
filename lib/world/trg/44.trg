#4400
приветствие 1~
0 q 100
~
if !(%exist.mob(4420)%)
   halt
end
wait 1
*if %actor.quested(4401)%
*    msend %actor% - Здраве тебе, %actor.name%!  
*    msend %actor% - Вот жду не дождусь, когда ты мне поможешь!
*  halt
*end
msend %actor% - Здраве тебе, %actor.name%!
msend %actor% - Нечасто бывают у меня здесь гости.
msend %actor% Старик тяжело вздохнул.
if !%questor44%
   msend %actor% - Но коль уж забрел%actor.g% ты сюда - не откажи в помощи старику.
   attach 4401 %self.id%
*   attach 4405 %self.id%
*   detach 4400 %self.id%
end
~
#4401
Выдача самого квеста~
0 d 1
конечно помогу слушаю~
if %actor.vnum% != -1 || !(%exist.mob(4420)%)
*|| (%questor44%) || !(%exist.mob(4420)%)
   halt
end
wait 1
if %questor44% 
  if %questor44sex% == 1
     say Я уже просил тут помочь одного молодца, %questor44tname% кличут, так вот найди его, передай, что нехорошо старых обманывать.
     wait 1
     say Обещал помочь и сгинул, бахвалился, что разбойничков не боится, а ишь как, струсил наверно.
     halt
  else
     say Я уже просил тут помочь одну браву девицу, %questor44tname% кличут, так вот найди ее, передай, что нехорошо старых обманывать.
     wait 1
     say Обещала помочь и сгинула, бахвалилась, что разбойничков не боится, а ишь как, струсила наверно. Пусть детей рожает, а не подвиги ратные совершает.
     halt
  end
  
end 
*if %actor.quested(4401)% 
*  msend %actor%  Я тебя уже просил о помощи, и вот жду до сих пор.
*  вздох
*  halt
*end
makeuid questor44 %actor.id%
global  questor44
eval questor44tname %actor.tname%
global  questor44tname
eval questor44sex %actor.sex%
global  questor44sex
msend %actor% - Есть в лесу святое место, там, - старик махнул рукой на север.
msend %actor% Предки наши ходили туда поклониться Богам, принести свои дары им.
msend %actor% Нет-нет, и теперь ходят.
msend %actor% - Но осквернили погост лихие люди, теперь уж и тропинка туда заросла.
msend %actor% Разбойничают, честному люду проходу не дают. Душегубы проклятые.
msend %actor% Старик разгневанно помахал кулаком...
wait 2s
msend %actor% - А недавно приходил один, большой такой, одноглазый, совета просил,
msend %actor%   золото предлагал. Только ведаю я - нечистое это золото, ох, нечистое.
msend %actor%   Кровь и беды лежат на нем.
msend %actor% - Прогнал я его, а он посмотрел так зло, но ничего не сказал, ушел восвояси.
msend %actor% - Я уже старик, мне бояться нечего, а вот других - жалко.
msend %actor% - Негоже мне вмешиваться в дела мирские, а ты еще молод, да и есть в тебе
msend %actor%   что-то такое, вижу, что найдешь в себе силы справиться с этим злом.
if (%actor.sex% == 1)
   msend %actor% - Ступай, сынок, очисти святое место от этого недостойного человека...
elseif 
   (%actor.sex% == 2)
   msend %actor% - Ступай, дочка, освободи землю от сей непосильной ноши...
elseif
   msend %actor% - Ступай, принеси мне его труп.
end
msend %actor% - Старик воздел глаза к небу и что-то прошептал...
dg_cast 'освящение' %actor.name%
*%actor.setquest(4401)%
attach 4402 %self.id%
*detach 4401 %self.id%
~
#4402
Оплата квеста~
0 j 100
~
return 0
set itemname %object.iname%
msend %actor% Вы показали %self.dname% %itemname%.
if (!%questor44% || !(%questor44.id% == %actor.id%))
msend %actor% - Спасибо, но зачем мне это ?
msend Старик ласково улыбнулся.
брос %object.name%
halt
end
if (!%itemname.contains(главаря разбойников)%)
msend %actor% - Нет у меня в этом нужды, %actor.name%.
msend %actor% Старик беспомощно пожал плечами.
halt
end
return 1
wait 1
if !%killer44% || !(%killer44.id% == %questor44.id%)
msend %actor% - Не к лицу тебе, %actor.name%, присваивать чужие дела !
msend %actor% Старик гневно посмотрел на Вас и топнул ногой.
брос %object.name%
halt
end
mpurge труп.глав
wait 2s
if (%actor.sex% == 1)
msend %actor% - Спасибо, сынок, что не отказал в моей просьбе.
msend %actor% Старик пожал Вам руку.
elseif
(%actor.sex% == 2)
msend %actor% - Спасибо тебе, дочка, уважила старика.
msend %actor% Старик ласково погладил Вас по волосам.
else
msend %actor% - Спасибо тебе, %actor.name%, помог ты всем своим делом.
msend %actor% Старик низко поклонился Вам.
end
unset questor44
unset questor44tname
unset questor44sex
unset killer44
switch %actor.class%
case 0
mspellturn %actor.name% освящение set
break
case 1
mspellturn %actor.name% шаров.молн set
break
case 6
mspellturn %actor.name% длит.молч set
break
case 7
mspellturn %actor.name% оцепенение set
break
case 8
mspellturn %actor.name% сеть set
break
case 9
mskillturn %actor.name% лидерство set
break
case 12
mspellturn %actor.name% насыщение set
break
case 13
if ((%random.2% == 1) & (%world.curobjs(214)% < 50))
mload obj 214
дать рун %actor.name%
end
break
default
break
done
eval rnd %random.100%
if %rnd% < 4
mload obj 4413
дать свиток %actor.name%
elseif %rnd% < 7
mload obj 4411
дать береста %actor.name%
elseif %rnd% < 10
mload obj 4412
дать свиток %actor.name%
elseif (%rnd% < 30) & (%world.curobjs(4407)% < 30)
mload obj 4407
дать тесак %actor.name%
else
msend %actor% Старик дал Вам немного денег.
%actor.gold(+500)%
end
%actor.setquest(4400)%
detach 4402 %self.id%
halt
~
#4403
Убит главарь~
0 f 100
0~
if (%actor.vnum% == -1)
   makeuid killer44 %actor.id%
   calcuid questor 4417 mob
   remote  killer44 %questor.id%
end
return 1
   
~
#4404
Обновление переменных~
2 f 100
~
calcuid questor 4417 mob
if %questor%
   attach  4400      %questor.id%
   detach  4401      %questor.id%
   detach  4402      %questor.id%
   detach  4405      %questor.id%
   rdelete questor44 %questor.id%
   rdelete questor44tname %questor.id%
   rdelete questor44sex %questor.id%
   rdelete killer44  %questor.id%
end
~
#4405
приветствие 2~
0 q 100
~
wait  1
mecho Старик одарил Вас приветливой улыбкой.
~
$~
