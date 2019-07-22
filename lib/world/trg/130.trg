#13000
Вход в западную комнату подготовки~
2 c 100
*~
*Вход в западную комнату подготовки | Rooms | Command | 100 | *
if ((%cmd.mudcommand% != east) && (%cmd.mudcommand% != восток))
  return 0
  halt
end
calcuid rasp 13000 mob
if (%rasp.global(free4all)% == 1)
  set LetHimIn 1
else
  set LetHimIn 0
  set i 1
  while (%i% < 13)
    set temp wfighter%i%
    eval smth %rasp.global(%temp%)%
    if ((%actor.iname% == %smth%) || (%actor% == %smth%))
      set LetHimIn 1
    end
    eval i %i%+1
  done
end
if (%rasp.global(battle)% == 1)
  set LetHimIn 0
end
set i 0
while (%i% <= 20)
  eval item %actor.eq(%i%)%
  if (%item.vnum% > 0)
    set BanMsg 1
  end
  eval i %i%+1
done
if (%BanMsg% > 0)
  set LetHimIn 0
  %send% %actor% Дюжий страж сказал : 'На бой следует идти безо всякой одежды и вещей!'
end
if ((%LetHimIn% == 1) || (%actor.level% > 30) || (%actor% == %rasp.global(master)%))
  %send% %actor% Вы поплелись на восток.
  %echoaround% %actor% %actor.vname% пропустили на восток.
  %teleport% %actor% 13026 horse
  %echoaround% %actor% %actor.vname% пропустили с запада.
  calcuid volsh 13005 mob
  set incoming %actor%
  remote incoming %volsh.id%
  exec 13017 %volsh.id%
else
  %send% %actor% Дюжий страж преградил Вам путь.
end
return 1
~
#13001
Вход в восточную комнату подготовки~
2 c 100
*~
*Вход в восточную комнату подготовки | Rooms | Command | 100 | *
if ((%cmd.mudcommand% != west) && (%cmd.mudcommand% != запад))
  return 0
  halt
end
calcuid rasp 13000 mob
if (%rasp.global(free4all)% == 1)
  set LetHimIn 1
else
  set LetHimIn 0
  set i 1
  while (%i% < 13)
    set temp efighter%i%
    eval smth %rasp.global(%temp%)%
    if ((%actor.iname% == %smth%) || (%actor% == %smth%))
      set LetHimIn 1
    end
    eval i %i%+1
  done
end
if (%rasp.global(battle)% == 1)
  set LetHimIn 0
end
set i 0
while (%i% <= 20)
  eval item %actor.eq(%i%)%
  if (%item.vnum% > 0)
    set BanMsg 1
  end
  eval i %i%+1
done
if (%BanMsg% > 0)
  set LetHimIn 0
  %send% %actor% Дюжий страж сказал : 'На бой следует идти безо всякой одежды и вещей!'
end
if ((%LetHimIn% == 1) || (%actor.level% > 30) || (%actor% == %rasp.global(master)%))
  %send% %actor% Вы поплелись на запад.
  %echoaround% %actor% %actor.vname% пропустили на запад.
  %teleport% %actor% 13031 horse
  %echoaround% %actor% %actor.vname% пропустили с востока.
  calcuid volsh 13004 mob
  set incoming %actor%
  remote incoming %volsh.id%
  exec 13017 %volsh.id%
else
  %send% %actor% Дюжий страж преградил Вам путь.
end
return 1
~
#13002
Выход вверх для управляющего~
2 c 100
*~
*Вход в комнату распорядителя | Rooms | Command | 100 | *
calcuid rasp 13000 mob
if ((%actor% != %rasp.global(master)%) && (%actor.level% < 31))
  return 0
  halt
end
switch %cmd.mudcommand%
  case up
    case вверх
      set fromdir снизу
      set todir вверх
      switch %self.vnum%
        case 13025
          case 13026
            case 13027
              case 13028
                case 13029
                  eval dest 13086
                break
              break
            break
          break
        break
        case 13030
          case 13031
            case 13032
              case 13033
                case 13034
                  eval dest 13094
                break
              break
            break
          break
        break
        default
          eval dest 13090
        break
      done
    break
  break
  case east
    case восток
      if (%self.vnum% == 13026)
        eval dest 13031
        set fromdir с запада
        set todir на восток
      else 
        return 0
        halt
      end
    break
  break
  case west
    case запад
      if (%self.vnum% == 13031)
        eval dest 13026
        set fromdir с востока
        set todir на запад
      else 
        return 0
        halt
      end
    break
  break
  default
    return 0
    halt
  break
done
%send% %actor% Вы поплелись %todir%.
%echoaround% %actor% %actor.iname% уш%actor.y% %todir%.
%teleport% %actor% %dest% horse
%echoaround% %actor% %actor.iname% приш%actor.y% %fromdir%.
return 1
~
#13004
Общаемся с распорядителем~
0 d 100
*~
*Общаемся с распорядителем | Mobiles | Speech | 100 | *
wait 3
if ((%actor.level% <= 30) && (%actor.id% != %master.id%))
  if (%random.10% >= 7)
    say Все управление теперь осуществляется венком.
    say Одень его и напиши &Wарена&n.
    say Так удобнее, поверь мне.
  end
  halt
end
switch %speech.car%
  case очисти
    кричать Очистить арену!
    calcuid troom 13000 room
    exec 13008 %troom.id%
  break
  case слушайся
    eval mastername %speech.words(2)%
    if (%actor.level% > 30) && (%mastername%)
      say Я постараюсь! Пусть только наденет вот это...
      unset master
      global mastername
      if %exist.obj(13000)%
        calcuid venok 13000 obj
        %purge% %venok%
      end
      %load% obj 13000
    else
      say Не буду!
      насуп
    end
  break
  case жребий
    set string %speech.cdr%
    attach 13045 %self.id%
    exec 13045 %self.id%
  break
  case стоп
    attach 13010 %self.id%
    exec 13010 %self.id%
  break
  case старт
    attach 13005 %self.id%
    exec 13005 %self.id%
  break
  case группа
    set string %speech%
    attach 13038 %self.id%
    exec 13038 %self.id%
  break
  case забудь
    attach 13016 %self.id%
    exec 13016 %self.id%
  break
  case объяви
    attach 13026 %self.id%
    exec 13026 %self.id%
  break
  case победил
    eval dir %speech.words(2)%
    attach 13042 %self.id%
    exec 13042 %self.id%
  break
  case открыть
    eval dir %speech.words(2)%
    attach 13041 %self.id%
    exec 13041 %self.id%
  break
  case закрыть
    eval dir %speech.words(2)%
    attach 13043 %self.id%
    exec 13043 %self.id%
  break
  case клубки
    attach 13029 %self.id%
    exec 13029 %self.id%
  break
  case статус
    attach 13034 %self.id%
    exec 13034 %self.id%
  break
  case призвать
    calcuid wstr 13018 room
    calcuid estr 13006 room
    attach 13039 %wstr.id%
    attach 13039 %estr.id%
    exec 13039 %wstr.id%
    exec 13039 %estr.id%
  break
done
~
#13005
Команда старт~
0 z 100
~
*Команда старт | Mobiles | Auto | 100
if (%battle% == 1)
  tell .%mastername% Дак ведь уже бой идет, ты что?
  say Дак ведь уже бой идет, ты что?
  halt
end
кричать Все готовы к бою! Бой начнется через пять секунд!
wait 1s
кричать Четыре!
wait 1s
кричать Три!
wait 1s
кричать Две!
wait 1s
кричать Одна!
wait 1s
кричать Поехали-и-и!
set battle 1
global battle
unset 13025
unset 13030
calcuid troom 13000 room
exec 13006 %troom.id%
detach 13005 %self.id%
~
#13006
Открываем комнаты для боя~
2 z 100
~
*Открываем комнаты для боя | Rooms | Auto | 100
wait 3
%door% 13025 east room 13056
wat 13025 wecho Открылся проход на восток!
%door% 13030 west room 13050
wat 13030 wecho Открылся проход на запад!
%door% 13043 north purge
wat 13043 wecho Проход на север закрылся!
%door% 13063 south purge
wat 13063 wecho Проход на юг закрылся!
wait 3s
wat 13025 wecho Опять голос сверху: 'Ну, чего встали! Пошли, родимые!'
wat 13025 wecho Неведомая сила буквально вышвырнула Вас на ристалище.
wat 13025 wteleport all 13056
wat 13030 wecho Опять голос сверху: 'Ну, чего встали! Пошли, родимые!'
wat 13030 wecho Неведомая сила буквально вышвырнула Вас на ристалище.
wat 13030 wteleport all 13050
~
#13007
Закрываем комнаты после боя~
2 fz 100
~
*Закрываем комнаты после боя | Rooms | Auto | 100
wait 3
%door% 13025 east purge
wat 13025 wecho Проход на восток закрылся!
%door% 13025 north room 13026
wat 13025 wecho Открылся проход на север!
%door% 13026 south room 13025
wat 13026 wecho Открылся проход на юг!
%door% 13030 west purge
wat 13030 wecho Проход на запад закрылся!
%door% 13030 south room 13031
wat 13030 wecho Открылся проход на юг!
%door% 13031 north room 13030
wat 13031 wecho Открылся проход на север!
calcuid wreadyroom 13025 room
attach 13009 %wreadyroom.id%
attach 13011 %wreadyroom.id%
calcuid ereadyroom 13030 room
attach 13009 %ereadyroom.id%
attach 13011 %ereadyroom.id%
%door% 13043 north room 13012
wat 13043 wecho Открылся проход на север!
%door% 13063 south room 13000
wat 13063 wecho Открылся проход на юг!
~
#13008
Очистка арены~
2 z 100
~
*Очистка арены | Rooms | Auto | 100
wait 3
set croom 13025
while (%croom% < 13066)
  wat %croom% wecho Помощники распорядителя пробежались здесь...
  calcuid here %croom% room
  foreach body %here.all%
    if ((%body.vnum% != -1) && (%body.vnum% != 13004) && (%body.vnum% != 13005) && (%body.vnum% != 13011))
      wat %croom% wecho ...затоптали %body.vname%
      %purge% %body%
    end
  done
  eval temp %random.2%
  foreach man %here.pc%
    wat %croom% wsend %man% ...прихватили Вас с собой
    wat %croom% wechoaround %man% ...прихватили %man.vname% с собой
    if (%temp% == 1)
      %teleport% %man% 13006 horse
      %echoaround% %man% %man.vname% вытолкнули сюда с запада.
    else
      %teleport% %man% 13018 horse
      %echoaround% %man% %man.vname% вытолкнули сюда с востока.
    end
  done
  eval croom %croom%+1
done
calcuid bochka 13003 obj
%purge% %bochka%
calcuid bochka 13003 obj
%purge% %bochka%
wat 13025 wload obj 13003
wat 13030 wload obj 13003
~
#13009
Все готовы~
2 d 0
все готовы~
*Все готовы | Rooms | Speech | 100 | все
wait 3
if ((%speech.words(2)% != готовы) || (%direction%))
  exec 13011 %self.id%
elseif (%speech.words(2)% == готовы)
  switch %self.vnum%
    case 13025
      %door% 13026 south purge
      wat 13026 wecho Проход на юг закрылся!
      %door% 13025 north purge
      %echo% Проход на север закрылся!
    break
    case 13030
      %door% 13031 north purge
      wat 13031 wecho Проход на север закрылся!
      %door% 13030 south purge
      %echo% Проход на юг закрылся!
    break
  done
  calcuid rasp 13000 mob
  set %self.vnum% ready
  remote %self.vnum% %rasp.id%
  exec 13012 %rasp.id%
  detach 13009 %self.vnum%
end
~
#13010
Команда стоп~
0 z 100
~
*Команда стоп | Mobiles | Auto | 100
if (%battle% == 1)
  кричать Бой закончен!
  set battle 0
  global battle
  calcuid troom 13000 room
  exec 13007 %troom.id%
  кричать Выходы с ристалища открыты!
else
  tell .%mastername% Дак вроде боя то еще и не начинали
  say Дак вроде боя то еще и не начинали
end
detach 13010 %self.id%
~
#13011
Все готовы?~
2 g 100
~
*Все готовы? | Rooms | Enter | 100
if (%actor.name%)
  wait 1
  %send% %actor% Откуда-то сверху послышалось: 'Все готовы?'
end
~
#13012
Доклад группы о готовности~
0 z 100
~
*Доклад группы о готовности | Mobiles | Auto | 100
wait 3
if (%13025% == ready)
  крич Западная группа готова!
end
if (%13030% == ready)
  крич Восточная группа готова!
end
if ((%13025% == ready) && (%13030% == ready))
  say Не забудь проверить как одеты противники
  tell .%mastername% Не забудь проверить как одеты противники
  calcuid wroom 13025 room
  detach 13040 %wroom.vnum%
end
~
#13013
Венок залоадился~
1 n 100
~
*Венок залоадился | Objects | Load | 100
wait 1
if (%world.curobjs(13000)% > %world.maxobj(13000)%)
  %purge% %self%
else
  %echo% %self.iname% плавно опустился к Вашим ногам.
  calcuid croom %self.room% room
  eval temp %self.put(%croom.id%)%
end
detach 13013 %self.id%
~
#13014
Венок одели~
1 j 100
~
*Венок одели | Objects | Wear | 100
calcuid rasp 13000 mob
wait 3
if (%actor.iname%)
  %echo% %self.iname% &Yвспыхнул &Mразноцветными &Rогнями!&n
  set master %actor%
  set mastername %actor.iname%
  remote master %rasp.id%
  remote mastername %rasp.id%
  wait 3
  %force% %rasp% tell .%mastername% Используй венок для управления удаленно. Введи &Rарена&n
end
~
#13015
Венок сняли~
1 l 100
~
*Венок сняли | Objects | Remove | 100
calcuid rasp 13000 mob
wait 3
%force% %rasp% tell .%rasp.global(mastername)% Я с тобой больше не разговариваю, пока не оденешь венок обратно
%echo% %self.iname% &Wначал светиться ровным белым светом!&n
rdelete master %rasp.id%
rdelete mastername %rasp.id%
~
#13016
Команда забудь~
0 z 100
~
*Команда забудь : Mobiles : Auto : 100
eval num 1
while (%num% < 13)
  set wtemp wfighter%num%
  set etemp efighter%num%
  unset %etemp%
  unset %wtemp%
  eval num %num%+1
done
unset wlist
unset elist
unset wbiglist
unset ebiglist
*сбрасываем готовность групп
unset 13025
unset 13030
*открываем нужные выходы, добавляем нужные триги
%door% 13025 north room 13026
%door% 13026 south room 13025
calcuid wreadyroom 13025 room
attach 13009 %wreadyroom.id%
*останавливаем отсчет
detach 13040 %wreadyroom.id%
%door% 13030 south room 13031
%door% 13031 north room 13030
calcuid ereadyroom 13030 room
attach 13009 %ereadyroom.id%
say Списки групп сброшены, отсчет времени отменен
tell .%mastername% Списки групп сброшены, отсчет времени отменен
detach 13016 %self.id%
~
#13017
Вошли к волшебнице~
0 z 100
~
*Вошли к волшебнице | Mobiles | Auto | 100
if ((!%actor%) && (%incoming%))
  eval victim %incoming%
  unset incoming
else
  eval victim %actor%
end
wait 3
if (!%victim.name%)
  halt
end
if (%LetHimIn%)
  if (!%victim.rentable%)
    кричать %victim.iname% в крови!
    say Пош%victim.y% прочь!
    dg_cast !слово возврата! %victim%
    halt
  end
  say Добро пожаловать, %victim.iname%!
  say Сейчас уберем все лишнее, добавим все нужное
  :прикрыла глаза
  foreach body %self.all%
    if ((%body.vnum% > 0) && (%body.leader% == %victim%))
      %purge% %body%
    end
  done
  eval temp %victim.dispel%
  eval temp %victim.hitp(%victim.maxhitp%)%
  eval temp %victim.restore%
  *dg_cast 'насыщен' %victim% а то алкоголики будут жаловаться
  dg_cast 'вид нев' %victim%
  dg_cast 'вид ноч' %victim%
  say У меня можно &Rполучить&n необходимую экипировку
else
  halt
end
~
#13018
Вошли в комнату чармисов~
2 e 100
~
*Вошли в комнату чармисов : Rooms : Enter PC : 100
calcuid rasp 13000 mob
if ((%actor.level% > 30) || (%actor% == %rasp.global(master)%))
  halt
end
wait 3
%echo% &KСлепой колдун принюхался к чему-то.&n
switch %actor.class%
  case 6
    case 12
      * кудесник *
      * купец *
      %echo% Слепой колдун, кажется, и не двинулся, но народу в комнате прибавилось.
      %load% mob 13010
      %load% mob 13009
      %load% mob 13008
    break
  break
  case 8
    * чернокнижник *
    %echo% Слепой колдун, кажется, и не двинулся, но народу в комнате прибавилось.
    %echo% На ладонях слепого колдуна вспыхнуло яркое пламя !
    %load% mob 13010
    calcuid voevoda 13010 mob
    %load% mob 13009
    calcuid bravman 13009 mob
    %load% mob 13008
    calcuid justguy 13008 mob
    %load% mob 13007
    calcuid poslush 13007 mob
    eval dam %voevoda.maxhitp%+100
    %echo% %voevoda.iname% попал в поток огня и сгорел заживо.
    %damage% %voevoda% %dam%
    %echo% %bravman.iname% попал в поток огня и сгорел заживо.
    %damage% %bravman% %dam%
    %echo% %justguy.iname% попал в поток огня и сгорел заживо.
    %damage% %justguy% %dam%
    %echo% %poslush.iname% попытался забиться в какой-нибудь угол от страха.
  break
done
~
#13019
Убили послушника~
0 f 100
~
*Убили послушника : Mobiles : Death : 100
%echo% &KХмыкнув, слепой колдун призвал еще одного, кажется, такого же послушника.&n
%load% mob 13007
~
#13020
Выдаем турнирную экипировку~
0 c 1
получить~
*Выдаем турнирную экипировку : Mobiles : Command : 100 : получить
wait 3
mjunk all
%load% obj 2188
%load% obj 2182
%load% obj 2005
%load% obj 2031
%load% obj 2049
foreach itm %self.objs%
  eval tmp %itm.effect(+рассыпется)%
  eval tmp %itm.effect(+!рента)%
  eval tmp %itm.effect(+!продать)%
done
switch %actor.class%
  * наем *
  case 4
    %load% obj 1901
    %load% obj 1904
    %load% obj 1907
    %load% obj 1910
    foreach it %self.objs%
      eval tmp %it.effect(+рассыпется вне зоны)%
      eval tmp %it.effect(+рассыпется)%
      eval tmp %it.effect(+!рента)%
    done
    * тать *
    case 2
      %load% obj 13013
      %load% obj 13014
      %load% obj 13015
      %load% obj 13018
      %load% obj 13019
      %load% obj 13022
    break
  break
  * батыр *
  case 3
    %load% obj 13019
    %load% obj 13023
    %load% obj 13024
    %load% obj 13026
    %load% obj 13027
    %load% obj 13028
    %load% obj 13029
  break
  * друж *
  case 5
    %load% obj 13010
    %load% obj 13011
    %load% obj 13013
    %load% obj 13014
    %load% obj 13015
    %load% obj 13016
    %load% obj 13019
    %load% obj 13025
    %load% obj 13029
  break
  * витязь *
  case 9
    %load% obj 13010
    %load% obj 13011
    %load% obj 13013
    %load% obj 13014
    %load% obj 13015
    %load% obj 13016
    %load% obj 13017
    %load% obj 13018
    %load% obj 13019
    %load% obj 13025
    %load% obj 13026
    %load% obj 13027
    %load% obj 13029
  break
  * охот *
  case 10
    %load% obj 13030
    %load% obj 13012
    %load% obj 13010
    %load% obj 13011
    %load% obj 13013
    %load% obj 13014
    %load% obj 13015
    %load% obj 13016
    %load% obj 13019
    %load% obj 13025
    %load% obj 13029
  break
  * кузя *
  case 11
    %load% obj 13010
    %load% obj 13011
    %load% obj 13013
    %load% obj 13014
    %load% obj 13015
    %load% obj 13016
    %load% obj 13017
    %load% obj 13018
    %load% obj 13019
    %load% obj 13024
    %load% obj 13025
    %load% obj 13026
    %load% obj 13027
    %load% obj 13028
    %load% obj 13029
  break
  * купа *
  case 12
    %load% obj 13013
    set i 1
    while (%i% <= 10)
      %load% obj 13014
      eval i %i%+1
    done
    %load% obj 13015
    %load% obj 13016
    %load% obj 13018
    %load% obj 13019
    %load% obj 13029
  break
  default
    %load% obj 13012
    %load% obj 13020
    %load% obj 13021
  break
done
attach 13022 %self.id%
exec 13022 %self.id%
if (%actor.class% == 13)
  eval runenum 600
  while (%runenum% < 646)
    if ((%runenum% != 627) && (%runenum% != 628) && (%runenum% != 631) && (%runenum% != 633) && (%runenum% != 637) && (%runenum% != 644))
      %load% obj %runenum%
    end
    eval runenum %runenum%+1
  done
  %load% obj 2191
  calcuid chest 2191 obj
  eval tmp %chest.effect(+рассыпется вне зоны)%
  eval tmp %chest.effect(+рассыпется)%
  eval tmp %chest.effect(+!рента)%
  eval tmp %chest.effect(+!продать)%
  foreach item %self.objs%
    %item.effect(+рассыпется вне зоны)%
    if (%item.vnum% != 2191)
      eval temp %item.put(%chest%)%
    end
  done
  дать сундук .%actor.name%
end
drop all
~
#13021
Чармисы лоадятся с двуручами~
0 n 100
~
*Чармисы лоадятся с двуручами : Mobiles : Load : 100
wait 1s
%load% obj 13017
wait 1
вооруж двуручник
~
#13022
Превращаем стаф в турнирный~
0 z 100
~
*Превращаем стаф в турнирный : Mobiles : Auto : 100
foreach item %self.objs%
  eval tmp %item.put(%actor%)%
done
%send%       %actor% %self.iname% протянула Вам сверток с экипировкой.
%echoaround% %actor% %self.iname% протянула %actor.dname% сверток с экипировкой.
detach 13022 %self.id%
~
#13023
Персонал стафу не берет~
0 j 100
~
*Персонал стафу не берет : Mobiles : Receive : 100
%send% %actor% Оставь этот %object.vname% себе!
%send% %actor% Наши люди взяток не берут! Только если деньгами!
return 0
~
#13024
Командуем венком~
1 c 1
ар~
*Командуем венком : Objects : Command : 1 : ар
switch %cmd%
  case ар
    case аре
      case арен
        case арена
          wait 3
          %send% %actor% _&WПодсказки по командам&n:
          %send% %actor% 1. &Rарклубки         &n- выложить/убрать клубки, телепортящие в зону со всех рент мира.
          %send% %actor% 2. &Rаргруппа <з|в> <имя> [<имя2> ... <имя12>] &n- указываем списки групп
          %send% %actor% 3. &Rаробъяви         &n- объявить статус арены (если оба состава групп указаны)
          %send% %actor% 4. &Rарпризвать       &n- призвать участников к соответствующим входам
          %send% %actor% 5. &Rароткрыть <з|в|все> &n- открыть комнаты готовности или всеобщий доступ
          %send% %actor% 6. &Rарзакрыть <з|в|все> &n- закрыть комнаты готовности или всеобщий доступ
          %send% %actor% 7. &Rарстарт          &n- начать бой после отсчета 5 секунд
          %send% %actor% 8. &Rарстоп           &n- остановить бой, открыть выходы с арены
          %send% %actor% 9. &Rарпобеда <з|в>   &n- объявить победителем одну из сторон
          %send% %actor% 10.&Rарочисти         &n- уничтожает мобов на ристалище, выгоняет персонажей с ристалища 
          %send% %actor% _                     и комнат подготовки.
          %send% %actor% 11.&Rарзабудь         &n- сброс списков групп
          %send% %actor% 12.&Rарстатус         &n- узнать статус арены (управляющему)
          %send% %actor% 13.&Rарвещать <текст> &n- вещать на всю зону арены (можно и в !телл клетках)
        break
      break
    break
  break
  case арз
    case арза
      case арзаб
        case арзабу
          case арзабуд
            case арзабудь
              wait 3
              calcuid rasp 13000 mob
              attach 13016 %rasp.id%
              exec 13016 %rasp.id%
            break
          break
        break
      break
    break
  break
  case арж
    case аржр
      case аржре
        case аржреб
          case аржреби
            case аржребий
              wait 3
              set string %arg%
              calcuid rasp 13000 mob
              attach 13045 %rasp.id%
              exec 13045 %rasp.id%
            break
          break
        break
      break
    break
  break
  case арв
    case арве
      case арвещ
        case арвеща
          case арвещат
            case арвещать
              wait 3
              set message %arg%
              calcuid troom 13030 room
              remote message %troom.id%
              exec 13025 %troom.id%
            break
          break
        break
      break
    break
  break
  case арс
    case арст
      case арста
        case арстат
          case арстату
            case арстатус
              wait 3
              calcuid rasp 13000 mob
              attach 13034 %rasp.id%
              exec 13034 %rasp.id%
            break
          break
        break
      break
    break
  break
  case ароч
    case арочи
      case арочис
        case арочист
          case арочисти
            wait 3
            calcuid rasp 13000 mob
            %force% %rasp% кричать Очистить арену!
            calcuid troom 13000 room
            exec 13008 %troom.id%
          break
        break
      break
    break
  break
  case арстар
    case арстарт
      wait 3
      calcuid rasp 13000 mob
      attach 13005 %rasp.id%
      exec 13005 %rasp.id%
    break
  break
  case арсто
    case арстоп
      wait 3
      calcuid rasp 13000 mob
      attach 13010 %rasp.id%
      exec 13010 %rasp.id%
    break
  break
  case аро
    case ароб
      case аробъ
        case аробъя
          case аробъяв
            case аробъяви
              wait 3
              calcuid rasp 13000 mob
              attach 13026 %rasp.id%
              exec 13026 %rasp.id%
            break
          break
        break
      break
    break
  break
  case арп
    case арпо
      case арпоб
        case арпобе
          case арпобед
            case арпобеда
              wait 3
              eval dir %arg.car%
              calcuid rasp 13000 mob
              attach 13042 %rasp.id%
              exec 13042 %rasp.id%
            break
          break
        break
      break
    break
  break
  case арпр
    case арпри
      case арприз
        case арпризв
          case арпризва
            case арпризват
              case арпризвать
                wait 3
                calcuid wstr 13018 room
                calcuid estr 13006 room
                attach 13039 %wstr.id%
                attach 13039 %estr.id%
                exec 13039 %wstr.id%
                exec 13039 %estr.id%
              break
            break
          break
        break
      break
    break
  break  
  case арот
    case аротк
      case ароткр
        case ароткры
          case ароткрыт
            case ароткрыть
              wait 3
              eval dir %arg.car%
              calcuid rasp 13000 mob
              attach 13041 %rasp.id%
              exec 13041 %rasp.id%
            break
          break
        break
      break
    break
  break
  case арзак
    case арзакр
      case арзакры
        case арзакрыт
          case арзакрыть
            wait 3
            eval dir %arg.car%
            calcuid rasp 13000 mob
            attach 13043 %rasp.id%
            exec 13043 %rasp.id%
          break
        break
      break
    break
  break
  case арклубки
    wait 3
    calcuid rasp 13000 mob
    attach 13029 %rasp.id%
    exec 13029 %rasp.id%
  break
  case арг
    case аргр
      case аргру
        case аргруп
          case аргрупп
            case аргруппа
              set string группа %arg%
              calcuid rasp 13000 mob
              attach 13038 %rasp.id%
              exec 13038 %rasp.id%
            break
          break
        break
      break
    break
  break
  default
    return 0
  break
done
~
#13025
Команда вещать~
2 z 100
~
%echo% 13245
*Команда вещать : Rooms : Auto : 100
if (%message%)
  wzoneecho 13025 &GРаспорядитель молвит: '%message%'&n
end
~
#13026
Команда объяви~
0 z 100
~
*Команда объяви : Mobiles : Auto : 100
if ((!%wfighter1%) || (!%efighter1%))
  tell .%mastername% Для начала скажи кто в какой группе сражаться будет
  say Для начала скажи кто в какой группе сражаться будет
  halt
end
кричать Западная группа: %wlist%
if (%13025% == ready)
  крич ...готова к бою
end
кричать Восточная группа: %elist%
if (%13030% == ready)
  крич ...готова к бою
end
if (%battle% == 1)
  кричать В данный момент идет бой
end
detach 13026 %self.id%
~
#13027
Клубок - пурж вне зоны~
1 b 100
~
*Клубок - пурж вне зоны : Objects : Random : 100
if ((%self.room% < 13000) || (%self.room% > 13099))
  wait 3
  %echo% %self.iname% растаял в воздухе призрачным белым облачком.
  %purge% %self%
end
~
#13028
Клубок - домой~
1 c 2
домой~
*Клубок - домой : Objects : Command : 100 : домой
wait 3
if ((%startroom%) && %actor.name% && %actor.rentable%)
  %send%       %actor% %self.iname% вспыхнул ярким светом, ослепив Вас.
  %echoaround% %actor% %self.iname% вспыхнул ярким светом, и %actor.iname% исчез!
  %teleport% %actor% %startroom% horse
  wait 3
  %send%       %actor% Протерев глаза, Вы обнаружили, что оказались совсем в другом месте.
  %echoaround% %actor% %actor.iname% появил%actor.u% здесь из вспышки света.
  wait 3
  %echo% %self.iname% растаял в воздухе призрачным белым облачком.
  %purge% %self%
end
~
#13029
Команда клубки~
0 z 100
~
*Команда клубки : Mobiles : Auto : 100
if (!%klubki%)
  tell .%mastername% Светящиеся клубки разбросаны по постоялым дворам Руси-Матушки
  say Светящиеся клубки разбросаны по постоялым дворам Руси-Матушки
  set klubki 1
  global klubki
  calcuid troom 13012 room
  attach 13030 %troom.id%
  exec 13030 %troom.id%
else
  tell .%mastername% Светящиеся клубки исчезли, больше сюда никто не войдет
  say Светящиеся клубки исчезли, больше сюда никто не войдет
  unset klubki
  calcuid troom 13012 room
  attach 13032 %troom.id%
  exec 13032 %troom.id%
end
detach 13029 %self.id%
~
#13030
Клубок - включаем~
2 z 100
~
*Клубок - включаем : Rooms : Auto : 100
eval RentsList1 4056 5000 6049 7038 8010 9007 13589 18253 24074 25076 27018 30266 32480 34404 35040 
eval RentsList2 49987 60036 60288 62001 63030 63671 64035 66069 68051 69091 72043 73050 75000 77053 85146
eval RentsList3 12662 14611 15906 20962 21017 21186 21211 23744 30423 35738 42103 58123 77622 85540 58300
set i 1
while (%RentsList1.words(%i%)%)
  wat %RentsList1.words(%i%)% wload obj 13001
  wat %RentsList2.words(%i%)% wload obj 13001
  wat %RentsList3.words(%i%)% wload obj 13001
  eval i %i% + 1
done
detach 13030 %self.id%
~
#13031
Клубок - на арену~
1 g 100
~
*Клубок - на арену : Objects : Get : 100
if ((%actor.vnum% != -1) || (!%actor.rentable%))
  %send% %actor% Фигушки тебе, а не телепорт на арену!
  return 0
  halt
end
wait 1
eval temp %actor.wait(1)%
eval temp %self.effect(+рассыпется)%
eval temp %self.effect(-!рассыпется)%
eval temp %self.owner(%actor.uniq%)%
set startroom %self.room%
global startroom
%send%       %actor% %self.iname% вспыхнул ярким светом прямо у Вас в руках.
%echoaround% %actor% %self.iname% вспыхнул ярким светом, и %actor.iname% исчез%actor.q%!
%load% obj 13001
eval targetroom %random.2%*12+12988
%teleport% %actor% %targetroom% horse
wait 3
%send%       %actor% Протерев глаза, Вы обнаружили, что оказались совсем в другом месте.
%echoaround% %actor% %actor.iname% появил%actor.u% здесь из вспышки света.
*%send%       %actor% %self.iname% растаял в воздухе призрачным белым облачком.
*%purge% %self%
%send%       %actor% Для возврата на прежнее место используйте команду &Mдомой&n.
attach 13028 %self.id%
detach 13031 %self.id%
~
#13032
Клубок - выключаем~
2 z 100
~
*Клубок - выключаем : Rooms : Auto : 100
while (%exist.obj(13001)%)
  calcuid klubok 13001 obj
  if (%klubok.room%)
    wat %klubok.room% wecho Светящийся клубок растворился, превратившись в призрачное облако.
    wait 1
    %purge% %klubok%
  else
    if (%exist.mob(13000)%)
      calcuid rasp 13000 mob
      %force% %rasp% крич Ой! Кто-то упер клубок в ренту!
    end
    halt
  end
done
~
#13033
Клубок - лоад~
1 n 100
~
*Клубок - лоад : Objects : Load : 100
wait 3
%echo% %self.iname% плавно опустился на землю.
detach 13033 %self.id%
~
#13034
Команда статус~
0 z 100
~
*Команда статус : Mobiles : Auto : 100
if (%wlist%)
  tell .%mastername% Западная группа: %wlist%
  say Западная группа: %wlist%
  if (%13025% == ready)
    tell .%mastername% ...готова к бою
    say ...готова к бою
  end
end
if (%elist%)
  tell .%mastername% Восточная группа: %elist%
  say Восточная группа: %elist%
  if (%13030% == ready)
    tell .%mastername% ...готова к бою
    say ...готова к бою
  end
end
if (%battle% == 1)
  tell .%mastername% Бой запущен!
  say Бой запущен!
else
  tell .%mastername% Бой остановлен!
  say Бой остановлен!
end
if (%klubki% == 1)
  tell .%mastername% Клубки ВКЛючены
  say Клубки ВКЛючены
else
  tell .%mastername% Клубки ВЫКЛючены
  say Клубки ВЫКЛючены
end
detach 13034 %self.id%
~
#13035
Присесть на лавочку~
1 c 4
прис~
*Присесть на лавочку : Objects : Command : 4 : прис
if ((%cmd.mudcommand% == присесть) && (%actor.position% > 6))
  %send% %actor% Вы присели на удобную деревянную лавочку.
  eval temp %actor.position(6)%
  %echoaround% %actor% %actor.iname% присел%actor.g% на лавочку.
  return 1
else
  return 0
end
~
#13036
бой чернозмея - применение дышки~
0 b 100
~
*бой чернозмея - применение дышки : Mobiles : Random : 100
set target %random.pc%
if ((%self.fighting%) && (%target.name%))
  dg_cast 'звук волн' %target%
  dg_cast 'масс страх' %target%
  mecho &rИспепеляющий все на своем пути поток пламени вырвался из пастей двухголового черного змея!&n
  mload mob 13013
  mload mob 13013
elseif ((%self.realroom% > 13040) && (%self.realroom% < 13066))
  mecho &rИспепеляющий все на своем пути поток пламени вырвался из пастей двухголового черного змея!&n
  mload mob 13013
  mload mob 13013
end
~
#13037
дышка черного змея~
0 n 100
~
*дышка черного змея : Mobiles : Load : 100
set dir 0
calcuid troom %self.realroom% room
switch %random.6%
  case 1
    set dir %troom.north%
  break
  case 2
    set dir %troom.east%
  break
  case 3
    set dir %troom.south%
  break
  case 4
    set dir %troom.west%
  break
  case 5
    set dir %troom.up%
  break
  default
    set dir %troom.down%
  break
done
if (%dir%)
  mecho Шквал черного пламени промчался мимо Вас!
  %dir%
  wait 2
  set target %random.pc%
  if (%target%)
    mkill %target%
  end
  wait 7s
  mpurge %self%
else
  calcuid zmey 13012 mob
  if (%zmey.fighting%)
    set target %zmey.fighting%
    mkill %target%
    wait 3s
  end
  wait 2
  mpurge %self%
end
~
#13038
Команда группа~
0 z 100
~
*Команда группа : Mobiles : Auto : 100
wait 3
eval dir %string.words(2)%
eval dir %dir.mudcommand%
if ((%dir% != запад) && (%dir% != восток))
  tell .%mastername% Какая это группа? Указывай сторону света
  say Какая это группа? Указывай сторону света
elseif (!%string.words(3)%)
  tell .%mastername% И кого же ты хочешь определить в группу на %dir%е?
  say И кого же ты хочешь определить в группу на %dir%е?
else
  if (%dir% == запад)
    eval dl w
  else
    eval dl e
  end
  set wordNum 3
  while ((%string.words(%wordNum%)%) && (%wordNum% < 15))
    eval fnum %wordNum%-2
    set temp %dl%fighter%fnum%
    charuid id %string.words(%wordNum%)%
    if %id%
      eval %temp% %id%
      eval tname %id.iname%
      eval tmort %id.remort%
      switch %id.class%
        case 0
          set tclass Лк
        break
        case 1
          set tclass Ко
        break
        case 2
          set tclass Та
        break
        case 3
          set tclass Бо
        break
        case 4
          set tclass На
        break
        case 5
          set tclass Др
        break
        case 6
          set tclass Ку
        break
        case 7
          set tclass Во
        break
        case 8
          set tclass Че
        break
        case 9
          set tclass Ви
        break
        case 10
          set tclass Ох
        break
        case 11
          set tclass Кз
        break
        case 12
          set tclass Кп
        break
        case 13
          set tclass Вл
        break
      done
    else
      tell .%mastername% Персонаж '%string.words(%wordNum%)%' не найден, группа не записана!
      say Персонаж '%string.words(%wordNum%)%' не найден, группа не записана!
      eval num 1
      while (%num% < 13)
        if %dl% == w
          set wtemp wfighter%num%
          unset %wtemp%
        else
          set etemp efighter%num%
          unset %etemp%
        end
        eval num %num%+1
      done
      unset %dl%list
      unset %dl%biglist
      detach 13038 %self.id%
      halt
    end
    if (%list.strlen%)
      set list %list%, %tname%
      set biglist %biglist%, %tname% (%tclass% %tmort%)
    else
      set list %tname%
      set biglist %tname% (%tclass% %tmort%)
    end
    global %temp%
    eval wordNum %wordNum%+1
  done
  tell .%mastername% В группе на %dir%е будут: %list%
  say В группе на %dir%е будут: %list%
  eval temp %dl%list
  eval %temp% %list%
  global %temp%
  eval temp %dl%biglist
  eval %temp% %biglist%
  global %temp%
end
detach 13038 %self.id%
~
#13039
Суммоним участников~
2 z 100
~
*Суммоним участников : Mobiles : Auto : 100
calcuid rasp 13000 mob
if ((!%rasp.global(wfighter1)%) || (!%rasp.global(efighter1)%))
  if (%self.vnum% == 13018)
    %force% %rasp% say Для начала скажи кто в какой группе сражаться будет
    %force% %rasp% tell %rasp.global(mastername)% Для начала скажи кто в какой группе сражаться будет
  end
  detach 13039 %self.id%
  halt
end
if (%self.vnum% == 13018)
  %force% %rasp% крич Призываем поединщиков пройти ко входам на ристалище!
  %force% %rasp% крич На подготовку к бою отводится 5 минут!
  calcuid wroom 13025 room
  attach 13040 %wroom.id%
  exec 13040 %wroom.id%
  set side w
  set napr на восток
elseif (%self.vnum% == 13006)
  set side e
  set napr на запад
end
set i 1
while ((%rasp.global(%side%fighter%i%)%) && (%i% < 13))
  eval victim %rasp.global(%side%fighter%i%)%
  if (%victim.realroom% != %self.vnum%)
    if (%victim.vnum% != -1)
      *Строка ниже - эталон работающего вопреки логике быдлокода!
      %force% %rasp% mteleport .%victim% %self.vnum%
    else
      wat %victim.realroom% wsend %victim% Дюжий страж призвал Вас!
      wat %victim.realroom% wechoaround %victim% Дюжий страж призвал %victim.vname% на ристалище!
      %teleport% %victim% %self.vnum%
    end
    %echoaround% %victim% Дюжий страж призвал %victim.vname%!
    %send% %victim% Дюжий страж сказал : 'Добро пожаловать, проходите %napr%'
  end
  eval i %i%+1
done
detach 13039 %self.id%
~
#13040
Отсчет времени~
2 z 100
~
*Отсчет времени : Rooms : Auto : 100
eval minutes 5
while (%minutes% > 0)
  wait 60s
  eval minutes %minutes%-1
  if (%minutes% > 1)
    wzoneecho %self.vnum% &rДо окончания подготовки осталось %minutes% минуты!&n
  elseif (%minutes% == 1)
    wzoneecho %self.vnum% &rДо окончания подготовки осталась %minutes% минута!&n
  end
done
wzoneecho %self.vnum% &RВремя, отведенное для подготовки участников, вышло!&n
wzoneecho %self.vnum% &RКто не успел, тот проиграл!&n
calcuid rasp 13000 mob
if (%rasp.global(13025)% != ready)
  %door% 13026 south purge
  wat 13026 wecho Проход на юг закрылся!
  %door% 13025 north purge
  %echo% Проход на север закрылся!
  set 13025 ready
  remote 13025 %rasp.id%
end
if (%rasp.global(13030)% != ready)
  %door% 13031 north purge
  wat 13031 wecho Проход на север закрылся!
  %door% 13030 south purge
  wat 13030 wecho Проход на юг закрылся!
  set 13030 ready
  remote 13030 %rasp.id%
end
detach 13040 %self.vnum%
~
#13041
Команда открыть~
0 z 100
~
*Команда открыть : Mobiles : Auto : 100
if (%dir.mudcommand%)
  eval dir %dir.mudcommand%
end
if ((%dir% != запад) && (%dir% != восток) && (%dir% != все))
  tell %mastername% Надо указать сторону света или "все", что открыть?
  say Надо указать сторону света или "все", что открыть?
elseif (%dir% == запад)
  if (!%13025%)
    say А на западе итак все открыто
    tell %mastername% А на западе итак все открыто
    detach 13041 %self.id%
  end
  unset 13025
  %door% 13025 north room 13026
  %door% 13026 south room 13025
  calcuid wreadyroom 13025 room
  attach 13009 %wreadyroom.id%
  кричать Открыт проход в западную комнату для готовых к бою
elseif (%dir% == восток)
  if (!%13030%)
    say А на востоке итак все открыто
    tell %mastername% А на востоке итак все открыто
    detach 13041 %self.id%
  end
  unset 13030
  %door% 13030 south room 13031
  %door% 13031 north room 13030
  calcuid ereadyroom 13030 room
  attach 13009 %ereadyroom.id%
  кричать Открыт проход в восточную комнату для готовых к бою
elseif (%dir% == все)
  set free4all 1
  global free4all
  unset 13025
  unset 13030
  calcuid wreadyroom 13025 room
  calcuid ereadyroom 13030 room
  detach 13009 %ereadyroom.id%
  detach 13011 %ereadyroom.id%
  detach 13009 %wreadyroom.id%
  detach 13011 %wreadyroom.id%
  %door% 13030 south room 13031
  %door% 13031 north room 13030
  %door% 13025 north room 13026
  %door% 13026 south room 13025
  кричать Открыт всеобщий доступ к обоим комнатам подготовки!
end
detach 13041 %self.id%
~
#13042
Команда победил~
0 z 100
~
*Команда победил : Mobiles : Auto : 100
eval dir %dir.mudcommand%
if ((%dir% != запад) && (%dir% != восток))
  say Какая это группа? Указывай сторону света
  tell %mastername% Какая это группа? Указывай сторону света
  detach 13042 %self.id%
elseif (%dir% == запад)
  кричать Западная группа (%wlist%) объявляется победителем!
elseif (%dir% == восток)
  кричать Восточная группа (%elist%) объявляется победителем!
end
wait 3
say Останови бой, сбрось составы групп, очисти арену!
tell %mastername% Останови бой, сбрось составы групп, очисти арену!
detach 13042 %self.id%
~
#13043
Команда закрыть~
0 z 100
~
*Команда закрыть : Mobiles : Auto : 100
if (%dir.mudcommand%)
  eval dir %dir.mudcommand%
end
if ((%dir% != запад) && (%dir% != восток) && (%dir% != все))
  tell %mastername% Надо указать сторону света или "все", что закрыть?
  say Надо указать сторону света или "все", что закрыть?
elseif (%dir% == запад)
  if (%13025%)
    say А на западе итак все закрыто
    tell %mastername% А на западе итак все закрыто
    detach 13043 %self.id%
  end
  set 13025 ready
  global 13025
  %door% 13026 south purge
  %door% 13025 north purge
  calcuid wreadyroom 13025 room
  attach 13009 %wreadyroom.id%
  attach 13011 %wreadyroom.id%
  кричать Проход в западную комнату для готовых к бою закрыт распорядителем
elseif (%dir% == восток)
  if (%13030%)
    say А на востоке итак все закрыто
    tell %mastername% А на востоке итак все закрыто
    detach 13043 %self.id%
  end
  set 13030 ready
  global 13030
  %door% 13031 north purge
  %door% 13030 south purge
  calcuid ereadyroom 13030 room
  attach 13009 %ereadyroom.id%
  attach 13011 %ereadyroom.id%
  кричать Проход в восточную комнату для готовых к бою закрыт распорядителем
elseif (%dir% == все)
  set free4all 0
  global free4all
  set 13025 ready
  set 13030 ready
  global 13025
  global 13030
  calcuid wreadyroom 13025 room
  calcuid ereadyroom 13030 room
  attach 13009 %ereadyroom.id%
  attach 13011 %ereadyroom.id%
  attach 13009 %wreadyroom.id%
  attach 13011 %wreadyroom.id%
  %door% 13026 south purge
  %door% 13025 north purge
  %door% 13031 north purge
  %door% 13030 south purge
  кричать Доступ к обеим комнатам подготовки закрыт распорядителем!
end
detach 13043 %self.id%
~
#13044
Телепорт на арену~
1 c 4
войти~
if (!%actor.iname%)
  %echo% Кто там ломится во врата? Инвиз выключи, да!?
  halt
end
if (%actor.level% < 31)
  %send% %actor% Вы попытались войти во врата, но у Вас ничего не получилось.
  %echoaround% %actor% %actor.iname% попробовал%actor.g% войти во врата, но ничего из этого не вышло.
  halt
end
if %arg.contains(врата)%
  %echoaround% %actor% %actor.iname% проследовал%actor.g% во врата.
  if (%self.room% == 13090)
    %teleport% %actor% 100 horse
  else
    %teleport% %actor% 13090 horse
  end
  %echoaround% %actor% Кто-то вышел из врат!
else
  %send% %actor% Куда войти?
end
~
#13045
Команда жребий~
0 z 100
~
*Бросаем жребий
wait 1
if (%string.car% == новый)
  set str %string.cdr%
else
  %send% %actor% Синтаксис: жребий [новый <группа1> <группа2> ... <группаN>]
  if (!%self.global(fight1)%)
    detach 13045 %self.id%
    halt
  end
  set counter 1
  while (%self.global(fight%counter%)%)
    %send% %actor% %self.global(fight%counter%)%
    eval counter %counter%+1
  done
  detach 13045 %self.id%
  halt
end
set amount %str.words%
if (%amount% < 3)
  say Нечего тут и жребий бросать раз их меньше троих.
  tell %mastername% Нечего тут и жребий бросать раз их меньше троих.
  detach 13045 %self.id%
  halt
end
set list %str%
set fightnum 0
крич В жеребьевке участвуют: %list%
while (%amount% > 2)
  set opponent1 %list.words(%random.num(%amount%)%)%
  set counter 1
  unset newlist
  while (%list.words(%counter%)%)
    if (%list.words(%counter%)% != %opponent1%)
      eval newlist %newlist% %list.words(%counter%)%
    else
      eval amount %amount%-1
    end
    eval counter %counter%+1
  done
  set list %newlist%
  set opponent2 %list.words(%random.num(%amount%)%)%
  set counter 1
  unset newlist
  while (%list.words(%counter%)%)
    if (%list.words(%counter%)% != %opponent2%)
      eval newlist %newlist% %list.words(%counter%)%
    else
      eval amount %amount%-1
    end
    eval counter %counter%+1
  done
  set list %newlist%
  eval fightnum %fightnum%+1
  крич Бой %fightnum%: %opponent1% - %opponent2%
  set fight%fightnum% Бой %fightnum%: %opponent1% - %opponent2%
  global fight%fightnum%
done
eval fightnum %fightnum%+1
if (%amount% == 2)
  крич Бой %fightnum%: %list.words(2)% - %list.words(1)%
  set fight%fightnum% Бой %fightnum%: %list.words(2)% - %list.words(1)%
else
  set rndopponent %list%
  while (%rndopponent% == %list%)
    set rndopponent %str.words(%random.num(%str.words%)%)%
  done
  крич Бой %fightnum%: %list% - %rndopponent% (дополнительный бой)
  set fight%fightnum% Бой %fightnum%: %list% - %rndopponent% (дополнительный бой)
end
global fight%fightnum%
detach 13045 %self.id%
~
#13046
Вошли к коновязи~
2 e 100
~
wait 3
if (%world.curmobs(13006)% <= 50) && (%actor.level% < 31)
  if (%self.vnum% == 13027) && (%direction% == south)
    %echo% Вы заметили замечательную белую лошадь, стоящую у коновязи.
    %load% mob 13006
  elseif (%self.vnum% == 13032) && (%direction% == north)
    %echo% Вы заметили замечательную белую лошадь, стоящую у коновязи.
    %load% mob 13006
  end
end
~
#13047
Таблички с информацией~
1 c 4
присмотреться~
*Таблички с информацией : Objects : Command : 4 : присмотреться
if ((%actor.vnum% != -1) || !%actor.name%)
  halt
end
eval temp %actor.wait(1)%
calcuid rasp 13000 mob
*берем список группы, если нет - пишем что нет
set wlist %rasp.global(wbiglist)%
if (%wlist.strlen% < 1)
  set wlist отсутствует
else
  *проверяем готовность группы
  if (%rasp.global(13025)% == ready)
    set wready к бою готова
  else
    set wready готовится к бою
  end
end
set elist %rasp.global(ebiglist)%
if (%elist.strlen% < 1)
  set elist отсутствует
else
  if (%rasp.global(13030)% == ready)
    set eready к бою готова
  else
    set eready готовится к бою
  end
end
*проверяем не идет ли бой
set battle %rasp.global(battle)%
*начинаем вывод
%send% %actor% Присмотревшись, Вы заметили следующие надписи:
%send% %actor% &WЗападная группа: %wlist%&n
if ((%battle% < 1) && %wready.strlen%)
  %send% %actor% ...%wready%
end
%send% %actor% &WВосточная группа: %elist%&n
if ((%battle% < 1) && %eready.strlen%)
  %send% %actor% ...%eready%
end
if ((%battle% > 0) && %wlist.strlen% && %elist.strlen%)
  %send% %actor% &RСражение уже началось!&n
end
~
#13055
Приставание к копателям~
0 c 1
коп копа копат копать dig~
*Приставание к копателям : Mobiles : Command : 1 : коп копа копат копать dig
eval temp %actor.wait(1)%
return 1
wait 3
%send% %actor% %self.iname% возник прямо перед Вами.
%echoaround% %actor% %self.iname% возник прямо перед %actor.tname%.
%send% %actor% Вы остановились, боясь поранить енота.
wait 5
set digging 1
global digging
exec 13059 %self.id%
~
#13056
Енота убили~
0 fz 100
~
*Енота убили : Mobiles : Death : 100
eval newmob %self.vnum%+1
%load% mob %newmob%
calcuid enot %newmob% mob
if (%question%)
  remote question %enot.id%
end
if (%victim%)
  remote victim %enot.id%
end
~
#13057
Говорим с енотом~
0 d 100
*~
*Говорим с енотом : Mobiles : Speech : 100 : *
wait 3
if (%actor.level% > 30)
  switch %speech.words(1)%
    case цель
      set name %speech.words(2)%
      if (!%name%)
        say Кто же будет целью?
      end
      if (%name.vnum% != -1)
        say Дак ведь он%name.g% моб!
        halt
      end
      eval victim %name.id%
      global victim
      say Цель захвачена! Запуск!
      %echo% %self.iname% убежал за горизонт.
      %teleport% %self% %victim.realroom%
      %echo% %self.iname% прибежал из-за горизонта.
      wait 3
      след .%victim.name%
    break
    case домой
      if (%victim%)
        пока .%victim.name%
      else
        пока
      end
      след я
      unset victim
      unset question
      %echo% %self.iname% убежал за горизонт.
      %teleport% %self% 42740
      %echo% %self.iname% прибежал из-за горизонта.
    break
    case умри
      say Ну ла-а-адно
      if (%self.vnum% < 13058)
        exec 13056 %self.id%
      end
      wait 1
      %echo% %self.iname% вспыхнул и рассыпался в прах.
      %echo% Кровушка стынет в жилах от предсмертного крика %self.rname%.
      %purge% %self%
    break
    case команды
      say Команды могут быть следующие:
      say __цель <Имя_цели>____________
      say __домой______________________
      say __умри_______________________
    break
  done
  halt
end
if ((%actor% != %victim%) || (!%question%))
  halt
end
if ((%question% == 1) && ((%speech% == 4) || (%speech% == четыре)))
  set answerok 1
elseif ((%question% == 2) && ((%speech.contains(енот)% && %speech.contains(зануда)%) || (%speech% == енот)))
  set answerok 1
elseif ((%question% == 3) && ((%speech% == белый) || (%speech% == белого)))
  set answerok 1
elseif ((%question% == 4) && ((%speech% == 10) || (%speech% == десять)))
  set answerok 1
elseif ((%question% == 5) && ((%speech% == 600) || (%speech% == шестьсот)))
  set answerok 1
end
if (%answerok%)
  взд
  say Угадал%actor.g%
  сказ Купала %victim.iname% верно ответил на контрольный вопрос
  пока .%victim.name%
  след я
  unset victim
  unset question
  %echo% %self.iname% убежал за горизонт.
  %teleport% %self% 42740
  %echo% %self.iname% прибежал из-за горизонта.
else
  нет
  сказ Купала %victim.iname% неверно ответил на контрольный вопрос
  exec 13059 %self.id%
end
~
#13058
Енот родился~
0 n 100
~
*Енот родился : Mobiles : Load : 100
wait 3
if %victim%
  след .%victim.name%
else
  say Скажи "команды" чтобы узнать чего я умею
end
detach 13058 %self.id%
~
#13059
Енот спрашивает контрольный вопрос~
0 bz 100
~
*Енот спрашивает контрольный вопрос : Mobiles : Random,Auto : 100
if (!%victim%)
  halt
else
  if (%self.realroom% != %victim.realroom%)
    %echo% %self.iname% убежал за горизонт.
    %teleport% %self% 42740
    %teleport% %self% %victim.realroom%
    %echo% %self.iname% прибежал из-за горизонта.
  end
end
if ((%digging%) && (!%question%))
  set chance 100
  unset digging
else
  set chance %random.100%
end
if (%chance% < 75)
  halt
end
say Отгадаешь загадку, я от тебя и отстану
if (!%question%)
  eval question %random.5%
  global question
end
switch %question%
  case 1
    say Сколько будет два плюс два?
  break
  case 2
    say Как меня зовут?
  break
  case 3
    say Какoгo цвета чистый снег?
  break
  case 4
    say Сколько статей в нашем УКБ?
  break
  case 5
    say На сколько часов садятся боты-копатели?
  break
done
вопр .%vitim.name%
~
$~
