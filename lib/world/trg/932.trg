#93200
Смерть алмыса~
0 f 0
~
if (%world.curobjs(93202)% < 5)
  mload obj 93202
end
~
#93201
Снять медвежонка~
2 c 1
снять спустить вынести~
if (%exist.mob(93203)%) && (%actor.vnum% == -1)
  if (%arg%==медвежонка)
    wait 1s
    wsend %actor% Вы сняли медвежонка с дерева и вынесли его из огня.
    wait 1s
    calcuid malmedv 93203 mob
    wpurge %malmedv%
    wteleport %actor.name% 93246
    wechoaround %actor% ~~%actor.name% снял%actor.g% медвежонка с дерева и вынес%actor.q% его из огня.
    makeuid malmkvestor %actor.id%
    calcuid gdemedv 93269 room
    remote malmkvestor %gdemedv.id%
    calcuid uskaly 93250 room
    remote malmkvestor %uskaly.id%
    halt
  else
    wsend %actor% Кого вы хотите снять?
  end
end
~
#93202
Вороны~
2 b 100
~
wecho - Карр! - сказал ворон.
wait 1s
wecho - Кар-кар! - отозвался другой ворон.
~
#93203
Росинки~
2 c 1
пить выпить испить слизнуть~
if (%arg%==росинки) && (%actor.position%==5) && (%actor.vnum%==-1)
  wait 1s
  wsend %actor% Вы выпили две светлые росинки.
  calcuid gdevorony 93250 room
  attach 93204 %gdevorony.id%
  run 93204 %gdevorony.id%
  detach 93202 %self.id%
  detach 93203 %self.id%
else
  wait 1
  wsend %actor% Низко-низко росинки висят, у земли самой, не достать...
end
~
#93204
Вороны рассказывают~
2 z 1
снять спустить вынести~
calcuid rosinki 93209 obj
wpurge %rosinki%
calcuid uskaly 93250 room
detach 93203 %uskaly.id%
detach 93202 %uskaly.id%
wait 2s
wecho Едва вы проглотили росинки, как сразу поняли, о чем между собой два ворона говорят.
wait 2s
wecho - Карр, много теперь поживы нам, воронам.
wecho - Кар-кар, люди прошли, лес подожгли, реку взбаламутили, много зверей побили.
wecho - Карр, а медведя желто-черного не нашли.
if %malmkvestor%
  wecho - Кар-кар, да, а слышал ли ты, брат мой, %malmkvestor.name% медвежонка из огня спас%malmkvestor.q%?
  wecho - Карр, как же. То ведь не просто медвежонок, а сын желто-черного медведя.
  wecho - Кар-кар, медведь теперь %malmkvestor.vname% хорошо примет, только дороги к нему не найти.
  wecho - Карр, дорога-то рядом. Стоит только у завала с южной стороны камень вытащить...
end
wait 1s
wecho - Кар-кар, если ты не объелся еще, брат мой, поспешим на болото.
wecho - Жеребенок там увяз.
wait 2s
wecho Хлопая крыльями, оба ворона улетели.
calcuid voron1 93231 mob
calcuid voron2 93234 mob
wpurge %voron1%
wpurge %voron2%
~
#93205
Вытащить камень~
2 c 1
вытащить убрать сдвинуть отодвинуть вынуть~
if (%arg%==камень)
  wait 1s
  wsend %actor% Вы вытащили камень из дыры, он оказался тонким как пластинка.
  wechoaround %actor% %actor.name% вытащил камень из дыры, он оказался тонким как пластинка.
  wait 1
  wecho Теперь можно пролезть на ту сторону.
  wdoor 93253 west room 93252
  wdoor 93252 east room 93253
  detach 93205 %self.id%
else
  wsend %actor% Что вы хотите вытащить?
end
~
#93206
Танзаган появляется~
2 e 20
~
wait 1
wecho Вдруг навстречу вам выехал старичок Танзаган на маленьком кауром коне.
wait 1s
wecho Старичок Танзаган сказал : 'Куда путь держите?'
wload mob 93200
wait 20s
if %exist.mob(93200)%
  wecho Старичок прутиком своего каурого конька стегнул, и нет его, будто и не было.
end
calcuid tanzagan 93200 mob
detach 93207 %tanzagan.id%
wpurge %tanzagan%
detach 93206 %self.id%
~
#93207
Танзаган рассказывает~
0 d 1
*~
if (%actor.vnum% != -1)
  halt
end
if (%speech.contains(далеко)%) || (%speech.contains(туда)%) || (%speech.contains(каан)%)
  calcuid poyavl 93206 room
  detach 93206 %poyavl.id%
  wait 1s
  г Живет на холмистом Алтае Ер-боко-каан.
  г Скота у него - хоть три дня считай, не сосчитаешь.
  г Добро его ни в какой шатер не спрячешь.
  г Думал он, что нет на земле никого сильнее его.
  wait 2
  г Но... я видать не видал, а слыхать слыхал:
  г У истока семи рек, на подоле семи гор есть глубокая, в семьдесят сажен, пещера.
  г В той пещере живет, спереди желтый, сзади черный, медведь.
  г Вот кто силен, говорят, вот кто могуч!
  wait 2s
  mecho Сказал - и нет старика. Где стоял каурый конь - трава примята, куда ускакал - следа не видно.
  makeuid tanzkvestor %actor.id%
  if %exist.mob(93201)%
    calcuid kaan1 93201 mob
    remote tanzkvestor %kaan1.id%
  end
  if %exist.mob(93235)%
    calcuid kaan2 93235 mob
    remote tanzkvestor %kaan2.id% 
  end
  mpurge %self%
end
~
#93208
Медведь орет~
0 b 100
~
switch %random.3%
  case 1
    mecho \&YМа-аш! - заревел медведь.\&n
  break
  case 2
    mecho \&YМа! Мааш! - заревел медведь.\&n
  break
  default
    mecho \&YМмааш! - заревел медведь.\&n
  break
done
~
#93209
Медведь выходит~
2 e 100
~
wait 1
* Большой медведь выходит, если в комнате есть чар, снявший медвежонка.
* После разговора нужно следовать за медведем, он прибежит прямо в шатер к каану.
set igr %self.people%
while %igr%
  if (%igr% == %malmkvestor%)
    wait 2s
    wload mob 93233
    wload mob 93202
    wecho Семьдесят медведей вышли из пещеры.
    wecho У каждого в лапах берестяной поднос с едой, на голове кожаный ташаур с питьем.
    wecho Впереди них медленно выступал огромный желто-черный зверь.
    wait 4s
    wsend %igr% Близко-близко он к вам подошел, низко-низко свою голову склонил.
    wechoaround %igr% Близко-близко он к %igr.dname% подошел, низко-низко свою голову склонил.
    wait 3s
    wecho - Ты для меня, %igr.name%, утреннее солнце, вечерняя луна, - сказал желто-черный медведь.
    wait 3s
    wecho - Ты моего сына из огня спас.
    wait 3s
    wecho - Ешь и пей, что хочешь, проси и требуй, чего пожелаешь, подарок выбирай, какой нравится.
    if (%igr% != %kaankvestor%)
      detach 93209 %self.id%
      halt
    end
    wait 4s
    wsend %igr% Вы сказали : 'Угощенья вашего отведать не смею, подарка принять не могу.'
    wechoaround %igr% %igr.name% сказал%igr.g% : 'Угощенья вашего отведать не смею, подарка принять не могу.'
    wait 2s
    wsend %igr% Вы сказали : 'Ер-боко-каан меня за вами послал.'
    wechoaround %igr% %igr.name% сказал%igr.g% : 'Ер-боко-каан меня за вами послал.'
    wait 2s
    wsend %igr% Вы сказали : 'Он вас на цепь посадит, вокруг костра бегать заставит, на огне изжарит.'
    wechoaround %igr% %igr.name% сказал%igr.g% : 'Он вас на цепь посадит, вокруг костра бегать заставит, на огне изжарит.'
    wait 3s
    wecho У медведей на густых ресницах слезы повисли.
    wait 2s
    wecho Побросали они свои подносы с едой, ташауры с питьем и заревели:
    wecho - Разорвем Ер-боко-каана!
    wait 3s
    wecho Большой медведь поднял правую переднюю лапу - все медведи разом смолкли.
    wait 3s
    wecho - Я пойду в шатер Ер-боко-каана, - сказал великан.
    wait 4s
    wecho Спорить с большим медведем звери не посмели. Осушили они с горя все ташауры,
    wecho сьели все угощение и, утирая лапами слезы, пошли в свою глубокую пещеру.
    calcuid medvedi 93233 mob
    wpurge %medvedi%
    wait 4s
    wsend %igr% - Следуй за мной! - приказал вам большой медведь.
    wechoaround %igr% - Следуйте за мной! - приказал большой медведь.
    wait 8s
    wecho Быстрее воды помчался желто-черный медведь к стойбищу каана.
    calcuid bolmedv 93202 mob
    attach 93218 %bolmedv.id%
    run 93218 %bolmedv.id%
    detach 93209 %self.id%
    halt
  end
  set igr %igr.next_in_room%
done
~
#93210
На вход в шатер каана~
2 e 100
~
wait 1
if %exist.mob(93201)%
  foreach igr %self.pc%
    if %igr.eq(6)%
      wsend %igr% Ер-боко-каан даже не взглянул на вас.
      wsend %igr% Два свирепых палача схватили вас за ноги и вышвырнули из шатра.
      wechoaround %igr% Два свирепых палача схватили %igr.vname% за ноги и вышвырнули ^%igr.name% из шатра.
      wdamage %igr% 100
      wteleport %igr% 93225
      %igr.position(6)%
      wechoaround %igr% %igr.name% вылетел%igr.g% из шатра и упал%igr.g% на землю.
    end
  done
end
~
#93211
Выдача плюшек~
2 e 100
~
wait 1
foreach igr %self.pc%
  if (%igr.id% == %polnkvestor.id%)
    if  %polnkvestor.level% < 25 
      detach 93211 %self.id%
      halt
    end
    wait 1
    wecho Вдруг навстречу вам выехал старичок Танзаган на маленьком кауром коне.
    wload mob 93251
    wait 3s
    wecho - Избавил%igr.g% ты, %igr.name%, землю алтайскую от злого каана.
    wecho - За дело это доброе не забудут тебя люди никогда.
    wait 1s
    if (%igr.level% < 27)
      wecho - Становись же опытнее день ото дня.
      %igr.exp(+100000)%
    else
      switch %igr.class%
        case 2
          wecho - Но вот нехорошее ты выбрал себе ремесло... Уходи лучше с Алтая.
        break
        case 3
          wecho - В бою поможет тебе ярость справиться с врагом.
          if !%igr.skill(ярость)%
            wskillturn %igr% ярость set
          elseif %igr.skill(ярость)% < 110
            wskilladd %igr% ярость 3
          end
        break
        case 4
          wecho - Но вот нехорошее ты выбрал себе ремесло... Уходи лучше с Алтая.
        break
        case 5
          wecho - Спасти товарища умей.
          if !%igr.skill(спасти)%
            wskillturn %igr% спасти set
          elseif %igr.skill(спасти)% < 110
            wskilladd %igr% спасти 3
          end
        break
        case 7
          wecho - Волшебством твори меж землями небесные врата.
          if !%igr.skill(врата)%
            wskillturn %igr% врата set
          elseif %igr.skill(врата)% < 110
            wskilladd %igr% врата 3
          end
        break
        case 9
          wecho - Пусть верным помощником будет тебе меч твой.
          if !%igr.skill(длинные лезвия)%
            wskillturn %igr% длинные.лезвия set
          elseif %igr.skill(длинные лезвия)% < 110
            wskilladd %igr% длинные.лезвия 3
          end
        break
        case 10
          wecho - Пусть стрелы, рукой твоей пущенные, как молнии летят.
          if !%igr.skill(дополнительный выстрел)%
            wskillturn %igr% дополнительный.выстрел set
          elseif %igr.skill(дополнительный выстрел)% < 110
            wskilladd %igr% дополнительный.выстрел 3
          end
        break
        case 11
          wecho - Крепчайшую броню умей сковать.
          if !%igr.skill(укрепить)%
            wskillturn %igr% укрепить set
          elseif %igr.skill(укрепить)% < 110
            wskilladd %igr% укрепить 3
          end
        break
        case 12
          wecho  - Пусть рука твоя промаха не знает, когда метнешь ты во врага свое оружие.
          if !%igr.skill(метнуть)%
            wskillturn %igr% метнуть set
          elseif %igr.skill(метнуть)% < 110
            wskilladd %igr% метнуть 3
          end
        break
        case 13
          wecho - Бери силу волшебную от врагов своих в бою.
          if !%igr.skill(сглазить)%
            wskillturn %igr% сглазить set
          elseif %igr.skill(сглазить)% < 110
            wskilladd %igr% сглазить 3
          end
        break
        default
          wecho - Становись же опытнее день ото дня.
          %igr.exp(+100000)%
        break
      done
    end
    wait 2s
    wecho Старичок прутиком своего каурого конька стегнул, и нет его, будто и не было.
    calcuid tanz 93251 mob
    wpurge %tanz%
    detach 93211 %self.id%
  end
done
~
#93212
Дамадж в горящем лесу~
2 ab 100
~
foreach kogo %self.pc%
  switch %random.6%
    case 1
      wsend %kogo% До вас долетели искры пламени.
      wdamage %kogo% 30
    break
    case 2
      wsend %kogo% Удушливый дым проник вам в легкие.
      wdamage %kogo% 50
    break
    case 3
      wsend %kogo% Жар от горящих деревьев доходит до вас.
      wdamage %kogo% 80
    break
    case 4
      wsend %kogo% Языки пламени обожгли вас.
      wdamage %kogo% 100
    break
    case 5
      wsend %kogo% Отлетевшая головешка ударила вас по голове.
      wdamage %kogo% 150
    break
    default
      wsend %kogo% Обгоревшая сосенка подломилась и рухнула прямо на вас.
      wdamage %kogo% 300
    break
  done
done
~
#93213
На вход в шатер каана-2~
0 q 100
~
wait 1
foreach igr %self.pc%
  set item %igr.eq(6)%
  if %item%
    msend %igr% Ер-боко-каан даже не взглянул на вас.
    msend %igr% Два свирепых палача схватили вас за ноги и вышвырнули из шатра.
    mechoaround %igr% Два свирепых палача схватили %igr.vname% за ноги и вышвырнули ^%igr.name% из шатра.
    mteleport %igr% 93225
    wait 1
    *mdamage %igr% 100
    %igr.position(6)%
    mechoaround %igr% %igr.name% вылетел%igr.g% из шатра и упал%igr.g% на землю.
  end
done
wait 5s
if !%bylpoklon%
  foreach char %self.pc%
    mecho Ер-боко-каан приказал : 'Выкиньте этого невежу прочь!'
    msend %char% Два свирепых палача схватили вас за ноги и вышвырнули из шатра.
    mechoaround %char% Два свирепых палача схватили %char.vname% за ноги и вышвырнули ^%char.name% из шатра.
    mteleport %char% 93225
    wait 1
    *mdamage %char% 100
    %igr.position(6)%
    mechoaround %char% %char.name% вылетел%char.g% из шатра и упал%char.g% на землю.
  done
end
~
#93214
Поклониться каану~
0 c 1
покл покло поклон поклониться~
wait 1
set bylpoklon 1
global bylpoklon
г Издалека пришел, странник?
ухм
г Я великий каан, нет на земле никого богаче меня.
крут
г Но недавно проезжал мимо стойбища какой-то старик.
г Он мне про желто-черного медведя рассказал.
г Будто живет тот медведь в глубокой пещере на подоле семи гор.
г Будто он сильнее и могучее меня, великого каана.
г Своих силачей, богатырей и алыпов отправил я искать этого зверя.
г Они воду рек и озер взбаламутили, лес подожгли, но медведя не встретили.
гнев богатырь
гнев алып
г Хотел я их за то казнить лютой смертью.
г Но вот ты, %actor.name%, приш%actor.y% на мое стойбище.
г Если жить хочешь, излови мне медведя, да сюда приведи.
г Здесь, в моем белом шатре, на цепь его посажу.
г Захочу - вокруг костра бегать заставлю, захочу - на костре изжарю.
set kaankvestor %actor%
global kaankvestor
calcuid gdemedv 93269 room
remote kaankvestor %gdemedv.id%
~
#93215
Все разбегаются от медведя~
2 g 100
~
wait 1
if (%actor.vnum%==93202)
  wecho Ма-аш! - рявкнул медведь.
  wecho Храбрые воины, богатыри, алыпы и силачи, побежали, кто куда попрятались от страха.
  wecho Волосы поднялись на голове Ер-боко-каана, сердце чуть не треснуло, печень чуть не лопнула.
  wecho - Ма! Мааш!
  wecho Ер-боко-каан кинулся под топчан, его верные жены влезли в сундуки, крышками прикрылись.
  calcuid bogatyr 93216 mob
  calcuid alyp 93217 mob
  calcuid palatch1 93215 mob
  calcuid palatch2 93242 mob
  calcuid zhena1 93207 mob
  calcuid zhena2 93208 mob
  calcuid erbokokaan 93201 mob
  exec 93223 %bogatyr.id%
  exec 93224 %alyp.id%
  calcuid nbogatyr 93249 mob
  calcuid nalyp 93250 mob
  wteleport %nbogatyr% 93224
  wteleport %nalyp% 93224
  wpurge %palatch1%
  wpurge %palatch2%
  exec 93225 %zhena1.id%
  exec 93226 %zhena2.id%
  calcuid nzhena1 93247 mob
  calcuid nzhena2 93248 mob
  wteleport %nzhena1% 93290
  wteleport %nzhena2% 93290
  exec 93222 %erbokokaan.id%
  wat 93223 wload mob 93246
  wat 93223 wload mob 93246
  attach 93216 %self.id%
  calcuid bear 93202 mob
  attach 93227 %bear.id%
end
~
#93216
Жены вылазят из сундуков~
2 c 1
открыть~
wait 1
if %arg.contains(сундуки)%
  wsend %actor% Вы откинули крышки у сундуков и обнаружили там жен каана.
  wechoaround %actor% %actor.name% откинул%actor.g% крышки у сундуков и вы увидели там жен каана.
  calcuid nzhena1 93247 mob
  calcuid nzhena2 93248 mob
  wteleport %nzhena1% 93226
  wteleport %nzhena2% 93226
  detach 93216 %self.id%
end
~
#93217
Репоп зоны~
2 f 100
~
wdoor 93253 west purge
wdoor 93252 east purge
calcuid uskaly 93250 room
detach 93202 %uskaly.id%
attach 93202 %uskaly.id%
detach 93203 %uskaly.id%
attach 93203 %uskaly.id%
calcuid zaval 93252 room
detach 93205 %zaval.id%
attach 93205 %zaval.id%
calcuid gdetanz 93206 room
detach 93206 %gdetanz.id%
attach 93206 %gdetanz.id%
calcuid gdemedv 93269 room
detach 93209 %gdemedv.id%
attach 93209 %gdemedv.id%
calcuid gdekaan 93226 room
detach 93216 %gdekaan.id%
if %exist.mob(93200)%
  calcuid tanzagan 93200 mob
  attach 93207 %tanzagan.id%
end
if %exist.mob(93202)%
  calcuid bolmedv 93202 mob
  detach 93208 %bolmedv.id%
end
if %exist.mob(93201)%
  calcuid erbokokaan 93201 mob
  detach 93213 %erbokokaan.id%
  attach 93213 %erbokokaan.id%
  detach 93214 %erbokokaan.id%
  attach 93214 %erbokokaan.id%
  rdelete tanzkvestor %erbokokaan.id%
  rdelete bylpoklon %erbokokaan.id%
end
if %exist.mob(93235)%
  calcuid erbokokaan2 93235 mob
  rdelete tanzkvestor %erbokokaan2.id%
end
calcuid plyushki 93213 room
attach 93211 %plyushki.id%
rdelete kaankvestor %gdemedv.id%
rdelete malmkvestor %uskaly.id%
rdelete malmkvestor %gdemedv.id%
rdelete polnkvestor %plyushki.id%
~
#93218
Медведь идет~
0 z 100
~
calcuid gdekaan 93226 room
detach 93210 %gdekaan.id%
attach 93215 %gdekaan.id%
calcuid erbokokaan 93201 mob
detach 93213 %erbokokaan.id%
detach 93214 %erbokokaan.id%
з
wait 3
з
wait 3
з
wait 3
ю
wait 3
з
wait 3
з
wait 3
з
wait 3
з
calcuid zazavalom 93253 room
if !%zazavalom.west%
  wait 1s
  mecho Медведь подцепил камень когтями и вытащил его.
  mdoor 93253 west room 93252
  mdoor 93252 east room 93253
end
wait 3
з
wait 3
з
wait 3
з
wait 3
ю
wait 3
ю
wait 3
з
wait 3
з
wait 3
з
wait 3
з
wait 3
з
wait 3
з
wait 3
з
wait 3
ю
wait 3
з
wait 3
з
wait 3
з
wait 3
з
attach 93208 %self.id%
calcuid gdemedv 93269 room
detach 93209 %gdemedv.id%
~
#93219
Звери нападают~
0 q 100
~
* Звери нападают, если в комнате нет желто-черного медведя
wait 1
if !%exist.mob(93202)%
  halt
end
calcuid bear 93202 mob
if %bear.realroom% == %self.realroom%
  halt
end
set kto %random.pc%
атаковать %kto.name%
~
#93220
Запрет на вход~
2 g 100
~
* Этот триггер нужен, чтобы желто-черный медведь мог пройти от своей пещеры
* до шатра каана, а другие мобы не лезли куда не следует (кроме чармисов).
if (%actor.vnum%==93218) || (%actor.vnum%==93219) || (%actor.vnum%==93220)
  if !%actor.leader%
    return 0
  end
end
~
#93221
Смерть каана~
0 f 1
~
foreach igr %self.pc%
  if (%igr% == %tanzkvestor%)
    set polnkvestor %tanzkvestor%
    calcuid plyushki 93213 room
    remote polnkvestor %plyushki.id%
    halt
  end
done
~
#93222
Трансформация каана~
0 z 1
~
mtransform 93235
~
#93223
Трансформация богатыря~
0 z 1
~
mtransform 93249
~
#93224
Трансформация алыпа~
0 z 1
~
mtransform 93250
~
#93225
Трансформация первой жены~
0 z 1
~
mtransform 93247
~
#93226
Трансформация второй жены~
0 z 1
~
mtransform 93248
~
#93227
зашли к медведю после трансформации каана~
0 q 100
~
wait 1
say Ммааш!
морщ каан
emot повернулся и вышел из шатра
wait 1
%purge% self%
~
$~
