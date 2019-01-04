#47700
reset~
2 f 100
~
calcuid reset 47702 mob
detach 47721 %reset.id%
detach 47722 %reset.id%
detach 47723 %reset.id%
detach 47724 %reset.id%
attach 47721 %reset.id%
attach 47722 %reset.id%
calcuid reset 47734 mob
detach 47728 %reset.id%
detach 47729 %reset.id%
detach 47730 %reset.id%
attach 47728 %reset.id%
~
#47701
шмот садовник~
0 n 100
~
if (%world.curobjs(47717)% < 6) && (%random.5% == 1)
  mload obj 47717
elseif (%world.curobj(47718)% < 6) && (%random.5% == 1)
  mload obj 47718
end     
~
#47702
шмот лучник~
0 n 100
*~
if (%world.curobjs(47708)% < 6) && (%random.5% == 1)
  mload obj 47708
end     
if (%world.curobjs(47703)% < 6) && (%random.5% == 1)
  mload obj 47703
end
if (%world.curobjs(47704)% < 6) && (%random.5% == 1)
  mload obj 47704
end     
if (%world.curobjs(47705)% < 6) && (%random.5% == 1)
  mload obj 47705
end     
~
#47703
шмот мечник~
0 n 100
*~
if (%world.curobjs(47709)% < 6) && (%random.5% == 1)
  mload obj 47709
end     
if (%world.curobjs(47703)% < 6) && (%random.5% == 1)
  mload obj 47703
end
if (%world.curobjs(47704)% < 6) && (%random.5% == 1)
  mload obj 47704
end     
if (%world.curobjs(47705)% < 6) && (%random.5% == 1)
  mload obj 47705
end     
~
#47704
шмот бтр~
0 n 100
~
if (%world.curobjs(47710)% < 6) && (%random.5% == 1)
  mload obj 47710
end
~
#47705
шмот друж~
0 n 100
*~
if (%world.curobjs(47703)% < 6) && (%random.5% == 1)
  mload obj 47703
end
if (%world.curobjs(47706)% < 6) && (%random.5% == 1)
  mload obj 47706
end     
if (%world.curobjs(47707)% < 6) && (%random.5% == 1)
  mload obj 47707
end     
~
#47706
шмот резчик~
0 f 100
~
if (%world.curobjs(47712)% < 6) && (%random.5% == 1)
  mload obj 47712
end
~
#47707
шмот стражник~
0 n 100
*~
if (%world.curobjs(47713)% < 6) && (%random.5% == 1)
  mload obj 47713
end
if (%world.curobjs(47714)% < 6) && (%random.5% == 1)
  mload obj 47714
end     
if (%world.curobjs(47715)% < 6) && (%random.5% == 1)
  mload obj 47715
end     
if (%world.curobjs(47716)% < 6) && (%random.5% == 1)
  mload obj 47716
end     
~
#47708
шмот охранник~
0 n 100
~
if (%world.curobjs(47711)% < 6) && (%random.5% == 1)
  mload obj 47711
end
~
#47709
шмот крест~
0 n 100
*~
if (%world.curobjs(47723)% < 6) && (%random.5% == 1)
  mload obj 47723
end
if (%world.curobjs(47724)% < 6) && (%random.5% == 1)
  mload obj 47724
end     
if (%world.curobjs(47725)% < 6) && (%random.5% == 1)
  mload obj 47725
end          
~
#47710
шмот вожак~
0 n 100
~
if (%world.curobjs(47721)% < 6) && (%random.5% == 1)
  mload obj 47721
end
~
#47711
шмот зверя~
0 n 100
~
if (%world.curobjs(47722)% < 6) && (%random.5% == 1)
  mload obj 47722
end
~
#47712
шмот хозяюки~
0 n 100
~
if (%world.curobjs(47720)% < 6) && (%random.5% == 1)
  mload obj 47720
end
~
#47713
шмот краснописца~
0 n 100
~
if (%world.curobjs(47719)% < 6) && (%random.5% == 1)
  mload obj 47719
end
~
#47714
шмот дух~
0 f 100
~
if (%world.curobjs(47726)% < 6) && (%random.5% == 1)
  mload obj 47726
end
~
#47715
шмот ожившего палача~
0 o 100
~
if (%world.curobjs(47726)% < 6) && (%random.5% == 1)
  mload obj 47727
end
~
#47716
шмот теней~
0 n 100
~
if (%world.curobjs(47728)% < 6) && (%random.5% == 1)
  mload obj 47728
end
~
#47717
шмот колдуньи~
0 n 100
*~
if (%world.curobjs(47729)% < 6) && (%random.5% == 1)
  mload obj 47729
end
if (%world.curobjs(47730)% < 6) && (%random.5% == 1)
  mload obj 47730
end
if (%world.curobjs(47731)% < 6) && (%random.5% == 1)
  mload obj 47731
end
~
#47718
черный ворон рип~
0 f 100
~
mecho Черный ворон подхватил Вас на своих крыльях и понес куда-то вдаль
mecho Вы очнулись в какой-то яме, но тут ворон перед заговорил человеческим голосом
mecho -Ты умрешь в этих местах, человек!
calcuid riproom 47738 room
calcuid ravenroom 47732 room
exec 47727 %ravenroom.id%
exec 47726 %riproom.id%
~
#47719
лезть вверх~
2 c 100
лезть~
if !%arg.contains(вверх)%
  wsend %actor% Куда лезем?
  halt
else 
  wsend %actor% Вы полезли вверх цепляясь за корни деревьев
  wechoaround %actor.name% %actor.name% полез наверх, цепляясь руками за корни деревьев
  wteleport %actor% 47740
end
~
#47720
лезем в нору~
2 c 100
лезть~
if !%arg.contains(нора)%
  wsend %actor% Куда лезем?
  halt
else 
  if (%actor.realroom% == 47768)
    wsend %actor% Вы пролезли в нору
    wechoaround %actor.name% %actor.name% полез в нору
    wteleport %actor% 47780
    halt
  end
  if (%actor.realroom% == 47780)
    wsend %actor% Вы вылезли из норы
    wechoaround %actor.name% %actor.name% вылез из норы
    wteleport %actor% 47768
    halt
  end
end
~
#47721
квест хозяин~
0 q 100
~
wait 1s
г Здраве буде добрый молодец
г Коли не с оружием ко мне в хоромы пришел, а с добрым помыслом
г Не откажи мне в помощи
~
#47722
квест хозяин помогу~
0 d 100
помогу~
wait 1s
detach 47721 %self.id%
г Ой спасибо добрый молодец, но ты даже не знаешь, что я от тебя хочу!
г Не уж то не терпится сложить свою головушку в схватке с отродьем нечеловеческим?
set quest477 %actor%
global quest477
attach 47723 %self.id%
~
#47723
квест хозяин расскажи~
0 d 100
расскажи~
detach 47722 %self.id%
wait 1
г Была у меня сестра, красотою не обделенная, глаз не оторвать
взд
wait 1s
г Любил я ее сильно
рыд
wait 1s
г Но вот однажды пропала она, была-была и нету, как в пустоте растворилась
г Люди разное говорят, но все увидали тогда в небе огромное черное пятно, уносящееся вдаль, к горизонту
г Чувствует мое сердечко похитили ее
wait 1s
г Много времени прошло с тех пор
г Но совсем недавно стал к нам прилетать черный ворон и клевать моих слуг
г После, как надоест, усядется на дубу, и глядит в сторону моих хором
г Боюсь я, и по мою душу он прилетел
wait 1s
mecho Послышался пронзительный свист, как будто огромные крылья разрывают воздух
mecho Треск деревьев донесся откуда-то с юга
г Помоги нам добрый молодец, убей ворона, может узнаешь куда унес он мою сестрицу
calcuid ravenroom 47732 room
exec 47725 %ravenroom.id%
attach 47724 %self.id%
detach 47723 %self.id%
~
#47724
квест хозяин принимает~
0 q 100
~
wait 1s
if (%actor.name% == %quest477.name%) && (%world.curmobs(47740)% < 1)
  г Ну что ты узнал, рассказывай
  wait 1s
  msend %actor% Вы поведали историю о его сестре Хозяину
  wait 1s
  взд
  г Ничего не поделаешь, такова судьба
  if (%world.curobjs(47734)% < 6) && (%random.5% == 1)
    г Вот возьми этот плащ, он когда-то принадлежал моей сестре
    mload obj 47734
  end
  дат плащ .%actor.name%
  брос все
  detach 47724 %self.id%
end
~
#47725
лоад ворона~
2 z 100
~
wload mob 47741
~
#47726
лоад шмотки в руму~
2 z 100
~
if (%world.curobjs(47732)% < 6) && (%random.5% == 1)
  wload obj 47732
end
~
#47727
телепорт~
2 z 100
~
eval gopa %actor.pc%
foreach i %gopa%
  wteleport %i% 47738
done
~
#47728
священник квест~
0 q 100
~
wait 1s
г Долгих лет жизни тебе путник
эм перекрестился
wait 1s
г Давно я живу в этом храме
г Обветшал он, разваливается.
г Но немогу я покинуть его, священный крест прибит к стене храма
г Защищает он здешнюю деревушку от нежити
wait 1s
г Поселилась в наших краях колдунья
г Невесть откуда принесла ее сюда злая сила
г Отправляет она своих рабов оживших на деревню
г Но из-за великой святости этого креста не могут выйти из лесу на кладбище
wait 1s
г Поговаривают люди, что в дремучем лесу есть пещера, где и поселилась колдунья
г Помоги избавиться от нее, спаси деревню
attach 47729 %self.id%
~
#47729
священник квест помогу~
0 d 100
помогу~
wait 1
г Вот и славно
г Ступай, да пребует с тобой Господь
set quest2477 %actor%
global quest2477
attach 47730 %self.id%
detach 47728 %self.id%
detach 47729 %self.id%
~
#47730
священник квест награда~
0 q 100
~
if (%actor.name% == %quest2477.name%) && (%world.curmobs(47740)% < 1)
  г Ай да молодец, %actor.name%
  г Получи свою награду
  дат 1000 кун .%actor.name%
  if (%world.curobjs(47733)% < 6) && (%random.5% == 1)
    mload obj 47733
  end
  дат кре .%actor.name%
  брос все
  calcuid telroom 47777 room
  exec 47732 %telroom.id%
  detach 47730 %self.id%
end
~
#47731
колдунья рип~
0 f 100
~
mforce %actor,name% г Где ты держишь сестру, которую похитила твоя ворона?
mecho - Я и есть сестра
mecho - Это я присылала ворона
mecho - Но я хотела лишь быть вместе со своим братом
mecho - Но темная сила поглотила меня, и я жаждала только крови и мщения!
~
#47732
пента в сад~
2 z 100
~
wait 1s
wportal 47732 2
~
$~
