#25500
кто-то упал в яму~
2 e 95
~
wait 1
%echo% Наверху послышался резкий хруст и шорох разматывающейся веревки...
wait 2
foreach victim %self.pc%
  if (%random.100% < 26)
    eval dmg %victim.hitp%-1
    %send% %victim%  Огромное бревно обрушилось сверху, попереломав Вам половину костей!
    %echoaround% %victim%  Огромное бревно обрушилось сверху, попереломав %victim.dname% половину костей!
    %send% %victim%  Как это грустно все...
    %damage% %victim% %dmg%
    %victim.wait(30)%
    wsend %victim% Вы мертвы!  Hам очень жаль...
    wsend Вы потеряли 6666666 очков опыта.
    wsend %victim% _
    wsend %victim% 0) Отсоединиться.
    wsend %victim% 1) Начать игру.
    wsend %victim% 2) Ввести описание Вашего персонажа.
    wsend %victim% 3) Узнать историю.
    wsend %victim% 4) Изменить пароль.
    wsend %victim% 5) Удалить персонаж.
    *%victim.wait(30)%
  end
done
wait 30s
wecho Вы пришли в себя...
~
#25501
у волка~
0 g 25
~
wait 1
облиз %actor.name%
if %random.7% == 3
  kill %actor.name%
end
~
#25502
попытались открыть ларь~
1 p 100
~
if %exist.mob(25502)%
  calcuid smith1 25502 mob 
end
if %exist.mob(25504)%
  calcuid smith2 25504 mob 
end
if %smith1%
  if %smith1.realroom% == 25531
    exec 25508 %smith1.id%
    return 0
    halt
  end
end
if %smith2%
  if %smith2.realroom% == 25531
    exec 25508 %smith2.id%
    return 0
    halt
  end
end
return 1
~
#25503
вошли к кузнецу~
0 q 100
~
wait 3s
mecho _Кузнец осмотрел поковку, сплюнул с досадой, и кинул ее в угол.
wait 1s
emot открыл дубовый ларь и принялся шариться в нем в поисках подходящей заготовки
wait 1
буб
say Ну вот... А чтоб им ни дна, ни покрышки!
say И куда вся руда с болота подевалась, узнать позвольте?!
wait 1s
say Опять, наверное, волхв этот что-нибудь отмочил там...
say Надо сходить да поговорить с ним что ли...
wait 1
вздох
attach 25504 %self.id%
~
#25504
выдача квеста у кузнеца~
0 d 1
"я схожу" "я разберусь"~
if (%actor.vnum% != -1)
  halt
end
wait 3
вопр %actor.name%
дум
wait 1s
if (%actor.sex% ==  1)
  say Ты бы, парень, не шумел понапрасну
else
  say Ты бы, девка, не шумела понапрасну
end
say Волхв этот, пень старый - из ума, верно, выжил давно...
wait 1s
say А впрочем, дело твое, коли желаешь - болото на севере, как реку перейдешь, да с холма спустишься.
say Коли с волхвом переговоришь да помочь сумеешь - награжу чем смогу
makeuid questor255 %actor.id%
global questor255
detach 25503 %self.id%
calcuid druid1 25503 mob
attach 25505 %druid1.id%
detach 25504 %self.id%
~
#25505
вошли к волхву велеса~
0 g 100
~
wait 1s
emot зыркнул на Вас и произнес : '... и воспламенится гнев Господа, и Он скоро истребит тебя.'.
mecho \&RВелесов волхв опалил Вас своим гневным взглядом.\&n
mecho _Это действительно БОЛЬНО !
foreach victim %self.pc%
  eval dmg %victim.hitp%/2
  mdamage %victim% %dmg%
done
wait 1
плюн
say Тьфу ты, пропасть... Ты еще кто таков%actor.g% будешь?!
say Откуда пожаловал%actor.g%?
attach 25506 %self.id%
detach 25505 %self.id%
~
#25506
сказал фразу у волхва~
0 d 1
"от кузнеца" "кузнец прислал" ~
if (%actor.vnum%!= -1)
  halt
end
wait 1
say От какого кузнеца еще?
wait 1
say А этот.. который у брода живет...
хих
wait 3
say Это ты ему скажи - пущай Перуну молится
say А лучше - вон, с волхвом перуновым поговори
say Из молодых, да ранний
wait 2s
say Родник тут есть на склоне - из-под дуба бьет
say От воды из того родника и руда особая в этом болоте родится
wait 1
say И травка растет - ну совершенно особая
emot мечтательно закатил глаза
wait 2s
say А нынче этот недоучка взбеленился с чего-то, да затворил родник!
emot сердито погрозил кому-то кулаком
wait 1s
say Так что иди подобру-поздорову... 
say Я тебе ничем помочь не могу
calcuid druid2 25505 mob
attach 25507 %druid2.id%
detach 25506 %self.id%
~
#25507
вошли к волхву Перуна~
0 q 100
~
wait 2
emot внимательно посмотрел на Вас
вздох
wait 1s
say Опять этот старик шумит?
say Ну что там опять не по нему?
вопрос %actor.name%
wait 2s
say Родник?? Я воду отнял?
wait 1
say Да ты сам подумай - все родники из-под земли бьют - кто ж им хозяин кроме Велеса?!
wait 3
say Сам%actor.g% сходи да глянь - там он, чуть выше по склону
say Сам и запер родник, пень старый, а на меня напраслину возводит!
wait 1s
say А вода из того родника и впрямь целебная - омывает она корни этого дуба
say Оттого и продлил он свои годы далеко за предел деревьям отпущенный
wait 1
say Теперь вот засохнет, боюсь
вздох
eval questor255 %actor.id%
global questor255
calcuid stone 25501 obj
attach 25509 %stone.id%
detach 25507 %self.id%
~
#25508
кузнец ругается~
0 z 0
~
switch %random.3%
  case 1
    wait 1
    emot грозно нахмурился
    say Ты куда это лезешь, а?!
  break
  case 2
    wait 1
    хмур 
    руг
    say Убери-ка лапы! Ходят тут всякие...
  break
  default
    say А ну-ка вон отсель!
    set target %random.pc%
    %send% %target% _Кузнец Верхослав выставил Вас за порог при помощи хорошего пинка.
    %teleport% %target% 25510
    emot выставил %target.vname% за порог при помощи хорошего пинка
    %echoaround% %target% _%target.name% с воплем вылетел%actor.g% из дверей кузницы и растянул%actor.u% на земле.
    %damage% %target% %random.50%
  done
~
#25509
двигать камень~
1 c 4
отодвинуть~
if (!%arg.contains(камень)% && !%arg.contains(валун)%)
  %send% %actor% _Чего двигаем-то?
  halt
end
if %actor.vnum% != -1
  halt
end
wait 1
%send% %actor% _Вы поднатужились, пытаясь сдвинуть валун.
%echoaround% %actor% _%actor.name% поднатужил%actor.u%, пытаясь сдвинуть валун.
%echo% _Вдруг послышался треск и из кустов на поляну вывалился ЛЕШИЙ !!!
%load% mob 25510
makeuid questor255 %actor.id%
global questor255
calcuid leshiy 25510 mob
remote questor255 %leshiy.id%
exec 25510 %leshiy.id%
detach 25509 %self.id%
~
#25510
при появлении лешего~
0 z 0
~
wait 1s
руг
say Ты чего это тут творишь-та?!
say Кто позволил камни ворочать?
wait 1
вопр %questor255.name%
wait 2s
дум
say Говоришь, ручей пересох.. ну да, кончено.. что ж ему не пересохнуть...
say Дуб засохнуть может?
wait 1
emot задумчиво поскреб в бороде, вытащил из нее средних размеров жука и выкинул в куст
wait 1s
say Ладно, расскажу я тебе в чем дело!
say Завелся у меня в лесу змей.
say Не сам завелся, конечно - я позволил.
say Змей зверь редкий, да и польза от него может быть немалая.
wait 2
say Да только этот змей уж и зловредный оказался!
say Решил меня с моего же лесу выжить! Да еще и пособников нашел - волков из тех, что помоложе.
say Засел в дыре, что под этим холмом, оттуда волков своих на зверье науськивает, воду баламутит.
wait 2
say Ну а вода в этом источнике святая - змею ее хужее нет на свете.
say Вот и отвел я ручей к нему в нору.
wait 1s
say Коли хочешь воду назад вернуть - найди управу на змея.
say Да убивать не вздумай - он мне пригодится еще!
wait 1
say Иди давай, а я тут подожду.
жда
~
#25511
змей ранен~
0 l 30
~
wait 1
emot почуял, что дело плохо и испуганно завизжал
say Ой, не бейте меня, пощадите меня...
say Что хотите сделайте, хоть на цепь посадите, только не убивайте!
просить
calcuid smith255 25502 mob
attach 25512 %smith255.id%
%load% mob 25507
%purge% %self%
~
#25512
зашли к кузнецу после боя со змеем~
0 q 100
~
if %actor.id% != %questor255.id%
  halt
end
wait 3
say Опять ты?
say Ну и чего тебе на этот раз надобно?
attach 25514 %self.id%
detach 25512 %self.id%
~
#25513
приковываем змея~
0 c 1
приковать сковать заковать~
calcuid snake 25507 mob
if !%snake% || !%arg.contains(змея)%
  msend %actor% Кого вы хотите сковать?
  return 1
  halt
end
if !%exist.obj(25509)%
  msend %actor% А чем вы хотите его сковать?
  halt
end
calcuid chain 25509 obj
if %actor.eq(16)% != %chain%
  msend %actor% А чем вы хотите его сковать?
  return 1
  halt
end
wait 1
emot покорно подставил шею под цепь.
плак
mload mob 25508
mpurge %chain%
calcuid leshiy 25510 mob
attach 25515 %leshiy.id%
wait 1
mpurge %self%
~
#25514
выдаем цепочку у кузнеца~
0 d 1
цепь цепочку~
wait 1s
say Что? Цепь? Да еще задарма, небось?
say Ну ладно - поверю тебе, но коли обманешь - под землей найду!
wait 1
%load% obj 25508
отпер дверь юг
отк дверь юг
s
masound _Из двери кладовки послышался лязг и грохот.
emot начал с грохотом копаться в своих запасах
wait 10s
n
закр дверь юг
запер дверь юг
mjunk ключ
%load% obj 25509
wait 1s
give цепь %actor.name%
say Вот тебе твоя цепь, держи.
ворч
detach 25514 %self.id%
~
#25515
вошли к лешему по выполнении квеста~
0 q 100
~
if %actor.id% != %questor255.id%
  halt
end
wait 2
if (!%exist.mob(25506)% && !%exist.mob(25507)% && !%exist.mob(25508)%)
  say Я тебе что сказал - змея не убивать!
  say А ты?
  say Эххххх
  досада
  wait 1
  %echo% _Леший повернулся и исчез в зарослях.
  %purge% %self%
  halt
end
рад
say Эх, молодец - совладал%actor.g%-таки со змеем!
say Ну, можно теперь и камень убрать...
wait 2
emot гикнул, свистнул, и топнул ногой.
%echo% Белый валун покрылся зеленью и распался в прах.
%purge% белый.валун
calcuid magus 25505 mob
purge %magus%
calcuid magus 25503 mob
attach 25516 %magus.id%
calcuid smith 25502 mob
attach 25517 %smith.id%
%load% obj 25500
wait 1s
if (%random.100% < 6)
  say Да, вот завалялась тут у меня эта штуковина - возьми, может тебе пригодится.
  %load% obj 243
  give рун %actor.name%
end
пока
%echo% _Леший повернулся и исчез в зарослях.
%purge% %self%
~
#25516
smoke ))~
0 q 80
~
wait 2s
кури
wait 2
умнич
~
#25517
награда за квест у кузнеца~
0 q 100
~
if %actor.id% != %questor255.id%
  halt
end
wait 8s
emot наконец-то заметил Вас
say А, это ты! Справил%actor.u%, значит, уломал%actor.g%-таки волхва?
say Ну здорово...
if ((%actor.class% == 11) && (%actor.skill(укрепить)% < 100))
  wait 1s
  say Ты, как видно, тоже к делу кузнечному способный... ну что же, глянь-ка сюда.
  emot снял со стены великолепной работы кольчугу и принялся объяснять особенности проковки стали
  %skilladd% %actor.name% укрепить %random.3%
  wait 2
  %send% %actor% _Вы узнали нечто новое...
  wait 2
  say Ну вот, кое-чему ты научил%actor.u%, а дальше сам%actor.g% думай.
  улыб
  detach 25517 %self.id%
  halt
end
switch %random.3%
  case 3
    if ((%world.curobjs(25515)% < 5) && (%randorm.100% <12))
      say Ну что ж, возьми вот за службу. 
      %load% obj 25515
      give обручье %actor.name%
    end
  break
  case 2
    if ((%world.curobjs(25516)% < 5) && (%randorm.100% <12))
      say Ну что ж, возьми вот за службу. 
      %load% obj 25516
      give перстень %actor.name%
    end
  break
  default
    say Ну что ж, возьми вот за службу. 
    %send% %actor% _Кузнец Верхослав дал Вам небольшой кошелек с монетами.
    %echoaround% %actor% _Кузнец Верхослав дал %actor.dname% небольшой кошелек с монетами.
    %actor.gold(+3000)% 
  done
  if %random.400% == 345
    wait 1s
    дум
    say Вот что, дай-ка мне меч какой, али топор или копье - перекую я его.
    say Лучше не сыщешь тогда.
    attach 25518 %self.id%
  end
  detach 25517 %self.id%
~
#25518
кузнец апает оружие~
0 j 100
~
wait 1
if (%obj.type% != 5)
  say Что-то ты мне не то дал%actor.g%!
  eval getobject %object.name%
  give %getobject.car%.%getobject.cdr% %actor.name%
  halt
end
emot внимательно осмотрел %object.vname% и хмыкнул
wait 2s
emot принялся перековывать %object.vname%
wait 40s
dg_cast 'заколд оруж' %object.name%
emot
wait 1s
say Вот теперь это стоящая вещь!
eval getobject %object.name%
give %getobject.car%.%getobject.cdr% %actor.name%
say Ну, бывай, мне работать надо.
detach 25518 %self.id%
~
#25519
репоп зоны 255~
2 f 100
~
calcuid smith 25502 mob
rdelete questor255 %smith.id%
detach 25503 %smith.id%
detach 25504 %smith.id%
detach 25512 %smith.id%
detach 25514 %smith.id%
detach 25517 %smith.id%
attach 25503 %smith.id%
calcuid druid 25503 mob
detach 25516 %druid.id%
detach 25506 %druid.id%
detach 25505 %druid.id%
calcuid druid2 25505 mob
detach 25507 %druid2.id%
~
#25520
заяц зашел к игроку~
0 t 100
~
switch %random.4%
  case 1
    s
    w
    s
  break
  case 2
    n
    e
    n
  break
  case 3
    e
    n
    e
  break
  default
    w
    s
    s
  done
~
#25521
зайчик помер :о(~
0 f 40
~
if (%world.curobjs(25511)% < 5) 
  %load% obj 25511
  %send% %actor% _Вы умело содрали шкурку с заячьего трупика.
  %echoaround% %actor% %actor.iname% _ЖЕСТОКО содрал%actor.g% шкуру с бедного зайчишки... 
end
~
#25522
лезть в дупло~
2 c 1
лезть залезть забраться пролезть~
if !%arg.contains(дупло)%
  %send% %actor% _Не лезь, куда не просят!
  halt
end
%send% %actor% _Вы пригнулись, и полезли в темный лаз.
%echoaround% %actor% %actor.name% пригнул%actor.u%, и полез%actor.q% в темный лаз у корней ели.
%teleport% %actor% 25591
%echoaround% %actor% Кто-то пролез сюда.
~
#25523
лезть наружу~
2 c 1
лезть залезть забраться пролезть~
if !%arg.contains(наружу)%
  %send% %actor% _Не лезь, куда не просят!
  halt
end
%send% %actor% _Вы пригнулись, и полезли в тесный лаз.
%echoaround% %actor% %actor.name% пригнул%actor.u%, и полез%actor.q% наружу.
%teleport% %actor% 25586
%echoaround% %actor% Кто-то вылез из дупла.
~
#25524
на мостике~
2 e 100
~
wait 1
if %actor.affect(верхом или под седлом)%
  %send% %actor% _Ваш скакун оступился, и вы полетели прямо в глубокий овраг!
  %echoaround% %actor% _%actor.name% упал%actor.g% с коня в овраг!
  %send% %actor% _Вы больно ушиблись!
  %echoaround% %actor% _Кто-то с криком упал с мостика!
  wteleport %actor% 25592
  %send% %actor% _Вы больно ушиблись!
  %echoaround% %actor% _Кто-то с криком упал с мостика!
  wdamage %actor% 50
  halt
end
~
#25525
лезть мостик~
2 c 1
лезть карабкаться залезть взобраться~
if !%arg.contains()%
  %send% %actor% _Куда вы хотите залезть?
  halt
end
%send% %actor% _Вы вцепились в торчащие отовсюду корни и попытались вылезть из оврага...
if ( %random.100% < 50 )
  %send% %actor% ...но силенок Вам не хватило - вы упали обратно и ушиблись!
  %damage% %actor% %random.100%
  %echoaround% %actor% %actor.name% попытал%actor.u% вылезти наверх, но сорвал%actor.u% и упал%actor.g%!
else
  %send% %actor% _Вы взобрались наверх.
  %echoaround% %actor% _%actor.name% ухватил%actor.u% за торчащие отовсюду корни и взобрал%actor.u% наверх.
  %teleport% %actor% 25525
  %echoaround% %actor% _Кто-то вылез из оврага.
end
~
#25526
помер пущевик~
0 f 100
~
if %world.curobjs(3368)% < 1 && %random.10000% < 50
  mload obj 3368
end
~
$~
