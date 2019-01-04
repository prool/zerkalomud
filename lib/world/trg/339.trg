#33900
гребешок~
0 f 10
~
if %world.curobjs(33901)% < 100
     mload obj 33901
end
if %world.curobjs(33912)% < 50
     mload obj 33912
end
~
#33901
куропатка померла~
0 f 10
~
if %world.curobjs(33916)% < 50
     mload obj 33916
end
~
#33902
кобыла померла~
0 f 10
~
if %world.curobjs(33915)% < 10
     mload obj 33915
end
~
#33903
корова померла~
0 f 10
~
if %world.curobjs(33904)% < 10
     mload obj 33904
end
~
#33904
крыса померла~
0 f 10
~
if %world.curobjs(33903)% < 5
     mload obj 33903
end
~
#33905
песпомер~
0 f 10
~
if %world.curobjs(33902)% < 6
     mload obj 33902
end
~
#33906
седойвоин_кто-топришел~
0 q 100
~
wait 1
msend %actor% Седой воин внимательно осмотрел Вас с головы до пят.
mechoaround %actor% Седой воин внимательно осмотрел %actor.vname% с головы до пят.
mecho Воин на мгновение задумался.
wait 1s
msend %actor% Потом вдруг снова взглянул на Вас.
mechoaround %actor% Потом вдруг снова взглянул на %actor.vname%.
wait 1s 
улыб %actor.name%
say Да, пожалуй ты сможешь мне помочь, %actor.name%...
wait 1s
say Готов%actor.g% ли ты мне помочь?
calcuid voin 33925 mob
attach 33907 %voin.id%
~
#33907
увоина~
0 d 0
да помогу~
wait 1
say Отлично!
wait 5
mechoaround %actor% Старый вояка почесал затылок, уселся поудобнее
mechoaround %actor% и начал что-то тихо говорить %actor.dname%.
msend %actor% Старый вояка почесал затылок и уселся поудобнее.
tell %actor.name% У нас в деревне происходят странные вещи.
tell %actor.name% Все началось после набега половцев.
tell %actor.name% Мой друг сражался как зверь!
tell %actor.name% Но, к сожалению, он потерял зрение в том бою...
взд
wait 10
tell %actor.name% И с тех пор с ним начало происходить что-то странное.
tell %actor.name% Однажды он сказал мне, что слышит голос, зовущий его с запада.
tell %actor.name% А на следующий день он исчез...
tell %actor.name% Я искал его, но не нашел.
wait 5
tell %actor.name% Возможно, ты отыщешь его, %actor.name%, он жил севернее колодца.
tell %actor.name% Там, в его доме, осталась его несчастная жена.
tell %actor.name% Она наверняка отблагодарит тебя, если ты найдешь ее мужа.
wait 1s
say Да, чуть не забыл! 
wait 5
msend %actor% Воин наклонился к Вам и начал шептать на ухо.
mechoaround %actor% Воин наклонился и что-то зашептал на ухо %actor.dname%
msend %actor% Он все говорил о каком-то заброшенном месте.
msend %actor% Но никто не знает где это...
wait 1s
mecho Воин опустил глаза и полностью погрузился в свои думы.
eval questor339 %actor.name%
worlds questor339
detach 33906 %self.id%
calcuid gena 33926 mob
attach 33909 %gena.id%
detach 33907 %self.id%
~
#33908
старушка ~
0 q 100
~
wait 1
msend %actor% Старушка осмотрела Вас с головы до пят.
mechoaround %actor% Старуха осмотрела %actor.rname% с головы до пят.
wait 1s
msend %actor% - Да не отвернут свой лик от тебя Боги, %actor.name%!
msend %actor% После этого она трижды Вас перекрестила и отвернулась.
mechoaround %actor% Старуха перекрестила %actor.vname% и отвернулась.
msend %actor% Мдя... Теперь Боги наверняка, Вас не покинут, а вражьи удары пропадут напрасно.
mechoaround %actor% Не троньте %actor.vname%! Он теперь под защитой Высших Сил!
~
#33909
утешитьжену~
0 c 0
утешить~
if (%arg.contains(женщин)% || %arg.contains(жена)% || %arg.contains(жену)%) 
 if %actor.name%==%questor339%
  wait 2
  calcuid gena 33926 mob
  msend %actor% Женщина взглянула на Вас мокрыми глазами, всхлипнула и перестала плакать.
  attach 33915 %self.id%
  run 33915 %self.id%
 else
  wait 2
  msend %actor% Женщина взглянула на Вас мокрыми глазами, всхлипнула
  msend %actor% и вновь разрыдалась.
 end
else
 return 0
end
~
#33910
удьякапросто~
0 q 100
~
wait 1s
msend %actor.name% Дьячок перестал писать, на мгновение задумался и продолжил дальше писать, не замечая Вас.
~
#33911
старухаовдове~
0 q 100
~
if (%actor.name%!=%questor339%)
 halt
end
wait 2
if %exist.mob(33927)%
 msend %actor.name% Старушка наклонилась к Вам и начала тихо говорить.
 tell %actor.name% %actor.name%, я молюсь день ночь за одну невинную женщину.
 mechoaround %actor% Старуха прижалась к %actor.dname% и стала еле слышно говорить.
 tell %actor.name% Вдова, живущая на окраине деревни, очень страдает!
 tell %actor.name% К ней является призрак ее мужа, и никто не может ей помочь.
 tell %actor.name% Помоги ей, и Боги тебя не оставят без внимания.
 mecho Старуха повернулась спиной к присутствующим и стала креститься.
 calcuid vdova 33910 mob
 attach 33916 %vdova.id%
end
detach 33911 %self.id%
~
#33912
дьяквыдачаквеста~
0 q 100
~
wait 1s
msend %actor% Дьячок перестал писать, на мгновение задумался и продолжил дальше писать, не замечая Вас.
if %actor.name%==%questor339%
 if %exist.mob(33927)%
  wait 1s
  msend %actor% Неожиданно дьячок поднял на Вас глаза и оглядел с головы до пят.
  msend %actor% - А, вояка. Тебя, наверно, прислала жена лучника. Ну что ж...
  wait 1s
  msend %actor% - На кладбище появляются духи - избавь нас от них, и тогда я, возможно, помогу тебе.
  msend %actor% Дьяк вновь занялся своими делами.
  calcuid nichiy 33915 mob
  attach 33913 %nichiy.id%
  attach 33930 %self.id%
  detach 33912 %self.id%
 end
end
~
#33913
убогийопризраке~
0 m 1
~
wait 1
if %amount% < 100
   say Спасибо государе, да продлятся Ваши дни на русской земле!
   halt
end
switch %myvar%
  case 1
    say На кладбище стали появляться духи!
    ужас
    wait 1
    mecho Убогий замолчал давая понять что знает еще что-то.
    set myvar 2
    global myvar
  break
  case 2
    say Только появляются они по ночам, поэтому днем на кладбище безопасно.
    wait 1
    mecho Убогий замолчал давая понять что знает еще что-то.
    set myvar 3
    global myvar
  break
  case 3
    say Еще люди гуторят, что там есть и источник зла! Большой призрак!
    wait 1
    mecho Убогий замолчал давая понять что знает еще что-то.
    set myvar 4
    global myvar
  break
  case 4
    say И что появляется он в полнолуние. Тогда туда лучше не показываться.
    wait 1
    mecho Убогий замолчал давая понять что знает еще что-то.
    set myvar 5
    global myvar
  break
  case 5
    say И еще говорят, будто призрак этот мужа женщины, живущей на окраине в старом доме...
    wait 1
    mecho Убогий замолчал, вдруг изловчился, прыгнул в кусты и пропал.
    set myvar 0
    global myvar
    mpurge %self.name%
  break
  default
    say Огромное спасибо, баре, да не отвернется от тебя удача!
    wait 1
    mecho Убогий замолчал давая понять что знает что-то очень важное.
    set myvar 1
    global myvar
  break
done
~
#33914
убогийпросто~
0 q 100
~
%actor.wait(2)%
wait 1
mecho Убогий упал ниц и протянул к Вам свои грязные руки.
msend %actor% Вы уставились на убогого человека.
wait 1s
msend %actor% Помогите люди добрые, я сам не местный, дом сгорел, воры украли все мои деньги.
msend %actor% Мне надо не так уж и много - монет 100, а лучше 200, чтоб добраться до Киева.
wait 2
msend %actor% Убогий посмотрел на Вас жалобно и заткнулся.
~
#33915
утешилжену2~
0 z 100
~
%actor.wait(3)%
wait 2
if %actor.sex% == 1
   msend %actor% Вы... хм... утешили жену охотника... лучше бы этого никто не видел... 
   wait 1s
   say %actor.name%, я вижу ты на многое способен. 
   say Мой муж искал исчезнувшее поселение. 
   say И в последнее время он зачастил к местному дьяку.
   say Хотя и он очень страннен.
   wait 1s
   say Его мало кто видел. Так вот, муж говорил, что дьяк знает как туда пройти.
   say Вернее, как туда пройти безопаснее.
   wait 1s
   msend %actor% Женщина обняла Вас и нежно поцеловала: "Найди моего мужа, и ты не пожалеешь!"
   mechoaround %actor% Женщина обняла %actor.vname% и нежно поцеловала.
else
   msend %actor% Ну что ж, женщине легче понять женщину... Вы утешили как могли.
   wait 1s
   say %actor.name%, ты сильная женщина, я бы никогда не смогла взяться за оружие.
   say Мне кажется, тебе будет под силу найти моего мужа.
   say Он часто говорил о каком-то месте, будто оно скрыто от посторонних.
   say В ответ я тебя щедро награжу, супруг - это единственное что у меня осталось.
   say Моего мужа часто видели у нашей церквушки, говорят, что дьяк знает как пройти туда.
   say Пожалуйста, верни мне моего ненаглядного.
   плак
end
 calcuid star 33917 mob
 attach 33911 %star.id%
 detach 33908 %star.id%
 calcuid diak 33916 mob
 detach 33910 %diak.id%
 attach 33912 %diak.id%
 detach 33909 %self.id%
 detach 33915 %self.id%
~
#33916
вдова выдача задания~
0 q 100
~
if (%actor.name%==%questor339%) && %exist.mob(33927)%
 wait 1
 просн
 встать
 wait 1s
 mecho Вдова тепло улыбнулась и... вдруг неожиданно разрыдалась.
 wait 1s
 mecho Успокоившись, снова, как бы виновато, улыбнулась.
 wait 1s
 msend %actor% - Извините меня, но у меня большое горе. Мой муж когда-то давно погиб
 msend %actor% в неравном бою. И он не был предан земле.
 wait 1s      
 всхл
 wait 1s
 msend %actor% - Теперь же - продолжила женщина, - он приходит ко мне по ночам.
 msend %actor% Я немного знакома с колдовством, но чувствую. что не смогу долго
 msend %actor% ему противостоять. Прошу тебя, %actor.name%, останови его!
 wait 1s
 msend %actor% - В качестве платы я научу тебя кое-чему. Прошу тебя, помоги!
 msend %actor% Женщина тяжело вздохнула и продолжила.
 wait 1s
 msend %actor.name% - Он появляется в районе кладбища, но я не знаю, как его выманить.
 msend %actor.name% Удачи тебе! - сказала она и отвернулась.
 attach 33918 %self.id%
 detach 33916 %self.id%
end
~
#33917
иконассанком~
2 c 0
прикоснуться~
wait 1
if !(%arg.contains(лик)%) 
   return 0
   halt
end
wsend  %actor% Икона задрожала, начала светиться, и... вдруг яркая вспышка ослепила Вас!
wsend  %actor% Спустя мгновение Вы снова смогли видеть и с удивлением обнаружили, что
wsend  %actor% светитесь необычным голубоватым сиянием!
wload mob 33928
calcuid slav 33928 mob
attach 33923 %slav.id%
exec 33923 %slav.id%
wait 1s
wpurge сварог
detach 33917 %self.id%
~
#33918
увдовы с заданием~
0 q 100
~
if (%actor.name%==%questor339%) 
 if %exist.mob(33927)%
  wait 2
  всхлип
  msend %actor% - Ах, %actor.name%, он все еще мучает меня!
 else
  wait 2
  ул
  msend %actor% - Ты покончил%actor.g% с ним?
  attach 33920 %self.id%
  detach 33918 %self.id%
 end
end
~
#33919
доложитьосмертидьяку~
0 c 0
доложить~
if (%actor.name%!=%questor339%) 
 return 0
 halt
end
say Ну что ж, я вижу ты справил%actor.u%! Теперь я, пожалуй, открою тебе один секрет.
mecho Дьяк на мгновение задумался.
wait 8
say Икона с изображением Сварога имеет способность накладывать на людей 
mecho Невидимую защиту. На того, кто к ней прикоснется, снизойдет защита Богов!
wait 1s
say А тот, кого ты ищешь, ушел на запад. Поторопись!
if %world.curobjs(33935)% < 1
 mload obj 33935
 say Возьми это - пригодится...
 wait 2
 дать ключ %actor.name%
end
wait 2
mecho Дьяк отвел взгляд от Вас и принялся за свою прежнюю работу.
calcuid aaa 33981 room
attach 33917 %aaa.id%
detach 33919 %self.id%
~
#33920
доложитьосмертивдове~
0 c 0
доложить~
if (%actor.name%!=%questor339%) 
 return 0
 halt
end
say Ну что ж, я вижу ты справил%actor.u%! Теперь я, пожалуй, отблагодарю тебя.
wait 1s
mecho Вдова начала рыться в сундуках.
wait 1s
mecho Вот! - сказала она достав из сундука небольшую книгу.
say Возьми эти мои сбережения и книгу в знак благодарности.
mload obj 33900
mload obj 33929
дать кол %actor.name% 
дать гор %actor.name%
wait 1s
mecho Вдова улыбнулась и помахала Вам на прощанье.
calcuid  vdova 33910 mob
detach 33920 %vdova.id%
~
#33921
удалениелучника~
2 z 100
~
wait 1s
%purge% questor3391
wecho Очень яркая вспышка ослепила Вас на мгновение! Да уж - присвистнули Вы...
if %world.curobjs(33934)% == 0
wload obj 33934
end
~
#33922
загрузкаобъектовлучника~
0 n 100
~
if %world.curobjs(33905)% < 2
mload obj 33905
end
if %world.curobjs(33913)% < 25
mload obj 33913
end
if %world.curobjs(33914)% < 10
mload obj 33914
end
if %world.curobjs(33925)% < 10
mload obj 33925
end
~
#33923
сварог~
0 z 0
~
wait 1
mecho Сварог появился в клубах дыма!
say %actor.name%, иди, я незримо буду с тобой!
dg_cast 'san' %actor.name%
mecho Сварог исчез...
~
#33924
улучника~
0 r 100
~
wait 1s
появ
say О, спаситель мой! Спасибо тебе!
wait 1s
mecho Лучник задумался.
say Я искал потерянное поселение и обнаружил эти руины.
say Но вот беда, я где-то обронил свою счастливую стрелу.
say Там я слышал писк крыс. Найди ее и тогда я вернусь домой!
detach 33924 %self.id%
~
#33925
датьнаконечниклучнику~
0 j 100
~
wait 1
if %object.vnum% == 33934
 say Огромное спасибо! Это он, теперь я наконец обрету покой!
 mecho Лучник схватил наконечник и выкрикнув какое-то заклинание исчез в яркой вспышке.
 mecho Отнеси его моей жене! - донеслось уже откуда-то далеко.
 calcuid luks 33949 room
 exec 33921 %luks.id%
 calcuid genae 33926 mob
 attach 33927 %genae.id%
end
~
#33927
датьнаконечникжене~
0 j 100
~
wait 1
if !(%object.vnum% == 33934)
msend %actor% Зачем мне это?
eval getobject %object.name%
броси %getobject.car%.%getobject.cdr%
halt
end
if !(%actor.name%==%questor339%)
msend %actor% Hе тебе давали задание, но за наконечник спасибо.
else
mpurge %object.name%
msend %actor% Женщина взглянула на Вас и залилась горькими слезами.
mechoaround %actor% Женщина взглянула на %actor.rname% и залилась горькими слезами.
msend %actor% Мой муж - сквозь слезы проговорила она, - он мертв!
плак
wait 2
say Ну чтож, теперь я хоть знаю его судьбу, видимо он сам этого захотел.
say За это я тебя отблагодарю!
switch %actor.class%
*лекарь
case 0
if (!%actor.spelltype(изгнать зло)%) & (%actor.level%>=10)
mspellturn %actor.name% изгнать.зло set
say О, %actor.name%. Познай заклинание изгнать зло!
else
%self.gold(+1000)%
дать 1000 кун %actor.name%
end
break
*колдун
case 1
if (%random.10% < 5)
if (!%actor.spelltype(клонирование)%) & (%actor.level%>=20)
mspellturn %actor.name% клонирование set
say О, %actor.name%. Пусть же ты сможешь размножаться без помощи других!
end
end
break
*тать
case 2
if (!%actor.skill(подкрасться)%) & (%actor.level%>9)
mskillturn %actor.name% подкрасться set
say Вот знай теперь, как подкрадываться, %actor.name%.
else
say Извини, но либо ты мал%actor.g% еще, либо уже знаешь подкрасться. 
end
break
*богатырь
case 3
if %actor.skill(ярость)% < 98
if %actor.skill(ярость)% > 4
mskilladd %actor.name% ярость %random.3%
else
mecho Извини, но я не могу тебя научить ничему новому...
end
else
дум %actor.name%
mecho Извини, я уже ничему новому тебя не научу...
вздох
end
break
*наемник
case 4
if %actor.skill(спрятаться)% < 98
mskilladd %actor.name% спрятаться %random.3%
else
дум %actor.name%
mecho Извини, я уже ничему новому тебя не научу...
вздох
end
break
*друж
case 5
if %actor.skill(пнуть)% < 98
mskilladd %actor.name% пнуть %random.3%
else
дум %actor.name%
mecho Извини, я уже ничему новому тебя не научу...
вздох
end
break
*кудесник
case 6
if (%actor.level%<18)
say Ты слишком мал, чтоб я учил тебя заклинаниям, прими деньги.
%actor.gold(+1000)%
else
if !%actor.spelltype(групповая сила)%
mspellturn %actor.name% групп.сила set
say О, %actor.name%. Теперь ты сможешь всех сотоварищей делать сильнее!
else
say Ты уже знаешь это заклинание, могу отблагодарить тебя только деньгами. 
%actor.gold(+1000)%
end
break
*Волшебники!
case 7
if (!%actor.spelltype(защитник)%) & (%actor.level%>=14)
mspellturn %actor.name% защитник set
say О, %actor.name%. Теперь ты сможешь призывать защитника!
else
say Извини, но либо ты мал%actor.g% еще, либо Хранитель может сопровождать тебя. 
end
break
*чернок
case 8
if (!%actor.spelltype(увеличить жизнь)%) & (%actor.level%>=13)
mspellturn %actor.name% увеличить.жизнь set
say О, %actor.name%. Теперь ты будешь знать увеличение жизни!
else
say Извини, но либо ты мал%actor.g% еще, либо увеличение жизни тебе уже известно. 
end
break
*витязь
case 9
if %actor.skill(обезоружить)% < 98
mskilladd %actor.name% обезоружить %random.3%
else
дум %actor.name%
mecho Извини, я уже ничему новому тебя не научу...
вздох
end
break
*охот
case 10
if %actor.skill(выследить)% < 98
mskilladd %actor.name% выследить %random.3%
else
дум %actor.name%
mecho Извини, я уже ничему новому тебя не научу...
вздох
end
break
*кузнец
case 11
if %actor.skill(оглушить)% < 98
mskilladd %actor.name% оглушить %random.3%
else
дум %actor.name%
mecho Извини, я уже ничему новому тебя не научу...
вздох
end
break
*купец
case 12
if (!%actor.spelltype(починка)%) & (%actor.level%>=25)
mspellturn %actor.name% починка set
say Вот знай теперь магическую починку, %actor.name%.
else
say Извини, но либо ты мал%actor.g% еще, либо уже знаком с магической починкой.
end
break
*волхв
* case 13
* mload obj 621
* say Получи награду... не очень полезная но....
* дать небес %actor.name%
* break   
default
%self.gold(+1000)%
дать 1000 кун %actor.name%
break
done
wait 1
end
detach 33927 %self.id%
~
#33928
толстыйпомер~
0 f 100
~
if (%world.curobjs(528)%) == 0 && (%random.4%==1)
  mload obj 528
end
~
#33929
репоп квеста~
2 f 100
~
unset questor339
calcuid voin 33925 mob
attach 33906 %voin.id%
calcuid gena 33926 mob
detach 33909 %gena.id%
detach 33915 %gena.id%
detach 33927 %gena.id%
calcuid dyak 33916 mob
detach 33912 %dyak.id%
detach 33919 %dyak.id%
detach 33930 %dyak.id%
attach 33910 %dyak.id%
calcuid star 33917 mob
detach 33911 %star.id%
attach 33908 %star.id%
calcuid ubog 33915 mob
detach 33913 %ubog.id%
attach 33914 %ubog.id%
calcuid vdov 33910 mob
detach 33916 %vdov.id%
detach 33918 %vdov.id%
detach 33920 %vdov.id%
calcuid iconroom 33981 room
detach 33917 %iconroom.id%
calcuid luch 33923 mob
attach 33924 %luch.id%
~
#33930
удьяка с заданием~
0 q 100
~
if %actor.name%!=%questor339%
 wait 1s
 msend %actor.name% Дьячок перестал писать, на мгновение задумался и продолжил дальше писать, не замечая Вас.
 halt
end
if %exist.mob(33927)%
 wait 1s
 msend %actor% Дьяк оторвался от своих дел и что-то проворчал себе под нос, глядя на Вас.
 wait 1s
 msend %actor% Дьяк начал Вас толкать к выходу, давая понять, что больше ему сказать нечего.
 halt
end
wait 1s
msend %actor% Дьяк оторвался от своих дел и наконец заметил Вас.
wait 2
say А, %actor.name%! Хм.. Неужто справил%actor.u% с этой нечистью?
say Ну-ка, ну-ка, раскажи.
wait 2
msend %actor% Дьячок посмотрел на Вас с интересом.
attach 33910 %self.id%
attach 33919 %self.id%
detach 33930 %self.id%
~
#33931
Лоад буки снять оцепенение со знахаря~
0 f 100
~
if %random.100% <= 20
if %world.curobjs(561)% < 2
mload obj 561
end
end
~
$~
