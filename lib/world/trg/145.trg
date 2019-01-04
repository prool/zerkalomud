#14500
раскопатьлаз~
2 c 0
раскопать разгрести расширить~
if !%arg.contains(лаз)%
  return 1
  halt
end
wait 1
wsend       %actor% Вы начали расширять лаз.
wechoaround %actor% %actor.name% попытал%actor.u% расширить лаз.
wait 2s
wecho       Земля с шумом обвалилась, открыв старый проход...
wdoor  14510 down flags a
wdoor  14510 down room  14522
wdoor  14522 up   flags a
wdoor  14522 up   room  14510
detach 14500 %self.id%
~
#14501
убитадуша~
0 f 100
~
calcuid qroom 14525 room
attach  14502 %qroom.id%
mecho   Душа со сдавленным стоном растворилась в пустоте...
~
#14502
оплатаквеста~
2 c 0
воткнуть вонзить~
calcuid corpse 14500 obj
if !%corpse% || !%arg.contains(меч)%
  halt
end
if %exist.obj(14507)%
  calcuid gladius 14507 obj
else
  %send% %actor% У вас этого нет!
  halt
end
set sword  %actor.eq(16)%
if %sword.vnum% != 14507
  halt
end
wait 1
wsend %actor% Вы воткнули старинный меч в полуразвалившийся костяк...
wechoaround %actor% %actor.name% воткнул%actor.g% старинный меч в полуразвалившийся костяк...
wecho Меч вспыхнул ярким пламенем и костяк исчез...
wait 1
wpurge %corpse%
wait 1
wpurge %gladius%
if (%actor.class% == 13)
  if (%world.curobjs(230)% < 100 && %random.1000% <= 450)
    wecho На этом месте осталась лишь древняя руна...
    wload obj 230
    detach 14502 %self.id%
    halt
  end
end
switch %random.7%
  case 1
    if (%world.gameobs(14501)% < 10)
      wecho На этом месте остался лишь потрескавшийся от времени щит...
      wload obj 14501 
    end
  break
  case 2
    if (%world.gameobs(14502)% < 10)
      wecho На этом месте осталось лишь почерневшее от времени лезвие...
      wload obj 14502 
    end
  break
  case 3
    if (%world.curobjs(14503)% < 15)
      wecho На этом месте осталось лишь темное колечко...
      wload obj 14503 
    end
  break
  case 4
    if (%world.curobjs(14504)% < 15)
      wecho На этом месте осталась лишь обугленная кость...
      wload obj 14504
    end
  break
  case 5
    if (%world.curobjs(14505)% < 15)
      wecho На этом месте осталась лишь погнутая железная пластина...
      wload obj 14505
    end
  break
  case 6
    if (%world.curobjs(230)% < 50)
      wecho На этом месте осталась лишь древняя руна...
      wload obj 230
    end
  break
  case 7
    if %random.1000% <= 460
      wload obj 1704
      wecho На этом месте осталась лишь старая книга...
    end
  break
done
detach 14502 %self.id%
~
#14503
исчезновениедуши~
2 z 0
~
return 1
calcuid spirit 14500 mob
wpurge  %spirit%
~
#14504
приветствие~
0 q 100
~
wait 1
if %self.haveobj(14507)%
  calcuid sword 14507 obj
  mpurge %sword%
end
if (%exist.obj(14507)% == 1)
  msend %actor% Старик осенил Вас размашистым крестом.
  halt
end
msend %actor% - Здраве буде, %actor.name%, да будет твой путь по земле долгим.
msend %actor% Священник наклонил голову, приветствуя Вас.
wait 2s
msend %actor% - Вот что скажу я тебе - все беды от грехов наших тяжких.
msend %actor% - Ведь как бывает - грешат деды, а к ответу и внуков призовут.
msend %actor% Старик что-то прошептал про себя.
wait 2s
msend %actor% - Был грех, был, все мы человеки, слаба плоть, не устоит перед искусом.
msend %actor% - А все гордыня наша, губит она нас, в объятья Сатаны гонит.
msend %actor% Старик перекрестился.
wait 2s
msend %actor% - Да видно не интересно тебе это, молод%actor.g% ты еще,
msend %actor% - рано тебе грехи вспоминать давние.
msend %actor% Старик замолк.
~
#14505
выдачаквеста~
0 d 1
слушаю продолжай~
if %actor.vnum% != -1
  halt
end
wait 1
msend %actor% - Было это давно, городища почитай не было.
msend %actor% Глаза старика заблестели.
msend %actor% - Пришел ворог, много его было, все поле чернело, как после пахоты.
msend %actor% - Сеча была лютая, до самой ночи бились, да и при луне еще добивались.
msend %actor% - Много наших легло, ой много.
msend %actor% Старик смахнул слезу со щеки.
wait 2s
msend %actor% - Насыпали курган, да ты его видал%actor.g% небось, на горе, где кладбище.
msend %actor% - Там и покоятся защитники, в битве порушенные.
wait 2s
msend %actor% - Да вот только не всех предали земле, не всех. Самого главного, что
msend %actor% - у супостата навроде князя был, положили в колоде осиновой под курганом,
msend %actor% - чтобы не нашла его душа его дороги к своим идолищам.
msend %actor% - Не по божески это, ой не по божески.
msend %actor% Старик осенил себя размашистым крестом.
wait 1s
msend %actor% - Вот и выходит его душа ночами, прибежища ищет.
msend %actor% - Упокоить душу можно только вот этим мечом.
msend %actor% (старик достал из-за божницы проржавевшее лезвие)
msend %actor% - Просто воткни его в костяк, душа сама путь найдет.
msend %actor% - Только лаз сперва раскопай, чтобы к колоде пройти.
mload obj 14507
дать старинный.меч %actor.name%
dg_cast 'защита от тьмы' %actor.name%
detach  14504 %self.id%
detach  14505 %self.id%
~
#14510
обновлениепеременных~
2 f 100
0~
wdoor   14510 down purge
wdoor   14522 up   purge
calcuid qroom 14510 room
attach   14500 %qroom.id%
detach  14502 %self.id%
~
$~
