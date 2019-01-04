#77800
Пробегающий черный кот~
0 r 100
~
wait 1
msend %actor% Вы с трудом успели отдернуть ногу, чтобы не раздавить перебегающего Вам дорогу, черного, как смоль, кота.
mechoaround %actor% ~~%actor.name% с трудом успел%actor.g% отдернуть ногу, чтобы не раздавить перебегающего дорогу, черного, как смоль, кота.
mecho На душе у Вас стало нехорошо...
south
mpurge %self%
~
#77801
Тревога в лаборатории.~
2 eg 100
~
wait 1
wecho Внезапно звучит пронзительный звук и осветительные шары приобретают кроваво-красный свет. Похоже Вас заметили.
~
#77802
Роемся в канаве~
2 c 1
рыть рыться искать щупать~
wait 1
if %arg.contains(канав)%
  wsend %actor% Вы начали самозабвенно ковыряться в земле
  wechoaround %actor% ~~%actor.name% начал%actor.g% самозабвенно ковыряться в земле.
  wait 1s
  *неогранненные камни откапываются в любом случае.
  wload o 77801
  wsend %actor% Разрыв канаву до невероятных размеров, Вы нашли кучку неограненных драгоценных камней.
  detach 77802 %self%
else
  wsend %actor% Где рыться-то будем?
end
~
#77803
Вопли крысы~
0 q 100
~
wait 1
mecho Крыса прокряхтела: Чуррр... Чуррр...
mecho Крыса злобно проворчала: Вы пришли похитить мои руны, умрите грязные твари!
mecho Крыса истошно завопила: Я здесь самый главный!!! Вы слышите меня люди, Яяяя!!!
~
#77804
Шипы в оплавленном коридоре~
2 e 50
~
wait 1
if %actor.dex% < 15 
  wdamage %actor.name% 50+%random.num(20)%
  wsend %actor%  Вы неосторожно повернулись и задели шип, торчащий из стены.
end
~
#77805
Взрывающийся кувшин с маслом~
1 g 100
~
wait 1
osend %actor% Кувшин взорвался прямо у Вас в руках!
oechoaround %actor% В руках у %actor.rname% взорвался кувшин!
odamage %actor% 250+%random.num(50)%
opurge %self%
~
#77806
Огранение камней~
0 j 100
~
wait 1
* *чек на искомый предмет
if %object.vnum% == 77801
  mpurge %object%
  mecho Ювелир внимательно посмотрел на принесенные камни и уверенно заработал непонятными инструментами...
  *проверка наличия в мире уникальных щитов
  *чекаем щиты на первый камень - Кровавик 77809
  *щиты 77824 77827 77830
  if (!%world.curobjs(77824)% || !%world.curobjs(77827)% || !%world.curobjs(77830)%)
    mload o 77809
    say Вот, держи.
    дать кровавик .%actor.iname% 
    *чекаем щиты на второй камень - Аквамарин 77810
    *щиты 77823 77826 77829
  elseif (!%world.curobjs(77823)% || !%world.curobjs(77826)% || !%world.curobjs(77829)% )
    mload o 77810
    say Вот, держи.
    дать аквамарин .%actor.iname% 
    *чекаем щиты на второй камень - Алмаз 77811
    *щиты 77822 77825 77828
  elseif (!%world.curobjs(77822)% || !%world.curobjs(77825)% || !%world.curobjs(77828)% )
    mload o 77811
    say Вот, держи.
    дать алмаз .%actor.iname% 
    *если все щиты существуют, выдаем любой камень, дабы сохранить интригу.
  else
    eval rnd %random.3%
    switch %rnd%
      case 1
        mload o 77809
        say Вот, держи.
        дать кровавик .%actor.iname%
      break
      case 2
        mload o 77810
        say Вот, держи.
        дать аквамарин .%actor.iname% 
      break
      case 3
        mload o 77811
        say Вот, держи.
        дать алмаз .%actor.iname% 
      break
    done
  end
else
  say Я с этим не работаю.
  дать %oblect.name% .%actor.iname%
end
~
#77807
Приветствие мастера~
0 q 50
~
msend %actor% Мастер мельком взглянул на Вас и продолжил свою работу...
~
#77808
дали детали мастеру~
0 j 100
~
wait 1
if %object.vnum% == 77805
  eval sacred 1
  global sacred
  say Хорошая основа для щита получится.
  mpurge %object%
elseif %object.vnum% == 77802
  eval golden 1
  global golden
  say Гм... Щит, обитый золотом?! Хорошая затея!
  mpurge %object%
elseif %object.vnum% == 77803
  eval silver 1
  global silver
  say Гм... Щит, обитый серебром может выйти...
  mpurge %object%
elseif %object.vnum% == 77804
  eval steel 1
  global steel
  say Гм... Щит окованный сталью - мудрое решение.
  mpurge %object%
elseif %object.vnum% == 77809
  eval gemstone krovavik
  global gemstone
  say Хороший камень для украшения щита.
  mpurge %object%
elseif %object.vnum% == 77810
  eval gemstone aqua
  global gemstone
  say Красивый камень у тебя! Для щита сойдет.
  mpurge %object%
elseif %object.vnum% == 77811
  eval gemstone diamond
  global gemstone
  say Очень дорогой камень! Отличный щит выйдет.
  mpurge %object%
else
  say Хлама у меня и своего хватит.
  бросить %object.name%
end
if %gemstone% && %sacred% && (%golden% || %silver% || %steel%)
  switch %gemstone%
    case krovavik
      if (!%world.curobjs(77824)% && %golden%)
        mecho Мастер пошел к верстаку и занялся работой
        wait 2s
        mload o 77824
        say Вот, держи.
        дать щит .%actor.iname%
        detach 77808 %self%
        halt
      elseif (!%world.curobjs(77827)% && %silver%)
        mecho Мастер пошел к верстаку и занялся работой
        wait 2s
        mload o 77827
        say Вот, держи.
        дать щит .%actor.iname%
        detach 77808 %self%
        halt
      elseif (!%world.curobjs(77830)% && %steel%)
        mecho Мастер пошел к верстаку и занялся работой
        wait 2s
        mload o 77830
        say Вот, держи.
        дать щит .%actor.iname%
        detach 77808 %self%
        halt
      else
        mecho Мастер пошел к верстаку и занялся работой
        wait 2s
        mecho Мастер разочарованно посмотрел на Вас.
        г Жаль... Не вышло... Уж извини... Если есть другие детали - давай попробую еще.
      end
    break
    case aqua
      if (!%world.curobjs(77823)% && %golden%)
        mecho Мастер пошел к верстаку и занялся работой
        wait 2s
        mload o 77823
        say Вот, держи.
        дать щит .%actor.iname%
        detach 77808 %self%
        halt
      elseif (!%world.curobjs(77826)% && %silver%)
        mecho Мастер пошел к верстаку и занялся работой
        wait 2s
        mload o 77826
        say Вот, держи.
        дать щит .%actor.iname%
        detach 77808 %self%
        halt
      elseif (!%world.curobjs(77829)% && %steel%)
        mecho Мастер пошел к верстаку и занялся работой
        wait 2s
        mload o 77829
        say Вот, держи.
        дать щит .%actor.iname%
        detach 77808 %self%
        halt
      else
        mecho Мастер пошел к верстаку и занялся работой
        wait 2s
        mecho Мастер разочарованно посмотрел на Вас.
        г Не крепится этот камень на твои детали. Приноси другие - попробуем снова
      end
    break
    case diamond
      if (!%world.curobjs(77822)% && %golden%)
        mecho Мастер пошел к верстаку и занялся работой
        wait 2s
        mload o 77822
        say Вот, держи.
        дать щит .%actor.iname%
        detach 77808 %self%
        halt
      elseif (!%world.curobjs(77825)% && %silver%)
        mecho Мастер пошел к верстаку и занялся работой
        wait 2s
        mload o 77825
        say Вот, держи.
        дать щит .%actor.iname%
        detach 77808 %self%
        halt
      elseif (!%world.curobjs(77828)% && %steel%)
        mecho Мастер пошел к верстаку и занялся работой
        wait 2s
        mload o 77828
        say Вот, держи.
        дать щит .%actor.iname%
        detach 77808 %self%
        halt
      else
        mecho Мастер пошел к верстаку и занялся работой
        wait 2s
        mecho Мастер разочарованно посмотрел на Вас.
        г Больно привередливый твой камень оказался. Не хочет с этим металом рядом быть. Неси другие детали.
      end
    break
  done 
end
~
#77809
переплавка руды~
0 j 100
~
wait 1
*заранее проставляем рандомную переменную
eval rnd %random.100%
*чекаем что же нам дали
if %object.vnum% == 77806
  *если золото
  mecho Кузнец взял клещами кусок руды и пошел к огню
  wait 1s
  *вероятность успеха
  if %rnd% < 70
    mload o 77802
    say Вот и готово. Держи
    дать детали .%actor.iname%
  else
    say Эх... плохоя у тебя руда. Вся выгорела.
    пож
  end
  mpurge %object%
elseif %object.vnum% == 77807
  *если серебро
  mecho Кузнец взял клещами кусок руды и пошел к огню
  wait 1s
  *вероятность успеха
  if %rnd% < 80
    mload o 77803
    say Вот и готово. Держи
    дать детали .%actor.iname%
  else
    say Эх... плохоя у тебя руда. Вся выгорела.
    пож
  end
  mpurge %object%
elseif %object.vnum% == 77808
  *если железо
  mecho Кузнец взял клещами кусок руды и пошел к огню
  wait 1s
  *вероятность успеха
  if %rnd% < 90
    mload o 77804
    say Вот и готово. Держи
    дать детали .%actor.iname%
  else
    say Эх... плохоя у тебя руда. Вся выгорела.
    пож
  end
  mpurge %object%
else
  say Ну и зачем мне это?..
  хмур
  дать %object.name% .%actor.iname%
end
~
#77810
агр ведьмы~
0 q 100
~
wait 2
гнев
say Ты глянь! Душенку мою вынуть решили. Ну, это мы еще поглядим кто кого!
закол .%actor.iname%
detach 77810 %self%
~
#77811
подтверждение квеста~
0 d 1
выручу помогу~
wait 1
say Вот спасибо!
рад .%actor.iname%
wait 1s
say Ведьма поселилась на севере деревни. Еще назвало свое жилище каким-то жутким словом лаборатво..Тьфу! Не выговоришь мерзость эту!
say А лешие в лесу тут неподалеку.
mecho Волхв махнул рукой в неопределнную сторону...
mecho Что-то он еще пробубнел про разлом, но что конкретно - Вы не разобрали.
detach 77812 %self%
detach 77811 %self%
~
#77812
Выдача квеста~
0 q 100
~
wait 1
msend %actor% Волхв взглянул на Вас.
if %actor.sex% == 1
  сказ %actor.name% Здравствуй, добрый молодец.
else 
  сказ %actor.name% Здравствуй, красна девица.
end
msend %actor% Волхв оценивающе посмотрел на Вас.
wait 1s
сказ %actor.name% Вижу, ратным делом не брезгуешь?
сказ %actor.name% Не откажи мне в услуге.
сказ %actor.name% Завелась у нас тут колдунья одна.
сказ %actor.name% Руну у меня одну украла да дел натворила черных...
сказ %actor.name% И леших обратила в слуг своих. Они теперь ее охраняют
wait 1s
сказ %actor.name% А я тебе помогу.
сказ %actor.name% Мастер у нас есть один. Щиты делать большой умелец.
сказ %actor.name% Верни мне руну и принеси от леших пластину проклятую.
сказ %actor.name% С помощью руны я сделаю тебе основу для щита какого мир еще не видел.
wait 1s
сказ %actor.name% Выручай!
msend %actor% Волхв умоляюще посмотрел на Вас.
~
#77813
дали руну или пластину~
0 j 100
~
wait 1
if %object.vnum% == 77813
  eval rune 1
  global rune
  mecho Волхв удовлетворенно посмотрел на руну.
  mpurge %object%
elseif %object.vnum% == 77812
  eval woodenplate 1
  global woodenplate
  mecho Волхв внимательно посмотрел на пластину.
  mpurge %object%
else
  say Я в этом не нуждаюсь.
  бросить %object.name%
end
if (%woodenplate% && !%rune%)
  say Без руны я бессилен. Принеси руну поскорее.
elseif (%rune%  && !%woodenplate%)
  say Отлично! Ну, теперь можешь нести пластину.
elseif (%rune% && %woodenplate%)
  say Ну чтож. Теперь приступим к делу.
  mload o 77805
  дать пластин .%actor.iname%
  вздох
  г А теперь слушай...
  wait 1s
  г Для щита тебе понадобятся камни. Поищи в канаве. Что найдешь - отнеси ювелиру нашему.
  wait 1s
  г Еще тебе понабится целая куча металлических деталей. Это уже намного сложнее.
  г Их может выковать кузнец из руды. Руду найдешь в разломе. Только там тоже опасно.
  г И тут я тебе не помощник. Молить всех Богов буду за тебя, но воинское умение тебе придется свое проявить.
  вздох
  wait 1s
  г Да хранят тебя Боги!
end
~
#77814
ZoneReset~
2 f 100
~
calcuid reset 77816 room
attach 77802 %reset.id%
~
#77815
смерть ремесленика~
0 f 100
~
if (%world.curobjs(77816)% < 6) && (%random.10% <= 1)
  mload obj 77816
end
~
#77816
смерть ведьмы~
0 f 100
*~
if (%world.curobjs(77814)% < 4) && (%random.10% <= 1)
  mload obj 77814
end
if (%world.curobjs(77831)% < 6) && (%random.10% <= 1)
  mload obj 77831
end
~
#77817
смерть воина смерти~
0 f 100
*~
if (%world.curobjs(77820)% < 4) && (%random.10% <= 1)
  mload obj 77820
end
if (%world.curobjs(77834)% < 6) && (%random.10% <= 1)
  mload obj 77834
end
if (%world.curobjs(77833)% < 4) && (%random.10% <= 1)
  mload obj 77833
end
~
#77818
смерть кайю~
0 f 100
*~
if (%world.curobjs(77839)% < 4) && (%random.10% <= 1)
  mload obj 77839
end
if (%world.curobjs(77847)% < 6) && (%random.10% <= 1)
  mload obj 77847
end
~
#77819
смерть мокрицы~
0 f 100
~
if (%world.curobjs(77852)% < 6) && (%random.10% <= 1)
  mload obj 77852
end
~
#77820
смерть крысы~
0 f 100
~
if (%world.curobjs(77821)% < 6) && (%random.10% <= 1)
  mload obj 77821
end
~
#77821
смерть паука~
0 f 100
~
if (%world.curobjs(77843)% < 6) && (%random.10% <= 1)
  mload obj 77843
end
~
#77822
смерть клирика~
0 f 100
*~
if (%world.curobjs(77848)% < 4) && (%random.10% <= 1)
  mload obj 77848
end
if (%world.curobjs(77849)% < 4) && (%random.10% <= 1)
  mload obj 77849
end
if (%world.curobjs(77850)% < 4) && (%random.10% <= 1)
  mload obj 77850
end
if (%world.curobjs(77851)% < 4) && (%random.10% <= 1)
  mload obj 77851
end
~
#77823
смерть ключника~
0 f 100
~
if (%world.curobjs(77842)% < 6) && (%random.10% <= 1)
  mload obj 77842
end
~
#77824
смерть Солей~
0 f 100
~
if (%world.curobjs(77836)% < 6) && (%random.10% <= 1)
  mload obj 77836
end
~
#77825
смерть Файяр~
0 f 100
~
if (%world.curobjs(77837)% < 6) && (%random.10% <= 1)
  mload obj 77837
end
~
#77826
смерть Даркес~
0 f 100
~
if (%world.curobjs(77838)% < 6) && (%random.10% <= 1)
  mload obj 77838
end
~
#77827
смерть Альвина~
0 f 100
~
if (%world.curobjs(77846)% < 6) && (%random.10% <= 1)
  mload obj 77846
end
~
#77828
смерть стражника~
0 f 100
~
if (%world.curobjs(77815)% < 6) && (%random.10% <= 1)
  mload obj 77815
end
~
#77829
смерть гончей~
0 f 100
~
if (%world.curobjs(77854)% < 6) && (%random.10% <= 1)
  mload obj 77854
end
~
#77830
смерть демона~
0 f 100
~
if (%world.curobjs(77853)% < 6) && (%random.10% <= 3)
  mload obj 77853
end
~
#77831
смерть землекопа~
0 f 100
~
if (%world.curobjs(77818)% < 6) && (%random.10% <= 1)
  mload obj 77818
end
~
$~
