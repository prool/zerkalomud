#73200
DT1~
2 g 100
~
eval actdex %actor.dex%+%actor.dexadd%
if %actdex% > 50
  eval actdex 50
end
eval check %actdex%+%random.50%
if %check% >= 60
  halt
end
wait 1
wechoaround %actor% %actor.name% не удержал%actor.u% на карнизе и с криком полетел%actor.g% вниз! 
wsend %actor% Вы не удержались на карнизе и с криком полетели вниз! 
switch %random.4%
  case 1
    wteleport %actor% 73290
  break
  case 2
    wteleport %actor% 73292
  break
  case 3
    wteleport %actor% 73294
  break
  case 4
    wteleport %actor% 73295
  break
done
%actor.position(6)%
eval lag %random.5%
%actor.wait(%lag%)%
eval dmg %actor.maxhitp%/3
wdamage %actor% %dmg%
~
#73201
просьба беглого раба~
0 r 100
~
wait 1
say О Боже! Вы за мной, да? Только не это...
wait 1
say Только не отдавайте меня им, пожалууйста!
чес
say Вы ведь не те, правда? Скажите, что вы не те!
~
#73202
предупреждение беглого раба~
0 d 2
мы не те~
say Не убива-а-айте! Я все отработаю!
say Вы, наверное, в Самоцветные горы идете, ага?
вопр %actor%
wait 1 s
say Тогда дам я вам несколько советов, они пригодятся, поверьте!
wait 1 s
say В горную долину отсюда можно добраться только перевалами, их всего три: северный, срединный и южный.
say Через северный и срединный не ходите ни в коем случае, ждет всякого чужака там неминуемая смерть.
say Пройти можно южным перевалом. Он, правда, кишит бандитами, но не это главная опасность...
emo вытер пот со лба и продолжил
wait 1 s
say Бывалые люди говорят, что там иногда веселятся духи, но такое веселье всегда предвещает призрак
say погибшего когда-то на этом перевале путника. В общем, если кто увидит такого - пускай бежит из тех
say краев без оглядки! И последнее - не устраивайте привал абы где, найдите подходящее место. Ибо много
say здесь жаждущих свежей крови водится...
wait 1 s
say Всех вам благ, люди добрые!
mecho Беглый раб ужом протиснулся меж камней и исчез с глаз долой.
mpurge %self%
~
#73203
явление погибшего путника~
2 g 100
~
wait 1
wload mob 73227
detach 73203 %self.id%
~
#73204
дух тварного мира~
2 e 100
~
wait 1
if %random.1000% <= 200
  wecho Дух тварного мира вылез из-под земли!
  wload mob 73226
end
detach 73204 %self.id%
~
#73205
первое появление кендарат~
2 c 0
разжечь развести~
return 1
set pogodka %weather.sunlight% 
if %pogodka.contains(ночь)% && %arg.contains(огонь)%
  wecho %actor.name% развел%actor.g% небольшой костер.
  wait 1 s
  %load% mob 73230
  wecho Внезапно Вам почудилось легкое дуновение ветра.
  wait 1 s
  wecho Мать Кендарат сказала : 'Приветствую вас, почтенные...'
  wecho Мать Кендарат сказала : 'Судя по всему, держите выпуть в Самоцветные горы. Похвальный героизм.'
  wecho Мать Кендарат сказала : 'Многие туда уходили, да только там же свою смерть и встретили.'
  wecho Мать Кендарат сказала : 'Послушайте совета моего, идите по домам, пока не поздно.'
  wait 1 s
  wecho - А коли тверды вы в своих намерениях, то не откажите же мне в помощи.
  wecho - Там, в самом сердце гор, за рудниками, в долине, в жилище хозяев, хранятся несметные сокровища.
  wecho - Среди прочих, имеется там Истовик-камень, самый чудесный минерал, когда-либо созданный природой.
  wecho - В руках простых смертных он бесполезен, но я, возможно, найду, как его использовать.
  wecho - Об одном только вас молю - если камень окажется у вас, бегите со всех ног.
  wecho - Легенды гласят, что он держит своим присутствием сами горы, не давая им упасть.
  return 1
  detach 73205 %self.id%
end
~
#73206
сделан фуллквест~
0 j 100
~
if (%object.vnum% != 73206)
  msend %actor% _- Нет, оставь лучше это себе.
  брос %object.name%
  return 0
  halt
end
wait 1
mpurge %object%
switch %random.4%
  case 1
    if (%world.curobjs(73200)% < 2)
      mload obj 73200
      дать щит %actor.name%
    end
  break
  case 2
    if (%world.curobjs(73204)% < 2)
      mload obj 73204
      дать лезвие %actor.name%
    end
  break
  case 3
    if (%world.curobjs(73205)% < 4)
      mload obj 73205
      дать крюч %actor.name%
    end
  break
  case 4
    if (%world.curobjs(73207)% < 2)
      mload obj 73207
      дать кольцо %actor.name%
    end
  break
done
set rnd %random.1000%
if %rnd% < 400
  mload obj 73210
  дать мешоч %actor.name%
end
switch %actor.class%
  case 0
    if %rnd% < 100
      mspellturn %actor.name% мантия.теней set
    end
  break
  case 1
    if %rnd% < 400
      mspellturn %actor.name% суд.богов set
    end
  break   
  case 2
    if (%rnd% < 100 && char.skill(подножка) < 151)
      mskilladd %actor.name% подножка 10
    end
  break   
  case 3
    if (%rnd% < 100 && char.skill(оглушить) < 151)
      mskilladd %actor.name% оглушить 20
    end
  break   
  case 4
    if (%rnd% < 100 && char.skill(осторожный.стиль) < 151)
      mskilladd %actor.name% осторожный.стиль 10
    end
  break   
  case 5
    if (%rnd% < 100 && char.skill(пнуть) < 151)
      mskilladd %actor.name% пнуть 10
    end
  break   
  case 6
    if (%rnd% < 100 && char.skill(осторожный.стиль) < 151)
      mskillturn %actor.name% осторожный.стиль 20
    end
  break   
  case 7
    if %rnd% < 50
      mspellturn %actor.name% защита.богов set
    end
  break
  
  case 8
    if %rnd% < 100
      mspellturn %actor.name% силы.зла set
    end
  break   
  case 9
    if (%world.curobjs(73203)% < 1)
      mload obj 73203
      дать посох %actor.name%
    else
      if %rnd% < 200
        mskilladd %actor.name% палицы 20
      end
    end 
  break   
  case 10
    if (%rnd% < 100 && char.skill(допол.выстрел) < 151)
      mskillturn %actor.name% допол.выстрел 10
    end
  break   
  case 11
    if (%rnd% < 100 && char.skill(горное.дело) < 151)
      mskilladd %actor.name% горное.дело 10
    end
  break   
  
  case 12
    if (%rnd% < 100 && char.skill(осторожный.стиль) < 181)
      mskilladd %actor.name% осторожный.стиль 20
    end
  break   
  case 13
    if %rnd% < 100
      mload obj 240
      дать рун %actor.name%
    end
  break   
done 
wait 1 s
say Спасибо вам, путники!
wait 3
%echo% Мать Кендарат медленно скрылась из виду.
mpurge мать.кендарат
~
#73207
Репоп зоны 732 - самоцветные горы~
2 f 100
~
calcuid room1 73283 room
attach 73203 %room1.id%
calcuid room2 73283 room
attach 73205 %room2.id%
calcuid room3 73284 room
attach 73204 %room3.id%
~
#73208
Выбраться из ловушки - шаг 1~
2 c 1
подтянуться оттолкнуться~
wait 1
if (%cmd% == оттолкнуться)
  wsend %actor% Вы оттолкнулись ногами от земли, немного помахали руками, и шлепнулись обратно.
  halt
end
wsend %actor% Вы подпрыгнули, уцепились за скальный выступ, и подтянулись на руках к краю расщелины.
attach 73209 %self.id%
set mntr %actor%
global mntr
detach 7321 %self.id%
exec 73211 %self.id%
detach 73208 %self.id%
~
#73209
Выбраться из ловушка - шаг2~
2 c 1
подтянуться оттолкнуться~
wait 1
if %actor.id% != %mntr.id%
  wsend %actor% А вот щас %mntr.name% свалится, да прямо на вашу дурную голову...
  wsend %actor% Ша! Сидите как мышь под веником.
  halt
end
if (%cmd% == подтянуться)
  wsend %actor% Вы напрягли все силы, пытась взобраться в расселину, но она расположена слишком высоко.
  halt
end
detach 73211 %self.id%
wsend %actor% Вы резко оттолкнулись ногами от скалы, и забросили свое тело в расселину.
wait 1
wsend %actor% __Вы долго взбирались по узким расселинам, где мелкие камни вырываются из-под ног
wsend %actor% __и сердце обмирает, когда вы невольно провожаете глазами их полет. Где струи ледяной воды
wsend %actor% __окатывают вас, вызывая противный озноб, а пальцы с обломанными ногтями намертво
wsend %actor% __вцепляются в поверхность скалы...
wait 1
wsend %actor% _Наконец, совершенно обессилев, вы выбрались на какую-то горную тропу.
wteleport %actor% 73269
set buff %actor.move(1)%
%actor.position(6)%
unset mntr
attach 73208 %self.id%
detach 73209 %self.id%
~
#73210
Лоад штанов~
0 f 100
~
if (%random.1000% < 100) && (%world.curobjs(73213)% < 2)
  mload obj 73213
end 
return 0
~
#73211
Обламываем недотеп~
2 z 100
~
wait 5s
wsend %actor% Вы устали висеть на скале, и снова спрыгнули на дно ущелья.
unset mntr
attach 73208 %self.id%
detach 73209 %self.id%
detach 73211 %self.id%
~
#73213
путник2~
0 n 100
~
mecho Дух погибшего путника медленно соткался из воздуха.
mecho Дух горестно вздохнул...
wait 1 s
mecho   - Подобру, люди добрые!
mecho   - Не ходите вы дальше, дух тварной истует совсем рядом, смерть несет!
wait 2 s
mecho Дух погибшего путника растворился на Ваших глазах.
mpurge %self%
~
#73217
Лоад истовика~
0 f 100
~
mload obj 73206
~
#73218
обозленныйвоин~
0 l 100
~
dg_affect %self% попадание доблесть +50 200
dg_affect %self% повреждение доблесть +120 200
dg_affect %self% здоровье доблесть -120 200
dg_affect %self% иммунитет доблесть +120 200
dg_affect %self% живучесть доблесть +120 200
dg_affect %self% защита.от.стихии.огня доблесть +120 200
dg_affect %self% защита.от.стихии.воды доблесть +120 200
dg_affect %self% защита.от.стихии.воздуха доблесть +120 200
dg_affect %self% защита.от.стихии.земли доблесть +120 200
dg_affect %self% удача доблесть +100 200
dg_affect %self% макс.жизнь доблесть +120 200
dg_affect %self% защита доблесть -120 200
dg_affect %self% инициатива доблесть +120 200
dg_affect %self% размер доблесть +50 200
dg_affect %self% ловкость доблесть +50 200
dg_affect %self% броня доблесть +100 200
dg_affect %self% сила доблесть +50 200
wait 1
dg_affect %self% макс.жизнь доблесть +120 200
wait 1
dg_affect %self% макс.жизнь доблесть +120 200
wait 1
dg_affect %self% макс.жизнь доблесть +120 200
wait 1
dg_affect %self% макс.жизнь доблесть +120 200
wait 1
dg_affect %self% макс.жизнь доблесть +120 200
wait 1
dg_affect %self% макс.жизнь доблесть +120 200
wait 1
dg_affect %self% макс.жизнь доблесть +120 200
wait 1
dg_affect %self% макс.жизнь доблесть +120 200
wait 1
detach 73218 %self.id%
~
#73219
Лоад кинжала татя~
0 f 100
~
if ((%random.1000% <= 150) && (%world.curobjs(73211)% < 3))
  mload obj 73211
end
~
#73220
пройдемте~
0 m 1
~
if (%amount% == 100000)
  mecho Страж тщательно пересчитал монеты и РЕЗКО и МГНОВЕННО пропал из виду!!!
  wait 1
  mpurge %self%
elseif (%amount% < 100000)
  wait 1 s
  чел
  say Вы что, оскорбить меня решили? А НУ ПРОЧЬ, НИКЧЕМНЫЕ ТВАРИ!!!
  wait 1 s
  к !масс оцеп!
  к !суд!
  к !суд!
else
  г О да, теперь-то я понимаю, что передо мной богатые люди.
  wait 1
  г Так заплатите же сто тысяч ровно.
end
~
#73221
превед стража~
0 r 100
~
wait 1
say А ну стой! Пошлину поди не уплатили еще?
say Ну вот и отлично. Давайте прямо и рассчитаемся.
wait 1 s
say Проезд нынче подешевел, всего сто тысяч кун за всех сразу.
say Хитрить и мудрить не рекомендую.
ухм
~
$~
