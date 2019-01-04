#42700
управ приветствие~
0 q 100
~
wait 1
say  Здраве тебе, %actor.name%!
~
#42701
управ дать~
0 j 100
~
wait 1
switch %object.name%
case труп мыши
  if %object.vnum% == 42707
    say  Как ты посмел воровать еду у моего любимого кота, тать презренный!
    поло труп миска
    msend %actor.name% Управляющий взял вас за шкирку и понес к выходу.
    mechoaround %actor% Управляющий взял %actor.rname% за шкирку и понес к выходу.
    msend %actor.name% Управляющий придал вам скорости ногой.
    mechoaround %actor% Управляющий придал %actor.rname% скорости ногой.
    msend %actor.name% Даа, не хорошо воровать.
    mdamage %actor% 50
    if %actor.hitp%>0
    mteleport  %actor.name% 42708
      mechoaround %actor% %actor.rname% вышвырнули сюда с севера.
    end
    mecho Даа, не хорошо воровать.
    mpurge труп
  else
    say  О!  Грызун! Моему котику будет что покушать.
    mpurge труп
    mload obj 42707
    поло труп.мыши миска
    %self.gold(+10)%
    дать 10 кун %actor.name%
say Возьми, за беспокойство.
  end
  break
case клочок бересты
say  Молодец, %actor.name%! Ты славно поработал%actor.g%.
  %self.gold(+100)%
  дать 100 кун %actor.name%
  mpurge клочок
  break
case труп котяры
  say О горе, горе! Ты убил моего любимого котика!
  mpurge труп
  msend %actor.name% Управляющий придал вам скорости ногой.
  mechoaround %actor% Управляющий придал %actor.rname% скорости ногой.
  mdamage %actor% 50
    if %actor.hitp%>0
  mteleport  %actor.name% 42708
    mechoaround %actor% %actor.rname% вышвырнули сюда с севера.
   end
  break
case красивая брошка
  радов %actor.name%
  say Наконец-то моя брошь нашлась! Как я горевал, когда она пропала.
  say Спасибо тебе, %actor.name%, я ценю таких находчивых людей.
  %self.gold(+200)%
  дать 200 кун %actor.name%
  mpurge брошка
  break
default
  say  Зачем мне это? 
  eval getobject %object.name%
  броси %getobject.car%.%getobject.cdr%
  break
done
~
#42702
кот убить мышь~
0 i 100
~
wait 1
if %actor.vnum% == 42702
  убить мышь
end
~
#42703
кладовщик выдать мешок~
0 d 1
да помогу давай~
if %actor.vnum% != -1
   halt
end
wait 1
if %self.haveobj(42701)%
  say Хорошо, %actor.name%. Вот тебе мешок.
  дать мешок %actor.name%
  say Отнеси его мукомолу.
else
  say Нету для тебя сейчас работы, %actor.name%. Приходи попозже.
end
~
#42704
мукомол выдать мешок~
0 j 100
~
wait 1
switch %object.name%
case мешок зерна
  say  Сейчас, сейчас, %actor.name%! Скоро все будет готово!
  mecho Мукомол высыпал зерно в жернов и подставил пустой мешок для муки.
  mpurge мешок.зерна
  wait 3 s
  mload obj 42702
  say  Вот! Уже все готово, забирай.
  дать мешок %actor.name%
  say  Отнеси его в амбар.
  break
default
  say  Зачем мне это? 
  eval getobject %object.name%
  броси %getobject.car%.%getobject.cdr%
  break
done
~
#42705
кладовщик дать расписку~
0 j 100
~
wait 1
switch %object.vnum%
case 42702
  say  Хорошо, %actor.name%. Ты славно поработал.
  oecho Кладовщик начал что-то царапать на кусочке бересты.
  mpurge мешок.муки
  wait 1s
  mload obj 42705
  дать клочок %actor.name%
  say  Можешь идти к управляющему за расчетом.
  break
default
  say Зачем мне это? 
  eval getobject %object.name%
  броси %getobject.car%.%getobject.cdr%
  break
done
~
#42706
окно~
2 g 50
~
 wait 1
 wsend %actor.name% С криком "БАНЗАЙ" вы выпрыгнули в окно.
 if actor.sex==1
   wechoaround %actor% С криком %actor.name% выпрыгнул в окно.
   else
   wechoaround %actor% С криком %actor.name% выпрыгнула в окно.
 end
 eval  newhit %actor.hitp% - 5
 if %actor.hitp% > 50
    wteleport  %actor% 42704
    wat 42704 wechoaround %actor% %actor.name% упал из окна.
   eval buffer %actor.hitp(-50)%
 else  
    wsend %actor% Нда.. Крылья у Вас не выросли.
    wdamage %actor% %newhit%
    wteleport  %actor% 42704
    wat 42704 wechoaround %actor% %actor.name% упал из окна.
 end
~
#42707
мышь мешок~
0 q 100
~
wait 1
if (%actor.haveobj(42701)%) || (%actor.haveobj(42702)%)
  убить %actor.name%
end
~
#42708
кладовщик квест~
0 q 100
~
wait 1
if %self.haveobj(42701)%
  say У меня есть для тебя работа, %actor.name%.
say Согласен ли ты силы свои напрячь и заработать маленько?
end
~
#42709
жернова шумят~
2 e 100
~
wait 1
wecho БУМ-БУТ-ТРАМ!
~
$~
