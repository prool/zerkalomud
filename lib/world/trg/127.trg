#12700
муравьи выползают~
2 ab 100
~
set kto %self.people%
eval skolko 0
while %kto%
 if (%kto.vnum% == 12720)
  eval skolko %skolko%+1
 end
 set kto %kto.next_in_room%
done
if (%skolko% < 15)
 set zigr %self.people%
 while %zigr%
  if (%zigr.vnum% == -1) && %zigr.fighting%
   wecho Еще один муравей вылез из муравейника.
   wload mob 12720
   halt
  end
  set zigr %zigr.next_in_room%
 done
end
~
#12701
смерть ежа~
0 f 0
~
if %kpotapych%
 set zigr %self.people%
 while %zigr%
  if (%zigr% == %kpotapych%)
   eval yozhmertv %kpotapych%
   calcuid gdezveri 12703 room
   remote yozhmertv %gdezveri.id%
   halt
  end
  set zigr %zigr.next_in_room%
 done
end
if (%world.curobjs(12715)% < 1)
 mload obj 12715
end
~
#12702
смерть жабы~
0 f 0
~
mecho Жаба с треском разорвалась и ее ядовитые останки забрызгали вас!
foreach zigr %self.pc%
 mdamage %zigr% 150
done
if (%world.curobjs(12712)% < 4)
 mload obj 12712
end
~
#12703
заходим к медведю~
2 e 100
~
wait 1s
if %exist.mob(12731)% && %exist.mob(12735)%
 wecho Волк с лисой взглянули на вас грустными глазами.
 wecho Медведь оглядел вас с головы до пят и покачал головой.
 wecho Медведь сказал:
 wecho - Привет тебе от больших зверей лесных.
 wecho - Своей ли волею али неволею пришел к нам?
 wecho - Беда страшная на нас свалилась. Едва ли уйдешь отсюда живым...
 wecho - Но если храбр ты и силен, можешь попробовать помочь.
 attach 12704 %self.id%
 detach 12703 %self.id%
end
~
#12704
выдача квеста~
2 d 0
хорошо могу попробую помогу~
wait 1s
if (%actor.vnum% != -1)
 halt
end
if %exist.mob(12731)% && %exist.mob(12735)%
wecho - Да, вижу ты не робкого десятка.
wecho - Слушай теперь.
wecho - Завелись в нашем лесу прежде неведомые гады.
wecho - Мелкие мушки, комары, жучки, паучки размером стали больше нас, зверей.
wecho - Да на нас и начали охотиться. Как кого увидят - сразу сожрут.
wecho - И стали у них челюсти железные, броня медная, крылья стеклянные.
wecho - Прячемся мы теперь на деревьях, потому что твари эти тяжелые, кто и летает,
wecho - то невысоко, кое-как. Но пытаются и к нам пробраться, так что мы ночей
wecho - не спим, все караулим.
wecho - Вот сидим тут, я Михайло Потапыч медведь, да кум волк, да кума лиса.
wecho Волк сказал :
wecho - А нам, волкам, каково?
wecho - Знаешь ведь, что не нашей породе по деревьям лазить.
wecho - А пришлось. Кто не смог, того уже и косточек не осталось.
wecho Лиса сказала :
wecho - Какого же страху в родном-то лесу я натерпелась. Лисят моих жук сожрал.
wecho - За мной пчелы гнались, я в куст забилась, еле уцелела.
wecho Медведь сказал :
wecho - У комаров жало что твой нож. Одним ударом насмерть закалывают.
wecho - Пчелы да осы ядом с одного укуса убивают.
wecho - Пауки целых лосей высасывают. А уж носятся как угорелые, любого зайца догонят.
wecho - По земле жуки бегают, челюстями все что попадется крошат.
wecho - Над лесом стрекозы летают, крылья у них огромные, между деревьями не пролазят.
wecho - Ящерицы что Змей-Горыныч, хвостом в лепешку расшибают.
wecho - Черви дождевые больших зверей целиком глотают.
wecho - А самый сильный у них, слыхал я, - еж!..
wecho - Попробуй одолеть их. И главное, узнай откуда же все они взялись.
wecho - Мы хоть и всю жизнь в лесу живем, а одарить тебя чем найдется.
makeuid kpotapych %actor.id%
calcuid yozh 12731 mob
calcuid koldun 12735 mob
remote kpotapych %yozh.id%
remote kpotapych %koldun.id%
attach 12705 %self.id%
detach 12704 %self.id%
end
~
#12705
конец квеста~
2 e 100
~
wait 1s
if %actor% == %yozhmertv%
 wecho Медведь внимательно посмотрел на вас.
 wait 1s
 wsend %actor% Вы рассказали медведю о том, как уничтожили всех тварей.
 wsend %actor% О том, как убили железного ежа-великана.
wechoaround %actor% %actor.name% рассказал%actor.g% медведю о том, как вы уничтожили всех тварей.
 wechoaround %actor% Как убили железного ежа-великана.
 if %actor% == %koldunmertv%
  wsend %actor% И назвали причину всех несчастий - злобного колдуна.
  wechoaround %actor% И назвал причину всех несчастий - злобного колдуна.
  wait 3s
  wecho Медведь утвердительно кивнул.
  wecho - Знаю, знаю, а как же - сорока за вами летала, все мне рассказала.
  wecho - Вот как выходит - все зло на земле от вас, людей.
  wait 3s
  wecho - Да нет, не принимай на свой счет, это я так, размышляю.
  wecho - Спасибо тебе от всех зверей и птиц лесных, избавил ты нас от смерти.
  wecho Медведь низко поклонился перед вами и чуть не свалился с дерева.
  wecho - Получи же свою награду.
  wait 3s
  wecho Медведь полез лапой в дупло, пошарил там и вытащил чугунный котел.
  wload obj 12718
  wecho - В прошлом году копал я себе берлогу и вырыл котел полон золота.
  wecho - Наверно, разбойники награбленное схоронили.
  wecho - Нам, зверям, деньги не нужны, а тебе пригодятся.
  wforce %actor% взять котел
  switch %random.2%
  case 1
   if (%world.curobjs(12716)% < 1)
    wait 2s
    wecho - Да, вот еще.
    wecho Медведь снова сунул лапу в дупло и выудил горшок с медом.
    wload obj 12716
    wecho - На черный день я хранил.
    wecho - Но теперь, когда лес очищен, мы еду себе найдем.
    wecho - Так что возьми себе. Видишь, мне для тебя даже любимого лакомства не жалко.
    wforce %actor% взять горшок
   end
  break
  case 2
   if (%world.curobjs(12717)% < 1)
    wait 2s
    wecho - Да, вот еще.
    wecho - Медведь снова сунул лапу в дупло и выудил охотничий ремень.
    wload obj 12717
    wecho - В прошлом году, летом, встретил я в лесу одного охотника.
    wecho - Был он с рогатиной, меня, медведя, убить хотел.
    wecho - Вот все, что от него осталось. Бери, думаю вещь хорошая, хоть и несъедобная.
    wforce %actor% взять ремень
   end
  break
  done
  wait 3s
  wecho Звери слезли с дерева и разбежались.
  calcuid medved 12734 mob
  calcuid volk 12733 mob
  calcuid lisa 12732 mob
  wpurge %medved%
  wpurge %volk%
  wpurge %lisa%
  detach 12705 %self.id%
  halt
 else
  wait 3s
  wecho Медведь утвердительно кивнул.
  wecho - Знаю, знаю, а как же - сорока за вами летала, все мне рассказала.
  wecho - Но вот всех-то ты убил%actor.g%, а так и не выяснил, откуда же
  wecho - эта нечисть к нам поналезла.
  wecho - А вдруг завтра они снова изо всех щелей попрут?
  wecho Медведь посмотрел вниз на землю и задумался.
  halt
 end
end
~
#12706
еж в бою~
0 k 100
~
* Еж колет иголками всех в комнате, если не похолжен.
if !%self.affect(обездвижен)%
 set zigr %self.people%
 while %zigr%
  if %zigr.vnum% != 12731
   msend %zigr% Еж СМЕРТЕЛЬНО уколол Вас.
   eval povrezhd %random.33%+10
   if (%random.3% == 1)
    %zigr.position(6)%
   end
   if (%random.3% == 1)
    %zigr.wait(2)%
   end
   mdamage %zigr% %povrezhd%
  end
  set zigr %zigr.next_in_room%
 done
end
~
#12707
смерть колдуна~
0 f 0
~
 if %kpotapych%
 set zigr %self.people%
 while %zigr%
  if (%zigr% == %kpotapych%)
   eval koldunmertv %kpotapych%
   calcuid gdezveri 12703 room
   remote koldunmertv %gdezveri.id%
   halt
  end
  set zigr %zigr.next_in_room%
 done
end
~
#12708
смерть осы~
0 f 0
~
if (%world.curobjs(12700)% < 5) && (%random.3% == 1)
 mload obj 12700
end
if (%world.curobjs(12706)% < 5) && (%random.4% == 1)
 mload obj 12706
end
~
#12709
смерть пчелы~
0 f 0
~
if (%world.curobjs(12701)% < 8) && (%random.4% == 1)
 mload obj 12701
end
~
#12710
смерть шмеля~
0 f 0
~
if (%world.curobjs(12702)% < 1) && (%random.2% == 1)
 mload obj 12702
end
~
#12711
смерть жука-рогача~
0 f 0
~
if (%world.curobjs(12704)% < 5) && (%random.3% == 1)
 mload obj 12704
end
~
#12712
смерть навозного жука~
0 f 0
~
if (%world.curobjs(12705)% < 4)
 mload obj 12705
end
~
#12713
смерть паука~
0 f 0
~
if (%world.curobjs(12707)% < 5) && (%random.2% == 1)
 mload obj 12707
end
~
#12714
смерть червя~
0 f 0
~
if (%world.curobjs(12709)% < 5)
 mload obj 12709
end
~
#12715
смерть ящерки~
0 f 0
~
if (%world.curobjs(12710)% < 4)
 mload obj 12710
end
~
#12716
смерть лягушки~
0 f 0
~
if (%world.curobjs(12711)% < 1)
 mload obj 12711
end
~
#12717
смерть улитки~
0 f 0
~
if (%world.curobjs(12713)% < 2)
 mload obj 12713
end
~
#12718
смерть стрекозы~
0 f 0
~
if (%world.curobjs(12714)% < 4) && (%random.3% == 1)
 mload obj 12714
end
~
#12719
смерть наездника~
0 f 0
~
if (%world.curobjs(12703)% < 4) && (%random.3% == 1)
 mload obj 12703
end
~
#12720
репоп зоны~
2 f 100
~
calcuid gdezveri 12703 room
attach 12703 %gdezveri.id%
detach 12704 %gdezveri.id%
detach 12705 %gdezveri.id%
rdelete yozhmertv %gdezveri.id%
rdelete koldunmertv %gdezveri.id%
if %exist.mob(12731)%
 calcuid yozh 12731 mob
 rdelete kpotapych %yozh.id%
end
if %exist.mob(12735)%
 calcuid koldun 12735 mob
 rdelete kpotapych %koldun.id%
end
~
$~
