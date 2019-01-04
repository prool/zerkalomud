#75000
западная старушка ругается~
0 g 100
~
switch %actor.sex%
  case 1
    осм %actor.iname%
    wait 10
    if %actor.eq(6)%
      г Что ж ты, %actor.iname%, как нехристь какая...
      г В Божий храм в шапке входишь!
      г Людей не стыдишься - так хоть Бога постыдись.
      if %direction% == west
        wait 1
        msend %actor% Смущенные словами старушки, Вы покинули храм.
        mechoaround %actor% Смущенный словами старушки, ~~%actor.iname% покинул храм.
        mteleport %actor% 75044
        mechoaround %actor% ~~%actor.iname% вышел из храма, смущенный.
      end
    end
  break
  case 2
    осм %actor.iname%
    wait 10
    if !%actor.eq(6)%
      г Что ж ты, %actor.iname%, как нехристь какая...
      г В Божий храм с непокрытыми волосами входишь!
      г Людей не стыдишься - так хоть Бога постыдись.
      if %direction% == west
        wait 1
        msend %actor% Смущенные словами старушки, Вы покинули храм.
        mechoaround %actor% Смущенная словами старушки, %actor.iname% покинула храм.
        mteleport %actor% 75044
        mechoaround %actor% %actor.iname% вышла из храма, смущенная.
      end
    end
  break
  default
    осм %actor.name%
    wait 10
    :надолго задумалась
  done
~
#75001
южная старушка ругается~
0 g 100
~
switch %actor.sex%
  case 1
    осм %actor.iname%
    wait 1
    if %actor.eq(6)%
      г Что ж ты, %actor.iname%, как нехристь какая...
      г В Божий храм в шапке входишь!
      г Людей не стыдишься - так хоть Бога постыдись.
      if %direction% == south
        wait 1
        msend %actor% Смущенные словами старушки, Вы покинули храм.
        mechoaround %actor% Смущенный словами старушки, ~~%actor.iname% покинул храм.
        mteleport %actor% 75046
        mechoaround %actor% ~~%actor.iname% вышел из храма, смущенный.
      end
    end
  break
  case 2
    осм %actor.iname%
    wait 1
    if !%actor.eq(6)%
      г Что ж ты, %actor.iname%, как нехристь какая...
      г В Божий храм с непокрытыми волосами входишь!
      г Людей не стыдишься - так хоть Бога постыдись.
      if %direction% == south
        wait 1
        msend %actor% Смущенные словами старушки, Вы покинули храм.
        mechoaround %actor% Смущенная словами старушки, %actor.iname% покинула храм.
        mteleport %actor% 75046
        mechoaround %actor% %actor.iname% вышла из храма, смущенная.
      end
    end
  break
  default
    осм %actor.name%
    wait 1
    :надолго задумалась
  done
~
#75002
леденец лижут~
1 c 3
лизать~
if %arg% != леденец
  osend %actor% Что это вы лизать собрались?
else                  
  osend %actor% Вы лизнули леденец. Вку-усно!
  oechoaround %actor% ~~%actor.iname% с аппетитом лизнул%actor.g% леденец.
  eval lizalki %lizalki%-1 
  global lizalki
  if %lizalki% == 0
    osend %actor% Вы доели леденец и со вздохом отбросили пустую палочку.
    oechoaround %actor% ~~%actor.iname% доел%actor.g% леденец и со вздохом отбросил%actor.g% пустую палочку.
    oload obj 75009
    opurge леденец
  end
end
~
#75003
леденец создался~
1 n 100
~
set lizalki 6
global lizalki
~
#75004
Петух клюет в задницу~
1 gt 5
~
wait 1
osend %actor% _Жареный петух неожиданно клюнул Вас прямо в ...
oechoaround %actor% Жареный петух неожиданно клюнул %actor.vname% прямо в ...
~
#75005
Платный портал, ночь - во Владимир~
0 m 1
~
wait 1
emot пересчитал%self.g% монеты
eval target 0
switch %amount%
  * Владимир
  case 4200
    eval target 18244
  break
  default
    дум
    say И чего же ты за эти деньги хочешь?
    give %amount% кун .%actor.name%
    halt
  done
  кив
  emot сделал%self.g% несколько странных жестов
  mechoaround %actor% %actor.name% исчез%actor.q% в клубах дыма.
  msend %actor% У вас закружилась голова, и на миг вы потеряли сознание...
  msend %actor% 
  mteleport %actor% %target% horse
  mechoaround %actor% %actor.name% появил%actor.u% здесь в клубах дыма.
~
#75006
Платный портал, день - в Корсунь~
0 m 1
~
wait 1
emot пересчитал%self.g% монеты
eval target 0
switch %amount%
  * Корсунь
  case 6100
    eval target 27031
  break
  default
    дум
    say И чего же ты за эти деньги хочешь?
    give %amount% кун .%actor.name%
    halt
  done
  кив
  emot сделал%self.g% несколько странных жестов
  mechoaround %actor% %actor.name% исчез%actor.q% в клубах дыма.
  msend %actor% У вас закружилась голова, и на миг вы потеряли сознание...
  msend %actor% 
  mteleport %actor% %target% horse
  mechoaround %actor% %actor.name% появил%actor.u% здесь в клубах дыма.
~
#75007
Платный портал, приветствие черноволосой~
0 q 100
~
msend %actor% _Девушка прошептала Вам:
msend %actor% ___- Могу перенести тебя во Владимир-город.
msend %actor% ___- 4200 кун, и ты там.
msend %actor% ___- А сестренка моя в Корсунь переносит, кстати.
msend %actor% ___- Только матушке не говори, она не знает, что мы с сестрой
msend %actor% ___  уже и перемещающую магию почти изучили.
~
#75008
Платный портал, приветствие рыжей~
0 q 100
~
msend %actor%  Девушка прошептала Вам:
msend %actor% ___- Могу перенести тебя в городище Корсунь.
msend %actor% ___- 6100 кун, и ты там.
msend %actor% ___- А сестренка моя во Владимир переносит, кстати.
msend %actor% ___- Только матушке не говори, она не знает, что мы с сестрой
msend %actor% _____уже и перемещающую магию почти изучили.
~
$~
