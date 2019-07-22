#105300
РЕПОП ЗОНЫ~
2 f 100
~
*РЕПОП ЗОНЫ | Rooms | Zone Reset | 100
%echo% &GРепоп зоны&n
~
#105301
Приветствие смотрителя~
0 h 100
~
*Приветствие смотрителя | Mobiles | Great PC | 100
wait 3
if (%direction% != north)
  halt
end
eval temp %self.gold(0)%
say Здравствуйте, гости дорогие!
say Мы рады приветствовать вас в начале нового торгового пути
say К сожалению пока что существуют некоторые технические сложности
say ввиду которых мы не можем пропустить вас на реку
кашл
wait 1s
%echo% %self.iname% на секунду призадумался.
wait 1s
say Погодите-ка, а не вас ли Княже прислал нам на подмогу?
say Обещал же наемников выслать чтоб реку от разбойников расчистить
say Правда мне казалось речь шла о варягах
чесат
wait 1s
вопрос
~
#105302
Разговор со смотрителем~
0 d 100
*~
*Разговор со смотрителем | Mobiles | Speech | 100 | *
wait 3
switch %speech%
  case да
    case нас
      case меня
        say Что же вы сразу не сказали?
        say Вот только беспокоюсь я, не маловат ли отряд
        задум
        say Кстати, если вы от Князя, подавайте мое жалование
        say Две тысячи кун - за этот и прошлый месяц
        wait 1s
        say Княже обещался прислать вместе с отрядом!
      break
      case нет
        case не нас
          say Что же вы здесь делаете?
          say Пройти то, наверное, все равно хотите?
          хитр
          say Многие воины уходили очищать реку от разбойников
          say Да не многие вернулись после этого
          say Вот Князь и издал указ никого не пущать
          say Пока отряд его наемников не прибудет и не повырежет ворога
          wait 1s
          шепт .%actor.name% Но за пару тысяч кун я могу все устроить
        break
        default
          say Что-что Вы сказали?
          вопр .%actor.name%
          halt
        break
      done
      attach 105303 %self%
      detach 105301 %self%
      detach 105302 %self%
~
#105303
Дали кун смотрителю~
0 m 2
~
*Дали кун смотрителю | Mobiles | Bribe | 2
wait 3
%echo% %self.iname% незаметно запихал куны за пояс.
if (%self.gold% >= 2000)
  eval temp %self.gold(0)%
  say Вот и ладно
  wait 1s
  %echo% %self.iname% что-то прошептал на ухо стражнику.
  calcuid strazh 105301 mob
  %force% %strazh% кричат Орлы, пропустить отряд!
  while (%exist.mob(105301)%)
    calcuid strazh 105301 mob
    exec 105304 %strazh%
  done
else
  say Маловато как-то
  чесат
  halt
end
detach 105303 %self%
~
#105304
Страж пропускает~
0 z 100
~
*Страж пропускает | Mobiles | Auto | 100
%echo% %self.iname% подвинулся, позволяя пройти на восток.
mtransform 105303
wait 5s
зеват
wait 5s
mtransform 105301
%echo% %self.iname% подвинулся, заслонив проход на восток.
calcuid smotritel 105300 mob
attach 105301 %smotritel%
attach 105302 %smotritel%
~
#105305
Приветствие лодочника~
0 r 100
~
*Приветствие лодочника | Mobiles | Great-All PC | 100
wait 5
say Здравствуйте
say Интересуют лодки?
say Отличные, недавно отремонтированные лодки
say Всего пятьсот кун за штуку
улыбк
~
#105306
Дали кун лодочнику~
0 m 1
~
*Дали кун лодочнику | Mobiles | Bribe | 1
wait 3
if (%amount% >= 500)
  say Ох! Я и не надеялся что кто-то согласится на такие цены
  say Обычно больше чем за 250 брать не хотят
  say Поразвели магов, понимаешь, летают над водой
  say Мне даже как-то совестно брать столько с Вас
  say Возьмите лучше сразу две, вон те
  calcuid lodki 105301 obj
  exec 105307 %lodki%
  exec 105307 %lodki%
elseif (%amount% >= 250)
  say И на том спасибо
  say Никто не соглашается за пятьсот
  вздох
  say Возьмите вон ту лодку
  calcuid lodki 105301 obj
  exec 105307 %lodki%
else
  say Маловато как-то
  вздох
  дать %amount% кун .%actor.name%
  halt
end
%echo% %self.iname% махнул рукой в сторону лодок
~
#105307
Лоад лодки~
1 z 100
~
*Лоад лодки | Objects | Auto | 100
%load% obj 105300
~
#105308
Водоворот засасывает под воду~
2 g 100
~
*Водоворот засасывает под воду | Rooms | Enter | 100
if (!%direction%)
  halt
end
wait 3
foreach victim %self.char%
  if (%victim.realroom% == %self.vnum%)
    %send% %victim% &RСильнейший поток воздуха утащил Вас под воду.&n
    %echoaround% %victim% Сильнейший поток воздуха утащил %victim.vname% под воду.
    wat 105395 %echo% Кто-то свалился сюда, барахтаясь и ловя ртом воду.
    %teleport% %victim% 105395 horse
  end
done
~
#105309
Выбраться из водоворота~
2 c 0
выбраться из водоворота~
*Выбраться из водоворота | Rooms | Command | 0 | выбраться из водоворота
if (%actor.vnum% != -1)
  halt
end
if (%actor.move% < 30)
  %send% %actor% Вы слишком устали чтобы сделать это !
  halt
end
%send% %actor% Вы начали грести руками и ногами, пытаясь выбраться отсюда.
%echoaround% %actor% %actor.iname% начал%actor.g% грести руками и ногами, пытаясь выбраться отсюда.
eval temp %actor.move(-30)%
wait 3
eval chance %random.5%
if (%chance% == 5)
  %send% %actor% Словно пробка из пивной бочки Вы вылетели из водоворота.
  %echoaround% %actor% %actor.iname% пропал%actor.g% из виду где-то вверху.
  eval direct %random.4%
  switch %direct%
    case 1
      eval vnum 105356
      eval fro юга
    break
    case 2
      eval vnum 105360
      eval fro запада
    break
    case 3
      eval vnum 105363
      eval fro севера
    break
    case 4
      eval vnum 105358
      eval fro востока
    break
  done
  wat %vnum% %echo% %actor.iname% плюхнул%actor.u% в воду рядом с Вами, прилетев с %fro%.
  %teleport% %actor% %vnum% horse
else
  %send% %actor% Изрядно подустав, Вы опустились обратно на дно.
  %echoaround% %actor% Изрядно подустав, %actor.iname% опустил%actor.u% обратно на дно.
end
~
#105310
Вошли в домик~
2 g 100
~
*Вошли в домик | Rooms | Enter | 100
if (!%exist.mob(105304)%)
  wait 2s
  %load% mob 105304
else
  wait 1s
  calcuid vitya 105304 mob
  %send% %actor% %vitya.iname% с надеждой взглянул на Вас.
  %echoaround% %actor% %vitya.iname% с надеждой взглянул на %actor.vname%.
end
~
#105311
Лоад витязя~
0 n 100
~
*Лоад витязя | Mobiles | Load | 100
%echo% Колеблющаяся тень возникла из-за стола, вихрем пронеслась по дому.
wait 2
eval victim %random.pc%
if (!%victim%)
  %echo% Колеблющаяся тень скрылась за столом.
  %purge% %self%
end
eval hitpts %victim.hitp%+2
крича Живым не дамся, супостаты!
wait 2
%echo% Валяющийся до поры на полу валенок вдруг полетел в Вашу сторону.
%send% %victim% &RВаленок попал Вам точно в лоб!&n
%echoaround% %victim% Валенок попал %victim.dname% точно в лоб!
%damage% %victim% %hitpts%
wait 2
%echo% Колеблющаяся тень на мнгновенье замерла, словно задумалась.
%echo% Тень рассеялась, на ее месте оказался ветхий мужичок.
wait 2s
if (%victim.hitp% < %victim.maxhitp%)
  %echo% %self.iname% оказал %victim.dname% первую помощь.
  dg_cast 'исцеление' %victim%
end
say Не прибил, кажись?
улыб .%victim.iname%
say Прошу прощения за такое горячее приветствие
wait 2
say У меня гости бывают редко, да все разбойники и лихоимцы
say Кабы не дом моего деда, давно бы уехал отсюда
say А так, понимаешь, родовое гнездо, сохранить надобно
вздох
wait 2
say Вот кабы кто вычистил реку от негодяев
say Да порабовал бы меня этой вестью
say Уж я б его отблагодарил да расцеловал
мечтат
attach 105312 %self.id%
~
#105312
Сказали витязю~
0 d 100
*~
*Сказали витязю | Mobiles | Speech | 100 | *
say Не болтай попусту
~
#105313
Стреляют из леса~
2 e 40
~
*Стреляют из леса | Rooms | Enter PC | 40
wait 1
%echo% Небольшое серое облако поднялось над лесом. Стрелы!
wait 5
eval amount %random.10%+2
while (%amount% > 0)
  if (%random.3% == 1)
    switch %random.3%
      case 1
        %echo% Стрела вонзилась в воду, издав негромкий шлепок.
      break
      case 2
        %echo% Стрела пролетела намного дальше, в лес на другом берегу.
      break
      case 3
        %echo% Стрела плюхнулась в воду, не долетев до Вас пару саженей.
      break
    done
  else
    eval victim %random.char%
    if (%victim%)
      if (%victim.hitp% > %victim.maxhitp%)
        eval vdamage %victim.hitp%/12
      else
        eval vdamage %victim.maxhitp%/12
      end
      %send% %victim% &RОдна из стрел попала в Вас!&n
      %echoaround% %victim% Одна из стрел вонзилась прямо в %victim.vname%!
      %damage% %victim% %vdamage%
    else
      %echo% Стрела ушла под воду, никого не задев.
    end
  end
  eval amount %amount% - 1
done
~
$~
