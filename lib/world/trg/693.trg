* BRusMUD trigger file v1.0
#69300
ЗасыпаемСевер~
2 c0z0 0
уснуть~
%send% %actor% _Ваше сознание тускнеет...
%echoaround% %actor% _Тело %actor.vname% впнезапно стало терять твердость черт своих...
wait 2s
%send% %actor% _И постепенно исчезает совсем, теряясь в бесконечности сна...
%echoaround% %actor% И через секунду растворилось в безмолвном воздухе...
wait 3s
wteleport %actor% 69360
%echoaround% %actor% _Сгусток висящего тумана вдруг приобрел черты %actor.vname%.









~
#69301
РасскажиЗнахарке~
0 d0 0
желаю~
wait 1s
эм встала, зажгла свечу и стала рассказывать.
wait 4s
mecho - Ведают мудрые, что Марена и Жива есть два Лика Единой Божини.
mecho - Дар Живы- Жизнь, Дар Мары - Смерть, Время Живы - Лето, Время Мары - Зима лютая.
mecho - В бесконечном танце этих Божинь и проявляется Великое Коловращение.
mecho - Чередование Жизни и Смерти во Всемирьи.
mecho - Но случилось так что не вернулось на Небосвод солнце Красное.
mecho - И два века поклоняемсы мы Божини бледноликой Маре.
mecho - Стужами и метелями застудила Она солнце Красное.
mecho - И случилась тогда еще Беда
mecho - Погас, потух костер Древних Богов 
mecho - Тот, что может согреть своим пламенем Солнце Зимнее - Солнце Марино.
взд
wait 1s
mecho - Запалить тот костер можно только от Огнища -
mecho - Ветки с тряпьем от служек Мариных добытого,
mecho - Подоженного Стрелой огненной Вещего Всадника.
mecho - И воссияет тогда Солнце красное.
mecho - И пойдет коловрат своею стезею.
mecho - И придет весна в мир Безмолвия.
wait 1s
mecho - Коль поможешь мне
if %actor.sex% == 1 
mecho - Награжу я тебя тогда - Добра молодца.
else
mecho - Награжу я тебя тогда - Красну девицу.
end
вопрос
detach 69304 %self.id%
attach 69304 %self.id%


~
#69302
ПриветствиеЗнахарки~
0 r0 100
~
wait 1s
mecho - Здравствуй путник нежданный.
mecho - Заходи, проходи - гостем будешь...
mecho - Живу я здесь одна, второй век доживаю.
mecho - До тебя в эту дверь только Беда стучалась.
взд
mecho - Не желаеш ли услышать о крае нашем, да о печали моей?


~
#69303
СумонПечали~
0 d0 3
зови мертвых~
mecho _Поднялась Птица-Печаль, взмыла в черное небо и разнесся зов ее над гибелью.
* * * * *призыв девы печали
wait 1s 
mecho - Лягу замертво, стану Вороном
mecho - Стану будити умерших:
mecho - Станьте, умершие,
mecho - Разбудите убитых!
wait 3s
mload mob 69315
mload mob 69315
mload mob 69315
mecho _Поднялись из Земли-Матери мертвые воины.
wait 20s
mecho - Станьте, убитые
mecho - Разбудите, усопших!
*(сумон усопших)
wait 20s 
mload mob 69316
mload mob 69316
mload mob 69316
mecho _Разошлись гробы шелком крытые и поднялись на зов недавече усопшие!
wait 20s 
mecho - Станьте, усопшие,
mecho - Разбудите, заблудящих!
wait 1s
*(сумон заблудших)
mload mob 69317
mload mob 69317
mload mob 69317
mecho _Со всех окрест слетелись духи заблудшие - ни к Яви ни к Нави не принадлежещие!
wait 3s 
mecho - Станьте, заблудщие
mecho - Разбудите, зверей подъемущих!
wait 20s
*(сумон зверей)
mload mob 69318
mload mob 69318
mload mob 69318 
mecho _Застучали когти зверей невиданных, оскалы зубов небо затмили.
wait 20s
mecho - Станьте, звери подъемущии
mecho - Разбудите, безымянных!
wait 1s
*(сумон безымянных)
mload mob 69319
mload mob 69319
mload mob 69319
mecho _Встали войском призраки безымянные, шелестом волос седых ветры пугая.
уб %actor.name%
detach 69303 %self.id% 


~
#69304
ДаЗнахарке~
0 d0 0
помогу да~
*makeuid quest693 %actor.id%
*global  quest693
calcuid trigroom 69315 room 
calcuid froom 69386 room 
*calcuid froom 69386 room 
set quest693 %actor%
remote quest693 %froom.id%
remote quest693 %trigroom.id%
mecho - Тогда иди!
mecho - Доброго пути Вам воины доблестные!
wait 1s
mecho - Постой!
эм задумалась
wait 3s
mecho - Ведь нет ходу Живым в Чертог Марин.
mecho - Попасть туда можно только если ведущий Вас пожертвует жизнь Свою на Плаху Судеб.
взд
wait 1s
mecho - И должен он умереть не где-нибуль, а на Марином Капище.
mecho - Кровь его будет пропуском Вам.
mecho - Я не могу помочь ему Выжить, но я могу помочь ему Умереть.
mecho - На черных грязях, есть черный ручей.
mecho - Говорят кто выпьет из него, падает замертво.
mecho - Много лет прошло с тех пор.
mecho - Может быть высох он, может быть нет...
дум
wait 3s 
mecho - Но решать, какую смерть выбрать, тебе!
mecho - Возьми вот это.. Может быть пригодится.
mload obj 69307
дать все %actor.name% 
mecho - А я сделала все что могла...
wait 1s
эм тяжело опустилась на деревянную скамью и погрузилась в раздумья
*calcuid mob 69327 mob
detach 69301 %self.id%
detach 69302 %self.id%
detach 69304 %self.id%
*attach 69316 %self.id%
*attach 69310 %mob.id%
*detach 69304 %mob.id%




~
#69305
ПривествиеОтшельника~
0 r0 100
~
эм поднял голову, услышав шаги
wait 2s
mecho - Здравствуй, странник.
wait 1s
mecho - Не ожидал я увидеть здесь, на краю Мира, воинов доблестных.
wait 1s
mecho - Но коли пришел - располагайся! Гостем будешь!
mecho - Живу здесь один я. Снадобьями подторговываю - тем и живу.
эм размашистым жестом указал на заваленый различными сосудами стол.
wait 3s
mecho - Не знаю зачем ты пришел сюда, в этот вечно белый Мир, не мое дело это.
mecho - Но знай!
mecho - Каждый вечер отворяются врата Чертога Мариного. 
mecho - И грозный Всадник на вороном коне выезжает наружу - в Явь Земную скакуна гонит.
mecho - Чтобы вернуться обратно перед самым рассветом.
mecho - А весь день спит он непробудным сном во Чертоге Темяном.
взд
detach 69305 %self.id%


~
#69306
ОткрываемОкноСевер~
2 c0 0
открыть~
if !%arg.contains(окно)%
   wsend %actor.name% Что открываем?
  halt
else
%send% %actor% _Чуть поднапрягшись, Вы распахнули окно.
%echoaround% %actor% _%actor.name% распахну%actor.q% окно.
wait 1s
wecho _Откуда-то снизу, словно из глубины земли послышался гул.
wecho _Он растекался по земле завывая ветрами, зазывая штормами.
wecho _На зов начали слетаться хвори да болезни.
wait 1s
wecho _Но вдруг осветила вспышка небо грозовое и налетевший откуда-то ветер захлопнул окно.
wecho _И все стихло... Словно ничего не было..
wait 2s
*calcuid znobeya 69321 mob
*wteleport %znobeya% 69353
wload mob 69334
detach 69306 %self.id%
end











~
#69307
ОткрываемОкноЮг~
2 c0 0
открыть~
if !%arg.contains(окно)%
   wsend %actor.name% Что открываем?
  halt
else
%send% %actor% Вы попытались открыть окно но Ваши усилия были тщетны.
%echoaround% %actor% _%actor.name% долго и с пыхтением пытал%actor.q% открыть окно, но его услия были тщетны.
wait 1s
wecho _Вдруг из щели между створками окна выпала ветка обернутая в тряпье и упала к Вашим ногам.
wload obj 69310
detach 69307 %self.id%
end
  








~
#69308
ОткрываемОкноЗапад~
2 c0 0
открыть~
if !%arg.contains(окно)%
   wsend %actor.name% Что открываем?
  halt
else
%send% %actor% _Чуть поднапрягшись, Вы распахнули окно.
%echoaround% %actor% _%actor.name% распахну%actor.q% окно.
wait 1s
wecho _Откуда-то снизу, словно из глубины земли послышался гул.
wecho _Он растекался по земле завывая ветрами, зазывая штормами.
wecho _На зов начали слетаться хвори да болезни.
wait 1s
wecho _Но вдруг осветила вспышка небо грозовое и налетевший откуда-то ветер захлопнул окно.
wecho _И все стихло... Словно ничего не было..
wait 2s
*calcuid znobeya 69321 mob
*wteleport %znobeya% 69353
wload mob 69335
detach 69308 %self.id%
end


~
#69309
ОткрываемОкноВосток~
2 c0 0
открыть~
if !%arg.contains(окно)%
   wsend %actor.name% Что открываем?
  halt
else
%send% %actor% _Чуть поднапрягшись, Вы распахнули окно.
%echoaround% %actor% _%actor.name% распахну%actor.q% окно.
wait 1s
wecho _Откуда-то снизу, словно из глубины земли послышался гул.
wecho _Он растекался по земле завывая ветрами, зазывая штормами.
wecho _На зов начали слетаться хвори да болезни.
wait 1s
wecho _Но вдруг осветила вспышка небо грозовое и налетевший откуда-то ветер захлопнул окно.
wecho _И все стихло... Словно ничего не было..
wait 2s
*calcuid znobeya 69321 mob
*wteleport %znobeya% 69353
wload mob 69324
detach 69309 %self.id%
end
  











~
#69310
ВстречаетВихровик~
0 r0 100
~
wait 1s
mecho - Из мертвых восстал ты, коли пришел сюда.
mecho - Не место живым здесь
эм покачал головой
wait 1s
mecho - В оном чертоге служей мары видимо невидимо
mecho - Прознают о тебе и смерти лишишься
mecho - Осторожней будь...
wait 1s
mecho - Да еще...
mecho - Растерял я все уздечки свои, коими ветры свои запрягаю...
mecho - Коль найдешь их в долгу не останусь.
mecho - Чтобы найти меня встань на открытом месте, где выбелены камни ветрами
mecho - И закричи громким голосом слова заветные:
mecho - Как по колкой по стерне, да по выжженой земле вихрь снежный появись!
wait 1s
mecho - _Вихровик поклонился и исчез с порывом ветра.
mpurge вихровик
























~
#69311
ДаемУздечкуВихровику~
0 j0 100
~
if %object.vnum% == 69316
 wait 10
 mpurge уздеч
  mecho - Да, это она - моя уздечка! Ну молодец удружил...
  кив %actor.name%
 switch %random.9%
   case 1
     if %random.100% < 8 && %world.curobjs(69321)% < 5
       mload obj 69321
       mecho  - Награжу я тебя дарами своими.
       wait 1s
       дать все %actor.name% 
       г Вот, держи.
     else
    wait 1s
    mecho - Да истрепалась она совсем - в руках рассыпалась.
    взд
    пож
       halt
     end 
  break
  case 2
    if %random.100% < 8 && %world.curobjs(69322)% < 5 
       mload obj 69322
       mecho  - Награжу я тебя дарами своими.
       wait 1s
       дать все %actor.name% 
       г Вот, держи.
     else
     wait 1s
     mecho - Да истрепалась она совсем - в руках рассыпалась.
     взд
     пож
     halt
     end 
  break
  case 3
       if %random.100% < 8 && %world.curobjs(69323)% < 5
       mload obj 69323
       mecho  - Награжу я тебя дарами своими.
       wait 1s
       дать все %actor.name% 
       г Вот, держи.
       else
       wait 1s
       mecho - Да истрепалась она совсем - в руках рассыпалась.
       взд
       пож
       halt
       end 
  break
  case 4
       if %random.100% < 8 && %world.curobjs(69325)% < 5
       mload obj 69325
       mecho  - Награжу я тебя дарами своими.
       wait 1s
       дать все %actor.name% 
       г Вот, держи.
       else
       wait 1s
       mecho - Да истрепалась она совсем - в руках рассыпалась.
       взд
       пож
       halt
       end 
  break
  case 5
       if %random.100% < 8 && %world.curobjs(69326)% < 6
       mload obj 69326
       mecho  - Награжу я тебя дарами своими.
       wait 1s
       дать все %actor.name% 
       г Вот, держи.
       else
       wait 1s
       mecho - Да истрепалась она совсем - в руках рассыпалась.
       взд
       пож
       halt
       end 
  break
  case 6
       if %random.100% < 8 && %world.curobjs(69327)% < 5
       mload obj 69327
       mecho  - Награжу я тебя дарами своими.
       wait 1s
       дать все %actor.name% 
       г Вот, держи.
       else
       wait 1s
       mecho - Да истрепалась она совсем - в руках рассыпалась.
       взд
       пож
       halt
      end 
  break
  case 7
       if %random.100% < 8 && %world.curobjs(69330)% < 5
       mload obj 69330
       mecho  - Награжу я тебя дарами своими.
       wait 1s
       дать все %actor.name% 
       г Вот, держи.
       else
       wait 1s
       mecho - Да истрепалась она совсем - в руках рассыпалась.
       взд
       пож
       halt
       end 
  break
  case 8
       if %random.100% < 8 &%world.curobjs(69331)% < 5
       mload obj 69331
       mecho  - Награжу я тебя дарами своими.
       wait 1s
       дать все %actor.name% 
       г Вот, держи. 
       else
       wait 1s
       mecho - Да истрепалась она совсем - в руках рассыпалась.
       взд
       пож
       halt
       end 
  break
  default 
       wait 1s
       mecho - Да истрепалась она совсем - в руках рассыпалась.
       взд
       пож
       halt
  break 
done
else
mecho  - Это не то что я просил! Ты заплатишь за собственную глупость!
wait 1s
атак %actor.name%
end

~
#69312
ЗасыпаемВосток~
2 c0z0 0
уснуть~
%send% %actor% _Ваше сознание тускнеет...
%echoaround% %actor% _Тело %actor.vname% впнезапно стало терять твердость черт своих...
wait 2s
%send% %actor% _И постепенно исчезает совсем, теряясь в бесконечности сна...
%echoaround% %actor% И через секунду растворилось в безмолвном воздухе...
wait 3s
wteleport %actor% 69352
%echoaround% %actor% _Сгусток висящего тумана вдруг приобрел черты %actor.vname%.









~
#69313
ЗасыпаемЮг~
2 c0z0 0
уснуть~
%send% %actor% _Ваше сознание тускнеет...
%echoaround% %actor% _Тело %actor.vname% впнезапно стало терять твердость черт своих...
wait 2s
%send% %actor% _И постепенно исчезает совсем, теряясь в бесконечности сна...
%echoaround% %actor% И через секунду растворилось в безмолвном воздухе...
wait 3s
wteleport %actor% 69390
%echoaround% %actor% _Сгусток висящего тумана вдруг приобрел черты %actor.vname%.









~
#69314
ЗасыпаемЗапад~
2 c0z0 0
уснуть~
%send% %actor% _Ваше сознание тускнеет...
%echoaround% %actor% _Тело %actor.vname% впнезапно стало терять твердость черт своих...
wait 2s
%send% %actor% _И постепенно исчезает совсем, теряясь в бесконечности сна...
%echoaround% %actor% И через секунду растворилось в безмолвном воздухе...
wait 3s
wteleport %actor% 69384
%echoaround% %actor% _Сгусток висящего тумана вдруг приобрел черты %actor.vname%.









~
#69315
УмерЯщер~
0 f0 100
~
if %random.100% < 15 
*рубины
mload obj 69336
elseif %random.100% < 10 
*алмазы
mload obj 69335
end
*золото
mload obj 69334
mload obj 69334
mload obj 69334

~
#69316
СдачаКвеста~
0 r0 100
~
*mecho запуск триггера 16 ТЕСТ
*mecho %actor.name% == %quest693.name%
if %actor.name% == %quest693.name%
wait 1s
эм ул
wait 1s
mecho  _Хоть и веют еще метели над Землей-Матушкой и скованы льдом озера синеокие
mecho  _Но принесла весть мне на крыльях Лебедь Белая
mecho  _Что разожгли потухший огонь Древний
mecho  _И постучится завтра к нам в окна Весна-Девица
wait 1s
mecho  _А вот и награда твоя..
 *eval nGold 10000
switch %actor.class%
*лекарь
case 0
if %random.100% < 8 && %world.curobjs(69342)% < 3
   mload obj 69342
дать all %actor.name%
else
   %self.gold(+5000)%
   дать 5000 кун %actor.name%
end
break
*колдун
case 1
if %random.100% < 8 && %world.curobjs(69343)% < 3
   mload obj 69343
дать all %actor.name%
else
   %self.gold(+5000)%
   дать 5000 кун %actor.name%
end 
break
*тать
case 2
if  (%actor.spelltype(украсть)%) && (%actor.skill(спрят)% < 121) 
mskilladd %quest693.name% спрят 10
else
   %self.gold(+5000)%
   дать 5000 кун %actor.name% 
end
break
*богатырь
case 3
if  (%actor.spelltype(бог.молот)%) && (%actor.skill(бог.молот)% < 121) 
mskilladd %actor.name% бог.молот 10
else
   %self.gold(+5000)%
   дать 5000 кун %actor.name% 
end
break
*наемник
case 4
if  (%actor.spelltype(спрят)%) && (%actor.skill(спрят)% < 121)
mskilladd %actor.name% спрят 10
else
   %self.gold(+5000)%
   дать 5000 кун %actor.name% 
end
break
*друж
case 5
if  (%actor.spelltype(осторож)%) && (%actor.skill(осторож)% < 121) 
mskilladd %actor.name% осторож 10
else
   %self.gold(+5000)%
   дать 5000 кун %actor.name% 
end
break
*кудесник
case 6
if %random.100% < 8 && %world.curobjs(69345)% < 3
   mload obj 69345
дать all %actor.name%
else
   %self.gold(+5000)%
   дать 5000 кун %actor.name%
end 
break
*Волшебники!
case 7
if %random.100% < 8 && %world.curobjs(69344)% < 3
   *лента
   mload obj 69344
дать all %actor.name%
else
   %self.gold(+5000)%
   дать 5000 кун %actor.name%
end
break
*чернок
case 8
if %random.100% < 10 && %world.curobjs(69346)% < 3
   *лента
   mload obj 69346
дать all %actor.name%
else
   %self.gold(+10000)%
   дать 10000 кун %actor.name%
end
break
*витязь
case 9
   if  (%actor.spelltype(точн)%) && (%actor.skill(точн)% < 121) 
   mskilladd %actor.name% точн 10
   else
   %self.gold(+10000)%
   дать 10000 кун %actor.name% 
end
break
*охот
case 10
   if  (%actor.spelltype(маскир)%) && (%actor.skill(маскир)% < 121) 
   mskilladd %actor.name% маскир 10
   else
   %self.gold(+10000)%
   дать 10000 кун %actor.name% 
   end
   break
*кузнец
case 11
   if (%actor.spelltype(оглуш)%) && (%actor.skill(оглуш)% < 121)
   mskilladd %actor.name% оглушить 10
   else
   %self.gold(+10000)%
   дать 10000 кун %actor.name%
   end
   break
*купец
case 12
   if (%quest693.spelltype(спрята)%) && (%quest693.skill(спрят)% < 121)
   mskilladd %quest693.name% спрят 10
   else
   %self.gold(+10000)%
   дать 10000 кун %quest693.name%
   end
   break
*волхв
case 13
 if %random.100% < 10 && %world.curobjs(69354)% < 3
   *четки
   mload obj 69354
дать all %actor.name%
else
   %self.gold(+10000)%
   дать 10000 кун %actor.name%
end
break
default
%self.gold(+10000)%
дать 10000 кун %actor.name%
break
done
end

~
#69317
родилсяогневик~
0 n0 100
~
if %random.1000% < 50 && %world.curobjs(69324)% < 5
   mload obj 69324
end

~
#69318
ВозвратИзСна~
2 c0 0
проснуться~
%send% %actor% _Ваше сознание начинает прояснятся, постепенно освобождаясь из объятий сна.
%echoaround% %actor% _Тело %actor.vname% стало терять твердость черт своих и через секунду исчезло совсем.
wteleport %actor.name% 69367
%echoaround% %actor% _Сгусток висящего тумана вдруг приобрел черты %actor.vname%.








~
#69319
УмерлаМара~
0 f0 100
~
if %random.100% < 7 && %world.curobjs(69301)% < 4
*серп
mload obj 69301
elseif %random.100% < 7 && %world.curobjs(69303)% < 4
*оберег
mload obj 69303
elseif %random.100% < 7 && %world.curobjs(69304)% < 4
*браслет
mload obj 69304
elseif %random.100% < 7 && %world.curobjs(69305)% < 4
*щит
mload obj 69305
elseif %random.100% < 7 && %world.curobjs(69300)% < 4
*череп
mload obj 69300
end
mecho _Рассыпалось тело Мары-Морены на тысячи осколков сияющего льда.
mecho _Брызнули они искрами во все стороны 
mecho _Едва касались осколки льда земли-матушки превращались в лебедей белокрылых.
mload mob 69336
mload mob 69336
mload mob 69336
mload mob 69336
mload mob 69336
mload mob 69336
mload mob 69336
mload mob 69336
mload obj 69338

~
#69320
Разжигаем костер~
2 c0 0
разжечь~
*wecho %actor.name% == %quest693.name%
if !%arg.contains(костер)%
  wsend %actor.name% Что разжигаем?
else
    if %actor.haveobj(69309)% && %actor.haveobj(69310)%
%send% %actor% _Вы поднесли Огненную стрелу к ветке с тряпьем и вспыхнула она факелом.
if %actor.sex% == 1 
%echoaround% %actor% %actor.name% поднес Огненную Стрелу к ветке с тряпьем, и вспыхнула она факелом.
else
%echoaround% %actor% %actor.name% поднесла Огненную Стрелу к ветке с тряпьем, и вспыхнула она факелом.
end
   wait 1s
   %send% %actor% _Вы бросили горящую ветку в мертвый костер.
   %echoaround% %actor% %actor.name% броси%actor.q% горящую ветку в мертвый костер.
   wait 1s
   wecho &R_Озарилась ночь нестерпимым жаром.&n
   wait 2s
   wecho &R_Разгорелся огнь тайны хранящий, здраву дарящий.&n
   wait 1s
   wecho _&RЗасверкало светло во Яви Солнце Красное.&n
   wait 1s
   wecho _И вступила весна в свои права.
   wecho _Закатилось Солнце за гору, чтобы встать в новом дне, весною дышащим.
   wecho _И заснула Темная Мать сном беспробудным до своей череды.
   wecho _Придет время проснется Мара-Морена и вновь закружит вьюги да метели, хлады да морозы.
   wait 1s
   wecho _Вдруг окружающее стало расплываться и через миг происшедшее казалось Вам уже сном.
   wait 5s
   wteleport all 69300
   wait 1s
    calcuid zn 69314 mob
    attach 69316 %zn.id%
   remote quest693 %zn.id%
   else 
    wsend %actor.name% Чего-то не хватает
  end
end
 




~
#69321
ЗовемВихровика32~
2 c0 1
кричать слова~
if !%arg.contains(заветные)%
wsend %actor.name% Какие именно слова?
  halt
else
wait 1s
wecho _Зашумели ветра, засвистели - вихрями скружились... И вышел из них Вихровик-Встречник.
calcuid vixrivik 69333 mob
wteleport %vixrivik% 69332
wait 1s
wforce вихро ул
wforce вихров г Ну что нашлись мои уздечки?
wforce вопрос
detach 69321 %self.id%
end
























~
#69322
Колодец~
2 c0 0
пить пит пи~
if !%arg.contains(кол)%
halt
else
%send% %actor% &RЕдва сделав глоток, Вы почувствовали, как кровь становится черной и холодной.&n
%echoaround% %actor% %actor.name% выпи%actor.q% колодца и упа%actor.q% замертво.
detach 69324 %self.id%
attach 69324 %self.id%
exec 69324 %self.id%
eval nHit %actor.hitp%+5
wdamage %actor% %nHit%
end





~
#69323
ПьемИзЧарки~
2 c0 0
пить пит пи~
if !%arg.contains(ч)%
halt
else
*Есть ли объект в инвентаре
if !%actor.haveobj(69307)%
%send% %actor% Вы не смогли это найти!
else
calcuid tmp 69307 obj
*Если емкость не пустая
   if %tmp.val1%>0
   %send% %actor% &RЕдва сделав глоток, Вы почувствовали, как кровь становится черной и холодной.&n
   %echoaround% %actor% %actor.name% выпи%actor.q% колодца и упа%actor.q% замертво.
   eval nHit %actor.hitp%+5
   wdamage %actor% %nHit%
   *Если выпил из чарки квестер переносим в чертог
     if %actor.id% != %quest693.id%
      *если выпил не квестер запусаем проверку состояния и выходим
      *wecho не увчсетер 
       detach 69326 %self.id%
       attach 69326 %self.id%
       exec 69326 %self.id%
     halt
     end
   *wait 5s
   wait 5s
   wecho &C_Взорвались волчьим воем Метели - накрыли хладными крылами Небеса...&n
   wait 1s
   wecho &C_Оглядевшись, Вы поняли, что перешагнули порог Мариного Чертога.&n
   wait 1s 
   wteleport all 69317
   *eval nMaxHit %actor.maxhitp%
   calcuid nTroom 69317 room
   detach 69327 %nTroom.id%
   attach 69327 %nTroom.id%
   exec 69327 %nTroom.id% 
*end
   else
   *Если пустая
   %send% %actor% Пусто.
   end
end
end





~
#69324
ПроверкаСостоянияКолодец~
2 b0z0 100
~
wait 15s
foreach i %self.pc%
*wecho проверяем %i.name% хитов %i.hitp%
if (%i.hitp% <= 1)
wecho _Зашелестел вдруг воздух осенью и возник ниоткуда Ведогонь-охранитель.
*wload mob 69329
calcuid zveruschka 69329 mob
wteleport %zveruschka% 69313
wforce ведого к !исц! .%i.name%
wait 1s
wforce ведого г Погубят тебя действия неразумные!
wforce ведого г Но не время сейчас умирать тебе...
wait 1s
wforce ведого ул .%i.name%
wait 8s
wecho _Ведогонь-охранитель воздел руки к небу и растворился в тишине.
wteleport %zveruschka% 69316
end
done
























~
#69325
ПьемИзЧаркиНеНаКапище~
1 c0 2
пить~
if !%arg.contains(ч)%||%actor.room% == 69315
halt
else
%send% %actor% _Вы попытались выпить их чарки, но Ваша рука застыла недвижимой.
end
























~
#69326
ПроверкаСостоянияКапище~
2 b0z0 100
~
*wecho зуауск проверки состояния
wait 15s
foreach i %self.pc%
*wecho проверяем %i.name% хитов %i.hitp%
if (%i.hitp% <= 1)
wecho _Зашелестел вдруг воздух осенью и возник ниоткуда Ведогонь-охранитель.
*wload mob 69329
calcuid zveruschka 69329 mob
wteleport %zveruschka% 69315
wforce ведого к !исц! .%i.name%
wait 1s
wforce ведого г Погубят тебя действия неразумные!
wforce ведого г Но не время сейчас умирать тебе...
wait 1s
wforce ведого ул .%i.name%
wait 8s
wecho _Ведогонь-охранитель воздел руки к небу и растворился в тишине.
wteleport %zveruschka% 69316
end
done
























~
#69327
ПроверкаСостоянияПослеТелепорта~
2 b0z0 100
~
wait 10s
foreach i %self.pc%
*wecho проверяем %i.name% хитов %i.hitp%
if (%i.hitp% <= 1)
wecho _Зашелестел вдруг воздух осенью и возник ниоткуда Ведогонь-охранитель.
*wload mob 69329
calcuid zveruschka 69329 mob
wteleport %zveruschka% 69317
wforce ведого к !исц! .%i.name%
wait 1s
wforce ведого г Не время сейчас умирать тебе...
wait 1s
wforce ведого ул .%i.name%
wait 2s
wecho _Ведогонь-охранитель воздел руки к небу и растворился в тишине.
wteleport %zveruschka% 69316
end
done


~
#69328
ЗовемВихровика76~
2 c0 1
кричать слова~
if !%arg.contains(заветные)%
wsend %actor.name% Какие именно слова?
  halt
else
*wload mob 69333
wait 1s
wecho _Зашумели ветра, засвистели - вихрями скружились... И вышел из них Вихровик-Встречник.
calcuid vixrivik 69333 mob
wteleport %vixrivik% 69376
wait 1s
wforce вихр ул
wforce вихр г Ну что нашлись мои уздечки?
wforce вопрос 
 detach 69328 %self.id%
end
























~
#69329
ПросимВетры~
2 c0 1
просить ветра~
if !%arg.contains(верните)%
wsend %actor.name% Что просим?
  halt
else
%send% %actor% _Ледяной порыв ветра ударил Вам в спину и невыдержав, Вы преклонили колени пред мощью Ветров.
%echoaround% %actor% _Ледяной порыв ветра ударил в спину %actor.vname% и невыдержав мощи Ветров %actor.name% упа%actor.q% на колени.
wait 2s
wecho _&CСошлись Могучие Вихри в одной точке и все потускнело...&n
wait 5s
wteleport all 69300
end














~
#69330
УмерлаТень~
0 f0 100
~
if %random.100% < 7 && %world.curobjs(69328)% < 6
   mload obj 69328
end

~
#69331
ВстречаетВещийЛучник~
0 r0 100
~
wait 1s
mecho - Ох, далеко забрел ты
mecho - Уж не стрелы ли ты мои ищешь?
wait 2s
mecho - Ищи у мертвых их...
wait 1s
mecho - Ведающему - достаточно...
wait 2s
*встречаем сородича - ведающего
if (%actor.class% == 13)
if %random.100% < 2 && %world.curobjs(69354)% < 3
mecho - Вижу Ведающий ты...
mecho - Вехи на Стезе расставлены повсюду, но не всякие очи способны узреть их.
mecho - Вот возьми эти четки. Они укрепят твои знания.
mecho - Да пребудет с тобой Мудрость Древних!
mload obj 69354
дать все %actor.name%
end
detach 69331 %self.id%
end


~
#69332
УмерлЗаблудший~
0 f0 100
~
if %random.100% < 7 && %world.curobjs(69348)% < 6
   mload obj 69348
end

~
#69333
УмерПогибшийВБою~
0 f0 100
~
if %random.100% < 7 && %world.curobjs(69349)% < 8
   mload obj 69349
end

~
#69334
УмерКупец~
0 f0 100
~
if %world.curobjs(69309)% == 0
mload obj 69309
end
if %random.100% < 7 && %world.curobjs(69347)% < 6
   mload obj 69347
end

~
#69335
ЗасыпаемВоСнеСевер~
2 c0z0 0
заснуть~
calcuid nNroom 69395 room
detach 69339 %nNroom.id%
attach 69339 %nNroom.id%
exec 69339 %nNroom.id% 
%send% %actor% _Ваше сознание тускнеет...
%echoaround% %actor% _Тело %actor.vname% впнезапно стало терять твердость черт своих...
wait 2s
%send% %actor% _И постепенно исчезает совсем, теряясь в бесконечности сна...
%echoaround% %actor% И через секунду растворилось в безмолвном воздухе...
wait 3s
wteleport %actor% 69395
%echoaround% %actor% _Сгусток висящего тумана вдруг приобрел черты %actor.vname%.








~
#69336
ЗасыпаемВоСнеВосток~
2 c0z0 0
заснуть~
%send% %actor% _Ваше сознание тускнеет...
%echoaround% %actor% _Тело %actor.vname% впнезапно стало терять твердость черт своих...
wait 2s
%send% %actor% _И постепенно исчезает совсем, теряясь в бесконечности сна...
%echoaround% %actor% И через секунду растворилось в безмолвном воздухе...
wait 3s
wteleport %actor% 69395
%echoaround% %actor% _Сгусток висящего тумана вдруг приобрел черты %actor.vname%.






~
#69337
ЗасыпаемВоСнеЮг~
2 c0z0 0
заснуть~
%send% %actor% _Ваше сознание тускнеет...
%echoaround% %actor% _Тело %actor.vname% впнезапно стало терять твердость черт своих...
wait 2s
%send% %actor% _И постепенно исчезает совсем, теряясь в бесконечности сна...
%echoaround% %actor% И через секунду растворилось в безмолвном воздухе...
wait 3s
wteleport %actor% 69395
%echoaround% %actor% _Сгусток висящего тумана вдруг приобрел черты %actor.vname%.






~
#69338
ЗасыпаемВоСнеЗапад~
2 c0z0 0
заснуть~
%send% %actor% _Ваше сознание тускнеет...
%echoaround% %actor% _Тело %actor.vname% впнезапно стало терять твердость черт своих...
wait 2s
%send% %actor% _И постепенно исчезает совсем, теряясь в бесконечности сна...
%echoaround% %actor% И через секунду растворилось в безмолвном воздухе...
wait 3s
wteleport %actor% 69395
%echoaround% %actor% _Сгусток висящего тумана вдруг приобрел черты %actor.vname%.






~
#69339
ЛоадСт95~
2 z0 0
~
if %random.100% < 3 && %world.curobjs(69358)% < 4
wait 1s
%send% %actor% _Вдруг, среди зелени травы Вы заметили что-то блестящее.
wait 1s
wload obj 69358
end

~
#69340
ЛоадСт96~
2 z0 0
~
if %random.100% < 3 && %world.curobjs(69357)% < 4
wait 1s
%send% %actor% _Вдруг, среди зелени травы Вы заметили что-то блестящее.
wait 1s
wload obj 69357
end

~
#69341
ЛоадСт97~
2 z0 0
~
if %random.100% < 3 && %world.curobjs(69356)% < 4
wait 1s
%send% %actor% _Вдруг, среди зелени травы, Вы заметили что-то блестящее.
wait 1s
wload obj 69356
end

~
#69342
ЛоадСт94~
2 z0 0
~
if %random.100% < 3 && %world.curobjs(69355)% < 4
wait 1s
%send% %actor% _Вдруг, среди зелени травы, Вы заметили необычный отблеск.
wait 1s
wload obj 69355
end

~
#69343
РезетЗоны~
2 f0 100
~
*расскажи
calcuid nZmob1 69314 mob
detach 69316 %nZmob1.id%
attach 69302 %nZmob1.id%
attach 69301 %nZmob1.id%
*печаль
calcuid nZmob2 69302 mob
attach 69303 %nZmob2.id%
*окна
calcuid nZroom1 69365 room
attach 69306 %nZroom1.id% 
calcuid nZroom2 69366 room
attach 69307 %nZroom2.id% 
calcuid nZroom3 69359 room
attach 69308 %nZroom3.id% 
calcuid nZroom4 69353 room
attach 69309 %nZroom4.id% 
*лучник
calcuid nZmob3 69310 mob
attach 69302 %nZmob3.id%
calcuid pech 69314 mob
attach 69303 %pech.id% 


~
#69344
УмираемВоСне~
2 c0 0
уснуть~
%send% %actor% _Ваше сознание тускнеет...
%echoaround% %actor% _Тело %actor.vname% впнезапно стало терять твердость черт своих...
wait 2s
%send% %actor% _И постепенно исчезает совсем, теряясь в бесконечности сна...
%echoaround% %actor% И через секунду растворилось в безмолвном воздухе...
wait 3s
wteleport %actor% 69394
%echoaround% %actor% _Сгусток висящего тумана вдруг приобрел черты %actor.vname%.






~
#69345
РодилсяЯщер~
0 n0 100
~
if %random.1000% < 350 
mload obj 69337
воор коп


~
#69346
зашливсон~
0 r0 100
*~
wait 2
dg_cast 'защита' %actor.name%!
dg_cast 'сила' %actor.name%!
dg_cast 'затуманивание' %actor.name%!
dg_cast 'каменная' %actor.name%!
dg_cast 'ускорение' %actor.name%!
dg_cast 'мигание' %actor.name%!
dg_cast 'ув жи' %actor.name%!
dg_cast 'ув жи' %actor.name%!
dg_cast 'ув жи' %actor.name%!
dg_cast 'ув жи' %actor.name%!


~
#69347
умерВамфири~
0 f0 100
*~
if %random.1000% < 30 && %world.curobjs(69341)% < 2
   mload obj 69341
end
if %random.1000% < 30 && %world.curobjs(69339)% < 6
   mload obj 69339
end

~
#69348
умерполудница~
0 f0 100
~
if %random.1000% < 25 && %world.curobjs(69316)% < 12
   mload obj 69316
end
if %random.1000% < 10 && %world.curobjs(69318)% < 5
   mload obj 69318
end
if %random.1000% < 10 && %world.curobjs(69351)% < 5
   mload obj 69351
end

~
#69349
умерночница~
0 f0 100
~
if %random.1000% < 25 && %world.curobjs(69316)% < 12
   mload obj 69316
end
if %random.1000% < 10 && %world.curobjs(69302)% < 5
   mload obj 69302
end
if %random.1000% < 10 && %world.curobjs(69352)% < 5
   mload obj 69352
end
if %random.1000% < 10 && %world.curobjs(69319)% < 5
   mload obj 69319
end

~
#69350
умерледяница~
0 f0 100
~
if %random.1000% < 10 && %world.curobjs(69320)% < 5
   mload obj 69320
end
if %random.1000% < 10 && %world.curobjs(69329)% < 5
   mload obj 69329
end

~
#69351
умерогнея~
0 f0 100
~
if %random.1000% < 10 && %world.curobjs(69317)% < 5
   mload obj 69317
end

~
#69352
умердева~
0 f0 100
~
if %random.1000% < 10 && %world.curobjs(69350)% < 4
   mload obj 69350
end

~
$
$
