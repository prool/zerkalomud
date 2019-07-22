#79600
Приветствие воина~
0 r 100
~
wait 1
say Здоров будь!
mecho _- Присядь у моего костра, погрейся.
wait 1
say Что привело тебя сюда? Нехорошее тут место, проклятое.
mecho _- Нежить лютует, утаскивает живых людей к себе в яр.
mecho _- Окрестный люд уж зарекся и мимо ездить.
взд
wait 1
say Ужель не боишься?
вопр .%actor.iname%
attach 79601 %self.id%
~
#79601
сказал "не боюсь"~
0 d 3
не боюсь~
wait 1s
say А ты гляжу не робкого десятка!
mecho _- Воин справный, али слова тайные знаешь?
wait 1
say Ну да не моего ума дело...
wat 1s
say Скажу я, как тут дело было
mecho _- Много лет назад, была недалече отсюда злая битва.
mecho _- Много славных воев легло, много поживы было воронью...
взд
wait 1
say Был я тогда куда моложе. Силен, ловок, драться учен.
mecho _- Сам воевода меня за десницу почитал, поверял свои думы.
mecho _- В ночь перед битвой стояли мы в деревушке соседней.
mecho _- С тех пор и помнят меня тут, знают.
wait 1
say Много зим миновало. Воевода тот, славный Богдан, пал тогда, да и битву ту почитай забыли везде.
say Но тут люди помнят. Узнали и меня, когда снова привела меня судьба в эти края.
wait 1
взд
say Неладное тут творится, дурное. 
mecho _- Нежить... Да я сказывал. Злоба ли людская ее приманила, давняя ли битва.
mecho _- Или же тела, брошенные без погребения. 
wait 1
say Попросили они меня о помощи, нежить прогнать, а лучше колдунов извести, что ее подняли.
mecho _- Сказывают, видели тут трех ведьм намедни.
хмур
say Да только стар я стал. Видел стервь на дороге? Осилил вот... Да и сам не уберегся.
emot указал на перевязанную руку
say Чую, не совладать мне.
mecho _- Но тебя-то годы не давят, не тяготят, силы не занимать, да и храбрости, я гляжу.
mecho _- Поможешь? А уж награду, что люди тутошние обещали, тебе отдам.
mecho _- Твоя по праву будет.
вопрос .%actor.name%
attach 79615 %self.id%
detach 79600 %self.id%
detach 79601 %self.id%
~
#79602
крик под мостом~
2 g 40
~
wait 1
wecho _Вы услышали рычание и завывание откуда-то снизу!
~
#79603
триг костра~
2 e 20
~
wait 1s
wecho _Костер тихонько затрещал, освещая своим пламенем землю и согревая все вокруг.
~
#79604
Греться у костра~
1 c 100
погреться греться~
wait 1s
oecho %actor.iname% присе%actor.q% погреться у костра.
wait 2s
oecho _Уголек, словно живой, выскочил из костра и упал рядом.
oload obj 79601
detach 79604 %self.id%
**тут бы еще пурж костра?
*Не нужно, триг же детачится.
~
#79605
Игрок вошел к ведьмам.~
0 q 100
~
context 796
wait 1
say О, едово притопало!
ухм
wait 1
mforce %oldwitch% say Охолонь. Идут себе смертные по своим делам, и пусть идут.
mforce %oldwitch% say Али не просто идут, а помощи ищут?
mforce %oldwitch% миг .%actor.name%
wait 2
emot пожала плечами и сделала большой глоток из бутыли
set quest 0
foreach target %self.pc%
  if (%target.id% == %quest796%)
    set quest 1
  end
done
if (%quest% == 0)
  mforce %youngwitch% say Без дела шляются, бабушка.
  mforce %youngwitch% say Бродят тут, нежить бередят, скоро на корм ей пойдут.
  wait 1
  mforce %oldwitch% Вот оно как...
  mforce %oldwitch% хмур
  mforce %oldwitch% emot гикнула-свистнула, и перед вашии глазами все завертелось в круговерти
  foreach victim %self.pc%
    dg_cast 'слово возврата' .%victim.name%
  done
  halt
end
wait 2s
mforce %youngwitch% say Злодеев они ищут, бабушка.
mforce %youngwitch% say Тех, что яр опоганили, землю кровью окропили, нежить приманили.
mforce %youngwitch% emot сыпанула в котелок пригоршню чего-то, похожего на человечьи зубы
wait 3
mforce %oldwitch% say Что же, чего же, это можно.
mforce %oldwitch% say Только потребно кое-что для этого.
wait 2s
mforce %oldwitch% say Хвостов червей, что из земли мудрость берут.
wait 2
mforce %youngwitch% say Саван с призраков, что из-за порога вернулись!
wait 2
mforce %oldwitch% shout Плоть мертвеца, что покоя не знает!
wait 2
mforce %youngwitch% shout Зубы чудищ, кровью упивающихся!
wait 2
mforce %oldwitch% shout Сердце беса, жалости не ведающиго!
wait 4
shout И вина! Вина!!!
mforce %oldwitch% emot запустила в рыжую ведьму костью
wait 1
say Да ладно тебе, все своим высоким штилем.
буб
wait 1
say Глаза надобны, не рыбьи, не птичьи, не звериные, да и не человечьи...
say Как хочешь, так и понимай! А так - и твои сгодятся!
хохот
mforce %youngwitch% хохот
mforce %oldwitch% хохот
wait 1
say Все ли ясно? Ну и проваливай... А то я проголодалась.
emot снова основательно приложилась к бутыли
detach 79605 %self.id%
~
#79606
квест - лоад глаза оборотня + стаф~
0 f 100
~
*если моб последний
if (%world.curmobs(79602)% == 1)
  mload obj 79602
  set werewolfisdead 1
  global werewolfisdead
  calcuid warrior 79600 mob
  remote werewolfisdead %warrior%
end
if (%world.curobjs(79625)% < 4) && (%random.100% < 9)
  mload obj 79625
end
~
#79607
квест - лоад клыков вампира + стаф~
0 f 100
~
*если моб последний
if (%world.curmobs(79605)% == 1)
  mload obj 79603
  set vampireisdead 1
  global vampireisdead
  calcuid warrior 79600 mob
  remote vampireisdead %warrior%  
end
if (%world.curobjs(79622)% < 4) && (%random.100% < 9)
  mload obj 79622
end
~
#79608
квест - лоад обрывка савана + стаф~
0 f 100
~
*если моб последний
if (%world.curmobs(79606)% == 1)
  mload obj 79604
  set ghostisdead 1
  global ghostisdead
  calcuid warrior 79600 mob
  remote ghostisdead %warrior%  
end
if (%world.curobjs(79611)% < 4) && (%random.100% < 9)
  mload obj 79611
end
~
#79609
квест - лоад хвоста червя + стаф~
0 f 100
~
*если моб последний
if (%world.curmobs(79607)% == 1)
  mload obj 79606
  set wormisdead 1
  global wormisdead
  calcuid warrior 79600 mob
  remote wormisdead %warrior%
end
if (%world.curobjs(79626)% < 4) && (%random.100% < 9)
  mload obj 79626
end
~
#79610
квест - лоад ребра мертвяка + стаф~
0 f 100
~
*если моб последний
if (%world.curmobs(79608)% == 1)
  mload obj 79607
  set undeadisdead 1
  global undeadisdead
  calcuid warrior 79600 mob
  remote undeadisdead %warrior%
end
if (%world.curobjs(79627)% < 4) && (%random.100% < 9)
  mload obj 79627
end
~
#79611
квест - лоад сердца беса~
0 f 100
~
eval serbes %world.curmobs(79609)%+%world.curmobs(79610)%
*если моб последний
if (%serbes% == 1)
  mload obj 79608
  set devilisdead 1
  global devilisdead
  calcuid warrior 79600 mob
  remote devilisdead %warrior%
end
~
#79612
сдаем итемы ведьмам~
0 j 100
~
context 796
if (%actor% != %quest796%)
  msend %actor% _Не стоит, а то доживать потом век лягушкой, али ужакой...
  return 0
  halt
end
wait 1
switch %object.vnum%
  case 79602
    set eye796 1
    worlds eye796
  break
  case 79603
    set fang796 1
    worlds fang796
  break
  case 79604
    set shroud796 1
    worlds shroud796
  break
  case 79606
    set tail796 1
    worlds tail796
  break
  case 79607
    set edge796 1
    worlds edge796
  break
  case 79608
    set heart796 1
    worlds heart796
  break
  default
    say Зачем ты мне суешь это?
    mecho _- Тут зелье колдовское, а не ирландское рагу, понимать надо!
    плюн
    give all .%actor.name%
    halt
  done
  switch %random.5%
    case 1
      say Годится!
    break
    case 2
      say Экая дрянь, нежней рубить нести нельзя было? Ладно, сойдет.
    break
    case 3
      say В хорошем зелье -- ничего лишнего, ничего ненужного... 
    break
    case 4
      say Варево кипи, котел вари!
      хох
    break
    case 5
      say Ай, маладца!
      хих
    break
  done
  set ingr %object.name%
  mjunk all
  wait 2s
  emot бросила %ingr% в котелок и помешала варево
  mecho на вас повеяло странным запахом
  eval result %eye796%+%fang796%+%tail796%+%edge796%+%heart796%+%shroud796%
  *не все ингры сданы
  *say Всего сдано ингров - %result%
  *say %eye796% %fang796% %tail796% %edge796% %heart796% %shroud796%
  if (%result% < 6)
    halt
  end 
  *если все ингр сданы, запускаем шабаш
  exec 79628 %redwitch.id%
  detach 79612 %self.id%
~
#79613
Входят к воину после квеста~
0 q 100
~
if (%actor.id% != %quest796%)
  halt
end
wait 1
say Ну что, сделано дело?
вопрос
attach 79614 %self.id%
detach 79613 %self.id%
~
#79614
Сказал "готово" у воина~
0 d 0
да готово сделано конечно~
wait 1
if (%actor.id% != %quest796%)
  halt
end
eval monsters %werewolfisdead%+%wormisdead%+%undeadisdead%+%vampireisdead%+%ghostisdead%+%devilisdead%
if (%monsters% < 6)
  say Правда ли?
  wait 1s
  mecho _Тут из яров донесся жуткий вой.
  emot вздрогнул и схватился за оружие
  wait 3
  плюн
  say Струсил%actor.g% - так и скажи, а врать неча!
  halt
end
wait 1s
say Вот и славно!
*вариант 1 -- ведьмы убиты
if (%witchesisdead% == 1)
  say И злодеек этих ведьмовских наш%actor.g% и смерти предал%actor.q%?
  wait 1s
  say Совсем хорошо! Вот и награда обещанная.
  wait 3
  *генережка средней награды -- за убийство ведьм
  eval treasures 79628 79629 79630 79631 79632
  set prize
  foreach item %treasures%
    *составляем список внумов предметов, которых меньше максимума в мире
    if (%world.curobjs(%item%)% < %world.maxobj(%item%))
      eval prize %prize% %item%
    end
  done
  %prize.trim%
  *число предметов в награду "не более чем"
  set maxitems 2
  set numofitems %prize.words%
  if (%maxitems% > %numofitems%)
    set maxitems %numofitems%
  end
  while (%maxitems% > 0)
    eval n %random.num(%numofitems%)%  
    eval itemnum %prize.words(%n%)%
    *на случае если дважды выпал один и тот же номер
    if ((%world.curobjs(%itemnum%)% < %world.maxobj(%itemnum%)) && (%random.100% < 21))
      mload obj %itemnum%
    end
    eval maxitems %maxitems%-1
  done
  mload obj 79613
  give all .%actor.name%
  say Я еще передохну тут... Спасибо тебе, вовек не забуду, да и народ местный тоже.
  ухм
  halt
end
*вариант 2 -- упустил ведьм
say А бесовок этих, ведьм проклятых -- порешил%actor.q%?
wait 1s
say Как нет?
emot с досадой сплюнул
wait 1s
say Эх ты, в них же небось самая злоба была! Нежить эта -- их рук дело, не иначе.
mecho _- Коли они уцелели -- так новой нежити наплодят, не сочтешь, как звезд на небе!
укор
wait 1s
say Ладно, обещал, так награжу. Невелика награда, да по заслугам.
*минимальная награда - кучка кун
mload obj 79613
give all .%actor.name%
say Чем богат...
mecho Воин встал, подобрал свою котомку, и прихрамывая направился к выходу из яров.
%self.action(-!сражается)%
wait 10s
mecho Воин скрылся из виду за поворотом.
wait 1
mpurge %self%
~
#79615
сказал "помогу" у воина.~
0 d 0
да согласен согласна помогу берусь~
wait 1
if ((%actor.vnum% != -1) || %quest796%)
  halt
end
set quest796 %actor%
global quest796
calcuid witch 79623 mob
remote quest796 %witch.id%
calcuid witch 79624 mob
remote quest796 %witch.id%
calcuid witch 79625 mob
remote quest796 %witch.id%
mecho _Воин перекрестился и благословил Вас.
wait 1
say Удачи.
wait 1
say Чуть не запамятовал.
mecho _- Недавно несколько смельчаков из деревни.
mecho _- Добрались сюда, да завалили спуск в яры камнями.
mecho _- Если нежить и не удержит, то хоть случайный человек не сунется.
mecho _- Возьми вот, чтоб путь расчистить.
wait 1
mecho Старый воин вытянул из кустов и протянул вам преизрядный кол.
mload obj 79636
give здоровенный.кол %actor.name%
drop all
attach 79613 %self.id%
detach 79615 %self.id%
~
#79616
ведьмы убиты~
0 f 100
~
eval witches %world.curmobs(79623)%+%world.curmobs(79624)%+%world.curmobs(79625)%
if (%witches% > 1)
  halt
end
mecho _Умирая, %self.name% упала и опрокинула котелок с варевом в костер.
set witchesisdead 1
global witchesisdead
calcuid warrior 79600 mob
remote witchesisdead %warrior%
~
#79617
ПЕРАЗАГРУЗКА зоны 796 -- гиблый яр~
2 f 100
~
context 796
*чистим мировые переменные
unset eye796
unset fang796
unset tail796
unset edge796
unset heart796
unset shroud796
*закрываем созданные тригами проходы
wdoor 79674 west purge
wdoor 79668 east purge
wdoor 79669 west purge
*удаляем триг на финальную награду квеста
calcuid treasure 79669 room
rdelete quest796 %treasure.id%
detach 79643 %treasure.id%
*** Генерация квеста на чармиса
if (%world.curmobs(79620)% < 2)
  calcuid hideout 79678 room
  attach 79647 %hideout.id%
  switch %random.4%
    case 1
      set qroom 79682
    break
    case 2
      set qroom 79626
    break
    case 3
      set qroom 79639
    break
    case 4
      set qroom 79658
    break
  done
  wat %qroom% wload obj 79650
  calcuid qroom %qroom% room
  attach 79621 %qroom.id%
end
*** Аттачим триги на поливку останков
wait 1
calcuid qroom 79693 room
attach 79632 %qroom.id%
calcuid qroom 79643 room
attach 79632 %qroom.id%
calcuid qroom 79628 room
attach 79632 %qroom.id%
calcuid qroom 79668 room
attach 79636 %qroom.id%
*рандомно лоадим черепа на шестах
set rooms 79604 79607 79613 79616 79618 79621 79624 79626 79629 79628 79643 79649 79659 79663 79682 79690
set i 0
set roomlist
while (%i% < 4)
  set numofrooms %rooms.words%
  eval n %random.num(%numofrooms%)%  
  eval roomnum %rooms.words(%n%)%
  *проверим, что в этой комнате еще нет черепа
  if !%roomlist.contains(%roomnum%)%
    eval roomlist %roomnum% %roomlist%
    set skull 0
  else
    set skull 1
  end
  if !%skull%
    wat %roomnum% wload mob 79632
    eval i %i%+1
  end
  wait 5
done
calcuid swampghost 79612 mob
detach 79659 %swampghost.id%
detach 79658 %swampghost.id%
attach 79657 %swampghost.id%
*чистим выходы в квесте на чармиса
calcuid hideout 79678 room
exec 79662 %hideout.id%
~
#79618
загрузка ведьм~
0 n 100
~
context 796
wait 1s
*по идее с прототипа флаг не снимается, но черт знает... пусть будет.
%self.action(+!сражается)%
calcuid oldwitch 79623 mob
calcuid youngwitch 79624 mob
calcuid redwitch 79625 mob
global oldwitch
global youngwitch
global redwitch
~
#79619
Атаковали воина~
0 k 100
~
detach 79614 %self.id%
shout Ах ты, дрянь беспортошная!
shout Ко мне, ребята!
mload mob 79629
mload mob 79630
mload mob 79631
detach 79619 %self.id%
~
#79620
Батл триг черепа на шесте~
0 k 30
~
set target %random.pc%
if !%target%
  halt
end
*чтоб не кастил 2 раза подряд в 1 цель
if (%target% == %memtarget%)
  rdelete memtarget %self.id%
  halt
end
set memtarget %target%
global memtarget
msend %target% _&GЧереп резко развернулся в вашу сторону, и его челюсть со стуком упала.&n
mechoaround %target% _&GЧереп резко развернулся в сторону %target.vname%, и его челюсть со стуком упала.&n
mecho &R_Вереница огненный шаров вырвалась изо рта черепа!&n
dg_cast 'огненный шар' .%target.name%
dg_cast 'огненный шар' .%target.name%
~
#79621
Добываем котомку (генерация квеста на чармиса)~
2 c 0
достать вытащить извлечь поднять подцепить выкопать~
wait 1
if !%arg.contains(котомк)%
  wsend %actor% _Вы не видите ничего похожего.
  halt
end
wsend %actor% _Вы наклонились, подобрали изодранную котомку и стряхнули с нее землю.
wechoaround %actor% %actor.name% наклонил%actor.u%, подобрал%actor.q% котомку и стряхнул%actor.q% с нее землю.
wload obj 79651
calcuid bag 79651 obj
wait 1
*чекушка водки
wload obj 2092
calcuid vodka 2092 obj
%vodka.put(%bag%)%
*каравай хлеба с пристаней Корсуни
wload obj 2004
calcuid bread 2004 obj
%bread.put(%bag%)%
*записка
wload obj 79652
calcuid letter 79652 obj
%letter.put(%bag%)%
wait 1
%bag.put(%actor%)%
*** Заменяем яму на яму с другим описанием
calcuid pit 79650 obj
wpurge %pit%
wload obj 79653
switch %self.vnum%
  case 79682
    set rooms 79682 79683 79684 79685
    set dirs восток север восток север
    set roomdir north
    set roomdir2 south
  break
  case 79626
    set rooms 79626 79627 79625 79624 79623 79622 79621
    set dirs север север север восток восток юг запад
    set roomdir west
    set roomdir2 east
  break
  case 79639
    set rooms 79639 79630 79640 79642 79644 79647
    set dirs юг запад юг запад юг юг
    set roomdir south
    set roomdir2 north
  break
  case 79658
    set rooms 79658 79659 79662 79661 79663 79665 79664 79667
    set dirs восток восток север восток восток восток юг восток
    set roomdir east
    set roomdir2 west
  break
done
*** Делаем переменные глобалоьными для очистки квеста
global rooms
global dirs
global roomdir
global roomdir2
*** Проходим по списку комнат и аттачим триг на поиск следов
set i 1
foreach k %rooms%
  calcuid qroom %k% room
  set dir %dirs.words(%i%)%
  attach 79644 %qroom.id%
  remote dir %qroom.id%
  eval i %i%+1
done
*** Последней комнате указываем направление выхода в скрытую комнату и обратное
remote roomdir %qroom.id%
remote roomdir2 %qroom.id%
if (%self.id% != %qroom.id%)
  rdelete roomdir2 %self.id%
  rdelete roomdir %self.id%
end
*** Аттачим триггер очистки квеста
attach 79645 %self.id%
*** Удаляем триг генерации квеста
detach 79621 %self.id%
~
#79622
лоад у ужаса~
0 f 100
~
if (%world.curobjs(79633)% < 2) && (%random.100% < 20)
  mload obj 79633
end
~
#79623
завал рассыпается~
1 tz 100
~
wait 1
set weapon %actor.eq(18)% 
if (%weapon.vnum% != 79636)
  halt
end
wait 5
oecho _Завал вдруг заколебался, и с грохотом рухнул вниз, рассыпаясь по яру.
oecho _Видать сложен был непрочно, подойди -- рухнет.
odoor 79674 west room 79676
calcuid bigpole 79636 obj
detach 79627 %bigpole.id%
wait 1
opurge %self%
~
#79624
разобрать завал~
1 c 4
разобрать~
wait 1
if !%arg.contains(завал)%
  osend %actor% _Что вы хотите разобрать?
  halt
end
set weapon %actor.eq(18)% 
if (%weapon.vnum% != 79636)
  osend %actor% _Вам бы взять жердину какую, али кол.
  osend %actor% _А то и пальцы покалечить недолго.
  halt
end
~
#79625
лоад у злыдни~
0 f 100
~
if (%world.curobjs(79634)% < 1) && (%random.100% < 20)
  mload obj 79634
end
~
#79626
предупреждение стражника~
0 q 100
~
wait 1s
say Как ты попал сюда ?
wait 1s
эмо Стражник осмотрел Вас с головы до пят.
wait 1s
say Дальше тебе нельзя, иди обратно !
wait 1s
mecho _Стражник выжидающе уставился на Вас.
detach 79626 %self.id%
~
#79627
Вооружились колом~
1 j 100
~
wait 1
if (%actor.realroom% != 79674)
  halt
end
calcuid zaval 79637 obj
exec 79623 %zaval.id%
~
#79628
Шабаш!!! (сдал все ингры ведьмам)~
0 z 0
~
context 796
wait 1
emot сыпанула в котелок горсть пряно пахнущего порошка
shout Готово варево!
wait 1s
mforce %youngwitch% shout Удалось на славу!
wait 1
mforce %oldwitch% say Заговора слово...
mforce %youngwitch% say Травы колдовские!
say И тайны щепоть!
wait 1
mecho &Y_"Слились воедино, бурлят и кипят, готово зелье -- каждому впору!" -- заорали ведьмы все вместе.&n
wait 1s
%self.action(-!сражается)%
exec 79629 %oldwitch%
exec 79629 %youngwitch%
mecho &GТанцуя и крича, ведьмы закружились вокруг котелка.&n
mecho &GСамое время напасть на них, пока они себя не помнят!&n
wait 4s
say Хочешь ли птицей парить в облаках?
смея
wait 4s
mforce %youngwitch% say Хочешь любимого встретить нежданно?
сия
wait 4s
mforce %oldwitch% say Хочешь забыться, от жизни устав?
mforce %oldwitch% взд
wait 4s
say Или усопшего слово услышать?
mecho _Ведьмы дружно покосились в вашу сторону.
wait 3s
mecho &Y_"Капля лишь зелья поможет тебе, каждому капля -- но только одна" -- завопили колдовки, кружась в бесовском танце.&n
wait 1s
mload obj 79644
calcuid potion 79644 obj
calcuid bowler 79639 obj
%potion.put(%bowler.id%)%
mecho _Молодая ведьма плеснула на себя каплю зелья из котелка, и тут же вместо нее черная кошка юркнула в кусты.
mpurge %youngwitch%
mecho _Старая ведьма плеснула на себя каплю зелья, и расплылась, исчезла полосой тумана среди ветвей.
mpurge %oldwitch%
mecho _Рыжая ведьма плеснула на себя каплю зелья -- и невиданная птица вспорхнула в небеса.
mpurge %self%
~
#79629
снятие !сражается с ведьм~
0 z 100
~
%self.action(-!сражается)%
~
#79630
Дамагнули ведьму - прекращаем шабаш~
0 v 100
~
detach 79628 %redwitch.id%
detach 79630 %self.id%
~
#79631
Дамагнули рыжую ведьму~
0 v 100
~
detach 79628 %self.id%
~
#79632
Окропили останки зельем~
2 c 0
окропить полить брызнуть капнуть плеснуть~
wait 1
if (!%arg.contains(останки)% && !%arg.contains(скелет)%)
  wsend %actor% Что вы собираетесь поливать? Репу?
  halt
end
if !%arg.contains(зелье)%
  wsend %actor% Чем вы тут поливать собрались? Не верблюд, вроде...
  halt
end
if ((%actor.vnum% != -1) || !%actor.haveobj(79644)%)
  wsend %actor% _А зелье-то вы обронили по дороге, вот незадача!
  halt
end
wsend %actor% Вы осторожно выплеснули толику зелья на кости.
wechoaround %actor% %actor.name% осторожно плеснул%actor.g% зельем на человеческие кости.
eval skeletons %world.curobjs(79641)%+%world.curobjs(79642)%+%world.curobjs(79643)%
switch %skeletons%
  case 1
    wsend %actor% _В склянке больше не осталось зелья.
    calcuid potion 79644 obj
    wpurge %potion%
  break
  case 2
    wsend %actor% _Последняя капля зелья плещется на дне склянки.
  break
  case 3
    wsend %actor% _Кажется в склянке осталась еще пара капель зелья.
  break
done
wait 1s
wecho Останки содрогнулись, мороз прошел по вашей коже.
wecho Холодная тень на миг накрыла вас.
switch %self.vnum%
  case 79628
    wload mob 79626
    wload obj 79645
    calcuid skeleton 79641 obj
    wpurge %skeleton%
  break
  case 79643
    wload mob 79627
    wload obj 79646
    calcuid skeleton 79642 obj
    wpurge %skeleton%
  break
  case 79693
    wload mob 79628
    wload obj 79647
    calcuid skeleton 79643 obj
    wpurge %skeleton%
  break
done
detach 79632 %self.id%
~
#79633
Лоад призрака богатыря~
0 n 100
~
wait 1
if (%self.realroom% != 79668)
  emot тяжело вздохнул
  say Я был... воином. Славным воином, немногие могли потягаться со мной.
  say Кто тревожит меня, зачем?
  хмур
  wait 1s
  say Молчишь... Тогда скажу я.
  mecho _- Ты хочешь золота? Или оружия мастерской работы, брони, которой и князь не постыдится?
  mecho _- Я укажу тебе место, где скрыт клад.
  emot горько усмехнулся
  wait 2
  say Но сперва предай мои останки земле.
  emot указал на костяк
  say И моих товарищей, чьи души скитаются тут, в этом проклятом месте.
  mecho Призрак заколебался и истаял в воздухе.
  mpurge %self%
else
  wait 1s
  calcuid archer 79627 mob
  calcuid conjurer 79628 mob
  say Вижу, обещанное исполнено.
  mforce %conjurer% say ...исполнено.
  wait 1
  say Мне жаль, но я обманул тебя, не открыв всей правды.
  mforce %archer% соглас
  say Мы были предателями. Мы обмнули и убили того, кого клялись защищать, славного Богдана.
  mecho _- Из-за денег, из-за богатой казны. И за это понесем кару.
  wait 1
  say Но последний, тот, кто первый пошел на предательство, он все еще жив.
  mecho _- Он предал и нас -- пусть это будет тебе уроком.
  mecho _- И не будет нам покоя, пока предатель ступает по земле.
  wait 1
  say Мы не можем открыть тебе имя живого, чтобы ты покарал его.
  mforce %conjurer% say ...не можем.
  say Но можем помочь.
  mforce %archer% кивну
  wait 1
  mforce %archer% say Он хромает на правую ногу -- моя стрела успела найти цель.
  mforce %conjurer% say На его лице отметина от моей молнии.
  emot горько усмехнулся
  say Я, тот что был лучшим из нас, не могу похвастаться, что успел ранить предателя.
  mecho _- Он убил меня в спину, страшась открытого боя.
  mecho _- Запомни, любит он к месту и без него предложить счесть, сколько на небе звезд.
  wait 1
  say Предатель близко, я чувствую это. Найди его, покарай, и тогда мы сдержим слово.
  wait 1
  mecho Призраки растворились в воздухе.
  mpurge %archer%
  mpurge %conjurer%
  mpurge %self%
end
~
#79634
Лоад призрака лучника~
0 n 100
~
wait 1
if (%self.realroom% == 79668)
  halt
end
emot провел рукой по лицу
say Так долго... Кто ты?
wait 1s
say Чего ты хочешь? Денег? Дорогих явств? Любви?
emot коротко рассмеялся
wait 2
say Как мало надо смертным.
mecho _- Похорони мои останки.
emot указал на костяк
say И еще двое бедолаг, тоже брошены тут без погребения.
mecho _- Колдун, думаю, укажет тебе место, да и воина не забудь.
mpurge %self%
~
#79635
Лоад призрака чародея~
0 n 100
~
wait 1
if (%self.realroom% == 79668)
  halt
end
say Как холодно...
emot огляделся по сторонам
wait 1
say Смертный... И чего же ты хочешь от ушедшего за последний порог?
mecho _- Тайных знаний? Заклятий? Секретов колдовских зелий?
emot лающе рассмеялся
wait 1
say Я скажу тебе место, где скрыт клад.
mecho _- Но сначала предай мои останки земле.
emot указал на костяк
say И еще две души бродят тут. Один был лучником, другой воином.
wait 1
say Здесь, в это месте есть древний храм.
mecho _- Живые давно забыли туда дорогу, но мы знаемю.
mecho _- Добрая сила все еще хранит его.
mecho _- Выкопай могилы там, тогда нежить не доберется до них.
wait 1
mecho Призрак заколебался и истаял в воздухе.
mpurge %self%
~
#79636
Аттачим триггер на копание могил~
2 g 100
~
if !(%actor.haveobj(79645)% && %actor.haveobj(79646)% && %actor.haveobj(79647)%)
  halt
end
wait 1
attach 79637 %self.id%
detach 79636 %self.id%
~
#79637
Копаем могилу~
2 c 0
рыть копать выкопать вырыть~
wait 1
if !%arg.contains(могил)%
  wsend %actor%  Что копать хотите?
  halt
end
wait 1
wsend %actor%  Поплевав на руки, вы принялись копать могилу.
wechoaround %actor%  Поплевав на руки, %actor.name% принял%actor.u% рыть могилу.
wait 1s
wecho Час-другой и готово.
wload obj 79648
if (%world.curobjs(79648)% == 3)
  wecho _Наконец, вы закончили работу -- все три могилы готовы.
  detach 79637 %self.id%
end
~
#79638
Выкинули костяк~
1 h 100
~
wait 1
if ((%actor.realroom% == 79668) && (%world.curobjs(79648)% == 3))
  osend %actor% Вы сбросили останки в могилу.
  oechoaround %actor% %actor.name% бросил%actor.q% останки в могилу.
  eval skeletons %world.curobjs(79645)%+%world.curobjs(79646)%+%world.curobjs(79647)%
  if (%skeletons% == 1)
    *этот скелет последний, аттачим триг на закапывание
    osend %actor% _Осталось закопать могилы.
    set troom %actor.room%
    attach 79640 %troom.id%
  end
  wait 1
  opurge %self%
else
  osend %actor% _Вы бросили останки без погребения.
  osend %actor% _Мстительные души не забудут этого.
end
~
#79639
Считаем костяки~
2 h 100
~
wait 1
eval skeletons %world.curobjs(79645)%+%world.curobjs(79646)%+%world.curobjs(79647)%
if (%skeletons% == 0)
  wsend %actor% _Осталось закопать могилы.
  attach 79640 %self.id%
  detach 79639 %self.id%
end
~
#79640
Закапываем могилы~
2 c 0
закопать зарыть засыпать~
wait 1
if !%arg.contains(могил)%
  wsend %actor% _Кого закопать хотите?
  halt
end
wait 1
wsend %actor% _Вы принялись закапывать могилы.
wechoaround %actor% _%actor.name% принял%actor.u% засыпать могилы землей.
wait 1s
wecho Час-другой и готово.
calcuid grave 79648 obj
wpurge %grave%
calcuid grave 79648 obj
wpurge %grave%
calcuid grave 79648 obj
wpurge %grave%
wload obj 79649
wload obj 79649
wload obj 79649
wecho _Наконец-то эти бедныги упокоились с миром.
wait 1s
wecho ВОздух заколебался, и троица призраков возникла перед вами.
wload mob 79626
wload mob 79627
wload mob 79628
detach 79640 %self.id%
~
#79641
Убит воин~
0 f 100
~
return 0
mecho Умирающий воин уставился на вас белесыми глазами.
mecho _"Ты... Ты знаешь... Догадааал..." -- с этими словами седобородый воин испустил дух.
*аттачим триг на открытие клада на могилку
*если игрок не проходил ветку квеста с призраками -- могил не будет
if (%world.curobjs(79649)% > 0)
  calcuid grave 79649 obj
  attach 79642 %grave.id%
  remote quest796 %grave.id%
end
mload obj 79612
~
#79642
Открываем доступ к кладу~
1 t 4
~
if (%actor.id% != %quest796%)
  halt
end
wait 1s
oecho Тихо вокруг. Вы решили, что призраки снова обманули вас.
wait 1s
oecho Вдруг в воздухе разлилось мерцание, и призрачный огонек поплясав над могилами поплыл к деревьям.
oecho Присмотревшись, вы увидели неприметную тропинку, уходящую вглубь леска.
calcuid treasure 79669 room
attach 79643 %treasure.id%
remote quest796 %treasure.id%
odoor 79668 east room 79669
odoor 79669 west room 79668
detach 79642 %self.id%
~
#79643
Выкапываем клад~
2 c 0
копать раскопать выкопать~
wait 1
if (%actor% != %quest796%)
  halt
end
if (!%arg.contains(клад)% && !%arg.contains(сокровищ)% && !%arg.contains(казну)%)
  wsend %actor% Вы принялись бесцельно перекапывать землю.
  halt
end
*большая награда
*генерация сундука
wecho _&YИз-под земли показался БОЛЬШОЙ сундук!!!&n
wload obj 79610
calcuid chest 79610 obj
eval treasures 79614 79615 79616 79617 79618 79619 79620 79621 79622 79623 79624
set prize
foreach item %treasures%
  *составляем список внумом предметов, которых меньше максимума в мире
  if (%world.curobjs(%item%)% < %world.maxobj(%item%))
    eval prize %prize% %item%
  end
done
%prize.trim%
*число предметов в в кладе "не более чем"
set maxitems 2
set numofitems %prize.words%
if (%maxitems% > %numofitems%)
  set maxitems %numofitems%
end
while (%maxitems% > 0)
  eval n %random.num(%numofitems%)%  
  eval itemnum %prize.words(%n%)%
  *на случае если дважды выпал один и тот же номер
  if ((%world.curobjs(%itemnum%)% < %world.maxobj(%itemnum%)) && (%random.100% < 31))
    wload obj %itemnum%
    calcuid item %itemnum% obj
    %item.put(%chest%)%
  end
  eval maxitems %maxitems%-1
done
*суем в сундук дефолтную кучку кун
wload obj 79613
calcuid item 79613 obj
%item.put(%chest%)%
wait 1
*** Лоадим книжку
if (%random.100% < 16)
  wload obj 534
  calcuid item 534 obj
  %item.put(%chest%)%
end
detach 79643 %self.id%
~
#79644
Направление следов.~
2 c 0
искать разыскивать выискивать~
wait 1
if !%arg.contains(след)%
  return 0
  halt
end
wsend %actor% _Вы тщательно осмотрели землю, склоны яра, и ветви.
switch %random.5%
  case 1
    wsend %actor% _&YНаконец вы углядели несколько сломанных веток.&n
  break
  case 2
    wsend %actor% _&YВы заметили застрявший в ветвях обрывок ткани.&n
  break
  case 3
    wsend %actor% _&YВы увидели несоклько былинок, глубоко вдавленных тяжелыми сапогами.&n
  break
  case 4
    wsend %actor% _&YНесколько камней на земле оказались сдвинуты с места.&n
  break
  case 5
    wsend %actor% _&YНа самом видном месте обнаружился отпечаток здоровенной ступни.&n
  break
done
wsend %actor% _Судя по всему, бежавший двигался на %dir%.
*** Если сюда передали эту переменную, значит это последняя комната маршрута.
if %roomdir%
  wsend %actor% _На первый взгляд, там глухая стена яра.
  wsend %actor% _ Присмотревшись, вы увидели укрытый зарослями проход.
  wdoor %self.vnum% %roomdir% room 79678
  wdoor %self.vnum% north flags e
  wdoor 79678 %roomdir2% room %self.vnum%
end
detach 79644 %self.id%
~
#79645
Очистка квеста на чармиса~
2 f 100
~
foreach k %rooms%
  calcuid qroom %k% room
  detach 79644 %qroom.id%
  rdelete dir %qroom.id%
  wait 1
done
*** С последней комнаты удаляем выход, если он был создан
attach 79646 %qroom.id%
exec 79646 %qroom.id%
~
#79646
Очистка переменных в квесте на чармиса~
2 z 100
~
*** Чистим переменные
rdelete roomdir %qroom.id%
rdelete roomdir2 %qroom.id%
detach 79646 %self.id%
~
#79647
Вызов чармиса~
2 d 0
выходи вылазь выбирайся выходь выйди~
wait 1
if !%speech.contains(Щерба)%
  switch %random.6%
    case 1
      wecho _&YКто-то в кустах дико завопил: "А-А-А!!! Сгинь-сгинь, пропади!!!"&n
    break
    case 2
      wecho _Из кустов рявкнули: "Изыди, нечистый! А то железом ткну!"
    break
    case 3
      wecho _Из кустов послышалось:
      wecho _"У-уйди! А-атстань! Не сожрешь, подавшиься!"
    break
    case 4
      wecho _Из кустов послышалось:
      wecho _"Христом-богом, отче Велесом и всеми рожаницами клянусь - нима тут никого! Проваливай!&n"
    break
    case 5
      wecho _Из кустов послышался громкий зубовный стук.
    break
    case 6
      wecho _Из кустов послышалось:
      wecho _"Врешь! Не возьмешь! Без хрена не сожрешь!!!"
    break
  done
  halt
end
wecho _В кустах послышалось громкое сопение.
wait 2s
wecho _Чей-то голос удивленно произнес: "Никак человек?"
wecho _Послышался шум, треск и из кустов выбрался здоровенный парень.
wload mob 79620
calcuid kust 79654 obj
wpurge %kust%
detach 79647 %self.id%
~
#79648
Убит скелет~
0 f 100
~
return 0
mecho _Скелет осыпался на землю кучкой костей.
mload obj 79655
calcuid bones 79655 obj
set killer %actor%
global killer
remote killer %bones.id%
~
#79649
Лоадим череп~
1 n 100
~
wait 5
attach 79650 %self.id% 
if (%random.100% < 34)
  attach 79650 %self.id% 
  detach 79649 %self.id%
  halt
end
wait %random.180%s
oecho _&YВдруг послышались хохот и улюлюканье.&n
oecho _&YЧереп костяка зашевелился и воспарил в воздухе.&n
oload mob 79633
calcuid skull 79633 mob
remote killer %skull.id%
detach 79650 %self.id%
detach 79649 %self.id%
~
#79650
Раскидать кости~
1 c 4
раскидать~
wait 1
if !%arg.contains(кости)%
  osend %actor% _Вы принялись метать икру.
  halt
end
osend %actor% _Вы грубо распинали и раскидали кости во все стороны.
oechoaround %actor% %actor.name% грубо распинал%actor.q% и раскидал%actor.q% кости во все стороны.
detach 79649 %self.id%
if (%random.100% < 26)
  oecho _&YВдруг послышались хохот и улюлюканье.&n
  oecho _&YЧереп костяка зашевелился, взлетел, и с гиканьем унесся вдаль по яру.&n
  set room %random.68%
  eval room 79600+%room%
  oat %room% oload mob 79633
  calcuid skull 79633 mob
  remote killer %skull.id%
end
wait 1
opurge %self%
~
#79651
Лоад-триггер летающего черепа~
0 n 100
~
wait 1
mremember %killer% mkill %killer%
~
#79652
Memory-триггер летающего черепа~
0 o 100
~
*** Триггер необходим для корректной работы команды mremember
nop
~
#79653
Летающий череп орет~
0 b 14
~
switch %random.4%
  case 1
    shout Уухахахахаа!
  break
  case 2
    shout А-ууллюлюлюла-ааууу!
  break
  case 3
    shout Гох-гох-гох!!!
  break
  case 4
    shout Ыххыыы-ыыыхххыыыы!!!
  break
done
~
#79654
Провалился в болото~
2 e 25
~
wait 1
if ((%world.curmobs(79612)% > 0) || (%direction% == down))
  halt
end
eval target %random.pc%
wsend %target% &GВы шагнули вперед, оглядываясь по сторонам.&n
wsend %target% &GВдруг ковер зелени под вашими ногами расступился, и вы с плеском ушли в глубину болота.&n
wechoaround %target% &G%target.name% шагнул%target.q% вперед, оглядываясь по сторонам.&n
wechoaround %target% &GВдруг ковер зелени под ногами %target.rname% расступился, и он%target.q% с плеском уш%target.y% в глубину болота.&n
wteleport %target% 79681 horse
~
#79655
Лоад утопленника~
1 n 100
~
wait 1
switch %random.10%
  case 1
    case 2
      case 3
        %self.val2(15716)%
      break
    break
  break
  case 4
    case 5
      %self.val2(96340)%
    break
  break
  case 6
    case 7
      %self.val2(26007)%
    break
  break
  case 8
    case 9
      %self.val2(85033)%
    break
  break
  case 10
    %self.val2(20526)%
  break
done
%self.val3(1)%
oecho _&GЧто-то колыхаясь всплыло из глубины, белесо поблескивая и качаясь в воде.&n
~
#79656
Играем на дудке~
1 c 1
дунуть~
wait 1
if !%arg.contains(в дудку)%
  osend %actor% _Чего дунуть? Куда дунуть? Кому дунуть? Нипанимай!
  halt
end
osend %actor% _&GВы поднесли костяную дудку к губам и дунули в нее.&n
oechoaround %actor%  &G%actor.name% поднес%actor.g% костяную дудку к губам и дунул%actor.q% в нее.&n
oecho &G_Послышался жуткий раскатистый вой, так бывает воет трясина.&n
%actor.wait(3)%
wait 3
eval rname1 Плават. вода
eval rname2 Неплав. вода
eval rname3 Под водой
set croom %actor.room%
set croom %croom.sectortype%
if !((%croom% == %rname1%) || (%croom% == %rname2%) || (%croom% == %rname3%))
  oecho _&GИ ничего не произошло...&n
  wait 1s
  osend %actor% _&GДа и откуда тут взяться водяным да оржавникам -- ни болотца рядом, ни озерка...&n
  halt
end
if (%world.curobjs(79658)% >= %world.maxobj(79658)%)
  oecho _&GИ ничего не произошло...&n
  halt
end
oload obj 79658
~
#79657
Первый заход к оржавнику~
0 q 100
~
wait 1
set questor %actor%
global questor
mecho _&GПри виде вас, оржавник сыграл еще пару трелей, и оторвавшись от дудки уставился на вас своими буркалами.&n
say Давненько тут живым духом не пахло... А тут надо же, прямо на болото. Ты что тут позабыл%actor.g%, ась?
wait 1s
say Ну ладно, приш%actor.q%, так дело найдется.
emot шумно принюхался и осклабился, показав желтые клыки
wait 1s
say Чуешь? Запах-то какой, аромат! Не иначе ведьма толковая зелье варит.
mecho _- Вот его мне и принеси. Как ты там у ведьмы его выбазаришь -- не мое дело.
mecho _- Ну а коли утруждаться не хочешь, так и проваливай -- утопленников у меня пока в достатке.
хих
attach 79658 %self.id%
attach 79659 %self.id%
detach 79657 %self.id%
~
#79658
Второй заход к оржавнивку~
0 q 100
~
wait 1
mcho _Оржавник оторвался от своей дудки и выжидательно посмотрел на вас.
if (%actor% == %questor%)
  say Ну что, принес%actor.q%?
else
  хмур
  say Ты еще кто? Проваривай по-хорошему, это ж надо, прохода от живых не стало.
end
~
#79659
Сдали зелье оржавнику~
0 j 100
~
if ((%object.vnum% != 79644) || (%actor% != %questor%))
  msend %actor% _Не стоит его беспокоить по пустякам. Утащит в болото и поминай как звали.
  return 0
  halt
end
wait 1
mpurge %object%
emot обнюхал склянку и довольно осклабился
wait 1
say Ощущаешь, а? Какой букет!
wait 1
say Лады, сейчас сообразим тебе награду.
say Только ты боле сюда не вертайся. Ухнешь в трясину -- только тебя и видели.
mecho Оржавник с разбегу прыгнул в болото -- только круги по воде пошли.
exec 79660 %self.room%
wait 1
mpurge %self%
~
#79660
Генерация сундука оржавника~
2 z 100
~
wait 1s
wload obj 79659
calcuid chest 79659 obj
set books 1745 1750 1725 1758 1759 1760
set numofitems %books.words%
eval n %random.num(%numofitems%)%  
eval itemnum %books.words(%n%)%
wload obj %itemnum%
calcuid item %itemnum% obj
%item.put(%chest%)%
if (%ranfom.100% < 21) && (%world.curonjs(79657)% < %world.maxobj(79657)%))
  wload obj 79657
  calcuid item 79657 obj
  %item.put(%chest%)%
end
set i 0
while %i% < 3
  eval potion 801+%random.59%
  wload obj %potion%
  calcuid bottle %potion% obj
  wait 1
  %bottle.put(%chest%)%
  eval i %i%+1
done
wecho _&GВдруг вода болотца забурлила и на поверхность всплыл небольшой сундучок.&n
wecho _&GСтоит забрать награду да проваливать, пока хозяин не передумал.&n
~
#79661
Убили оржавника~
0 f 100
~
if ((%world.curobjs(79609)% < %world.maxobj(79609)%) && (%random.100% < 21))
  mload obj 79609
end
~
#79662
Очистка входов в 79678 комнату~
2 z 100
~
wait 1
if %self.north%
  wdoor %self.north% south purge
  wdoor 79678 north purge
end
if %self.west%
  wdoor %self.west% east purge
  wdoor 79678 west purge
end
if %self.south%
  wdoor %self.south% north purge
  wdoor 79678 south purge
end
if %self.east% 
  wdoor %self.east% west purge
  wdoor 79678 east purge
end
~
#79663
Убили опьяненного волкодлака~
0 f 100
~
if ((%world.curobjs(79660)% < %world.maxobj(79660)%) && (%random.100% < 41))
  mload obj 79660
end
~
#79664
Воет волкодлак~
0 b 20
~
if (%self.realroom% == 79699)
  halt
end
shout У-У-А-А-У-У-А-Ы-Ы-У-У-У-У!!!
~
#79665
Батл-триггер опьяненного волкодлака~
0 k 100
~
if (%random.100% > 20)
  halt
end
set victim %random.pc%
msend %victim% &Y_Опьяненный луной волкодлак накинулся на вас, и повалил на землю!&n
mechoaround %victim%  &Y_Опьяненный луной волкодлак накинулся на %victim.vname%, и повалил на землю!&n
msend %victim% &Y_Опьяненный луной волкодлак впился клыками в ваше тело!&n
mechoaround %victim%  &Y_Опьяненный луной волкодлак ухватил %victim.vname% зубами!&n
%victim.position(6)%
%victim.wait(3)%
mdamage %victim% 150
~
$~
