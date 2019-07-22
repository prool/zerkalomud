#96400
Рип Гицура/Оттара Черного~
0 f 100
~
if (%random.100% <= 20) && (%world.curobjs(96403)% < %world.maxobj(96403)%)
  mload obj 96403
end
~
#96401
Рип Гуннлага Змеиный Язык~
0 f 100
~
if (%random.100% <= 25) && (%world.curobjs(96406)% < %world.maxobj(96406)%)
  mload obj 96406
end
~
#96402
Рип Гутторма Искра~
0 f 100
~
if (%random.100% <= 25) && (%world.curobjs(96408)% < %world.maxobj(96408)%)
  mload obj 96408
end
~
#96403
Рип Харальда Серый Плащ~
0 f 100
~
if (%random.100% <= 25) && (%world.curobjs(96409)% < %world.maxobj(96409)%)
  mload obj 96409
end
~
#96404
Рип Стюрборда Сильного~
0 f 100
~
if (%random.100% <= 15) && (%world.curobjs(96407)% < %world.maxobj(96407)%)
  mload obj 96407
end
~
#96405
Мобы отступают для стаба~
0 k 100
~
отст
~
#96406
Моб пытается рекольнуть чара~
0 k 100
~
if (%random.10% <= 2)
  if (%actor.leader%)
    eval targ %actor.leader%
    if (%targ.canbeseen%)
      dg_cast 'слов возв' .%targ.name%
    end
  else
    if (%actor.canbeseen%)
      if (%actor.vnum% != -1)
        dg_cast 'слов возв' %actor.name%
      else
        dg_cast 'слов возв' .%actor.name%
      end
    end
  end
end
~
#96407
Рип Ярла Биргира~
0 f 100
~
if (%random.100% <= 30) && (%world.curobjs(96410)% < %world.maxobj(96410)%)
  mload obj 96410
end
~
#96408
Рип Эйрика Кровавая секира~
0 f 100
~
if (%random.100% <= 20) && (%world.curobjs(96402)% < %world.maxobj(96402)%)
  mload obj 96402
end
~
#96409
Рип Кальва из Тренда~
0 f 100
~
if (%random.100% <= 20) && (%world.curobjs(96404)% < %world.maxobj(96404)%)
  mload obj 96404
end
~
#96410
Рип Альва Малыша~
0 f 100
~
if (%random.100% <= 20) && (%world.curobjs(96405)% < %world.maxobj(96405)%)
  mload obj 96405
end
~
#96411
Конунг трансформится и суммонит~
0 k 100
~
if (%random.10% <= 2)
  %load% mob 96449
  %echo% Мелкий карлик прибежал на шум борьбы.
end
eval wai %random.4%*2+2
wait %wai%s
%echo% Конунг Рагнар закричал боевую песню.
if %self.vnum% == 96400
  mtransform 96450
else
  mtransform 96400
end
~
#96412
Телепорты мобов на рассвете 1~
2 ab 100
~
set time рассвет
if (%weather.sunlight% != %time%)
  halt
end
if (%valgenter% > 0)
  eval valgenter %valgenter%-1
  worlds valgenter
  if (%valgenter% == 0)
    log &BВ Вальгалле включились молнии&n
  end
end
set moblist1 96401 96402 96403 96404 96405 96406
foreach vnum %moblist1%
  if (%world.curmobs(%vnum%)% == 0)
    %load% mob %vnum%
  end
  calcuid target %vnum% mob
  wteleport %target% 96474
  wait 1
done
wait 2
set moblist2 96407 96408 96409 96410 96411 96412
foreach vnum %moblist2%
  if (%world.curmobs(%vnum%)% == 0)
    %load% mob %vnum%
  end
  calcuid target %vnum% mob
  wteleport %target% 96461
  wait 1
done
wait 2
set moblist3 96413 96415 96416 96417 96419 96433
foreach vnum %moblist3%
  if (%world.curmobs(%vnum%)% == 0)
    %load% mob %vnum%
  end
  calcuid target %vnum% mob
  wteleport %target% 96468
  wait 1
done
set moblist4 96420 96421 96422 96423 96424 96425
foreach vnum %moblist4%
  if (%world.curmobs(%vnum%)% == 0)
    %load% mob %vnum%
  end
  calcuid target %vnum% mob
  wteleport %target% 96491
  wait 1
done
wzoneecho 96400 Увидев лучи рассвета, северные воины с яростными воплями побежали биться на арене.
wait 120s
* триг висит в 96400 клетке
~
#96413
Телепорты мобов на рассвете 2~
2 ab 100
~
set time рассвет
if (%weather.sunlight% != %time%)
  halt
end
set moblist5 96426 96427 96428 96430 96431 96432
foreach vnum %moblist5%
  if (%world.curmobs(%vnum%)% == 0)
    %load% mob %vnum%
  end
  calcuid target %vnum% mob
  wteleport %target% 96455
  wait 1
done
wait 2
set moblist6 96436 96443 96444 96445 96446
foreach vnum %moblist6%
  if (%world.curmobs(%vnum%)% == 0)
    %load% mob %vnum%
  end
  calcuid target %vnum% mob
  wteleport %target% 96482
  wait 1
done
wait 2
set moblist7 96414 96418 96434 96435 96429
foreach vnum %moblist7%
  if (%world.curmobs(%vnum%)% == 0)
    %load% mob %vnum%
  end
  calcuid target %vnum% mob
  wteleport %target% 96493
  wait 1
done
wait 2
set moblist7 96437 96438 96439 96440
foreach vnum %moblist8%
  if (%world.curmobs(%vnum%)% == 0)
    %load% mob %vnum%
  end
  calcuid target %vnum% mob
  wteleport %target% 96496
  wait 1
done
wait 120s
* триг висит в клетке 96401
~
#96414
Телепорты мобов на закате 1~
2 ab 100
~
set time закат
if (%weather.sunlight% != %time%)
  halt
end
if (%valgenter% > 0)
  eval valgenter %valgenter%-1
  worlds valgenter
  if (%valgenter% == 0)
    log &BВ Вальгалле включились молнии&g
    *&nзакрываем цвет для красоты сислога
  end
end
set moblist1 96401 96402 96403 96404 96405 96406
foreach vnum %moblist1%
  if (%world.curmobs(%vnum%)% == 0)
    %load% mob %vnum%
  end
  calcuid target %vnum% mob
  wteleport %target% 96418
  wait 1
done
wait 2
set moblist2 96407 96408 96409 96410 96411 96412
foreach vnum %moblist2%
  if (%world.curmobs(%vnum%)% == 0)
    %load% mob %vnum%
  end
  calcuid target %vnum% mob
  wteleport %target% 96428
  wait 1
done
wait 2
set moblist3 96413 96415 96416 96417 96419 96433
foreach vnum %moblist3%
  if (%world.curmobs(%vnum%)% == 0)
    %load% mob %vnum%
  end
  calcuid target %vnum% mob
  wteleport %target% 96414
  wait 1
done
wait 2 
set moblist4 96420 96421 96422 96423 96424 96425
foreach vnum %moblist4%
  if (%world.curmobs(%vnum%)% == 0)
    %load% mob %vnum%
  end
  calcuid target %vnum% mob
  wteleport %target% 96424
  wait 1
done
wzoneecho 96400 На закате раны мгновенно залечились и воины помчались пировать в главном зале.
wait 120s
* триг висит в клетке 96402
~
#96415
Телепорты мобов на закате 2~
2 ab 100
~
set time закат
if (%weather.sunlight% != %time%)
  halt
end
set moblist5 96426 96427 96428 96430 96431 96432
foreach vnum %moblist5%
  if (%world.curmobs(%vnum%)% == 0)
    %load% mob %vnum%
  end
  calcuid target %vnum% mob
  wteleport %target% 96401
  wait 1
done
wait 2
set moblist6 96436 96443 96444 96445 96446
foreach vnum %moblist6%
  if (%world.curmobs(%vnum%)% == 0)
    %load% mob %vnum%
  end
  calcuid target %vnum% mob
  wteleport %target% 96431
  wait 1
done
wait 2
set moblist7 96414 96418 96434 96435 96429
foreach vnum %moblist7%
  if (%world.curmobs(%vnum%)% == 0)
    %load% mob %vnum%
  end
  calcuid target %vnum% mob
  wteleport %target% 96441
  wait 1
done
wait 2
set moblist7 96437 96438 96439 96440
foreach vnum %moblist8%
  if (%world.curmobs(%vnum%)% == 0)
    %load% mob %vnum%
  end
  calcuid target %vnum% mob
  wteleport %target% 96496
  wait 1
done
wait 120s
* триг висит в клетке 96403
~
#96416
Рип конунга~
0 f 100
~
if (%random.100% <= 20) && (%world.curobjs(96414)% < %world.maxobj(96414)%)
  mload obj 96414
end
if (%random.100% <= 20) && (%world.curobjs(96415)% < %world.maxobj(96415)%)
  mload obj 96415
end
~
#96417
Репоп вальгаллы~
2 af 100
~
set valgenter -1
worlds valgenter
* стартовый урон 30% от хп
set valgdmg 30
worlds valgdmg
set x 96400
while %x% < 96443
  calcuid r %x% room
  attach 96419 %r.id%
  eval x %x%+1
done
set x 96458
while %x% < 96494
  calcuid r %x% room
  attach 96419 %r.id%
  eval x %x%+1
done
calcuid vhod 96495 room
attach 96418 %vhod.id%
~
#96418
Игрок заходит в вальгаллу~
2 e 100
~
if (%actor.level% > 30)
  halt
end
if (%valgenter% == -1)
  set valgenter 3
  worlds valgenter
end
wait 1
%echo% Помни, смертным нечего делать в чертогах Вальгаллы. Кто задержится здесь - живым не вернется!
log &B%actor.name% вошел в Вальгаллу&n
detach 96418 %self.id%
~
#96419
Игроки ходят по вальгалле~
2 be 60
~
if (%valgenter%>0)
  halt
end
wait 1
eval target %random.pc%
if (%target%)
  eval dmg %target.maxhitp%*%valgdmg%/100
  if (%valgdmg%<90 && %random.2% == 1)
    eval valgdmg %valgdmg%+1
    worlds valgdmg
  end
  %send% %target.name% Откуда-то сверху в Вас ударила грозовая молния!
  %echoaround% %target% Откуда-то сверху в %target.vname% ударила грозовая молния!
  wdamage %target.id% %dmg%
end
~
$~
