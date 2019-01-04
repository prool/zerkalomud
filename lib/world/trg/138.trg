#13800
входим в зеркало~
0 c 100
войти~
wait 1
if !%arg.contains(зеркало)%
  wsend %actor% _Куда это Вы войти собрались?
  return 0
  halt
end
wsend %actor% _ Вы сделали шаг вперед. Зеркало расступилось перед Вами и Ваше сознание помутилось.
wechoaround %actor% _%actor.name% сделал%actor.g% шаг вперед и пропал%actor.g% за зеркальной гладью.
wait 1s
wteleport %actor% 13792
wsend %actor% _Вы пришли в себя, оказавшись в каком-то доме.
wechoaround %actor% _%actor.name% вылетел%actor.g% из зеркала и упал%actor.g% рядом с Вами.
~
#13801
проваливайте~
0 r 100
~
wait 1s
say Проваливайте отсюда!
wait 1s
say Иначе я из вас дух вышибу!
~
#13802
мышь пискнула и исчезла~
0 r 100
~
wait 1s
mecho При виде Вас мышь испуганно пискнула и исчезла в темноте.
wait 1
mpurge %self%
~
#13803
падает хвостик~
0 f 100
~
if %world.curobjs(13800)% <= 1
  mload obj 13800
end
~
#13804
падает посох~
0 f 100
~
if (%world.curobjs(13801)% < 2) && (%random.1000% <= 100)
  mload obj 13801
end
~
#13805
падают рукавички~
0 f 100
~
if (%world.curobjs(13802)% < 3) && (%random.1000% <= 100)
  mload obj 13802
end
~
#13806
читаем книгу~
2 c 1
достать взять~
wait 1
if !%arg.contains(книг)%
  wsend %actor% _Что Вы хотите взять?
  return 0
  halt
end
wsend %actor% _Вы подошли к одной из полок и достали красивую книгу в черном переплете с мерцающими надписями.
wechoaround %actor% _%actor.name% достал%actor.g% книгу с одной из полок.
wait 1s
wsend %actor% _Вы открыли книгу и попытались хоть что-то прочитать, однако этот язык Вам совершенно незнаком.
wechoaround %actor% _%actor.name% полистал%actor.g% книгу и, вздохнув, снова закрыл%actor.g%.
wait 1s
wsend %actor% _Вы поставили книгу на ее место.
wechoaround %actor% _%actor.name% поставил%actor.g% книгу обратно на полку.
~
#13807
призываем призрака~
0 k 100
~
if %world.curmobs(13811)% <= 1
  эмо возвела руки к Небу...
  крич Придите ко мне, о Силы Тьмы, Силы Смерти!
  wait 1
  mecho Полутьма окутала комнату... Из пустоты возник темный призрак вечной печали!
  mload mob 13811
end
~
#13808
Сальвия атакует~
0 q 100
~
wait 1 
if %self.fighting%
  halt
end
хох
say Да как ты посмел прийти сюда?
say Думаешь, сможешь меня убить?
wait 1s
say Ты ошибаешься!
атак .%actor.name%
~
#13809
приветствует садовник~
0 q 100
~
wait 1
ул
say Я ждал Вас.
wait 5
say Вы принесли цветок?
say Давайте его мне!
attach 13810 %self.id%
detach 13809 %self.id%
~
#13810
сажаем цветочек~
0 j 100
~
wait 1
if (%object.vnum% != 13721)
  дум
  drop .%object.name%
  halt
end
эмо осмотрел заколдованный цветок.
wait 1s
say Молодцы, не повредили
wait 1
эмо аккуратно посадил цветок в приготовленную лунку.
mpurge %object%
wait 1s
mecho Цветок засветился и начал расти.
wait 1s
mecho Вдруг Вас окутал густой туман.
wait 1s
mecho Когда туман рассеялся, перед Вами явилась молодая девушка.
mload mob 13805
detach 13810 %self.id%
~
#13811
перстак падает~
0 f 100
~
if %world.curobjs(13804)% <= 1
  mload obj 13804
  mdoor 13843 east room 13833
end
if (%world.curobjs(13801)% < 2) && (%random.1000% <= 60)
  mload obj 13801
end
mload obj 13708
~
#13812
сальвия добровольно даст перстень~
0 d 0
проси требуй моли~
wait 1
if !%speech.contains(пощады)%
  say Не стану!
  halt
end
say Хорошо-хорошо
say берите перстень, только не убивайте!
эмо со вздохом сняла перстень с пальца.
mload obj 13708
mload obj 13804
give все .%actor.name%
эмо быстро выбежала из дома.
mecho Стена расступилась перед Вами и открылся вход в сад.
mdoor 13843 east room 13833
wait 1
mpurge %self%
~
#13813
волшебница дает задание~
0 n 100
~
wait 1
if %exist.mob(13810)%
  say Спасибо Вам!
  mecho Где-то за Вашей спиной послышались удаляющиеся шаги.
  wait 5
  mecho С грохотом закрылся подвальный люк.
  calcuid target 13810 mob
  mpurge %target%
  mat 13843 mload mob 13812
  wait 1s
  say Сальвия... она сбежала...
  say Сейчас я отправлю Вас в один лес... там найдете ее дом.
  say Забери у нее черный перстень и принеси мне
  wait 1s 
  say за это я награжу тебя!
  foreach pc %self.pc%
    if %pc.rentable%
      mteleport %pc% 13835 horse     
      wait 1
      msend %pc%  Вы очутились в лесу...
    end
  done
else
  say Ты убил Сальвию. Верни мне перстень и я награжу тебя!
  attach 13814 %self.id%
end
~
#13814
даем перстень и получаем награду~
0 j 100
~
wait 1
if %object.vnum%==13804
  wait 1
  mpurge %object%
  say Молодец! Ты справился!
  say Теперь я награжу тебя.
  switch %random.10%
    case 1
      if %world.curobjs(13704)% <= 4
        mload obj 13704
        дать меч .%actor.name%
      else
        mload obj 13811
        дать мешок.золот .%actor.name%
      end
    break
    case 2
      if %world.curobjs(13705)% <= 4
        mload obj 13705
        дать башмач .%actor.name%
      else
        mload obj 13811
        дать мешок.золот .%actor.name%
      end
    break
    case 3
      if %world.curobjs(13706)% <= 4
        mload obj 13706
        дать одежд .%actor.name%
      else
        mload obj 13811
        дать мешок.золот .%actor.name%
      end
    break
    case 4
      if %world.curobjs(13709)% <= 4
        mload obj 13709
        дать кольцо .%actor.name%
      else
        mload obj 13811
        дать мешок.золот .%actor.name%
      end
    break
    case 5
      if %world.curobjs(13710)% <= 4
        mload obj 13710
        дать наручи .%actor.name%
      else
        mload obj 13811
        дать мешок.золот .%actor.name%
      end
    break
    case 6
      if %world.curobjs(13810)% <= 4
        mload obj 13810
        дать штан .%actor.name%
      else
        mload obj 13811
        дать мешок.золот .%actor.name%
      end
    break
    default
      mload obj 13811
      дать мешок.золот .%actor.name%
    break
  done
  say Удачи!
  halt
end
say Это мне не нужно!
detach 13814 %self.id%
~
#13815
волчица суммонит~
0 k 50
~
switch %random.3%
  case 1
    if (%world.curmobs(13814)% < 2)
      mecho _Волчица завыла и на ее зов прибежал волчонок.
      mload mob 13814
    end
  break
  case 2
    if (%world.curmobs(13817)% < 2)
      mecho _Волчица завыла и на ее зов прибежал большой белый волк.
      mload mob 13817
    end
  break
  case 3
    if (%world.curmobs(13818)% < 2)
      mecho _Волчица завыла и на ее зов прибыл старый седой волк.
      mload mob 13818
    end
  break
done
end
~
$~
