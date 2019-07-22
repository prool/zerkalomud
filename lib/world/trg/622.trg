#62200
дали деньги корчмарю~
0 m 1
~
mechoaround %actor% _Корчмарь что-то тихо прошептал %actor.dname%.
if %amount% < 10
  msend %actor% _Корчмарь доверительно шепнул Вам: "Скупой платит дважды!" 
  halt
end
if %random.2% == 1
  сказ %actor.name% Охотник Зорень ведает все тайные тропки.
  сказ %actor.name% Ежели ты ищешь пути к урманскому лагерю - заплати ему кун этак пятьдесят.
  сказ %actor.name% А сам дороги вовек не найдешь! 
  calcuid ranger 62201 mob
  detach 62211 %ranger.id%
  attach 62211 %ranger.id%
else
  сказ %actor.name% Олгинь - колдунья.
  сказ %actor.name% Она знает все про травы и снадобья.
  сказ %actor.name% Если ищешь мудрого совета - иди к ней, да поклониться не забудь.
end
~
#62201
у старейшины (приветствие)~
0 q 100
~
wait 5
msend %actor% _Старейшина Имрах посмотрел на Вас
msend %actor% _Старейшина горестно вздохнул. 
wait 2
msend %actor% _"Поздорову будь, %actor.name%!" - сказал старейшина Имрах.
wait 1s
msend %actor% _Старейшина сказал:
msend %actor% - Беда, беда к нам пришла, сгинем мы все здесь безвестно...
msend %actor% - Помоги нам, а мы уж в долгу не останемся... 
~
#62202
сломили ветку~
1 c 4
отломить~
if  !%arg.contains(ветк)%
  osend %actor% _Что вы хотите сломать?!
  halt
end
osend %actor% _Вы вцепились в ветку и принялсиь ее раскачивать.
oechoaround %actor% _%actor.name% вцепил%actor.u% в ветку и начал%actor.g% яростно ее дергать.
oecho _Ветка внезапно хрустнула и обломилась. 
osend %actor% _Вы потеряли равновесие и рухнули с дуба!
oechoaround %actor%  %actor.name% потерял%actor.g% равновесие и полетел%actor.g% с дуба вниз!
odamage %actor% 70
%actor.position(6)%
%actor.wait(4)%
oteleport %actor% 62269
oechoaround %actor% _Кто-то с диким воплем рухнул с дуба!
oload obj 62208
opurge %self%
~
#62203
наводим шорох в дупле~
2 c 1
шуровать шуметь ворошить сунуть ~
if !%arg.contains(дупло)%
  wsend %actor% _Где вы хотите пошуровать? 
  return 0
  halt
end
eval weapon %actor.eq(16)%
if !(%weapon.vnum% == 62208)
  wsend %actor% _Вы сунули руку в дупло... Кто-то БОЛЬНО укусил Вас!
  wdamage %actor% 50
  wechoaround %actor% _%actor.name% сунул%actor.g% было руку в дупло, но тут же с воплем выдернул%actor.g% ее обратно.
  halt
end
wsend %actor% _Вы сунули сухую ветку в дупло и принялись ворочать ею во все стороны.
wechoaround %actor% _%actor.name% сунул%actor.g% сухую ветку в дупло и принял%actor.u% шуровать ею. 
wecho _Внезапно из дупла выскочила толстая белка и начала испугано метаться по веткам.
wload mob 62213
detach 62203 %self.id%
~
#62204
репоп зоны~
2 f 100
~
switch %random.3%
  case 1
    calcuid ship 62238 room
  break
  case 2
    calcuid ship 62239 room
  break
  case 3
    calcuid ship 62254 room
  done
  wload mob 62253
  wteleport questmob6221 %ship.vnum%
  calcuid duplo 62280 room
  detach 62203 %duplo%
  attach 62203 %duplo%
  calcuid vetka 62207 obj
  detach 62202 %vetka%
  attach 62202 %vetka%
  calcuid ouk 62285 room
  detach 62216 %ouk%
  attach 62216 %ouk%
  calcuid olgin 62204 mob
  detach 62219 %olgin%
  attach 62212 %olgin%
  calcuid viking 62216 mob
  wteleport %viking% 62286
  calcuid skald 62217 mob
  wteleport %skald% 62286
  calcuid viking 62235 mob
  wteleport %viking% 62245
  calcuid viking 62240 mob
  wteleport %viking% 62247
  calcuid viking 62225 mob
  wteleport %viking% 62293
  calcuid viking 62241 mob
  wteleport %viking% 62258
  calcuid viking 62242 mob
  wteleport %viking% 62215
  calcuid viking 62218 mob
  wteleport %viking% 62257
  calcuid viking 62247 mob
  wteleport %viking% 62216
  calcuid viking 62245 mob
  wteleport %viking% 62291
  calcuid imrah 62200 mob
  attach 62201 %imrah%
  attach 62207 %imrah%
  detach 62230 %imrah%
  rdelete questor622 %imrah%
  calcuid hunter 62201 mob
  rdelete questor622 %hunter%
  calcuid konung 62215 mob
  rdelete questor622 %konung%
  calcuid daughter 62253 mob
  rdelete questor622 %daughter% 
  wdoor 62227 e purge
  wdoor 62221 w purge
  wdoor 62248 w purge
  wdoor 62247 e purge
  wdoor 62210 s purge
  wdoor 62215 n purge 
  detach 62237 %world.room(62227)%
  detach 62237 %world.room(62248)%
  detach 62237 %world.room(62210)%
  attach 62237 %world.room(62227)%
  attach 62237 %world.room(62248)%
  attach 62237 %world.room(62210)%
  calcuid alhemist 62204 mob
  rdelete ing1 %alhemist.id%
  rdelete ing2 %alhemist.id%
  rdelete ing3 %alhemist.id%
~
#62205
убит волхв Орлуг~
0 f 100
~
mload obj 62209 
if %random.100% < 30
  mload obj 62243
elseif %random.100% < 20
  mload obj 62241
elseif %random.100% < 8
  mload obj 62242
end 
~
#62206
вошли к конунгу~
0 r 100
~
say Troll taki udr oll!
wait 1
*Чтоб вас тролли взяли! (старонорвежский)
*mecho _"KOMIT UT, TRU WARE!!!" - взревел конунг.
exec 62234 %world.room(62279)%
*Ко мне, верная дружина!
~
#62207
у старейшины (выдача квеста)~
0 d 1
да конечно помогу согласен~
if %questor622%
  halt
end
eval level 22-%actor.remort%/2
if ( (%actor.level% < %level%) || (%actor.vnum% != -1) || !%exist.mob(62215)%)
  msend %actor% _Старейшина внимательно осмотрел Вас с ног до головы.
  say Нет, боюсь не по силам это тебе...
  вздох
  halt
end
makeuid questor622 %actor.id%
global questor622
calcuid hunter 62201 mob
attach 62226 %hunter.id%
remote questor622 %hunter.id%
calcuid konung 62215 mob
remote questor622 %konung.id%
calcuid daughter 62253 mob
remote questor622 %daughter.id%                                               
say Урмане, урмане в набег по нас пришли!
wait 1
say Лагерем встали здесь, на берегу недалече...
say Как есть пожгут деревню, ограбят, людей в полон уведут.
wait 5
say А тут еще дочка моя, Ивушка, в лес ушла и сгинула.
say Не иначе - урманам проклятым на глаза попалась.
emot горько разрыдался
wait 1s
say Спаси ее, %actor.name%...
say А я уж в долгу не останусь...
say И Зореню-охотнику я скажу, чтоб к лагерю самому проводил тебя тропкою тайной.
detach 62201 %self.id%
~
#62208
в бою с берсерком~
0 k 100
~
wait 1
if ((%actor.hitp% < 99) && (%actor.realroom% == %self.realroom%))
  mecho _Внезапно берсерк испустил оглушительный боевой клич!
  msend %actor% _Берсерк Хальфдан нанес Вам СТРАШНЫЙ удар!!!
  mechoaround %actor% _Берсерк Хальфдан нанес %actor.dname% СТРАШНЫЙ удар!!!
  eval dmg %actor.hitp%+10
  mdamage %actor% %dmg%
  wait 5
end
~
#62209
вошли к усмарю~
0 q 25
~
wait 1       
mecho Усмарь что-то злобно прорычал сквозь зубы.
say Да что ты тут шляешься? И без того....
wait 2s
eval trup %random.pc%
if (%trup%)
  say Ты еще здесь?! Ну, сам%trup.g% напросил%trup.u%... На, получи-ка промеж глаз!!!
  mkill %trup%
end
~
#62210
по тропе на запад~
2 c 0
идти пройти уйти уходить~
if !%arg.contains(троп)% && !%arg.contains(запад)%
  wsend %actor% _Камо грядеши?
  return 0
  halt 
end
wsend %actor% _Вы пригнулись и нырнули в густые заросли на западе.
wsend %actor% _Вы долго петляли по лесу и вот, наконец, вышли к деревне.
wteleport %actor% 62208
wecho _%actor.name% уш%actor.y% по тропке на запад. 
wechoaround %actor% Кто-то выбрался из леса на дорогу.
~
#62211
дали деньги охотнику~
0 m 1
~
if (%amount% < 50)
  say За эти гроши иди сам%actor.g% куда хошь.
  halt
end
вздох
say Ну что ж... Пошли.
wait 1
mecho _Охотник встал и отправился в дорогу. 
mechoaround %actor% _%actor.name% уш%actor.y% следом за охотником.
msend %actor% _Вы пошли вслед за охотником.
msend %actor%  _Вы долго пробирались через леса и холмы.
wait 1s
msend %actor% _Наконец послышался шум морского прибоя.
mteleport %actor% 62273 horse
mteleport %self% 62273
mechoaround %actor% _Кто-то пришел сюда вместе с хромым охотником Зоренем.
say Дальше я не пойду. До лагеря урманского уж рукой подать.
say Но смотри, будь осторожен - вокруг ихних наворопников да часовых полно.
wait 2
mecho  _Хромой охотник ушел на запад.
mteleport %self% 62203
mecho _Охотник Зорень пришел с запада.
~
#62212
поклонились весянке~
0 c 0
поклониться~
if (!%arg.contains(весянк)% && !%arg.contains(Олгинь)%)
  msend %actor% Так и лоб расшибить недолго!
  return 0
  halt 
end
wait 2
msend %actor% _Вы низко поклонились весянке Олгинь
mechoaround %actor% _%actor.name% низко полонил%actor.u% весянке Олгинь.
say Что, %actor.iname%, за снадобьями приш%actor.y%?
say А ведь нету снадобий-то... 
say Коли нужно тебе чего - ступай в лес, да принеси мне чешуйку змея золотого, перо птицы лесной и коготь беличий.
say Вот тогда и поговорим.
wait 4
say Да змея смотри не обижай - не простой это змей, а самого Перуна любимец.
mecho _Олгинь замолчала и принялась за хозяйственные дела.
calcuid vetka 62207 obj
attach 62202 %vetka.id%
attach 62219 %self.id%
detach 62212 %self.id%
~
#62213
лезть на дуб~
2 c 0
лезть залезть забраться взобраться~
if !%arg.contains(дуб)% 
  wsend %actor% _Куда это Вы лезете?!
  return 0
  halt 
end
wsend %actor%  Обдираясь о сучья, Вы полезли на дуб.
wechoaround %actor% _%actor.name% полез%actor.q% на дуб.
wteleport %actor% 62280
wsend %actor% _Вы забрались на широкую прочную ветку.
wechoaround %actor% _Кто-то взобрался на дерево.
~
#62214
убили белку~
0 f 100
~
eval fang %random.3%
if (%fang% == 1)
  mload obj 62230
  mload obj 62231
elseif (%fang% == 2)
  mload obj 62231
  mload obj 62232
elseif (%fang% == 3)
  mload obj 62232
  mload obj 62230
end
~
#62215
убили птаху~
0 f 100
~
eval plume %random.3%
if (%plume% == 1)
  mload obj 62233
  mload obj 62234
elseif (%plume% == 2)
  mload obj 62234
  mload obj 62235
elseif (%plume% == 3)
  mload obj 62235
  mload obj 62233
end
~
#62216
кто-то засвистел ~
2 c 1
свистеть свистать засвистать~
wsend %actor% _Вы сунули пальцы в рот и засвистали во всю мочь.
wechoaround %actor% %actor.iname% сунул%actor.g% пальцы в рот и оглушительно засвистал%actor.g%.
wecho _Внезапно послышался страшный свист и гром.
wecho _Огромный крылатый змей примчался прямо сюда! 
wload mob 62212
calcuid zmey 62212 mob
makeuid questor %actor.id%
global questor
remote questor %zmey.id%      
detach 62216 %self.id%
~
#62217
загрузка змея~
0 n 100
~
msend %questor% _Змей осмотрел Вас с ног до головы.
mechoaround %questor% Змей осмотрел %questor.vname% с ног до головы.
say Э! Ты не мой хозяин! 
say А я-то летел-мчался... да и проголодался по дороге изрядно...
say Нет ли у тебя для меня чего-нибудь?
wait 5s
say Как, ничего нет?!
say Зря ты меня потревожил, человече. Ох зря...
mkill %questor.iname% 
~
#62218
змею дали труп ~
0 j 100
~
wait 1
eval meat %object.name%
if !%meat.contains(труп)%
  return 0
  halt
end
say  О! Закуска!
mecho _Крылатый змей дыхнул на %meat.vname% огнем, хорошо его прожарив.
mecho _Крылатый змей с аппетитом слопал поджареный %meat.vname%.
say Ну, пора мне в путь-дорогу...
mecho Крылатый змей взмахнул крыльями и умчался.
mecho Несколько чешуек сорвались с хвоста змея и кружась опуститились на ветви дуба.   
eval scales %random.3%
if (%scales% == 1)
  mload obj 62236
  mload obj 62237
elseif (%scales% == 2)
  mload obj 62237
  mload obj 62238
elseif (%scales% == 3)
  mload obj 62238
  mload obj 62236
end
mpurge %object%
mpurge %self%
~
#62219
дали ингридиент весянке~
0 j 100
~
wait 1
switch %object.vnum%
  case 62230
    set ing1 1
    global ing1
  break
  case 62231
    set ing1 2 
    global ing1
  break
  case 62232
    set ing1 3
    global ing1
  break
  case 62233
    set ing2 1
    global ing2
  break
  case 62234
    set ing2 2
    global ing2
  break
  case 62235
    set ing2 3 
    global ing2
  break
  case 62236
    set ing3 1 
    global ing3
  break
  case 62237
    set ing3 4 
    global ing3
  break
  case 62238
    set ing3 5
    global ing3
  break
  default
    emot недоуменно посмотрела на %object.vname%
    say Это-то мне зачем?
    drop %object.iname%
    halt
  done
  wait 1
  mpurge %object%
  say О! Как раз то, что нужно!
  mecho Олгинь бросила %object.vname% в висящий над очагом котелок и принялась помешивать кипящее варево.
  wait 2s
  if !%ing1% || !%ing2% || !%ing3%
    дум
    say Кажется, еще чего-то не хватает...
    say Ничего не забыл?
    halt
  end
  say Ну вот, что-то получилось...
  wecho Весянка Олгинь налила готовое зелье в какую-то склянку.
  eval sum %ing1%+%ing2%+%ing3%
  switch %sum%
    case 3
      mload obj 62220
      give все .%actor.name%
    break
    case 4
      mload obj 62221
      give все .%actor.name%
    break
    case 5
      mload obj 62222
      give все .%actor.name%
    break
    case 6
      mload obj 62223
      give все .%actor.name%
    break
    case 7
      mload obj 62224
      give все .%actor.name%
    break
    case 8
      mload obj 62225
      give все .%actor.name%
    break
    case 9
      mload obj 62226
      give все .%actor.name%
    break
    case 10
      mload obj 62227
      give все .%actor.name%
    break
    case 11
      mload obj 62228
      give все .%actor.name%
    break
  done
~
#62220
змей убит~
0 f 100
~
eval scales %random.3%
if (%scales% == 1)
  mload obj 62236
  mload obj 62237
elseif (%scales% == 2)
  mload obj 62237
  mload obj 62238
elseif (%scales% == 3)
  mload obj 62238
  mload obj 62236
end
~
#62221
прыгнуть с дуба~
2 c 0
прыгнуть~
if !%arg.contains(вниз)%
  wsend %actor% _Куда прыгаем-то?
  return 0
  halt
end
wsend %actor%  С криком "Не поминайте лихом" Вы сиганули вниз с дуба.
wechoaround %actor% _%actor.iname% завопил%actor.g%: "Не поминайте лихом" и ринул%actor.u% вниз с дуба.
wdamage %actor% 20
wteleport %actor% 62269
wechoaround %actor% Кто-то с нечленораздельным криком свалился с дуба.
~
#62222
освободили пленника~
0 c 0
освободить расковать развязать ~
if !%arg.contains(пленник)%
  msend %actor% Кого Вы так страстно желаете освободить?
  return 0
  halt
end
msend %actor% Мощным ударом Вы разбили оковы несчастного пленника.
mechoaround %actor% _%actor.iname% сильным ударом разбил%actor.g% оковы пленника.
wait 4
mecho _Пленник встал, раправляя сведенные плечи.
mecho _Пленник прошептал что-то и преобразился в статного чародея.
wait 2
mecho _"Спасибо тебе, о %actor.iname%!" - произнес чародей.
wait 3
mecho _Чародей сказал: "Я бы вознаградил тебя, но эти нечестивцы отняли мой волшебный посох!
mecho Найди его, и я сумею вернуть тебе свой долг."
mload mob 62210
mpurge %self%
~
#62223
отдали посох чародею~
0 j 100
~
if !(%object.vnum% == 62209)
  say Да ты, никак, смеешься надо мной?!
  emot грозно нахмурился
  drop %object.name%
  halt
end
wait 1
say О, мой посох! Моя сила снова при мне!
dg_cast 'призма' %self.name%
dg_cast 'полет' %self.name%
say Что ж, я вознагражу тебя как и обещал. 
mechoaround %actor% _Чародей дал %actor.dname% несколько мудрых советов.
if (%actor.level% > 20) && (%actor.level% < 26)                         
  msend %actor% Чародей дал Вам несколько мудрых советов, добавивших вам 40000 очков опыта. 
  %actor.exp(+40000)%
else
  msend %actor% Чародей дал Вам несколько советов... но все они в одно Ваше ухо влетели, да в другое и вылетели.
end
dg_cast 'освящение' %actor.name%
dg_cast 'полет' %actor.name%
dg_cast 'исцеление' %actor.name%
say А теперь мне пора...
mecho _Чародей взвился в воздух и исчез.
mpurge %object%
mpurge %self%
~
#62224
лезть на корабль~
2 c 0
лезть залезть карабкаться взобраться~
if !%arg.contains(корабль)%
  wsend %actor% Куда вы лезете?
  return 0
  halt
end
if %actor.fighting%
  eval enemy %actor.fighting%
  wsend %actor% _Вы попытались залезть на корабль, но %enemy.name% схватил%enemy.g% Вас за ногу и сдернул вниз!
  halt
end
wsend %actor% Вы принялись карабкаться на борт корабля.
wechoaround %actor%  %actor.iname% полез%actor.q% на корабль.
if %self.vnum% == 62221
  wteleport %actor% 62227
elseif %self.vnum% == 62247
  wteleport %actor% 62248
else
  wteleport %actor% 62210
end
wechoaround %actor% _%actor.iname% забрал%actor.u% сюда.
~
#62225
прыгнуть на берег~
2 c 0
прыгнуть спрыгнуть соскочить~
if (!%arg.contains(вниз)% && !%arg.contains(берег)%) 
  wsend %actor% _Куда вы хотите прыгнуть?
  return 0
  halt
end
if %actor.fighting%
  eval enemy %actor.fighting%
  wsend %actor% _Вы попытались спрыгнуть на берег, но %enemy.name% схватил%enemy.g% Вас за шиворот и втащил%enemy.g% обратно!
  halt
end
wsend %actor% _Вы спрыгнули с корабля на берег.
wechoaround %actor% _%actor.iname% спрыгнул%actor.g% на берег. 
if %self.vnum% == 62227
  wteleport %actor% 62221
elseif %self.vnum% == 62248
  wteleport %actor% 62247
else
  wteleport %actor% 62215
end
wechoaround %actor%  %actor.iname% спрыгнул%actor.g% с борта корабля.
foreach dochka %self.npc%
  if (%dochka.vnum% == 62253)
    wechoaround %dochka%  Ивушка спрыгнула на берег.
    if %self.vnum% == 62227
      wteleport %dochka% 62221
    elseif %self.vnum% == 62248
      wteleport %dochka% 62247
    else
      wteleport %dochka% 62215
    end
    wechoaround %dochka%  Ивушка спрыгнула на берег.
  end
done
~
#62226
квестор вошел к охотнику~
0 q 100
~
if !(%actor.id% == %questor622.id%)
  halt
end 
wait 1s
say Имрах уж сказал мне про тебя, %actor.iname%...
say К лагерю урманскому проводить велел.
wait 2
say Сложишь ведь голову там, а девчонку все равно не спасешь.
wait 1s
say Да и я Имраху не холоп - за так всяких бездельников по лесам водить.
say Вот заплатишь кун пятьдесят - тогда и покажу дорогу.
detach 62211 %self.id%                      
attach 62211 %self.id%                      
detach 62226 %self.id%
~
#62227
привели дочку на тропу~
0 z 0
~
wait 1
if (%questor622.sex% == 1)
  say Спасибо тебе, добрый молодец!  
  *elseif (%questor622.sex% == 2) 
else
  say Спасибо тебе, красна девица!            
end 
say Я и мой отец не останемся в долгу...
say Теперь я и сама до дому доберусь.
calcuid father 62200 mob
*attach 62234 %father.id%
attach 62230 %father.id%
exec 62233 %father.id%
wait 1
mecho _Ивушка быстро убежала по тропке на запад.
mpurge %self%
~
#62228
конунг убит~
0 f 100
~
if %questor622.realroom% != 62279
  halt
end
mload obj 62205
~
#62229
вошли к дочке старейшины~
0 q 100
~
if !(%actor.id% == %questor622.id%)
  return 0
  halt
end
wait 1s
emot испуганно взглянула на Вас
emot присмотрелась к вам и вскочила, радостно вскрикнув
wait 3
if (%actor.sex% == 1)
  say Спасибо тебе, добрый молодец!  
  цел  %actor.name%
elseif (%actor.sex% == 2) 
  say Спасибо тебе, красна девица!            
  поклон %actor.name%
end 
say Спас%actor.q% ты меня, вовек не забуду.
wait 1s
say Только как же я до дому доберусь?
say Схватили-то они меня в лесу, от деревни недалече, да в мешке сюда притащили.
say Раз уж освободил%actor.g% ты меня, то не бросай тут.
*say Теперь я и сама до дому доберусь.
*mecho Ивушка вскочила и убежала наверх.
*calcuid father 62200 mob
*attach 62234 %father.id%
*attach 62230 %father.id%
*exec 62233 %father.id% 
*mpurge %self%
mload mob 62255
remote questor622 %world.mob(62255)% 
mteleport %self% 62286
exec 62243 %world.room(62241)%
exec 62244 %world.room(62260)%
mpurge %self%
~
#62230
у старейшины (награда)~
0 q 100
~
if (%actor.id% != %questor622.id%)
  halt
end   
eval level 22-%actor.remort%/2
if (%actor.level% < %level%)
  halt
end
wait 1s
улыб
say Спасибо тебе, %actor.iname%, спас%actor.q% ты и селение наше, и дочурку мою...
emot ласково взглянул на Ивушку
msend %actor% Старейшина крепко пожал Вам руку.
mechoaround %actor% Старейшина Имрах крепко пожал руку %actor.dname%.
wait 2s
if (%questor622.quested(62200)% == 0)
  switch %actor.class%
    case 0
      say Нелегкое это дело - людей лечить. За труд твой благородный... 
      say Прими в награду вот это!
      mload obj 552
      дат свиток .%actor.name%
    break
    case 1
      say Да я понимаю, что колдуны - это боевые маги, но
      say Ломать это не строить, так что возьми-ка вот это
      mload obj 578 
      дать книг .%actor.name%
    break
    case 2
      say Воровством ты промышляешь.
      emot смущенно закашлялся  
      say Что ж, научу я тебя хитрости одной, для вора наиважнейшей.
      msend %actor% Старейшина Имрах подробно описал Вам способы наилучшего удара со спины.
      mechoaround %actor% Старейшина что-то долго и терпеливо растолковывал %actor.iname%.
      if !%actor.skill(заколоть)%
        msend %actor% Вы теперь поняли, как надо пользоваться умением "заколоть".
        mskillturn %actor% заколоть set
      else
        msend %actor% Вы стали значительно опытнее в умении "заколоть".
        mskilladd %actor% заколоть 10
      end
      %questor622.setquest(62200)%
    break
    case 3
      say Научу я тебя, как силушку свою с толком в дело пустить.
      msend %actor% Старейшина подробно разъяснил Вам некоторые особенности богатырского удара.
      mechoaround %actor% Старейшина принялся что-то разьяснять %actor.dname% для пущей    убедительности размахивая кулаками.
      if !%actor.skill(богатырский молот)%
        msend %actor% Теперь Вы владеете умением "богатырский молот"!
        mskillturn %actor% богатырский.молот set
      else
        msend %actor% Теперь вы гораздо лучше умеете наносить богатырские удары!
        mskilladd %actor% богатырский.молот 10
      end
      %questor622.setquest(62200)%
    break 
    case 4
      say Ясно мне, что наемник ты по крови, да и по духу.
      msend %actor% Старейшина стал показывать как осторожно подобраться к жертве.
      mechoaround %actor% Старейшина принялся что-то разьяснять %actor.dname% , осторожно подкрадываясь.
      if !%actor.skill(осторожный стиль)%
        msend %actor% Теперь Вы владеете умением "осторожный стиль"!
        mskillturn %actor% осторожный.стиль set
      else
        msend %actor% Теперь Вы гораздо лучше умеете осторожно подкрадываться к жертве!
        mskilladd %actor% осторожный.стиль 10
      end
      %questor622.setquest(62200)%
    break
    case 5
      say С первого взгляда дружинника в тебе видать.
      say И я когда-то искал славы воинской, дела ратного...
      emot призадумался
      mecho Старейшина вытащил из сундука меч и принялся вертеть его вокруг себя, да так, что и не подойдешь к нему.
      if !%actor.skill(веерная защита)%
        msend %actor% Теперь Вы владеете умением "веерная защита"!
        mskillturn %actor% веерная.защита set
      else
        msend %actor% Теперь Вы гораздо лучше умеете отражать удары!
        mskilladd %actor% веерная.защита 10
      end
      %questor622.setquest(62200)%
    break
    case 6
      say Для кудесника есть у меня чудный дар
      say Вот смотри - с этим ты будешь нужен в любой компании
      mload obj 558
      дать книг .%actor.name%
    break 
    case 7
      say Есть у волшебника Дар особый - видеть, то, что другим не видно
      say И за дело твое доброе - обучу я тебя этому дару.
      mecho Старейшина начал показывать в пустоту и многозначительно кивать.
      if !%actor.skill(врата)%
        msend %actor% Теперь Вы владеете умением "врата"!
        mskillturn %actor% врата set
      else
        msend %actor% Теперь Вы гораздо лучше умеете открывать врата!
        mskilladd %actor% врата 10
      end
      %questor622.setquest(62200)%
    break 
    case 8
      say Я так считаю... небудь на земле Зла, кто бы тогда Добро заметил?
      say Ты чернокнижник, стало быть тебе пригодиться вот эта вещь...
      mload obj 568
      дать книг .%actor.name%
    break
    case 9
      say Когда-то и я искал славы воинской... Покажу я тебе, как следует удары наносить, чтоб не бестолку мечом-то тыкать...
      mecho Старейшина вытащил из сундука меч и принялся вертеть его вокруг себя, нанося  внезапные удары и выпады.
      if !%actor.skill(точный стиль)%
        msend %actor% Теперь Вы владеете умением "точный стиль"!
        mskillturn %actor% точный.стиль set
      else
        msend %actor% Теперь Вы гораздо лучше знаете все уязвимые места всевозможных противников!
        mskilladd %actor% точный.стиль 10
      end
      %questor622.setquest(62200)%
    break
    case 10
      say Охотник ты, как я погляжу.
      say Покажу я тебе, как быстрее из лука стрелять, дабы никто от стрел твоих уйти не смог.
      msend %actor% Старейшина снял со стены колчан и стал демонстрировать Вам различные способы, коими можно удерживать в руке сразу несколько стрел, изготовленных к стрельбе.
      mechoaround %actor% Старейшина снял со стены тул со стрелами и стал что-то обьяснять   %actor.name% хватая стрелу то так, то этак.                                               
      if !%actor.skill(дополнительный выстрел)%
        msend %actor% Теперь Вы владеете умением "дополнительный выстрел"!
        mskillturn %actor% дополнительный.выстрел set
      else 
        msend %actor% Теперь Вы гораздо лучше знаете как стрелять быстро и точно!
        mskilladd %actor% дополнительный.выстрел 10
      end
      %questor622.setquest(62200)%
    break 
    case 11
      say Вижу я, кузнец ты справный.
      say Обучу я тебя, как в бою супротивника с ног сбивать следует, чтоб и голосу подать не мог...
      mecho Старейшина снял со стены посеченный в битвах щит и надел его на руку.
      msend %actor% Старейшина стал показывать Вам как нужно наносить удары щитом.
      msend %actor% _Одним ударом старейшина сбил Вас с ног!
      mechoaround %actor% _Одним ударом Старейшина завалил %actor.vname% на землю!
      %actor.position(6)%
      %actor.wait(3)%
      if !%actor.skill(сбить)%
        msend %actor% Теперь Вы владеете умением "сбить"!
        mskillturn %actor% сбить set
      else
        msend %actor% Теперь Вы гораздо лучше знаете как надо сбивать противников!
        mskilladd %actor% сбить 10
      end
      %questor622.setquest(62200)%
    break
    case 12
      say Знаю, что для купца важнее прибыли, только честь
      say Да времена нынче такие, что и купцам приходиться 
      say Не о деле думать, а в бою удаль проявлять
      mecho Старейшина снял со стены превосходный метательный нож и вооружился им.
      msend %actor% Старейшина стал показывать Вам как нужно метко метать оружие.
      msend %actor% _Незаметным движением руки старейшина ловко метнул нож!
      mechoaround %actor% _Незаметным движением руки старейшина ловко метнул нож!
      if !%actor.skill(метнуть)%
        msend %actor% Теперь Вы владеете умением "метнуть"!
        mskillturn %actor% метнуть set
      else
        msend %actor% Теперь Вы гораздо лучше знаете как надо метать ножи!
        mskilladd %actor% метнуть 10   
      end
      %questor622.setquest(62200)%
    break  
    case 13
      say Знаю, что все вы, волхвы, себе на уме
      say Лишний раз даже не хочется вам на глаза и попадаться. 
      say Да вот знаю слово гадкое, что способно человеку все настроение испортить
      mecho Старейшина хитро подмигнул и на секундц задумался
      msend %actor% Старейшина прошептал Вам такую мерзость, что Вас аж передернуло.
      mechoaround %actor% _Старейшина стал что-то нашептывать.
      if !%actor.skill(сглазить)%
        msend %actor% Теперь Вы владеете умением "сглазить"!
        mskillturn %actor% сглазить set
      else
        msend %actor% Теперь Вы гораздо лучше знаете как сглазить человека!
        mskilladd %actor% сглазить 10 
      end
      %questor622.setquest(62200)%
    break
  done  
else
  say Нечем мне наградить тебя...
  say Нет у меня сокровищ - вот возьми немного кун.
  eval temp %actor.gold(+5000)%
  mecoaround %actor% Старейшина передал из рук в руки %actor.dname% набитый золотом пояс.
  msend %actor% Старейшина сунул Вам в руки набитый золотом пояс.
end
detach 62230 %self.id%
~
#62231
отдали посох чародею(2)~
0 j 100
~
if !(%object.vnum% == 62209)
  say Да ты, никак, смеешься надо мной?!
  emot грозно нахмурился
  drop %object.name%
  halt
end
wait 1
say О, мой посох! Моя сила снова при мне!
dg_cast 'призма' %self.name%
dg_cast 'полет' %self.name%
say Что ж, я вознагражу тебя как и обещал. 
dg_cast 'освящение' %actor.name%
dg_cast 'полет' %actor.name%
dg_cast 'исцеление' %actor.name%
say А теперь мне пора...
say Я возвращаюсь домой - на прекраснейший Остров Чародеев.
say Обычно, простым смертным нет дороги туда.
say Но ты спас меня... хочешь ли ты отправиться со мной?
mpurge %object%
attach 62232 %self.id%
detach 62231 %self.id%
~
#62232
сказал "да" чародею~
0 d 0
да конечно хочу нет~
if (%speech% == нет)
  say Что ж, прощай.
  mecho Чародей взвился в воздух и исчез.
  mpurge %self%          
  halt
end
say Прекрасно!
emot взмахнул своим волшебным посохом и могучий вихрь подхватьил Вас!
mecho Вы взвились высоко в воздух, далеко внизу пронеслись города и веси, леса и моря...
mecho Внезапно вы оказались над большим островом.
mecho Вы быстро снизились и приземлились прямо на главной площади богатого города.
mteleport all 48700
wat 48900 mecho Чародей Фимор сказал: "Вот мы и прибыли!"
wat 48900 mecho Чародей Фимор сказал: "Но мне пора - я долго странствовал и меня ждут дела."
wat 48900 mecho Чародей Фимор сказал: "Наслаждайся красотами Острова, но учти, не все здесь рады видеть чужаков."
wat 48900 mecho Чародей торопливо удалился по направлению к стоящему невдалеке замку.
mpurge %self%
~
#62233
лоад дочки старейшины~
0 z 0
~
mload mob 62254
detach 62253 %self.id%
~
#62234
орет конунг~
2 z 0
~
wzoneecho 62279 &Y "KOMIT UT, TRU WARE!!!" - взревел Атли-конунг.&n
~
#62235
дочка следует за квестором~
0 d 0
следуй пойдем пошли~
if %actor.id% == %questor622.id% 
  say Спасибо тебе...
  wait 2
  follow %actor.name%
end
~
#62236
запуск триггера 62227~
2 g 100
~
if (%actor.vnum% == 62255)   
  exec 62227 %world.mob(62255)%
end
~
#62237
опустить сходню~
2 c 0
опустить перекинуть спустить~
if !%arg.contains(сходн)%
  wsend %actor% _Что вы хотите опустить?
  halt
end                                            
wsend %actor% Вы взяли сходню и опустили ее одним концом на берег.
wechoaround %actor% _%actor.name% взя%actor.q% сходню и опустил ее одним концом на берег.
wecho _Теперь можно спокойно пройти.
wpurge сходня
wload obj 62239 
if %self.vnum% == 62227
  wdoor 62227 e room 62221
  wdoor 62221 w room 62227
  exec 62238 %world.room(62221)%
elseif %self.vnum% == 62248
  wdoor 62248 w room 62247
  wdoor 62247 e room 62248
  exec 62238 %world.room(62247)%
else
  wdoor 62210 s room 62215
  wdoor 62215 n room 62210
  exec 62238 %world.room(62215)%
end 
detach 62237 %self.id%
~
#62238
сходня ╧2~
2 z 0
~
wecho _Кто-то опустил с борта корабля широкую сходню.
wecho _Теперь можно спокойно взойти на борт.
wload obj 62239 
~
#62239
загрузка группы ╧1~
0 n 0
~
wait 2
follow викинг
~
#62240
агр на дочку старейшины~
0 g 100
~
if %actor.vnum% == 62255
  отступить
  kill %actor.name%
end
~
#62241
блок~
2 g 100
~
*if %direction% != south 
*halt
*end
eval actorvnum %actor.vnum%-62200
if (%actorvnum% == 55)
  return 1
  halt
end
if ((%actorvnum% >= 0) && (%actorvnum% < 99))
  return 0
  halt
end
~
#62242
загрузка группы ╧2~
0 n 0
~
wait 2
follow гетт
~
#62243
загрузка мобов группы ╧1~
2 gz 0
~
wecho _Несколько урманских воев явилось сюда!
wload mob 62257
wload mob 62258
wload mob 62256
~
#62244
загрузка мобов группы ╧2~
2 gz 0
~
wecho _Несколько урманских воев явилось сюда!
wload mob 62260
wload mob 62259
wload mob 62261
~
#62245
агр на дочку старейшины #2~
0 s 100
~
foreach target %self.npc%
  if %target.vnum% == 62255
    отступить
    kill %target.name%
  end
done
~
#62246
караульные удирают~
0 k 30
~
switch %self.realroom%
  case 62263
    flee n
    flee n
  break
  case 62261
    flee n
    flee n
    wait 2
    if (%self.realroom% == 62260)
      exec 62247 %world.room(62288)%
      mecho _Несколько урманских воев прибыло на зов караульного.
      mload mob 62262
      mload mob 62267
      mload mob 62264
    end
  break
  case 62264
    flee n
    flee n
    wait 2
    if (%self.realroom% == 62241)
      exec 62247 %world.room(62288)%
      mecho _Несколько урманских воев прибыло на зов караульного.
      mload mob 62263
      mload mob 62265
      mload mob 62266
    end
  break
  case 62265
    flee n
    flee n
  break
done
~
#62247
орет караульный~
2 z 0
~
wzoneecho 62288 &R Караульный урманин завопил что есть мочи, созывая подмогу! &n
~
#62248
На вход к пленному воину~
0 q 100
~
wait 1
mecho Воин пригнулся, готовясь кинуться на вас.
wait 2
mecho ...но внезапно остановился и прищурив отвыкшие от света глаза осмотрел вас с ног до головы.
say Так ты не один из этих?
emot махнул рукой в сторону выхода
say Что же, благодарю за спасения.
say Коли ты воин, могу тебя в благодарность научить паре ухваток.
attach 62249 %self.id%
detach 62248 %self.id%
~
#62249
Воин уходит~
0 q 100
~
wait 1
emot посмотрел на Вас и что-то недовольно проворчал в усы
mecho Воин поднялся, направился к выходу из трюма и исчез.
wait 1
mpurge %self%
~
$~
