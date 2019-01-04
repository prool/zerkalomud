#61000
Странное место~
2 e 100
~
wait 1
foreach fchar %self.pc%
  if (%fchar.move% < 30)
    wsend %fchar% У Вас не хватило сил на прыжок.
    wsend %fchar% Вас начало засасывать в болото...
    wsend %fchar% Это УЖАСНО!
    wechoaround %fchar% %fchar.name% начал%actor.g% тонуть!!! 
    wechoaround %fchar% %fchar.name% медленно пропал%actor.g% в болотной жиже!!! 
    wteleport %fchar% 61060
    wait 1s
    if %fchar.realroom% == 61060
      wsend %fchar% Вы тонете!!
    end
  else
    wsend %actor%  Вы перепрыгнули с кочки на кочку
    wechoaround %actor%  Вы перепрыгнули с кочки на кочку
    eval buffer %fchar.move(-30)%
  end
done
~
#61001
слуховые галюцинации на болоте~
2 e 50
~
wait 1
wecho Откуда-то совсем близко раздался голос старика:
wecho Помоги мне, парень, выбраться...
wait 6 
wecho Постояв с минуту прислушиваясь, Вы с досадой сплюнули на землю!
wecho Обидно, что это наваждение, было бы интересно посмотреть как человек умирает.
~
#61002
слуховые галюцинации на болоте-2~
2 e 50
~
wait 1
wecho Внезапно раздался, леденящий душу, протяжный собачий вой!
wecho Ваши спутники разом, все как один, перекрестились (даже язычники и евреи)
wait 6 
wecho Каждый из вас вспомнил, слышанную еще с детства, старинную легенду
wecho О собаке урядника Баскервилева, живущую на болотах...
~
#61003
Сообщения в брюхе боброглота~
2 b 25
~
switch %random.15%
  case 1
    wecho Стенки брюха содрогнулись, и начали сжиматься.
  break
  case 2
    wecho Откуда-то сверху на вас обрушился целый водопад желтой слизи.
  break
  case 3
    wecho Послышался громкий неприятный звук, и в нос вам ударила волна мерзкого запаха.
  break
  case 4
    wecho Капли обжигающей кислоты попали вам за шиворот.
  break
  case 5
    wecho Вы споткнулись, и полетели прямо в кучу полупереваренных потрохов.
  break
  case 6
    wecho Стенки брюха гриба-боброглота принялись неторопливо вас пережевывать.
  break
  case 7
    wecho Стенки медленно запульсировали. На вас полился дурно пахнущий дождь из слизи.
  break
  case 8
    wecho Проворно шевелящийся отросток вдруг вынырнул из лужи слизи, подергал вас за ногу и убрался обратно.
  break
  case 9
    wecho Одна из дыр вдруг резко сжалась, и вам в лицо ударила тугая струя бледно-зеленой жидкости.
  break
  case 10
    wecho Послышался гулкий вибрирующий звук, и воздух наполнился зловонием.
  break
  case 11
    wecho Бледно светящееся щупальце вынырнуло откуда-то, ухватило кусок полупереваренной кишки и шустро исчезло.
  break
  case 12
    wecho Слизь вокруг вас забурлила, и запузырилась.
    wecho Один из пузырей с чпокающим звуком лопнул, обдав вас волной липкой дряни.
  break
  case 13
    wecho Мясистый отросток вдруг свесился сверху, потыкался вам в лицо, и снова скрылся.
  break
  case 14
    wecho Стенки брюха завибрировали, сжимаясь.
    wecho Уровень слизи резко поднялся, на мгновение скрыв вас с головой, и снова опал.
  break
  case 15
    wecho Откуда-то послышалось ритмичное хлюпанье и хрипение.
  break
done
~
#61004
Боброглот глотает~
0 b 50
~
wait 1
set victim %random.pc%
if !%victim%
  halt
end
msend %victim% Гриб-боброглот принялся ощупывать вас щупальцами и голодно ухать.
mechoaround %victim% Гриб-боброглот принялся ощупывать %victim.vname% щупальцами и голодно ухать.
if (%random.100% <= 51)
  msend %victim% Гриб-боброглот неожиданно сгреб вас щупальцами, и затащил к себе в пасть!
  mechoaround %victim% Гриб-боброглот сгреб %victim.vname% щупальцами и проглотил!
  mteleport %victim% 50084
  mechoaround %victim% Кто-то со сдавленным воплем вывалился сверху.
end
wait 1s
smitch %random.8%
case 1
  say Ух-уххухух-уххууухххууухуххуухуххуу!
break
case 2
  жадно
break
case 3
  жадно %victim.name%
break
case 4
  пищать
break
case 5
  искать
break
case 6
  рыгнуть
break
case 7
  язык
break
case 8
  say Ых-хохух-хахохухых!
break
done
~
#61005
Вылезти из брюха боброглота~
2 c 1
лезть залезть пролезть ползти~
wait 1
if (!%arg.contains(дыр)% && !%arg.contains(наружу)% && !%arg.contains(назад)% && !%arg.contains(отсюда)%)
  wsend %actor% Куда это вы лезете?
  halt
end
if (%actor.move% < 45)
  wsend %actor% Вы слишком устали...
  halt
end
wsend %actor% Вы встали на карачки и поползли в дыру.
wechoaround %actor% %actor.name% встал на карачки и принялся протискиваться в пульсирующую дырку.
wait 2s
if ((%random.100% < 98) && %exist.mob(61011)%)
  wsend %actor% Вы долго ползали по кишкам боброглота, но в конце-концов снова попали в брюхо...
  wechoaround %actor% Густо покрыт%actor.w% дрянью %actor.name% выполз%actor.q% откуда-то.
  eval buf %actor.move(-45)%
  wteleport %actor% 50084
  halt
end
wsend %actor% Наконец-то вы выбрались наружу! Но в каком виде...
calcuid mushroom 61011 mob
if %mushroom%
  set room %mushroom.realroom%
else
  eval room 27030+%random.20%
end
wteleport %actor% %room%
~
#61006
Убили боброглота~
0 f 100
~
calcuid troom 50084 room
foreach target %troom.pc%
  mteleport %target% %self.realroom%
  mechoaround %target% Покрыт%actor.w% всякой дрянью %target.name% вывалил%actor.u% из распоротого брюха гриба-боброглота!
  msend %target% Кто-то вспорол боброглоту брюхо и вы вывалились наружу!
done
mload obj 1758
~
#61007
Мухомор кусается~
0 b 15
~
wait 1
set victim %random.pc%
if !%victim%
  halt
end
msend %victim% Гигантский мухоморкостогрыз принялся алчно рассматривать вас и громко облизываться.
mechoaround %victim% Гигантский мухомор-костогрыз принялся осматривать %victim.vname% и громко облизываться.
msend %victim% Гигантский мухомор-костогрыз вдруг примерился, и откусил от вас кусок!
mechoaround %victim% Гигантский мухомор-костогрыз вдруг примерился, и откусил от %victim.rname% кусочек!
msend %victim% Это действительно БОЛЬНО! А если учесть откушенное - и обидно.
switch %random.10%
  case 1
    dg_affect %victim% сила плач -5 10000 2
  break
  case 2
    dg_affect %victim% ловкость плач -5 10000 2
  break
  case 3
    dg_affect %victim% телосложение плач -5 10000 2
  break
  case 4
    dg_affect %victim% обаяние плач -5 10000 2
  break
  case 5
    dg_affect %victim% макс.жизнь плач -50 10000 2
  break
  case 6
    dg_affect %victim% удача плач -10 10000 2
  break
  case 7
    dg_affect %victim% инициатива плач -10 10000 2
  break
  case 8
    dg_affect %victim% размер плач -10 10000 2
  break
  case 9
    dg_affect %victim% успех.колдовства плач -50 10000 2
  break
  case 10
    dg_affect %victim% запоминание плач -100 10000 2
  break
done
~
#61008
Мухомор следует~
0 bq 25
~
wait 1
if %actor%
  ухм
  follow .%actor.name%
  halt
end
if !%self.leader%
  set victim %random.pc%
  follow .%victim.name%
  щип .%victim.name%
end
~
#61009
Убили мухомора~
0 f 100
~
foreach target %self.pc%
  dg_affect %target% сила плач -5 0
  dg_affect %target% ловкость плач -5 0
  dg_affect %target% телосложение плач -5 0
  dg_affect %target% обаяние плач -5 0
  dg_affect %target% макс.жизнь плач -50 0
  dg_affect %target% удача плач -10 0
  dg_affect %target% инициатива плач -10 0
  dg_affect %target% размер плач -10 0
  dg_affect %target% успех.колдовства плач -50 0
  dg_affect %target% запоминание плач -100 0
done
~
#61012
Мухомор следует~
0 bq 25
~
wait 1
if %actor%
  ухм
  follow .%actor.name%
  halt
end
if !%self.leader%
  set victim %random.pc%
  follow .%victim.name%
  щип .%victim.name%
end
~
$~
