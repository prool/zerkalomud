#11200
репоп (кстати Вас тоже с Новым Годом, работники невидимого фронта)~
2 f 100
~
calcuid santa 11210 mob
attach 11205 %santa.id%
calcuid snegurka 11204 mob
detach 11202 %snegurka.id%
attach 11201 %snegurka.id%
detach 11212 %snegurka.id%
**размещаем подарки под ╦лками, снимаем фейлы**
calcuid elk1 11206 room
calcuid elk2 11215 room
calcuid elk3 11223 room
calcuid elk4 11229 room
attach 11210 %elk1.id%
attach 11210 %elk2.id%
attach 11210 %elk3.id%
attach 11210 %elk4.id%
detach 11211 %elk1.id%
detach 11211 %elk2.id%
detach 11211 %elk3.id%
detach 11211 %elk4.id%
~
#11201
вход к снегурке (выдача квеста)~
0 r 100
~
wait 1
say Дааай-Лати-пути-пути-дай...
wait 1
say О, привет, чувак!!!
say По стафу или по экспе зонимс?
wait 1
ухм
wait 1
say Ладно не парься,
say Тут кароче такая маза:
say Дедушку моего чую Сатана-Клаус прирезал -
say Пойди уж разберись что к чему!
wait 1
say Найдёшь старичка -
say Скажи ему, что пора, мол, а что пора, он и сам знает, всего-то делов.
say Ну а если найдешь новогодние подарки, тащи сюда, я че-нить замучу для тебя.
wait 2s
say Ну всё, давай, топай!
attach 11202 %self.id%
detach 11201 %self.id%
~
#11202
вход к снегурке (нерепоп квеста)~
0 r 100
~
wait 1
say Дааай-Лати-пути-пути-дай...
wait 1
say Эта. Просили передать, что занято тут, никого не впускать, никого не выпускать!
say Или в пклист впишут, до 1го лева сольют... и ващеее...
say вот...
красн
~
#11203
сдали голову сатане клаусу~
0 j 100
~
if %object.vnum% == 11205 then
  wait 1
  say Ну тебя как за смертью посылать
  wait 1
  say Спасибо конечно...
  wait 1
  say Но вот подарков уже нету 
  wait 1
  say В следующий раз будешь порасторопнее
  wait 1
  хих 
else 
  wait 1s
  say Зачем мне это? Хотя да, подарю детям.
  wait 1s
  mecho Сатана-Клаус затравленно оглянулся и запихнул %object.vname% за пояс.
end
mpurge %object%
detach 11205 %self.id%
~
#11204
умер демон - лоуд головы~
0 f 100
~
mload obj 11205
~
#11205
вход к Cатане-Клаусу (левый квест)~
0 r 100
~
wait 1
say Йо чувак, хошь подарок от меня?
wait 1
say Вальни демона и притащи его голову.
~
#11206
Сатана-Клаус rip - лоудим дедушку :)~
0 f 100
~
mecho Сатана-Клаус в бреду в последний раз крикнул - we wish you merry Christmas - и помер.
mload mob 11201 
~
#11207
Деда мороза спасли~
0 n 100
~
wait 1s
if !%self.fighting%
  mecho Из глубины пещеры испуганно высунулся кончик бороды Дедушки Мороза.
  wait 2s
  if !%self.fighting%
    mecho Наконец он понял, что бояться нечего, и вышел к Вам.
    wait 1s
    if !%self.fighting%
      say Дожили, гопники спасают Дедушку
      say Лан, открою тебе секрет, тока чисто между нами, ок?
      wait 1s
      if !%self.fighting%
        say Дык вот слушай, если порыться под елкой, можно найти подарки :)
        say Мешки целые лежат, все Сатана-Клаус закрысил. 
        say Ты только не жадничай, глядишь и тебе чего перепадёт.
        wait 2s
        if !%self.fighting%
          say Ну да ладно.. буду пока стишки новогодние разучивать, снегурку ждать.
          attach 11208 %self.id%
        end
      end
    end
  end
end
~
#11208
Деду-Морозу сказали "пора"~
0 d 0
пора~
wait 1
if !%self.fighting%
  say Что.. Где??? Уже???? Ну, я полетел.
else
  halt
end
wait 1
mecho Дед-Мороз свистнул и прыгнул в непонятно откуда появившиеся сани с тройкой оленей.
if %random.6% == 1
  wait 1s
  mload obj 11203
  брос посох
  руг
  г Штоп твою налево, обронил, нет, нету времени.
end
wait 1s
mecho Упряжка громко звякнула колокольчиками и сорвалась с места.
calcuid snegurka 11204 mob
attach 11212 %snegurka.id%
mpurge %self%
~
#11209
зашли к Йети~
0 r 100
~
wait 1
ворч
wait 1
см %actor.name%
~
#11210
роемся под ╦лкой~
2 c 100
рыться~
wait 1
if %arg.contains(елкой)% || %arg.contains(ёлкой)%
  wload obj 11212
  wsend %actor% Вы начали усердо искать подарочки и наконец нашли их!
  wechoaround %actor% %actor.iname% высунул%actor.g% язык и начал%actor.g% увлечённо рыться под ёлочкой :) Ну не дитя, а ? :)
  attach 11211 %self.id%
  detach 11210 %self.id%
else
  wsend %actor% И где же Вы собрались рыться?
end
~
#11211
роемся под пустой ╦лкой~
2 c 100
рыться~
wait 1
if %arg.contains(елкой)% || %arg.contains(ёлкой)%
  wsend %actor% Вы начали усердо искать подарочки... но похоже их тут нет.. Уаааа!
else
  wsend %actor% И где же Вы собрались рыться?
end
~
#11212
сдали мешок снегурке (мейн награда)~
0 j 100
~
if %object.vnum% == 11212
  wait 1
  ул
  wait 1
  mecho Снегурка закрыла глаза и прокричала:
  mecho Аааахтунг-бааадун-карааааахм...
  switch %random.23%
    case 1
      mecho  Снегурка достала &WНовогоднее&n Колечко Венчания из мешка с подарками.
      mload obj 11211
      дать колеч .%actor.iname%
      say Носи, дитятко :)
      mpurge %object%
      halt
    break
    case 2
      mecho  Снегурка достала &WНовогодний&n Плащик из мешка с подарками.
      mload obj 11210
      дать плащ .%actor.iname%
      say Носи, дитятко :)
      mpurge %object%
      halt
    break
    case 3
      mecho  Снегурка достала &WНовогодние&n сапожки из мешка с подарками.
      mload obj 11209
      дать сап .%actor.iname%
      say Носи, дитятко :)
      mpurge %object%
      halt
    break
    case 4
      mecho  Снегурка достала &WНовогодние&n трусики Танго из мешка с подарками.
      mload obj 11208
      дать трус .%actor.iname%
      say Носи, дитятко :)
      mpurge %object%
      halt
    break
    case 5
      mecho  Снегурка достала &WНовогодние&n перчатки из мешка с подарками.
      mload obj 11207
      дать перч .%actor.iname%
      say Носи, дитятко :)
      mpurge %object%
      halt
    break
  done
  ***собстна фейл***
  mecho Снегурка взялась что-то вытаскивать из мешка и случайно порвала подарок.
  wait 1
  mecho Бедная девочка быстро спрятала за спину испорченную вещь и незаметно выкинула.
  wait 1
  say Бракованный был :)
  mpurge %object%
else
  wait 1
  say И зачем это мне? Хотя да, подарю детям :)
  mpurge %object%
end
~
#11213
пишем зелёным маркером~
1 c 1
рисовать~
set selfnum 0
set num 0
foreach i %self.pc%
  eval num %num%+1
done
set ranofself %random.num(%num%)%
foreach n %self.pc%
  eval selfnum %selfnum%+1
  if %ranofself% == %selfnum%
    set char %n%
  break
end
done
if %char.name% == Рафаил
  oecho Рафаил разгневанно огляделся по сторонам и закричал : "Я те покажу Рафаил + %actor.iname%"
  odamage %actor% 50
  osend %actor% Рафаил &RБОЛЬНО&n врезал Вам!
  halt
end
if %char.name% == %actor.name%
  osend %actor% Вы огляделись по сторонам в поисках жертвы ваших фантазий.
  osend %actor% Остановившись на себе любимом, Вы начали было вырисовывать &G%actor.iname% + %actor.iname% = Love&n...
  oechoaround %actor% %actor.iname% начал было что-то чертить в воздухе &GЗелёным маркером&n, но похоже передумал...
  osend %actor% Но вовремя остановились, слишком уж неестественно как-то :).
else
  osend %actor% Вы огляделись по сторонам в поисках жертвы ваших фантазий. Ага, кажется %char.iname% - самое оно.
  oechoaround %actor% %actor.iname% начал что-то рисовать прямо в воздухе &Gзелёным маркером&n.
  %actor.wait(2)%
  osend %actor% Вы начали что-то рисовать и неожиданно для самого себя выписали "&G%actor.iname% + %char.iname% = Love!&n"
  oechoaround %actor% %actor.iname% наконец закончил своё творение...
  oecho Надпись &G%actor.iname% + %char.iname% = Love! &nнемного повисела в воздухе и потухла.
end
~
#11214
креш триг~
1 c 1
рисовать~
set chars %self.pc%
set num 0
foreach i %chars%
  oecho вижу чара - %i.iname% :)
  eval num %num%+1
  if %num% > 10
  break
end
done
oecho количество чаров в руме - %num%
wait 1
set rchar %random.num(%chars%)%
oecho Рандомный чар - %rchar.iname%
set ranchar %random.char%
oecho Рандомный чар по данным ВЦИОМ - %ranchar.iname%
**********рыд
eval ran %random.num(%num%)%
oecho промежуточный порядковый номер рандома для расчета МК составил - %ran%
foreach i %chars%
  if %num% == %ran%
    set rchar %i%
  break
else
  eval num %num%-1
End
done
oecho Рандомный чар по версии МК - %rchar.iname%
***********УУУУУУУААААААААААААААаААААААА
eval nrchar %random.num(%chars%)%
oecho г По версии Forbes рандом чаром является ... %nrchar.iname% !
********парапапам
%echo% такс.. начинаем версию рбк
set selfnum 0
set num 0
set chars %self.pc%
foreach i %chars%
  %echo% нашли чара - %i.iname%
  eval num %num%+1
break
done
%echo% чаров в руме - %num%
set ranofself %random.num(%num%)%
%echo% мы возьмем только %ranofself%го из них..
foreach i %chars%
  eval selfnum %selfnum%+1
  if %ranofself% == %selfnum%
    set rchar %i%
  end
done
%echo% По версии РБК (надеюсь последней) рандом чар - %rchar.iname%
~
#11215
новый креш триг~
1 c 1
крешик~
%echo% такс.. начинаем версию рбк
set selfnum 0
set num 0
set chars %self.pc%
foreach i %chars%
  %echo% нашли чара - %i.iname%
  eval num %num%+1
done
%echo% чаров в руме - %num%
set ranofself %random.num(%num%)%
%echo% мы возьмем только %ranofself%го из них..
wait 1s
%echo% ну зашибись второй цикл отказывается пускаться, проверим сохранилась ли ещё переменная со списком чаров - %chars% .
foreach n %chars%
  eval selfnum %selfnum%+1
  %echo% ну хорошо, разберем второй цикл по строчечкам. сейчас у нас рассматривается %selfnum% чар по счету.
  %echo% а нам для сохранения его как рандомного нужен его %selfnum% равный %ranofself% (см выше).
  if %ranofself% == %selfnum%
    set rchar %n%
    %echo% только что мы попытались установить чара под этим номером в переменную рандомчара.
  end
done
%echo% По версии РБК (надеюсь последней) рандом чар - %rchar.iname%
~
#11220
дернуть веревку хлопушки~
1 c 1
дернуть~
if %arg.contains(веревку)% || %arg.contains(веревка)%
  wait 1
  osend %actor% Вы дернули за верёвочку и хлопушка выстрелила.
  oechoaround %actor% %actor.iname% дернул%actor.g% за верёвочку и хлопушка выстрелила.
  wait 1
  %echo%  - &RЯркие&n хлопушки затрещали в &WНовый год&n
  %echo%  - Испустив &Gвеселых&n &Bярких&n &Yконфети&n
  %echo%  - Шлют ребятам всем подарки да игрушки
  %echo%  - Быстро встали в &Rх&Gо&Bр&Yо&wв&Cо&bд&n, а не то Вам &WДед Мороз&n
  %echo%  - Что &Gподарки&n Вам принес, щас утроит &RНовый Год&n
  %purge% %self%
else
  osend %actor% За что вы хотите дернуть? :)
end
~
#11221
бросили петарду~
1 h 100
~
wait 1
%echo% - Веселая петарда &Yсильно&n хлопнула и вдруг,
%echo% - &RОторвала&n пальцы детям, что столпились все вокруг.
%echo% - Вот подарки детки, &WДед Мороз&n Вам шлёт.
%echo% - Ну а пальцы доктор как-нибудь пришьёт.
%purge% %self%
~
#11222
веселый фейрверк подожгли~
1 c 4
поджечь~
if %arg.contains(фейерверк)%
  wait 1
  osend %actor% Вы аккуратно подожгли фейрверк и отбежали подальше...
  oechoaround %actor% %actor.iname% аккуратно запалил%actor.g% фейрверк и отбежал%actor.g% подальше...
  %actor.wait(3)%
  wait 3s
  calcuid bum %self.room% room
  attach 11266 %bum.id%
  exec 11266 %bum.id%
  %purge% %self%
else
  osend %actor% Что вы хотите поджечь?
end
~
#11250
зашли к зайцу~
0 g 100
~
wait 1
эм захныкал.
wait 1
mecho Зайчик опасливо покосился на Вас и вдруг заговорил тоненьким человеческим голосом.
wait 1s
say Ох, беда, беда приключилась... Дедушка Мороз в беде, чует моё сердце. Я тут вот, в Киеве тружусь
wait 1
Собираю ему списки тех, кто вёл себя хорошо, да кто чего хочет...
wait 1
say Этот разлом всего-то на одну секундочку открыться должен был, чтоб дедушка пролетел быстренько
wait 1
say Не лететь всё по небу, долго это... за ним бы и закрылось сразу.. Только вот нету его.. спустись..
wait 1
say Разберись уж что там к чему. Глядишь он и тебе чего подарит.
~
#11264
шмотки выпрыгивают из мешка~
1 n 100
~
%echo% %self.iname% весело выпрыгнул%self.g% из огромного &Rкрасного мешка&n с подарками.
~
#11265
открыли мешок деда мороза - взяли подарок~
1 p 100
~
wait 1
set mode %random.8%
if %mode% > 7
  oload obj 11225
else
  eval fload 11215+%mode%
  oload obj %fload%
end
~
#11266
временный тригер на руму для разрыва фейрверка~
2 z 100
~
wzoneecho %self.vnum% - &bСиние&n, &Gзеленые&n, &YЖелтые&n, &RКрасные&n огни засветились в небе.
wzoneecho %self.vnum% - Вдруг послышался звон бубенчиков и топот копыт северных оленей
wzoneecho %self.vnum% - Неуж-то Дедушка Мороз везет свои подарки?
detach 11266 %self.id%
~
#11298
аттач триггеров запрета~
2 f 100
~
set i 0
while %i% < 40
  eval i %i%+1
  eval rum 11200+%i%
  wait 1
  if %i%>39
    halt
  end
  calcuid komn %rum% room
  detach 11299 %komn.id%
  attach 11299 %komn.id%
done
~
#11299
Непускаем умников в  НГ сказку~
2 e 100
~
if %actor.remort%  > 3
  wsend %actor% Вы вошли в новогоднюю сказку и потеряли чувство реальности. 
  %actor.wait(2)%
  wait 10
  eval rum 49900+%random.50%
  wteleport %actor% %rum%
end
~
$~
