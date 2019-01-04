#29600
у Карлика~
0 q 100
*~
wait 30
mecho Старый резчик по дереву горько вздохнул.
wait 1s
г Эх, где же мой сынок, мой любимый Дубинушка...
wait 30
mecho Он поднял на вас слезящиеся подслеповатые глаза.
wait 15
г Добрый чужестранец, может вы найдете моего деревянного сыночка? 
г Несколько дней назад он пошел в школу, и так и не вернулся...
attach 29601 %self.id%
attach 29602 %self.id%
detach 29600 %self.id%
~
#29601
у Карлика2~
0 q 100
*~
wait 30s
mecho Карлик горько вздохнул.
wait 1s
эм поднял на вас слезящиеся подслеповатые глаза
~
#29602
гнайду~
0 d 1
найду хорошо~
context 296
wait 20
set kven %actor.id% 
worlds kven
say Спасибо вам, добрый человек.
wait 30
msend %actor% Ваше сердце невыносимо резануло, когда вы увидели одинокую слезу,
msend %actor% тихо скатившуюся по щеке старика.
wait 5
msend %actor% Вы пообещали сами себе, что обязательно найдете этого негодного мальчишку
msend %actor% и приведете бедному Карлику.
*чтоб не спамило в сислог если моба нету
if %world.curmobs(29614)%
  calcuid tort 29614 mob
  attach 29604 %tort.id%
end
detach 29601 %self.id%
detach 29602 %self.id%
~
#29603
у черепахи~
0 q 100
*~
wait 30
mecho Черепаха вопросительно посмотрела на Вас.
wait 15
say Что-то потеряли, молодой человек?
~
#29604
гДубинушка~
0 d 1
Дубинушку~
wait 25
say Ах, и вы ищите этого несносного мальчишку.
г Он был дома у девочки с голубыми волосами, но потом за ними пришли сторожевые псы.
г и Дубинушка с друзьями еле успели от них убежать.
wait 15
г Они вряд ли могли далеко забраться.
wait 15
mecho Черепаха печально вздохнула.
mdoor 29637 down room 29638
mdoor 29637 down flags e 
detach 29603 %self.id%
detach 29604 %self.id%
~
#29605
Сизый Нос~
0 r 100
*~
wait 30
mecho Лежащий на полу человек при вашем приближении попытался подняться...
wait 20
mecho впрочем у него получилось сесть.
wait 20
mecho Красные глаза, большой сизый нос, и несколько бутылок рядом с ним прояснили ситуацию.
say Э-э-э... у-у-у-у-у... а-а-а-а...
wait 20
mecho Мда, в таком состоянии, многого от него не добьешься. Надо что-то с этим делать.
~
#29606
даем водку Носу~
0 j 100
*~
wait 10
if %object.type% = 17 
  if %object.val1% < 1 
    эм перевернул бутылку над открытым ртом и потряс в надежде
    wait 1s
    эм с досады плюнул прямо на пол
    halt
  end
  if ((%object.val2% == 1 ) || (%object.val2% == 2 ) || (%object.val2% == 3 ) || (%object.val2% == 5 ) || (%object.val2% == 7 ) || (%object.val2% == 8 ))
    wait 30
    mecho Сизый Нос с завидной скоростью сгреб у вас бутылку и прикончил ее за четыре секунды.
    wait 30
    mecho Мой лучший рекорд - семь секунд, - с завистью подумали Вы.
    wait 20
    say Ох, хорошо то как...
    wait 20
    mecho Внезапно Сизый Нос как будто что-то вспомнил.
    wait 20
    say Дочка, моя дочурка...
    эм зарыдал навзрыд
    wait 20
    mecho После долгих расспросов, Вам удалось узнать, что кто-то украл у него старый серебряный медальон с портретом его дочки.
    mecho Память о ней - единственное, что спасало медальон от обмена на пару хороших чарок браги.
    mecho А теперь он пропал.
    wait 20
    mecho Вы, как добрейшей души человек (не отнекивайтесь, вы действительно такой!), с радостью поможете найти пропажу.
    attach 29607 %self.id%
    detach 29605 %self.id%
    detach 29606 %self.id%
  else
    wait 1s
    эм недоуменно уставился на Вас
  end
end
~
#29607
даемМедальон~
0 j 100
*~
switch %object.vnum%
  case 29617
    wait 10
    mpurge %object%
    wait 30
    say Доченька моя, Вы нашли ее!
    эм заплакал от счастья
    wait 30
    г Но как же я могу Вас отблагодарить, у меня же ничего нет.
    wait 30
    mecho Внезапно Сизого Носа осветила улыбка.
    wait 10
    г Хотя, я могу кое-чему Вас научить, авось и пригодится.
    wait 10
    эм хитро подмигнул Вам
    wait 20
    г Ну-ка, наклонитесь поближе.
    wait 10
    msend %actor% Минут десять Сизый Нос шептал Вам секреты правильной выпивки.
    if %actor.skill(опохмелиться)% < 99
      mskilladd %actor.name% опохмелиться %random.3%
      msend %actor% Вы с нескрываемым уважением посмотрели на него.
      msend %actor% Эх, знать бы это раньше, Вы всегда оставались бы победителем в многочисленных попойках вашей молодости.
      mechoaround %actor% Минут десять Сизый Нос что-то тихо нашептывал.
    else
      msend %actor% Вы с недоумением посмотрели на старого пьяницу. Ничего нового он Вам не рассказал.
    end
  done
~
#29608
бросаемзолу~
1 h 100
*~
if (%actor.realroom% == 29627)
  if %exist.mob(29607)%
    wait 1s
    %send% %actor% От брошенной горсти золы, доктор кукольных наук начал чихать не переставая.
    %echoaround% %actor% %actor.name% бросил%actor.g% горсть золы в лицо Бородачу, от чего тот стал непрерывно чихать.
    calcuid karab 29607 mob
    attach 29657 %karab%
    exec 29657 %karab%
    %purge% %self%
  end
end
~
#29609
поледураков~
2 c 1
вырыть выкопать~
if %arg.contains(ям)%
  wait 20
  wsend %actor%  Вы вырыли ямку.
  wechoaround %actor% %actor.name% выкопал%actor.g% маленькую ямку.
  attach 29630 %self.id%
  detach 29609 %self.id%
end
~
#29610
уДуремара~
0 q 100
*~
wait 30
mecho Дуремар вежливо приподнял шляпу.
wait 30
say Здравствуйте, здравствуйте.
mecho какой неприятный скрипучий голос...
wait 20
say Какими судьбами к нам пожаловали?
say Позвольте представиться, - Дуремар. Лучший нетрадиционный врач, к вашим услугам.
wait 20
say На что-нибудь жалуетесь? Хотите похудеть, или, наоборот потолстеть?
say Мучают боли в желудке?
wait 20
say Я как раз знаю хорошее средство, и я бы с радостью Вам помог, но, видите ли, человек, которого я нанимал, он уме...
say э-э-э...нашел себе другую работу, и теперь не кому для меня собирать пиявок.
wait 20
эм грустно вздохнул
wait 20
say Так вот, принесите мне эдак тринадцать пиявок, и я приготовлю для вас мое зелье.
say Ну как, согласны?
attach 29611 %self.id%
attach 29612 %self.id% 
detach 29610 %self.id%
~
#29611
уДуремара2~
0 q 100
*~
wait 15
эм хитро подмигнул Вам
~
#29612
гСогласен~
0 d 1
согласен да хорошо~
wait 30
г Вот и хорошо. Пиявок вы сможете найти на болоте неподалеку. Хороших, жирных пиявок.
wait 10s
эм мечтательно вздохнул
attach 29613 %self.id%
detach 29612 %self.id%
~
#29613
сдаемпиявок~
0 j 100
*~
wait 1
if %object.vnum% != 29620
  say Зачем ты мне это притащил?
  drop %object.name%
  halt
else
  wait 1
  mpurge %object%
  eval counter %counter%+1
  global counter
end
if %counter% < 13
  wait 1
  eval rand %random.1000%
  if (%rand% < 333)
    г Вот еще одна. Хорошо!
  elseif (%rand% < 666)
    эм улыбнулся и нежно переложил пиявку в баночку
  else
    г хорошо, хорошо. Давай, еще немного осталось.
  end
  halt
end
eval rando %random.1000%
if (%rando% < 700)
  wait 30
  г Ох, мои любимые пиявочки!
  wait 20
  г Что? Я обещал вам мое снадобье? А, ну да, вот, держите.
  г Мое самое лучшее зелье, заставит вашу кровь заново бурлить по вашим жилам.
  wait 15
  эм мерзко захихикал
  mload obj 29619
  дать все %actor.name%
  detach 29611 %self.id%
  detach 29613 %self.id%
else 
  г Что? Я обещал вам мое снадобье?
  г Ничего подобного, вам наверное послышалось. Оно мне самому пригодится.
  wait 15
  эм мерзко захихикал
  detach 29611 %self.id%
  detach 29613 %self.id%
end
~
#29614
присосаласьпиявка~
2 b 50
*~
wait 20
set loh %self.pc%
if %loh%
  wsend %loh%  Вы почувствовали, как мелкая пиявка стала высасывать у вас кровь.
  wait 2s
  wecho Вдоволь напившись, пиявка отвалилась.
  wdamage %loh% 66
  wload obj 29620
end
~
#29615
петро в норе~
0 z 100
*~
wait 10s
г Я сало полюбил аж с детских лет,
г За жизнь свою я съел его не мало.
г Вкуснее сала в мире пищи нет,
г Вкуснее сала только сало с салом! 
wait 10s
г О сало, сало - любовь моя!
г За все мои мученья и расплаты.
г Ты солнца свет, ты трели соловья
г Другой еды вовеки мне не надо.
detach 29615 %self.id%
~
#29616
петро и лиса~
0 z 100
*~
wait 20
г Лису Патрикеевну жалко -
г Плачет по ней палка.
г Кот Василий нищий -
г Вор, гнусный котище.
г Дуремар, наш дурачок, -
г Безобразнейший сморчок.
г А Петро ваш не дурак!
г Сало съел - и очень рад!
detach 29616 %self.id%
~
#29617
петро за холстом~
0 z 100
*~
wait 20
г Пляшут тени на стене, -
г Ничего не страшно мне.
г Лестница пускай крута,
г Пусть опасна темнота, -
г Все равно подземный путь
г Приведет куда-нибудь...
г И надеюсь будет там, -
г Много сала вам и нам!
detach 29617 %self.id%
~
#29618
сторожевой пес~
0 b 100
*~
wait 1
eval rand %random.1000%
if (%rand% < 333)
  г Пррроходи!
elseif (%rand% < 666)
  г Держи пррраво! 
else
  г Не задерррживайся!.. 
end
~
#29619
Дубинушка~
0 rz 100
*~
context 296
if %actor.id% != %kven.id%
  эм сжал кулачки и кинул яростный взгляд в Вашу сторону
  halt
end
%kven.wait(3)%
wait 20
вст
wait 20
г Не подходите, я буду драться!
wait 20
г Ой, кто Вы? Вас послал папа Карлик?
wait 20
mecho Лицо Дубинушки озарила улыбка.
wait 20
г За нами гнались псы, посланные Бородачом.
г Он хочет вернуть Голубоглазку и Петро в свой театр, и забрать у меня золотой клю...
wait 20
эм задумался
wait 20
г Хотя раз Вас послал папа Карлик, то Вам можно верить.
wait 20
г У меня есть ключик, который сильно нужен Бородачу, говорят, он открывает потайную дверцу.
wait 20
г Отведите нас в каморку папы Карлика.
вст
след .%kven.name%
след .%lven.name%
if %exist.mob(29607)%
  calcuid kar 29607 mob
  detach 29660 %kar.id%
  attach 29661 %kar.id%
end
wait 10
if %exist.mob(29626)%
  calcuid dob 29626 mob
  attach 29653 %dob.id%
end
if %exist.mob(29649)%
  calcuid dob 29649 mob
  attach 29653 %dob.id%
end
if %exist.mob(29650)%
  calcuid dob 29650 mob
  attach 29653 %dob.id%
end
if %exist.mob(29651)%
  calcuid dob 29651 mob
  attach 29653 %dob.id%
end
wait 10
if %exist.mob(29603)%
  calcuid bul 29603 mob
  attach 29653 %bul.id%
end
if %exist.mob(29644)%
  calcuid bul1 29644 mob
  attach 29653 %bul1.id%
end
if %exist.mob(29645)%
  calcuid bul2 29645 mob
  attach 29653 %bul2.id%
end
if %exist.mob(29646)%
  calcuid bul3 29646 mob
  attach 29653 %bul3.id%
end
if %exist.mob(29647)%
  calcuid bul4 29647 mob
  attach 29653 %bul4.id%
end
if %exist.mob(29648)%
  calcuid bul5 29648 mob
  attach 29653 %bul5.id%
end
if %exist.mob(29618)%
  calcuid po 29618 mob
  attach 29620 %po.id%
  attach 29615 %po.id%
  exec 29620 %po.id%
  exec 29615 %po.id%
end
if %exist.mob(29619)%
  calcuid ma 29619 mob
  attach 29620 %ma.id%
  exec 29620 %ma.id%
end
if %exist.mob(29620)%
  calcuid an 29620 mob
  attach 29620 %an.id%
  exec 29620 %an.id%
end
calcuid uhol 29603 room
attach 29640 %uhol.id%
calcuid ali 29650 room
wait 10
attach 29634 %ali.id%
detach 29619 %self.id%
~
#29620
следуемзаквестором~
0 z 100
*~
context 296
вст
след .%kven.name%
detach 29620 %self.id%
~
#29621
Дубинушка у холста~
0 z 100
*~
wait 2s
г Потайная дверца где-то здесь...
эм вопросительно посмотрел по сторонам
calcuid hol 29603 room
attach 29622 %hol.id% 
detach 29621 %self.id%
~
#29622
обдираемхолст~
2 c 1
ободрать отодрать~
context 296
wait 3
context 2961
unset lven
%kven.wait(3)%
if %arg.contains(холст)%
  wait 20
  wsend %actor%  Вы с треском сорвали холст со стены. За ней обнаружилась маленькая дверца.
  wechoaround %actor% С треском сорванный холст скрывал за собой маленькую дверцу.
  if %exist.mob(29617)%
    calcuid bur 29617 mob
    attach 29623 %bur.id%
    exec 29623 %bur.id%
  end
  wdoor 29603 n room 29604
  wdoor 29603 n flags abcd 
  wdoor 29603 n key 29623
  calcuid holst 29621 obj
  attach 29656 %holst.id%
  if %exist.mob(29607)%
    calcuid bar 29607 mob
    detach 29658 %bar.id%
    detach 29659 %bar.id%
    detach 29660 %bar.id%
    detach 29661 %bar.id%
    attach 29655 %bar.id%
  end
  exec 29656 %holst.id%
  detach 29622 %self.id%
end
~
#29623
вотОНА!~
0 z 100
*~
wait 20
г Вот она!
wait 20
эм достал из кармана золотой ключик и отпер дверь
mload obj 29623
wait 20
отпер двер
откры двер
calcuid tru 29606 room
attach 29642 %tru.id%
detach 29623 %self.id%
~
#29624
охренел Дубинушка~
0 z 100
*~
wait 10
г Ухты!!!
след я
~
#29625
охренела Синеглазка~
0 z 100
*~
wait 10
эм восхищенно посмотрела по сторонам
след я
~
#29626
охренел Петро~
0 z 100
*~
wait 10
mecho У Петро от изумления отвалилась челюсть
след я
~
#29627
охренел Шарик~
0 z 100
*~
wait 10
эм радостно затявкал
след я
~
#29628
сверчок~
0 r 100
*~
context 296
if %actor.id% == %kven.id%
  wait 2s
  mecho Говорящий сверчок низко Вам поклонился.
  г Спасибо, что привели их в этот театр, здесь им будет хорошо.
  г Свою награду Вы можете найти в сундуке чуть дальше. 
  mload obj 29624
  дать ключ .%kven.name%
  detach 29628 %self.id%
end
~
#29629
РЕПОП~
2 f 100
*~
context 296
context 2961
unset kven
unset lven
wdoor 29637 down purge
wdoor 29603 n purge
calcuid zol 29654 room
detach 29609 %zol.id%
detach 29630 %zol.id%
detach 29631 %zol.id%
detach 29632 %zol.id%
detach 29633 %zol.id%
attach 29609 %zol.id%
~
#29630
поледураков2~
2 h 100
*~
if (%object.iname% == горсть золотых монет)
  wait 5 
  wecho Только монеты попали в яму, как сразу засыпались землей.
  calcuid mon 29616 obj
  attach 29631 %self.id%
  wpurge %mon%
  detach 29630 %self.id%
end
~
#29631
поледураков3~
2 c 1
сыпать посыпать~
if %arg.contains(соль)%
  wait 20
  wsend %actor% Вы аккуратно посыпали землю солью.
  wechoaround %actor% %actor.name% не спеша начал%actor.g%  разбрасываться солью. 
  wechoaround %actor% Тихо шифером шурша, крыша едет не спеша...
  attach 29632 %self.id%
  detach 29631 %self.id%
end          
~
#29632
поледураков4~
2 c 1
полить лить облить~
wait 1
wsend %actor% Вы зачерпнули пригоршню воды и осторожно полили закопанные монетки.
wechoaround %actor% %actor.name% зачерпнул%actor.g% пригоршню воды и осторожно полил%actor.g% закопанные монетки.
attach 29633 %self.id%
detach 29632 %self.id%
~
#29633
поледураков5~
2 d 1
крекс фекс пекс~
wait 1
eval rand %random.1000%
if (%rand% < 750)
  wsend %actor% Произнеся это, Вы с глупым выражением лица стали чего-то ждать.
  wechoaround %actor% Вы услышали как %actor.name% что-то неразборчиво пробормотал%actor.g%.
  wait 1s
  wecho Ничего не произошло.
  wait 2s
  wecho Что ж, этого и следовало ожидать.
else
  wecho Не успели Вы и глазом моргнуть, как перед вами с удивительной быстротой начало
  wecho расти дерево. В течение нескольких секунд из маленького росточка оно превратилось в
  wecho стройное высокое деревце, на котором вместо фруктов висели мешочки, до боли похожие на
  wecho ваш собственный кошелек.
  wait 20
  wecho Внезапно эти мешочки упали к вашим ногам, листья пожелтели, дерево ссохлось и рассыпалось в труху.
  wload obj 29618
  wload obj 29618
  wload obj 29618
end
detach 29633 %self.id%
~
#29634
лоад лисы и кота~
2 e 100
*~
context 296
if %actor.id% == %kven.id%
  wecho неожиданно из-за кустов выпрыгнула рыжая лиса и слепой кот, преградив Вам дорогу.
  if %exist.mob(29620)%
    calcuid art 29620 mob
    exec 29637 %art.id%
  end
  wload mob 29629 
  wload mob 29630
  detach 29634 %self.id%
end
~
#29635
лиса агрит~
0 n 100
*~
context 296
wait 10
уби дубинушка
уби петро
уби голубоглазка
уби шарик
уби .%kven.name%
~
#29636
кот агрит~
0 n 100
*~
context 296
wait 10
уби дубинушка
уби шарик
уби петро
уби голубоглазка
~
#29637
шарик агрит кота~
0 z 100
*~
wait 10
mecho Шарик злобно оскалился и кинулся в драку.
убить василий
~
#29638
умер Дубинушка~
0 f 100
*~
if %exist.mob(29629)%
  calcuid alis 29629 mob
  exec 29635 %alis.id%
end
if %exist.mob(29630)%
  calcuid baz 29630 mob
  exec 29636 %baz.id%
end
if %exist.obj(29621)%
  calcuid hol 29621 obj
  detach 29622 %hol.id%
end
~
#29639
умерла лиса~
0 f 100
*~
if %exist.mob(29618)%
  calcuid po 29618 mob
  attach 29616 %po.id%
  exec 29616 %po.id%
end
if (%world.curobjs(29616)% < 1)
  mload obj 29616
end
if (%world.curobjs(29612)% < 4) && (%random.1000% <= 200)
  mload obj 29612
end
~
#29640
заходимкхолсту~
2 g 100
*~
context 296
if (%actor.vnum% != 29617)
  halt
else
  %actor.wait(5)%
  if %exist.mob(29617)%
    calcuid bur 29617 mob
    attach 29621 %bur.id%
    exec 29621 %bur.id%
  end
  wait 1s
  if %exist.mob(29632)%
    %force% %world.mob(29632)% г Сыночек мой! Вы нашли его!
    %force% %world.mob(29632)% рад
    %force% %world.mob(29632)% след дубинуш
  end
  wait 5s
  if %exist.mob(29620)%
    calcuid art 29620 mob
    attach 29641 %art.id%
    exec 29641 %art.id%
  end
  detach 29640 %self.id%
end
end
~
#29641
Шарик отдирает холст~
0 z 100
*~
wait 10
эм тщательно обнюхав все стены остановился перед холстом
wait 6s
эм подошел поближе к холсту и разорвал его вклочья
ободрать холст
detach 29641 %self.id%
~
#29642
заходимвкомнату~
2 e 100
*~
context 296
if %actor.id% == %kven.id%
  wait 30
  if %exist.mob(29617)%
    calcuid bur 29617 mob
    attach 29624 %bur.id%
    exec 29624 %bur.id%
  end
  wait 30
  if %exist.mob(29619)%
    calcuid mal 29619 mob
    attach 29625 %mal.id%
    exec 29625 %mal.id%
  end
  wait 15
  if %exist.mob(29618)%
    calcuid po 29618 mob
    attach 29626 %po.id%
    exec 29626 %po.id%
  end
  wait 10
  if %exist.mob(29620)%
    calcuid an 29620 mob
    attach 29627 %an.id%
    exec 29627 %an.id%
  end
  detach 29642 %self.id%
end
~
#29643
личностьумерла~
0 f 100
*~
mload obj 29617
~
#29644
хозяинумер~
0 f 100
*~
if (%world.curobjs(29616)% < 1)
  eval rand %random.1000%
  if (%rand% < 503)
    mload obj 29616
  end
end
~
#29645
Бородач умер~
0 f 100
*~
if (%world.curobjs(29603)% < 4) && (%random.1000% <= 300)
  mload obj 29603
end
if (%world.curobjs(29606)% < 4) && (%random.1000% <= 300)
  mload obj 29606
end
~
#29646
Котсумер~
0 f 100
*~
if (%world.curobjs(29607)% < 4) && (%random.1000% <= 300)
  mload obj 29607
end
~
#29647
Дуремарумер~
0 f 100
*~
if (%world.curobjs(29605)% < 4) && (%random.1000% <= 300)
  mload obj 29605
end
~
#29648
Сторожевой пес сумер~
0 f 100
*~
if (%world.curobjs(29608)% < 4) && (%random.1000% <= 80)
  mload obj 29608
end
~
#29649
Рабумер~
0 f 100
*~
if (%world.curobjs(29609)% < 4) && (%random.1000% <= 300)
  mload obj 29609
end
~
#29650
Торгашумер~
0 f 100
*~
if (%world.curobjs(29610)% < 4) && (%random.1000% <= 200)
  mload obj 29610
end
~
#29651
Ищейка умерла~
0 f 100
*~
if (%world.curobjs(29611)% < 4) && (%random.1000% <= 100)
  mload obj 29611
end
~
#29652
открываемсундук~
1 p 100
~
if %actor.name% == Тест
  halt
else
  eval rand %random.1000%
  wait 1
  if ((%rand% < 333) && (%world.curobjs(29613)% < 4))
    osend %actor% Как только сундук открылся, из него вывалилась цветастая шляпа.
    oechoaround %actor% Как только сундук открылся, из него вывалилась цветастая шляпа.
    oload obj 29613
  elseif ((333 <= %rand%) && (%rand% < 666) && (%world.curobjs(29614)% < 4))
    osend %actor% Как только сундук открылся, из него вывалились изящные перчатки.
    oechoaround %actor% Как только сундук открылся, из него вывалились изящные перчатки.
    oload obj 29614
  elseif ((666 <= %rand%) && (%rand% < 999) && (%world.curobjs(29615)% < 4))
    osend %actor% Как только сундук открылся, из него вывалился темный костюм.
    oechoaround %actor% Как только сундук открылся, из него вывалился темный костюм.
    oload obj 29615
  else
    osend %actor% Как только сундук открылся, из него вывалилась горсть монет.
    oechoaround %actor% Как только сундук открылся, из него вывалилась горсть монет.
    oload obj 29625
    detach 29652 %self.id%
  end
end
~
#29653
Бульдогагрит~
0 r 100
*~
context 296
wait 10
убить Дубинушка
убить петро
убить голубоглазка
убить шарик
убить .%kven.name%
~
#29654
Крысаагрит~
0 r 100
*~
context 296
wait 10
убить Дубинушка
убить петро
убить голубоглазка
убить шарик
убить .%kven.name%
~
#29655
Бородач агрит~
0 r 100
*~
context 296
wait 10
г А вот и тот умник объявился, что моих кукол увел!
wait 5
г получай!
wait 1
вст
убить .%kven.name%
~
#29656
холстпурж~
1 z 100
*~
opurge %self%
~
#29657
Трансформ Бородача~
0 z 100
~
wait 1
mtransform 29633
~
#29658
беремквесту Бородача~
0 q 100
*~
wait 1s
г Ну и где мои кук... 
wait 30
эм осознав, что это всего лишь Вы, замолк на полуслове
wait 1s
г Эти прохиндеи даже каких-то неуклюжих кукол поймать не могут!
wait 1s
эм внезапно оценивающе посмотрел на Вас
wait 30
эм подпер буйну головушку кулаком и начал думать думу тяжкую
wait 30
г Эй, Вы.
wait 30
г Да-да, я к Вам обращаюсь.
wait 30
г Вы ведь хотите посмотреть потрясающий спектакль моего театра?
wait 15
эм взглянул на Вас, похоже его гложет какой-то вопрос
wait 30
г Так вот, у меня сбежало несколько тупоголовых кукол, которые должны участвовать в постановке. 
г Найдите их, и я Вас награжу.
wait 1s
эм многозначительно похлопал по толстому кошелю на поясе
wait 30
г Ну что, согласны?
attach 29659 %self.id%
detach 29658 %self.id%
~
#29659
гнайду~
0 d 1
да хорошо~
context 2961
wait 20
set lven %actor.id% 
worlds lven
г Ну вот и прекрасно.
say Да поторапливайтесь, я их целый день ждать не собираюсь. 
attach 29660 %self.id%
detach 29658 %self.id%
detach 29659 %self.id%
~
#29660
нетуБуратины~
0 r 100
*~
context 2961
if %actor.id% == %lven.id%
  wait 5s
  г Ну и?
  эм гневно посмотрел на Вас
end
~
#29661
естьБуратина~
0 r 100
*~
context 2961
if %actor.id% == %lven.id% && %exist.mob(29617)%
  %lven.wait(3)%
  wait 30
  г Ага, попались?! 
  рад
  context 296
  unset kven
  calcuid uhol 29603 room
  detach 29640 %uhol.id%
  wait 30
  if %exist.mob(29619)%
    calcuid mal 29619 mob
    attach 29662 %mal.id%
    exec 29662 %mal.id%
  end
  wait 1s
  г А ну заприте их в кладовке, скоро я с ними побеседую.
  wait 45
  if %exist.mob(29617)%
    calcuid bur 29617 mob
    attach 29664 %bur.id%
    exec 29664 %bur.id%
    %teleport% %bur% 29623
  end
  if %exist.mob(29618)%
    calcuid po 29618 mob
    attach 29664 %po.id%
    exec 29664 %po.id%
    %teleport% %po% 29623
  end
  if %exist.mob(29619)%
    calcuid ma 29619 mob
    attach 29664 %ma.id%
    exec 29664 %ma.id%
    %teleport% %ma% 29623
  end
  if %exist.mob(29620)%
    calcuid an 29620 mob
    attach 29664 %an.id%
    exec 29664 %an.id%
    %teleport% %an% 29623
  end
  mecho Откуда не возьмись, подбежало несколько псов, сноровисто забрали у Вас кукол и потащили их вон из комнаты.
  wait 45
  ул
  г А вот и Ваша награда.
  wait 30
  эм достал кошель из-за пояса
  %actor.gold(+1500)%
  %send% %actor% Бородач дал Вам 1500 кун.
  %echoaround% %actor% Бородач дал %actor.dname% 1500 кун.
  detach 29661 %self.id%
end
~
#29662
мальвинаплачет~
0 z 100
*~
эм тихо заплакала
detach 29662 %self.id%
~
#29663
бородач агрит~
0 r 100
*~
context 296
if %actor.id% == %kven.id%
  wait 30
  крич Я же сказал Вам принести моих кукол сюда! 
  г Ах Вы...
  убить .%kven.name%
  detach 29663 %self.id%
end
~
#29664
следя~
0 z 100
*~
след я
~
$~
