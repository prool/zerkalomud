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
$~
