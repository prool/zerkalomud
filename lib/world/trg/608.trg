#60800
Засада на воде.~
2 e 100
~
wait 1
wecho _Послышались крики и в небо устремились тучи стрел.
wecho  Град стрел обрушился на Вас причиняя страшную боль.
foreach fchar %self.pc%
  wdamage %fchar% %random.100%
done
~
#60801
Засада на берегу~
2 g 100
~
wait 1s
wecho Хорошее место для засады, подумали Вы.
wait 1s
wecho - ГРАБЬ !!!! УБИВАЙ !!! ОТОМСТИМ ЗА ОБИДЫ НАШИМ ВОРОГАМ !!!,-раздалось откуда то сверху.
wait 1
wecho Откуда то с верху тут же спрыгнуло несколько человек которые набросились на Вас!
wload mob 60800 
wload mob 60800 
wload mob 60800 
wload mob 60801
calcuid zas 60838 room
detach 60801 %zas.id%
~
#60802
Засада на берегу 2~
2 g 100
~
wait 5s
wecho Хорошее место для засады, подумали Вы.
wait 1s
wecho - ГРАБЬ !!!! УБИВАЙ !!! ОТОМСТИМ ЗА ОБИДЫ НАШИМ ВОРОГАМ !!!,-раздалось откуда то сверху.
wait 1
wecho Откуда то сверху тут же спрыгнуло несколько человек которые набросились на Вас!
wload mob 60800 
wload mob 60800 
wload mob 60800 
wload mob 60801
calcuid zasd 60852 room
detach 60802 %zasd.id%
~
#60803
Старушка~
0 r 100
~
wait 1
switch %direction%
  case north
    if (%self.realroom% == 60852)
      set dontletgo на восток
    else
      set dontletgo на юг
    end
  break
  case south
    set dontletgo на север
  break
  case east
    set dontletgo на север
  break
  default
    set dontletgo куда-либо
  break
done
msend       %actor% %self.iname% схватила Вас за ноги, не позволяя пройти %dontletgo%.
mechoaround %actor% %self.iname% схватила %actor.vname% за ноги, не позволяя пройти %dontletgo%.
say Дай миллион... Дай миллион...
say Ну дай миллион!!!
wait 1s
say НЕ ДАЕШЬ ТАК УМРИ!!!
~
$~
