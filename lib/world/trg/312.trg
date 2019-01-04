#31200
в тайную комнату~
2 c 1
залезть~
if (!%arg.contains(в шкаф)%
  return 0
  halt
end
wait 1
wsend %actor% Дверца шкафа чуть скрипнула, пропустив вас внутрь узкого коридорчика.
wteleport %actor% 31238
~
#31201
зашли к конюху~
0 r 100
~
wait 1
msend %actor% Конюх сказал : 'Если лошадь нужна, то вы правильно сделали, что зашли ко мне.'
msend %actor% Конюх сказал : 'Оседлаю и снаряжу в путь дальний свежего коня за умеренную плату.., Кун так за 50'
~
#31202
приветсвие стражника~
0 q 100
~
wait 1
if (%actor.clan%==гд)
  if (%actor.clanrank% >= 8)
    msend %actor% При виде Вас, стражник вытянулся в струнку.
    mechoaround %actor% При виде %actor.rname%, стражник вытянулся в струнку.
  else 
    eval rand %random.3%
    if %rand%==1
      сказ %actor.name% "Долгих лет тебе, %actor.name%!"
      mechoaround %actor% Стражник поприветсвовал %actor.rname%.
    elseif %rand%==2
      поклон %actor.name% 
    else
      привет %actor.name%
    end
  end
else
  msend %actor% Стражник хмуро посмотрел на Вас.
  mechoaround %actor% Стражник хмуро посмотрел на %actor.vname%.
end
~
#31203
Князь проходит в тайник~
2 c 1
нажать~
if (!%arg.contains(третий снизу)% || ( %actor.name% != Кирдан ))
  return 0
  halt
end
wait 1
wsend %actor% Вы нажали на третий снизу кирпич, и кирпичная стена, тихонько рокоча, отъехала в сторону.
wteleport %actor% 31255
~
#31204
тригер призрака~
0 n 100
~
wait 1
switch %random.4%
  case 1
    wait 2s
    Призрак старого князя обвел окружающих укоризненным взглядом и потряс бородой
    wait 1s
    г МУА-ХААА-ХАААА! 
    wait 2s
    ворч
    wait 3s
  break
  case 2
    wait 2s
    эмо озадаченно огляделся и вдруг закричал:
    wait 1s
    г Зайца не видали? Такого..  с ушками... ммм?
    wait 2s
  break
  case 3
    wait 2s
    эмо зловеще потряс цепью
    wait 1s
    эмо попытался накинуть цепь на Вашу шею! К сожалению, цепь прошла сквозь Вас, не причинив Вам ни малейшего вреда.
  break
  case 4
    wait 2s
    эмо укоризненно посмотрел на вас и сделал шаг к стене.
    wait 2s
  break
done
mecho Призрак старого князя вдруг истаял в воздухе, оставив Вас в одиночестве.
wait 1
mpurge %self%
~
#31205
кланстаф сыпется~
1 gh 100
~
wait 1
if (%actor.clan% == гд)
  halt
end
osend %actor.name% Вспыхнув белым светом %self.iname% исчез%self.q%...
wait 1
%purge% %self% 
~
#31206
загрузка призрака~
2 z 100
~
wload mob 31211
~
#31207
зал совета старших~
2 c 100
зал~
wait 1
if ( %actor.clanrank% >= 2 )
  wait 1
  wsend %actor% Лицо слуги омрачилось.
  wsend %actor% Слуга сурово сказал Вам : 'Вашего ранга не достаточно чтобы входить в этот зал!'
  wsend %actor% Слуга захлопнул перед Вами дверь.
  halt
end
wechoaround %actor% %actor.name% уш%actor.y% на запад.
wteleport %actor% 31225
wechoaround %actor% %actor.name% приш%actor.y% с востока.
~
#31208
топаем у коня~
0 c 0
топнуть~
wait 1
if ((%actor.clan%==гд) && (%self.leader% == %actor%))
  mechoaround %actor% %actor.name% топнул%actor.g% ногой.
  msend %actor% Вы громко топнули ногой.
  mload obj 31233              
  дать свисток %actor.iname%
  msend %actor% Крылатый конь фыркнул, расправил крылья и улетел.
  mechoaround %actor% Крылатый конь фыркнул, расправил крылья и улетел.
  wait 1 
  mpurge %self%
else
  mechoaround %actor% %actor.name% топнул%actor.g% ногой и удивился, что ничего не
  происходит.    
  mechoaround %actor% Крылатый конь посмотрел на %actor.vname% и сказал: 'Чего
  растопал%actor.u% то человечина?'
  msend %actor% Крылатый конь посмотрел на Вас и сказал: 'Чего растопал%actor.u% то
  человечина?'
end
~
#31209
свистим в свисток~
1 c 3
свистнуть~
wait 1
if (%actor.clan%==гд)
  osend %actor% Bы свистнули в чудо-свисток.
  oechoaround %actor% Поднялся сильный ветер! Из рук %actor.rname% вырвался странный предмет и исчез.
  osend %actor% Поднялся сильный ветер! Свисток вырвался из Ваших рук и исчез.
  oecho И откуда ни возьмись прилетел крылатый конь.
  oload mob 31203
  oforce %actor% оседлать конь      
  wait 1 
  opurge %self%
else
  oechoaround %actor% %actor.iname% попытал%actor.u% свистнуть в чудо-свисток, но у него ничего не получилось.
  osend %actor% Bы попытались свистнуть в чудо-свисток, но у Вас ничего не получилось.
end
~
#31210
дали деньги конюху~
0 m 1
~
wait 1
if (%amount% < 50)
  msend %actor% Да за такие деньги даже солому не купишь, не то чтобы еще и лошадей
  прокормить.
  msend %actor% Нет уж, так не пойдет. Давай 50 кун и дело сделке.
else
  msend %actor% Конюх призадумался! Пошарил в кармане и что-то достал.
  msend %actor% Конюх сказал : 'Вот держи этот свисток! Свистни в него и конь сам прилетит
  к тебе.'
  mload obj 31233
  дать свисток %actor.name% 
end
~
#31211
Впустить в тайную комнату~
2 c 1
впустить~
if (%arg.contains(впустить)%  || ( %actor.name% == Кирдан ))
  wdoor 31255 south room 31238
  wait 30s 
  mdoor 31255 south purge
end
~
#31212
охранник встречает чужого~
0 qr 100
~
wait 1
if (%actor.clan%==гд)||(%actor.haveobj(31244)%)
  halt
else
  кричать ТРЕВОГА! ШПИОН В КРЕПОСТИ !
  halt
end
~
#31213
князь открывает проход~
2 c 1
опустить нажать повернуть~
if !%arg.contains(рычаг)%
  wsend %actor% Что вы хотите нажать?
  halt
end
wsend %actor% _Вы нажали на почти невидимый рычажок на краю стола.
wait 2
wsend %actor% Вдруг раздался еле слышный шелест.
wechoaround %actor% %actor.name% подош%actor.y% к столу, что-то там тронул%actor.g%.
wait 1
wecho Один из книжных шкафов отъехал в сторону открыв проход в коридор.
wait 1
wdoor 31255 n room 31238
wdoor 31238 s room 31255
wait 30s 
wdoor 31255 n purge
wdoor 31238 s purge
wecho Шкаф со скрипом вернулся на свое место.
~
#31214
кормим щенка~
0 j 100
~
wait 1
set str %object.name%
set food %str.car%.%str.cdr%
if (%object.type% != 19) || (!%food.contains(мяс)% && !%food.contains(рыб)% &&
  !%food.contains(полок)% && !%food.contains(молоч)%))
  wait 1
  mecho Песик с укором посмотрел Вам в глаза.
  drop %food%
  halt
end
mecho Песик с удовольтсвием скушкал %object.vname%.
wait 1
mpurge %object%
wait 2s
mecho Песик ласково ткнулся в ладошку холодным носиком благодаря за угощение.
~
#31215
загрузка щенка~
0 n 100
~
set exit 1
global exit
~
#31216
князь дает знак~
0 c 100
знак~
wait 1
if (%actor.clan%==гд)
  if (%actor.clanrank%>=8)
    mload obj 31244
    дать знак %actor.iname%
  end
end
~
#31217
тригер щенка~
0 c 1
погладить играть~
if ((%cmd% == погладить) && !%arg.contains(щенка)%)
  msend %actor% вы погладили себя. Мелочь - а приятно!
  halt
end
wait 1
if (%cmd% == погладить)
  mechoaround %actor% %actor.name% ласково потрепал%actor.g% фокстерьера по холке.
  msend %actor% Вы ласково потрепали фокстерьерчика по холке.
  wait 1s
  switch %random.5%
    case 1
      msend %actor% Фокстерьер радостно завилял хвостом и ткунулся головой вам под руку.
      mechoaround %actor% Фокстерьер радостно завилял хвостом и начал ластится под руку
      %actor.rname%.
    break
  done
end
~
#31218
песик прыг!~
2 e 100
~
wait 1
if ((%actor.name% == Кирдан) && (%exit% == 1))
  set exit 0
  global exit
  msend %actor% К вам бросился бело-рыжый вихрь и радостно заскакал вокруг вас бешенно виляя
  палочкой-хвостиком. 
  wait 1s
  msend %actor% А на вашем любом диванчике, судя по всему, кто-то сейчас лежал!
end
~
#31219
Сброс мусора~
2 g 100
~
wait 1
if %actor.vnum% == 31221
  wforce %actor% drop all
  wforce %actor% south
end
~
#31220
Триг бабки~
0 b 18
~
get all
set victim %random.pc%
switch %random.3%
  case 1
    ворч
  break
  case 2
    г Намусорят тут... а ты убирай...
  break
  case 3
    if %victim%
      say Ходют тут всякие, топчут!
      say Слыш, ты, ноги убери!
      emot шоркнула метлой по ногам %victim.rname%
    end
  break
done
if %random.10% != 7
  halt
end
while %self.realroom% != 31250
  switch
  case 31228
    north
  break
  case 31218
    case 31217
      case 31246
        case 31222
          east
        break
        case 31223
          case 31248
            case 31220
              case 31216
                case 31221
                  case 31203
                    west
                  break
                  case 31224
                    west
                    case 31207
                      west
                    break
                    case 31226
                      east
                      case 31205
                        east
                      break
                      case 31225
                        west
                        case 31210
                          west
                        break
                        case 31249
                          east
                          case 31245
                            east
                            case 31244
                              south
                              case 31243
                                up
                                case 31206
                                  east
                                break
                                case 31247
                                  south
                                  case 31219
                                    south
                                    case 31215
                                      открыть дверь
                                      south
                                      закрыть дверь
                                      case 31214
                                        down
                                      break
                                      case 31227
                                        west
                                        case 31212
                                          west
                                          case 31204
                                            north
                                            case 31213
                                              west
                                            break
                                            case 31229
                                              south
                                              case 31200
                                                south
                                                case 31201
                                                  south
                                                  case 31202
                                                    south
                                                    case 31208
                                                      south
                                                      case 31209
                                                        west
                                                        case 31211
                                                          north
                                                        done
                                                        wait 2
                                                      done
                                                      south
                                                      west
                                                      west
~
#31221
Маршрут до кладовки~
0 z 100
~
while %self.realroom% != 31250
  switch
  case 31228
    north
  break
  case 31218
    case 31217
      case 31246
        case 31222
          east
        break
        case 31223
          case 31248
            case 31220
              case 31216
                case 31221
                  case 31203
                    west
                  break
                  case 31224
                    west
                    case 31207
                      west
                    break
                    case 31226
                      east
                      case 31205
                        east
                      break
                      case 31225
                        west
                        case 31210
                          west
                        break
                        case 31249
                          east
                          case 31245
                            east
                            case 31244
                              south
                              case 31243
                                up
                                case 31206
                                  east
                                break
                                case 31247
                                  south
                                  case 31219
                                    south
                                    case 31215
                                      открыть дверь
                                      south
                                      закрыть дверь
                                      case 31214
                                        down
                                      break
                                      case 31227
                                        west
                                        case 31212
                                          west
                                          case 31204
                                            north
                                            case 31213
                                              west
                                            break
                                            case 31229
                                              south
                                              case 31200
                                                south
                                                case 31201
                                                  south
                                                  case 31202
                                                    south
                                                    case 31208
                                                      south
                                                      case 31209
                                                        west
                                                        case 31211
                                                          north
                                                        done
                                                        wait 1s
                                                      done
~
#31222
Не пущаем бабку~
2 g 100
~
if %actor.vnum%  == 31221
  return 0
  halt
end
~
#31223
Вход в башню~
2 c 1
подняться~
if (!%arg.contains(в башню)% || ( %actor.name% != Ведрусса ))
  return 0
  halt
end
wait 1
wsend %actor% Вы тихонько отворили узкую потайную дверцу и поспешили вверх по винтовой лестнице
wteleport %actor% 31253
~
#31224
Выйти из башни~
2 c 1
спуститься~
if !%arg.contains(в замок)%
  return 0
  halt
end
wait 1
wsend %actor% Вы спустились вниз по лестнице и тихо выскользнули в потайную дверцу.
wteleport %actor% 31211
set exit 1
global exit
calcuid panther 31222 mob
remote exit %panther.id%
~
#31225
Триггер котенка~
0 c 1
погладить играть~
if ((%cmd% == погладить) && !%arg.contains(котенка)%)
  return 0
  halt
end
if ((%cmd% == играть) && !%arg.contains(с котенком)%)
  return 0
  halt
end
wait 1
if (%cmd% == погладить)
  mechoaround %actor% %actor.name% ласково погладил%actor.g% котенка.
  msend %actor% вы погладили котенка по шелковистой шерстке.
  wait 1s
  switch %random.5%
    case 1
      msend %actor% Котенок довольно замурчал и потерлся мордочкой о вашу руку.
      mechoaround %actor% Котенок довольно замурчал и потерлся мордочкой о руку
      %actor.rname%.
    break
    case 2
      mecho Котенок зажмурился от удовольствия, подставляя пушистую грудку под пальцы.
    break
    case 3
      msend %actor% Котенок завалился на ковер и принялся ловить вашу руку мягкими лапами.
      mechoaround %actor% Котенок завалился на ковер и принялся ловить руку %actor.rname%
      лапами.
    break
    case 4
      msend %actor% Котенок ласково потерся боком о вашу ногу, чуть не опрокинув на ковер.
      mechoaround %actor% Котенок ласково потерся о ногу %actor.rname%.
    break
    case 5
      msend %actor% Котенок охватил вашу руку лапами, подставляя мягкие уши под ласку.
      mechoaround %actor% Котенок охватил руку %actor.rname% лапами, подставляя уши под
      ласку.
    break
  done
end
if (%cmd% == играть)
  mechoaround %actor% %actor.name% принял%actor.u% играть с котенком.
  msend %actor% Вы принялись играть с котенком пантеры.
  wait 1s
  switch %random.4%
    case 1
      msend %actor% Котенок припал на передние лапы, и прыгнул вперед, пытаясь поймать вашу
      руку.
      mechoaround %actor% Котенок припал на передние лапы, и прыгнул вперед, пытаясь
      поймать руку %actor.rname%.
    break
    case 2
      mecho Котенок в притворном ужасе отпрыгнул в сторону.
    break
    case 3
      msend %actor% Котенок весело прыгает и ловит вашу руку.
      mechoaround %actor% Котенок весело прыгает и ловит руку %actor.rname%.
    break
    case 4
      msend %actor% Котенок катается по ковру, уворачиваясь от вашей руки.
      mechoaround %actor% Котенок катается по ковру, уворачиваясь от руки %actor.rname%.
    break
  done
end
~
#31226
Кормим котенка~
0 j 100
~
wait 1
set str %object.name%
set food %str.car%.%str.cdr%
if (%object.type% != 19) || (!%food.contains(мяс)% && !%food.contains(рыб)% &&
  !%food.contains(полок)% && !%food.contains(молоч)%))
  wait 1
  mecho Котенок обиженно фыркнул.
  drop %food%
  halt
end
mecho Котенок с аппетитом слопал %object.vname%.
wait 1
mpurge %object%
wait 2s
mecho Котенок облизнулся и принялся вылизывать шерстку.
~
#31227
Триг камина~
2 c 1
разжечь подбросить~
wait 1
if %cmd% == разжечь
  if !%arg.contains(камин)%
    wsend %actor%  Что вы хотите разжечь?
    halt
  end
  if %exist.obj(31277)%
    wsend %actor%  Здесь уже горит огонь!
    halt
  end
  wsend %actor% Вы разожгли камин.
  wechoaround %actor% %actor.name% разожгла камин.
  wload obj 31277
  halt
end
if %cmd% == подбросить
  if !%arg.contains(дрова)%
    wsend %actor%  Что вы хотите подбросить? Котенка? :)
    halt
  end
  if !%exist.obj(31277)%
    wsend %actor% Прежде чем подбрасывать дрова - хотя бы разожгите камин. :)
    halt
  end
  wsend %actor% Вы подбросили несколько поленье в камин.
  wsend %actor% Огонь вспыхнул с новой силой.
  calcuid flame 31277 obj
  wpurge %flame%
  wload obj 31277
end
~
#31228
Горит камин~
1 nz 100
~
oecho &rПламя ярко вспыхнуло в камине, высветив комнату и темные балки над головой.&n
wait 20s
oecho &rЯзыки пламени медленно пляшут в камине.&n
wait 40s
oecho &rОт камина исходит терпкий запах смолы.&n
wait 40s
oecho &rИсходящие от камина волны тепла ласкают кожу.&n
wait 30s
oecho &rДрова в камине потрескивают, испуская струйки искр.&n
wait 45s
oecho &rОгонь в камине чуть-чуть приопал.&n
wait 50s
oecho &rБольшое полено с громким треском развалилось на несколько угольков.&n
wait 40s
oecho &rПламя в камине медленно начинает угасать.&n
wait 50s
oecho &rЯркие сскорки отрываются от горящих дров и уносятся в дымоход.&n
wait 50s
oecho &rПламя приопало, и уже почти не освещает комнату.&n
wait 45s
oecho &rУгли в камине пощелкивают, рассыпаясь в золу.&n
wait 50s
oecho &rКамин почти угас.&n
wait 50s
oecho &rУгли ярко рдеют в полутемной пасти камина.&n
wait 50s
oecho &rКамин затух.&n
wait 1
opurge %self%
~
#31229
Котенок встречает~
0 q 100
~
wait 1
if ((%actor.name% == Ведрусса) && (%exit% == 1))
  set exit 0
  global exit
  восторг
  рад Ведрусс
  wait 2s
  emot катается по ковру от радости
end
~
#31230
Загрузка котенка~
0 n 100
~
set exit 1
global exit
~
#31231
выбор места появления призрака~
2 b 5
~
if ((%world.curmobs(31211)% > 0) || (%weather.sunlight% != ночь))
  halt
end
switch %random.9%
  case 1
    exec 31206 %target1.id%
  break
  case 2
    exec 31206 %target2.id%
  break
  case 3
    exec 31206 %target3.id%
  break
  case 4
    exec 31206 %target4.id%
  break
  case 5
    exec 31206 %target5.id%
  break
  case 6
    exec 31206 %target6.id%
  break
  case 7
    exec 31206 %target7.id%
  break
  case 8
    exec 31206 %target8.id%
  break
  case 9
    exec 31206 %target9.id%
  break
done
~
#31232
комнатки~
2 f 100
~
calcuid target1 31223 room
global target1
calcuid target2 31211 room
global target2
calcuid target3 31287 room
global target3
wait 1
calcuid target4 31206 room
global target4
calcuid target5 31213 room
global target5
calcuid target6 31290 room
global target6
wait 1
calcuid target7 31204 room
global target7
calcuid target8 31262 room
global target8
calcuid target9 31263 room
global target9
~
#31233
смотрим со стены~
2 c 100
взглянуть~
if (%arg% == вниз)
  %send% %actor% Вы взглянули вниз.
  calcuid rom 31229 room
end
if (%arg% == вперед)
  %send% %actor% Вы взглянули вдаль.
  calcuid rom 34400 room
end
if (%arg% == налево)
  %send% %actor% Вы взглянули налево.
  calcuid rom 34400 room
end
if (%arg% == направо)
  %send% %actor% Вы взглянули направо.
  calcuid rom 34400 room
end
foreach char %rom.char%
  %send% %actor% Вдали от замка вы увидели %char.name%.
done
~
#31234
спрыгиваем в ров~
2 c 4
спрыгнуть~
wait 1
if (%arg% == ров)
  %send% %actor% Вы аккуратно спрыгнули с моста в ров.
  %teleport% %actor.name% 31239
  halt
else
  %send% %actor% Куда спрыгивать будем?
  halt
end
~
#31235
песик хочет спатки!~
0 bz 4
~
mecho Песик направился к любимому диванчику но покосился на Вас и передумал.
~
#31236
пристают к девушке~
2 cz 0
ущипнуть~
if ((%cmd% == ущипнуть) && !%arg.contains(девушку)%)
  mechoaround %actor% %actor.name% ущипнул%actor.u% девушку за аппетитную попку.
  msend %actor% Вы ущипнули девушку за аппетитную попку.
  wait 1s
  switch %random.4%
    case 1
      msend %actor% Девушка влепила Вам звонкую пощечину.
      mechoaround %actor% Девушка влепила звонкую пощечину %actor.rname%.
    break
    case 2
      mecho Девушка зарделась как мак и ошошла подальше.
    break
  done
end
~
#31237
жизнедеятельность щенка~
0 b 8
~
get all
set victim %random.pc%
switch %random.3%
  case 1
    emot радостно гавкнул : Гав-Гав!
  break
  case 2
    mecho Песик вскочил на ноги, покрутился вокруг себя и чуть вздохнув прилег у ваших ног.
  break
  case 3
    if %victim%
      emot подбежал к ногам %victim.rname%, обнюхал и завилял хвостом
    end
  break
done
~
#31238
Команда щенку~
0 d 1
фу!~
паник
брос все
скулить
~
$~
