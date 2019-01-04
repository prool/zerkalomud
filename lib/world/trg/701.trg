#70100
вошли к ведуну~
0 r 100
~
закрыть здоровый.сундук
запереть здоровый.сундук
wait 5
if %self.fighting%
 halt
end
поклон
wait 20
if %self.fighting%
 halt
end
say Здравствуй путник, далече ты забрался! Не часто у меня гости бывают. 
wait 20
if %self.fighting%
 halt
end
say Не удивляйся, что живу я тут один в глуши, на то свои причины есть.
say А ты не духовник мой, чтоб расказывать тебе о них.
wait 20
if %self.fighting%
 halt
end
say Вот что только сказать могу - не ходи ты дальше на север.
wait 20
if %self.fighting%
 halt
end
say Особенно если крещенный ты.
wait 2
if %self.fighting%
 halt
end
mecho Ведун усмехнулся в свою бороду и хитро прищурился.
кул
wait 18
if %self.fighting%
 halt
end
say В общем я тебя предупредил, а дальше поступай как сам знаешь...
wait 20
if %self.fighting%
 halt
end
say Да и не досуг мне с тобой говорить, короче иди себе куда шел...
~
#70101
муравей пробежал~
2 e 100
~
eval temp %actor%
wait 1s
wechoaround %temp.name% Маленький муравей пробежал под ногами у %actor.rname%.
wsend %temp.name% Маленький муравей пробежал у Вас под ногами.
~
#70102
поймать муравья~
2 c 1
поймать~
 wait 1
 if %arg%==муравья
  wsend %actor% Вы нагнулись и попытались схватить одного из муравьев.
  wait 1
if (%random.5% == 1)
   wsend %actor% Один пробежал рядом, и Вы успели его поймать.               
   wload obj 70107
   wforce %actor% взять муравей
  else
   wsend %actor% Пока Вы пытались выбрать муравья, они разбежались.
  end
 else
  wsend %actor% Кого вы хотите поймать ?
 end
 return 0
~
#70103
бросают муравья~
1 h 100
~
wait 1
 if %actor.realroom%==70138
  osend %actor% Почуствовав свободу муравей спрыгнул с Вашей руки.
  oecho Муравей, шевеля усиками, подбежал к ведуну и полез по его ноге.
  wait 10
  oecho Старый усталый ведун начал чесаться.
  oecho Старый усталый ведун сказал : 'Проклятая живность'
  oecho Старый усталый ведун сказал : 'Изабвь меня от этой мерзости'
  oecho Старый усталый ведун сказал : 'И я найду для тебя что-нибуть в дар'
  *должна загрузится царица мурвьев у муравейника
calcuid muraveinik 70124 room
detach 70101 %muraveinik.id%
detach 70102 %muraveinik.id%
attach 70115 %muraveinik.id%
exec 70115 %muraveinik.id%
* должна была загрузиться царица
  opurge %self%
 else
oechoaround %actor% Почуствовав свободу муравей встрепенулся и убежал.
  osend %actor% Почуствовав свободу муравей спрыгнул с Вашей руки и убежал.
  opurge %self%
 end     
 * пуржится до того как бросили, что бы не сообщало чего вы хотите бр
 return 0
~
#70104
вошли к царице мур~
0 q 100
~
 wait 1
 mecho Царица муравьев внимательно посмотрела на Вас.
 дум
 г Кажется мне, пришли вы что б разрушить наш дом.
 г Только, поверте мне, не дадим мы себя в обиду.
 г А ведун этот проклятый давно мечтает всю силу леса
 г себе забрать, но мы ему мешаем.
 г Если бы не было у него помошника, давно бы выглнали
 г из лесу. А так, нам с ним не справиться.
wait 10s
 взд
 wait 5s
 if %self.fighting% 
  * суд не должен попадать по муравьям, если уже деруться
  dg_cast 'суд богов'
detach 70104 %self.id%
  halt
 end              
 calcuid caricamur 70102 mob
attach 70105 %caricamur.id%
exec 70105 %caricamur.id%
 * надо бы проверить, детачится ли тригер или нет.
 * если нет, надо удалять в триге 70105
 wait 1s              
* что бы не били ее тоже удаляю
* if !%self.fighting%
  mecho Царица муравьев скрылась в муравейнике.
mpurge %caricamur%
* else
*  detach 70104 %caricamur% 
* end
~
#70105
предложение царицы~
0 z 0
~
 mecho Царица муравьев вопросительно посмотрела на Вас.
 wait 1
 г Чего стоять. Хотите помочь - ступайте за ним.
 mecho Откуда-то из-под земли вылез маленький муравей.
 mecho Маленький муравей покачал усиками приглашая за собой.
 mecho Маленький муравей убежал вниз.
 wait 1
 mecho Только сейчас вы поняли что внизу открылся провал.
 mecho Вы смело шагнули за маленьким муравьем.
 * телепорт только чаров и их чармисов 
 * если эта команда не работает то можно цикл self.char
 mteleport all 70151
detach 70105 %self.id%
~
#70106
смерть царицы муравьев~
0 f 0
~
 mload obj 70108
~
#70107
дали крылышко ведуну~
0 j 0
~
 wait 1
 if %object.id%==70108                    
  дум
  г Ну что же, вот и избавился я от этой...
  г Вроде обещал что-то я ?
  wait 1
  хмур
  г Сейчас посмотрю что у меня здесь завалялось.
* а завалялось 10к кун
  mload obj 70109
  дать куч %actor.name%
  mpurge крылышко
 else
  г Разозлить меня хочешь ? Зачем мне это ?
  бросить %object.name%
 end
~
#70108
выб_скелет дерется~
0 l 100
1500~
* поднимаем случайно скелетов и вампиров
if (%random.12%==1)
  mecho Выбеленый скелет взмахнул рукой, раздался хруст костей.
if (%random.3%==1)
   mecho Из земли позади Вас встал вампир.
   mload mob 70107
  else
   mecho Из земли позади Вас встал скелет.
   mload mob 70106
  end
 end
~
#70109
смерть выбеленного скелета~
0 f 100
~
calcuid room %self.vnum% room
set charhere %room.people%
while %charhere%
set todelet %charhere%
if %todelet.vnum% == 70106
purge %todelet%
end
if %todelet.vnum% == 70107
purge %todelet%
end
set charhere %charhere.next_in_room%
done
calcuid room 70150 room
attach 70116 %room.id%
run 70116 %room.id%
~
#70110
нападение на ведуна~
2 z 100
~
wait 120s
if %exist.mob(70101)%
* wecho Муравьи повылазили со всех сторон.
* wload mob 70103
* wload mob 70103
wload mob 70104
wload mob 70104
* wload mob 70105
* wload mob 70105
* wload mob 70105
 wload mob 70102
 wecho Царица муравьев вышла из-за спины ведуна.
 wecho Царица муравьев сказала : 'Ведун, ты готов покинуть этот лес ?'
 wait 1
 wecho Старый усталый ведун посмотрел на царицу муравьев.
 wecho Старый усталый ведун сказал : 'Нам не разделить силу леса'
 wecho Старый усталый ведун сказал : 'А убить меня сил у тебя мало'
 wait 1
 wecho Царица муравьев сказала : 'Теперь мы справимся!'
 wecho Цaрица муравьев сказала : 'Вперед дети мои!'
wait 1
wecho Старый усталый ведун сказал : 'Нет, ТЫ умрешь первой !!!'
* foreach murav %self.npc%
*  if %murav.id%==70103
*   wforce %murav% атак стар.устал.веду
*  else
*   if %murav.id%==70104
*    wforce %murav% атак стар.устал.веду
*   else
*    if %murav.id%==70105
*     wforce %murav% атак стар.устал.веду
*    end
*   end
*  end
* done
calcuid vedun 70101 mob
wforce %vedun% атак царица
 * атачим тригер на ведуна, для атаки муравьев во время боя
attach 70111 %vedun.id%
end 
~
#70111
муравьи атакуют ведуна~
0 k 0
~
* если муравья спасают, то он не впишется сам, поэтому сделал это триг
* триг на ведуне, пока он не умрет, 
 foreach murav %self.npc%
* конечно надо поставить условие and, но я не знаю пока как
* привык что в олц не работают условия такие.
* не знаю делать проверку на селффайтинг. или и так пойдет :)  
  if %murav.id%==70103
   wforce %murav% атак стар.устал.веду
  else
   if %murav.id%==70104
    wforce %murav% атак стар.устал.веду
   else
    if %murav.id%==70105
     wforce %murav% атак стар.устал.веду
    else
     if %murav.id%==70102
wforce %murav% атак стар.устал.веду
     end
    end
   end
  end
 done
~
#70112
смерть ведуна~
0 f 0
~
 *пуржим муравьев если они есть
 * оставляем один ключ если его муравьи полутят :( - надо проверить
 * возможно тут убивать муравьев пока они бьют ведуна, надо бы это убрать
 * сделал вот так (триг 70113):
 * проверка на нанесение дамаги по мур. если актор - игрок
 * всем муравьям отступить и атак этого игрока и выключить триг, далее сами
 * разберуться. по игрокам бить они хелперы вроде    
calcuid muravatt 70138 room
attach 70117 %muravatt.id%
run 70117 %muravatt.id%
~
#70113
атака игрока на муравья~
0 p 0
~
* во время боя с ведуном
 if %self.realroom%==70138
  if %actor.vnum%==-1
* если атакует игрок - то всем муравьям отступить и бить его
   foreach murav %self.npc%
    if %murav.id%==70103
     wforce %murav% отступить
     wforce %murav% атак .%actor.iname%
    else
     if %murav.id%==70104
      wforce %murav% отступить
      wforce %murav% атак .%actor.iname%
     else
      if %murav.id%==70105
       wforce %murav% отступить
       wforce %murav% атак .%actor.iname%
      else
       if %murav.id%==70102
        wforce %murav% отступить
        wecho Царица муравьев огорченно покачала головой.
        wecho Царица муравьев сказала : 'Ты зря вмешался, мы отомстим'
        wforce %murav% атак .%actor.iname%
       end
      end
     end
    end
   done              
  end
* детачим этот тригер со всех муравьев
 calcuid myravatt 70138 room
 attach 70114 %muravatt%
 run 70114 %muravatt%
 end
~
#70114
убрать проверку атаки игрока~
2 z 0
~
* удаляет триг 70113 со всех муравьев, !но! 70113 и вызывает этот триг
 foreach murav %self.npc%
  if %murav.id%==70103
   detach 70113 %murav%
  else
   if %murav.id%==70104
    detach 70113 %murav%
   else
    if %murav.id%==70105
     detach 70113 %murav%
    else
     if %murav.id%==70102
      detach 70113 %murav%
     end
    end
   end
  end
 done
* убрать триг атаки муравьев на ведуна
 calcuid vedun 70101 mob
 detach 70111 %vedun%
~
#70115
загруз_царицы_мур~
2 z 100
~
if !%exist.mob(70102)%
wload mob 70102
calcuid caricamur 70102 mob
attach 70104 %caricamur.id%
else
wecho Царица муравьев улыбнулась.
end
calcuid muraveinik 70124 room
detach 70115 %muraveinik.id%
~
#70116
после смерти скелета~
2 z 100
~
wait 1
wecho До Вас донесся голос царицы муравьев:
wecho - Спасибо, вам.
wecho - Теперь мы сможем побороть ведуна.
eval buffer %actor.exp(+10000)%
wsend %actor% - Тебе, особенное спасибо, твой удар был лучшим.
wait 1
wecho Лес расступился и вы увидели знакомый муравейник.
wecho Вы смело шагнули к нему.
wteleport all 70124
calcuid muravatt 70138 room
attach 70110 %muravatt.id%
run 70110 %muravatt.id%
detach 70116 %self.id%
~
#70117
после смерти ведуна~
2 z 100
~
wait 1
foreach murav %self.npc%
if %murav.vnum%==70103
wpurge %murav%
wecho Муравей-охранник убежал.
else
if %murav.vnum%==70104
wpurge %murav%
wecho Муравей-следопыт убежал.
else
if %murav.vnum%==70105
wpurge %murav%
wecho Муравей-рабочий убежал.
else
if %murav.vnum%==70102
wecho Царица муравьев говорит :
wecho - Теперь в МОЕМ лесу мир, и спокойствие.
wecho - Мои дети станут еще больше, еще сильнее.
wecho - Мы принесем спокойствие всем !
wecho Царица муравьев ухмыльнулась и исчезла.
wpurge %murav%
end
end
end
end
done
detach 70117 %muravatt.id%
~
#70118
репоп зоны~
2 f 100
~
calcuid room 70124 room
attach 70101 %room.id%
attach 70102 %room.id%
~
#70119
удалить этот тригер~
0 z 100
~
* здесь был создан ненужный тригер в ОЛЦ
~
$~
