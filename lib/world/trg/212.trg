#21200
Убираем кланстаф~
1 gj 100
~
if ((!%actor.name%) || (%actor.clan% == хтз) || (%actor.vnum% > 0))
  halt
end
wait 1
osend %actor% %self.name% рассыпал%self.u% в ваших руках.
opurge %self%
~
#21201
Бросили что-то на костерище~
2 h 100
~
wait 3
foreach item %self.objects%
  eval name %item.iname%
  if (%item.val3% && (%name.contains(труп)% || %name.contains(останки)%))
    %echo% &M%item.iname% вспыхнул%item.g% ярким пламенем и полностью сгорел%item.g%!&n
    %purge% %item%
  end
done
~
#21202
Лоад коня~
1 c 2
дунуть~
wait 1
if !%arg.contains(свисток)%
  osend %actor% Во что дуть?
  halt
end
osend %actor% Вы дунули в посеребряный свисток.
osend %actor% От свиста у Вас заложило уши.
if %actor.clan% != хтз || %world.curmobs(21208)% > 50
  osend %actor% ...но больше ничего не произошло!
  halt
end
oechoaround %actor% %actor.name% дунул%actor.g% в посеребряный свисток.
oechoaround %actor% От свиста у Вас заложило уши.
oload mob 21208
oecho Пепельный, почти серебряного цвета скакун, примчался по первому зову.
oforce %actor% оседлать пепел.конь
wait 1
opurge %self%
~
#21203
Расседлать коня~
0 c 100
расседлать~
wait 1
if %self.fighting%
  halt
end
if !%arg.contains(коня)%
  msend %actor%  Кого вы хотите расседлать?
  halt
end
if (%actor.clan% != хтз) || (%actor% != %self.leader%)
  msend %actor% Вы не можете его расседлать.
  halt
end
msend %actor% Вы расседлали и отпустили пепельного коня.
mechoaround %actor% %actor.name% расседлал%actor.g% и отпустил%actor.g% пепельного коня.
mload obj 21200
give all .%actor.name%
wait 1
mecho Пепельный конь поскакал прочь и очень скоро скрылся из виду.
wait 1
mpurge %self%
~
#21204
Выдача свистков~
0 m 1
~
* Триг висит на конюхе
wait 1
if %amount% < 50
  wait 2
  say Маловато будет!
  give %amount% кун .%actor.name%
  halt
end
if %world.curobjs(21200)% >= 500
  wait 2
  say Нет больше свистков, кончились!
  give %amount% кун .%actor.name%
  halt
end
wait 2
say Вот, извольте.
mload obj 21200
give all.свисток .%actor.name%
~
#21205
Стражи встречают~
0 h 100
~
if !%actor.canbeseen%
  halt
end
wait 1
if %actor.clan% != хтз && %direction% == north
  calcuid gateroom 21200 room
  foreach guest %gateroom.pc%
    if (%guest.clan% != хтз) && (%guest.canbeseen%)
      eval guests %guests% %guest.name%,
    end
  done
  крич Встречайте гостей, монахи! %guests% добро пожаловать!
end
~
#21206
На монастырь напали~
0 l 30
~
wait 1
makeuid killer %actor.id%
if ( %actor.vnum% != -1 )
  makeuid killer %actor.leader%
end
if %killer.clan% != хтз
  switch %random.5%
    case 1
      крич На нас напа-а-а-али!
    break
    case 2
      крич Убива-а-а-ают, помоги-и-и-ите!
    break
    case 3
      крич Хранители Знаний, к оружию!
    break
    case 4
      крич Всем! Всем! Всем! На монастырь напали, спасайся кто может!
    break
    case 5
      крич Не посрамим монашескую рясу! Мертвые сраму не имут!
    break
  done
end
mdamage %self% %self.hitp%
~
#21207
Потянули книгу~
2 c 4
потянуть~
if !%arg.contains(книг)%
  %send% %actor% Что вы хотите потянуть?
  halt
end
wait 1
if %actor.clan% != хтз
  %send% %actor% Вы потянули за книгу, но ничего не произошло.
  %echoaround% %actor% %actor.name% потянул%actor.g% за книгу, но ничего не произошло.
  halt
end
%send% %actor% Вы потянули за книгу и откуда то из-за шкафа послышался щелчок.
%echoaround% %actor% %actor.name% потянул%actor.g% за книгу и откуда то из-за шкафа послышался щелчок.
wat 21254 %echo% Послышался какой-то щелчок.
wait 1s
%echo% Внезапно весь шкаф сдвинулся назад, словно и не было за ним стены.
%echo% Небольшая секция шкафа отъехала назад и в сторону, открывая лаз на юг.
wat 21254 %echo% Внезапно северная стена придвинулась к Вам.
wat 21254 %echo% Часть стены отъехала в сторону, открывая лаз на север.
%door% 21214 south room 21254
%door% 21254 north room 21214
wait 5s
%echo% Секция шкафа, а затем и он сам, вернулись на свое место, закрыв проход.
wat 21254 %echo% Секция стены, открывшая лаз на север, вернулась на место.
wat 21254 %echo% Стена встала на свое прежнее место.
%door% 21214 south purge
%door% 21254 north purge
~
#21208
Опустить противовес~
2 c 100
опустить~
if !%arg.contains(противовес)%
  %send% %actor% Что вы хотите опустить?
  halt
end
wait 1
%send% %actor% С трудом допрыгнув до ручки, Вы потянули противовес вниз.
%echoaround% %actor% %actor.name%, с трудом допрыгнув до ручки, потянул%actor.g% противовес вниз.
if %actor.clan% != хтз
  %echo% Странно, но ничего не произошло.
  halt
end
%echo% Откуда-то сверху раздался щелчок.
wat 21214 %echo% Послышался какой-то щелчок.
wait 1s
wat 21214 %echo% Внезапно весь шкаф сдвинулся назад, словно и не было за ним стены.
wat 21214 %echo% Небольшая секция шкафа отъехала назад и в сторону, открывая лаз на юг.
%echo% Внезапно северная стена придвинулась к Вам.
%echo% Часть стены отъехала в сторону, открывая лаз на север.
%door% 21214 south room 21254
%door% 21254 north room 21214
wait 5s
wat 21214 %echo% Секция шкафа, а затем и он сам, вернулись на свое место, закрыв проход.
%echo% Секция стены, открывшая лаз на север, вернулась на место.
%echo% Стена встала на свое прежнее место.
%door% 21214 south purge
%door% 21254 north purge
~
#21209
Выдача ключа от сундука~
0 d 100
ключ~
wait 1
if %world.curobjs(21213)% > 4 || %actor.clan% != хтз
  фиг .%actor.name%
  halt
end
%load% obj 21213
%echo% %self.iname% достал из кармана ключ.
дать all.ключ .%actor.name%
~
#21210
Пинаем с ренты темных~
0 bh 100
~
foreach victim %self.pc%
  if %victim.affect(затемнение)%
    wait 1
    г Что это ты, %victim.name%, удумал%victim.g%?
    г Тут ведь люди делом заняты! Ну, или могли бы быть заняты! Долой тьму!
    wait 5s
    if ((%victim.realroom% != %self.realroom%) || (!%victim.affect(затемнение)%))
      halt
    end
    г Ну, я тебя предупреждал!
    %force% %victim% wake
    %force% %victim% stand
    %send% %victim% %self.name% дал Вам крепкого пинка, Вы аж куда-то побежали.
    %echoaround% %victim% %self.name% дал %victim.dname% крепкого пинка, он%victim.g% аж куда-то побежал%victim.g%.
    wait 1
    %force% %victim% n
    %force% %victim% n
    %force% %victim% sit
  end
done
~
#21211
Обзор замка~
2 c 1
осмотреться~
if (%actor.clan% == хтз)
  %send% %actor% Вы внимательно огляделись по сторонам и вот что увидели...
  %echoaround% %actor% %actor.name% внимательно оглядел%actor.u% по сторонам.
  eval roomnum 21200
  while (%roomnum% < 21258)
    calcuid curroom %roomnum% room
    foreach player %curroom.all%
      if ((%player.vnum% < 21200) || (%player.vnum% > 21299)) && (%player.canbeseen%)
        %send% %actor% &C%curroom.name%&n: &R%player.name%&n
      end
    done
    eval roomnum %roomnum%+1
  done
else
  return 0
end
~
#21212
Лаюня кушает~
0 j 100
~
wait 1s
%echo% %self.iname% начал жадно поглощать угощение.
wait 1s
foreach item %self.objs%
  wait 1s
  %echo% %self.iname% принялся жевать %item.vname%.
  wait 1
  %purge% %item%
done
wait 1s
%echo% %self.iname% не глядя стал хватать все что ни попадя.
взять all
foreach item %self.objs%
  wait 1s
  %echo% %self.iname% принялся жевать %item.vname%.
  wait 1
  %purge% %item%
done
wait 1s
if ((%actor.canbeseen%) && (%actor.realroom% == %self.realroom%))
  %send% %actor% %self.iname% закончил трапезу и уставился на Вас, ожидая добавки.
  %echoaround% %actor% %self.iname% закончил трапезу и уставился на %actor.vname%, ожидая добавки.
else
  %echo% %self.iname% закончил трапезу.
end
брос all
~
#21213
Лаюн воет~
2 b 1
~
if %exist.mob(21215)%
  calcuid layun 21215 mob
  eval rnd %random.4%
  switch %rnd%
    case 1
      %force% %layun% say Совсем забыли меня. Не то что кормить, дразнить даже перестали
      %force% %layun% груст
    break
    case 2
      %force% %layun% крич Аууу! Есть кто живой!? Чего не кормите то!?
    break
    case 3
      wzoneecho %self.vnum% _Душераздирающий вой послышался из подземной темницы монастыря.
    break
    case 4
      wzoneecho %self.vnum% _Жуткий скрип доносится из темницы - похоже, кто-то там точит когти.
    break
  done
end
~
#21216
Релоад статуи~
0 h 100
~
wait 1
%load% mob %self.vnum%
%purge% %self%
~
#21217
Статуя рассказывает про арену~
0 n 100
~
*Статуя рассказывает про арену | Mobiles | Load | 100
г Если хочешь потренироваться, могу предложить тренажеры
г Скажи список, если не знаешь из чего можно выбирать
г Если нужно очистить арену - скажи очистить
~
#21218
Очистка арены~
2 z 100
~
* Очистка арены | Rooms | Auto | 100
%echo% Небольшой вихрь пробежался здесь...
foreach victim %self.npc%
  if ((%victim.vnum% > 21200) && (%victim.vnum% < 21299))
    %echo% _ развеял %victim.vname%, словно пепел
    %purge% %victim%
  end
done
~
#21219
Лоад мобов на арене~
2 z 100
~
* Лоад мобов на арене | Rooms | Auto | 100
if ((!%mobtoload%) || (!%roomtoload%))
  halt
end
wat %roomtoload% wload mob %mobtoload%
calcuid victim %mobtoload% mob
wat %roomtoload% wecho %victim.iname% свалил%victim.u% сюда откуда-то сверху.
~
#21220
Говорим со статуей~
0 d 100
*~
* Говорим со статуей | Mobiles | Speech | 100 | *
if (%actor.vnum% != -1)
  halt
end
switch %speech%
  case список
    wait 3
    г Хочешь с водяником биться - скажи водяник.
    г Хочешь с жительницей гати биться - скажи гать.
    г Если истукан нужен тебе в противники - скажи дерево.
    г Если мягкая кукла - скажи кукла.
    г Если с металлическим исполином готов биться - скажи изваяние.
    г Для схватки с крысой Шушарой лютой - скажи крыса.
    г Чтобы с идолом и его защитниками сражаться - скажи идол.
    г А захочешь с князем тьмы воевать - скажи вася.
    г Стражник вышгородский вызовется если скажешь страж.
    г Если нужно очистить арену - скажи очистить.
    halt
  break
  case очистить
    set i 21240
    while (%i% < 21249)
      calcuid troom %i% room
      exec 21218 %troom.id%
      eval i %i%+1
    done
    calcuid troom 21298 room
    exec 21218 %troom.id%
  break
  case водяник
    set mobtoload 21225
  break
  case гать
    set mobtoload 21224
  break
  case дерево
    set mobtoload 21221
  break
  case кукла
    set mobtoload 21222
  break
  case изваяние
    set mobtoload 21223
  break
  case крыса
    set mobtoload 21226
  break
  case идол
    set mobtoload 21227
    set roomtoload 21244
    calcuid troom 21216 room
    remote roomtoload %troom.id%
    remote mobtoload %troom.id%
    exec 21219 %troom.id%
    set mobtoload 21228
    remote mobtoload %troom.id%
    exec 21219 %troom.id%
    set mobtoload 21229
    set roomtoload 21298
    remote roomtoload %troom.id%
    remote mobtoload %troom.id%
    exec 21219 %troom.id%
    exec 21219 %troom.id%
    wait 3
    г Сделано!
    halt
  break
  case вася
    set mobtoload 21230
  break
  case страж
    set mobtoload 21231
  break
done
wait 3
г Сделано!
if (!%mobtoload%)
  halt
end
eval roomtoload 21239+%random.9%
calcuid troom 21216 room
remote roomtoload %troom.id%
remote mobtoload %troom.id%
exec 21219 %troom.id%
~
$~
