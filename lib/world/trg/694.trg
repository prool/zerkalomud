#69400
ВстречаетБерегиня~
0 r 100
~
*wecho test %i.name% %i.class%
wait 2s
mecho - Здравствуй странник.
mecho - Велика беда у нас приключилась...
wait 1s
mecho Глаза берегини наполнились слезами.
wait 1s
mecho _Зашелестели слезы наземь падая.
wait 1s
mecho _Едва касались слезы Земли-Матери - превращались они в камни драгоценные.
calcuid nTroom 69422 room
*detach 67827 %nTroom.id%
attach 69409 %nTroom.id%
exec 69409 %nTroom.id% 
detach 67809 %nTroom.id%
~
#69401
ПомогуБерегине~
0 d 0
да помогу~
calcuid trm 69414 mob
set quest694 %actor%
remote quest694 %trm.id%
wait 1s
кив
mecho - Труден будет путь твой...
mecho - Идти тебе во Ино, за кромку Мира - во Неведомый Чертог Родов
mecho - Рекут, в те незапамятные-стародавние времена, когда наш Мир был еще юн
mecho - Велес проложил по всей Земле Незримые дороги, соединяющие Явь и Ино
mecho - Предки наши ведали, где пролегали те Дороги
mecho - И на местах их пересечений ставили свои святилища
mecho - Но постепенно люди позабыли Прямые дороги, увлекшись маятой блужданий.
гру
wait 1s
mecho - Непросто будет найти тебе Путь до Волохатого Бога
mecho - Но я тебе помогу...
wait 1s
эм наклонилась, выдернула нить лунного света с недвижимой поверхности воды.
wait 1s
mecho _Всколыхнулась рябью гладь озерная.
wait 1s
mecho - Вот возьми - этот клубок поможет тебе найти нужную дорогу.
mload obj 69400
дать все %actor.name% 
*detach 69400 %self.id%
attach 69435 %self.id%
detach 69408 %self.id%
detach 69400 %self.id% 
detach 69401 %self.id%
~
#69402
ПодсветкаПутиСКлубкомСевер~
2 e 100
~
if %actor.haveobj(69400)% 
  _&yРасплелись лунные нити, засияли, указывая путь на север.&n
end
~
#69403
ТелепортВДеревню~
2 e 100
~
*wecho _ddddddddddddddddddddd
if %actor.haveobj(69400)% 
  wait 3s
  wecho _&CВдруг осветилась тишь лесная ярким светом, словно спустилась Луна с Неба.&n
  wait 1s
  wecho _Вырвался из рук клубочек, из лунных нитей свитый
  wecho _Покатился навстречу ветру, растекаясь светящимися ручейками по Миру.
  wecho _Собирались ручейки в реки бурные, вихри гулкие
  wait 1s
  wecho _И подняли Вас вихри на высоты великие
  wecho _И перенесли через тьму кромешную в Земли Закрайние - Земли Неведомые.
  wait 3s
  wteleport all 69427
end
~
#69404
РазбиваемКувшин~
2 c 0
разбить~
if !%arg.contains(кувшин)%
  wsend %actor.name% Что разбиваем?
else
  %send% %actor% _Резким движением Вы ударили по пыльной поверхности кувшина.
  %echoaround% %actor% %actor.name% резким движением удари%actor.q% по пыльной поверхности кувшина.
  wait 1s
  wecho _Взметнулась древняя пыль до свода небес...
  wecho _Брызнули осколки по сторонам света...
  wecho _а на земле осталось лишь то, что когда-то было юрким тельцем седобородого ворчуна - Домового.
  *лоад домового
  wload obj 69411
  *лоад вещего и филина
  calcuid nVroom 69447 room 
  attach 69415 %nVroom.id%
  *удаляем кувшин
  calcuid kv2 69401 obj
  %purge% %kv2.id%
  detach 69404 %self.id%
end
~
#69405
ВстречаетВещийСтранник~
0 r 100
~
wait 1s
mecho - Здравствуй путник...
mecho - Да будет длинной твоя стезя
mecho - Вижу узрел ты ту беду, что этой землей овладела
эм покачал головой
wait 2s
mecho - И вижу вздумал помочь нам, так знай:
mecho - Когда покидает мир расположение родных богов
mecho - Постепенно исчезают Живые и умирают Бессмертные.
взд
mecho - А тела Бессмертных после их кончины проявляются в нашем мире.
mecho - Низойдя в него из Мира Иного - Незримого, подобно камню, упавшему на дно пруда. 
mecho - Но если найдутся люди добрые - Духом сильные - возвратят в Ино тело мертвое, 
mecho - Да покажут его и девичьи слезы Богу Вещему,
mecho - Тогда не выдержит - дрогнет сердце Велеса
mecho - И снова повернется Он ликом своим к миру нашему.
mecho - Готов ли ты отправится в путь? 
вопрос
~
#69406
ГотовВещему~
0 d 0
да готов~
wait 1s
mecho - Ступай с Миром!
mecho - Да пребудет с тобой мудрость и сила родных богов!
*detach 69406 %self.id%
*detach 69405 %self.id%
wait 1s
calcuid mpt 69447 room
attach 69416 %mpt.id%
exec 69416 %mpt.id%
calcuid asd1 69407 mob
%purge% %asd1.id%
calcuid asd2 69406 mob
%purge% %asd2.id%
*detach 69406 %self.id%
*detach 69405 %self.id%
~
#69407
УхаетФилин~
0 r 20
~
wait 1s
mecho  __Уухуу-уухуу-ууху...
wait 1s
mecho Разнесся вдруг над лесом глубокий и монотонный крик филина.
~
#69408
РасскажиБерегине~
0 d 0
расскажи~
wait 1s
mecho - Много веков жили мы в Мире и Ладе. 
mecho - И сами с собой и с богами Древними. 
mecho - Зрил Велес - Волохатый Бог - сквозь чары Моренины, сквозь стволы да коренья
mecho - Сквозь ветви хлестучи, да иглы колючи
mecho - Зрил с поистине Любовью Непрестанной
mecho - И вел он нас стезею Богодатной...
взд
wait 2s
mecho - Но однажды, глупые и жадные люди осушили Священное Озеро.
mecho - И отвернулся от нас Вещий Бог
mecho - И стали по Миру ходить Беда да Печаль
mecho - Стала ночь Миром править...
mecho - Все кто был живым исчезли без следа
mecho - А на их место стали приходить из Ино Духи Злые - Духи Темные
mecho - Среди исчезнувших была вся моя родня...
эм смахнула прозрачную как роса слезу
wait 1s
mecho - Может быть ты сходишь на поклон к Велесу Мудрому?
mecho - И он простит нас и вернется моя родня
mecho - И снова вернется к нам Мир и Лад.
вопрос 
attach 69401 %self.id%
~
#69409
ЛоадСлез~
2 z 0
~
wait 1s
*wecho _запуск тригера лоадслез!!!!!!!!!
if %world.curobjs(69403)% < 1
  wload obj 69403
  wload obj 69403
  wload obj 69403
end
~
#69410
УмираетФилин~
0 f 40
~
if (( %random.100% < 8 ) && ( %world.curobjs(69404)% < 6 ))
  mload obj 69404
end
if %exist.mob(69405)%
  halt
end
if (( %random.1000% < 30 ) && (%world.curobjs(69405)% < 10 ))
  *лоад мышки с объектом 69405 в зубах
  mload mob 69405
  calcuid maus 69405 mob
  if %actor.vnum% == -1
    set herro %actor%
  else
    set herro %actor.leader%
  end
  attach 69417 %maus%
  global herro
  remote herro %maus.id%
  *attach 69417 %maus
  exec 69417 %maus.id% 
  *wait 3s
  halt 
end
if (( %random.1000% < 30 ) && ( %world.curobjs(69406)% < 10 ))
  *лоад мышки с объектом 69406 в зубах
  mload mob 69405
  calcuid maus 69405 mob
  if %actor.vnum% == -1
    set herro %actor%
  else
    set herro %actor.leader%
  end
  attach 69467 %maus%
  global herro
  remote herro %maus.id%
  *attach 69467 %maus%
  exec 69467 %maus.id% 
  *wait 3s
  halt 
end
if (( %random.1000% < 30 ) && ( %world.curobjs(69407)% < 8 ))
  *лоад мышки с объектом 69407 в зубах
  mload mob 69405
  calcuid maus 69405 mob
  if %actor.vnum% == -1
    set herro %actor%
  else
    set herro %actor.leader%
  end
  attach 69468 %maus%
  global herro
  remote herro %maus.id%
  *attach 69468 %maus%
  exec 69468 %maus.id% 
  *wait 3s
  halt 
end
~
#69411
ПодсветкаПутиСКлубкомЗапад~
2 e 100
~
wait 1s
if %actor.haveobj(69400)% 
  wecho _&yРасплелись лунные нити, засияли, указывая путь на запад.&n
end
~
#69412
ПодсветкаПутиСКлубкомВосток~
2 e 100
~
wait 1s
if %actor.haveobj(69400)% 
  wecho _&yРасплелись лунные нити, засияли, указывая путь на восток.&n
end
~
#69413
ПодсветкаПутиСКлубкомЮг~
2 e 100
~
wait 1s   
if %actor.haveobj(69400)% 
  wecho _&yРасплелись лунные нити, засияли, указывая путь на юг.&n
end
~
#69414
ПодсветкаПутиСКлубкомВверх~
2 e 100
~
wait 1s
if %actor.haveobj(69400)% 
  wecho _&yРасплелись лунные нити, засияли, указывая путь ввысь.&n
end
~
#69415
ЛоадСтранника~
2 ez 100
~
wload mob 69406
wload mob 69407
detach 69415 %self.id%
~
#69416
ПентаСтранника~
2 z 100
~
wportal 69458 2 
~
#69417
НаградаМышкиСОбъектом05~
0 z 0
~
wait 1
mecho _Вдруг вы заметили что-то пушистое в лапах у хищной птицы
wait 1s
mecho _Разжалась мертвая хватка филина-пугача, ожил пушистый комочек - запищал...
*wait 2s
mload obj 69405
ул
сказ %herro.name% За то что спас меня от погибели я награжу тебя
дать все .%herro.name%
mecho Мышка благодарно посмотрела Вам в глаза и исчезла в ближайшей норке.
mpurge %self%
~
#69418
ВстречаетВелес~
0 r 100
~
wait 1s
mecho - С чем пришел ты сюда?
хму
wait 1s
mecho - Али надо что? Так говори!
эм грозно нахмурил брови
~
#69419
ДалиТрупИСлезыВелесу~
0 j 100
~
wait 1
if %object.vnum% == 69411
  set flag_vnum11 1
  global flag_vnum11
  *mecho - 1111111111
elseif %object.vnum% == 69403
  set flag_vnum03 1
  global flag_vnum03
  *mecho - 3333333333333
else
  drop all
  halt
end
mpurge %object%
if (( %flag_vnum11% == 1 ) && ( %flag_vnum03% == 1 ))
  wait 1s
  unset flag_vnum03
  unset flag_vnum11
  mecho - Ох беда-то какая...
  эм осторожно взял на руки бездыханное тельце домового.
  wait 1s
  эм закручинился, вздохнул горько.
  wait 1s
  mecho И зазвучало меж небом и землей Слово Вещее - 
  mecho С языка Велеса Многомудрого срывалося да вокруг распространялося.
  wait 1s
  mecho - Гой вы, Тяги Земные, Воды Бегучие, Огни Ярые, Ветры Могучие!
  mecho - Слышьте меня, будьте со мной!
  mecho - Белым-бело во нощи млеко звездное, ясны очи предков, со неба зрящие
  mecho - А за нощию снова белый день придет в Явь
  mecho - И воззрит на Земь Солнце Красное - Око Даждьбожье, 
  mecho - И поворотится неспешно Коло Времен.
  mecho - Так было, так есть, и так будет всегда!
  wait 2s
  mecho _&CПоднялись, засвистели ветры могучие.&n
  wait 1s
  mecho _&CЗашумели потекли воды чистые.&n
  wait 1s
  mecho _&CПростерли длани свои Огни горючие.&n
  wait 1s
  mecho _&RУзрили люди Бога в Сердцах своих.&n
  wait 1s
  mecho _Не бахвалится солнце светом,
  mecho _Не кичится земля снегом, 
  mecho _Не суесловит Сердце Вещее пустым словом
  mecho _Ибо внемлет слову божию благодатная Мать Земля и полнится Миром и Ладом.
  *  wait 2s
  *mecho %actor.name% == %quest694.name%
  **********************
  *очищаем зону от нечисти
  set i 69424
  while %i% < 69469
    calcuid pm %i% room
    attach 69441 %pm.id%   
    exec 69441 %pm.id%
    detach 69441 %pm.id%   
    eval i %i%+1
  done
  *calcuid ts1001 69408 mob 
  **exec 69448 %ts1001.id%
  **calcuid ts1002 69408 mob 
  **exec 69448 %ts1002.id%
  **calcuid ts1003 69408 mob 
  **exec 69448 %ts1003.id%
  **calcuid ts1004 69408 mob 
  *exec 69448 %ts1004.id%
  *calcuid ts1005 69408 mob 
  *exec 69448 %ts1005.id%
  *calcuid ts1006 69408 mob 
  *exec 69448 %ts1006.id%
  *calcuid ts1007 69408 mob 
  *exec 69448 %ts1007.id%
  *calcuid ts1008 69408 mob 
  *exec 69448 %ts1008.id%
  **********************
  * ************************ 
  *загрузка мобов в деревню
  * кузнец
  wait 1s 
  calcuid nMob1 69415 mob
  mteleport %nMob1% 69444
  * худой мужиченка
  calcuid nMob11 69418 mob
  mteleport %nMob11% 69429
  * пекарь
  calcuid nMob12 69424 mob
  mteleport %nMob12% 69445
  wait 1s
  * жена пекаря
  calcuid nMob13 69425 mob
  mteleport %nMob13% 69442
  * остроус
  calcuid nMob14 69426 mob
  mteleport %nMob14% 69446
  * златоцвета
  calcuid nMob15 69429 mob
  mteleport %nMob15% 69435
  wait 1s
  *конюх 
  calcuid nMob2 69421 mob
  mteleport %nMob2% 69443
  *кошки
  calcuid nTroom1 69436 room
  attach 69428 %nTroom1.id%
  exec 69428 %nTroom1.id% 
  detach 69428 %nTroom1.id%
  *
  calcuid nTroom1 69439 room
  attach 69428 %nTroom1.id%
  exec 69428 %nTroom1.id% 
  detach 69428 %nTroom1.id%
  wait 1s
  *лихие мужики
  calcuid nTroom2 69425 room
  attach 69429 %nTroom2.id%
  exec 69429 %nTroom2.id% 
  calcuid nTroom2 69426 room
  attach 69429 %nTroom2.id%
  exec 69429 %nTroom2.id% 
  detach 69429 %nTroom2.id%
  *девки/парни
  calcuid nTroom3 69445 room
  attach 69430 %nTroom3.id%
  exec 69430 %nTroom3.id% 
  calcuid nTroom3 69447 room
  attach 69430 %nTroom3.id%
  exec 69430 %nTroom3.id% 
  detach 69430 %nTroom3.id%
  wait 1s
  *ребятенки
  calcuid nTroom4 69438 room
  attach 69431 %nTroom4.id%
  exec 69431 %nTroom4.id% 
  detach 69431 %nTroom4.id%
  calcuid nTroom4 69437 room
  attach 69431 %nTroom4.id%
  exec 69431 %nTroom4.id% 
  detach 69431 %nTroom4.id%
  *клетники
  calcuid nTroom5 69462 room
  attach 69432 %nTroom5.id%
  exec 69432 %nTroom5.id% 
  detach 69432 %nTroom5.id%
  calcuid nTroom5 69452 room
  attach 69432 %nTroom5.id%
  exec 69432 %nTroom5.id% 
  detach 69432 %nTroom5.id%
  calcuid nTroom5 69456 room
  attach 69432 %nTroom5.id%
  exec 69432 %nTroom5.id% 
  detach 69432 %nTroom5.id%
  wait 1s
  *хлевники
  calcuid nTroom6 69443 room
  attach 69439 %nTroom6.id%
  exec 69439 %nTroom6.id% 
  detach 69439 %nTroom6.id%
  calcuid nTroom6 69439 room
  attach 69439 %nTroom6.id%
  exec 69439 %nTroom6.id% 
  detach 69439 %nTroom6.id%
  calcuid nTroom6 69436 room
  attach 69439 %nTroom6.id%
  exec 69439 %nTroom6.id%  
  detach 69439 %nTroom6.id%
  wait 1s
  *Чердачники
  calcuid nTroom7 69463 room
  attach 69440 %nTroom7.id%
  exec 69440 %nTroom7.id% 
  detach 69440 %nTroom7.id%
  calcuid nTroom7 69454 room
  attach 69440 %nTroom7.id%
  exec 69440 %nTroom7.id% 
  detach 69440 %nTroom7.id%
  calcuid nTroom7 69457 room
  attach 69440 %nTroom7.id%
  exec 69440 %nTroom7.id%  
  detach 69440 %nTroom7.id%
  *водяны
  calcuid nTroom8 69418 room
  attach 69438 %nTroom8.id%
  exec 69438 %nTroom8.id% 
  detach 69438 %nTroom8.id%
  calcuid nTroom8 69414 room
  attach 69438 %nTroom8.id%
  exec 69438 %nTroom8.id% 
  detach 69438 %nTroom8.id%
  wait 1s
  *шутовки
  calcuid nTroom9 69416 room
  attach 69437 %nTroom9.id%
  exec 69437 %nTroom9.id% 
  detach 69437 %nTroom9.id%
  calcuid nTroom9 69417 room
  attach 69437 %nTroom9.id%
  exec 69437 %nTroom9.id% 
  detach 69437 %nTroom9.id%
  calcuid nTroom9 69420 room
  attach 69437 %nTroom9.id%
  exec 69437 %nTroom9.id%  
  detach 69437 %nTroom9.id%
  calcuid nTroom9 69421 room
  attach 69437 %nTroom9.id%
  exec 69437 %nTroom9.id%  
  detach 69437 %nTroom9.id%
  wait 1s
  mecho _Внезапно налетел порыв ветра, поднял Вас до Звездных Небес
  mecho _И через миг перенес во Явь из Мира Иного.
  wait 1s
  ************************
  mteleport all 69427 
  *********************
  *атач трига наградаберегини 
  calcuid ber 69400 mob
  attach 69427 %ber.id% 
  remote quest694 %ber.id%
end 
~
#69420
ВстречаетКузнецФома~
0 r 100
~
wait 1s
mecho - Заходи путник, доброго здравия тебе
mecho - Знаю хочешь ты выбраться с деревни
mecho - Я тебе помогу, но прежде ты подсоби мне
mecho - Вот слушай что у нас приключилось:
wait 1s
mecho - Раньше рубили мужики дрова бородами, ибо сам Велес наделил их такой силой
эм задумчиво почесал бороду
mecho - За то мы Велеса не забывали, требы ему клали обильные, вобщем жертвовали усердно
mecho - Но как-то вразумил Чернобог плохонького мужичонку и начал он народ мутить:
mecho - Хватит, де, вам Велесу требы класть, чай и без его помощи справитесь.
mecho - Не сразу, но на беду сво. Послушались мы его и перестали Велесу дары носить.
mecho - И положил тогда Велес заклятие великие на наши бороды
mecho - Дабы мягки они волосом были, дерев никак не рубили, а только бы путались
эм загрустил
wait 1s
mecho - Ну делать нечего, пошли мы тогда на поклон к самому Сварогу-Батюшке - Ковалю небесному
mecho - К Велесу то идти стыдно
mecho - Просили мы слезно подсобить в беде наше
mecho - Внял нашим мольбам Сварог-Батюшка и дал нам железный топор
эм достал из-за пазухи топор и начал его внимательно разглядывать
wait 1s
mecho - Всем хорош топор, одна беда - без топорища-то - не много им нарубишь!
mecho - Собрались наши мужики-то во главе с волхвом Велеславом 
mecho - И пошли на священное озеро к Велесу на поклон.
mecho - Ушли - торопились, через леса-буреломы, а топор то забыли.
mecho - Коль найдешь волхва Велерада и отдашь ему топор покажет тебе он путь отсюда.
mecho - Согласен?
~
#69421
ДаКузнецу~
0 d 0
да согласен~
wait 1s
mecho - Только будь осторожнее на пути 
mecho - Тот худой мужичонка и примкнувшие к нему лихие люди бродят...
*дать топор
mload obj 69416 
дать топор %actor.name%
*лоад велерада и компании 
calcuid nMob14 69420 mob
mteleport %nMob14% 69441
calcuid nMob15 69428 mob
mteleport %nMob15% 69441
detach 69420 %self.id%
detach 69421 %self.id%
~
#69422
ДалиПирожокПекарю~
0 j 100
~
if (( %object.vnum% == 69413 ) || ( %object.vnum% == 69414 ))
  wait 1s
  mpurge пирож
  mecho - Вот спасибо! А вора, что пироги мои таскает я все равно найду!
  эм грозно помахал подносом
  switch %random.7%
    case 1
      if (( %random.100% < 50 ) && ( %world.curobjs(69417)% < 10 ))
        mload obj 69417
        mecho  - Да, постой, у меня кое-что есть для тебя.
        wait 1s
        дать все %actor.name% 
        г Вот, держи.
      else
        wait 1s
        поклон
        halt
      end 
    break
    case 2
      if (( %random.100% < 50 ) && ( %world.curobjs(69418)% < 10 ))
        mload obj 69418
        mecho  - Да, постой, у меня кое-что есть для тебя.
        wait 1s
        дать все %actor.name% 
        г Вот, держи.
      else
        wait 1s
        поклон
        halt
      end 
    break
    case 3
      if (( %random.100% < 50 ) && ( %world.curobjs(69419)% < 5 ))
        mload obj 69419
        mecho  - Да, постой, у меня кое-что есть для тебя.
        wait 1s
        дать все %actor.name% 
        г Вот, держи.
      else
        wait 1s
        поклон
        halt
      end 
    break
    case 4
      if (( %random.100% < 10 ) && ( %world.curobjs(69420)% < 3 ))
        mload obj 69420
        mecho  - Да, постой, у меня кое-что есть для тебя.
        wait 1s
        дать все %actor.name% 
        г Вот, держи.
      else
        wait 1s
        поклон
        halt
      end 
    break
    case 5
      if (( %random.100% < 50 ) && ( %world.curobjs(69425)% < 12 ))
        mload obj 69425
        mecho  - Да, постой, у меня кое-что есть для тебя.
        wait 1s
        дать все %actor.name% 
        г Вот, держи.
      else
        wait 1s
        поклон
        halt
      end 
    break
    case 6
      if (( %random.100% < 50 ) && ( %world.curobjs(69426)% < 7 ))
        mload obj 69426
        mecho  - Да, постой, у меня кое-что есть для тебя.
        wait 1s
        дать все %actor.name% 
        г Вот, держи.
      else
        wait 1s
        поклон
        halt
      end 
    break
    default 
      wait 1s
      поклон
      halt
    break 
  done
else
  mecho  - Нет, это не мое!
  дать все %actor.name%
end
~
#69423
ДалиПирожокЖенеПекаря~
0 j 100
~
if %object.vnum% == 69414
  wait 1s
  mpurge пирож
  эм всплеснула руками
  mecho - Это же мужа моего пирожки! Вот спасибо! А вора, что пироги таскает он давно грозился найти!
  switch %random.7%
    case 1
      if (( %random.100% < 50 ) && ( %world.curobjs(69422)% < 10 ))
        mload obj 69422
        mecho  - Да, подожди, у меня кое-что есть для тебя.
        wait 1s
        дать все %actor.name% 
        г Вот, держи.
      else
        wait 1s
        поклон
        halt
      end 
    break
    case 2
      if (( %random.100% < 50 ) && ( %world.curobjs(69430)% < 10 ))
        mload obj 69430
        mecho  - Да, подожди, у меня кое-что есть для тебя.
        wait 1s
        дать все %actor.name% 
        г Вот, держи.
      else
        wait 1s
        поклон
        halt
      end 
    break
    case 3
      if (( %random.100% < 50 ) && ( %world.curobjs(69431)% < 5 ))
        mload obj 69431
        mecho  - Да, подожди, у меня кое-что есть для тебя.
        wait 1s
        дать все %actor.name% 
        г Вот, держи.
      else
        wait 1s
        поклон
        halt
      end 
    break
    case 4
      if (( %random.100% < 50 ) && ( %world.curobjs(69432)% < 6 ))
        mload obj 69432
        mecho  - Да, подожди, у меня кое-что есть для тебя.
        wait 1s
        дать все %actor.name% 
        г Вот, держи.
      else
        wait 1s
        поклон
        halt
      end 
    break
    case 5
      if (( %random.100% < 50 ) && ( %world.curobjs(69433)% < 12 ))
        mload obj 69433
        mecho  - Да, подожди, у меня кое-что есть для тебя.
        wait 1s
        дать все %actor.name% 
        г Вот, держи.
      else
        wait 1s
        поклон
        halt
      end 
    break
    case 6
      if (( %random.100% < 50 ) && ( %world.curobjs(69428)% < 7 ))
        mload obj 69428
        mecho  - Да, подожди, у меня кое-что есть для тебя.
        wait 1s
        дать все %actor.name% 
        г Вот, держи.
      else
        wait 1s
        поклон
        halt
      end 
    break
    default 
      wait 1s
      поклон
      halt
    break 
  done
else
  mecho  - Нет, это не мое! Оставь себе.
  дать все %actor.name%
end  
~
#69424
ВстретилиКошку~
0 r 1
~
wait 1s
эм замурлыкала и начала тереться об ноги.
~
#69425
ПогладилиКошку~
0 c 0
погладить~
if !%arg.contains(кошку)%
  msend %actor.name% Кого гладим?
  halt
else
  %send% %actor% _Очень осторожно, едва касаясь мягкой шерстки, Вы погладили кошку.
  %echoaround% %actor% _Очень осторожно, едва касаясь мягкой шерстки, %actor.name% погладил%actor.g% кошку.
  wait 1s
  mecho _Зверек вздрогнул от неожиданности, выронив зажатый между зубов пирожок.
  mecho _И, оставляя за собой только ветер, исчез из виду.
  if (( %random.100% < 50 ) && ( %world.curobjs(69413)% < 8 ))
    mload obj 69413
  end
  if (( %random.100% < 50 ) && ( %world.curobjs(69414)% < 4 ))
    mload obj 69414
  end
  бро все
  mpurge %self%
end
~
#69426
АгрНехристей~
0 r 100
~
if %actor.haveobj(69415)% 
  *передумала
  *wait 1s
  *mecho _&WРаскололась тьма светом и растворились в нем силы темные, нечестивые.&n
  *mpurge тс10011001
else
  атак %actor.name%
end 
~
#69427
Стача квеста и нарада~
0 q 100
~
wait 1
if %actor% != %quest694%
  halt
end
unset quest694
wait 1s
рад
wait 1s
mecho - Нелегок был путь твой , но выполнил ты просьбу мою...
mecho - За это награжу я тебя от всего сердца и поклонюсь в ноги.
эм поклонилась до земли
wait 1s
mecho А вот и награда твоя..
eval max 95+%actor.remort%*5
switch %actor.class%
  *лекарь
  case 0
    if (( %random.100% < 10 ) && ( %world.curobjs(69441)% < 3 ))
      mload obj 69441
      дать все %actor.name%
    else
      %self.gold(+3000)%
      дать 3000 кун %actor.name%
    end
  break
  *колдун
  case 1
    if (( %random.100% < 10 ) && ( %world.curobjs(69444)% < 3 ))
      mload obj 69444
      дать все %actor.name%
    else
      %self.gold(+3000)%
      дать 3000 кун %actor.name%
    end
  break
  *тать
  case 2
    if (%actor.skill(спрятаться)% < %max%) 
      eval lvskl %actor.skill(спрятаться)%+3
      if %lvskl% > %max%
        eval addskl %max%-%actor.skill(спрятаться)%
      else
        set addskl 3
      end
      mskilladd .%actor.name% спрятаться %addskl%
    else
      %self.gold(+3000)%
      дать 3000 кун %actor.name% 
    end
  break
  *богатырь
  case 3
    if (%actor.skill(богатырский)% < %max%) 
      eval lvskl %actor.skill(богатырский)%+3
      if %lvskl% > %max%
        eval addskl %max%-%actor.skill(богатырский молот)%
      else
        set addskl 3
      end
      mskilladd .%actor.name% богатырский.молот %addskl%
    else
      %self.gold(+3000)%
      дать 3000 кун %actor.name% 
    end
  break
  *наемник
  case 4
    эм внезапно замерла, о чем-то размышляя
    wait 1s
    эм разгневалась не на шутку
    wait 1s
    г Как посме%actor.q% ты прийти ко мне, убойца?!
    г Ведь тебя упреждали - уходи, пока це%actor.q%!
    wait 1s
    г Но теперь поздно - пеняй на себя!
    wait 1s
    mecho _Задрожал от напряжения воздух - тяжелые глыбы попадали сверху.
    %send% %actor% _Самая большая плита упала так ладно - будто крышку на Ваш гроб положили.
    %echoaround% %actor% _Самая большая плита упала так ладно - будто крышку на гроб %actor.rname% положили.
    eval nHit %actor.hitp%+11
    mdamage %actor% %nHit%
  break
  *друж
  case 5
    if (%actor.skill(осторожный стиль)% < %max%) 
      eval lvskl %actor.skill(осторожный стиль)%+3
      if %lvskl% > %max%
        eval addskl %max%-%actor.skill(осторожный стиль)%
      else
        set addskl 3
      end
      mskilladd .%actor.name% осторожный.стиль %addskl%
    else
      %self.gold(+3000)%
      дать 3000 кун %actor.name% 
    end
  break
  *кудесник
  case 6
    if %random.100% < 10 && %world.curobjs(69421)% < 3
      mload obj 69421
      дать все %actor.name%
    else
      %self.gold(+3000)%
      дать 3000 кун %actor.name%
    end
  break
  *волшебники
  case 7
    if %random.100% < 10 && %world.curobjs(69445)% < 3
      mload obj 69445
      дать все %actor.name%
    else
      %self.gold(+3000)%
      дать 3000 кун %actor.name%
    end
  break
  case 8
    if %random.100% < 10 && %world.curobjs(69441)% < 3
      mload obj 69441
      дать все %actor.name%
    else
      %self.gold(+3000)%
      дать 3000 кун %actor.name%
    end
  break
  *витязь
  case 9
    if (%actor.skill(точный стиль)% < %max%) 
      eval lvskl %actor.skill(точный стиль)%+3
      if %lvskl% > %max%
        eval addskl %max%-%actor.skill(точный стиль)%
      else
        set addskl 3
      end
      mskilladd .%actor.name% точный.стиль %addskl%
    else
      %self.gold(+3000)%
      дать 3000 кун %actor.name% 
    end
  break
  *охот
  case 10
    if (%actor.skill(маскировка)% < %max%) 
      eval lvskl %actor.skill(маскировка)%+3
      if %lvskl% > %max%
        eval addskl %max%-%actor.skill(маскировка)%
      else
        set addskl 3
      end
      mskilladd .%actor.name% маскировка %addskl%
    else
      %self.gold(+3000)%
      дать 3000 кун %actor.name% 
    end
  break
  *кузнец
  case 11
    if (%actor.skill(оглушить)% < %max%)
      eval lvskl %actor.skill(оглушить)%+3
      if %lvskl% > %max%
        eval addskl %max%-%actor.skill(оглушить)%
      else
        set addskl 3
      end
      mskilladd .%actor.name% оглушить %addskl%
    else
      %self.gold(+3000)%
      дать 3000 кун %actor.name%
    end
  break
  *купец
  case 12
    if (%quest694.skill(спрятаться)% < %max%)
      eval lvskl %actor.skill(спрятаться)%+3
      if %lvskl% > %max%
        eval addskl %max%-%actor.skill(спрятаться)%
      else
        set addskl 3
      end
      mskilladd .%actor.name% спрятаться %addskl%
    else
      %self.gold(+5000)%
      дать 5000 кун %quest694.name%
    end
  break
  *волхв
  case 13
    if %random.100% < 10 && %world.curobjs(69441)% < 3
      mload obj 69441
      дать все %actor.name%
    else
      %self.gold(+3000)%
      дать 3000 кун %actor.name%
    end
  break
  default
    %self.gold(+3000)%
    дать 3000 кун .%actor.name%
  break
done
detach 69427 %self.id%
~
#69428
ЛоадКошек~
0 z 0
~
wload mob 69430
wload mob 69430
wload mob 69430
wload mob 69430
~
#69429
ЛоадЛихих~
0 z 0
~
wload mob 69419
wload mob 69419
wload mob 69419
~
#69430
ЛоадДевокПарней~
0 z 0
~
wload mob 69423
wload mob 69423
wload mob 69423
wload mob 69422
wload mob 69422
wload mob 69422
~
#69431
ЛоадРебятенков~
0 z 0
~
wload mob 69427
wload mob 69427
wload mob 69427
~
#69432
ЛоадКлетника~
0 z 0
~
wload mob 69410
~
#69433
ДалиТопорВелераду~
0 j 100
~
if %object.vnum% == 69416
  wait 1s
  mecho - Благодарю тебя за помощь, путник!
  mecho - А то я уж думал придется возвращаться в деревню не солоно нахлебавшись.
  взд
  wait 1s
  mecho - За это я открою тебе врата в миры иные!
  wait 1s
  calcuid mpt 69441 room
  attach 69434 %mpt.id%
  exec 69434 %mpt.id%
  detach 69434 %mpt.id%
  %purge% %object%
~
#69434
ПентаВолхва~
2 z 100
~
wportal 69412 2
~
#69435
СпасибоБерегине~
0 d 0
спасибо~
wait 1s 
mecho - Да... Чуть не забыла...
mload obj 69415
дать все %actor.name% 
detach 69435 %self.id%
~
#69436
РезетЗоны~
2 f 100
~
*расскажи
calcuid nZ1 69400 mob
detach 69427 %nZ1%
attach 69400 %nZ1.id%
attach 69408 %nZ1.id%
*кувшин
calcuid nZ2 69455 room
attach 69404 %nZ2.id%
*странник
*calcuid nZ3 69407 mob че хотела сказать непомню.. но филин тут явно непричем
*attach 69405 %nZ3.id%
*attach 69406 %nZ3.id%
*фома
calcuid nZ4 69415 mob 
attach 69420 %nZ4.id%
attach 69421 %nZ4.id%  
*идол
calcuid nZ5 69469 room
attach 69469 %nZ5.id%
~
#69437
ЛоадШутовки~
0 z 0
~
wload mob 69435
wload mob 69443
wload mob 69443
~
#69438
ЛоадВодяницы~
0 z 0
~
wload mob 69436
wload mob 69436
wload mob 69443
wload mob 69443
wload mob 69443
~
#69439
ЛоадХлевника~
0 z 0
~
wload mob 69442
~
#69440
ЛоадЧердачника~
0 z 0
~
wload mob 69441
~
#69441
УдаляемНехристей~
2 z 100
~
foreach i %self.npc% 
  *wecho ggggggggggggggggggg %i.iname%
  *wpurge тс10011001
  %purge% %i% 
done
~
#69442
УмерЧердачник~
0 f 100
~
if (( %random.100% < 20 ) && ( %world.curobjs(69446)% < 10 ))
  mload obj 69446
end
if (( %random.100% < 20 ) && ( %world.curobjs(69447)% < 10 ))
  mload obj 69447
end
~
#69443
ПолучилиВестьОСмерти~
1 g 100
~
wait 2s
%send% %actor% _&WВнезапно Вы осознали свою смерть, стоящую за левым плечом.&n
*%echoaround% %actor% _%actor.vname% побледнел и из уст его полились древние слова.
***********
wait 1s
%send% %actor% _&WВаше тело резко выпрямилось и словно окостенело.&n
%echoaround% %actor% _&WТело %actor.rname% вдруг неестесвенно выпрямилось и словно окостенело.&n
***********
*wait 1s
%send% %actor% _&WИ против воли из Ваших уст полились древние слова.&n
if %actor.sex% == 1 
  %echoaround% %actor% _&W%actor.vname% побледнел%actor.g%  и из уст его полились древние слова.&n
else
  %echoaround% %actor% _&W%actor.vname% побледнел%actor.g%  и из уст ее полились древние слова.&n
end
************ 
wait 1s
oecho _&WПохороненное среди веков заклинание снова обрело былую силу, вызвав к жизни саму Смерть.&n
%echoaround% %actor% _Заклинание %actor.rname% вызвало саму Смерть.
set nbn 0
eval chnbn %actor%
foreach i %self.pc%
  *eval r10 %random.pc%
  * 
  *oecho %i.name% --%nbn%------%i.bank%----
  if %nbn%<%i.bank%
    eval nbn %i.bank%
    eval chnbn %i%
    *oecho %i.name% --%nbn%----88888888------ %chnbn.name% 
  end
done
wait 1s
if %actor.sex% == 1 
  oecho  _&WПосле долгих раздумий Смерть указала перстом на %chnbn.rname% и ушла забрав его с собой.&n
else
  oecho  _&WПосле долгих раздумий Смерть указала перстом на %chnbn.rname% и ушла забрав ее с собой.&n
end
eval nHit %chnbn.hitp%+11
odamage %chnbn% %nHit%
~
#69444
УмерлиЛихие~
0 f 100
~
if (( %random.80% < 10 ) && ( %world.curobjs(69450)% < 8 ))
  mload obj 69450
end
if (( %random.80% < 10 ) && ( %world.curobjs(69451)% < 8 ))
  mload obj 69451
end
~
#69445
УмерлиДеревенские~
0 f 100
~
switch %random.7%
  case 1
    if (( %random.100% < 50 ) && ( %world.curobjs(69452)% < 10 ))
      mload obj 69452
    end 
  break
  case 2
    if (( %random.100% < 50 ) && ( %world.curobjs(69453)% < 10 ))
      mload obj 69453
    end 
  break
  case 3
    if (( %random.100% < 50 ) && ( %world.curobjs(69454)% < 10 ))
      mload obj 69454
    end 
  break
  case 4
    if (( %random.100% < 50 ) && ( %world.curobjs(69455)% < 10 ))
      mload obj 69455
    end 
  break
  case 5
    if (( %random.100%  < 50) && ( %world.curobjs(69456)% < 10 ))
      mload obj 69456
    end 
  break
  case 6
    if (( %random.100% < 50 ) && ( %world.curobjs(69457)% < 10 ))
      mload obj 69457
    end 
  break
  case 7
    if (( %random.100% < 50 ) && ( %world.curobjs(69458)% < 10 ))
      mload obj 69458
    end 
  break
  default 
    halt
  break 
done
~
#69446
УмерлиПодводныеЖители~
0 f 100
~
switch %random.6%
  case 1
    if (( %random.100% < 50 ) && ( %world.curobjs(69442)% < 10 ))
      mload obj 69442
    end 
  break
  case 2
    if (( %random.100% < 50 ) && ( %world.curobjs(69452)% < 10 ))
      mload obj 69452
    end 
  break
  case 3
    if (( %random.100% < 50 ) && ( %world.curobjs(69453)% < 10 ))
      mload obj 69453
    end 
  break
  case 4
    if (( %random.100% < 50 ) && ( %world.curobjs(69454)% < 10 ))
      mload obj 69454
    end 
  break
  case 5
    if (( %random.100% < 50 ) && ( %world.curobjs(69454)% < 10 ))
      mload obj 69454
    end 
  break
  case 6
    if (( %random.100% < 50 ) && ( %world.curobjs(69442)% < 10 ))
      mload obj 69442
    end 
  break
  default 
    halt
  break 
done
~
#69447
УдаляемНить~
2 e 100
~
if %actor.haveobj(69400)% 
  calcuid asd 69400 obj
  %purge% %asd.id%
end
~
#69448
Умер моб 01~
0 f 100
~
if (( %random.100% < 8 ) && ( %world.curobjs(69409)% < 6 ))
  mload obj 69409
end
~
#69449
Умер моб 02~
0 f 100
~
if (( %random.100% < 8 ) && ( %world.curobjs(69408)% < 6 ))
  mload obj 69408
end
~
#69450
Умер моб 03~
0 f 100
~
if (( %random.100% < 8 ) && ( %world.curobjs(69404)% < 6 ))
  mload obj 69404
end
~
#69451
Умер моб 04~
0 f 100
~
if (( %random.100% < 8 ) && ( %world.curobjs(69402)% < 6 ))
  mload obj 69402
end
~
#69452
Умер моб 13~
0 f 100
~
if (( %random.100% < 8 ) && ( %world.curobjs(69434)% < 6 ))
  mload obj 69434
end
~
#69453
Умер моб 12~
0 f 100
~
if (( %random.100% < 8 ) && ( %world.curobjs(69427)% < 6 ))
  mload obj 69427
end
~
#69454
Умер моб 08~
0 f 100
~
if (( %random.100% < 8 ) && ( %world.curobjs(69423)% < 6 ))
  mload obj 69423
end
~
#69455
Умер моб 17~
0 f 100
~
if (( %random.100% < 8 ) && ( %world.curobjs(69429)% < 6 ))
  mload obj 69429
end
~
#69456
Умер моб 11~
0 f 100
~
if (( %random.100% < 8 ) && ( %world.curobjs(69424)% < 6 ))
  mload obj 69424
end
~
#69457
Умер моб 34~
0 f 100
~
if (( %random.100% < 8 ) && ( %world.curobjs(69437)% < 6 ))
  mload obj 69437
end
~
#69458
Умер моб 39~
0 f 100
~
if (( %random.100% < 8 ) && ( %world.curobjs(69448)% < 6 ))
  mload obj 69448
end
~
#69459
Умер моб 31~
0 f 100
*~
if (( %random.100% < 5 ) && ( %world.curobjs(69435)% < 4 ))
  mload obj 69435
end
if (( %random.100% < 5 ) && ( %world.curobjs(69439)% < 4 ))
  mload obj 69439
end
if (( %random.100% < 5 ) && ( %world.curobjs(69438)% < 4 ))
  mload obj 69438
end
if (( %random.100% < 5 ) && ( %world.curobjs(69440)% < 4 ))
  mload obj 69440
end
~
#69460
Умер моб 40~
0 f 100
~
if (( %random.100% < 8 ) && ( %world.curobjs(69449)% < 4 ))
  mload obj 69449
end
~
#69461
Предупреждение1~
0 r 100
~
if %actor.class% == 4
  %actor.wait(3)%
  mecho _ 
  mecho Зашумел недобро священный лес.
  сказ %actor.name% Что тебе надо здесь?&n
  сказ %actor.name% Не место на священной земле тем, кто кровь без нужды разливает...&n
  сказ %actor.name% Уходи, убойца...&n
end
~
#69462
Предупреждение2~
0 r 100
~
if %actor.class% == 4
  %actor.wait(5)%
  wait 1s
  mecho &r_Зашумел угрожающе священный лес.&n
  сказ %actor.name% Зачем пожаловал?
  сказ %actor.name% Не место на священной земле тем, кто кровь без нужды разливает...
  сказ %actor.name% Уходи по хорошему, убойца...
end
~
#69463
Предупреждение3~
0 r 100
~
*последнее предупреждение
if %actor.class% == 4
  %actor.wait(10)%
  wait 1s
  %send% %actor% &R_Уходи, убойца!
  %send% %actor% &R_Остатний раз упреждаю, уходи... - прошелестело вдали.
  %send% %actor% &R_Не место на священной земле тем, кто кровь без нужды разливает...
  wait 1s
  mecho &C_Взметнулись со дна зеленоватые струйки-вихри.&n
  %send% %actor% &C_В единое мгновение окутали горячие вихри Вас, камнем оволакивая - жизнь отнимая.&n
  %echoaround% %actor% &C_В единое мгновение окутали горячие вихри %actor.rname%, камнем оволакивая - жизнь отнимая.&n
  eval nHit %actor.hitp%-1
  mdamage %actor% %nHit%
end
~
#69464
СмертьНаемам~
0 r 100
~
*если предупреждениям не внемлют
if %actor.class% == 4
  wait 1s
  %send% %actor% &R_Ведь тебя упреждали, убойца... - еле слышно прошелестело вдали.
  %send% %actor% &R_Не ушел ты по своей воле, так покорись моей!
  wait 1s
  mecho _Задрожал от напряжения воздух - тяжелые глыбы попадали сверху.
  %send% %actor% _Самая большая плита упала так ладно - будто крышку на Ваш гроб положили.
  %echoaround% %actor% _Самая большая плита упала так ладно - будто крышку на гроб %actor.rname% положили.
  mdamage %actor% 100 Hit
  mteleport %actor% 85271
end
~
#69465
Умер моб 33~
0 f 100
~
if (( %random.100% < 8 ) && ( %world.curobjs(69436)% < 6 ))
  mload obj 69436
end
~
#69466
Умер моб 41~
0 f 100
~
if (( %random.100% < 8 ) && ( %world.curobjs(69447)% < 6 ))
  mload obj 69447
  halt
end
if (( %random.100% < 8 ) && ( %world.curobjs(69446)% < 6 ))
  mload obj 69446
  halt
end
~
#69467
НаградаМышкиСОбъектом06~
0 z 0
~
wait 1
mecho _Вдруг вы заметили что-то пушистое в лапах у хищной птицы
wait 1s
mecho _Разжалась мертвая хватка филина-пугача, ожил пушистый комочек - запищал...
*wait 2s
mload obj 69406
ул
сказ %herro.name% За то что спас меня от погибели я награжу тебя
дать все .%herro.name%
mecho Мышка благодарно посмотрела Вам в глаза и исчезла в ближайшей норке.
mpurge %self%
~
#69468
НаградаМышкиСОбъектом07~
0 z 0
~
wait 1
mecho _Вдруг вы заметили что-то пушистое в лапах у хищной птицы
wait 1s
mecho _Разжалась мертвая хватка филина-пугача, ожил пушистый комочек - запищал...
*wait 2s
mload obj 69407
ул
сказ %herro.name% За то что спас меня от погибели я награжу тебя
дать все .%herro.name%
mecho Мышка благодарно посмотрела Вам в глаза и исчезла в ближайшей норке.
mpurge %self%
~
#69469
ОбнаружениеКвестера8502~
2 e 100
~
if ( ( %actor.quested(85021)% ) && ( !%actor.quested(85024)% ) 
  *лоадим идол на одной из трех клеток с гром-птицами
  *и заставляем гром птицу взять идол (на хранение) 
  *wait 1s 
  *wecho -------------------------- 
  switch %random.3%
    case 1
      calcuid rgrom1 69473 room
      *wecho -------------------------- 73
      attach 69470 %rgrom1% 
      exec 69470 %rgrom1% 
      detach 69470 %rgrom1% 
    break
    case 2
      calcuid rgrom2 69493 room
      *wecho -------------------------- 93
      attach 69470 %rgrom2% 
      exec 69470 %rgrom2% 
      detach 69470 %rgrom2% 
    break
    case 3
      calcuid rgrom3 69495 room
      *wecho -------------------------- 95
      attach 69470 %rgrom3% 
      exec 69470 %rgrom3% 
      detach 69470 %rgrom3% 
    break
  done
  detach 69469 %self%
end
~
#69470
ЛоадИдолаКвест8502~
2 z 100
~
wload obj 85136
wforce гром взять все
~
#69471
ОтвечаемВелесу~
0 d 0
*~
switch %speech%
  case идол
    wait 1s
    дум
    wait 1s
    г А, вспомнил наконец-то!
    mecho - Да нет его у меня...
    mecho - Очень давно, когда еще людей-то на свете не было
    mecho - Отдал я идол тот священный на хранение птице грома.
    mecho - С тех пор там и лежит.
  break
  default
    г Нет у меня этого! В другом месте ищи.
  break
done
~
#69472
УмерлаВестница2~
0 f 100
~
if (( %random.100% < 8 ) && ( %world.curobjs(69449)% < 4 ))
  mload obj 69449
end
~
$~
