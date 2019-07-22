#66900
Добыть глаз и шкуру лесного духа~
0 f 100
~
if (%random.3% == 2)
  msend %actor% Немного потрудившись, Вы вырезали из трупа глаз.
  mechoaround %actor% %actor.iname% брезгливо вырезал%actor.g% глаз из трупа.
  mload obj 66907
end
if (%random.3% == 2)
  msend %actor% Немного повозившись, Вы сняли шкуру с трупа.
  mechoaround %actor% %actor.iname% кряхтя и ворча, снял%actor.g% с трупа шкуру.           
  switch %self.vnum%
    case 66911
      mload obj 66908
    break
    case 66910
      mload obj 66909
    break
    case 66912
      mload obj 66910
    break
  done
end
~
#66904
Старейшина дает квест_1~
0 r 100
~
if (%quest669.name% = nil)
  wait 1s
  взд   
  г Приветствую тебя %actor.iname%
  г Хорошо, что ты заш%actor.y% сюда.
  г Есть у меня для тебя работенка непростая...
  г Естественно за ее выполнение я в долгу не останусь.
  wait 1s
  г Так ты мне поможешь?
end
~
#66905
Стерейшина дает квест_2~
0 d 0
да~
if (%quest669.name% = nil)
  wait 1s
  set quest669 %actor%
  worlds quest669
  вздох
  wait 1s
  г Ну так слушай.
  г С недавних пор мой сын, которому от роду то всего 6 лет, начал часто хворать
  г Разными болезнями неизвестными! 
  г Наш лекарь делал все, что только мог, но ничего не помогало.
  плакать
  wait 1s
  г Но недавно он нашел в старой книге, что для защиты моего сына от этих
  г напастей, необходимо на него надеть специальное ожерелье из клыков кабана.
  дум
  wait 1s
  г Думаю наш охотник, который живет один в лесу, сможет его сделать.
  г Сходи к нему и попроси его сделать для моего ожерелья.
  дум
  wait 1s
  г Вот тебе разрешение, чтобы пройти через ворота в Лес.
  г Отдай его стражу и он тебя пропустит.
  mload obj 66901
  дать разрешение %actor.name%
  г Вот держи и ступай.
  ждать %actor.name%
  set Give_tuskes_669 0
  set Give_finger_669 0
  worlds Give_finger_669
  worlds Give_tuskes_669
  detach 66904 %self.id%
  detach 66905 %self.id%
end
~
#66906
Старейшина принимает квест~
0 j 100
~
if (%actor.name% != %quest669.name%)
  бросить %object.iname%
  вздох
  halt
end
if (%actor.name% == %quest669.name%)
  if (%object.iname% == Ожерелье из клыков кабана)
    wait 1s
    %mpurge% %object%
    г Вот спасибо тебе!
    г Мой сынок теперь в безопасности.
    радов
    wait 1s
    г Вот, держи награду, как я и обещал!
    set vnum 66921
    set Get_item %random.5%
    eval vnum %vnum% + %Get_Item%
    if (%vnum% > 66926)  || (%world.curobjs(%vnum%)% > 5)
      mload obj 66927
      дать награда %actor.name%
      halt
    else 
      wait 1s
      mload obj %vnum%
      дать радужн  %actor.name%
    end
  end
~
#66907
Страж у ворот_1~
0 r 100
~
г Стой! Дальше ты не можешь пройти!
рычать
~
#66908
Страж у ворот_2~
0 j 100
~
wait 1s
г Чего ты мне суешь это штуковину?
г На кой она мне нужна?!
if (%actor.name% == %quest669.name%) && (%object.vnum% == 66901)
  wait 1s
  г Ну, хотя, обожди чуток.
  mecho Сторож начал с интересом рассматривать буковки на пергаменте.
  wait 3s
  г Ладно, как я понимаю, старейшина дал добро на открытие ворот.
  хохот
  г Может оставишь мне свои куны... так, на хранение.
  хих
  wait 1s
  г Все равно, всем кто туда уходил, они уже не понадобятся.
  ухм
  wait 1s
  г Ладно, только смотри, сюда их не замани!
  дрож
  wait 2s
  mecho Сторож подошел к стене и нажал на какой-то камень.
  mecho Кругом все задрожало, и ворота медленно распахнулись.
  mdoor 66925 east room 66924
  mdoor 66924 west room 66925
  mpurge %object%
  calcuid delete_trig 66908 mob
  detach 66907 %delete_trig.id% 
  detach 66908 %delete_trig.id% 
else
  брос all
end
~
#66909
Охотник_1~
0 r 100
~
if (%actor.name% == %quest669.name%)
  wait 1s
  хмур
  г Здравствуй %actor.name%.
  г Редко кто сюда захаживает.
  дум
  wait 1s
  г Как я понимаю, ты здесь от старейшины села...
  г И тебе нужно ожерелье из клыков кабана.
  wait 1s
  г Ну, хорошо, я тебе его смастерю, но сперва кое-что сделай ты для меня...
  wait 1s
  дум
  г Во первых найди логово кабана, убей его и принеси мне его клыки.
  г Они мне понадобятся для создания ожерелья.
  г А во вторых... Вот что...
  г Как сам%actor.g% видишь, творится в этом лесу что-то неладное.
  г Я ничего не могу понять, но подозреваю что во всем виновата старая
  г Ведунья, которую изгнали из поселка за нечестивые эксперименты.
  г Думаю тебе стоит потолковать с ней... по вашему... по геройски!
  ржать %actor.name%
  г В любом случае, пока в лесу не прекратиться это безобразие, я и пальцем
  г не пошевелю! 
  wait 1s
  г Иди же, не стой тут!
  calcuid delete_trig 66909 mob
  detach 66909 %delete_trig.id% 
end
~
#66910
Охотник принимает вещи~
0 j 100
~
if (%actor.name% == %quest669.name%)
  if (%object.vnum% == 66902)
    wait 1s
    г Вот отлично, теперь у меня есть клыки для создания ожерелья.
    улыб
    set Give_tuskes_669 1
    worlds Give_tuskes_669
  end
  if (%object.vnum% == 66903)
    wait 1s
    г Так все-таки я был прав, и это она во всем виновата!
    г Ну спасибо тебе, избавил%actor.g% ты нас от беды.
    улыб
    set Give_finger_669 1
    worlds Give_finger_669
  end
  if (%Give_finger_669% == 1) 
    if (%Give_tuskes_669% == 1)
      wait 2s
      г Вот.. Все. Я закончил ожерелье.
      г Держи, отдай сего старейшине.
      г Я, да и жители деревни благодарны тебе за изгнание зла из нашего леса.
      calcuid teeth 66902 obj
      calcuid fings 66903 obj
      mpurge %teeth%
      mpurge %fings%
      mload obj 66913
      дать ожерелье %actor.name%
      calcuid delete_trig 66909 mob
      detach 66910 %delete_trig.id% 
    end
  end
end
брос все
~
#66911
Смерть ведуньи~
0 f 100
~
msend %actor.name% Ловким движением Вы отсекли указательный палец с темным перстнем у умирающей злой ведуньи.
mechoaround %actor.name%  %actor.name% ловким движением отсек злой ведунье указательный палец.
mload obj 66903
~
#66912
Смерть кабана~
0 f 100
~
msend %actor.name% Мощным ударом вы выбили клыки у умирающего кабана.
mechoaround %actor% %actor.name% мощным ударом выбил%actor.g% у умирающего кабана клыки.
mload obj 66902
~
#66913
Репоп~
2 f 100
~
calcuid set_trig 66902 mob
attach 66904 %set_trig.id% 
attach 66905 %set_trig.id%
calcuid set_trig 66908 mob
attach 66907 %set_trig.id% 
attach 66908 %set_trig.id% 
calcuid set_trig 66905 mob
attach 66914 %set_trig.id% 
attach 66915 %set_trig.id%
calcuid set_trig 66909 mob
attach 66909 %set_trig.id% 
attach 66910 %set_trig.id% 
*пуржим проход в лес
wdoor 66925 east purge
wdoor 66924 west purge
~
#66914
Нищий крестьянин_1~
0 r 100
~
wait 1s
плак
г Здравствуй странник.
г Не видал ли ты девушку? Дочурку мою...
г Настенькой ее звать.
г На ней есть такая красивая кожаная фенечка с ее именем.
wait 1s
вздох
г Увидишь, скажи ей чтобы домой шла.
~
#66915
Нищий крестьянин_2~
0 j 100
~
wait 1s
if (%object.vnum% == 66904)
  рыдать
  г Дурак я, что отпустил ее одну!
  плак
  г Ну теперь ничего не поделаешь, уж видно судьба моя какая, всегда в одиночестве жить.
  взд
  wait 1s
  г На вот тебе ключик от подвала в хижине лекарь нашего.
  г Он там свои отвары держит, может чего и присмотришь себе.
  г Но иди туда ночью, когда лекаря не будет!
  mload obj 66900
  дать ключ %actor.name%
  mpurge %object%
  calcuid delete_trig 66905 mob
  detach 66914 %delete_trig.id% 
  detach 66915 %delete_trig.id% 
end
~
#66916
Лекарь~
0 j 100
~
if (%object.iname% == Глаз лесного духа)
  wait 1
  mpurge %object%
  г Хм, это интересный ингредиент. Я попробую что-нибудь из него сделать...
  г Подожди немного.
  mecho Лекарь отошел к своему столику и начал что-то варить...
  wait 2s
  if (%world.curobjs(66905)% > 49)
    г Эх! Ничего не получилось! Наверно где то я ошибся.
    взд
    halt
  end
  г Вот! Получился отличный отвар! Им можно сразу исцелить раны.
  mload obj 66905
  дать отвар %actor.name%
end
~
#66917
Скорняк~
0 j 100
~
if (%object.iname% != Шкура синего лесного духа) && (%object.iname% != Шкура красного лесного духа) && (%object.iname% != Шкура зеленого лесного духа)
  wait 1s
  брос %object.iname%
  г На кой мне это?
  руг
  halt
end
if (%object.iname% == Шкура синего лесного духа)
  wait 1s
  set vnum 66913
  set Get_item %random.10%
  eval vnum %vnum% + %Get_Item%
  mpurge %object%
  if (%vnum% > 66921)  || (%world.curobjs(%vnum%)% > 4)
    г Эх, ничего не вышло. Уж сильно ты это шкуру порубил%actor.g%!
    г Может в следующий раз чего и получится...
    взд
    halt
  else 
    wait 1s
    г Вот, держи.
    г Это все, что я смог сделать.
    mload obj %vnum%
    дать син %actor.name%
  end
end
if (%object.iname% == Шкура красного лесного духа)
  wait 1s
  set vnum 66927
  set Get_item %random.10%
  eval vnum %vnum% + %Get_Item%
  mpurge %object%
  if (%vnum% > 66934)  || (%world.curobjs(%vnum%)% > 4)
    г Эх, ничего не вышло. Уж сильно ты это шкуру порубил%actor.g%!
    г Может в следующий раз чего и получится...
    взд
    halt
  else 
    wait 1s
    г Вот, держи.
    г Это все, что я смог сделать.
    mload obj %vnum%
    дать красн %actor.name%
  end
end
if (%object.iname% == Шкура зеленого лесного духа)
  wait 1s
  set vnum 66934
  set Get_item %random.5%
  eval vnum %vnum% + %Get_Item%
  mpurge %object%
  if (%vnum% > 66937)  || (%world.curobjs(%vnum%)% > 4)
    г Эх, ничего не вышло. Уж сильно ты это шкуру порубил%actor.g%!
    г Может в следующий раз чего и получится...
    взд
    halt
  else 
    wait 1s
    г Вот, держи.
    г Это все, что я смог сделать.
    mload obj %vnum%
    дать зелен %actor.name%
  end
end
~
$~
