#12400
Вход в подземелье~
2 c 0
произнести~
if  !%arg.contains(дозор)% || !%actor.rentable% || ( %actor.clan% != нд ) 
  wechoaround %actor% %actor.name% начал%actor.g% шептать разные слова, да все понапрасну.
  wsend %actor.name% Не стоит не стоит болтать всякую всячину по пустякам.
  halt
end
wechoaround %actor% %actor.name% приложил%actor.g% ладонь к рисунку, тихо сказал%actor.g% несколько слов и исчез%actor.a%.
wsend %actor.name% Вы притронулись к гербу, произнесли заветное слово, и Вас подхватил магический вихрь.
wait 2s
wteleport %actor.name% 12645
wsend %actor.name% Спустя несколько мгновений вы очнулись под землей.
wechoaround %actor% %actor.name% внезапно появил%actor.u%.
~
#12401
Знак на камне~
2 c 0
смотреть~
if !(%arg.contains(знак)%)
  wechoaround %actor% %actor.name% глупо уставил%actor.u% непонятно куда.
  wsend %actor.name% Ваш глупый взгляд пугает окружающих.
  halt
end
wechoaround %actor% %actor.name% уставил%actor.u% на рисунок.
wsend %actor.name% Вы видите полустертый знак, изображающий летучую мышь  - герб Ночного Дозора,
wsend %actor.name% который, если заслонить его от постороннего света, слегка светится переливающимся
wsend %actor.name% колдовским светом.
~
#12402
Вход на мост~
2 e 100
мост~
wait 1
if ( %random.99% <= 55 )
  wechoaround %actor% %actor.name% оступился и с криком ужаса провалил%actor.u% вниз.
  wsend %actor% Вдруг вы оступились и с криком ужаса полетели вниз.
  wsend %actor% Ааа... Плюх!!!
  wsend %actor% Подняв кучу брызг, Вы погрузились в бурный горный поток, который потащил
  wsend %actor% Вас вниз по течению. Но не долго - со всего размаха Вы ударились о каменный
  wsend %actor% выступ. Ох как БОЛЬНО...
  wteleport %actor% 12429
  eval    dam124  %actor.hitp%*17/20
  wait 1
  wdamage %actor% %dam124%
  wsend %actor% Но жить то хочется и поэтому хоть как, а вылезать надо.
  wsend %actor% И напрягшись, со стонами Вы выползли из воды.
  wat 12429 wechoaround %actor% %actor.name% со стонами и причитаниями вскарабкал%actor.u% на уступ.
else
  wsend %actor% Идя по подвесному мосту Вы оступились, но Вам удалось удержать равновесие.
  wechoaround %actor% %actor.name% оступил%actor.u%, но чудом сумел%actor.g% сохранить равновесие.
end
~
#12403
Плита в пещере~
2 c 0
смотреть~
if !(%arg.contains(знак)%)
  wechoaround %actor% %actor.name% глупо уставил%actor.u% непонятно куда.
  wsend %actor.name% Ваш глупый взгляд пугает окружающих.
  halt
end
wechoaround %actor% %actor.name% уставил%actor.u% на знак.
wsend %actor.name% На плите вырезан знак нетопыря. Рядом с ним резами начертано :
wsend %actor.name% "Да найдет здесь свою погибель несведущий".
~
#12404
Вход в нору~
2 c 0
лезть~
if !(%arg.contains(дыра)%)
  wechoaround %actor% %actor.name% безуспешно попытал%actor.u% залезть куда-то.
  wsend %actor.name% Вы огляделись, и не нашли того, куда собрались залезть.
  halt
end
wechoaround %actor% %actor.name% встал%actor.g% на четвереньки и заполз%actor.q% в нору.
wsend %actor.name% Согнувшись, Вы на четвереньках вползли в дыру.
wait 1s
wteleport %actor.name% 12444
wsend %actor.name% Через несколько шагов нора стала достаточно широкой,
wsend %actor.name% и Вы выпрямились во весь рост.
~
#12405
дали знак~
0 j 100
~
wait 1
if (%object.vnum% == 12400)
  wait 1
  mpurge %object%
  wait 1s
  tell %actor.name% Да, это тот самый недостающий обломок знака, %actor.name%!
  tell %actor.name% Теперь я наконец-то смогу открыть проход!
  wait 10
  mecho Старик начал слаживать два обломка вместе. 
  mecho Ноги старика подкосились и он сел.
  сесть
  tell %actor.name% Наверное мне не суждено туда пройти, ноги парализовало от старости.
  взд
  __if %world.curobjs(12404)% < 15
  mload obj 12404
  tell %actor.name% Возми этот знак себе, может он тебе пригодится.
  дать знак %actor.name%
end
else
wait 1
tell %actor.name% Конечно мне понятно, что ты хочешь мне помочь в моих поисках.
tell %actor.name% Но это не то что я ищу.
eval getobject %object.name%
броси %getobject.car%.%getobject.cdr%
halt
end
~
#12406
Вход в проход~
2 c 0
установить~
if !(%actor.haveobj(12404)%)
  %send% %actor.name% - Что что?
  halt
end
if !(%arg.contains(знак)%)
  wechoaround %actor% %actor.name% безуспешно попытал%actor.u% что-то сделать.
  wsend %actor.name% Вы так и не поняли что надо делать.
  halt
end
wechoaround %actor% %actor.name% установил%actor.g% знак в надлежащее место.
wsend %actor.name% Вы установили знак, плита со скрежетом отошла в сторону, открывая проход.
wdoor 12403 north flags a
wdoor 12403 north room 12470
wait 5s
wecho Плита медленно встала на место.
wdoor 12403 north purge
~
#12407
атака~
0 r 100
~
eval agr %random.50%+%random.50%
if ( %actor.clan% != НД ) & ( %agr% <= 25 )
  mkill %actor%
elseif %agr% <= 10 
  mkill %actor%
end
~
#12408
zone reset~
2 fg 100
~
detach 12609 %world.room(12666)%
detach 12609 %world.room(12667)%
detach 12609 %world.room(12668)%
attach 12609 %world.room(12666)%
attach 12609 %world.room(12667)%
attach 12609 %world.room(12668)%
~
$~
