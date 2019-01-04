#95100
игрок прикасается к камню~
1 c 100
прикоснуться~
if !%arg.contains(камень)%
  osend %actor% _И что Вы хотите так любезно облапать?
  halt
end
if %actor.class% == 4
  wait 1
  osend %actor% _Прикоснувшись к камню Вы почувствовали легкое головокружение.
  oechoaround _%actor% %actor.iname% прикоснул%actor.u% к камню и пошатнул%actor.u%,
  wait 4
  oecho _С юга донесся оглушающий грохот.
  odoor 95105 east room 95110 
  odoor 95110 west room 95105  
  
  detach 95100 %self.id%
else 
  osend %actor% _Вы прикоснулись к камню и все вокруг потускнело!
  osend %actor% _Внезапно камень ослепительно сверкнул и 
  osend %actor% _ваше тело пронзила ужасная боль.
  oechoaround %actor% _%actor.iname% прикоснул%actor.u% камню.
  oechoaround %actor% _Письмена на камне внезапно ослепительно вспыхнули!
  oechoaround %actor% _%actor.iname% упал%actor.g% и забил%actor.u% в судорогах!
  odamage %actor% 200
end
~
#95101
репоп~
2 f 100
~
* Закрываем ворота и репоп триггера на камне
wdoor 95105 east purge room 95110 
wdoor 95110 west purge room 95105 
calcuid fromid 95100 obj
attach 95100 %fromid.id% 
* Репоп тригов на новом колдуне
calcuid fromid 95112 mob
attach 95104 %fromid.id%
detach 95105 %fromid.id%
detach 95106 %fromid.id%
detach 95107 %fromid.id%
* Репоп трига на старейшине
calcuid fromid 95111 mob
attach 95103 %fromid.id% 
* Репоп тригов на главном страже
calcuid fromid 95113 mob
detach 95111 %fromid.id%
detach 95112 %fromid.id% 
detach 95113 %fromid.id% 
~
#95102
зашли к седому колдуну~
0 r 100
~
mecho _Седой колдун:
mecho _- А!
mecho _- Еще один воришка пожаловал!
mecho _- А ну, давай я тебя сейчас зажарю!
wait 2s
думать %actor.iname%
mecho _- Хм.
mecho _- Ладно.
mecho _- Ты не похож%actor.g% на воришек, которых я уже устал отгонять от этого места.
mecho  - Но ничего не поделаешь, такова моя судьба.
mecho _- Тогда чего ты хочешь?
~
#95103
зашли к старейшине поселения~
0 r 100
~
wait 5
mecho _Старейшина:
mecho _- Ох. Гости пожаловали.
mecho _- Не вовремя, очень не вовремя.
mecho _- У нас сейчас дел и без вас хватает.
wait 5
mecho  - Хотя, если поможете по-быстрому их уладить, может и уделим вам немного времени.
mecho _- Если хотите помочь, идите к нашему новому колдуну, что живет на северо-востоке.
mecho _- Он Вам все скажет.
mecho  - Еще можете главного стража повидать в юго-восточном посту.
calcuid fromid 95112 mob
detach 95104 %fromid.id%
attach 95105 %fromid.id%
attach 95106 %fromid.id%
attach 95107 %fromid.id%
calcuid fromid 95113 mob
attach 95111 %fromid.id%
attach 95112 %fromid.id%
attach 95113 %fromid.id%
detach 95103 %self.id%
~
#95104
зашли к новому колдуну (без посещения старейшины)~
0 r 100
~
wait 5
mecho _Колдун:
mecho _- Ну чего тебе надо здесь?
mecho _- Иди к старейшине и не мешай мне!
~
#95105
зашли к новому колдуну (после посещения старейшины)~
0 r 100
~
wait 5
mecho _Колдун:
mecho _- А. Меня предупредили, что нашли нам помощь.
mecho _- Ну... как тебя там... %actor.iname%
mecho _- Готов%actor.g% нам помочь?
mecho _- Сразу предупреждаю, задание очень сложное и долгое!
~
#95106
сказали новому колдуну что поможем~
0 d 0
да помогу хорошо~
wait 5
set quester %actor%
global quester
mecho _Колдун:
mecho _- Отлично.
mecho _- Наш старый храм был разрушен после землетрясения.
mecho _- Новый же, расположился очень далеко, за лесом.
mecho _- Который просто кишит злобным зверьем и лесным людом.
wait 5
mecho _- Со зверьем и людом мы научились справляться.
mecho _- Но вот то, что в развалинах старого храма обосновалась
mecho _- Шайка местных лихих людей, это непростительное кощунство.
wait 5
mecho _- Мы бы и сами с ними справились.
mecho _- Но сейчас у нас есть и другие очень важные дела.
mecho _- Вот тебе ключ от ворот, что преграждают путь к старому храму.
mload obj 95112
дать ключ %actor.iname%
wait 5
mecho _- Если ты "попросишь их уйти" из наших развалин.
mecho _- Я думая смогу найти для тебя небольшое вознаграждение..
detach 95105 %self.id%
detach 95106 %self.id%
~
#95107
зашли к новому колдуну после убийства главаря шайки~
0 r 100
~
wait 5
if (!%exist.mob(95109)%) && (%actor.id% == %quester.id%)
  mecho _Колдун:
  mecho _- Я поражен твоей прытью, %actor.iname%.
  mecho _- Шайка больше нас не побеспокоит, и за это тебе огромное спасибо.
  if %actor.class% == 4
    msend %actor% _Колдун внимательно осмотрел Вас.
    mechoaround %actor% _Колдун внимательно осмотрел %actor.rname%.
    mecho _- Я вижу, %actor.iname%, ты хороший наемник.
    mecho _- Думаю, тебе стоит посетить наш новый храм.
    mecho _- И если ты проявишь себя и старейшины тебя заметят.
    mecho _- То у тебя будет шанс получить тайные знания наемников храма.
    wait 5
    mecho _- Давай я напишу тебе записку.
    mecho _- Отнеси ее седому колдуну, что охраняет пентаграмму в задней части старого храма.
    mecho _- Он знает что делать.
    mecho _Колдун взял чистый кусок бересты и начал быстро выскребать на нем какие-то знаки.
    mecho _- Вот, держи.
    mload obj 95123
    дать берест %actor.iname%
    detach 95107 %self.id%
  end
  mecho _- Как я и обещал, вот твоя награда.
  switch %random.4%
    case 1
      mload obj 95121
      дать кольц %actor.iname%
    break
    case 2
      mload obj 95122
      дать брасл %actor.iname%
    break
    default
      mechoaround %actor% _Колдун дал %actor.dname% небольшую кучку кун.
      msend %actor% _Колдун дал вам небольшую кучку кун.
      %actor.gold(+5000)%
    break
  done
  detach 95107 %self.id%
end
~
#95108
убили главаря шайки~
0 f 50
~
mload obj 95120
~
#95109
дали записку седому колдуну~
0 j 100
~
if %object.vnum% == 95123
  wait 1
  mpurge %object%
  mecho _Седой колдун:
  mecho _- А.
  mecho _- Мой ученик нашел еще одного кандидата.
  mecho _- Хорошо.
  mecho _- Я помогу тебе попасть в восточный лес.
  mecho _- Через него идет дорога к новому храму.
  mecho _- Но будь осторожен, теперь там очень опасно.
  mecho _- Держись дороги, и рано или поздно ты придешь на место.
  wait 5
  foreach c %self.pc%
    msend %c% _Старый колдун что-то пробормотал и взмахнул рукой.
    msend %c% _Вы еле смогли устоять на ногах.
    if %c.rentable%
      msend %c% _Где это теперь Вы?
      msend %c% _Что это за глушь?!
      mteleport %c% 95200 followers
    end
  done
else
  mecho _Седой колдун:
  mecho _- Зачем мне эта дрянь?
  брос %object.iname%
end
~
#95110
лезем через завал на дороге~
2 c 100
пролезть~
if !%arg.contains(завал)%  
  halt
end
wechoaround %actor% _%actor.name% полез%actor.q% через завал..
wsend %actor% _Вы полезли через завал на юг.
wteleport %actor% 95122
~
#95111
зашли к главному стражу восточной стены~
0 r 100
~
wait 3
mecho _Главный страж:
mecho _- Эй! А ну стой!
mecho _- Нечего тебе здесь шататься!
mecho _- Еще сожрут тебя, а мне потом отвечай за это.
wait 5
mecho _- Но если ты хочешь умереть, то я могу тебе в этом помочь.
mecho _- Есть у меня задание, не для слабаков!
mecho  - Готов ли ты к этому, %actor.iname%?
~
#95112
сказали фразу главному стражу стены~
0 d 1
да помогу хорошо~
wait 3
set quester2 %actor%
global quester2
mecho _Главный страж:
mecho _- Не ожидал... не ожидал.
mecho _- Ладно.
mecho _- Лесные люди и кикиморы опять слишком близко подошли к стенам.
mecho _- Нужен кто-то, чтобы их отогнал.
mecho _- Если у тебя это получится, я буду очень удивлен.
detach 95111 %self.id%
detach 95112 %self.id%
~
#95113
зашли к главному стражу после зачистки леса~
0 r 100
~
if (!%exist.mob(95119)%) && (!%exist.mob(95120)%) && (%actor.id% == %quester2.id%)
  wait 3
  mecho _Главный страж:
  mecho _- Мне уже доложили о том, что у стен стало опять чисто.
  mecho _- Отличная работа!
  switch %random.5%
    case 1
      if %world.curobjs(95124)% < 2
        mecho _- Вот тебе за твои труды.
        mload obj 95124
        дать клино %actor.name%
      end
    break
    case 2
      if %world.curobjs(95125)% < 2
        mecho _- Вот тебе за твои труды.
        mload obj 95125
        дать лук %actor.name%
      end
    break
    default
      mechoaround _Главный страж дал %actor.dname% большую кучку кун.
      msend %actor% _Главный страж дал вам большую кучку кун.
      %actor.gold(+7000)%
    break
  done
  detach 95113 %self.id%
end
~
#95114
игрока уносит течением~
2 e 20
~
wait 1
wechoaround %actor% _%actor.iname% слишком близко подош%actor.y% к краю моста
wechoaround %actor% _И не удержав равновесия сорвал%actor.u% в бурные воды реки.
wsend %actor% _Вы слишком близко подошли к краю моста и упали в ледяную воду!
wteleport %actor% 95179
wait 2
%actor.wait(3)%
wsend %actor% _Вас выбросило на берег.
~
#95115
убили себлезуба~
0 f 10
~
if (%random.1000% <= 100) && (%world.curobjs(95129)% < 8)
  mload obj 95129
end
~
#95116
убили чернокнижника~
0 f 100
~
nop
~
$~
