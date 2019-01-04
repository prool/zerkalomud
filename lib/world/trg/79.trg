#7900
разрубаем корни~
2 c 0
разрубить~
wait 1
if !%arg.contains(корни)%
  wsend %actor.name% Что вы хотите разрубить?
  halt
end
wsend %actor.name% Как только Вы замахнулись для удара, корни зашевелились и медленно располздись по сторонам
wechoaround %actor% Как только %actor.name% замахнул%actor.u% для удара, корни зашевелились и медленно расползлись по сторонам
wecho Теперь Вы вполне можете протиснуться в образовавшееся пространство
wdoor  7957 north flags a
wdoor  7957 north room  7959
detach 7900 %self.id%
~
#7901
зашел к старушке~
0 q 100
~
if !(%exist.mob(7910)%)
  halt
end
wait 1s
msend %actor% Старушка подняла голову и посмотрела на Вас.
msend %actor% - Здравствуй, мил человек, да продлят Боги дни твои.
if !%questor79%
  msend %actor% - Я вот тут по грибы-ягодки собралась, да сил уж нет, ноженьки не ходят старые.
  msend %actor% Старушка задумалась и продолжила:
  wait 1s
  msend %actor% - Да и грибы нынче странные пошли, на людей будто волки какие бросаются.
  msend %actor% - Зато что летом, что зимой - всегда их тьма-тьмущая.
  msend %actor% - А самый страшный из них - Царь-гриб, тот и убить может, коль с голыми руками на него пойдешь.
  msend %actor% Старушка опять задумалась.
  wait 1s
  msend %actor% Потом продолжила:
  msend %actor% - Слушай, если ты таки решил%actor.g% туда пойти, так окажи мне услугу.
  msend %actor% - Стара я стала для подвигов ратных, а полакомиться грибочками и мне в охотку. 
  msend %actor% - Принеси мне кусочек Царь-гриба, очень уж вкусная тварь, если засушить грамотно, а я в долгу не останусь.
  вздох
  wait 1s
  msend %actor% - Так ты поможешь?
  msend %actor% Старуха умоляюще посмотрела на Вас в ожидании ответа.
  attach 7902 %self.id%
end
~
#7902
выдача квеста~
0 d 1
конечно помогу хорошо~
if %actor.vnum% != -1   || !(%exist.mob(7910)%)
  halt
end
wait 1s
if %questor79%
  if %questor79sex% == 1
    дум
    say Ну..я уже попросила одного парнишку помочь, но если ты сумеешь вперед него справиться... 
    halt
    say Так и быть, найду чем тебя наградить.
  else
    say Ну..я уже попросила одну девицу помочь, но если ты сумеешь вперед нее справиться...
    halt
    say Так и быть, найду чем тебя наградить.
  end
end
makeuid questor79 %actor.id%
global questor79
eval questor79tname %actor.tname%
global questor79tname
eval questor79sex %actor.sex%
global questor79sex
msend %actor% - Эх... вот и в былые годы никто ни в чем не мог мне отказать.
msend %actor% Старушка довольно усмехнулась в усы.
attach 7903 %self.id%
~
#7903
оплата квеста~
0 j 100
~
wait 1
if !(%object.vnum% == 7905)
  wait 1
  msend %actor% - Спасибо, но мне этого не надо.
  брос %object.name%
  halt
end
calcuid qwe 7905 obj
wait 1
mpurge %qwe%
if (!%questor79% || !(%questor79.id% == %actor.id%))
  msend %actor% - Спасибо тебе, помог%actor.g% ты мне очень.
  msend %actor% - Вот держи плату.
  msend %actor% Старушка дала вам горсть монет.
  %actor.gold(+300)%
end
return 1
if !%killer79% || !(%killer79.id% == %questor79.id%) 
  wait 1
  msend %actor% - Не к лицу тебе, %actor.name%, присваивать чужие дела !
  msend %actor% - Но за подарок спасибо. Вот за твои труды.
  msend %actor% Старуха дала Вам горсть монет.
  %actor.gold(+300)%
  halt
else
  msend %actor% - Ну спасибо тебе, %actor.name%. Век тебя не забуду.
  msend %actor% - Выручил%actor.g% ты меня. Славно повеселюсь нынче, молодость вспомню.
  msend %actor% - Вот твоя награда... Заслужил%actor.g%!
  switch %actor.class%
    case 0
      if !%actor.spelltype(освящение)%
        mspellturn %actor.name% освящение set
      else
        г Хм, ты уже знаешь заклинание освящения, больше я не могу тебе ничем помочь.
      end
    break
    case 1
      if !%actor.spelltype(шаровая молния)%
        mspellturn %actor.name% шаров.молн set
      else
        г Хм, ты уже знаешь заклинание шаровой молнии, больше я не могу тебе ничем помочь.
      end
    break
    case 6
      if !%actor.spelltype(длит молч)%
        mspellturn %actor.name% длит.молч set
      else
        г Хм, ты уже знаешь заклинание длительного молчания, больше я не могу тебе ничем помочь.
      end
    break
    case 7
      if !%actor.spelltype(оцепенение)%
        mspellturn %actor.name% оцепенение set
      else
        г Хм, ты уже знаешь заклинание оцепенения, больше я не могу тебе ничем помочь.
      end
    break
    case 8
      if !%actor.spelltype(сеть)%
        mspellturn %actor.name% сеть set
      else
        г Хм, ты уже знаешь заклинание сети, больше я не могу тебе ничем помочь.
      end
    break
    case 9
      if !%actor.skill(лидерство)%
        mskillturn %actor.name% лидерство set
      else
        г Хм, да я смотрю ты прирожденный лидер, так что я не смогу тебе помочь в этом деле
      end
    break
    case 12
      if !%actor.spelltype(насыщение)%
        mspellturn %actor.name% насыщение set
      else
        г Хм, ты уже знаешь заклинание насыщения, больше я не могу тебе ничем помочь.
      end
    break
    case 13
      г Волхв? Вы сами все умеете делать, нечему мне тебе помочь.
    break
    default
    break
  done
  eval rnd %random.10% 
  if (%rnd% < 4 && world.curobjs(7918) < world.maxobj(7918))
    mload obj 7918
    дать нит %actor.name%
  elseif (%rnd% < 7 && world.curobjs(7919) < world.maxobj(7919))
    mload obj 7919
    дать лукош %actor.name%
  else
    msend %actor% Старушка высыпала Вам из кошелька горсть монет.
    %actor.gold(+500)%
  end
end
detach 7903 %self.id%
~
#7904
убит царь-гриб~
0 f 100
~
%load% obj 7905
if (%actor.vnum% == -1)
  makeuid killer79 %actor.id%
  calcuid questor 7901 mob
  remote killer79 %questor.id%
end
~
#7905
обновл. переменных~
2 f 100
~
calcuid questor 7901 mob
if %questor%
  attach 7901    %questor.id%
  detach 7902    %questor.id%
  detach 7903    %questor.id%
  rdelete questor79 %questor.id%
  rdelete questor79tnam %questor.id%
  rdelete questor79sex %questor.id%
  rdelete killer79 %questor.id%
end
wdoor 7957 north purge
wait 1
calcuid roots 7957 room
attach 7900 %roots%
~
#7906
крапива~
2 e 100
~
wait 5
wsend %actor% &RКрапива БОЛЬНО жжет Вас!&n
~
#7907
Смерть гриба-людоеда (лоад книги о вечности души)~
0 f 100
~
if (%random.1000% <= 150) && (%world.curobjs(511)% < 1)
  mload obj 511
end
~
#7908
Смерть сморчка (лоад книги слабости)~
0 f 100
~
if (%random.100% <= 10) && (%world.curobjs(518)% < 1)
  mload obj 518
end
~
$~
