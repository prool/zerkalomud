#20200
клинок звенит~
1 bj 5
~
if %actor%
  osend %actor% Лучик света пробежал по идеально острому лезвию меча и Ваши уста тронула улыбка.
  oechoaround %actor% Лучик света пробежал по идеально острому лезвию меча и уста %actor.rname% тронула улыбка.
end
~
#20201
Вход  в город ~
0 q 100
*~
eval item %actor.eq(3)%
wait 1
if %item.vnum% != 20301
  mecho Увидев вас, суровый страж закричал - Тревога
  say  Старик беги за подмогой!
  wait 2
  say Беги, я их задержу!
  wait 5
  msend %actor.name%  Страж зарычал на Вас - Умри же, лазутчик!
  attack %actor.name%
  calcuid Cluch 20205 mob
  attach 20202 %Cluch.id%
  exec 20202 %Cluch.id%
else
  calcuid Cluch 20205 mob
  attach 20290 %Cluch.id%
  exec 20290 %Cluch.id%
end
detach 20201 %self.id%
halt
end
приве %actor.name%
~
#20202
Старик зовет на помощь ( по входу в город с темным оберегом)~
0 z 100
~
if !%self.fighting%
  wait 1s
  say Бегу, бегу
  wait 1s
  mecho Cтарик умчался вопя во всю глотоку - На помошь!
  calcuid Temn 20264 room
  attach 20203 %Temn.id%
  exec 20203 %Temn.id%
  calcuid Xram 20263 room
  attach 20216 %Xram.id%
  exec 20216 %Xram.id%
  mpurge %self.name%
else
  wait 1
  mecho   Получив сокрушающий удар, старик охнул - "Не успел я"
~
#20203
Лоад помошников по зову старика~
2 z 100
~
wait 1s
wecho Послышался грохот кованых сапог, и к комнату ворвались дружинники.
wait 1s
wload mob 20215
calcuid Plech 20215 mob
attach 20204 %Plech.id%
exec 20204 %Plech.id%
wait 2s
wload mob 20215
calcuid Plech 20215 mob
attach 20204 %Plech.id%
exec 20204 %Plech.id%
wait 2s
wload mob 20225
calcuid Mon 20225 mob
attach 20215 %Mon.id%
exec 20215 %Mon.id%
~
#20204
Помошь пришедших по зову~
0 z 100
~
wait 1
set Target %random.pc%
mecho Прибежавший на подмогу воин закричал - Сдохни %Target.name% !
attack %Target.name%
~
#20205
Кирпчиная кладка ( создание входа в город)~
2 c 1
развалить проломить ломать~
if !%arg.contains(кладка)% && !%arg.contains(стена)%
  return 0
  halt
end
wecho Кирпичная кладка осыпалась под Вашими ударами, открыв проход на север.
wdoor 20274 north room 20264
wdoor 20264 south room 20274
detach 20205 %self.id%
~
#20206
архидьяконбухает~
0 br 100
*~
if %random.100% <= 15
  mecho Архидьякон подошел к чаше с вином и сделал пару глотков.
end
~
#20207
суровый воин хватается за меч после тычка ключника~
0 z 100
~
wait 1s
mecho  Стражник осмотрел Вас с ног до головы.
say Хлюпенькие они какие, разве справятся такие с ханом?
~
#20208
У князя ~
0 r 100
*~
wait 4
mecho Увидев Вас, молодой князь обрадовался.
say Не обманул Микула, прислал храбрецов на подмогу.
say Слушайте же:
wait 2
взд
wait 2
say Беда у нас, осадили город степняки - печенеги, да вы и сами знаете наверно.
say Одолевают псы, долго не продержимся мы, не хватит сил ни людских, ни небесных, чтобы удержать город
mecho Из библиотеки послышался писклявый голос: 
mecho "Да, да... Почти получилось... Осталось найти всего один компонент, и меня услышит 
mecho мать-природа, и защитит своею мудростью от черного войска славный Китеж."
wait 10
взд
say И от волхва нашего никакой помощи, что то мудрит, четвертый день из библиотеки не выходит
say Говорил отец мой, - не доверяй волхвам, они за руны  и князя своего продадут и город 
say огню предадут, да привык я к старику...
wait 9
mecho Князь внезапно выпрямился, лицо его стало властным и решительным.
say Вот как мы поступим.
say Крикну я гридней  своих, пусть посадят они супостата в казематы, дабы смуту не сеял. 
say А Вы же ступайте, да Хана убейте.
say И пусть войско егоное устрашится и отступит от Китежа.
wait 9
взд
say Одна на Вас надежда.
set uman %actor.id% 
worlds uman
if %exist.mob(20600)%
  calcuid uchen 20600 mob
  attach 20601 %uchen.id%
end
calcuid Knaz 20200 mob
attach 20214 %Knaz.id%
calcuid Volxv 20203 mob
attach 20210 %Volxv.id%
detach 20208 %self.id%
~
#20209
квесттатар~
0 p 100
~
return 0
mecho Архидьякон вознес руки, и его озарил божественный свет.
~
#20210
Волхв дает задание и  его сажают в темницу~
0 r 100
*~
wait 3
say Ну что повидались с князем?
say Хороший он мужик, да только слишком прямолинейный. Все силой хочет порешить, да куда там...
say Вона сколько воинов за стеной боя ждут. Коли Хана ихнего порешить, ломануться они на 
say город, и втопчут его в земельку.  
wait 15
say Не брат, тут хитростью надо...
wait 1s
mecho Неожиданно вбежавшие в комнату княжьи гридни принялись заламывать руки седому волхву.
mecho "Ай, рука!!! Идиоты!" - закричал волхв.
mecho Опешив на секунду, гридни саданули пару раз волхва кованными сапогами и потащили в темницу.
mecho  Переписчик поднял голову и, внимательно изучая Вас взглядом, пробормотал:
mecho "Ну все. Теперь точно конец. Погубит Княже город, коли волхва не вызволить из темницы,"
mecho "что подо судным домом..."
calcuid  Temnica 20265 room
attach 20211 %Temnica.id%
exec 20211 %Temnica.id%
mpurge %self.name%
~
#20211
Лоад волхва в темницы и атач тригера к нему на челюсть~
2 z 100
~
wait 2
wload mob 20203
calcuid Vo 20203 mob 
attach  20212 %Vo.id% 
~
#20212
У волхва в темнице~
0 r 100
*~
wait 3
mecho Волхв поднял замученное лицо.
say Как Вы тут оказались???
wait 3
say Хотя сейчас не это главное.
say Осталось совсем мало времени.
wait 3
say Я провел три дня в библиотеке, пытаясь найти способ спасти город, но все было тщетно. 
say Однако сегодня, мне случайно попалась книга тайн трав и природных феноменов. Там был 
say описан один ритуал, с помощью которого можно было бы призвать силы природы, и уберечь 
say город от разрушения. Почти все готово, но необходим еще один ингредиент: папараць-кветка. 
say В книге упоминалось только то, что этот цветок растет на болотах, и пока его еще никто 
say не сумел найти...
wait 3
дум 
wait 3
say Попробуйте поговорить с царским егерем. Он лучше других знает эту местность.
wait 3
say Судьба всего города в твоих руках.
calcuid  eger 20228 mob
attach 20218 %eger.id%
attach 20213 %self.id%
detach 20212 %self.id%
~
#20213
сдаем квест волхву~
0 j 100
*~
switch %object.vnum%
  case 20500
    wait 10
    say Да, это он! 
    mpurge %object%
    wait 30
    mecho Седой волхв начал смешно махать руками и нести всякую дребедень.
    mecho Запахло тараканами и беляшами за 15 кун, повалил дым
    mecho Да старик фокусник прямо, - подумали Вы
    wait 30
    mecho Издалека послышался шум воды.
    say Вскоре город погрузится в лоно природы и души праведных русичей будут спасены. Никогда 
    say не захватить грязным татарам наши дома!
    wait 10
    рад %actor.name%
    eval rand %random.1000%
    if ((%rand% < 199) && (%world.curobjs(20218)% < 3))
      say Прими от меня в подарок эти штаны!
      mload obj 20218
      дать штан %actor.name%
    elseif ((199 <= %rand%) && (%rand% < 400) && (%world.curobjs(20219)% < 3))
      mload obj 20219
      say Прими от меня в подарок эти перчатки!
      дать перчатк %actor.name%
    elseif ((400 <= %rand%) && (%rand% < 600) && (%world.curobjs(20220)% < 3))
      mload obj 20220
      say Прими от меня в подарок эти лапти!
      дать лапти %actor.name%
    elseif ((600 <= %rand%) && (%rand% < 800) && (%world.curobjs(20221)% < 3))
      mload obj 20221
      say Прими от меня в подарок эту рубаху!
      дать рубах %actor.name%
    elseif ((800 <= %rand%) && (%rand% < 900) && (%world.curobjs(20222)% < 3))
      mload obj 20222
      say Прими от меня в подарок эту накидку!
      дать накидк %actor.name%
    elseif ((150 <= %rand%) && (%rand% < 450) && (%world.curobjs(20223)% < 3))
      mload obj 20223
      say Прими от меня в подарок этот перстень!
      дать перст %actor.name%
    elseif ((450 <= %rand%) && (%rand% < 850) && (%world.curobjs(20224)% < 3))
      mload obj 20224
      say Прими от меня в подарок этот оберег!
      дать оберег %actor.name%
    else
      say Спасибо за помощь!
      %actor.exp(+1000000)%
      wait 5
      msend %actor% Вы заметили, что Ваш опыт увеличился.
    end 
    mdoor 20314 east room 20381
    mdoor 20321 north room 20381
    mdoor 20323 north room 20382
    mdoor 20323 east  room 20383
    mdoor 20347 north room 20383
    mdoor 20325 west room 20383
    mdoor 20325 north room 20384
    mdoor 20350 north room 20385
    mdoor 20351 north room 20386 
    mdoor 20352 north room 20387
    mdoor 20353 north room 20388
    mdoor 20355 west room 20388
    mdoor 20332 west room 20389
    mdoor 20332 north room 20390
    mdoor 20334 west room 20390
    mdoor 20334 north room 20391
    mdoor 20360 west room 20391
    mdoor 20361 west room 20392
    mdoor 20362 west room 20393
    mdoor 20338 south room 20393
    calcuid laz 20311 room
    detach 20301 %laz.id%
    attach 20302 %laz.id%
    wait 1s
    say Как, вы еще тут? Сейчас город будет погребен под водой, и все кто в нем останутся -- погибнут!
    say Вы не должны здесь умирать. Сейчас я Вам помогу.
    wait 10
    msend Вы очутились за городом.
    mteleport all 20311
~
#20214
тригернасветлогокнязя ~
0 j 100
*~
if %object.vnum% != 20302
  say Это еще что?
  return 0
  halt
end
wait 1
mpurge %object%
wait 10
рад %actor.name%
say  Я знал что Вы справитесь.
eval rand %random.1000%
if ((%rand% < 250) && (%world.curobjs(20209)% < 3))
  say  Спасибо за службу, в награду же прими от меня этот меч. Он не раз спасал меня в 
  say самых жарких сражениях.
  mload obj 20209
  дать меч %actor.name%
elseif ((200 <= %rand%) && (%rand% < 450) && (%world.curobjs(20210)% < 3))
  mload obj 20210
  say Спасибо за службу, в награду же прими от меня эти сапоги, которые носили только самые 
  say благородные воины.
  дать сапог %actor.name%
elseif ((400 <= %rand%) && (%rand% < 650) && (%world.curobjs(20211)% < 3))
  mload obj 20211
  say Спасибо за службу, в награду же прими от меня эти наручи, которые носили только самые 
  say благородные воины.
  дать наруч %actor.name%
elseif ((600 <= %rand%) && (%rand% < 850) && (%world.curobjs(20212)% < 3))
  mload obj 20212
  say Спасибо за службу, в награду же прими от меня эти рукавицы, которые носили только самые 
  say благородные воины.
  дать рукавиц %actor.name%
elseif ((850 <= %rand%) && (%rand% < 999) && (%world.curobjs(20213)% < 3))
  mload obj 20213
  say Спасибо за службу, в награду же прими от меня эти поножи, которые носили только самые 
  say благородные воины.
  дать понож %actor.name%
elseif ((100 <= %rand%) && (%rand% < 350) && (%world.curobjs(20214)% < 3))
  mload obj 20214
  say Спасибо за службу, в награду же прими от меня этот пояс, который носили только самые 
  say благородные воины.
  дать пояс %actor.name%
elseif ((300 <= %rand%) && (%rand% < 550) && (%world.curobjs(20215)% < 3))
  mload obj 20215
  say Спасибо за службу, в награду же прими от меня этот шлем, который носили только самые 
  say благородные воины.
  дать шлем %actor.name%
elseif ((550 <= %rand%) && (%rand% < 750) && (%world.curobjs(20216)% < 3))
  mload obj 20216
  say Спасибо за службу, в награду же прими от меня этот нагрудник, который носили только самые 
  say благородные воины.
  дать нагруд %actor.name%
elseif ((750 <= %rand%) && (%rand% < 999) && (%world.curobjs(20217)% < 3))
  mload obj 20217
  say Спасибо за службу, в награду же прими от меня этот оберег, который носили только самые 
  say благородные воины.
  дать обере %actor.name%
else
  Спасибо за службу!
  %actor.exp(+700000)%
  wait 5
  msend %actor% Вы заметили, что Ваш опыт увеличился.
end 
wait 10
say Теперь печенеги убоятся и снимут осаду.
say А Вы, оставайтесь на пир, сегодня праздник у ребят.
mecho  "Эй гридни, несите еды и вина" - закричал князь.
wait 3
mecho  В комнату вбежал воротный стражник, - Беда княже! Навалились враги
mecho " Защитников перебили, людей режут как кур, скоро сюда нагрянут, бежать тебе надо , 
mecho княже "- скороговоркой забубнил страж
wait 3
mecho Молодой князь, обмяк и простонал - "Горе мне дураку, не послушал волхва старый елупень. 
см %actor.name%
wait 3
say  Уходите!
say Уходите, пока возможно, не Ваша вина в том что город пал, не Вам и умирать вместе с Китежом.
Wait 30s
mdoor 20201 SOUTH room 20324
mdoor 20257 EAST room 20335
mdoor 20324 north room 20201
mdoor 20335 west room 20257
calcuid ATAKA1 20201 room
calcuid ATAKA2 20257 room
calcuid ATAKA3 20225 room
attach 20221 %ATAKA1.id%
attach 20222 %ATAKA2.id%
attach 20231 %ATAKA3.id%
exec 20221 %ATAKA1.id%
exec 20222 %ATAKA2.id%
exec 20231 %ATAKA3.id%
detach 20214 %self.id%
~
#20215
Помошь пришедших по зову ( монах)~
0 z 100
~
wait 1
set Target %random.pc%
mecho Прибежавший на подмогу монах закричал -  "Проклятие на твою голову %Target.name%
attack %Target.name%
~
#20216
Лоад ключника после его побега  ~
2 z 100
~
wload mob 20205 
calcuid Cluch 20205 mob
attach 20217 %Cluch.id%
~
#20217
Бьют ключника~
0 p 95
*~
mecho " На помошь!" - закричал старик.
mload mob 20215
calcuid Plech 20215 mob
attach 20204 %Plech.id%
exec 20204 %Plech.id%
detach 20217 %self.id%
~
#20218
у егеря1~
0 r 100
*~
wait 1
Эм внимательно осмотрел Вас с ног до головы.
Г гм. Ищешь что, путник?
attach 20219 %self.id%
attach 20220 %self.id%
detach 20218 %self.id%
~
#20219
у егеря2~
0 r 100
*~
wait 1
Эм внимательно осмотрел Вас с ног до головы.
~
#20220
гда егерю~
0 d 1
папараць-кветку~
wait 5
Дум
say Даже и не знаю чем тебе помочь. Слыхивал я что растет где-то в этих местах чудо-цветок.
wait 25
say Много я здешних лесов облазил, только что в топи не захаживал, много чего находил, а 
say такого дива невидывал. 
wait 25
say Впрочем, где-то на севере живут люди на болоте. Они то здесь еще с тех времен, когда 
say Китежа и в помине не было. 
wait 10
say Небось чего да подскажут, коли голову не сложишь в местах гиблых.
detach 20220 %self.id%
detach 20219 %self.id%
~
#20221
лоадмобовнаюжныхвратах~
2 z 0
*~
wait 2
wload mob 20322
calcuid tatar1 20322 mob 
attach 20238 %tatar1.id% .
attach 20224 %tatar1.id% .
exec 20224 %tatar1.id%
wload mob 20323
calcuid tatar2 20323 mob 
attach 20224 %tatar2.id% .
exec 20224 %tatar2.id%
wload mob 20323
calcuid tatar2 20323 mob 
attach 20224 %tatar2.id% .
exec 20224 %tatar2.id%
wload mob 20324
calcuid tatar3 20324 mob 
attach 20224 %tatar3.id% .
exec 20224 %tatar3.id%
wload mob 20324
calcuid tatar3 20324 mob 
attach 20224 %tatar3.id% .
exec 20224 %tatar3.id%
wload mob 20325
calcuid tatar4 20325 mob 
attach 20224 %tatar4.id% .
exec 20224 %tatar4.id%
calcuid tatar4 20325 mob 
attach 20224 %tatar4.id% .
exec 20224 %tatar4.id%
wload mob 20328
calcuid tatar5 20328 mob 
attach 20224 %tatar5.id% .
exec 20224 %tatar5.id%
wload mob 20330
calcuid tatar6 20330 mob 
attach 20224 %tatar6.id% .
exec 20224 %tatar6.id%
~
#20222
лоадмобовнаюжныхвратах~
2 z 0
*~
wait 2
wload mob 20323
calcuid atar2 20323 mob 
attach 20224 %atar2.id% .
exec 20224 %atar2.id%
wload mob 20324
calcuid atar3 20324 mob 
attach 20224 %atar3.id% .
exec 20224 %atar3.id%
wload mob 20324
calcuid atar31 20324 mob 
attach 20224 %atar31.id% .
exec 20224 %atar31.id%
wload mob 20325
calcuid atar4 20325 mob 
attach 20224 %atar4.id% .
exec 20224 %atar4.id%
calcuid atar41 20325 mob 
attach 20224 %atar41.id% .
exec 20224 %atar41.id%
wload mob 20328
calcuid atar5 20328 mob 
attach 20224 %atar5.id% .
exec 20224 %atar5.id%
wload mob 20330
calcuid atar6 20330 mob 
attach 20224 %atar6.id% .
exec 20224 %atar6.id%
~
#20223
лоаддружиков~
0 n 100
*~
if (%world.curobjs(20200)% < 7) && (%random.1000% <= 35)
  mload obj 20200
end
if (%world.curobjs(20205)% < 7) && (%random.1000% <= 35)
  mload obj 20205
end
if (%world.curobjs(20206)% < 7) && (%random.1000% <= 35)
  mload obj 20206
end
~
#20224
мочим дружей~
0 isz 100
*~
wait 2
убить рус
~
#20225
рипключника~
0 f 100
*~
mload obj 20201
~
#20226
загрузбоярина~
0 n 100
*~
if (%world.curobjs(20202)% < 5) && (%random.1000% <= 35)
  mload obj 20202
end
~
#20227
загруздевки~
0 n 100
*~
if (%world.curobjs(20203)% < 5) && (%random.1000% <= 35)
  mload obj 20203
end
~
#20228
загрузмародера~
0 n 100
*~
if (%world.curobjs(20204)% < 5) && (%random.1000% <= 75)
  mload obj 20204
end
~
#20229
загрузписаря~
0 n 100
*~
if (%world.curobjs(20207)% < 9) && (%random.1000% <= 50)
  mload obj 20207
end
~
#20230
загруздьяков~
0 n 100
*~
if (%world.curobjs(20208)% < 6) && (%random.1000% <= 30)
  mload obj 20208
end
~
#20231
АТАКА3~
2 z 0
*~
wait 2
wload mob 20321
calcuid katar1 20321 mob 
attach 20224 %katar1.id% .
exec 20224 %katar1.id%
wload mob 20326
calcuid katar2 20326 mob 
attach 20224 %katar2.id% .
exec 20224 %katar2.id%
wload mob 20326
calcuid katar21 20326 mob 
attach 20224 %katar21.id% .
exec 20224 %katar21.id%
wload mob 20326
calcuid katar22 20326 mob 
attach 20224 %katar22.id% .
exec 20224 %katar22.id%
wload mob 20327
calcuid katar3 20327 mob 
attach 20224 %katar3.id% .
exec 20224 %katar3.id%
wload mob 20327
calcuid katar31 20327 mob 
attach 20224 %katar31.id% .
exec 20224 %katar31.id%
wload mob 20329
calcuid katar4 20329 mob 
attach 20224 %katar4.id% .
exec 20224 %katar4.id%
wload mob 20329
calcuid katar41 20329 mob 
attach 20224 %katar41.id% .
exec 20224 %katar41.id%
wload mob 20329
calcuid katar42 20329 mob 
attach 20224 %katar42.id% .
exec 20224 %katar42.id%
wload mob 20331
calcuid katar5 20331 mob 
attach 20224 %katar5.id% .
exec 20224 %katar5.id%
wload mob 20332
calcuid katar6 20332 mob 
attach 20224 %katar6.id% .
exec 20224 %katar6.id%
~
#20232
даемамульУзнику~
0 j 100
*~
if (%object.vnum% != 20333)
  say Это мне еще зачем?
  return 0
  halt
end
wait 1
mpurge %object%
say Да, это он! 
Ик
Рад
Обнять %actor.name%
say Я зинал! Я зинал, чито миня не биросят!!!
wait 15
say Но я осилабел и не в состоянии виполнить поручение моего хозяина. Это пиридется сиделать тибе.
wait 5
say Архидьякон оказался сильнее чем мы пиредполагали. Неведомая сила излечивает его от любых ран.
say  Но я нашел сипособ его ликвидировать!
wait 20
mload obj 20225
дать пузыр %actor.name%
wait 5
say Ви этом пузырике очень сильный йад! Подлей его в чашу с вином, из киторой духовник постоянно 
say пиет во виремя своих молитв и возвращайса к улему. 
Mecho Узник озираясь скрылся в коридоре.
wait 1
mpurge %self%
~
#20233
заходимкУзнику~
0 r 100
*~
wait 8
mecho Как только Вы вошли в темницу, басурманин вжался в стену, и испуганно заморгал.
~
#20234
льемяд~
2 c 100
влить~
if !%arg.contains(яд)%
  wecho Чего?
  halt
end
calcuid yad 20225 obj
if %actor.eq(19)%==%yad%
  wecho Как?
  halt
end
if %actor.eq(17)%!=%yad%
  wecho Чем?
  halt
end
if (%arg.contains(яд)%) && (%actor.eq(17)%==%yad%)
  wsend %actor% Вы незаметно вылили содержимое пузырька в вино.
  if %actor.sex%==1
    wechoaround %actor% %actor.name% незаметно вылил содержимое пузырька в вино.
  else
    wechoaround %actor% %actor.name% незаметно вылила содержимое пузьрка в вино.
  end
  wecho Некоторое время спустя к чаше подошел Архидьякон и сделал пару глотков.
  wait 2s
  wecho Хрипя и хрюкая духовник упал на пол, и вскоре затих.
  calcuid ar 20208 mob 
  wpurge %ar%
  wload mob 20229
  wpurge %yad%
else
  wecho Куда это вылить?
  halt
end
~
#20235
архидьяксдох~
0 f 100
*~
mload obj 20226
~
#20236
сдаемквестПисчику~
0 j 100
*~
if (%object.vnum% != 20407)
  say Это еще что?
  return 0
  halt
end
wait 1
mpurge %object%
wait 20
mecho Обалдело заморгал, переводя взгляд со свитка на Вас и обратно.
wait 20
say Как? Как ты ее нашел?
wait 20
say Я думал летопись Малого Китежа навсегда утеряна для нас.
Обнять %actor.name%
eval rand %random.1000%
if ((%rand% < 300) && (%world.curobjs(20227)% < 5))
  mload obj 20227
  say Прими за свои труды это в подарок.
  дать брасл %actor.name%
  wait 15
  say А теперь ступай с богом. Вскоре города не будет, а мне еще нужно сделать так, что бы 
  say летописи обоих Китежей не попали в руки басурман.
elseif ((300 <= %rand%) && (%rand% < 600) && (%world.curobjs(20228)% < 5))
  mload obj 20228
  say Прими за свои труды это в подарок.
  дать кольцо %actor.name%
  wait 15
  say А теперь ступай с богом. Вскоре города не будет, а мне еще нужно сделать так, что бы 
  say летописи обоих Китежей не попали в руки басурман.
else
  %self.gold(+10000)%
  say Прими за свои труды это в подарок.
  give 10000 кун .%actor.name%
  say А теперь ступай с богом. Вскоре города не будет, а мне еще нужно сделать так, что бы 
  say летописи обоих Китежей не попали в руки басурман.
end
~
#20237
ккнязюпослеосады~
0 q 100
*~
wait 1s
say Ух, ну и ловко же ты самого басурманского полководца живота лишил%actor.g%, душегубец, наш родненький!
обня %actor.name%
wait 20
say Дал ты нам еще немного времени, авось да продержимся, пока волхв чего надумает.
взд
eval rand %random.1000%
if ((%rand% < 199) && (%world.curobjs(20229)% < 4))
  mload obj 20229
  say Возьми это, тебе наверняка пригодится.
  брос все
  дать маск %actor.name%
elseif ((199 <= %rand%) && (%rand% < 400) && (%world.curobjs(20230)% < 4))
  mload obj 20230
  say Возьми это, тебе наверняка пригодится.
  дать куртк %actor.name%
  брос все
elseif ((400 <= %rand%) && (%rand% < 600) && (%world.curobjs(20231)% < 4))
  mload obj 20231
  say Возьми это, тебе наверняка пригодится.
  дать пояс %actor.name%
  брос все
elseif ((600 <= %rand%) && (%rand% < 800) && (%world.curobjs(20232)% < 4))
  mload obj 20232
  say Возьми это, тебе наверняка пригодится.
  дать башмак %actor.name%
  брос все
else
  Спасибо за помощь!
  %actor.exp(+600000)%
  wait 5
  msend %actor% Вы заметили, что Ваш опыт увеличился.
end 
detach 20237 %self.id%
~
#20238
умерполководец~
0 f 100
*~
calcuid kn 20200 mob
attach 20237 %kn.id%
~
#20282
REPOP 76 ~
2 f 100
*~
wait 1
wdoor 20201 SOUTH purge
wdoor 20257 EAST purge
wdoor 20324 NORTH purge
wdoor 20335 WEST purge
wdoor 20274 NORTH purge
calcuid Vhod 20274 room
attach 20205 %Vhod.id%
~
#20283
Архидьякон !дамаг~
0 p 100
~
mecho Архидьякон вознес руки, и его озарил божественный свет.
dg_cast 'исцеление' %self.name%
~
#20290
Страж видит на вас оберег , действия ключника~
0 z 100
*~
wait 20
mecho Ключник задрожал увидив Вас, и ткнул в бок сурового стража.
say Гляди  дурень! Вот молодцы которых прислал Микула нам на помошь.
wait 3
mecho  Охнув от внезапного тычка в бок суровый дружиник схватился было за меч,
mecho   но разглядев оберег широко улыбнулся
calcuid Surov 20214 mob
attach 20207 %Surov.id%
exec 20207 %Surov.id%
wait 5
say Молчи уж, недотепа.
шеп %actor.name% молодой он еще, думает если у кого хитов меньше чем 1к то и не воин уже.
дум
wait 5
say Впрочем хватит лясы точить тут, идите к князю в палаты, он ждет Вас.
say  Эээ... да не пугайтесь нашего волхва, он у нас немного чудаковатый.
say  Хотя люди знающие поговаривают это он на нас беду накликал и город хочет погубить
интриг 
say  Кто знает, может этот полоумный колдун способен навредить...
~
$~
