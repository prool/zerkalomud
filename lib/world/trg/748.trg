#74800
Подьем с перевала на гору~
2 c 100
забраться~
if !%arg.contains(на гору)%
  wsend  %actor% Куда это Вы собрались?
  halt
end
*
wsend %actor%  Подтянувшись и совершив еще несколько ловких движений Вы взобрались на гору.
wechoaround %actor%  Подтянувшись %actor.name% исчез%actor.q% из виду.
wteleport %actor% 74856
wait 1s
wsend %actor%  Едва Вы взобрались на гору, как тут же рухнули обессилeв на землю.
%actor.position(6)%
%actor.wait(2)%
wechoaround %actor%  Кто-то забрался сюда, и тут же рухнул на землю без сил. 
~
#74801
Прыгаем через пропасть~
2 c 0
пройти~
if !%arg.contains(по мостику)%
  wsend  %actor% Не так то легко пройти мимо пропасти!
  halt
end
wsend %actor%  Вы аккуратно перешли пропасть по мостику.
wechoaround %actor%  %actor.name% аккуратно переш%actor.y% через мостик.
*if (%actor.sex% == 1)
*  wechoaround %actor% %actor.name% аккуратно перешел через мостик.
*elseif
*  (%actor.sex% == 2)
*  wechoaround %actor% %actor.name% аккуратно перешла через мостик.
*else
*  wechoaround %actor% %actor.name% аккуратно перешло через мостик.
*end
wteleport %actor% 74864
wechoaround %actor%  Кто-то оказался рядом с Вами.
~
#74802
Прыгаем через пропасть обратно~
2 c 0
пройти~
if !%arg.contains(по мостику)%
  wsend  %actor% Не так то легко пройти мимо пропасти!
  halt
end
*
wsend %actor%  Вы аккуратно перешли пропасть по мостику.
wechoaround %actor%  %actor.name% аккуратно переш%actor.y% через мостик.
*if (%actor.sex% == 1)
*  wechoaround %actor% %actor.name% аккуратно перешел через мостик.
*elseif
*  (%actor.sex% == 2)
*  wechoaround %actor% %actor.name% аккуратно перешла через мостик.
*else
*  wechoaround %actor% %actor.name% аккуратно перешло через мостик.
*end
wteleport %actor% 74863
wechoaround %actor%  Кто-то оказался рядом с Вами.
~
#74803
Спуск с горы на перевал 1~
2 c 0
спуститься~
if !%arg.contains(на перевал)%
  wsend  %actor% Куда это Вы собрались?
  halt
end
*
wsend %actor%  Вы аккуратно начали путь вниз.
wechoaround %actor%  Уцепившись за скалу, %actor.name% исчез%actor.q% из виду.
wteleport %actor% 74855
wait 1s
wsend %actor%  Неудержавшись, Вы сорвались со скалы и больно ударилсь.
%actor.position(6)%
%actor.wait(2)%
wdamage %actor% 150
wechoaround %actor%  Кто-то сорвался со скалы и грохнулся рядом с Вами.
~
#74804
Спуск с перевала на землю~
2 c 0
спуститься~
if !%arg.contains(на землю)%
  wsend  %actor% Куда это Вы собрались?
  halt
end
*
wsend %actor%  Вы аккуратно начали путь вниз.
wechoaround %actor%  Уцепившись за скалу, %actor.name% исчез%actor.q% из виду.
wteleport %actor% 74869
wait 1s
wsend %actor%  Неудержавшись, Вы сорвались со скалы и больно ударилсь.
%actor.position(6)%
%actor.wait(2)%
wdamage %actor% 150
wechoaround %actor%  Кто-то сорвался со скалы и грохнулся рядом с Вами.
~
#74805
Подьем с земли на перевал~
2 c 0
забраться~
if !%arg.contains(на перевал)%
  wsend  %actor% Куда это Вы собрались?
  halt
end
*
wsend %actor%  Подтянувшись и совершив еще несколько ловких движений Вы взобрались на перевал.
wechoaround %actor%  Подтянувшись %actor.name% исчез%actor.q% из виду.
wteleport %actor% 74866
wait 1s
wsend %actor%  Едва Вы взобрались на перевал, как тут же рухнули обессилив на землю.
%actor.position(6)%
%actor.wait(2)%
wechoaround %actor%  Кто-то забрался сюда, и тут же рухнул на землю без сил. 
~
#74806
Триг при входе к квестеру~
2 g 100
~
wait 1s
wecho &KКак только Вы ступили на эту&n &yземлю&n &KВас просто передернуло от&n &rопасности&n &Kисходящей от нее.&n
detach 74806 %self%
~
#74807
Клонируется колдун~
0 k 100
~
if (%world.curmobs(74814)% < 1)  && (%random.5% == 1)
  mecho Колдун-нежити прикрыл глаза и прошептал : 'пусть будет много меня'.
  mecho Колдун-нежити раздвоился !
  mecho Двойник колдуна-нежити начал следовать за Колдуном-нежити.
  mecho Колдун-нежити раздвоился !
  mecho Двойник колдуна-нежити начал следовать за Колдуном-нежити.
  mecho Колдун-нежити раздвоился !
  mecho Двойник колдуна-нежити начал следовать за Колдуном-нежити.
  mecho Колдун-нежити раздвоился !
  mecho Двойник колдуна-нежити начал следовать за Колдуном-нежити.
  mload mob 74814
  mload mob 74814
  mload mob 74814
  mload mob 74814
  wait 1s
  mecho Колдун-нежити отдал приказ!
end
~
#74808
Кудес типа чармит моба~
0 k 100
~
if (%world.curmobs(74815)% < 1)  && (%random.6% == 1)
  mecho Кудесник-нежити произнес : 'и послали за ним, и призвали его...'.
  mecho Странствующая воительница прибыла по вызову!
  mecho Кудесник-нежити взглянул на странствующую воительницу и произнес : 'твоя душа теперь моя!'.
  mecho Странствующая воительница начала следовать за Кудесником-нежити.
  mload mob 74815 
  wait 1s
  mecho Кудесник-нежити отдал приказ!
end
~
#74809
Волшик сумонит хелперов~
0 k 100
~
if (%world.curmobs(74816)% < 3)  && (%random.5% == 1)
  mecho Волшебник-нежити произнес : 'Дажьбог, даруй защитника'.
  mecho Огненный хранитель появился из вихря пламени! 
  mecho Огненный хранитель начал следовать за Волшебником-нежити.
  mload mob 74816
end
~
#74810
Чернок сумони хэлперов~
0 k 100
~
if (%world.curmobs(74817)% < 3)  && (%random.6% == 1)
  mecho Чернокнижник-нежити произнес : 'живот изо праха створисте'.
  mecho Костяной дух появился из клубов голубого дыма ! 
  mecho Костяной дух начал следовать за Чернокнижником-нежити.
  mload mob 74817
  wait 1s
  mecho Чернокнижник-нежити отдал приказ! 
end
~
#74811
Купец призывает хэлпера~
0 k 100
~
if (%world.curmobs(74818)% < 1)  && (%random.6% == 1)
  mecho Купец-нежити открыл &Rогненный портал&n.
  mecho Ведьмак появился из портала.
  mecho Купец-нежити нанял ведьмака.
  mecho Ведьмак сказал: " Мои услуги для тебя сегодня ничего не стоят!"
  mecho Ведьмак начал следовать за Купцом-нежити.
  mload mob 74818
  wait 1s
  mecho Купец-нежити отдал приказ!
  wait 1s
  mecho &RОгненный портал&n замерцал и погас.
end
~
#74812
Батлтриг волхва~
0 k 100
~
eval action %random.15%
switch %action%
  case 1
    mecho %self.name% сложил%self.g% руны, которые вспыхнули ярким сиянием!
    dg_cast 'мас слеп'
  break
  case 2
    mecho %self.name% сложил%self.g% руны, которые вспыхнули ярким сиянием!
    dg_cast 'землетряс'
  break
  case 3
    mecho %self.name% сложил%self.g% руны, которые вспыхнули ярким сиянием!
    dg_cast 'ледян шторм'
  break
  case 4
    mecho %self.name% сложил%self.g% руны, которые вспыхнули ярким сиянием!
    dg_cast 'мас слеп'
  break
  case 5
    mecho %self.name% сложил%self.g% руны, которые вспыхнули ярким сиянием!
    dg_cast 'масс  молч'
  break  case 6
  mecho %self.name% сложил%self.g% руны, которые вспыхнули ярким сиянием!
  set target %random.pc%
  dg_cast 'гнев богов' %target.name%
break
case 7
  mecho %self.name% сложил%self.g% руны, которые вспыхнули ярким сиянием!
  set target %random.pc%
  dg_cast 'огнен шар' %target.name%
break
case 8
  mecho %self.name% сложил%self.g% руны, которые вспыхнули ярким сиянием!
  dg_cast 'метеорит дожд'
break
case 9
  mecho %self.name% сложил%self.g% руны, которые вспыхнули ярким сиянием!
  if %random.3% != 3
    mecho %self.name% создал%self.g% защитника!
    mload mob 74819
  end
  default    
    mecho %self.name% сложил%self.g% руны, которые вспыхнули ярким сиянием!
    if %self.hitp% < 75
      dg_cast 'исцелен'
    else
      set target %random.pc%
      dg_cast 'длит оцеп' %target.name%
    end
  break
done
~
#74813
ЛоадСедого~
2 z 100
~
wload mob 74822
detach 74813 %self%
~
#74814
группа реколиться1~
0 k 100
~
*Все мобы в группе котрая реколится теперь уникальны 
if ( %self.realroom% != 74877) 
  *реколимся только с 77 клетки
  halt
end
*mecho  %m1.hitp% > 100) && ( %m2.hitp% > 100) && (%m5.hitp% > 100 
if ( ( %m1.hitp% > 100) && ( %m2.hitp% > 100) && (%m5.hitp% > 100 ) )
  *если все здоровы - более 100 хитов - ниче не делаем
  halt
end
*Делаем вид что реколим группу
* куда реколим
switch %random.3%
  case 1
    set rV 74884
  break
  case 2
    set rV 74888
  break
  case 3
    set rV 74886
  break
done 
mecho Лекарь-нежити произнес : '... вам говорю, ступайте с миром.'.
if ( %world.curmobs(74857)% == 1 ) 
  mteleport %m2% %rV%
  mecho Колдун-нежити исчез.
end
if ( %world.curmobs(74860)% == 1 )
  mteleport %m3% %rV%
  mecho Дружинник-нежити исчез.
end
if ( %world.curmobs(74862)% == 1 )
  mteleport %m4% %rV%
  mecho Витязь-нежити исчез.
end
if ( %world.curmobs(74858)% == 1 )
  mteleport %m6% %rV%
  mecho Богатырь-нежити исчез.
end
if ( %world.curmobs(74861)% == 1 )
  mteleport %m5% %rV%
  mecho Волшебник-нежити исчез.
end
mecho Лекарь-нежити исчез.
mteleport %self% %rV%
* чтоб не спамило проверяем существование
dg_cast 'вы слеп'
dg_cast 'сн молч'
dg_cast 'сн оцеп'
dg_cast 'исцел'
*
if ( %world.curmobs(74857)% == 1 )  
  dg_cast 'вы слеп' колд
  dg_cast 'сн молч' колд
  dg_cast 'сн оцеп' колд
  dg_cast 'исцел' колд
end
*
if ( %world.curmobs(74860)% == 1 ) 
  dg_cast 'вы слеп' друж
  dg_cast 'сн молч' друж
  dg_cast 'сн оцеп' друж
  dg_cast 'исцел' друж
end
*
if ( %world.curmobs(74862)% == 1 ) 
  dg_cast 'вы слеп' вит
  dg_cast 'сн молч' вит
  dg_cast 'сн оцеп' вит
  dg_cast 'исцел' вит
end
*
if ( %world.curmobs(74861)% == 1 ) 
  dg_cast 'вы слеп' вол
  dg_cast 'сн молч' вол
  dg_cast 'сн оцеп' вол
  dg_cast 'исцел' вол
end
~
#74815
умер босс~
0 f 100
~
if ( (%world.curobjs(74836)% < 2) && (%random.1000% < 201 ) )
  mload obj 74836
end
if ( (%world.curobjs(74837)% < 2) && (%random.1000% < 201 ) )
  mload obj 74837
end
if ( (%world.curobjs(74839)% < 2) && (%random.1000% < 201 ) )
  mload obj 74839
end
*лоад седого мага
calcuid rsedoy 74874 room
attach 74813 %rsedoy%
exec 74813 %rsedoy%
*
mecho Едва мертвое тело предводителя нежити коснулось земли, все вокруг залилось ярким светом.
mecho Сквозь яркий свет Вы заметили &WСедого Мага&n, обретшего свободу после смерти предводителя.
mecho &WСедой Маг&n произнес : 'буде путь короток'.
mecho Лазурная пентаграмма возникла в воздухе.
mecho &WСедой Маг&n исчез в пентаграмме.
mecho Пентаграмма медленно растаяла.
*
if (%world.curobjs(74849)% == 1)
  calcuid tron 74892 room
  attach 74841 %tron%
  exec 74841 %tron%
end
~
#74816
зашли к магу~
0 r 100
~
wait 2s
mecho &WСедой маг&n посмотрел на Вас грустными глазами, и упал на колени, вымаливая прощения.
говор О, храбрый воин пощади старика.
wait 1s
плак
wait 1s
говор Давным-давно, еще в молодости, я согрешил, совершив сделку с дьяволом.
говор И теперь расплачиваюсь за нее.
говор Меня заколдовали и я превратился в предводителя мертвых.
говор И чтобы выжить я вынужден был проклясть эту землю.
wait 1s
грус
wait 1s
говор Я знаю, тебя прислали сюда чтобы освятить эту землю!
говор Что ж, я готов.
wait 1s
плак
wait 1s
говор Пролей мою кровь ударом &Cэскалибура&n и ты навеки &Wосвятишь&n эту землю!
mecho &WСедой маг&n наклонил голову, готовясь лишиться ее.
calcuid mag 74822 mob
detach 74816 %mag%
~
#74817
рубим мага~
0 c 100
убить~
wait 1
if !%arg.contains(эскалибуром)%
  msend  %actor% Чем Вы хотите отрубить голову &WСедому магу&n?
  halt
end
set mech %actor.eq(16)%
if (%mech.vnum% == 74809)
  msend %actor% Вы размахнулись и одним ударом снесли &WСедому магу&n голову.
  mechoaround %actor% Размахнувшись, %actor.name% одним ударом снес%actor.g% &WСедому магу&n голову.
  mecho &rКапли крови разлетелись во все стороны.&n
  mecho &yЗемля с жадностью впитала кровь злодея.&n 
  wait 1s
  mecho Небесный свет озарил проклятую землю!
  mecho Теперь эта земля &Wсвященна&n!
  mdoor 74874 south purge
  mdoor 74892 north purge
  mload obj 74810 
  mpurge %self%
  *хз зачем это. кгда только что спуржили моба
  *calcuid mag 74822 mob
  *detach 74817 %mag.id%
  *detach 74806 %self.id% 
else 
  хох
  г У тебя нету подходящего меча, чтобы убить меня!
end
~
#74818
ЗапоминаемМобов1~
0 n 100
~
*ждем чтоб все мобы точно загрузились
wait 5s
*ищем всех нужным мобов
*1 группа 
calcuid m1 74856 mob
calcuid m2 74857 mob
wait 1
calcuid m3 74860 mob
calcuid m4 74862 mob
wait 1
calcuid m5 74861 mob
calcuid m6 74858 mob
*делаем переменные глобальными чтоб не стерлись
global m1
global m2
global m3
global m4
global m5
global m6
~
#74819
заходим с старцу~
0 r 100
~
wait 3s
emot поднял на Вас мудрые глаза и заговорил.
wait 1s
say Приветствую Вас хоробрые воины.
wait 1s
вздох
say Давненько в наши края не заходила ниодна живая душа.
say Одни мертвецы повсюду бродят, да пугают народ.
wait 1s
say Видимо у Вас серьезная причина, если к нам зашли.
say Ну что ж, я могу рассказать Вам об этой земле.
say Вы готовы внимательно меня выслушать?
вопр
calcuid ded 74823 mob
attach 74820 %ded%
~
#74820
слушаем деда~
0 d 100
слушаю~
wait 2s
say Ну так вот!
say Давным-давно жил на свете &WСедой маг&n.
say И случилось в его жизни  совершить сделку с дьяволом!
say Его обманули, и обманным путем превратили в предводителя мертвых.
грус
wait 2s
say С тех пор он стал владыкой этих земель и проклял их.
say Теперь ни один человек не может пройти мимо, чтобы не не услышать вой мертвых,
say и плачь проклятой земли.
вздох
wait 2s
say Я приставлен к этим землям на веки, чтобы оградить люд от входа в них.
say Но если Вы готовы попробовать сразиться с силами тьмы, я помогу Вам попасть туда.
вопр 
say Ну что согласен?
calcuid ded 74823 mob
*detach 74820 %self.id%
detach 74819 %ded%
attach 74821 %ded%
~
#74821
берем квест~
0 d 100
согласен~
wait 2s
кив
wait 1s
say Видимо я нашел людей, готовых сразиться с нежитью.
wait 2s
say А...Вот еще что, чуть не забыл, &WСедого мага&n нельзя просто так убить.
say Он может быть повержен только волшебным мечом.
say Я хранил его всю жизнь, но тебе я его доверю.
wait 1s
mecho Мудрый старец вынул эскалибур из ножен!
wait 1s
say Ну так вот, маг этот должен быть убит эскалибуром.
mload obj 74811
дать эскал %actor.name%
wait 1s
say Ну вроде все....
say Ах да...так как меч этот обладает волшебной силой,
say он предупредит Вас о приближении предводителя мертвых.
wait 2s
say Ну с божьей помощью!
подбодр %actor.name%
wait 2s
mecho Старец взахнул руками и Вы на миг потерялись в пространстве.
mat 74801 mecho Кто-то появился здесь в клубах сизого дыма.
mteleport all 74801
wait 1s
mat %actor.realroom% mecho Вы очутились на &Kпроклятой земле!&n
*calcuid ded 74823 mob
detach 74820 %self%
detach 74821 %self%
~
#74822
телепортимся к квестеру~
2 e 100
~
wecho Лазурная пентограмма возникла в воздухе.
%portal% 74849 1
~
#74823
заходим к старцу2~
0 q 100
~
if ( (%world.curmobs(74821)% < 1) && (%world.curmobs(74822)% < 1) )
  wait 3s
  ул
  say Я вижу ты справился со своей задачей и убил &WСедого мага&n.
  say Признаться не ожидал, что вернешся ты целым.
  wait 1s
  дум
  wait 1s
  say Ну чтож я благодарен тебе за службу.
  say Верни мне мой меч, ибо ты еще недостаточно опытен чтобы владеть им.
  wait 1s
  ждать
  *calcuid ded 74823 mob
  detach 74823 %self%
end
~
#74824
отдаем меч обратно~
0 j 100
~
if (%object.vnum% != 74809)
  say Зачем мне это?
  return 0
  halt
end
wait 1
mpurge %object%
wait 1s
say Вот спасибо, неожидал что ты еще и честным окажешься.
say Ну раз так, то я тебя отблагадарю.
wait 3s
switch %random.9%
break
case 1
  if %world.curobjs(74812)% < 2
    mload obj 74812
    mecho Мудрый старец вынул &Cэскалибур&n из ножен!
    wait 2s
    дать эскал .%actor.name%
    брос эскал
    г За отличную службу, и освобождение людей от темной силы, я дарю тебе свой меч!
    поклон .%actor.name%
  else
    set buf %self.gold(+666)%
    give 666 кун .%actor.name%
  end
break
case 2
  if %world.curobjs(74814)% < 2
    mload obj 74814
    mecho Мудрый старец снял с себя доспех победителя нежити.
    wait 2s
    дать досп .%actor.name%
    брос досп
    г За отличную службу, и освобождение людей от темной силы, я дарю тебе свой доспех!
    поклон .%actor.name%
  else
    set buf %self.gold(+666)%
    give 666 кун .%actor.name%
  end
break
case 3
  if %world.curobjs(74815)% < 2
    mload obj 74815
    mecho Мудрый старец снял с себя плащ победителя нежити.
    wait 2s
    дать плащ .%actor.name%
    брос плащ
    г За отличную службу, и освобождение людей от темной силы, я дарю тебе свой плащ!
    поклон .%actor.name%
  else
    set buf %self.gold(+666)%
    give 666 кун .%actor.name%
  end
break
case 4
  if %world.curobjs(74816)% < 2
    mload obj 74816
    mecho Мудрый старец снял с себя щит победителя нежити.
    wait 2s
    дать щит .%actor.name%
    брос щит
    г За отличную службу, и освобождение людей от темной силы, я дарю тебе свой щит!
    поклон .%actor.name%
  else
    set buf %self.gold(+666)%
    give 666 кун .%actor.name%
  end
break
case 5
  if %world.curobjs(74817)% < 2
    mload obj 74817
    mecho Мудрый старец снял с себя оберег победителя нежити.
    wait 2s
    дать обер .%actor.name%
    брос обер
    г За отличную службу, и освобождение людей от темной силы, я дарю тебе свой оберег!
    поклон .%actor.name%
  else
    set buf %self.gold(+666)%
    give 666 кун .%actor.name%
  end
break
case 6
  if %world.curobjs(74818)% < 2
    mload obj 74818
    mecho Мудрый старец прекратил использовать посох победителя нежити!
    wait 2s
    дать посо .%actor.name%
    брос посо
    г За отличную службу, и освобождение людей от темной силы, я дарю тебе свой посох!
    поклон .%actor.name%
  else
    set buf %self.gold(+666)%
    give 666 кун .%actor.name%
  end
break
default
  mload obj 74819
  mecho Мудрый старец достал груду драгоценных камней!
  wait 2s
  дать груд .%actor.name%
  брос груд
  г За отличную службу, и освобождение людей от темной силы, я обогащу тебя!
  поклон .%actor.name%
break
done
detach 74824 %self%
~
#74825
умер клер~
0 f 100
~
if ( (%world.curobjs(74820)% < 2) && (%random.1000% < 101 ) )
  mload obj 74820
elseif ( (%world.curobjs(74821)% < 2) && (%random.1000% < 101 ) )
  mload obj 74821
end
~
#74826
умер колд~
0 f 100
~
if ( (%world.curobjs(74822)% < 2) && (%random.1000% < 101) )
  mload obj 74822
elseif ( (%world.curobjs(74823)% < 2) && (%random.1000% < 101) )
  mload obj 74823
end
~
#74827
умер вор~
0 f 100
~
if ( (%world.curobjs(74824)% < 2) && (%random.1000% < 101) )
  mload obj 74824
elseif ( (%world.curobjs(74825)% < 2) && (%random.1000% < 101) )
  mload obj 74825
end
~
#74828
умер батыр~
0 f 100
~
if ( (%world.curobjs(74826)% < 2) && (%random.1000% < 101) )
  mload obj 74826
elseif ( (%world.curobjs(74827)% < 2) && (%random.1000% < 101) )
  mload obj 74827
end
~
#74829
умер наем~
0 f 100
~
if ( (%world.curobjs(74828)% < 2) && (%random.1000% < 101) )
  mload obj 74828
elseif ( (%world.curobjs(74829)% < 2) && (%random.1000% < 101) )
  mload obj 74829
end
~
#74830
умер друж~
0 f 100
~
if ( (%world.curobjs(74830)% < 2) && (%random.1000% < 101) )
  mload obj 74830
elseif ( (%world.curobjs(74831)% < 2) && (%random.1000% < 101) )
  mload obj 74831
end
~
#74831
умер кудес~
0 f 100
~
if ( (%world.curobjs(74832)% < 2) && (%random.1000% < 101) )
  mload obj 74832
elseif ( (%world.curobjs(74833)% < 2) && (%random.1000% < 101) )
  mload obj 74833
end
~
#74832
умер волш~
0 f 100
~
if ( (%world.curobjs(74834)% < 2) && (%random.1000% < 101) )
  mload obj 74834
elseif ( (%world.curobjs(74835)% < 2) && (%random.1000% < 101) )
  mload obj 74835
end
~
#74833
умер чернок~
0 f 100
~
if ( (%world.curobjs(74800)% < 2) && (%random.1000% < 101) )
  mload obj 74800
end
~
#74835
умер охот~
0 f 100
~
if ( (%world.curobjs(74840)% < 2) && (%random.1000% < 101) )
  mload obj 74840
end
~
#74836
умер кузя~
0 f 100
~
if ( (%world.curobjs(74842)% < 2) && (%random.1000% < 101) )
  mload obj 74842
elseif ( (%world.curobjs(74843)% < 2) && (%random.1000% < 101) )
  mload obj 74843
end
~
#74837
умер купа~
0 f 100
~
if ( (%world.curobjs(74844)% < 2) && (%random.1000% < 101) )
  mload obj 74844
elseif ( (%world.curobjs(74845)% < 2) && (%random.1000% < 101) )
  mload obj 74845
end
~
#74838
умер волхв~
0 f 100
~
if ( (%world.curobjs(74846)% < 2) && (%random.1000% < 101) )
  mload obj 74846
elseif ( (%world.curobjs(74850)% < 2) && (%random.1000% < 101) )
  mload obj 74850
end
~
#74839
репоп~
2 f 100
~
calcuid or 74800 room
attach 74806 %or%
*моба не существует в момент репопа
*перенесено на загрузку моба 
*calcuid mag 74822 mob
*attach 74816 %mag.id%
*calcuid mag 74822 mob
*attach 74817 %mag.id%
calcuid ded 74823 mob
attach 74819 %ded%
*calcuid ded 74823 mob
attach 74823 %ded%
*calcuid ded 74823 mob
attach 74824 %ded%
wait 1
calcuid troom 74873 room
attach 74849 %troom.id%
~
#74840
умер охот2~
0 f 100
~
if ( (%world.curobjs(74804)% < 2) && (%random.1000% < 101) )
  mload obj 74804
end
~
#74841
Трон освобожд проход на север~
2 z 100
~
wait 4s
wecho После смерти своего повелителя трон оказался нужным ему на том свете!
wait 1s
wecho Трон медленно исчез из виду, особождая проход на север.
*
calcuid tron 74849 obj
wpurge %tron%
*
wdoor 74892 north flags a
wdoor 74892 north room 74874
wdoor 74874 south flags a
wdoor 74874 south room 74892
detach 74841 %self%
~
#74842
умерли стражники~
0 f 100
~
if ( (%world.curobjs(74847)% < 2) && (%random.1000% < 101) )
  mload obj 74847
elseif ( (%world.curobjs(74848)% < 2) && (%random.1000% < 101) )
  mload obj 74848
end
~
#74843
ЗапоминаемМобов2~
0 n 100
~
*ждем чтоб все мобы точно загрузились
wait 5s
*ищем всех нужным мобов
*2 группа
calcuid m7 74830 mob
calcuid m8 74834 mob
wait 1
calcuid m9 74835 mob
calcuid m10 74837 mob
calcuid m11 74838 mob
* 
*делаем переменные глобальными чтоб не стерлись
global m7
global m8
global m9
global m10
global m11
~
#74846
умер клер2~
0 f 100
~
if ( (%world.curobjs(74802)% < 2) && (%random.1000% < 101) )
  mload obj 74802
end
~
#74847
умер волхв2~
0 f 100
~
if ( (%world.curobjs(74805)% < 2) && (%random.1000% < 101) )
  mload obj 74805
end
~
#74848
умер волш2~
0 f 100
~
if ( (%world.curobjs(74808)% < 2) && (%random.1000% < 101) )
  mload obj 74808
end
~
#74849
ОбнаружениеНесущегоЭскалибур~
2 e 100
~
*если игрок вошел в комнату и у него эскалибур
*либо в инвентаре, либо одет на него
*то подсвечиваем меч и трансформим его
* меч должен быть один!!!! иначе начнутся глюки!
*wecho -----------0 %world.curobjs(74811)%
if ( %world.curobjs(74811)% > 0 ) 
  calcuid mech 74811 obj 
  * смотрим владельца (кто несет)
  if %mech.carried_by%
    *если есть владелец получаем UID
    set i %mech.carried_by%
  end
  * смотрим владельца (на ком одет)
  if %mech.worn_by%
    *если есть владелец получаем UID
    set i %mech.worn_by%
  end
  if (%i% != %actor%)
    halt
  end
  *wecho -----------%actor.name% вооружен или несет
  *подсвечиваем и трансформим
  wait 1
  wecho _Эскалибур вспыхнул &Cголубым пламенем&n, предупреждая владельца о приближении нежити.
  exec 74850 %mech%
  detach 74849 %self.id%
end
~
#74850
ТрансформМеча~
1 z 0
~
otransform 74809 
~
#74851
ГрузитсяМаг~
0 n 100
~
attach 74816 %self%
attach 74817 %self%
~
#74852
группа реколиться2~
0 k 100
~
*Все мобы в группе котрая реколится теперь уникальны 
if ( %self.realroom% != 74841) 
  *реколимся только с 41 клетки
  halt
end
if ( ( %self.hitp% > 100) && ( %mkoldun.hitp% > 100) && (%volsh.hitp% > 100 ) )
  *если все здоровы - более 100 хитов - ниче не делаем
  halt
end
*Делаем вид что реколим группу
* куда реколим
switch %random.3%
  case 1
    set rV 74884
  break
  case 2
    set rV 74888
  break
  case 3
    set rV 74886
  break
done 
mecho Лекарь-нежити произнес : '... вам говорю, ступайте с миром.'.
if ( %world.curmobs(74834)% == 1 ) 
  mteleport %m8% %rV%
  mecho Кудесник-нежити исчез.
end
if ( %world.curmobs(74838)% == 1 )
  mteleport %m11% %rV%
  mecho Охотник-нежити исчез.
end
if ( %world.curmobs(74837)% == 1 )
  mteleport %m10% %rV%
  mecho Витязь-нежити исчез.
end
if ( %world.curmobs(74835)% == 1 )
  mteleport %m9% %rV%
  mecho Волшебник-нежити исчез.
end
mecho Лекарь-нежити исчез.
mteleport %self% %rV%
* чтоб не спамило проверяем существование
dg_cast 'вы слеп'
dg_cast 'сн молч'
dg_cast 'сн оцеп'
dg_cast 'исцел'
*
if ( %world.curmobs(74834)% == 1 )  
  dg_cast 'вы слеп' кудес
  dg_cast 'сн молч' кудес
  dg_cast 'сн оцеп' кудес
  dg_cast 'исцел' кудес
end
*
if ( %world.curmobs(74838)% == 1 ) 
  dg_cast 'вы слеп' охот
  dg_cast 'сн молч' охот
  dg_cast 'сн оцеп' охот
  dg_cast 'исцел' охот
end
*
if ( %world.curmobs(74837)% == 1 ) 
  dg_cast 'вы слеп' вит
  dg_cast 'сн молч' вит
  dg_cast 'сн оцеп' вит
  dg_cast 'исцел' вит
end
*
if ( %world.curmobs(74835)% == 1 ) 
  dg_cast 'вы слеп' вол
  dg_cast 'сн молч' вол
  dg_cast 'сн оцеп' вол
  dg_cast 'исцел' вол
end
~
$~
