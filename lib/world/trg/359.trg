#35900
отдаем тряпочку старухе~
0 ab 50
~
exec 35901 %world.obj(35916)%
сн тряп
дать тряп старух
detach 35900 %self%
~
#35901
траснформ тряпочки~
1 b 0
~
if (%self.vnum% == 35916)
  otransform 35917
else
  otransform 35916
end
~
#35902
смачиваем тряпочку/принимаем зелье~
0 j 100
~
wait 1s
if (%object.vnum% == 35917)
  exec 35901 %world.obj(35917)%
  %echo% Старуха заботливо смочила тряпочку в тазике с водой.
  wait 1
  дать тряп мат.хоз
  attach 35900 %world.mob(35901)%
  halt
end
if (%object.vnum% == 35919 && %actor.vnum% == -1)
  detach 35900 %world.mob(35901)%
  if (%world.curobjs(35916)% > 0)
    %purge% %world.obj(35916)%
  else
    %purge% %world.obj(35917)%
  end
  %purge% %world.mob(35901)%
  %load% mob 35932
  set q359 %actor%
  global q359
  remote q359 %world.mob(35932)%
  рад
  дать зель мат.хоз
end
~
#35903
одеваем тряпочку~
0 j 100
~
wait 1s
if (%object.vnum% == 35916)
  одет тряп
  eval rnd %random.num(1000)%
  if (%rnd% < 500)
    %echo% Мать хозяина хутора с хрипом вздохнула и закашлялась.
    wait 1
    %echo% Старуха горько вздохнула.
  end
end
~
#35904
приветствие старухи~
0 d 0
что случилось?~
wait 1s
if (%speech.car% == что && %speech.cdr% == случилось?)
  плак
  г Вот милок, заправляла тут всем моя хозяйка.
  г И в одно прекрасное утро она не смогла подняться с постели...
  г И уже долгое время не может говорить.
  г Видят Боги, яд в кровушке ее бежит и сжигает бедную изнутри.
  wait 1s
  всхлип
  wait 1s
  г Помоги нам, путник, прошу тебя!
  г Сама я не могу ее оставить без присмотра, да и годы уже не те...
  attach 35905 %self%
end
~
#35905
квестит старуха~
0 d 0
помогу~
if (%speech% == помогу)
  detach 35904 %self%
  wait 1s
  осм .%actor.iname%
  wait 1s
  г Может и взаправду сможешь помочь.
  г Есть у нас раб один, он, судя по всему, видел что-то.
  г Он тогда с ней был. С тех пор носиться по хутору обезумевший...
  г Никому ничего внятно рассказать не может.
  г Останови его, может ты поймешь, что он бормочет.
  attach 35910 %world.mob(35921)%
  attach 35911 %world.mob(35921)%
  
  detach 35905 %self%
end
~
#35906
Выбираем лодочников~
2 f 100
~
if %random.100% < 50
  %load% mob 35933
  %load% mob 35935
  %teleport% %world.mob(35935)% 36139
else
  %load% mob 35934
  %load% mob 35936
  %teleport% %world.mob(35934)% 36139
end
~
#35907
беготня раба~
0 ab 100
~
eval room %self.realroom%
if (%room.north%)
  set exits north
end
if (%room.south%)
  set exits %exits% south
end
if (%room.west%)
  set exits %exits% west
end
if (%room.east%)
  set exits %exits% east
end
eval rnd %random.num(%exits.words%)%
: бешеными глазами оглядел все вокруг и чего-то испугавшись вскрикнул
eval exit %exits.words(%rnd%)%
if (%exit% == south)
  set direction north
end
if (%exit% == north)
  set direction south
end
if (%exit% == west)
  set direction east
end
if (%exit% == east)
  set direction west
end
откр двер %exit%
откр калит %exit%
откр ворот %exit%
%exit%
закр двер %direction%
закр калит %direction%
закр ворот %direction%
дрож
~
#35908
во всем виноват хвост~
0 c 1
наступить на хвост~
if (%actor.vnum% != -1)
  halt
end
eval gr %actor.group%
if (%gr%)
  eval rnd %random.num(%gr.words%)%
  eval rndchar %gr.words(%rnd%)%
else
  eval rndchar %actor%
end
set needarg на хвост
if (%cmd% == наступить)
  if (%arg% == %needarg%)    
    крич АЙ!
    г Больно ведь! Чего творишь?!
    : досадливо погладила свой хвост
    wait 1s
    г Все вы люди одинаковые, на маленьких не смотрите...
    плак
    %echo% Маленькая мышка громоко запищала !
    wait 1s
    %echo% Из темноты показался зловещий силуэт непонятного происхождения. По Вашему телу пробежала дрожь !
    wait 1s
    %load% mob 35931
    %force% %world.mob(35931)% г Опять тебя эти двуногие обижают?
    кив
    %force% %world.mob(35931)% убить .%actor.iname%
    detach 35908 %self.id%
  else
    if (%rndchar% == %actor%)
      %send% %actor% Осторожнее ногами тут махайте, а то можно и в капкан угодить.
      if (%random.100% < 50)
        %send% %actor% &RБольшой капкан захлопнулся на Вашей ноге.&n
        %send% %actor% Это действительно БОЛЬНО !
        eval buf %actor.hitp(-5)%
        %echoaround% %actor% %actor.iname%, размахивая ногами, угодил в большой капкан.
      end
    else
      eval rnd %random.1000%
      if (%rnd% < 333)
        %send% %actor% &YВы УЖАСНО наступили на ногу %rndchar.dname%.&n
        %send% %rndchar% &R%actor.iname% УЖАСНО наступил%actor.g% Вам на ногу.&n
        %send% %rndchar% Это действительно БОЛЬНО !
        foreach i %gr%
          if (%i% != %actor% && %i% != %rndchar%)
            %send% %i% %actor.iname% УЖАСНО наступил%actor.g% %rndchar.dname% на ногу.
          end
        done
      end
      if (%rnd% > 333 && %rnd% < 666)
        %send% %actor% &YВы БОЛЬНО наступили на ногу %rndchar.dname%.&n
        %send% %rndchar% &R%actor.iname% БОЛЬНО наступил%actor.g% Вам на ногу.&n
        %send% %rndchar% Это действительно БОЛЬНО !
        foreach i %gr%
          if (%i% != %actor% && %i% != %rndchar%)
            %send% %i% %actor.iname% БОЛЬНО наступил%actor.g% %rndchar.dname% на ногу.
          end
        done
      end
      if (%rnd% > 666)
        %send% %actor% &YВы СМЕРТЕЛЬНО наступили на ногу %rndchar.dname%.&n
        %send% %rndchar% &R%actor.iname% СМЕРТЕЛЬНО наступил%actor.g% Вам на ногу.&n
        %send% %rndchar% Это действительно БОЛЬНО !
        foreach i %gr%
          if (%i% != %actor% && %i% != %rndchar%)
            %send% %i% %actor.iname% СМЕРТЕЛЬНО наступил%actor.g% %rndchar.dname% на ногу.
          end
        done
      end
      %send% %actor% Упс !
    end
  end
end
~
#35909
cтоп~
0 d 0
стой~
if (%speech% == стой)
  detach 35907 %self%
  дрож
  wait 1s
  %echo% Обезумевший раб что-то невнятно забубнил.
  %echo% Из несвязной речи некоторые слова Вам показались понятными.
  wait 1s
  г ...камни... 
  wait 1s
  г ...темень...
  wait 1s
  г ...мерзость...
  wait 1s
  г ...хвост...
  wait 1s
  г ...зубы... 
  wait 1s
  г ...когти...
  wait 1s
  г ...УЖААААС... ААААА!!!
  %echo% Обезумевший раб схватился заголову и с криком побежал от Вас прочь.
  %load% mob 35930
  %teleport% %world.mob(35930)% 35983
  attach 35907 %self%
  detach 35908 %self%
end
~
#35910
приветствие ведьмы~
0 r 100
~
wait 1
г Зелья, травки! Берем не стесняемся!
г Всякие разные! От любой хвори спасающие!
г Берем, по нужде и без нужды, лишним не будет!
wait 1s
if (%actor.sex% == 1)
  г Здравствуй, сынок, какое тебе зелье надобно?
  шеп .%actor.iname% У меня есть чудесное приворотное зелье! Все женщины будут твоими!
else
  г Здравствуй, дочка, какое тебе зелье надобно?
  шеп .%actor.iname% У меня есть чудесное приворотное зелье! Все мужчины будут твоими!
end
миг .%actor.iname%
~
#35911
квестит ведьма~
0 d 1
противоядие~
if (%speech% == противоядие)
  %echoaround% %actor% %actor.iname% подробно рассказал%actor.g% старой ведьме о случившемся.
  %send% %actor% Вы подронбно рассказали старой ведьме о случившемся.
  wait 1s
  дум
  wait 1s
  чес
  г Да.. тяжелый случай.
  г Знаю я один рецепт и даже умею готовить.
  смущ
  wait 1s
  г Но для него у меня не хватает одного единственного ингридиента.
  г Кусочка шерсти зверя заморского, в жарких странах обитающего.
  г Пока его оттуда привезут, лечить будет уже некого.
  взд
  wait 1s
  г Если раздобудешь его - приноси, приготовлю тебе противоядие бесплатно!
  attach 35912 %self%
  detach 35910 %self%
  detach 35911 %self%
end
~
#35912
награждает ведьма~
0 j 100
~
wait 1
if (%object.vnum% == 35918)
  : повертела в руках кисточку с хвоста льва
  г Ух ты... и правда необычный, боюсь предположить как выглядит владелец.
  г Ну ладно, надо торопиться!
  wait 1s
  %echo% Старая ведьма достала небольшой котелок с уже кипящим варевом и поставила его на огонь.
  wait 1s
  %echo% Старая ведьма вынула откуда-то клочек бересты.
  г Так-с, что тут у нас? Сердце змеи-скоропеи, коготь летучей мыши из Ада.
  г Кусочек сверкающих змеинных лат, осколок красного золота,
  г Помет двухглавого черного змея, измочаленная кожа морока...
  wait 1s
  %echo% Перечисляя ингредиенты, старая ведьма попутно добавляла их в котелок.
  %echo% Вы невольно задумались о том, как они у нее оказались...
  wait 1s
  г Обломок титанового доспеха.. Ой! Это не из этого рецепта.
  %echo% Старая ведьма быстро достала лишний ингредиент из котелка.
  wait 1s
  г Ну вот последнее, кисточка с хвоста зверя заморского!
  %echo% Как только кусок хвоста упал в котелок из него вырвались клубы дыма окутавшие Вас!
  %echo% - Готово! - повизгивая от радости вскрикнула старая ведьма, видимо ей это удалось первый раз.
  %purge% %world.obj(35918)%
  %load% obj 35919
  дать зель .%actor.iname%
end
~
#35913
бедный лев~
0 f 100
~
if (%world.curobjs(35918)% < 1)
  %send% %actor% В порыве битвы, промазав по большому льву, Вы с размаху ударили по его хвосту, отрубив кисточку.
  %echoaround% %actor% В порыве битвы %actor.iname%, не только убил%actor.g% бедного льва, но и порубил%actor.g% его хвост ровными кусочками.
  %load% obj 35918
end
~
#35914
!! FINISH !!~
0 j 100
~
wait 1
if (%object.vnum% == 35919)
  %purge% %world.obj(35919)%
  %echo% Глаза матери хозяина хутора заблестели от слез радости.
  осуш нап
  wait 1s
  %echo% На ваших глазах тело женщины наполнила жизненная сила.
  %echo% Мать хозяина хутора встала с постели.
  wait 1s
  г Спасибо тебе, %q359.iname%!
  г Ты спас%q359.q% мне жизнь, возьми это!
  eval rnd %random.1000%
  if (%rnd% <= 333)
    if (%world.curobjs(35920)% <= 5)
      %load% obj 35920
      дать перчат .%q359.iname%
    else
      %self.gold(+5000)%
      дать 5000 кун .%q359.iname%
    end
  end
  if (%rnd% > 333 && %rnd% <= 555)
    %load% obj 512
    дать книг .%q359.iname%
  end
  if (%rnd% > 555 && %rnd% <= 777)
    %load% obj 1748
    дать сер.перг .%q359.iname%
  end
  if (%rnd% > 777)
    %load% obj 519
    дать книга .%q359.iname%
  end
  detach 35914 %self%
end
~
#35915
лодочник телепортит~
0 m 1
~
wait 1
if %amount% < 10
  say Маловато будет!
  give %amount% кун %actor.name%
  halt
end
wait 1
msend %actor%  Вы уселись в лодку и мальчишка принялся грести.
mechoaround %actor%  %actor.name% усел%actor.u% в лодку и мальчишка принялся грести.
if (%self.realroom% == 35900)
  mteleport %actor% 36139
else
  mteleport %actor% 35900
end 
mechoaround %actor%  Кто-то приплыл сюда на лодке.
~
#35916
Лоадим лодочников 1~
2 z 0
~
%load% mob 35933
~
#35917
Лоадим лодочников 2~
2 z 0
~
%load% mob 35935
~
#35918
Лоадим лодочников 3~
2 z 0
~
%load% mob 35936
~
#35919
Лоадим лодочников 4~
2 z 0
~
%load% mob 35934
~
$~
