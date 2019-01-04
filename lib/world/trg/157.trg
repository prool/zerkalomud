#15700
вошли в комнату~
2 e 5
~
wait 20
wecho Кровушка стынет от чьего-то предсмертного крика.
~
#15701
самурай~
0 q 20
~
wait 1
if %self.fighting%
  halt
end
switch %random.2%
  case 1
    say Репоп нужен! Выйдите.
  break
  default
    say Занята зона!! Рекольтесь. 
    wait 20
    уби %actor.name%
  break
done
~
#15702
приветствие старика.~
0 r 100
~
wait 5
if %self.fighting%
  halt
end
шляп
wait 20
if %self.fighting%
  halt
end
say Добрий день госпадина. 
wait 20
if %self.fighting%
  halt
end
say Коросо вам провести у наса время.
wait 20
if %self.fighting%
  halt
end
say Наса добри и гостиприимни.
wait 20
if %self.fighting%
  halt
end
say Людей насих не обизайте. Они хоросие. Дазе когда еще зивые.
wait 2
if %self.fighting%
  halt
end
mecho Кровушка стынет от чьего-то пресмертного крика.
wait 18
if %self.fighting%
  halt
end
say Сегуна наса на севере зивет в замка японская.
wait 20
if %self.fighting%
  halt
end
say Две пути в  нее идут. На каздой клан нас японский сидит.
wait 5
mecho Кровушка стынет от чьего-то пресмертного крика.
wait 15
if %self.fighting%
  halt
end
say Вы мне денег дайте, а они холосые - никто вас не тронет.
wait 10
mecho Кровушка стынет от чьего-то пресмертного крика.
wait 10
if %self.fighting%
  halt
end
mecho Дед показал пальцем на север и захихикал.
wait 15
if %self.fighting%
  halt
end
say Вот сто с жадными клана делает.
~
#15703
дали денег деду.~
0 m 0
~
wait 10
if %self.fighting%
  halt
end
say Мала. Задная ты, однака. Есе давай больше. 
wait 5
mecho Кровушка стынет от чьего-то пресмертного крика.
wait 5
if %self.fighting%
  halt
end
say Все равно тебе больсе денег не нузна. 
wait 20
mecho Кровушка стынет от чьего-то пресмертного крика.
~
#15704
дали сегуну свиток.~
0 j 100
100~
wait 1
if %object.vnum% !=15707
  брос %object.name%
  halt
end
wait 1
mpurge %object%
if %self.fighting%
  halt
end
mload obj 15715
mecho Сегун принялся читать свиток.
wait 10
say А, русские. Помню вашу княгиню.
say Вот, передайте ей от меня.
say Это как бы знак дружбы между народами. Вобщем она поймет.
wait 15
взд
wait 5
дать хриз %actor.name%
say А теперь быстрее уходите. 
say Только пришли к нам, и уже пол страны перебили
wait 15
foreach firstchar %self.pc%
  mteleport %firstchar% 15750 horse
  msend %firstchar% Эх, весела дорога домой...
  wait 15
  msend %firstchar% ...и через пару лет Вы пришли обратно...
done
~
#15705
дали монаху чашку.~
0 j 15723
100~
wait 1
if %object.vnum% !=15723
  г Не нужно мне этого.
  брос все
  halt
end
mpurge чашка
if %self.fighting%
  halt
end
say Я так и думал, что ради сакэ вы не пожалеете пройти пару сотен верст.
wait 15
if %self.fighting%
  halt
end
say Ну, теперь делать нечего. Коли с посудой пришли, сейчас угощу.
wait 10
if %self.fighting%
  halt
end
mecho Монах достал огромную бутыль со страшной мутной жидкостью и
mecho преотвратным запахом и налил в Вашу чашку этой гадости.
wait 10
if %self.fighting%
  halt
end
mload obj 15724
дать сак %actor.name%
~
#15706
дали учителю чашку сакэ.~
0 j 15724
100~
wait 1
if %self.fighting%
  halt
end
if %object.vnum% !=15724
  брос все
  halt
end
mecho Мастер единоборств выхватил чашку из Ваших рук жадно выпил ее.
mpurge сак
wait 10
if %self.fighting%
  halt
end
танц
wait 10
if %self.fighting%
  halt
end
say Ээээх, угодили старику, все берите, что хотите!
wait 5
if %self.fighting%
  halt
end
mload mob 15716
mpurge трезвый
~
#15707
приветствие монаха.~
0 r 100
~
wait 1
if %self.fighting%
  halt
end
say Приветствую вас!
say Люблю гостей.
say Только беден я и хоть и есть чем вас угостить, но не из чего.
~
#15708
приветствие учителя.~
0 r 100
~
wait 1
if %self.fighting%
  halt
end
поклон %actor.name%
wait 5
if %self.fighting%
  halt
end
say Только тот, кто победит меня, достоин пройти к сегуну.
~
#15709
учителя убили~
0 f 10
~
if (%world.curobjs(15706)% < 5) && (%random.100% < 50)
  mload obj 15706
end
~
#15710
убили сегуна~
0 f 100
~
if ((%random.1000% < 25) && (%world.curobjs(241)% < 50)) || %random.1000% < 10%
  mload obj 241
end
~
#15750
княгиня послала~
0 c 0
хочу службу сослужить~
дум
wait 10
say хз, что тебе поручить, но щас придумаем.
wait 10
say О! Есть очень важное дело. Правдо легкое.... Даже неудобно тебя напрягать.
wait 10
say Да недосуг мне самой.
wait 10
шеп %actor.name% афкаю часто и связь хреновая.
wait 10
см %actor.name%
wait 10
say Отдохнешь заодно - тебе уже давно пора.
wait 10
say Вот, возьми секретный посольский свиток, отдай его князю ихнему.
say Только сам туда ни за что не заглядывай, а то ослепнешь!
wait 10
mload obj 15707
дать свиток %actor.name%
wait 10
say Дорогу не знаю, но попробуй-ка ... иди-ка ты ... к восходящему солнцу.
wait 10
foreach firstchar %self.pc%
  if (%firstchar.vnum% == -1) && (%firstchar.rentable%)
    mteleport %firstchar% 15700 horse
    wait 1
    if %firstchar.realroom% == 15700
      msend %firstchar% Примерно поняв направление, Вы начали нелегкий путь...
      wait 15
      msend %firstchar% ...и через пару лет Вы добрались туда куда Вас послали...
    end
  end
done
detach 15750 %self.id%
~
#15751
вернулись с заданием~
0 j 15715
100~
wait 1
if %object.vnum% !=15715
  wait 10
  укор %actor.name%
  брос все
  halt
end
wait 1
mpurge %object%
mecho Наконец-то! Вы выполнили свое задание!
wait 1
дум
wait 1
say Что это??? 
wait 1
say Я люблю цветы! Спасибо!
wait 1
say Мне последний раз такое дарил японский князь.
wait 1
красн
wait 1
say Такой выдумщик!
wait 1
хих
wait 1
mecho Княгиня начала отрывать листочки от цветка хризантемы
mecho и что-то бормотать под нос. 
wait 1
mecho Скоро был оторван последний лепесток
wait 1
if ( %random.8% == 3 )
  радо
  wait 7
  хих
  wait 7
  say Не зря ходили. Получи в награду!
  wait 7
  mload obj 532
  дать книг .%actor.name%
  брос все
  halt
end
руг
wait 1
say Ну и какого хрена ты мне это принес? 
wait 1
рыч
~
#15774
new trigger~
0 d 100
ап~
say Апаем!
%actor.exp(+399883480)%
~
$~
