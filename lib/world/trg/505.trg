#50500
трактир~
0 r 100
~
wait 1
msend %actor% Здравствуй, %actor.name%!
msend %actor% Вижу я ты долго бродил по свету в поисках моей таверны.
msend %actor% Ну что же, ты нашел ее.
msend %actor% Между прочим, лучший способ узнать свежие новости угостить
msend %actor% всех по стаканчику горилки
мигн %actor%
msend %actor% Всего 50 кун, а ты сможеш расслабиться и послушать сплетни.
~
#50501
сплетни~
0 m 0
~
wait 1
if %amount% < 50
ик
msend %actor% Извините, но за эти деньги я могу только свечку поставить за Ваше здравие.
msend %actor% Раскошельтесь больше....
ми %actor%
halt
end
wait 1s
switch %random.5%
case 1
mecho Хозяин раздал всем присутствующим по кружке горилки.
mecho Вы несколько минут пытались вслушаться в невнятное бормотание пьяных мужиков в надежде уловить хоть один осмысленный звук.
mecho - ММММММ.. ЭЭЭ.. во.. слышал новость?
mecho - Неа... что такое?
mecho - Иванову сыну опять мерещиться всякая нечисть... говорит что ночью в трактире черти пьянствуют...
mecho - Хммм... не знаю.. я не помню что тут ночью происходит... горилка тут знатная...
mecho Как вы не силились больше ничего осмысленного вы не услышали.
break
case 2
mecho Хозяин раздал всем присутствующим по кружке горилки.
mecho Вы несколько минут пытались вслушаться в невнятное бормотание пьяных мужиков в надежде уловить хоть один осмысленный звук.
mecho - Эх... Иванов младший сын дюже любопытный... по вечерам стоит на корточках и вглядываеться в колодец...
mecho - Хмм.. уж не водку ли он там от отца прячет?
mecho - Не знаю... может быть и водку... но думаю как бы не упал он в колодец.. совсем мал ведь еще...
mecho Как вы не силились больше ничего осмысленного вы не услышали.
break
case 3
mecho Хозяин раздал всем присутствующим по кружке горилки.
mecho Вы несколько минут пытались вслушаться в невнятное бормотание пьяных мужиков в надежде уловить хоть один осмысленный звук.
mecho - Видел Иванову дочурку?
mecho - Неа... а что с ней?
mecho - Совсем уже невеста стала... скоро сваты наезжать из окрестных деревень будут...
mecho - А мне то чего? у меня вон своя баба аки три мешка с зерном...
mecho - Дык выдел я, как она по вечерам в лес ходит... как бы не заблудилась...
mecho Как вы не силились больше ничего осмысленного вы не услышали.
break
case 4
mecho Хозяин раздал всем присутствующим по кружке горилки.
mecho Вы несколько минут пытались вслушаться в невнятное бормотание пьяных мужиков в надежде уловить хоть один осмысленный звук.
mecho - Ой... Старый Иван совсем из ума выжил... говорит что с наступлением темноты нечисть бродит по деревне...
mecho - Да не слушай ты его... небось пьет сам дома свою водку поганую, вот и чудиться всякая гадость...
mecho - И не говори... что не говори водка в шинке - самая лучшая... так напиваешся что даже не помниш что ночью происходит...
mecho Как вы не силились больше ничего осмысленного вы не услышали.
break
case 5
mecho Хозяин раздал всем присутствующим по кружке горилки.
mecho Вы несколько минут пытались вслушаться в невнятное бормотание пьяных мужиков в надежде уловить хоть один осмысленный звук.
mecho - Слыш.. я вот вчера так здорово тяпнул, что всю ноч слышал прекрасное пение из лесу...
mecho - УУУ... так сильно я не напивался уже месяца 2.... и на что это пение было похоже?
mecho - И ты думаеш я помню?... помню только что сильно спать хотелось.. а потом пеие прекратилось и я проснулся...
mecho - И что было потом?
mecho - Как что.. утро было... и жена со скалкой была.. или била.. не помню точно.. очень здорово тяпнул...
mecho Как вы не силились больше ничего осмысленного вы не услышали.
break
default
break
done
wait 1s
~
#50502
телепортер беса~
0 r 100
~
wait 1
г  Так так...
г  Что то необычайно аппетитное потревожило мой покой...
г  К сожалению я уже поел сегодня...
г  Ну ничего... я вас отправлю туда, куда не ступала ни одна нога человека...
г  Если вы находчивы - вы выберетесь оттуда...
г  Если нет... 
wait 1s
mecho Бес задумался.
wait 1s
г   Что то я начал слишком распространяться.. пора и к делу приступать...
eval firstchar %self.people%
eval num 0
while %firstchar% && (%num% < 10)
    eval pc %firstchar.next_in_room%
    if %firstchar.vnum% == -1   		
        switch %random.8%
        case 1
        eval dest_room 50536
        break
        case 2
        eval dest_room 50537
        break
        case 3
        eval dest_room 50538
        break
        case 4
        eval dest_room 50539
        break
        case 5
        eval dest_room 50541
        break
        case 6
        eval dest_room 50542
        break
        case 7
        eval dest_room 50543
        break
        case 8
        eval dest_room 50544
        break
        default
        eval dest_room 50544
        done
        mechoaround %firstchar% %firstchar.name% пропал в клубах дыма.
        mteleport %firstchar% %dest_room%
        eval num %num%+1
        if %firstchar_realroom% == %dest_room%
            mat %dest_room% mechoaround %firstchar% %firstchar.name% появился в клубах дыма.
            msend %firstchar% Внезапно вы почувствовали что какая то сила подхватила Вас и унесла вдаль.
        end
    end
    if %pc%
        makeuid firstchar %pc.id%
    else
        set firstchar 0
    end
done 
~
#50503
началоквеста~
0 r 100
~
wait 1
mecho Крестьянин обвел комнату блуждающим взором.
mecho Крестьянин задумался.
wait 1s
г Слава богу... а я уж думал что в деревне из людей только моя семья осталась...
msend %actor.name% Крестьянин бросился обнимать Вас.
mechoaround %actor% Крестьянин бросился обнимать %actor.rname%.
wait 1s
г Позвольте позвольте.. вы ведь не местные? 
г Тогда вам наверное ничего не известно о том что здесь происходит...
г Началось все с того что шинкаря укусил волк в лесу, 
г когда тот ходил на охоту на зайца...
г Но волк был какой то странный.. черно-красная шерсть, 
г клыки длинною с палец...
г После этого шинкарь жаловался что ничего не помнит по ночам... 
г А вскоре и другие люди перестали помнить что с ними по ночам происходит...
mecho Крестьянин глубоко вздохнул.
wait 1s
г Я человек набожный и не пью... потому и сохранил еще облик человеческий...
г А остальный, те что побывали в шинке, с наступлением темноты превращаются 
г в нечисть...
г Слава Богу образ хранит меня и в мой дом они не заходят...
wait 3s
г Вот такие у нас дела, незнакомец,.. из людей остались только я, 
г мои два сына, да дочка... если бы ты был так добр и нашел их...
г Чует мое сердце что то с ними неладно...
msend %actor.name% Крестьянин посмотрел на Вас взглядом, полным мольбы.
mechoaround %actor% Крестьянин посмотрел на %actor.rname% взглядом, полным мольбы.
~
#50504
помощь~
0 d 1
найду помогу~
if (%actor.vnum% != -1)
    halt
end
context 505
    г Спасибо вам большое... как найдете детей - возвращайтесь.
    eval c505 4
    eval h505 %actor.name%
    calcuid load_room 50522 room
    attach 50506 %load_room.id%
    exec 50506 %load_room.id%
    detach 50506 %load_room.id%
    calcuid load_room 50551 room
    attach 50507 %load_room.id%
    exec 50507 %load_room.id%
    detach 50507 %load_room.id%
    calcuid load_room 50548 room
    attach 50508 %load_room.id%
    exec 50508 %load_room.id%
    detach 50508 %load_room.id%
    calcuid quest505 50511 mob
    remote h505  %quest505.id%
    remote c505  %quest505.id%
    calcuid quest505 50512 mob
    remote h505  %quest505.id%
    remote c505  %quest505.id%
    calcuid quest505 50513 mob
    remote h505  %quest505.id%
    remote c505  %quest505.id%
    global h505
    global c505
detach 50503 %self.id%
attach 50526 %self.id%
detach 50504 %self.id%
~
#50505
ресет зоны~
2 f 100
~
context 505
unset c505
unset h505
wdoor 50545 down purge
~
#50506
лоад старшего сына~
2 z 100
~
wload mob 50511
calcuid var 50511 mob
attach 50513 %var.id%
~
#50507
лоад младшего сына~
2 z 100
~
wload mob 50512
calcuid var 50512 mob
attach 50510 %var.id%
~
#50508
лоад дочки~
2 z 100
~
wload mob 50513
calcuid var 50513 mob
attach 50511 %var.id%
~
#50509
телепортер в колодце~
2 c 100
прыгнуть~
if (%actor.vnum% != -1)
   return 0
   halt
end
if !(%arg.contains(колодец)%)
   return 0
   halt
end
if (%world.curobjs(50501)% == 1)
    wsend %actor% Вы прыгнули в колодец.
    if %actor.sex%==1
    wechoaround %actor% %actor.name% прыгнул в колодец.
    else
    wechoaround %actor% %actor.name% прыгнула в колодец.
    end
    wteleport %actor% 50551
    if %actor.sex%==1
    wat 50551 wechoaround %actor% %actor.name% спрыгнул сверху.
    else
    wat 50551 wechoaround %actor% %actor.name% спрыгнула сверху.
    end
end
~
#50510
освобождения младшего~
0 c 1
освободить~
wait 1
context 505
if (%h505%==%actor.name%) && (%c505%>1)
* Say  сообщить Стрибогу: %h505% спас младшего
г Спасибо Вам огромное...
г Побегу я к отцу, пока он не начал беспокоиться...
mecho Паренек проворно полез из колодца.
eval c505 %c505% - 1
calcuid krest505 50510 mob
remote c505 %krest505.id%
    if %world.curmobs(50511)%==1
    calcuid quest505 50511 mob
    remote h505  %quest505.id%
    remote c505  %quest505.id%
    end
    if %world.curmobs(50513)%==1
    calcuid quest505 50513 mob
    remote h505  %quest505.id%
    remote c505  %quest505.id%
    end
mpurge %self.name%
end
~
#50511
освобождение дочки~
0 c 1
освободить~
wait 1
context 505
if (%h505%==%actor.name%) && (%c505%>1)
Say  сообщить Стрибогу: %h505% спас дочурку
г Спасибо Вам огромное...
г Побегу я к отцу, пока он не начал беспокоиться...
eval c505 %c505%-1
calcuid krest505 50510 mob
remote c505 %krest505.id%
    if %world.curmobs(50511)%==1
    calcuid quest505 50511 mob
    remote h505  %quest505.id%
    remote c505  %quest505.id%
    end
    if %world.curmobs(50512)%==1
    calcuid quest505 50512 mob
    remote h505  %quest505.id%
    remote c505  %quest505.id%
    end
mpurge %self.name%
end
~
#50512
убплесень~
0 f 100
~
if (%world.curmobs(50515)%==1) && (%world.curobjs(50510)%==0)
if %world.curmobs(50513)%==1
mload obj 50510
end
end
~
#50513
освобождение старшего~
0 c 1
разбудить будить~
wait 1
context 505
if (%h505%==%actor.name%) && (%c505%>1)
eval c505 %c505%-1
calcuid krest505 50510 mob
remote c505 %krest505.id%
    if %world.curmobs(50512)%==1
    calcuid quest505 50512 mob
    remote h505  %quest505.id%
    remote c505  %quest505.id%
    end
    if %world.curmobs(50513)%==1
    calcuid quest505 50513 mob
    remote h505  %quest505.id%
    remote c505  %quest505.id%
    end
просн
вст
г Ах вы гады ползучие...
г Опоить меня задумали... ну ничего... ща сбегаю за отцом и мы вам покажем...
mecho Крестьянин убежал.
if (%exist.mob(50516)%)
    mforce бес г Ты разбудил его... теперь мы будет развлекаться с тобой, %actor.name%!
    calcuid load_mob 50516 mob
    attach 50520 %load_mob.id%
    exec 50520 %load_mob.id%
end
mpurge %self.name%
end
~
#50514
телепортер печки~
2 c 1
лезть залезть~
if (%actor.vnum% != -1)
   return 0
   halt
end
if !(%arg.contains(печь)%)
   return 0
   halt
end
if ( %var_505_pech% != 1)
    halt
end
if (%world.curobjs(50503)% == 1)
    wsend %actor% Внезапно некая сила увлекла Вас в самую гущу огня.
    wteleport %actor% 50552
end
~
#50515
телепортир топи~
2 c 1
сесть~
if (%actor.vnum% != -1)
   return 0
   halt
end
if !(%arg.contains(пенек)%)
   return 0
   halt
end
wait 1
wsend %actor% Внезапно вы провалились сквозь землю!
wteleport %actor% 50552
wechoaround %actor% %actor.name% сел на пенек... и тут же провалился.
~
#50516
шинкарь~
0 c 1
угрожать пугать запугать ~
wait 3
if (%exist.mob(50516)%)
    г Я тебя не боюсь.
    halt
end
г Пожалуйста, умоляю, не надо убивать меня...
г Я знаю путь в преисподню...
г Я знаю ты хочешь попасть туда...
г Отнекиваться бесполезно... мне лучше известны желания смертных...
wait 3s
mecho С этими словами Шинкарь развернулся и пошел по направлению выходя из трактира.
mecho Вы невольно последовали за ним.
wait 3s
* set firstchar %self.people%
* while %firstchar%
* set pc %firstchar.next in room%
* if %firstchar.vnum% == -1
mteleport all 50545 horse
* end
* if %pc%
*  makeuid firstchar %pc.id%
* else
*  set firstchar 0
* end
* eval firstchar %firstchar.next in room%
* done
* unset firstchar
* unset pc
mteleport %self% 50545
wait 1
г Вот я вас и довел.. а теперь вам самое время умереть.
mdoor 50545 down flags a
mdoor 50545 down room 50550
mkill %actor.name%
attach 50523 %self.id%
~
#50517
огонь~
2 b 100
~
set firstchar %self.people%
while %firstchar%
    set pc %firstchar.next_in_room%
    if %firstchar.vnum% == -1
        wdamage %firstchar% 30
        wsend %firstchar% _По вашему телу нежно прошелся язык пламени. Не пора ли вылезти отсюда?
    end
    if %pc%
        makeuid firstchar %pc.id%
    else
        set firstchar 0
    end
done 
unset firstchar
unset pc
~
#50518
выход из котла~
2 c 4
вылезти~
wsend %actor% _Вы собрались с духом и выпрыгнули из котла.
wteleport %actor% 50550
~
#50519
укус упыря~
0 k 5
~
mechoaround %actor% Упырь вонзил свои острые зубы в шею %actor.rname%!
msend %actor% Упырь вонзил свои острые зубы вам в шею!
mdamage %actor% 150
dg_cast 'яд' %actor.name%
~
#50520
атака~
0 z 100
~
встать
атаковать %actor.name%
~
#50521
учение - свет~
0 d 1
да есть~
if (%actor.vnum% != -1)
    halt
end
if (%actor.class% == 10) || (%actor.class% == 5)
 if (%actor.level% > 24)
   if (%actor.class% == 5)
      mskillturn %actor.name% веерная.защита set
      г Я рад, что смог поделиться с кем-то своими знаниями.
      г Веерная защита полезное умение.
      mecho Крестьянин развернулся и ушел.
      mpurge %self.name%
   end
   if (%actor.class% == 10)
      mskillturn %actor.name% найти set
      г Я рад, что смог поделиться с кем-то своими знаниями.
      г Теперь ты быстро сможешь почувствовать, где находятся другие.
      mecho Крестьянин развернулся и ушел.
      mpurge %self.name%
   end
 else
 г Ты еще мал для такого умения.
 end
else
    г Извини, но я не считаю достойным учить тебя...
    mecho Крестьянин развернулся и ушел.
    mpurge %self.name%
    halt
end
~
#50522
лоадкрестьянина~
0 n 100
~
context 505
unset c505
unset h505
~
#50523
умшинкарь~
0 f 5
~
switch %random.2%
case 1
if %world.curobjs(564)%<1
mload obj 564
end
break
default
if %world.curobjs(550)%<1
mload obj 550
end
break
done
~
#50524
убитчерт~
0 f 100
~
switch %random.20%
case 1
if %world.curobjs(50511)% == 0
   mload obj 50511
end
break
case 2
if %world.curobjs(50517)% == 0
   mload obj 50517
end
break
default
if (%world.curobjs(529)% == 0) && (%random.2% <= 1)
   mload obj 529
end
if (%world.curobjs(217)% < 50) && (%random.3% == 3)
   mload obj 217
end
break
done
~
#50525
убитведьмак~
0 f 100
~
if %world.curobjs(572)% < 1 && %random.15% == 1
   mload obj 572
end
~
#50526
сдачаквеста~
0 r 100
~
wait 1
context 505
if %h505%!=%actor.name%
  halt
end
switch %c505%
case 1
wait 3
г Спасибо Вам.
г Наконец мои дети вместе со мной.
г А теперь позволь мне поведать тебе тайну... 
г То что здесь водиться нечистая сила ты уже убедился...
г Сначала я думал что это все очень случайно, пока не нашел вот это...
wait 1s
mecho Крестьянин достал почти сгнивший кусок пергамента.
г Местная ведунья сказала мне, что здесь написано про то, 
г как несколько веков тому здесь поселился сам черт.
г Но дороги к нему до сих пор никто не ведал, а кто узнал дорогу - 
г тот назад не возвращался...
wait 1s
г Здесь написано, что к черту есть 3 пути: Герой пойдет по первому пути, 
г умный пойдет по второму, наивный пойдет по третьему...
г Я узнал что один вход находиться в шинке... 
г Где второй вход знает шинкарь... 
г думаю перед лицом серъезной угрозы он раскажет все...
г Третий вход скрыт от глаз человека...
wait 2s
г Ну... пожалуй тебе пора идти...
г Спасибо еще раз.
wait 2s
г Да... еще...
set firstchar %self.people%
while %firstchar%
    set pc %firstchar.next_in_room%
    if %firstchar.vnum% == -1
колд 'исц' %firstchar%
колд 'насыщение' %firstchar%
колд 'восстановление' %firstchar%
    end
    if %pc%
        makeuid firstchar %pc.id%
    else
        set firstchar 0
    end
done 
unset firstchar
unset pc
колд 'защита богов' %actor%
г Чуть не забыл...
г В былые годы я слушил в дружине у киевского воеводы... 
г силы конечно уже не те, но вот умения остались...
г Если среди вас найдеться достойный ученик, то я научу его нескольким приемам...
calcuid load_mob 50510 mob
attach 50521 %load_mob.id%
end
break
case 2
wait 3
г Спасибо Вам.
г Вы вернули двоих моих детей.
г Если Вам не трудно, то найдите последнего и возвращайтесь.
end
break
case 3
wait 3
if %h505%==%actor.name%
г Спасибо Вам.
г Вы вернули мое чадо.
г Если Вам не трудно, то найдите остальных двоих и возвращайтесь.
end
break
case 4
wait 1
г К сожалению мои дети так и не вернулись еще.
end
break
default
крест
break
done
~
$~
