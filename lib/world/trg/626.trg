#62600
светильник~
2 c 0
нажать~
if (%actor.vnum% != -1)
  halt
end
if !%arg.contains(светильник)% 
  wsend %actor% _Что вы хотите нажать?
  halt
end
wsend %actor% _Вы аккуратно надавили на светильник.
wechoaround %actor% _~~%actor.name% аккуратно надавил%actor.g% на медный светильник.
wecho _Раздался едва слышный щелчок, но ничего не произошло.
detach 62601 %world.room(62603)%                    
*отключается ловушка в следующей комнате
~
#62601
арбалет~
2 e 100
~
*Если в предыдущей комнате не отрубить ловушку, то:
wait 2
%actor.wait(2)%
wecho _Как только вы вошли в комнату из-за ковров вырвался рой арбалетных стрел.
wecho _Вы попытались увернуться...
wecho _...но в таком ограниченном пространстве большая часть стрел все же достигла цели.
wecho &R Несколько стрел вонзилось в ваше тело! &n                                       
foreach victim %self.char%
  wdamage %victim% 200
done
~
#62602
скупщик~
0 r 50
~
wait 1
say Эй, что-то я тебя не припомню, новичок что ли?
say А впрочем, мне все равно, давай показывай что принес%actor.q%.
~
#62603
метнуть~
2 b 20
~
if !%self.npc%
  halt
end
eval dmg %random.100%+50
set target %random.pc% 
if !%target%
  halt
end
wsend %target%  Неожиданно вам в плечо вонзился метательный нож!
wechoaround %target%  Неожиданно в плечо %target.rname% вонзился метательный нож!
wecho Нечего стоять перед мишенью. 
wsend %target%  Ай как БОЛЬНО! 
wdamage %target% %dmg%
~
#62604
картина~
2 c 1
нажать~
if (%actor.vnum% != -1)
  halt
end
if !%arg.contains(завитушк)% 
  wsend %actor% _Что вы хотите нажать?
  halt
end
wsend %actor% _Вы надавили пальцами на одну из завитушек.
wechoaround %actor.name% _%actor.name% надавил%actor.g% пальцами на одну из завитушек на раме картины.
wecho _Стена плавно повернулась и открыла проход на запад.
wdoor 62607 w room 62642
wait 5s
wecho _Стена плавно повернулась и перекрыла проход на запад.
wdoor 62607 w purge
~
#62605
глава~
0 r 100
~
wait 1s
say Эй, ты вроде не из наших! Как ты сюда попал?! Прощайся с жизнью, смерд!
рыч 
wait 2s
дум
say Мммм... А впрочем не буду пока тебя убивать.
say Раз ты смог%actor.q% меня добраться, то, пожалуй, сгодишься мне для одного дела.
wait 2
say Итак, что ты выбираешь - смерть или службу?
~
#62606
пента~
1 c 2
соединить~
if (%actor.vnum% != -1)
  halt
end
if !%arg.contains(обломки)%
  osend %actor% _Что вы хотите соединить?
  halt
end 
if (%actor.realroom% != 62654)
  osend %actor% _Вы соединили обломки пентаграммы... Но ничего не произошло!
  halt
end
osend %actor% _Вы положили обломки пентаграммы на постамент и соединили их. 
oechoaround %actor% _%actor.name% положил обломки пентаграммы на постамент и соединил%actor.g% их.
oecho _Пентаграмма ярко засветилась и исчезла. 
set quest ok
global quest
remote quest %world.mob(62620)% 
odoor 62651 n purge
odoor 62656 w purge
odoor 62655 e purge
odoor 62654 w purge
odoor 62654 e purge
odoor 62653 s purge
odoor 62651 n room 62653
odoor 62651 n flags ab
odoor 62656 w room 62654
odoor 62656 w flags abc
odoor 62656 w key 62620
odoor 62655 e room 62654
odoor 62655 e flags abc
odoor 62655 e key 62620
odoor 62654 w room 62655
odoor 62654 w flags abc
odoor 62654 w key 62620
odoor 62654 e room 62656
odoor 62654 e flags abc
odoor 62654 e key 62620
odoor 62653 s room 62651
odoor 62653 s flags ab
opurge обломки 
~
#62607
останки~
2 c 2
обыскать~
if !%arg.contains(останки)%
  wsend %actor% _Вы начали судорожно обыскивать свои карманы - вдруг что пропало?
  wechoaround %actor% _%actor.name% начал%actor.g% судорожно шарить по карманам.
  halt
end
wsend %actor% _Вы начали ворошить останки тюремщика своим сапогом. 
wechoaround %actor% _%actor.name% начал%actor.g% ворошить останки тюремщика своим сапогом.
wsend %actor% _Вдруг из них со звоном вывалился ключик.            
wload obj 62626
detach 62607 %self.id%
~
#62608
помер зверь~
0 f 100
~
mload obj 62622
detach 62610 %world.mob(62620)% 
attach 62611 %world.mob(62620)%
~
#62609
репоп зоны~
2 f 100
~
*аттачим триг с ключом комнате с останками тюремщика.
detach 62607 %world.room(62667)%
attach 62607 %world.room(62667)%
*ресторим ловушку с арбалетом
detach 62601 %world.room(62603)%
attach 62601 %world.room(62603)% 
*удаляем проход на запад в комнате с картиной 
wdoor 62607 w purge
*восстанавливаем двери у лабораторий
wdoor 62651 n purge
wdoor 62656 w purge
wdoor 62655 e purge
wdoor 62654 w purge
wdoor 62654 e purge
wdoor 62653 s purge
wdoor 62651 n room 62653
wdoor 62651 n flags abcd
wdoor 62656 w room 62654
wdoor 62656 w flags abcd
wdoor 62655 e room 62654
wdoor 62655 e flags abcd
wdoor 62654 w room 62655
wdoor 62654 w flags abcd
wdoor 62654 e room 62656
wdoor 62654 e flags abcd
wdoor 62653 s room 62651
wdoor 62653 s flags abcd
*тут надо указать внум стражника, который просит убить главаря
calcuid guard 62057 mob
detach 62612 %guard.id%
detach 62613 %guard.id%
detach 62614 %guard.id%
attach 62612 %guard.id
attach 62613 %guard.id
attach 62614 %guard.id
~
#62610
жизнь и/или кошелек %)~
0 d 1
смерть службу~
if (%actor.vnum% != -1)
  halt
end
wait 1
switch %speech%
  case службу
    if %world.curobjs(62619)% >= 1
      halt
    end
    detach 62605 %self.id%  
    eval questor626 %actor.id%
    say Правильный выбор!
    mecho - Слушай меня внимательно.
    mecho - Мои колдуны перемудрили с заклинаниями и создали зверюгу, которая оказалась сильнее их.
    mecho - Зверь перебил охрану и бродит где-то в тюремных подземельях.
    mecho - Ну а колдуны остались заперты в своих лабораториях, куда без специального магического предмета никто войти не может.
    mecho - Я не могу отвлечься от дел гильдии и решить эту проблему.
    mecho - Коли сумеешь мне помочь - я, пожалуй, сохраню твою никчемную жизнь и даже вознагражу.
    mload obj 62619
    wait 1s
    give ключ %actor.name%
    say Вот тебе ключ - убей зверя и освободи моих магов!
  break
  case смерть
    say Что ж, ты сам%actor.g% выбрал%actor.g%!
    exec 62616 %world.room(62652)%
    stand
    kill %actor.name%
    foreach helpervnum 62617 62618 62619 62621 62622
      unset helper
      calcuid helper %helpervnum% mob
      if (%helper% && (%helper.position% != 7))
        mteleport %helper% 62652
        mecho _%helper.name% прибыл на зов главы гильдии.
        mforce %helper.name% kill %actor.name%
      end
    done
    detach 62610 %self.id%
  break
done  
~
#62611
награда за квест у главы~
0 d 0
готово сделано выполнено~
if (%quest% != ok)
  say Со зверем-то ты справил%actor.u%, молодец... 
  say Но надо ж еще и магов из их подземелий выпустить
  say Я в энтой магической дребедени ничего не знаю и знать не желаю.
  say Иди-ка сам голову поломай.
  halt
end  
*тут награда за квест
say Хм.. ну, награду ты заслужил%actor.g%!
wait 1s
say Уж какую ни есть.
ухм
wait 1s 
if     (%actor.class% == 0)
  mspellturn %actor% полная.слепота set
elseif (%actor.class% == 1)
  mskillturn %actor% лидерство set
elseif (%actor.class% == 2)
  mskillturn %actor% лидерство set
elseif (%actor.class% == 3)
  mskillturn %actor% лидерство set
elseif (%actor.class% == 4)
  mskillturn %actor% лидерство set
elseif (%actor.class% == 5)
  mskillturn %actor% лидерство set
elseif (%actor.class% == 6)
  mskillturn %actor% лидерство set
elseif (%actor.class% == 7)
  mskillturn %actor% лидерство set
elseif (%actor.class% == 8)
  mskillturn %actor% лидерство set
elseif (%actor.class% == 9)
  mskillturn %actor% лидерство set
elseif (%actor.class% == 10)
  mskillturn %actor% лидерство set
elseif (%actor.class% == 11)
  mskillturn %actor% лидерство set
elseif (%actor.class% == 12)
  mskillturn %actor% лидерство set
elseif (%actor.class% == 13)
  mskillturn %actor% лидерство set
end
say Ну вот и все, а теперь - проваливай! 
detach 62611 %self.id%
~
#62612
приветствие у стражника~
0 q 40
~
emot посмотрел на Вас и тяжело вздохнул
рыд
~
#62613
утешить стражника :-] (изврат по-древнерусски)~
0 c 1
утешить~
if !%arg.contains(стражник)%
  return 0
  halt
end
вздох 
wait 1s
say Что толку мне с твоих утешений. 
say Того и гляди наш князь выгонит меня, а то и посадит в поруб.
wait 2
say А все из-за проклятых воров. Устроили в моем городе притон, а где не могу узнать.
say Если до завтра не поймаю их главаря плакала моя головушка.
тоск
~
#62614
дали голову главы~
0 j 100
~
wait 1
if %object.vnum% != 62627
  say И так дела хуже и некуда, так еще издеваются!
  drop %object.name%
  брысь %actor.name%
  halt
end
say Ты нашел логово этого ворья!
mecho - Да еще и самого Ваньку-Каина убил!
рад 
say Ты заслужил награду...
mecho - Вот, прими это. 
switch %random.4%
  case 1
    if (%world.curobjs(62628)% < 10)
      mload obj 62628
      give гривн %actor.name%
    break
  end
  mload obj 62632 
  give грамот %actor.name%
break 
case 2
  if (%world.curobjs(62629)% < 10)
    mload obj 62629
    give гривн %actor.name%
  break
end
mload obj 62632 
give грамот %actor.name%
break
case 3
  if (%world.curobjs(62630)% < 10)
    mload obj 62630
    give гривн %actor.name%
  break
end
mload obj 62632 
give грамот %actor.name%
break 
case 4
  mload obj 62631
  give кошель %actor.name%
break
default
done
пожа %actor.name%
mpurge %object% 
detach 62612 %self.id%
detach 62613 %self.id%
*detach 62614 %self.id%
~
#62615
помер глава~
0 f 100
~
mload obj 62627
~
#62616
орет глава~
2 z 0
~
wzoneecho 62652 &Y "Ко мне, мои люди!!!" - заорал Ванька-Каин. &n
~
#62617
лезть в бочку~
2 c 0
лезть залезть ~
if (%self.vnum% == 62613)
  if !%arg.contains(бочк)%
    wsend %actor% _Куды лезем?
    halt
  end
  wsend %actor% _Вы перелезли через край бочки и бултыхнулись в воду.
  wechoaround %actor% _~~%actor.name% с пыхтением перелез%actor.q% через край бочки и плюхнул%actor.u% в воду.
  wteleport %actor% 62602
  wechoaround %actor% _~~%actor.name% залез%actor.q% в бочку.
else
  if !%arg.contains(наружу)%
    wsend %actor% _Куды лезем?
    halt
  end
  wsend %actor% _Вы перелезли через край бочки и спрыгнули на пол.
  wechoaround %actor% _~~%actor.name% вылез%actor.q% из бочки.
  wteleport %actor% 62613 
  wechoaround %actor% _~~%actor.name% вылез%actor.q% из бочки.
end 
~
#62618
лезть по веревке~
2 c 0
лезть залезть~
if !%arg.contains(веревк)%
  wsend %actor% _Куда вы хотите залезть?
  halt
end 
if (!%arg.contains(первой)% && !%arg.contains(второй)% && !%arg.contains(третьей)%)
  wsend %actor% _По какой веревке лезть желаете? Их тут ажно целых три!
  halt
end
if ( %arg.contains(первой)% || %arg.contains(третьей)%)
  wsend %actor% _Вы ухватились за веревку и полезли наверх.
  wechoaround %actor% _~~%actor.name% полез%actor.q% вверх по веревке.
  wsend %actor% _Внезапно веревка оборвалась.
  wechoaround %actor%  Веревка оборвалась и  %actor.name% рухнул%actor.q% на землю.
  eval damage %actor.hitp%/3
  wdamage %actor% %damage%
  wsend %actor% _Вы БОЛЬНО ушиблись
  wecho _Тотчас же наверху послышался шорох и вниз спустилась новая веревка.     
end 
if %arg.contains(второй)% 
  wsend %actor% _Вы ухватились за вторую веревку и полезли наверх.
  wechoaround %actor%   %actor.name% полез%actor.q% вверх по веревке.
  wteleport %actor% 62679
  wecho %actor.name% скрыл%actor.u% где-то в темноте под потолком.
  wechoaround %actor%    %actor.name% залез%actor.q% сюда по веревке.
end
~
#62619
ниндзя сдох~
0 f 100
~
mload obj 62643
mload obj 62606
~
#62620
бой на бревне~
0 k 10
~
eval victim %random.pc%
if (!%victim%)
  halt
end
mechoaround %victim% _Помощник наставника ловко столкнул %victim.vname% вниз!
msend %victim% _Помощник наставника ловко подсек Вас и скинул вниз с бревна!
mteleport %victim% 62620
eval damage %victim.hitp%/5
mdamage %victim% %damage%
msend %victim% Вы БОЛЬНО ударились! 
mechoaround %victim% _%victim.iname% вывалил%victim.u% откуда-то из-под потолка зала и рухнул%victim.g% на пол!
%victim.position(6)%
%victim.wait(1)%
~
#62621
у кузнеца~
0 j 100
~
wait 1
switch %object.vnum%
  case 62643
    mpurge %object%
    emot хмуро посмотрел на вас
    stand
    вздох
    mecho Кузнец расплавил свинец в тигле и залил расплавленный металл в форму.
    wait 1s
    mecho Кузнец вынул свинцовый шарик из формы и кинул в воду - охладиться.
    wait 2s
    mload obj 62652 
    give шарик %actor.name%
  break
  case 62642
    mpurge %object%
    хму
    say Все вам ножи да кинжалы!
    say Воры, душегубы проклятые!
    stand
    emot сунул нож в горн          
    wait 1s
    emot бросил раскаленный нож на наковальню и принялся плющить и перековывать его молотом
    emot сунул готовый кинжал в бадейку с маслом - для закала
    rest
    if ((%random.100% < 90) && (%world.curobj(62649)% < 25))
      mload obj 62649
      emot начал точить и полировать кинжал
      wait 2s
      emot закончил работу и принялся довольно разглядывать творение своих рук
      улы
      give длинный.кинжал %actor.name%
      say Вот! Кто лучше может - пущай в меня первый камень кинет!
      say А впрочем - сходи к оружейнику, может, он еще чего присоветует.
      emot неожиданно вспомнил, для каких дел вам потребна его работа
      морщ
      say Ну все - получил%actor.g%, чего хотел%actor.g%? Теперь проваливай!
      тоска
    else
      emot принялся разглядывать безнадежно испорченный нож
      руг
      say Не получится из этого ничего путного!
      emot бросил испорченный нож в груду мусора
    end
  break
  default
    say Мне это не нужно, положь где росло.
    give %object.name% %actor.name%
  break
done
~
#62622
вход к отравителю~
0 q 100
~
wait 2s
say Здоровы булы!
хих
emot посмотрел на вас и облизнул губы
say Чего изволите?
~
#62623
разговор с отравителем~
0 d 0
отрава зелье снадобье~
wait 1s
say Ну, это ко мне!...
хих
say Так какое такое зелье тебе надо?
wait 3
say Для ножа? 
wait 2
say Мда.. Можно, конечно, только вот в чем беда.
wait 2
say Травку для этого надо, что в подземелье здешнем растет.. а сам я туда идти не хочу.
wait 2
say Да еще заморское зелие, что купец чужедальний давеча вместо отступного принес.
say Хм... Что-то еще нужно...
emot глубоко задумался
wait 3
say Во! Еще бутыль самогону, которым наш кабатчик торгует!
say После такой отравы точно никто не выживет!
ухм
~
#62624
дали ингридиент отравителю~
0 j 100
~
wait 1
switch %object.vnum%
  case 62645
    say Агась... как раз травушка подойдет! 
    emot бросил %object.vname% в бадейку с какой-то отравой и принялся помешивать
    mpurge %object%
    eval ing1 1
    global ing1
    if ((%ing1% != 1) || (%ing2% != 1) || (%ing3% != 1))
      halt
    end
  break 
  case 62646
    say Во! Именно та отрава, которую давешний купчишка нам притащил.
    emot бросил %object.vname% в бадейку с какой-то отравой и принялся помешивать
    mpurge %object%
    eval ing2 1
    global ing2
    if ((%ing1% != 1) || (%ing2% != 1) || (%ing3% != 1))
      halt
    end
  break
  case 62647
    if ((%object.val2% != 5) or ( %object.val1% < 10 ))
      say Я ж сказал, самогон нужен! Наш! И полную бутыль! А ты что принес?!!
      give %object.name% %actor.name%
      halt
    end
    emot отхлебнул из бутыли
    say Уффффффффффххх!!! Да... э-этто им-то... ИК!
    emot опустошил %object.vname% в бадейку с какой-то отравой и принялся помешивать
    mpurge %object%
    eval ing3 1
    global ing3
    if ((%ing1% != 1) || (%ing2% != 1) || (%ing3% != 1))
      halt
    end
  break
  default
    say Хм... Этого я не просил вроде... ну да ничего - тоже сгодится.
    emot бросил %object.name% в варево и принялся помешивать
    mpurge %object%
    halt
  break
done 
wait 1s
emot принюхался к вареву и медленно позеленел
say Уф! Знатное зелье получилось!
wait 2s
emot осторожно набрал готовую отраву в склянку
mload obj 62644
give злое .%actor.name%
give злое %actor.name%
set ing1 0
set ing2 0
set ing3 0
global ing1
global ing2
global ing3
~
#62625
у оружейника~
0 j 100
~
wait 1
switch %object.vnum%
  case 62643
    say Неплохой материал... сгодится для кинжала.
    say Только ты его кузнецу сначала покажи.
    give кусоч %actor.name%
  break
  case 62652
    say Хороша штучка! Как раз к кинжалу какому-нибудь подойдет.
    emot сунул свинцовый шарик в карман
    eval shar 1
    global shar
    mpurge %object%
  break
  case 62649
    say Хорош кинжалище!
    if (%shar% != 1)
      say Можно бы и еще лучше сделать, да только свинца немного надо.
      give кинжал %actor.name%
      halt
    end
    say Как раз у меня для него кое-что есть.
    emot достал из кармана свинцовый шарик и пару раз подкинул его в руке.
    emot принялся откручивать рукоять кинжала.
    if (%random.100% < 80)
      emot вложил в рукоять свинцовый шарик и прикрутил рукоять на место
      emot пару раз взмахнул кинжалом, демонстрируя насколько резче стал удар
      mload obj 62650 
      give кинжал %actor.name%
      say Вот, владей на здоровье!
    else
      mecho рукоять кинжала с треском обломилась.
      руг
      say Эх, не вышло....
    end
    mpurge %object%
    eval shar 0
    global shar
  break 
  case 62641
    say Хорошая вещь! Пригодится для фокуса одного... Я его тебе как-нибудь покажу
    ухм
    emot сложил платок и сунул его в карман
    eval platok 1
    global platok
    mpurge %object%
  break
  case 62650
    if (%platok% != 1)
      say Да... Вот оружие стоящее!
      say К нему бы еще платок подходящий - цены бы не было!
      give кинжал %actor.name%
      halt
    end 
    say Прекрасное оружие! и как раз у меня к нему кое-что есть.
    emot достал из кармана широкий черный платок и взмахнул им пару раз.
    if (%random.100% < 50)
      emot накрепко привязал платок к рукояти кинжала
      emot взмахнул кинжалом, демонстрируя как платок скрывает движения руки
      mload obj 62651
      give кинжал %actor.name%
      say Его бы еще зельем колдовским смазать - цены бы не было!
      say Ну это ты к мастеру по зельям иди - тут рядом.
    else
      emot попытался привязать платок к рукоятке кинжала, но слишком сильно потянул и платок порвался
      руг
      emot с такой силой ткнул кинжалом в мишень, что тот переломился пополам
      руг
      руг
      say Вот ведь незадача...
      вздох
    end
    eval platok 0
    global platok
    mpurge %object%
  break
  case 62644
    emot аккуратно взял склянку
    emot рассмотрел зелье на просвет
    say Да... Ядреная вещь... Как раз кинжал смазать.
    emot осторожно поставил склянку на дальнюю полицу
    eval poison 1
    global poison
    mpurge %object%
  break
  case 62651
    if (%poison% != 1)
      say Хорошая вещь! Еще бы зелье к нему стоящее... 
      say Ну по поводу отравы - это ты к отравителю зайди.. или к кабатчику!
      give кинжал %actor.name%
      halt
    end
    say Да... немного я видел на своем веку таких кинжалов.
    say Но можно и еще лучше его сделать... есть у меня для него зелье колдовское.
    emot достал с дальней полицы какую-то склянку
    emot аккуратно нанес зелье на лезвие кинжала
    if ((%random.100% < 15) && (%world.curobjs(62640)% < 2))
      mecho _Кинжал вспыхнул ослепительным голубым светом и погас.
      say Вот теперь лучше этого кинжала сыскать будет мудрено.
      mload obj 62640
      give кинжал %actor.name%
    else
      mecho _Кинжал вспыхнул багровым сиянием и сгорел
      челю
      say Бывает же...
    end
    eval poison 0
    global poison
    mpurge %object%
  break
  default
    say Это оставь себе, не видишь - я занят?!
    give %object.name% %actor.name%
  break
done
~
#62626
взяли стрелу~
1 g 100
~
halt
osend %actor% _Как только вы выдернули стрелу из мишени, откуда-то явился здорово рассерженный вор.
oechoaround %actor% _Как только %actor.name% выдерну%actor.q% стрелу из мишени, откуда-то явился здорово рассерженный вор.
oecho _Сердитый вор сказал: Эй! Это мои стрелы! Отдавай сейчас же!
oload mob 62633
oforce сердитый.вор kill %actor.name%
detach 62626 %self.id%
~
#62627
лезть вниз~
2 c 1
лезть слезть~
if !%arg.contains(вниз)%
  wsend %actor% _Куда лезем?
  halt
end
wsend %actor% _Вы ухватились за веревку и полезли вниз.
wechoaround %actor% _%actor.name% схватил%actor.u% и полез%actor.q% вниз.
wteleport %actor% 62614
wechoaround %actor% _%actor.name% спустил%actor.u% сверху по веревке.
~
#62628
забили охранника у дверей~
0 f 100
~
mload obj 62600
~
#62629
трактирщик помер~
0 f 100
~
mload obj 62647
~
#62630
Воришка убит~
0 f 100
~
mload obj 62620
~
#62680
Делаем ловушку~
2 c 1
смастерить, сделать, изготовить~
if char.class==2
  %send% Ну чтож, начнем мастерить...
else
  %send% Вы же не тать что бы заниматься этим...
  halt
end
if !%arg.contains(ловушку)%
  %send% А что вы собственно собираетесь изготавливать?
  halt
else
  %send% Ловушку, интересно... А какую?
end
if !%arg.contains(усыпляющую)%
  %send% Ой, и где же вы такие ловушки то видели?
  halt
else
  %send% Хорошо, будем делать усыпляющую ловушку.
end
~
#62681
Убит старик-отшельник~
0 f 100
~
if (%world.curobjs(214)% < 50) && (%random.100% <= 15)
  mload obj 214
end
~
$~
