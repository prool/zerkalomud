#80300
Воевода дает маин квест_1~
0 r 100
~
if (%quest803.name% == %nil%)
  wait 1s
  г Приветствую тебя %actor.iname%!
  г Вижу ты прибыл%actor.g% издалека.
  думать %actor.iname%
  wait 1s
  г Есть у меня для тебя задание ответственное.
  г Выполнив его ты всей Руси поможешь.
  г ну так как, подсобишь?
else
  calcuid form_mb 80300 mob
  detach 80301 %form_mb.id%
  attach 80303 %form_mb.id% 
  рычать %actor.iname%
  wait 1s
  г Ну здравствуй!
  г Я ждал тебя %actor.iname%...
  г Моя разведка доложила, что тебя наняли убить меня и моих десятников!
  г Но не думай, что ты прош%actor.y% сюда просто так...
  г По моему приказу тебя пропустили.
  думать %actor.iname%
  г Есть у меня к тебе встречное предложение.
  г Встань на путь истинный!
  г Мне не хочется тебя убивать и вот что я тебе предлагаю...
  wait 1s
  г Ты вернешься к стратегу и скажешь, что я и мои десятники мертвы.
  г Этим ты сослужишь службу всей руси и искупишь свой грех!
  г Ну так как, ты на нашей стороне или нет? ДА или НЕТ!?
  wait 1s
end
~
#80301
Воевода дает маин квест_2~
0 d 0
да~
if (%quest803.name% == %nil%)
  set quest803 %actor% 
  set side803 0
  worlds quest803
  worlds side803
  wait 1s
  г Я знал что ты согласишься!
  улыб %actor.iname%
  г Так вот.
  г Здесь, недалеко от нас, есть лагерь, в котором окопались кочевники.
  г Они на наши села и города набеги устраивают, мужиков губят а жен их и детей уводят!
  рычать
  wait 1s
  г Но наш шпион доложил нам, что есть у них там планы большие, как на нас нападать!
  г Шпион то наш не может их достать.
  думать %actor.iname%
  г Принеси мне их и тогда мы сможем остановить вторжение.
  г Удачи тебе!                          
end
calcuid del_trig 80300 mob
detach 80300 %del_trig.id% 
detach 80301 %del_trig.id% 
detach 80303 %del_trig.id%
~
#80302
Воевода принимает квест~
0 j 100
~
wait 1
if (%quest803.id% != %actor.id%)
  дум
  wait 1s
  drop all
  halt
end
if (%object.vnum% == 80319)
  wait 1
  mpurge %object%
  wait 2s
  г Не думал я, что на Руси еще есть такие люди как ты!
  г Наш человек, в лагере доложил, что ты спел%actor.u% со стратегом кочевников!
  г Это ФАЛЬШИВЫЕ планы! 
  set side803 1
  worlds side803
  рычать %actor.iname%  
  wait 1s
  г Ты умрешь здесь! Тебе не уйти!
  атак .%actor.name%
  detach 80300 %self.id%
  detach 80301 %self.id%
  detach 80303 %self.id%
  detach 80302 %self.id%
  halt
end
if ((%object.vnum% == 80318) && !%exist.mob(80312)%)
  wait 1
  mpurge %object%
  wait 2s
  г Вот молодец!
  г Ты помог%actor.g% всей Руси!
  улыб %quest803.name%   
  eval giveitem %random.400% / 100
  if (%giveitem% == 1) && (%world.curobjs(80314)% < 10)
    mload obj 80314               
    дать меч %quest803.name%
    halt
  end
  if (%giveitem% == 2) && (%world.curobjs(80315)% < 10)
    mload obj 80315 
    дать щит %quest803.name%
    halt
  end
  mload obj 80320
  дать нагр %quest803.name%
  detach 80300 %self.id%
  detach 80301 %self.id%
  detach 80303 %self.id%
  detach 80302 %self.id%
end
~
#80303
Воевода дает встречный квест~
0 d 0
да нет~
if (%quest803.name% == %actor.name%) && (%speech% == да)
  wait 1s
  улыб %actor.iname%
  г Ты принял%actor.g% правильное решение.
  г Иди же, во славу Великой Руси!  
  set side803 0
  worlds side803
  calcuid form_mb 80300 mob
  detach 80300 %form_mb.id%
  detach 80301 %form_mb.id%
  detach 80303 %form_mb.id%
else
  wait 1s
  ругать %actor.iname% 
  г Ты не оставляешь мне выбора!
  г Во славу Великой Руси! 
  msend %actor.name% Воевода дико завопил и бросился на Вас.
  mechoaround %actor.name% Воевода дико завопил и бросился на %actor.rname%!
  calcuid form_mb 80300 mob
  detach 80300 %form_mb.id%
  detach 80301 %form_mb.id%
  detach 80302 %form_mb.id%
  detach 80303 %form_mb.id%
  атак %actor.name%
end 
~
#80304
Репоп~
2 f 100
~
set quest803 %nil%
worlds quest803
set side803 %nil%
worlds side803
calcuid strateg 80312 mob
detach 80308 %strateg.id%
attach 80305 %strateg.id%
attach 80306 %strateg.id%
attach 80307 %strateg.id% 
attach 80309 %strateg.id%
calcuid voevoda 80300 mob
detach 80303 %voevoda.id%
attach 80300 %voevoda.id%
attach 80301 %voevoda.id%
attach 80302 %voevoda.id%
attach 80310 %voevoda.id%
~
#80305
Стратег дает маин квест_1~
0 r 100
~
if (%quest803.name% == %nil%)
  думать %actor.iname%
  г А, смотрите кто пожаловал!
  г Наверно подзаработать хочешь %actor.iname% ?
  г Да?
else
  calcuid form_mb 80312 mob
  detach 80306 %form_mb.id%
  attach 80308 %form_mb.id% 
  рычать %actor.iname%
  wait 1s
  г А ты кто так%actor.w%?
  г Ах да! Я ждал тебя %actor.iname%...
  г Мои шпионы доложили, что тебя наняли достать мои планы!
  г Но не думай, что ты прош%actor.y% сюда просто так...
  г По моему приказу тебя пропустили.
  думать %actor.iname%
  г Есть у меня к тебе встречное предложение.
  г Зачем тебе гнуть спину ради каких-то там идеалов!
  г Богатство и власть! Вот что главное!
  г Я тебе очень хорошо заплачу, если ты мне поможешь.
  г Да и воевода теперь тебе доверяет...
  ухмыл
  wait 1s
  г Ты вернешься к воеводе в княжеский лагерь и отдашь ему фальшивые планы.
  г И не забывай! За это я хорошо заплачу!
  г Ну так как, ты на нашей стороне или нет? ДА или НЕТ!?
  wait 1s
end
вопрос %actor.iname%
~
#80306
Стратег дает маин квест_2~
0 d 0
да~
if (%quest803.name% == %nil%)
  set quest803 %actor% 
  set side803 1
  worlds quest803
  worlds side803
  г Ну так вот.
  г В княжеском лагере всем заправляет воевода и его 4 десятника.
  г Убей их и тогда возвращайся! 
  г Это все. Иди!       
  calcuid del_trig 80312 mob
  detach 80305 %del_trig.id% 
  detach 80308 %del_trig.id% 
end
~
#80307
Стратег принимает квест~
0 d 0
убил~
if (%quest803.name% == %actor.name%) 
  if (%side803% == 0) && (%exist.mob(80320)%)
    г Мне донесли что ты спел%actor.u% с воеводой из княжеского лагеря!
    г Вы спланировали меня обмануть!
    г Ты поплатишься за такую дерзость.
    г Умри... 
    msend %actor.name% Стратег издал истошный вопль и бросился на Вас.
    mechoaround %actor.name% Стратег издал истошный вопль и бросился на %actor.rname%!
    атак %actor.name%      
    calcuid form_mb 80312 mob
    detach 80305 %form_mb.id%
    detach 80307 %form_mb.id%
    detach 80308 %form_mb.id%
  elseif (%side803% == 1) && (%exist.mob(80300)% == %nil%) && (%exist.mob(80303)% == %nil%)
    г Ты сделал свою работу. Вот держи награду, как и договаривались.
    set give_item %random.4% 
    if (%give_item% == 1) && (%world.curobjs(80316)% < 10)
      mload obj 80316               
      дать лук %quest803.name%
      calcuid form_mb 80312 mob
      detach 80305 %form_mb.id%
      detach 80307 %form_mb.id%
      detach 80308 %form_mb.id%
      halt
    end
    if (%give_item% == 2) && (%world.curobjs(80317)% < 10)
      mload obj 80317 
      дать копье %quest803.name%
      calcuid form_mb 80312 mob
      detach 80305 %form_mb.id%
      detach 80307 %form_mb.id%
      detach 80308 %form_mb.id%
      halt
    end
    mload obj 80320
    дать нагр %quest803.name%
    calcuid form_mb 80312 mob
    detach 80305 %form_mb.id%
    detach 80307 %form_mb.id%
    detach 80308 %form_mb.id%
  else
    г А вот моя разведка доложила, что кто-то из них еще жив.
    г Иди, закончи свою работу!
  end
end
~
#80308
Стратег дает встречный квест~
0 d 0
да нет~
if (%speech% == да) && (%quest803.name% = %actor.name%)  
  wait 1s            
  улыб %actor.iname%
  г Ты принял%actor.g% правильное решение.
  г Иди же, не стой тут!
  г Вот тебе фальшивые планы. 
  set side803 1
  worlds side803 
  mload obj 80319
  дать планы %actor.name%
  calcuid form_mb 80312 mob
  detach 80305 %form_mb.id%
  detach 80306 %form_mb.id%
  detach 80307 %form_mb.id%
  detach 80308 %form_mb.id%
  detach 80309 %form_mb.id%
else
  wait 1s
  ругать %actor.iname%
  г Ты не оставляешь мне выбора!
  г Умри же! 
  set side803 0
  worlds side803
  msend %actor.name% Стратег издал истошный вопль и бросился на Вас.
  mechoaround %actor.name% Стратег издал истошный вопль и бросился на %actor.rname%!
  атак %actor.name%
  calcuid form_mb 80312 mob
  detach 80305 %form_mb.id%
  detach 80306 %form_mb.id%
  detach 80307 %form_mb.id%
  detach 80308 %form_mb.id%
end 
~
#80309
Смерть стратега~
0 f 100
~
if %world.curobjs(3349)% < 1  && %random.100% < 3
  *mload obj 3349
end
г Я недооценил тебя!  
set side803 0
worlds side803
mecho Стратег несколько раз сильно дернулся и притих...
mload obj 80318  
~
#80310
Смерть воеводы~
0 f 100
~
calcuid form_mb 80312 mob
detach 80309 %form_mb.id%
~
#80311
Умер шаман - лоад сетшмутки~
0 f 100
~
if %random.100% < 11
  mload obj 575
end
~
$~
