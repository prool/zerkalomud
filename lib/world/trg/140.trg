#14000
Вошли к девушке~
0 h 100
~
wait 2s
%echo% Наконец %self.iname% заметила Вас.
ужас .%actor.iname%
wait 1s
эмоц нервно икнула
wait 3
if (%actor.sex% == 2)
  г Что ты здесь делаешь, красна девица?
else
  г Что ты здесь делаешь, добрый молодец?
end
г Неужели не известно тебе это место?
вопрос .%actor.iname%
~
#14001
Сказали нет~
0 d 100
нет~
detach 14000 %self.id%
wait 3
г По договору нашей деревни со змеем лютым,
г каждый год одна молодая девица должна
г быть прикована цепями к этому столбу на
г этой самой скале. Взамен же, черный змей
г обещал не губить деревню, не уничтожать
г посевы, не проливать крови.
wait 2s
вздох
wait 1s
г В этом году жребий пал на мою сестрицу
г младшую. Да разве ж я могу отпустить ее
г на гибель верную? Сбежала среди ночи,
г оставив родителям прощальное письмецо.
wait 1s
груст
wait 1s
г Уж с минуты на минуту явится проклятая
г гадина, черный змей стоглавый. Убирайся
г отсюда пока еще можешь!
detach 14001 %self.id%
~
#14002
Сказали помогу~
0 d 100
*~
if ((%speech% != нет) && (%speech% != помогу) && (%speech% != не уйду))
  halt
end
detach 14000 %self.id%
detach 14001 %self.id%
wait 3
эмоц нервно захихикала
г Помочь хочешь?
г Змея проклятого убьешь, чтоли?
г Я как погляжу, ты всего лишь кузнец,
if (%actor.sex% == 2)
  г а не великая воительница.
else
  г а не великий воин.
end
wait 1s
эмоц открыла рот чтобы сказать что-то еще
%echo% Вдруг со стороны воды повеяло холодом.
wait 3
%echo% Тьма начала сгущаться вокруг Вас.
%echo% Из тьмы послышался голос:
%echo% _- Похоже, сегодня я полакомлюсь вдоволь.
%echo% _- Или опять сельчане вздумали драться за свободу свою?
%echo% Громогласный хохот раскатился по побережью.
wait 1s
%force% %actor% г Я сам%actor.g% по себе
%force% %actor% г И тебе эту девушку в обиду не дам!
wait 1s
%load% mob 14001
%echo% Из кромешной тьмы высунулась озадаченная змеиная голова.
calcuid head 14001 mob
%force% %head% г Да справишься ли ты хотя бы со мной, малыш?
detach 14002 %self.id%
~
#14003
Смерть головы~
0 cf 100
срубить~
if (%self.position% == 0)
  %echo% Извиваясь и брызгая бурой кровью, шея втянулась обратно во тьму.
  calcuid snake 14002 mob
  exec 14004 %snake.id%
  halt
end
if (!%arg.contains(голов)%)
  %send% %actor% Что срубить то?
  halt
end
%echo% Хорошенько размахнувшись, Вы срубили %self.vname%.
%echo% %self.iname% вспыхнул%self.g% и рассыпал%self.u% в прах.
%echo% Извиваясь и брызгая бурой кровью, шея втянулась обратно во тьму.
calcuid snake 14002 mob
exec 14004 %snake.id%
%purge% %self%
~
#14004
Змей кричит~
0 z 100
~
eval heads %heads%+1
global heads
wait 3
switch %random.5%
  case 1
    крич Шайтан тебя задери! Больно же!
  break
  case 2
    крич Ах ты зараза! Готовься к смерти!
  break
  case 3
    крич Ну иди же ко мне, утоплю тебя в море синем!
  break
  case 4
    крич Вот разозлишь меня - заморожу моментом!
  break
  case 5
    крич Готовься к смерти, воин, я уже наступаю!
  break
done
if (%heads% == 1)
  %door% 14002 east room 14004
  if (%exist.mob(14000)%)
    calcuid girl 14000 mob
    exec 14007 %girl.id%
  end
end
if (%heads% == 6)
  wait 1s
  крич Ну все! Надоело мне с тобой играть, будем воевать!
end
~
#14005
Сбегаем от змея~
0 k 100
~
eval perc ((%actor.hitp%*100)/%actor.maxhitp%)
if (%perc% <= 70)
  %echo% Забравшись слишком далеко от берега, Вы уже не можете одолеть змея.
  %echo% Откуда-то сверху послышалось:
  %echo% _- Лети вверх покуда жив%actor.g%, в небесной кузнице найдешь ты укрытие!
  wait 3
  %echo% Почувствовав необычайную легкость во всем теле, Вы взмыли в небеса.
  %teleport% %actor% 14012 horse
  calcuid sky 14012 room
  exec 14006 %sky.id%
  detach 14005 %self.id%
end
~
#14006
Небесные своды~
2 gz 100
~
wait 3
%door% %self.vnum% down purge
switch %self.vnum%
  case 14012
    %echo% &BПервый небесный свод захлопнулся за Вашей спиной.&n
  break
  case 14013
    %echo% &BВторой небесный свод захлопнулся за Вашей спиной.&n
  break
  case 14014
    %echo% &BТретий небесный свод захлопнулся за Вашей спиной.&n
  break
done
detach 14006 %self.id%
~
#14007
Девушка кидает полет~
0 z 100
~
wait 1s
%echo% %self.iname% подняла на Вас полные грусти и надежды глаза.
г Я буду молиться за тебя!
%echo% С этими словами она закрыла глаза, нашептывая что-то себе под нос.
eval victim %random.pc%
if (%victim.name%)
  dg_cast 'полет' .%victim.name%
end
~
#14008
Лоадим небожителя~
2 g 100
~
eval mvnum 14005+%actor.religion%
wait 1s
%echo% Вновь послышался знакомый голос:
%echo% _- Не заплутал%actor.g%, как я погляжу?
wait 1s
%load% mob %mvnum%
calcuid god %mvnum% mob
%echo% &Y%god.iname% вышел прямо из пламени горна!&n
wait 5
%force% %god% г Ну здравствуй, %actor.iname%!
dg_cast 'исцеление' .%actor.name%
wait 1s
calcuid parni 14004 mob
%force% %parni% шептать .%actor.name% Поклон не помешал бы
detach 14008 %self.id%
~
#14009
Поклон небожителю~
0 c 100
поклон~
%echo% Вы поклонились %self.dname% в пояс.
%force% %actor% г Здравствуй, %self.iname%!
wait 1s
г Видал я как ты решил%actor.u% девушке незнакомой помочь
г Как змею проклятому стал%actor.g% головы лихо рубить
г Решил помочь тебе, поделиться опытом, так сказать
wait 1s
крич Эй ты, змей, черный да стоглавый!
крич Не ломись ты в своды небесные, не то упадет небо на землю
крич Лучше прояви силушку свою, пролижи языком себе ход сюда
крич Мы тебе тогда кузнеца прямо на язык и усадим!
wait 1s
calcuid snake 14002 mob
%force% %snake% крич Готовься же к смерти, %actor.iname%!
wait 1s
кив
г Ну вот, теперь у нас есть немного времени
г Чтобы змея одолеть, нужно потрудиться
г Клещи кузнечные укрепить да раскалить
г Серебра добыть пару пудов, да плуг сковать из него
г Молот волшебный уговорить помочь тебе
wait 5
г Скажи как готов%actor.g% будешь в путь отправиться
attach 14010 %self.id%
detach 14009 %self.id%
~
#14010
Сказал готов~
0 d 100
*~
if (!((%actor.sex% == 1) && (%speech% == готов)) && !((%actor.sex% == 2) && (%speech% == готова)))
  halt
end
wait 5
switch (%quested%+1)
  case 1
    г Клещи кузнечные закалить надо по-особенному
    г Для того нужен порошок заморский, за ним и отправляйся
    wait 3
    %echo% %self.iname% взмахнул рукой и в глазах у Вас помутнело.
    eval temp %actor.wait(1)%
    %teleport% %actor% 14016 horse
    set quested 1
    global quested
    detach 14010 %self.id%
  break
  case 2
    г Теперича плуг нужно волшебный сотворить
    г Для того серебра два пуда нужно, постарайся добыть
    wait 3
    %echo% %self.iname% взмахнул рукой и в глазах у Вас помутнело.
    eval temp %actor.wait(1)%
    %teleport% %actor% 14020 horse
    set quested 2
    global quested
    detach 14010 %self.id%
  break
  case 3
    г Стало быть на молот охотиться пойдешь
    г Смотри только, не разгневай его, а то он в гневе страшен
    %echo% %self.iname% потер лоб, очевидно, вспоминая что-то неприятное...
    wait 3
    %echo% Опомнившись, он тут же взмахнул рукой и в глазах у Вас помутнело.
    eval temp %actor.wait(1)%
    %teleport% %actor% 14030 horse
    set quested 3
    global quested
    detach 14010 %self.id%
  break
done
~
#14011
Приподнять телегу~
1 c 4
приподнять~
if (%actor.fighting%)
  %echo% Но Вы ведь сражаетесь!
  halt
end
if (!%arg.contains(телег)%)
  %echo% Что Вы хотите %cmd%?
  halt
end
if (%holding%)
  %echo% Но Вы ведь уже ее держите!
  halt
end
if (%actor.move% < 5)
  %echo% Вы слишком устали, нужно немного отдохнуть.
  halt
end
%echo% Поднатужившись, Вы приподняли телегу.
%echo% Ох и тяжелая же! Вы с трудом удерживаете ее на весу.
eval temp %actor.move(-5)%
eval temp %actor.wait(1)%
set holding 1
global holding
if (%exist.obj(14006)%)
  calcuid wheel 14006 obj
  remote holding %wheel.id%
end
wait 3
%echo% Из леса послышались голоса:
%echo% _- Я же говорил, что не может купец быть настолько глупым!
if (%exist.mob(14007)%)
  calcuid seller 14007 mob
  %echo% %seller.iname% вздрогнул и поглядел по сторонам непонимающим взглядом.
end
%echo% _- Да ты посмотри на него, туп как пробка!
%echo% _- Ну охранник то все ж есть! Какой-никакой...
%echo% _- Вот сейчас и посмотрим - какой или никакой!
%echo% Громко хохоча, на дорогу вышли двое разбойников.
%load% mob 14008
calcuid razb1 14008 mob
%force% %razb1% mkill %actor%
wait 3
%load% mob 14008
calcuid razb2 14008 mob
%force% %razb2% mkill %actor%
~
#14012
Приладить колесо~
1 c 2
приладить~
if (%actor.fighting%)
  %echo% Но Вы ведь сражаетесь!
  halt
end
if (!%arg.contains(колесо)%)
  %echo% Что Вы хотите %cmd%?
  halt
end
if (!%holding%)
  %echo% Вам бы телегу сначала приподнять.
  halt
end
if (%actor.move% < 5)
  %echo% Вы слишком устали, нужно немного отдохнуть.
  halt
end
%echo% Кое-как придерживая телегу одним плечом, Вы начали прилаживать колесо на место.
eval temp %actor.wait(1)%
wait 1s
%echo% Хорошенько закрепив колесо, Вы резко крутанули его - кажется, можно ехать.
eval temp %actor.move(-5)%
%load% obj 14007
wait 1
if (%exist.obj(14005)%)
  calcuid vagon 14005 obj
  %purge% %vagon%
end
if (%exist.mob(14007)%)
  calcuid seller 14007 mob
  set quester %actor%
  remote quester %seller.id%
  exec 14013 %seller.id%
end
%purge% %self%
~
#14013
Купчина благодарит~
0 z 100
~
if ((%world.curmobs(14008)% > 0) || (%exist.obj(14005)%) || (!%quester.name%))
  halt
end
wait 1s
%echo% %self.iname% вскочил на ноги и начал обсыпать Вас благодарностями.
%echo% Вот только Вам ни слова не разобрать в его этих "Буси-дуси-муси-сан".
%echo% Несколько раз спросив у Вас что-то, %self.iname% достал из-за пазухи мешочек.
%load% obj 14008
give all .%quester.name%
wait 3
%echo% В глазах у Вас помутнело, возникло ощущение полета.
%teleport% %quester% 14014 horse
~
#14014
Разбойник умер~
0 f 100
~
if (%exist.mob(14007)%)
  calcuid seller 14007 mob
  set quester %actor%
  remote quester %seller.id%
  exec 14013 %seller.id%
end
~
#14015
Умер купчина~
0 f 100
~
%load% obj 14008
~
#14016
Стафина телепортит~
1 gz 100
~
wait 3
%echo% В глазах у Вас помутнело, возникло ощущение полета.
%teleport% %actor% 14014 horse
detach 14016 %self.id%
~
#14017
Даем небожителю~
0 j 100
~
switch %object.vnum%
  case 14008
    *мешочек с порошком
    wait 3
    кив
    %echo% %self.iname% передал %object.vname% одному из подмастерьев.
    %echo% Тот разом высыпал весь порошок в кадку с ледяной водой.
    %purge% %object%
    wait 3
    %echo% %self.iname% создал кузнечные клещи!
    %echo% С минуту подержав клещи в горне, %self.iname% опустил их в кадку.
    %echo% Раздалось громкое шипение, пар заволок всю кузню.
    %echo% %self.iname% взмахнул рукой, разгоняя пар, взглянул на клещи.
    wait 3
    г Ну вот, ладно получилось
    г Скажи как будешь готов%actor.g% дальше отправиться
    г Еще многое нужно успеть сделать!
    attach 14010 %self.id%
  break
  case 14011
    *пуд серебра
    if (!%silver%)
      set silver 1
      global silver
      wait 3
      г Хорошо, но на плуг нужно поболее.
    elseif (%silver% == 1)
      set silver 2
      global silver
      wait 3
      г Добро, этого хватит
      %echo% %self.iname% передал серебро подмастерьям и работа в кузне закипела.
      wait 3
      г Пока суд да дело, можно тебе и дальше отправиться
      г Скажи как будешь готов%actor.g%
      г Осталось молот волшебный уговорить
      %door% 14013 down room 14012
      attach 14010 %self.id%
    else
      нет
      г Это уже лишнее. Оставь себе, коли заслужил%actor.g%
      г Драгоценный металл у тебя с руками в любой кузне оторвут
      return 0
      halt
    end
    %purge% %object%
  break
  case 14015
    *молот
    г Вот и он, последний необходимый предмет
    г Еще бы немного и...
    wait 3
    %door% 14014 down room 14013
    %echo% Вдруг стены кузни содрогнулись, оконца заволокло тьмой.
    %echo% Ворвался в кузню язык змеиный, сплетенный из сотни языков поменьше.
    %echo% Схватил тогда %self.iname% клещи кузнечные...
    %echo% Да вцепился ими в язык змея проклятого.
    %echo% Стал змей визжать и извиваться всячески.
    %echo% Однако ж расплести языки свои не сумел.
    %load% obj 14017
    calcuid tongue 14017 obj
    calcuid kuznya 14015 room
    eval temp %tongue.put(%kuznya%)%
    calcuid snake 14002 mob
    %teleport% %snake% 14014
    wait 1s
    г Забирай обратно молот да ступай сражайся, пока я держу его!
    give молот .%actor.name%
    г Как сокрушишь змея, запрягай его в плуг
    г Да лети с ним в поле, что возле деревушки той
    г То поле перепашешь, вал змиев сотворишь
    г Ниодна гадина более не посмеет тогда нападать
    %load% obj 14016
    give плуг .%actor.name%
    drop all
    wait 3
    г Будем жить!
    dg_cast 'исцеление' .%actor.name%
  break
  default
    %echo% Ему это не нужно!
    return 0
  break
done
~
#14018
Вошли к рудокопам~
0 h 100
~
wait 5
дум .%actor.name%
г Что за?.. Табличка у входа гласит, что вход посторонним запрещен!
if (%exist.mob(14010)%)
  г Миломир, ты ведь установил табличку как я тебе говорил?
  wait 1s
  calcuid milomir 14010 mob
  %force% %milomir% г Да ты же сам недалече двух дней назад сказал сюда притащить
  %force% %milomir% г Сначала пытался ею починить кирки, потом ковырялся ею в стене
  %force% %milomir% плюн
end
wait 1s
чес
%echo% %self.iname% взглянул на искореженную табличку, валяющуюся в углу.
г Видимо, уже не гласит
г Но все же посторонним сюда вход запрещен! Проваливай!
wait 1s
if (%exist.mob(14010)%)
  calcuid milomir 14010 mob
  %force% %milomir% г Да погоди ты! Не видишь чтоли, кузнец к нам пожаловал%actor.g%
  if (%actor.sex% == 2)
    %force% %milomir% г Добра девица, не починишь ли ты наши инструменты?
  else
    %force% %milomir% г Статный молодец, не починишь ли ты наши инструменты?
  end
  %force% %milomir% вопрос .%actor.name%
  attach 14019 %self.id%
end
~
#14019
Сказали починю рудокопу~
0 d 100
починю~
wait 5
%echo% %self.iname% радостно потер руки.
г Это же замечательно! Проходи, располагайся!
г Посмотри что сможешь сделать ты с нашим инструментом
г Мы уж тебя отблагодарим, если починишь
%load% obj 14009
give all .%actor.name%
drop all
attach 14020 %self.id%
detach 14018 %self.id%
detach 14019 %self.id%
~
#14020
Даем рудокопу~
0 j 100
~
switch %object.vnum%
  case 14009
    %echo% %self.iname% жестом остановил Вас.
    г Говорил%actor.g% починишь? Вот и чини!
    return 0
  break
  case 14010
    wait 3
    рад .%actor.name%
    г Спасибо тебе, %actor.iname%!
    г Возьми в награду немного нашего богатства
    set i 0
    while (%i% < 3)
      %load% obj 14011
      calcuid silv 14011 obj
      eval temp %silv.put(%actor%)%
      eval i %i%+1
    done
    %echo% %self.iname% протянул Вам три пуда серебра.
    wait 3
    %echo% В глазах у Вас помутнело, возникло ощущение полета.
    %teleport% %actor% 14014 horse
  break
  default
    %echo% Ему это не нужно!
    return 0
  break
done
~
#14021
Ремонтируем инструмент~
1 c 2
починить~
if (!%arg.contains(инструмент)%)
  %echo% Что Вы хотите %cmd%?
  halt
end
if (!%actor.haveobj(14012)%)
  %echo% Ну метал Вы, допустим, отремонтируете, а с древками что?
  %echo% Тут бы что-нибудь клейкое не помешало, придется поискать.
  halt
end
calcuid glue 14012 obj
%purge% %glue%
%echo% Вы постарались вспомнить все что когда-либо видели или слышали о ремонте.
%echo% ...Тут вот подстучать, здесь приладить на липучку...
%echo% ...Хрясь! Ну а кто говорил, что починит весь-привесь инструмент?
%echo% ...Правильно, никто такого не говорил...
%echo% Наконец, у Вас в руках оказался приличный набор инструментов.
%load% obj 14010
calcuid tools 14010 obj
eval temp %tools.put(%actor%)%
wait 1
%purge% %self%
~
#14022
Смерть слизня~
0 f 100
~
if (%world.curmobs(14009)% == 1)
  %load% obj 14012
end
~
#14023
Нырнуть в ручей~
2 c 100
нырнуть~
if (!%arg.contains(в ручей)%)
  %echo% Куда это Вы хотите %cmd%?
  halt
end
%echo% Видимо, с головой у Вас совсем плохо.
%echo% Разбежавшись, Вы плюхнулись в середину ручья!
%teleport% %actor% 14052 horse
if (%exist.mob(14012)%)
  calcuid hammer 14012 mob
  if (%hammer.realroom% == 14052)
    remote actor %hammer.id%
    exec 14030 %hammer.id%
  end
end
~
#14024
Всплываем из ручья~
2 c 100
всплыть~
%echo% Вы начали работать ластами, стараясь всплыть на поверхность.
%echo% Не замерзнуть бы только теперь совсем.
%teleport% %actor% 14050 horse
~
#14025
Мерзнем в ручье~
2 b 100
~
switch %random.3%
  case 1
    %echo% Вам очень холодно, скоро Вы совсем замерзнете.
  break
  case 2
    %echo% Кажется у Вас отнялась нога. Скорее всплывайте!
  break
  case 3
    %echo% Вы уже не чувствуете кончиков пальцев на руках.
  break
done
foreach victim %self.pc%
  eval dam %victim.maxhitp%/10
  if (%dam% < %victim.hitp%)
    eval temp %victim.hitp(-%dam%)%
  end
done
~
#14026
Молот выбирает игру~
0 n 100
~
switch (%random.3%)
  case 1
    attach 14031 %self.id%
  break
  case 2
    attach 14032 %self.id%
  break
  default
    attach 14033 %self.id%
  break
done
detach 14026 %self.id%
~
#14027
Лоадим сугробы с тригом~
2 z 100
~
eval roomone 14030+%random.7%
eval roomtwo 14037+%random.7%
eval roomtri 14044+%random.7%
calcuid rmone %roomone% room
calcuid rmtwo %roomtwo% room
calcuid rmtri %roomtri% room
foreach snowone %rmone.objects%
  if (%snowone.vnum% == 14014)
    wait 3
    wat %roomone% wpurge %snowone%
    wat %roomone% wload obj 14013
    if (%roomone% == %actroom%)
      wat %roomone% wecho Что-то плюхнулось в сугроб.
    else
      wat %actroom% wecho Откуда-то послышался хлопок.
    end
  end
done
foreach snowtwo %rmtwo.objects%
  if (%snowtwo.vnum% == 14014)
    wait 3
    wat %roomtwo% wpurge %snowtwo%
    wat %roomtwo% wload obj 14013
    if (%roomtwo% == %actroom%)
      wat %roomtwo% wecho Что-то плюхнулось в сугроб.
    else
      wat %actroom% wecho Откуда-то послышался хлопок.
    end
  end
done
foreach snowtri %rmtri.objects%
  if (%snowtri.vnum% == 14014)
    wait 3
    wat %roomtri% wpurge %snowtri%
    wat %roomtri% wload obj 14013
    if (%roomtri% == %actroom%)
      wat %roomtri% wecho Что-то плюхнулось в сугроб.
    else
      wat %actroom% wecho Откуда-то послышался хлопок.
    end
  end
done
wait 3
wat %actroom% wecho Похоже, он спрятался где-то в снегу.
wat %actroom% wecho Надо бы присмотреться к этим сугробам.
wat %actroom% wecho Может тогда получится понять где он спрятался.
~
#14028
Ворошим сугроб~
1 c 4
переворошить~
if (!%arg.contains(сугроб)%)
  %echo% Что Вы хотите %cmd%?
  halt
end
%echo% Вы начали старательно ворошить сугроб...
wait 1s
if (%world.curobjs(14013)% > 1)
  %echo% Полностью его разворошив, Вы так ничего и не нашли!
  wait 1
  %purge% %self%
else
  %echo% Вдруг Вы наткнулись на что-то твердое и холодное...
  %echo% Из сугроба послышался голос:
  %echo% _- Вы нашли меня! Теперь можно и змеюку Вашу поубивать!
  %load% obj 14015
  calcuid hammer 14015 obj
  %echo% Вы достали %hammer.vname% из сугроба.
  eval temp %hammer.put(%actor%)%
  remote actor %hammer.id%
  exec 14016 %hammer.id%
end
~
#14029
Разгадываем загадки~
0 d 100
*~
switch %zagad%
  case 1
    if (%speech.contains(скатерть)%)
      set ugadal 1
    end
  break
  case 2
    if (%speech.contains(ключ)%)
      set ugadal 1
    end
  break
  case 3
    if (%speech.contains(кочерга)%)
      set ugadal 1
    end
  break
done
wait 5
if (%ugadal%)
  рад
  г Угадал%actor.g%, угадал%actor.g%!
  г Теперь можно и змеюку Вашу поубивать!
  %load% obj 14015
  calcuid hammer 14015 obj
  %echo% %hammer.iname% прыгнул прямо к Вам в руки.
  eval temp %hammer.put(%actor%)%
  remote actor %hammer.id%
  exec 14016 %hammer.id%
  wait 1
  %purge% %self%
else
  нет
end
~
#14030
Догнали молот~
0 z 100
~
wait 3
удивл
г Еще никто меня здесь не догонял!
г Ну, теперь можно и змеюку Вашу поубивать!
%load% obj 14015
calcuid hammer 14015 obj
%echo% %hammer.iname% прыгнул прямо к Вам в руки.
eval temp %hammer.put(%actor%)%
remote actor %hammer.id%
exec 14016 %hammer.id%
wait 1
%purge% %self%
~
#14031
Играем в прятки~
0 q 100
~
wait 1s
г Здоровеньки!
г Давай поиграем в прятки?
wait 1s
%force% %actor% г Некогда играть, нужно биться со змеем лютым
%force% %actor% г Ты мне нужен чтобы одолеть проклятую гадину
wait 1s
рад
г Раз я тебе так нужен, ищи меня
г Только сначала досчитай до пяти
%echo% %self.iname% треснул Вам в лоб с размаху.
%echo% У Вас из глаз посыпались звезды.
г И чур не подглядывать!
eval temp %actor.wait(3)%
%echo% После этих слов Вы потеряли %self.vname% из виду.
%force% %actor% г Но как же...
calcuid log 14030 room
attach 14027 %log.id%
eval actroom %actor.realroom%
remote actroom %log.id%
exec 14027 %log.id%
%purge% %self%
~
#14032
Загадываем загадки~
0 q 100
~
wait 1s
г Эгегей!
г Отгадай загадку!?
wait 1s
%force% %actor% г Некогда гадать, нужно биться со змеем лютым
%force% %actor% г Ты мне нужен чтобы одолеть проклятую гадину
wait 1s
г Тогда отгадай загадку, я с тобой и пойду
хих
wait 3
eval zagad %random.3%
global zagad
switch %zagad%
  case 1
    *скатерть
    г На срубленном да пиленом
    г Тканое положено,
    г Да на всех помножено.
    г Что от земли родится -
    г На тканое годится.
  break
  case 2
    *ключ
    г Пройдёт он первым без стыда
    г В любую дверь упрямо,
    г И первым в дом его всегда
    г Пропустит даже дама.
  break
  case 3
    *кочерга
    г Полно поле рыжих лошадей,
    г Одна вороная придёт -
    г Всех разгонит.
  break
done
wait 3
г Что это?
attach 14029 %self.id%
detach 14032 %self.id%
~
#14033
Играем в догонялки~
0 q 100
~
wait 1s
г БУ! Испугал%actor.u%?
г А давай в догонялки играть?
wait 1s
%force% %actor% г Некогда играть, нужно биться со змеем лютым
%force% %actor% г Ты мне нужен чтобы одолеть проклятую гадину
wait 1s
г А ты догони меня - я тебе тогда и помогу
eval temp %actor.hitp(-5)%
%echo% %self.iname% легонько стукнул Вас по плечу и взмыл куда-то ввысь
wait 1
%teleport% %self% 14052
wait 1s
if (%actor.realroom% != 14050)
  %send% %actor% Где-то громко булькнуло.
else
  %send% %actor% Что-то громко плюхнулось в ручей.
end
attach 14030 %self.id%
detach 14033 %self.id%
~
#14034
Запрягаем змея~
1 c 2
запрячь~
if (!%arg.contains(зме))
  %echo% Кого Вы хотите %cmd%?
  halt
end
if (!%exist.mob(14013)%)
  %echo% А змея то нет, девался куда-то.
  halt
end
calcuid snake 14013 mob
if (%self.room% != %snake.realroom%)
  %echo% А змея то здесь нет. Ищите лучше.
  halt
end
%echo% Вы ловко захомутали стоглавого черного змея в плуг.
eval temp %actor.wait(4)%
wait 3
%echo% Громко свистнув, Вы подняли его в воздух.
%echo% Облака понеслись мимо Вас на пути к деревне.
wait 1s
%echo% Приземлившись на поле возле деревни, Вы начали вспахивать землю.
%echo% Великих размеров земляной вал оставался за Вами... змиев вал!
wait 1s
%echo% Вспахав все поле, &YВы СМЕРТЕЛЬНО оглушили стоглавого черного змея.&n
%teleport% %self.carried_by% 14001
%echo% Сброшенное с крутого берега бездыханное тело быстро пошло ко дну.
wait 1s
if (%exist.mob(14000)%)
  %echo% "Теперь можно бы и девушку выручить", - подумалось Вам.
  calcuid girl 14000 mob
  attach 14035 %girl.id%
end
%purge% %self%
~
#14035
Конец квеста, вход к девушке~
0 q 100
~
wait 1s
%echo% Вы эффектно освободили девушку из кандалов, разорвав их пополам.
if (%actor.sex% == 2)
  %echo% Обнявшись как давно не видевшие друг друга подруги,
else
  %echo% Обнявшись как давно не видевшие друг друга влюбленные,
end
%echo% Вы зашагали в сторону деревни.
eval temp %actor.wait(4)%
%echo% И, как это часто бывает в сказках, далее последовали слезы, 
%echo% знакомство с родителями и сестрой девушки, всяческие убеждения 
%echo% остаться жить в деревне. Отец девушки оказался кузнецом и смог 
%echo% обучить Вас некоторым хитростям кузнечного дела. Однако пришло 
%echo% время Вам продолжать свой путь по просторам Руси-матушки...
if ((!%actor.skill(заточить)%) && (%actor.can_get_skill(заточить)%))
  mskillturn %actor% заточить set
  eval temp %actor.setquest(14000 %date.yday%)%
else
  eval temp %actor.gold(+1000)%
  %echo% Благодарные жители деревни наградили Вас целой тысячей кун.
end
wait 3s
%echo% Вы вновь пришли на тот самый скалистый берег,
%echo% Чтобы проститься с морем и поблагодарить небеса.
%echo% Тут и сказочке конец...
%purge% %self%
~
#14036
Лоадим побитого змея~
2 z 100
~
%load% mob 14013
%door% 14002 east purge
~
#14037
Змей неубивается (специально для мутантов)~
0 p 100
~
eval prm %damager.eq(16)%
eval off %damager.eq(17)%
if ((%prm.vnum% != 14015) && (%off.vnum% != 14015))
  %echo% Тьма окутала %self.vname% и полностью залечила причиненные Вами раны.
  %self.hitp% = %self.maxhitp%
else
  return 0
end
~
#14038
Змей рип!~
0 f 100
~
%door% 14002 east purge
%echo% &KБеспросветная тьма сгустилась, собрала тело змея из праха его.&n
%echo% &MВдарив молотом в самое сердце тьмы, Вы полностью рассеяли ее.&n
%echo% На земле остался лежать бездыханный стоглавый черный змей.
%load% mob 14013
return 0
~
#14099
РЕСЕТ~
2 f 100
~
%echo% RESETTING!
%door% 14012 down room 14011
%door% 14013 down room 14012
%door% 14014 down room 14013
%door% 14002 east purge
set i 14012
while (%i% <= 14014)
  calcuid temproom %i% room
  attach 14006 %temproom.id%
  eval i %i%+1
done
calcuid temproom 14015 room
attach 14008 %temproom.id%
eval j 14031
while (%j% <= 14051)
  wat %j% wload obj 14014
  eval j %j%+1
done
context 4000
set smithstory 0
worlds smithstory
~
$~
