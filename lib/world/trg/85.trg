#8500
лезем на верхушку дуба~
2 c 0
лезть карабкаться забраться~
wait 1
if !%arg.contains(дуб)%
  wsend    %actor% Куда Вы лезть-то собрались?
  halt
end
wsend %actor% Вы начали карабкаться вверх по дереву.
wechoaround %actor% %actor.name% начал%actor.g% карабкаться вверх по дереву.
wait 1s
if %actor.rentable%
  wteleport %actor% 8591 horse     
  wait 1
  wsend %pc% _Вы вскарабкались на верхушку дуба.
  wechoaround %actor% %actor.name% залез%actor.g% на верхушку дуба.
end 
end
~
#8501
спрыгиваем~
2 c 0
прыгнуть спрыгнуть~
wait 1
if !%arg.contains(вниз)%
  wsend    %actor% Определитесь, куда прыгать-то собрались?
  halt
end
wsend %actor% Набравшись смелости, Вы спрыгнули с дуба и приземлились на пятую точку.
wechoaround %actor% %actor.name% спрыгнул%actor.g% с дуба, чуть не сбив Вас с ног.
wait 1
wteleport %actor% 8571 horse     
~
#8502
дуб валим~
2 c 1
рубить валить пилить~
wait 1
if !%arg.contains(дерево)%
  wsend %actor% Что Вы собираетесь уничтожать?
  halt
end
wsend %actor% Вы собрались, чего бы то ни стоило, повалить дерево.
wechoaround %actor% %actor.name% начал%actor.g% придумывать подходящий способ повалить дуб.
wait 1s
wecho __В листве кто-то зашевелился. Сверху на Вас рухнула ошалелая белка.
wload mob 8503
calcuid target 8503 mob
wforce %target% kill .%actor.name%
detach 8502 %self.id%
~
#8503
мужик трепется~
0 q 100
~
wait 5
switch %random.4%
  case 1
    эмо осмотрел Вас и захихикал.
    say И куда это ты в таких шмотках?
  break
  case 2
    say Помоги-ка деревце выбрать да вырубить
    ул
  break
  case 3
    выть
    say и де я? и де я нахожусь?
  break
  case 4
    say Хату новую хочу, чтоб всем завидно было. Надо бы деревце увалить.
    морщ
  break
done
~
#8504
Паромщик называет цену~
0 q 100
~
wait 1
if %self.fighting%
  halt
end
say Поздорову будь. 
say Переправиться хочешь? Это можно.
set j 0
set needgold 30
foreach target %self.pc%
  eval needgold %needgold%+%target.level%*(%target.remort%+1)
  eval j %j%+1
done
if %j% > 1
  say За переправу с вас всех станет...
else 
  say За переправу с тебя будет...
end
mecho Паромщик оценивающе осмотрел вас с ног до головы.
wait 2
say ...%needgold% кун ровно, а коли вплавь - то бесплатно.
ухм
~
#8505
Дали денег паромщику.~
0 m 1
~
wait 1
if %self.fighting%
  рыч
  say Не до тебя сейчас, пш%actor.q% вон!
  halt
end
set needgold 30
foreach target %self.pc%
  eval needgold %needgold%+%target.level%*(%target.remort%+1)
done
mecho Паромщик пересчитал монеты.
wait 1s
if %amount% < %needgold%
  хмур
  say Сказано же - %needgold% кун! И ни куной меньше.
  give %amount% кун .%actor.name%
  halt
end
emot согласно кивнул
wait 1
mecho Паромщик окликнул помощника, и они вместе навалились на ворот.
mecho Паром с плеском и скрипом отвалил от причала.
mdoor 8512 south purge
mdoor 8511 north purge
wait 4s
mecho Паром покачивается на волнах Тверцы.
wait 4s
mecho Уже показались городские пристани.
wait 4s
mecho Паром с деревянным стуком ткнулся в причал.
mdoor 8512 south room 24007
mdoor 24007 north room 8512
wait 2s
say Проходите, господа хорошие, не задерживайте.
wait 5s
if %self.fighting%
  halt
end
mecho Паромщик вытолкал всех с парома.
mforce all stand
foreach target %self.pc%
  mforce %target% south
done
mecho Паромщик с помощником вновь взялись за ворот.
mdoor 8512 south purge
mdoor 24007 north purge
mdoor 8512 south room 8511
mdoor 8511 north room 8512
%self.gold(0)%
~
#8506
смерть душегуба (лоад книги страха)~
0 f 100
~
if (%random.100% < 4) && (%world.curobjs(538)% < 1)
  %load% obj 538
end
~
#8507
Берем птенца сокола~
1 g 100
~
return 0
%send% %actor% Вы протянули руку к птенцу, но он отскочил от Вас и воинственно взъерошил перья.
%echo% Птенец запищал : 'Не подходи! Я чемпион по уку-шу!'
wait 1s
%echo% Внезапно в кустах неподалеку вы услышали какой-то шорох.
%echo% Вам показалось, что в них промелькнуло что-то светло-рыжее.
wait 1s
%echo% Птенец покосился на кусты и нервно сглотнул.
wait 1s
%echo% Впрочем... э-э-э... если ты поможешь мне забраться на дерево, я буду благодарен.
%echo% Поближе к гнезду, так сказать... Поможешь?
attach 8508 %world.room(%self.room%)%
~
#8508
Соглашаемся вернуть птенца~
2 d 1
да хорошу помогу согласен~
wait 1s
%echo% Птенец утвердительно кивнул.
%echo% Птенец сказал : 'Ладно, тогда можешь взять меня в руки.'
detach 8507 %world.obj(8506)%
attach 8509 %world.obj(8506)%
attach 8512 %world.obj(8506)%
detach 8508 %self%
~
#8509
Принесли птенца куда надо~
1 c 2
положить~
if (%arg% != птенца)
  %send% %actor% Кого-чего вы хотите положить?
  halt
end
set gnezdo %world.obj(8507)%
if (%actor.realroom% != %gnezdo.room%)
  %echoaround% %actor% Птенец выглянул из-за пазухи %actor.rname% и задумчиво оглядел местность.
  %send% %actor% Птенец осторожно выглянул наружу и задумчиво оглядел местность.
  wait 1s
  %echo% Птенец сказал : 'Гнезда на горизонте не видно, посижу я лучше тут, здесь теплее.'
else
  %echoaround% %actor% %actor.iname% достал%actor.q% птенца и акуратно поставил%actor.q% его на край гнезда.
  %send% %actor% Вы достали птенца и акуратно поставили его на край гнезда.
  wait 1s
  %echo% Раздувшись от гордости птенец уверенно сделал шаг вперед, и оступившись, кубарем покатился на дно гнезда.
  wait 1s
  %echo% Не успел птенец встать на ноги, как внезапный порыв ветра едва не сбил Вас с ног.
  %echo% Ваши уши заложило от грозного клекота.
  %echo% Когда Вы опомнились и схватились за оружие, оказалось что перед Вами на ветке сидит огромный сокол, 
  %echo% который, судя по всему, почему-то не испытывает к Вам особой симпатии.
  %load% mob 8514
  detach 8512 %self%
  %purge% %self.id%
end
~
#8510
Монолог сокола~
0 n 100
~
wait 2s
say Разорву!! Глаза выклюю!!
эм грозно заклокотал, приближаясь к Вам
wait 1s
if %actor.sex% == 1
  set mest его
else
  set mest ее
end
%echo% Сокол уже был готов набросится на Вас, но вдруг из гнезда раздался писк.
%echo% - Папа, папа! Не губи %actor.rname%! Он%actor.g% меня от смерти спас%actor.q%!
wait 1s
say А вот оно что. Опять из гнезда вылазил?!
дум
wait 1s
say Чем же тебя наградить...
say Придумал! Никто на всем белом свете не летает так красиво и быстро как мы, соколы!
say Хочешь летать научиться?
attach 8511 %self%
detach 8510 %self%
~
#8511
Сокол награждает~
0 d 1
да хочу~
wait 1s
say Хорошо, смотри внимательно!
%echo% Сокол прижался к ветке, подпрыгнул и одним взмахом мощных крыльев взвился в воздух.
%echo% Сделав круг сокол вновь вернулся на ветку.
wait 1s
say Запомнил%actor.g%? Повтори!
wait 1s
%echoaround% %actor% %actor.iname% присел%actor.g% на корточки и расставил%actor.q% руки.
%send% %actor% Вы присели на корточки и приготовились к прыжку.
wait 1s
if %actor.sex% == 1
  set mest его
else
  set mest ее
end
%echoaround% %actor% Видя что %actor.iname% колеблется, сокол слегка подтолкнул %mest% мощным ударом лапы, чуть-чуть пониже спины.
%send% %actor% Решив помочь Вам, сокол столкнул Вас с ветки.
%echoaround% %actor% %actor.iname% полетел%actor.g% с ветки вниз.
%send% %actor% Вы полетели вниз.
%teleport% %actor% 8581
if ((%actor.class% == 1)||(%actor.class% == 6)||(%actor.class% == 7))
  %send% %actor% Но когда Вам казалось, Вы вот-вот разобьетесь, падение медленно замедлилось и Вы плавно опустились на землю.
  if (!%actor.spelltype(полет)%)
    %send% %actor% Вы дествительно научились летать!
    mspellturn %actor% полет set
  else
    %send% %actor% Но это Вам не в новинку, летаете Вы уже давно.
  end
else
  %send% %actor% Видимо погода была не летная. Как Вы ни старались махать руками, у Вас ничего не вышло.
  %send% %actor% Вы здорово шмякнулись об землю.
  eval buf %actor.hitp(-20)%
  %send% %actor% Сверху раздался голос сокола:
  %send% %actor% - Видимо, права людская молва...
  %send% %actor% - Рожденный ползать, летать не может.
  %send% %actor% - Но я должен отблагодарить тебя за спасение моего птенца...
  %send% %actor% - Держи несколько золотых, сорока знакомая в гости залетала да забыла.
  eval temp %actor.gold(+100)%
end
detach 8511 %self%
~
#8512
Бросаем птенца~
1 h 100
~
return 0
%echo% Птенец возмущенно запищал : 'Да ты что!! Я не мешок с зерном, чтобы меня кидать!!'
%echo% Птенец возмущенно запищал : 'Меня нужно аккуратненько по-ло-жить!'
~
$~
