#333300
ресет зоны~
2 f 100
~
calcuid dafu 333341 mob
attach 333306 %dafu.id%
attach 333307 %dafu.id%
~
#333301
китайцы разбегаются~
0 p 100
~
%echo% Толпа китайцев в страхе разбежалась...
бежать
~
#333302
загрузим переводчика~
1 j 0
*~
wait 2s
if (!%exist.mob(333354)%)
  %load% mob 333354
  %send% %actor% Маленький зверек выскочил у Вас из рук и засеменил рядом.
else
  %echo% ...и ничего не произошло.
end
~
#333303
выгрузим переводчика~
1 l 0
*~
wait 1s
if (%exist.mob(333354)%)
  %teleport% %world.mob(333354)% %self.room%
  %purge% маленький.зверек
  %echo% Маленький зверек чихнул и пропал в облачке пыли.
else
  %echo% ...и ничего не произошло.
end
~
#333304
покемон следует~
0 n 100
~
eval pcs %self.pc%
foreach pc %pcs%
  if ((%pc.eq(шея)%==%world.obj(333399)%)||(%pc.eq(грудь)==%world.obj(333399)%))
    след .%pc.name%
    рад
    halt
  end
done
сканд
%echo% Зверек не смог обнаружить своего хозяина и исчез...
%purge% маленький.зверек 
~
#333305
подстрочный перевод~
0 d 0
*~
switch %speech%
  case Шен ми ю йао ву льнаи? Са йи жи ву лун хиши!
    г %actor.name% говорит: "Чего желает моя любовь? Все для нее сделаю!"
  break
  case ванг хоу Юн жу, цай цьен!
    г %actor.name% говорит: "Передавай привет Княгине, прощай!"
  break
  case кси ду цинйан, суи шуо йи хен.
    г %actor.name% говорит: "Забирай эликсир, жаль отдавать, но ничего не поделаешь."
  break
  case вей, во гонк-фу руоже...
    г %actor.name% говорит: "Да, твое кун-фу оказалось сильнее нашего..."
  break
  case е ши хуо же! Да жанг!
    г %actor.name% говорит: "Ну он же еще живой! Иди, дерись!"
  break
  case лаи занг эрен жан доу же, йан ксуи гонк-фу.
    г %actor.name% говорит: "Идите, великие русские воины, проверим, чье кун-фу сильнее."
  break
  case хей! Гуин тинг? Куан даи таннке ци да жанг!
    г %actor.name% говорит: "Эй! Слышишь меня? Иди, развлеки гостей славной схваткой напоследок!"
  break
  case Ву даньйоу! Ву феи же ге панг зи куан даи ни.
    г %actor.name% говорит: "Не переживайте! Сейчас этот толстяк вас развлечет."
  break
  case нифан хоу?
    г %actor.name% говорит: "Скучно, наверное, ждать?"
  break
  case Хьян ченг! Тантай хьяоке...
    г %actor.name% говорит: "Вот и готово! Теперь настоится немного..."
  break
  case Цанг! Диньбу циу ху чу ши цинйан.
    г %actor.name% говорит: "Прекрасно! Теперь я готов сварить эликсир молодости."
  break
  case Та мен миан чу
    г %actor.name% говорит: "А мешать тебе станут"
  break
  case Лачи
    г %actor.name% говорит: "Теперь принеси мне"
  break
  case Ши ге
    г %actor.name% говорит: "А это"
  break
  case Са вен
    г %actor.name% говорит: "Я же просил"
  break
  case Веи, жаойонг.
    г %actor.name% говорит: "Угу, то что надо."
  break
  case Лиу хиин!
    г %actor.name% говорит: "Берегись их!"
  break
  case Гонк-фу чанши ни жуиган.
    г %actor.name% говорит: "Вот, например сейчас тебя будут преследовать мастера кун-фу."
  break
  case Та мен доу миан чу, фауванг ша шоу...
    г %actor.name% говорит: "Все они будут пытаться помешать тебе, подсылать наемных убийц..."
  break
  case Мэй ги рин йи жи хьяо де хао дуо менг кан цинйан...
    г %actor.name% говорит: "О том, что я буду готовить элексир, узнают, или уже узнали очень много заинтересованных лиц..."
  break
  case ди йи во йао йоу
    г %actor.name% говорит: "Для начала мне потребуется"
  break
  case гуи!
    г %actor.name% говорит: "Вот и славно!"
  break
  case фенльян! Мьян, кьин!
    г %actor.name% говорит: "Ух ты как! Скромно, по-княжески, ничего не скажешь!"
  break
  case Ньянхуи хоуши гуо!
    г %actor.name% говорит: "А то дел государственных - во!"
  break
  case Эрчи, мангхе во поу бу джьян?
    г %actor.name% говорит: "Слушай, а ты не поможешь мне собрать компоненты для зелья?"
  break
  case Шао ша ниньхинг же хьянг, лиа оран ...
    г %actor.name% говорит: "Напиток молодости такая штука, панимаишь..."
  break
  case Шуи ху джиа. Ву бу джьян.
    г %actor.name% говорит: "котелок чудесный есть - а из чего варить нету."
  break
  case Хьян жаойонг чу ши, куихьян ву юанниан,
    г %actor.name% говорит: "Нужно свежий варить, да не занимался я этим давно,"
  break
  case Тубаи пиан.
    г %actor.name% говорит: "Портится очень быстро."
  break
  case шеи?
    г %actor.name% говорит: "Кто такие?!"
  break
  case Фу шеньгкуан да тонг.
    г %actor.name% говорит: "В бочке хранить не станешь."
  break
  case Шен йиуйао?
    г %actor.name% говорит: "Чего хотели?"
  break
  case Вей... ши... хао... О-оо-о!
    г %actor.name% говорит: "Угу... угу.. так... О-оо-о!"
  break
  case Вей, дао ле занг гу лаи...
    г %actor.name% говорит: "Да, славные были времена..."
  break
  case шен? Хуи лу!?
    г %actor.name% говорит: "Это что? Взятка?!"
  break
  case Лао ваи, юн жу йивей ни ыу зуи жу йао.
    г %actor.name% говорит: "Чужеземцы, Княгиня сказала что главное вы должны передать на словах."
  break
  case йиинхё та фауанг ни?
    г %actor.name% говорит: "Зачем она вас отправила?"
  break
  case жебан... ши йонг
    г %actor.name% говорит: "Ну... или постараюсь..."
  break
  default
    пож
  break
done
~
#333306
приветствие~
0 r 100
~
wait 1s
г шеи?
г Шен йиуйао?
~
#333307
дали свиток~
0 j 100
~
wait 1s
if (%object.vnum%==15707)
  %echo% Дафу принялся читать свиток.
  wait 1
  %purge% свиток
  г Вей... ши... хао... О-оо-о! 
  wait 1
  ул
  wait 1
  %echo% Дафу погрузился в воспоминания...
  wait 2s
  г Вей, дао ле занг гу лаи...
  wait 1
  г Лао ваи, юн жу йивей ни ыу зуи жу йао.
  г йиинхё та фауанг ни?
  г Шен ми ю йао ву льнаи? Са йи жи ву лун хиши!
  wait 1
  г жебан... ши йонг
  attach 333308 %self.id%
  detach 333306 %self.id%
  detach 333307 %self.id%
else
  г шен? Хуи лу!?
  eval vzyatka %object.iname%
  брос %vzyatka.car%
  %send% %actor% Дафу в гневе швырнул %object.iname% Вам в лицо.
  %echoaround% %actor% Дафу в гневе швырнул %object.iname% %actor.dname% в лицо.
  %damage% %actor% %random.50%
end
~
#333308
квестначало~
0 d 1
эликсир бессмертие молодость здоровье здоровья красоты молодости~
г фенльян! Мьян, кьин!
дум
Wait 1s
г Шао ша ниньхинг же хьянг, лиа оран ...
г Фу шеньгкуан да тонг.
Wait 1s
г Тубаи пиан.
Wait 1s
г Хьян жаойонг чу ши, куихьян ву юанниан,
г Шуи ху джиа. Ву бу джьян.
Wait 1s
г Эрчи, мангхе во поу бу джьян?
г Ньянхуи хоуши гуо!
%echo% Дафу провел рукой в районе шеи и вопросительно посмотрел на Вас.
attach 333309 %self.id%
detach 333308 %self.id%
~
#333309
квест1~
0 d 1
да согласен помогу~
wait 1s
context 3333
г гуи!
eval kvestvnum 333318+%random.70%
eval kvestitem %world.obj(%kvestvnum%)%
set kvestnum 1
г ди йи во йао йоу
г %kvestitem.iname%
context 3333
global kvestitem
global kvestnum
wait 1s
г Мэй ги рин йи жи хьяо де хао дуо менг кан цинйан...
wait 1s
г Та мен доу миан чу, фауванг ша шоу...
wait 1s
г Гонк-фу чанши ни жуиган.
г Лиу хиин!
exec 333311 333390
attach 333310 %self.id%
detach 333309 %self.id%
~
#333310
квест2идалее~
0 j 100
~
wait 1s
context 3333
if (%object.vnum%==%kvestitem.vnum%)
  eval kvestnum %kvestnum%+1
  global kvestnum
  г Веи, жаойонг.
else 
  г Са вен
  г              %kvestitem.vname%
  г Ву феи же ге
  г            - %object.iname%
  halt
end
if (%kvestnum%<10)
  eval kvestvnum 333318+%random.70%
  eval kvestitem %world.obj(%kvestvnum%)%
  global kvestitem
  г Лачи
  г                      %kvestitem.vname%
  eval vragnum 333342+%kvestnum%
  eval trignum 333310+%kvestnum%
  exec %trignum% 333390
  eval vragid %world.mob(%vragnum%)%
  г Та мен миан чу
  г                                     %vragid.vname% !
else
  г Цанг! Диньбу циу ху чу ши цинйан.
  wait 1
  %echo% Дафу бросил все компоненты в большой котел, дунул, плюнул 
  %echo% и быстро слил получившуюся жидкость в бутылочку.
  wait 1
  г Хьян ченг! Тантай хьяоке...
  wait 2
  г нифан хоу?
  wait 1
  г Ву даньйоу! Ши ге панг зи куан даи ни.
  кив булан
  wait 1
  г хей! Гуин тинг? Куан даи таннке ци да жанг!
  wait 1
  %echo% Дафу мощным пинком отправил булана на юг.
  %teleport% булан 333382
  г лаи занг эрен жан доу же, йан ксуи гонк-фу.
  ухм
  attach 333399 %self.id%
  detach 333310 %self.id%
end
~
#333311
лоадмастеровкунфу~
2 z 100
~
eval i 1
while (%i%<=12)
  %load% mob 333343
  eval targetroom 333300+%random.89%
  %teleport% мастер %targetroom%
  eval i %i%+1
done
~
#333312
лоадмастеровушу~
2 z 100
~
eval i 1
while (%i%<=12)
  %load% mob 333344
  eval targetroom 333300+%random.89%
  %teleport% мастер %targetroom%
  eval i %i%+1
done
~
#333313
лоадмастеровШуайцзяо~
2 z 100
~
eval i 1
while (%i%<=12)
  %load% mob 333345
  eval targetroom 333300+%random.89%
  %teleport% мастер %targetroom%
  eval i %i%+1
done
~
#333314
лоадмастеровШаолинь~
2 z 100
~
eval i 1
while (%i%<=12)
  %load% mob 333346
  eval targetroom 333300+%random.89%
  %teleport% мастер %targetroom%
  eval i %i%+1
done
~
#333315
лоадмастеровТайцзи~
2 z 100
~
eval i 1
while (%i%<=12)
  %load% mob 333347
  eval targetroom 333300+%random.89%
  %teleport% мастер %targetroom%
  eval i %i%+1
done
~
#333316
лоадмастеровБагуачжан~
2 z 100
~
eval i 1
while (%i%<=12)
  %load% mob 333348
  eval targetroom 333300+%random.89%
  %teleport% мастер %targetroom%
  eval i %i%+1
done
~
#333317
лоадмастеровСинъицюань~
2 z 100
~
eval i 1
while (%i%<=12)
  %load% mob 333349
  eval targetroom 333300+%random.89%
  %teleport% мастер %targetroom%
  eval i %i%+1
done
~
#333318
лоадмастеровИцюань~
2 z 100
~
eval i 1
while (%i%<=12)
  %load% mob 333350
  eval targetroom 333300+%random.89%
  %teleport% мастер %targetroom%
  eval i %i%+1
done
~
#333319
лоадмастеровБацзицюань~
2 z 100
~
eval i 1
while (%i%<=12)
  %load% mob 333351
  eval targetroom 333300+%random.89%
  %teleport% мастер %targetroom%
  eval i %i%+1
done
~
#333350
оживляем китайцев~
2 z 100
~
wait 1s
%load% mob 333352
eval targetroom 333300+%random.89%
%teleport% китаец %targetroom%
~
#333351
оживляем китаянок~
2 z 100
~
wait 1s
%load% mob  333353
eval targetroom 333300+%random.89%
%teleport% китаянк %targetroom%
~
#333352
умер китаец~
0 f 100
~
exec 333350 333390
return 1
~
#333353
умерла китаянка~
0 f 100
~
exec 333351 333390
return 1
~
#333354
лоад шмота 00-18~
0 f 100
~
eval loadvnum 333299+%random.19%
%echo% %loadvnum%
if (%random.10%==1)
  if (%world.curobjs(%loadvnum%)%<5)
    %load% obj %loadvnum%
  end
end
~
#333355
лоад шмота 93-99~
0 f 100
~
eval loadvnum 333292+%random.7%
%echo% %loadvnum%
if (%random.10%==1)
  if (%world.curobjs(%loadvnum%)%<5)
    %load% obj %loadvnum%
  end
end
~
#333370
test~
0 p 100
~
%echo% %damager.name%
%echo% %skill%
return 5
~
#333399
наконецто~
0 q 100
~
wait 1s
if (%exist.mob(333339)%)
  г е ши хуо же! Да жанг!
else 
  г вей, во гонк-фу руоже...
  г кси ду цинйан, суи шуо йи хен.
  %load% obj 333389
  дать эликсир .%actor.name%
  wait 1s
  г ванг хоу Юн жу, цай цьен!
  %teleport% all 15750 horse
  detach 333399 %self.id%
~
$~
