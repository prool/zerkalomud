#12200
Ломаем ворота~
2 c 1
стучать колотить ломиться стукнуть треснуть постучать~
if %actor.vnum% != -1
  halt
end
wait 1
if !%arg.contains(ворота)%
  if %actor.sex% == 1
    wsend %actor% И куда ж ты ломишься, добрый молодец?
  else
    wsend %actor% И куда ж ты ломишься, красна девица?
  end
  halt
end 
if (%actor.class% != 3 ) || !%actor.rentable%
  wsend %actor% Постучали вы в ворота, но ответа не дождалися - видно нет в доме ни хозяина, ни жены его.
  wechoaround %actor% %actor.name% постучал%actor.g%  в ворота - но ответа так и не было.
  halt
end
if %actor.quested(12200)% == 1
  wsend %actor% И куда же вы ломитесь? 
  wsend %actor% Это же хоромы вашего друга старого, богатыря достославного Добрыни!
  wsend %actor% Сами знаете - нет дома его, в гости к князю уехал со супругою.
  halt
end
set questor122 %actor%
global questor122
calcuid room1 12205 room
remote questor122 %room1.id%
calcuid robbers 12211 mob
remote questor122 %robbers.id%
wsend %actor% Размахнулись вы, разудалились, стукнули в ворота в пол-силушки.
wechoaround %actor% Размахнул%actor.u% %actor.name%, разудалил%actor.u%, стукнул%actor.g% в ворота в пол-силушки.
wecho Раскатились ворота по бревнышку, по двору да по широкому - не собрать, и не поставить.
wdoor 12202 e purge
wdoor 12202 e room 12203
wdoor 12203 w purge
wdoor 12203 w room 12202
wat 12203 wload obj 12204
detach 12200 %self.id%
~
#12201
Квестор укладывается дрыхнуть в спальне хозяина~
2 c 1
сп спа спать sl sle slee sleep~
return 0
if %actor.id% != %questor122.id%
  halt
end
wait 1
wecho Крепким сном тут спится - богатырским...
wait 3s
if %actor.position% != 4
  halt
end
wload mob 12200
wait 1
calcuid warrior 12200 mob
remote questor122 %warrior.id%
exec 12202 %warrior.id%
detach 12201 %self.id%
~
#12202
Добрыня ругается~
0 z 0
~
wait 1
mecho _Вот послышался конский топ да храп.
mecho _Возвратился из пути дальнего сам хозяин - честной богатырь, Добрыня Всеславьевич.
mecho _Он въезжает во двор свой широкий, на коне могутном богатырском.
mecho _Видит он ворота повыломаны, с коня своего соскакивает, и идет во палаты светлые.
say Это что еще за притча?!
гнев
разбудить %questor122.name%
гнев %questor122.name%
say Ты почто явил%actor.u% непрошен%actor.w%, в моем доме хозяйничаешь?!
mecho _- Ты зачем ворота повыломал%actor.g% да по бревнышку по двору пустил%actor.g%?
mecho _- Отвечай немедля, что ж мне с тобой сотворить - со двора батогом согнать, али в печь живьем сажать?!
гнев
wait 2s
дум
взд
say Ну коль явил%actor.u% незван%actor.g% - отвечай,
mecho _- сослужишь службу мне верную, отпущу домой доброй волей, да с наградою.
mecho _- а откажешься, уж как сам решу - так и сделаю, по совести.
attach 12203 %self.id%
detach 12202 %self.id%
~
#12203
Квестор соглашается/отказывается~
0 d 0
согласен согласна да сослужу нет ~
if %actor.id% != %questor122.id%
  halt
end
wait 1
if %speech.contains(дурак)% || %speech.contains(козел)% || %speech.contains(мудак)% 
  say Ну, невежа, получай, что просил%actor.g%!
  msend %actor% Добрыня-богатырь ухватил батог и погнал вас со двора вон.
  mechoaround %actor% Добрыня-богатырь ухватил батог и погнал %actor.vname% со двора вон.
  eval dmg %actor.hitp%-10
  mdamage %actor% %dmg%
  mteleport %actor% 12100 horse
  mdoor 12202 e purge
  mdoor 12202 e room 12203
  mdoor 12202 e flags abcd
  mdoor 12202 e name ворота
  mdoor 12202 e description ворота
  mdoor 12203 w purge
  mdoor 12203 w room 12202
  mdoor 12203 w flags abcd
  mdoor 12203 w name ворота
  mdoor 12203 w description ворота
  detach 12203 %self.id%
  halt
end
if %speech% == нет
  say Не хватило того, что невежа ты, так еще и труса ты спраздновал%actor.g%!
  say Убирайся вон с глаз моих, да и более не показывайся!
  msend %actor% Добрыня-богатырь ухватил батог и погнал вас со двора вон.
  mechoaround %actor% Добрыня-богатырь ухватил батог и погнал %actor.vname% со двора вон.
  eval dmg %actor.hitp%/3
  mdamage %actor% %dmg%
  mteleport %actor% 12100 horse
  mdoor 12202 e purge
  mdoor 12202 e room 12203
  mdoor 12202 e flags abcd
  mdoor 12202 e name ворота
  mdoor 12202 e description ворота
  mdoor 12203 w purge
  mdoor 12203 w room 12202
  mdoor 12203 w flags abcd
  mdoor 12203 w name ворота
  mdoor 12203 w description ворота
  detach 12203 %self.id%
  halt
end
wait 1
say Вот же первая служба тебе - ты доставь-ка мне соли, и не много, и не мало,
mecho _- А по три мешка всего, да каждый мешок по сорок пуд - на хозяйствование.
mecho _- Да не откуда взбредет - а с городишек трех: Гурчовца, Ореховца, да Крестьяновца.
emot сказавши так, указал вам дорогу к первому из городов
mteleport %actor% 12233 horse
set num 0
global num
mload mob 12201
wait 1
calcuid warrior 12201 mob
attach 12204 %warrior.id%
remote num %warrior.id%
remote questor122 %warrior.id%
calcuid beggary 12210 mob
attach 12208 %beggary.id% 
remote questor122 %beggary.id%
wait 1
%purge% %self%
detach 12203 %self.id%
~
#12204
Cдали мешки Добрыне~
0 j 100
~
wait 1
if %actor.vnum% != -1
  бросить все
  halt
end
if %actor.id% != %questor122.id%
  if %actor.sex% == 1
    say А ты кто будешь, добрый молодец? Не припомню тебя...
  else
    say А ты кто будешь, красна девица? Не припомню тебя...
  end
  бросить все
  halt
end
if %object.vnum% != 12206
  say Я просил тебя не о том, поди!
  mecho _-Сделал%actor.g% ты, что было сказано?
  mecho _-Аль мотал%actor.u% ты без толку, по лесам да полям неприкаянно?
  хмур
  брос все
  halt
end
wait 1
eval num %num%+1
global num
if %num% < 3
  say Хорошо же ты послужил%actor.g% мне.
  mecho _- Но всего мешков три должно же быть, а не менее.
  *mecho _- Прочие - доставил%actor.g% ли?
  mjunk all
  halt
end
mjunk all
say Хорошо же ты послужил%actor.g% мне!
mecho _- Услужил%actor.g% ты раз - услужи второй.
mecho _- Ездил я во поле во светлое - уток-лебедей постреляти.
mecho -_ Обронил я там шапку свою, шапку малую, да увесисту.
mecho -_ Услужи-ка мне, отыщи ее, да и мне верни честью-правдою.
emot сказав так, указал вам дорогу в чисто поле
mteleport %actor% 12258 horse
attach 12205 %self.id%
detach 12204 %self.id%
~
#12205
Сдали шапку Добрыне~
0 j 100
~
wait 1
if %actor.vnum% != -1
  бросить все
  halt
end
if %actor.id% != %questor122.id%
  if %actor.sex% == 1
    say А ты кто будешь, добрый молодец? Не припомню тебя...
  else
    say А ты кто будешь, красна девица? Не припомню тебя...
  end
  бросить все
  halt
end
if %object.vnum% != 12212
  say Я просил тебя не о том, поди!
  mecho _-Сделал%actor.g% ты, что было сказано?
  mecho _-Аль мотал%actor.u% ты без толку по лесам да полям неприкаянно?
  хмур
  брос все
  halt
end
mjunk all
say Вот спасибо за службу верную!
mecho _- Уж дважды послужил%actor.g% ты мне честью-правдою, без обмана.
mecho _- Послужи в третий раз - и потом награжу тебя
mecho _- Я за службу твою верную.
wait 1s
say Слышал я, что во краю чужом, краю дальнем-басурманском,
mecho _- Есть царевна, чья краса - словно солнышко ранним утречком.
mecho _- Для меня ты присватайся к ней, да не силою, а вольной волею.
emot сказав так, указал вам дорогу в басурманские земли
mteleport %actor% 12289 horse
*attach 12206 %self.id%
*detach 12205 %self.id%
~
#12206
Привел царевну к Добрыне (финальная награда)~
0 q 100
~
wait 1
if %actor.id% != %questor122.id%
  halt
end
msend %actor% _Рассказали вы Добрыне-богатырю про дорогу свою,
msend %actor% _про Змея поганого, да ответ Дивнокрасы.
wait 2s
кив
say Что же, вижу, зря я корил тебя - слав%questor122.w% ты богатырь!
mecho _- Службу верную сослужил%actor.g% ты мне.
mecho _- Ну раз так - вот награда моя:
mecho _- Пусть же ярость твоя в битве честной, не помехой будет тебе со товарищи,
mecho _- А врагов твоих ужасает, да и силу дает богатырским рукам!
mskillturn %questor122.name% ярость set
%actor.setquest(12200)%
if ((%world.curobjs(12218)% < 5 ) && (%random.100% < 45 ))
  mload obj 12218
  give шапка %actor.name%
elseif ((%world.curobjs(12219)% < 5 ) && (%random.100% < 45 ))
  mload obj 12219
  give рукавиц %actor.name%
elseif ((%world.curobjs(12220)% < 5 ) && (%random.100% < 45 ))
  mload obj 12220
  give пояс %actor.name%
else
  %self.gold(1500)%
  give 1500 кун %actor.name%
end
switch %random.5%
  case 1
  break
done
прощай %questor122.name%
detach 12206 %self.id%
~
#12207
Блокирующий триггер на наградном шмоте~
1 j 100
~
if  ((%actor.level% > 19 ) || (%actor.str% > 25 ) || (%actor.vnum% != -1 ))
  return 0
  osend %actor% Эх, не годится вам эта одежка! Видать, сильномогучий уже богатырь вы.
  halt
end
~
#12208
Первое приветствие калики~
0 q 100
~
wait 1
if %questor122.sex% == 1
  say Поздорову, добрый молодец!
else
  say Поздорову, красна девица!
end
mecho _- Куда путь держишь, от дела, али по делу?
mforce %questor122% say К городам трем - Ореховцу, Гурчовцу да Крестьяновцу.
wait 1s
взд
if %questor122.sex% == 1
  say А не ходил бы ты туда, добрый молодец!
else
  say А не ходила бы ты туда, красна девица!
end
mecho _- Там живут-то мужички, да все разбойнички.
mecho _- Они с тебя грошей подорожных повытребуют,
mecho _- Да коня со сбруей, да кафтан красный,
mecho _- А откажешься - потопят в речке Ореховке.
взд
mecho Калика перехожий ушел на восток.
mteleport %self% 12232
attach 12210 %self.id%
detach 12208 %self.id%
~
#12209
Квестор вошел к мужичкам.~
0 q 100
~
wait 1
shou А гляди-ка, кто тут к нам припожаловал!
if %questor122.sex% == 1
  say А давай-ка ты, добрый молодец,
else
  say А давай-ка ты, красна девица,
end
mecho _- Нам гроши свои подорожные, да кафтан вместе с шапкою,
mecho _- Да коня богатырского со сбруею.
wait 1
mforce %questor122% say А подите-ка вы прочь, поганые!
mecho _Тут мужики на вас понакинулись, отобрали гроши подорожные,
mecho _Вот бока-то понамяли, да по дороге прочь погнали.
*set geld %actor.gold%
*eval bufer %actor.gold(0)%
*eval bufer %self.gold(+%geld%)%
mteleport %actor% 12233 horse
calcuid beggary 12210 mob
mteleport %beggary% 12208
attach 12236 %self.id%
detach 12209 %self.id%
~
#12210
Второе сообщение калики в первой ветке квеста~
0 q 100
~
wait 1
*mecho Калика перехожий пришел с севера.
wait 1
if %questor122.sex% == 1
  say Говорил же я тебе, добрый молодец.
else
  say Говорил же я тебе, красна девица.
end
mecho _- Не по силам тебе те дороженьки.
mecho _- Тут уж силушку надо немалую,
mecho _- Силушку великую - богатырскую.
mecho _- Вот сходит-ко ты ко Двуречной горе,
mecho _- Да земле сырой поклонись - попроси землю-матушку,
mecho _- Силы дать тебе богатырской, да уж хоть половину той.
взд
mecho Калика перехожий ушел на юг.
calcuid mountain 12211 room
attach 12211 %mountain.id%
mteleport %self% 12232
detach 12210 %self.id%
~
#12211
Поклон у горы~
2 c 1
поклон поклониться~
if !%arg.contains(земле)%
  if %actor.sex% == 1
    wsend %actor% И кому ж ты кланяешься, добрый молодец?
  else
    wsend %actor% И кому ж ты кланяешься, красна девица?
  end
  return 1
  halt
end
wait 1
wsend %actor% Поклонились вы земле-матушке, попросили у нее силушки богатырской,
wsend %actor% Да уж хоть половину ее.
wsend %actor% Пожалела вас мать-земля сыра, дала дала вам, что прошено,
wsend %actor% Разгулялась по жилам у вас сила богатырская - просит дела себе под стать.
wait 2
eval heal %actor.maxhitp%
eval buf %actor.hitp(%heal%)%
wsend %actor% Вы почувствовали себя здоровым
eval energy %actor.maxmove%
eval buf %actor.move(%energy%)%
wsend %actor% Вы почувствовали себя полным сил.
calcuid robbers 12211 mob
detach 12209 %robbers.id%
detach 12236 %robbers.id%
attach 12227 %self.id%
detach 12211 %self.id%
~
#12212
Подходят к витязям у ворот~
0 q 100
~
wait 1
if %actor.sex% == 1
  say Гой еси, добрый молодец!
else
  say Гой еси, красна девица!
end
mecho _- Как же путь прошел по дороге во град?
mecho _- Там сидят мужички-то все разбойнички.
mecho _- Нет проходу ни пешему, ни конному.
wait 2
mforce %actor% say Да встречал%actor.g% я мужичков-то тех.
mforce %actor% say Уж кто из них стоя стоял - тот и сидя сидел, 
mforce %actor% say А кто сидя сидел - тот и лежа лежал!
wait 2
восторг
say Видать силушка у тебя немалая, богатырская!
say Чего же хочешь ты за помощь свою?
attach 12213 %self.id%
detach 12212 %self.id%
~
#12213
Просьба к витязям~
0 d 1
соль соли~
wait 1
дум %actor.name%
say Воля вольная, значит быть по сему.
emot кликнул людей городских.
mecho _Вынесли они мех с солью, немалый мех - во сорок пуд.
поклон %actor.name%
mload obj 12206
wait 1
give мех %actor.name%
wait 1s
if %world.curobjs(12206)% > 2
  mecho Отправились вы в обратный путь - ко двору Добрыни-богатыря.
  mteleport %actor% 12202
end
detach 12213 %self.id%
~
#12214
Пытаются поднять шапку~
1 g 100
~
return 0
wait 1
oecho Наклонились вы, поднатужились - не смогли шапку малую поднять.
oecho Лежит она, не сшевелится
wait 1
oecho Калика перехожий пришел с севера.
calcuid beggary 12210 mob
oteleport %beggary% %self.room%
exec 12215 %beggary.id%
attach 12232 %self.id%
detach 12214 %self.id%
~
#12215
Совет калики во второй ветке квеста.~
0 z 100
~
wait 1s
set selfquestor %random.pc%
if %selfquestor.sex% == 1
  say Эх ты, %selfquestor.name%, детинушка!
else
  say Эх ты, %selfquestor.name%, девица!
end
mecho _- Что же шапку поднять, с места стронуть не можешь?
ул
say А то шапка-то не простая,
mecho _- Шапка золота литого - богатырская.
mecho _- Чтоб ту шапку-то с земли взять силушку-то надо богатырскую.
mecho _- Полной мерую отмеренную, не половинною.
язвить
wait 2
say Ступай-ка ты в чисто поле, поднимись-ка там на холм на высокий.
mecho _- Лежит там на холме том высоком камень бел-горюч,
mecho _- Из-под камня ключ бежит-пенится
mecho _- Набери там водицы ковшик, да водицей той не побрезгуй....
wait 1
mload obj 12213
give ковшик %selfquestor.name%
взд
emot пошел своей дорогой, шалыгой подорожной помахивая
calcuid hill 12250 room
attach 12217 %hill.id%
wait 1
%purge% %self%
~
#12216
Выпили воды из ковшика~
1 c 2
пи~
if ( %cmd.mudcommand% != пить )
  return 0
  halt
end
set rodnik родник
set kovshik ковшик
if (!%kovshik.contains(%arg%)% && !%rodnik.contains(%arg%)%)
  return 0
  halt
end
if %cmd% != пить 
  return 1
  halt
end
oecho _Осушили вы ковшик маленький, каликой перехожего рукой поданый.
oecho _Полной мерою отмерена сила в нем была богатырская.
oecho _Мерой полною, без изъяну.
wait 1
eval %actor.hitp% %actor.maxhitp%
osend %actor% Вы почувствовали себя здоровым
eval %actor.move% %actor.maxmove%
osend %actor% Вы почувствовали себя полным сил.
calcuid stone 12219 mob
attach 12218 %stone.id%
calcuid helmet 12211 obj
exec 12219 %helmet.id%
wait 1
%purge% %self%
~
#12217
Набрали воды в ковшик из родника~
2 c 1
н на нап напо напол наполн паполни наполнит наполнить~
eval container %arg.car%
eval source %arg.cdr%
set kovshik ковшик
set rodnik родник
if !%kovshik.contains(%container%)% || !%rodnik.contains(%source%)%
  wsend %actor% Вы за этим сюда шли?
  return 1
  halt
end
return 0
calcuid ladles 12213 obj
*attach 12216 %ladles.id%
wecho Вы зачерпнули ковшиком воды из родника.
wait 1 
%purge% %ladles%
wload obj 12214
*set target %random.pc%
wforce %actor% get ковшик
detach 12217 %self.id%
~
#12218
Выпили воды из родника~
0 c 1
пи пит пить dr dri drin drink~
set rodnik родник
if !%rodnik.contains(%arg%)%
  return 0
  halt
end
dg_cast 'исцеление' %actor.name%
dg_cast 'восстановление' %actor.name%
dg_cast 'насыщение' %actor.name%
~
#12219
Релоад богатырской шапки~
1 z 100
~
wait 1
oload obj 12212
wait 1
%purge% %self%
~
#12220
Поднимают богатырскую шапку~
1 g 100
~
return 0
wait 3
oecho _Вот теперь-то тебе без труда великого
oecho _Шапку богатырскую, шапку золота литого увесисту
oecho _Со сырой земли поднять.
*calcuid room1 %self.room%
*attach 12234 %room1.id%
*set target %actor%
*global target
*remote target %room1.id%
*rdelete target %self.id%
*exec 12234 %room1.id%
oforce %actor% get шапка
%send% %actor% _Отправились вы в путь обратный, неблизкий.
%send% %actor% _Ко двору широкому Добрыни-богатыря.
%teleport% %actor% 12202 horse
detach 12220 %self.id%
~
#12221
Первый раз заходят к богатырям-охранникам~
0 q 100
~
wait 1
say Эй, ты, деревенщина-бездельщина!
mecho _- Ты чего это тут вокруг бродишь-высматриваешь!
mecho _- А проваливай-ка ты своею дорогою, ждем мы сегодня посольство великое.
mecho _- Самого Змея Великого сватовство к царевне.
wait 1
mecho _Набросились тут на вас богатырь-змеевич с басурманами, начали бить-колотить да вон гнать
mecho _Хоть силушка-то у вас и богатырская, да один вы богатырь супротив троих.
mecho _Прогнали они вас далеко в чисто поле.
mteleport %actor% 12283 horse
wait 1
mload mob 12202
mteleport dwarf12200 12270
wait 1
*calcuid dwarf 12202 mob
*exec 12223 %dwarf.id%
attach 12222 %self.id%
detach 12221 %self.id%
~
#12222
Второй раз заходят к богатырям-охранникам~
0 q 100
~
wait 1
set item1 %actor.eq(5)%
set item2 %actor.eq(6)%
set item3 %actor.eq(8)%
set item4 %actor.eq(9)%
if ((%item1.vnum% == 12203 ) && (%item2.vnum% == 12201 ) && (%item3.vnum% == 12202 ) && (%item4.vnum% == 12200 ))
  calcuid guard2 12204 mob
  ужас %actor.name%
  exec 12225 %guard2.id%
  detach 12222 %self.id%
  halt
end
say Эй, ты, деревенщина-бездельщина!
mecho _- Ты чего это тут вокруг бродишь-высматриваешь!
mecho _- А проваливай-ка ты своею дорогою, ждем мы сегодня посольство великое.
mecho _- Самого Змея Великого сватовство к царевне.
wait 1
mecho _Набросились тут на вас богатырь-змеевич с басурманами, начали бить-колотить да вон гнать
mecho _Хоть силушка-то у вас и богатырская, да один вы богатырь супротив троих.
mecho _Прогнали они вас далеко в чисто поле.
mteleport %actor% 12283 horse
~
#12223
Мужичок-с-ноготь дает совет~
0 q 100
~
wait 1
emot осмотрел Вас с ног до головы
взд
if %actor.sex% == 1
  say Эх ты, %actor.name%, детинушка!
else
  say Эх ты, %actor.name%, девица!
end
mecho _- Коль пош%actor.y% к царевне свататься, разузнал%actor.u% бы уж вести здешние
mecho _- А посватался к ней красавице, Змей поганый рода змиева
mecho _- Пригрозил, что страну разору предаст, да всех людей в полон уведет,
mecho _- Коль не пойдет за него Дивнокраса, откажется
wait 1s
say А сидит сам змей в палатах чернокаменных
mecho _- Собирает посольство великое
mecho _- Хочет к царевне ехать-свататься.
wait 2
emot сказал так, указал вам на дорогу к палатам чернокаменным, да только и видели его
mdoor 12270 n room 12277
wait 1
%purge% %self%
~
#12224
Вошли к змею~
0 r 100
~
wait 1
say Фуу.. надо же - досель русского духа слыхом не слыхивал, а тут он сам да ко мне в двери!
mecho _- Ты чего сюда явилс%actor.u%?
mecho _- Да я же тебя на одну ладонь посажу, да другой и прихлопну!
хохот
wait 1 
mkill %actor%
~
#12225
Заходят к богатырям в змеевых шмотках~
0 z 0
~
wait 1
emot осмотрел Вас с ног до головы
челю
wait 1s
say Да, видать, зря змей поганый силою похвалялся!
mecho _- Нашлась-таки сила богатырская, управа на злобу змеиную!
emot грозно посмотрел на богатыря-змеевича
wait 1
say Ну-ка, ты, отродие, тоже отсюда проваливай!
mecho _- Убирайся, чтоб и духу твоего змеиного не было!
атаковать guard1223
mforce guard1222 атаковать guard1223
calcuid princess 12207 mob
attach 12226 %princess.id%
~
#12226
Заходят к Дивнокрасе~
0 q 100
~
wait 1
вста
mtransform 12209
if %actor.sex% == 1
  say Здраве будь, добрый молодец!
else
  say Здраве будь, красна девица!
end
mecho _- Знаю я, зачем припожаловал%actor.g%!
mecho _- По всему видать - удалой богатырь Добрыня-свет Евсеевич,
mecho _- Раз уж сват его самого Змея одолел без труда великого.
wait 2
say Скажи же так ему - пусть первый день ждет меня, не печалится.
mecho _- А в день второй пусть пир готовит свадебный.
mecho  - На третий же день - пусть встречает меня вместе со свитой моей.
wait 2s
проща %actor.name%
mecho _Поклонились вы, да отправились в путь обратный,
mecho _Путь неблизкий - ко Добрыни двору широкому.
mteleport %actor% 12202
calcuid warrior 12201 mob
attach 12206 %warrior.id%
detach 12205 %self.id%
detach 12226 %self.id%
~
#12227
Поклон у горы2~
2 c 1
поклон поклониться~
if !%arg.contains(земле)%
  return 0
  halt
end
wait 1
wsend %actor% Поклонились вы земле-матушке, попросили у нее силушки богатырской,
wait 2
eval heal %actor.maxhitp%
eval buf %actor.hitp(%heal%)%
wsend %actor% Вы почувствовали себя здоровым
eval energy %actor.maxmove%
eval buf %actor.move(%energy%)%
wsend %actor% Вы почувствовали себя полным сил.
~
#12228
Убили мужичков 1~
0 f 100
~
calcuid guard 12214 mob
attach 12212 %guard.id%
~
#12229
Убили мужичков 2~
0 f 100
~
calcuid guard 12215 mob
attach 12212 %guard.id%
~
#12230
Убили мужичков 3~
0 f 100
~
calcuid guard 12216 mob
attach 12212 %guard.id%
~
#12231
Перезагрузка зоны "Сказка для богатыря"~
2 f 100
~
*ресторим ворота
calcuid gate 12202 room
detach 12200 %gate.id%
attach 12200 %gate.id%
wdoor 12202 e purge
wdoor 12202 e room 12203
wdoor 12202 e flags abcd
wdoor 12202 e name ворота
wdoor 12202 e description ворота
wdoor 12203 w purge
wdoor 12203 w room 12202
wdoor 12203 w flags abcd
wdoor 12203 w name ворота
wdoor 12203 w description ворота
*уничтожаем глобальные переменные
calcuid bedroom 12205 room
rdelete questor122 %bedroom.id%
detach 12201 %bedroom.id%
attach 12201 %bedroom.id%
*первая ветка квеста
calcuid mountain 12211 room
detach 12211 %mountain.id%
detach 12227 %mountain.id%
calcuid robbers 12211 mob
detach 12209 %robbers.id%
attach 12209 %robbers.id%
rdelete questor122 %robbers.id%
*вторая ветка квеста
calcuid hill 12250 room
detach 12217 %hill.id% 
calcuid stone 12219 mob
detach 12218 %stone.id%
*Загрузка богатырской шапки
eval num1 %random.11%
eval loadroom 12243+%num1%
wat %loadroom% wload obj 12211
*третья ветка квеста
calcuid warrior1 12204 mob 
calcuid warrior2 12206 mob 
detach 12221 %warrior2.id%
detach 12222 %warrior2.id%
attach 12221 %warrior2.id%
wdoor 12270 n purge
~
#12232
Блокируем поднимание шапки~
1 g 100
~
return 0
wait 1
oecho Наклонились вы, поднатужиллись - не смогли шапку малую поднять.
oecho Лежит она, не сшевелится
~
#12233
Змей помер~
0 f 100
~
mload obj 12200
mload obj 12201
mload obj 12202
mload obj 12203
~
#12234
Телепорт с поля к Добрыне~
2 z 100
~
wait 1s
%send% %target% _Отправились вы в путь обратный, неблизкий.
%send% %target% _Ко двору широкому Добрыни-богатыря.
%teleport% %target% 12202 horse
rdelete target %self.id%
detach 12234 %self.id%
~
#12235
Богатырь-змеевич выкидывает шмотки~
0 j 100
~
wait 1
set string %object.name%
set objectname %string.car%
бросить %objectname%
~
#12236
Квестор второй раз зашел к мужичкам~
0 q 100
~
wait 1
shou А гляди-ка, кто тут к нам припожаловал!
if %questor122.sex% == 1
  say А давай-ка ты, добрый молодец,
else
  say А давай-ка ты, красна девица,
end
mecho - Нам гроши свои подорожные, да кафтан вместе с шапкою,
mecho - Да коня богатырского со сбруею.
wait 1
mforce %questor122% say А подите-ка вы прочь, поганые!
mecho Тут мужики на вас понакинулись, отобрали гроши подорожные,
mecho Вот бока-то понамяли, да по дороге прочь погнали.
mteleport %actor% 12233 horse
~
$~
