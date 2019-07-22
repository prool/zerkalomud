#6700
выломать камень~
2 c 0
выломать разломать ломать~
if !(%arg.contains(камень)%) 
  wsend %actor% Что это Вы хотите выломать???
  return 0
  halt
end
wsend %actor% Вы выбрали валун побольше и сильно ударили по нему!
wechoaround %actor% %actor.name% сильно ударил%actor.g% по самому большому камню ногой!
wait 1s
wecho От одной из глыб отвалился камень с острыми краями.
wload obj 6700
calcuid kamen 6720 room
detach 6700 %kamen.id%
~
#6701
пролезть в норку вниз~
2 c 0
лезть пролезть влезть~
if !(%arg.contains(нора)%) 
  wsend %actor% Куда это Вы хотите пролезть???
  halt
end
if (!%actor.rentable%)
  wsend %actor% Кровь на ваших руках не дает вам сделать этого!
  halt
end
wsend %actor% Вы как тот змей пролезли в нору.
wechoaround %actor% %actor.name% полез%actor.q% в нору.
wait 1s
wsend %actor% Странно, но вы не застряли в лазе и благополучно оказались где то.
wteleport %actor.name% 6771
~
#6702
пролезть в норку вверх~
2 c 0
выбраться лезть пролезть влезть~
if !(%arg.contains(нора)%) 
  wsend %actor% Куда это Вы хотите пролезть???
  halt
end
if (!%actor.rentable%)
  wsend %actor% Кровь на ваших руках не дает вам сделать этого!
  halt
end
wsend %actor% Вы с как тот змей пролезли в нору.
wechoaround %actor% %actor.name% полез%actor.q% в нору.
wait 1s
wsend %actor% Странно, но вы не застряли в лазе и благополучно выбрались на свежий вздух.
wteleport %actor.name% 6719
wat 6719 wechoaround %actor% Кто-то пролез сюда снизу.
~
#6703
репоп тригеров~
2 f 100
~
context 67
calcuid norkad 6719 room
attach 6701 %norkad.id%
calcuid kamen 6720 room
attach 6700 %kamen.id%
unset qwestik67
calcuid norkam 6717 room
attach 6706 %norkam.id%
attach 6707 %norkam.id%
calcuid medwed 6700 mob
attach 6709 %medwed.id%
detach 6710 %medwed.id%
~
#6704
зашел на бревно~
2 g 20
~
wait 1
if %random.20%<4
  wsend %actor% Вы соскользнули с бревна и с криком полетели вниз!
  wait 1
  wsend %actor% Оказались вы на дне этого гнилого оврага.
  wteleport %actor.name% 6740
  wechoaround %actor% Кто-то свалился сюда с бревна.
end
~
#6705
вылезти из оврага~
2 c 0
вылезти лезть ~
if !(%arg.contains(вверх)%) 
  wsend %actor% Куда это Вы хотите вылезти???
  return 0
  halt
end
wsend %actor% Схватившись за ветви дерева, вы полезли вверх.
wechoaround %actor% %actor.name% полез%actor.q% вверх по стволу дерева.
wait 1s
wsend %actor% Вы легко выбрались из оврага на широкие просторы.
wteleport %actor.name% 6743
wat 6743 wechoaround %actor% Кто-то пролез сюда снизу.
~
#6706
залезть в муравейник~
2 c 0
залезть лезть пролезть~
if !(%arg.contains(муравейник)%) 
  wsend %actor% Куда это Вы хотите залезть???
  return 0
  halt
end
context 67 
if !(%qwestik67% == %actor.name%)
  wsend %actor% Чтобы пролезть в муравейник надо сначала превратиться в муравья!
  return 0
  halt
end
if !%actor.rentable%
  wsend %actor% Кровь на ваших лапах не дает вам сделать этого!
  halt
end
context 67 
wsend %actor% Будучи очень маленьким, вы пролезли в муравейник.
wechoaround %actor% %actor.name% полез%actor.q% в маленькое отверстие муравейника.
wait 1s
wsend %actor% Вы в душной и тесной норке.
wteleport %actor.name% 6774
wat 6774 wechoaround %actor% Кто-то пролез сюда сверху.
unset %qwestik67% 
calcuid norkam 6717 room
detach 6706 %norkam.id%
~
#6707
превратиться в муравья~
2 c 0
превратиться~
if !(%arg.contains(муравей)%) 
  wsend %actor% В кого вы хотите превратиться???
  return 0
  halt
end
context 67 
eval qwestik67 %actor.name%
calcuid norkam 6717 room
remote qwestik67 %norkam.id%
wsend %actor% Вы стали меньше букашки-таракашки. Зачем вам это!?
wechoaround %actor% %actor.name% сказал%actor.q% магические слова и стал%actor.q% размером с букашку.
calcuid norkam 6717 room
detach 6707 %norkam.id%
~
#6708
у медведя в бою~
0 k 100
~
if  (%random.25% < 3)
  msend %actor% Медведь изогнул щепу и отпустил ее прямо Вам в голову!
  mechoaround %actor% %actor.name% получил%actor.q% удар щепой по лбу. 
  mdamage %actor% 15
end
~
#6709
медведь дает квест~
0 q 100
~
wait 2s
взд 
wait 5s
say Как мне тяжело....
пла
wait 2s
say Как мне тяжко.... Всех готов заломать..
attach 6710 %self.id%
detach 6709 %self.id%
~
#6710
перс говорит помогу~
0 d 0
помогу~
wait 2s
mecho "Ну попробуй..." - грустно взревел медведь.
mecho "Дело в том, что пчелы меня закусали, не дают медом полакомиться..." - сказал медведь
пла
wait 2s
mecho "А все из-за того, что у ихнего друга шмеля, кто-то украл жало" - простонал медведь.
mecho "При чем тут я? Не понимаю..." - сказал медведь.
mecho "Помоги, и я тебе скажу спасибо!" - проревел медведь.
wait 2s
mecho "Но учти, что шмеля просто так не найдешь, он от горя спрятался и сидит в улье"
mecho "Его надо выманить" - подсказал медведь.
detach 6710 %self.id%
~
#6711
беспокоить улей~
2 c 0
беспокоить ломать лезть тревожить шурудить~
if !(%arg.contains(улей)%) 
  wsend %actor% Что вы хотите беспокоить???
  return 0
  halt
end
wsend %actor% Вы схватили палку и начали грубо беспокоить пчелок! Зачем, они ж вас не трогают.
wechoaround %actor% %actor.name% начал%actor.g% беспокоить пчелок. Они ему мешали?
wait 1s 
wecho Внезапно из улея вылетел рой пчел на защиту своего дома!
wload mob 6732
wload mob 6732
wload mob 6732
wload mob 6732
calcuid uleizimnii 6760 room
detach 6711 %uleizimnii.id%
~
#6712
репопим незимние тригера~
1 n 100
~
calcuid uleizimnii 6760 room
attach 6711 %uleizimnii.id%
attach 6713 %uleizimnii.id%
~
#6713
перс выманивает шмеля~
2 c 0
выманить привлечь~
if !(%arg.contains(шмель)%) 
  wsend %actor% Кого вы хотите выманить???
  return 0
  halt
end
wsend %actor% Вы сказали "Жжж. Жжж."
wechoaround %actor% %actor.name% сказал%actor.g% : "Жжж. Жжж."
wait 1s 
wecho Из улея медленно выполз грустный шмель, надеясь, что найдет здесь шмелиху
wload mob 6730
calcuid shmell 6730 mob
attach 6714 %shmell.id%
wait 3s
wecho Шмель недоуменно зажужжал, понимая что что то не так.
calcuid uleizimnii 6760 room
detach 6713 %uleizimnii.id%
~
#6714
дали жало шмелю~
0 j 100
~
if %object.vnum%==6707
  wait 2s
  mecho "Жжжжжжжж." - благодарно протянул шмель.
  wait 2s
  mecho "Жжжачем мне это? Жжжж. Я жжж не прижжью себе снова жжжало!"
  mpurge %object%
  wait 5s
  mecho "Жжжж. Но спасибо всежжжж."- прожужжал шмель.
  mecho Шмель дунул на жало, и оно осветилось легким светом.
  wait 3s
  if %world.curobjs(6713)% < 100
    mload obj 6713
    дат жало %actor.name%
    mecho "Держжжи и не жужжии."- прожужжал шмель.
  end
end
~
#6715
вылезть из муравейника~
2 c 0
вылезти лезть пролезть~
if !(%arg.contains(наружу)%)
  wsend %actor% Куда это Вы хотите вылезти???
  return 0
  halt
end
wsend %actor% Будучи очень маленьким, вы вылезли из муравейника.
wait 1s
wsend %actor% Вы снаружи.
wat 6774 wecho Кто-то пролез сюда снизу.
wteleport %actor.name% 6717
~
#6716
померал матка~
0 f 100
~
mload obj 6707
~
$~
