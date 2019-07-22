#28300
Общие: репоп~
2 f 100
~
eval rkvest no
global rkvest
eval blag no
global blag
calcuid rm 28339 room
attach 28303 %rm.id%
detach 28304 %rm.id%
wpurge
switch %random.4%
  case 1
    if (%world.gameobjs(28306)% < 5) 
      %load% obj 28306
    end
  break
  case 2
    if (%world.gameobjs(28308)% < 5) 
      %load% obj 28308
    end
  break
  case 3
    if (%world.gameobjs(28311)% < 5) 
      %load% obj 28311
    end
  break
  case 4
    if (%world.gameobjs(28313)% < 5) 
      %load% obj 28313
    end
  break
done     
~
#28301
Общие: игрок раздвигает кусты~
2 c 4
раздвинуть~
wait 1s
if (%arg% == кусты)
  wsend %actor% Вы осторожно раздвинули кусты и увидели спуск вниз.
  wechoaround %actor% Осторожно раздвинув кусты $n увидел$y спуск вниз.
  %door% 28325 down room 28391
  wait 8 s
  wecho Кусты с шелестом сошлись, скрывая проход вниз.
  %door% 28325 down purge 
  halt
else
  %send% %actor% Чего раздвигать собрались?
  halt
end
~
#28302
Общие: на выход игрока из кустов~
2 eg 100
~
if (%direction% == down)
  wecho Кусты раздвинулись, открывая проход вниз.
  wdoor 28325 down room 28391
  wait 8 s
  wecho Кусты с шелестом сошлись, скрывая проход вниз.
  wdoor 28325 down purge
else
  halt
end
~
#28303
Общие: ищем тайник...1~
2 c 4
искать~
wait 1
if (%arg% == тайник)
  wsend %actor% Вы начали простукивать стены, ища тайник.
  %echoaround% %actor% $n стал$y простукивать стены.
  wait 5s
  wsend %actor% Вы нашли небольшой тайник и достали из него немного золота.
  %echoaround% %actor% $n достал$y из тайника в стене немного монет. 
  set %actor.gold(+300)%
  calcuid rm 28339 room
  attach 28304 %rm.id%
  detach 28303 %rm.id%
  halt
else
  %send% %actor% Чего искать будем?
  halt
end
~
#28304
Общие: ищем тайник...2~
2 c 4
искать~
wait 1
if (%arg% == тайник)
  %send% %actor% Вы начали простукивать стены, ища тайник.
  %echoaround% %actor% $n стал$y простукивать стены.
  wait 5s
  %send% %actor% Вы нашли небольшой тайник, к сожелению он пуст.
  halt
else
  %send% %actor% Чего искать будем?
  halt
end
~
#28305
Общие: вход к волколаку~
0 q 100
~
%echo% Волколак поднялся, оставив полуобглоданный скелет.
%echo% Зря вы его оторвали от трапезы.
~
#28306
Разбойники: триггер на хмуром мужичке (вход в комнату)~
0 q 100
~
wait 1s
if (%direction% == З)
  if (%actor.class% == 2 || %actor.class% == 4)
    %send% %actor% %self.name% внимательно осмотрел Вас.
    say Здорово, %actor.name%. Деньжат не хочешь заработать?
    halt
  else
    %echoaround% %actor% При виде $r $N презрительно скривил$U.
    %send% %actor% При виде Вас $N презрительно скривил$U.
    say Проваливал бы ты, пока голова цела.
    wait 10s
    say Ну, я тебе предупреждал!
    mkill %actor.name%
    halt
  end
else
  halt
end
~
#28307
Разбойники: триггер на хмуром мужичке (пропускает на восток)~
0 d 1
хочу~
if (%actor.class% == 2 || %actor.class% == 4)
  say Ну %actor.name% пойди поговори с нашем главарем.
  wait 2
  %send% %actor% Хмурый мужичок пропустил Вас на восток.
  %echoaround% %actor% $N пропустил $v на восток.
  %teleport% %actor.name%  28375
  wat 28375 %echoaround% %actor% $n приш$i с запада.
  halt
else
  say Ну раз хочешь то получишь!
  mkill %actor.name%
  halt
end
~
#28308
Разбойники: триггер для агро на всех кроме татей и наемников~
0 q 100
~
if (%actor.class% == 2 || %actor.class% == 4)
  halt
else
  встат
  say Ах ты сучье отродье! Получай!
  mkill %actor.name%
end
~
#28309
Разбойники: заход к главарю (лето).~
0 q 100
~
wait 2
if (%actor.class% == 2 || %actor.class% == 4) 
  msend %actor%  %self.name% поднялся Вам навстречу
  wait 2
  say Здорово  %actor.name%!
  msend %actor% %self.name% хлопнул Вас по плечу
  wait 2
  say У нас тут появились проблемы с властями, и я бы заплатил тебе за помощь в их решении
  say Возьмешься нам помочь?
  wait 2
  msend %actor% %self.name% вопросительно уставился на вас.
  calcuid glav 28312 mob
  attach 28310 %glav.id%
  halt
else
  встать
  mkill %actor.name%
end
~
#28310
Разбойники: главарь дает задание (лето).~
0 d 1
помогу возьмусь~
wait 2
say Прекрасно! Слушай, что тебе надо будет сделать
say За дорогой обосновался отряд, посланный князям изловить нас.
say Поймать они нас конечно не поймают, но вот обирать купцов очень мешают.
say Если бы ты подбросил им отравы в колодец, они б отсюда быстро свалили.
say Вобщем, держи белены иди подкинь им.
%load% obj 28319
дат отрава %actor.name%
set %rkvester% %acto.name%
global rkvester
eval rkvest no
global rkvest no
calcuid glav 28312 mob
attach 28312 %glav.id%
detach 28309 %glav.id%
detach 28310 %glav.id%
~
#28311
Разбойники: травим колодец.~
2 c 1
отравить~
if %actor.name% != %rkvester%
  return 0
  halt
end
if %arg% != колодец
  wsend %actor% Чего травить будем?
  halt
end
eval svertok %actor.eq(17)%
if %svertok.name% != сверток
  wsend %actor% И чем травить собрались?
  halt
end
wsend %actor% Вы незаметно бросили сверток в колодец.
wpurge %svertok%
wsend %actor% Теперь пора и за платой....
eval rkvest_yes
global rkvest_yes
~
#28312
Разбойники: доложение о выполнении (лето).~
0 q 100
~
if (%actor.name%==%rkvester%)
  if (%rkvest%==yes)
    say Видал уже, собрались голубчики и свалили отседа!
    say Ну типа спасибо, а за хлопоты я уж не обижу.
    say Держи.
    say И если понадобится скрыться от властей заходи.
    say Укроем, конечно не за так, но много не возьмем, да и работенку подкинем.
    set %actor.gold(+300)%
    eval blag %actor%
    global blag
    calcuid glav 28312 mob
    attach 28313 %glav.id%
    run 28313 %glav.id%
    dettach 28312 %glav.id%
  else
    say И чего ты приперся?
    say Пока с властями не разберешься о награде даже и не заикайся!
  end
else
  if (%actor.class% == 2 || %actor.class% == 4)
    halt
  else
    встат
    say Ах ты сучий сын! Получай!
    mkill %actor.name%
  end
end
~
#28313
Разбойники: благодарность главаря (дополнительно).~
0 z 100
~
*здесь можно вставить отдельную благодарность кроме монет...
*в переменной blag содержиться actor выполневшего квест 
%echoaround% %blag% Главарь хлопнул по спине %blag.rname%
wait 5
if ( %world.curobjs(592)% < 1 )
  if ( %random.100% > 66 )
    mload obj 592
    give книга %blag.name%
    say Завалялась у меня тут вот эта вещь - мне ни к чему, а тебе может и сгодится!
  else
    eval buffer %self.gold(+500)%
    give 500 кун %blag.name%
  end
end
calcuid glav 28312 mob
detach 28312 %glav.id%
detach 28313 %glav.id%
calcuid glav 28324 mob
detach 28319 %glav.id%
detach 28313 %glav.id%
~
#28314
Разбойники: заход к главарю (зима)~
0 q 0
~
wait 2
if (%actor.class% == 2 || %actor.class% == 4) 
  msend %actor%  %self.name% поднялся Вам навстречу
  wait 2
  say Здорово  %actor.name%!
  msend %actor% %self.name% хлопнул Вас по плечу
  wait 2
  say У нас тут появились проблемы с купцами, и я бы заплатил тебе за помощь в их решении.
  say Возьмешься нам помочь?
  wait 2
  msend %actor% %self.name% вопросительно уставился на вас.
  calcuid glav 28324 mob
  attach 28315 %glav.id%
  halt
else
  встать
  mkill %actor.name%
end
~
#28315
Разбойники: главарь дает задание (зима)~
0 d 1
помогу возьмусь~
wait 2
say Тут недалеко купеческий обоз обосновался. 
say Совсем они страх потеряли, дань за проезд не оставили...
say Наказать то мы их запросто накажем, да только шум подымать неохото и так князь за нас уже взялся.
say Последнее предупреждение послать им надо, да только мне своих людей светить щас не резон.
say Ты сходи напомни им про дань, коли снимешь плату поделимся с тобой, да и своим примем.
say Ну а коли не снимешm, то уж необессудь, делиться нечем будет.
set %rkvester% %acto.name%
global rkvester
calcuid glav 28324 mob
attach 28319 %glav.id%
detach 28314 %glav.id%
detach 28315 %glav.id%
~
#28316
Разбойники: сказали главарю обоза дань~
0 d 1
дань плата~
if (%actor.name%==%rkvester%)
  say И с чего это мы каждому встречному платить то?
  calcuid kupa 28323 mob
  attach 28317 %kupa.id%
  wait 5
  say Ась?
  wait 5
  say А ну свалил отсюда чтоб глаза мои тебя не видели!
  wait 2s
  say Больно нахальные вы стали! Учить вас как-то надо...
  dettach 28317 %kupa%
  mkill %actor.name%
end
~
#28317
Разбойники: дали купе голову~
0 j 100
~
if (%actor.name%==%rkvester%)
  if (%object.vnum% == 28315)
    calcuid kupa 28323 mob
    dettach 28316 %kupa.id%
    say О боже это же Максимка!
    say Что же ты с ним сделал изувер проклятый!
    wait 5
    say На подавитесь своей данью проклятые!
    %load% obj 28318
    дать дань %actor.name%
    %echo% Купец сел и расплакался.
    dettach 28317 %kupa.id%
  end
end
~
#28318
Разбойники: смерть купца~
0 f 100
~
%load% obj 28315
~
#28319
Разбойники: благодарность главаря (зима)~
0 j 100
~
if (%actor.name%==%rkvester%)
  if (%object.vnum% == 28318)
    say Неплохо поработал, не ошибся я в тебе!
    say Держи.
    say И если понадобится скрыться от властей заходи.
    say Укроем, конечно не за так, но много не возьмем, да и работенку подкинем.
    set %actor.gold(+300)%
    eval blag %actor%
    global blag
    calcuid glav 28324 mob
    attach 28313 %glav.id%
    run 28313 %glav.id%
    dettach 28319 %glav.id%
  else
    %purge%
    say Ты чего это мне пихаешь?
    say Это что дань чтоли?
    say Коли не справился с заданием так и говори, а надуть меня даже не пытайся!
  end
end
~
#28320
Дружинники: триггер на стражнике (вход в комнату)~
0 q 100
~
wait 1s
if (%direction% == east)
  if (%actor.class% == 5 || %actor.class% == 6)
    say Приветствую тебя, %actor.name% !
    say Можешь пройти к нашему уряднику. У него вроде есть работенка для тебя.
    halt
  else
    %echoaround% %actor% При виде %actor.rname% %self.name% презрительно скривился.
    %send% %actor% %self.name% внимательно осмотрел Вас и презрительно скривил%self.u%.
    say Проваливай, нечего тебе здесь делать!
    halt
  end
else
  halt
end
~
#28321
Дружинники: триггер на стражнике (пропускает на запад)~
0 c 1
пройти~
wait 1s
if (%actor.class% == 5 || %actor.class% == 6)
  %send% %actor% Стражник пропустил Вас на запад.
  %echoaround% %actor% Стражник пропустил %actor.rname% на запад.
  %teleport% %actor.name%  28343
  wat 28343 %echoaround% %actor% $n приш$i с востока.
  halt
else
  say И куда это ты %actor.name% собрался? Руки в ноги и вали отседа, пока я тебе не врезал.
  wait 5s
  say Ты еще здесь? Ну сам нарвался!
  mkill %actor.name%
  halt
end
~
#28322
Дружинники: триггер для агро на всех кроме дружинников и витязей~
0 q 100
~
if (%actor.class% == 5 || %actor.class% == 6)
  halt
else
  вст
  say Попал%actor.u% бандюга!
  mkill %actor.name%
end
~
#28323
Дружинники: заход к уряднику~
0 q 100
~
wait 2
if (%actor.class% == 5 || %actor.class% == 6)
  %send% %actor%  %self.name% поднялся вам навстречу
  say Приветствую тебя,  %actor.name%!
  say Хорошо что зашел ко мне, у меня есть предоложение для тебя.
  say Мой отряд послали сюда уничтожить шайку разбойников, но мы никак не можем их поймать.
  say Их главарь хитер как лис,  он все время уводит шайку из западни.
  say Если бы ты смог убить его и принести мне его голову, я бы тебя вознаградил.
  say Ну, что скажешь? 
  calcuid kapi 28318 mob
  attach 28324 %kapi.id%
else
  встать
  mkill %actor.name%
end
~
#28324
Дружинники: урядник дает задание~
0 d 1
помогу ~
wait 2
say Прекрасно! Жду тебя с головой главаря.     
set %dkvester% %acto.name%
global dkvester
calcuid kapi 28318 mob
attach 28322 %kapi.id%
attach 28325 %kapi.id%
detach 28323 %kapi.id%
detach 28324 %kapi.id%
~
#28325
Дружинники: дали голову уряджнику~
0 j 100
~
if (%actor.name%==%dkvester%)
  wait 2
  if (%object.vnum% == 28314)
    say Это же голова главаря!
    say Чтож, без него мы быстро переловим всю  шайку.
    say Прекрасная работа! Держи свою награду.
    set %actor.gold(+300)%
    eval blag %actor%
    global blag
    calcuid kapi 28318 mob
    attach 28326 %kapi.id%
    run 28326 %kapi.id%
  else
    say Ну и зачем мне это?
    брос %object.name%
  end
end
~
#28326
Дружинники: благодарность урядника~
0 z 100
~
*здесь можно вставить отдельную благодарность кроме монет...
*в переменной blag содержиться actor выполневшего квест 
%echoaround% %actor% Урядник пожал руку %blag.dname%
wait 5
calcuid kapi 28318 mob
detach 28325 %kapi.id%
detach 28326 %kapi.id%
~
#28327
Дружинники: смерть главаря~
0 f 100
~
%load%  obj 28314
~
$~
