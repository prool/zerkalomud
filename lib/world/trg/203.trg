#20300
REPOP~
2 f 100
*~
wait 1
wdoor 20314 east room 20320
wdoor 20321 north room 20320
wdoor 20323 north room 20322
wdoor 20323 east  room 20324
wdoor 20347 north room 20324
wdoor 20325 west room 20324
wdoor 20325 north room 20326
wdoor 20350 north room 20327
wdoor 20351 north room 20328 
wdoor 20352 north room 20329
wdoor 20353 north room 20330
wdoor 20355 west room 20330
wdoor 20332 west room 20331
wdoor 20332 north room 20333
wdoor 20334 west room 20333
wdoor 20334 north room 20335
wdoor 20360 west room 20335
wdoor 20361 west room 20336
wdoor 20362 west room 20337
wdoor 20338 south room 20337
calcuid laz 20311 room
attach 20301 %laz.id%
detach 20302 %laz.id%
calcuid lis00 20378 room
attach 20348 %lis00.id%
detach 20347 %lis00.id%
~
#20301
леземвлаз~
2 c 1
лезть пролезть~
if !(%arg.contains(нора)%) 
  wsend %actor% Куда это Вы хотите пролезть?
  return 1
  halt
else
  wait 1
  wteleport %actor% 20279
end
~
#20302
леземвлазпослепотопа~
2 c 1
лезть пролезть~
if !(%arg.contains(нора)%) 
  wsend %actor% Куда это Вы хотите пролезть?
  return 1
  halt
else
  wait 1
  wsend %actor% Вы собрались было лезть в яму, но она оказалась вся заполнена водой.
end
~
#20303
загрузКыштыма~
0 n 100
*~
if (%world.curobjs(20303)% < 5) && (%random.1000% <= 40)
  mload obj 20303
end
if (%world.curobjs(20307)% < 5) && (%random.1000% <= 40)
  mload obj 20307
end
if (%world.curobjs(20310)% < 5) && (%random.1000% <= 40)
  mload obj 20310
end
if (%world.curobjs(20311)% < 5) && (%random.1000% <= 40)
  mload obj 20311
end
if (%world.curobjs(20316)% < 5) && (%random.1000% <= 40)
  mload obj 20316
end
if (%world.curobjs(20317)% < 5) && (%random.1000% <= 40)
  mload obj 20317
end
if (%world.curobjs(20318)% < 5) && (%random.1000% <= 40)
  mload obj 20318
end
~
#20304
загрузсэнгуна~
0 n 100
*~
if (%world.curobjs(20306)% < 5) && (%random.1000% <= 40)
  mload obj 20306
end
if (%world.curobjs(20309)% < 5) && (%random.1000% <= 40)
  mload obj 20309
end
if (%world.curobjs(20312)% < 5) && (%random.1000% <= 50)
  mload obj 20312
end
if (%world.curobjs(20313)% < 5) && (%random.1000% <= 60)
  mload obj 20313
end
if (%world.curobjs(20316)% < 5) && (%random.1000% <= 90)
  mload obj 20316
end
if (%world.curobjs(20328)% < 5) && (%random.1000% <= 160)
  mload obj 20328
end
~
#20305
загрузТушимэла~
0 n 100
*~
if (%world.curobjs(20306)% < 5) && (%random.1000% <= 90)
  mload obj 20306
end
if (%world.curobjs(20308)% < 5) && (%random.1000% <= 80)
  mload obj 20308
end
if (%world.curobjs(20313)% < 5) && (%random.1000% <= 75)
  mload obj 20313
end
if (%world.curobjs(20314)% < 5) && (%random.1000% <= 95)
  mload obj 20314
end
if (%world.curobjs(20316)% < 5) && (%random.1000% <= 90)
  mload obj 20316
end
if (%world.curobjs(20324)% < 5) && (%random.1000% <= 200)
  mload obj 20324
end
~
#20306
загрузЧэрби~
0 n 100
*~
if (%world.curobjs(20307)% < 5) && (%random.1000% <= 40)
  mload obj 20307
end
if (%world.curobjs(20311)% < 5) && (%random.1000% <= 40)
  mload obj 20311
end
if (%world.curobjs(20315)% < 5) && (%random.1000% <= 40)
  mload obj 20315
end
if (%world.curobjs(20316)% < 5) && (%random.1000% <= 40)
  mload obj 20316
end
if (%world.curobjs(20317)% < 5) && (%random.1000% <= 40)
  mload obj 20317
end
if (%world.curobjs(20320)% < 5) && (%random.1000% <= 40)
  mload obj 20320
end
if (%world.curobjs(20327)% < 5) && (%random.1000% <= 50)
  mload obj 20327
end
~
#20307
загрузДунгчи~
0 n 100
*~
if (%world.curobjs(20305)% < 5) && (%random.1000% <= 40)
  mload obj 20305
end
if (%world.curobjs(20311)% < 5) && (%random.1000% <= 46)
  mload obj 20311
end
if (%world.curobjs(20312)% < 5) && (%random.1000% <= 45)
  mload obj 20312
end
if (%world.curobjs(20315)% < 5) && (%random.1000% <= 44)
  mload obj 20315
end
if (%world.curobjs(20316)% < 5) && (%random.1000% <= 40)
  mload obj 20316
end
if (%world.curobjs(20330)% < 5) && (%random.1000% <= 40)
  mload obj 20330
end
~
#20308
загрузХабуту~
0 n 100
*~
if (%world.curobjs(20303)% < 5) && (%random.1000% <= 40)
  mload obj 20303
end
if (%world.curobjs(20307)% < 5) && (%random.1000% <= 40)
  mload obj 20307
end
if (%world.curobjs(20311)% < 5) && (%random.1000% <= 40)
  mload obj 20311
end
if (%world.curobjs(20314)% < 5) && (%random.1000% <= 40)
  mload obj 20314
end
if (%world.curobjs(20315)% < 5) && (%random.1000% <= 40)
  mload obj 20315
end
if (%world.curobjs(20316)% < 5) && (%random.1000% <= 40)
  mload obj 20316
end
if (%world.curobjs(20323)% < 5) && (%random.1000% <= 40)
  mload obj 20323
end
~
#20309
загрузНукура~
0 n 100
*~
if (%world.curobjs(20306)% < 5) && (%random.1000% <= 40)
  mload obj 20306
end
if (%world.curobjs(20308)% < 5) && (%random.1000% <= 40)
  mload obj 20308
end
if (%world.curobjs(20313)% < 5) && (%random.1000% <= 40)
  mload obj 20313
end
if (%world.curobjs(20315)% < 5) && (%random.1000% <= 40)
  mload obj 20315
end
if (%world.curobjs(20316)% < 5) && (%random.1000% <= 40)
  mload obj 20316
end
if (%world.curobjs(20317)% < 5) && (%random.1000% <= 40)
  mload obj 20317
end
if (%world.curobjs(20319)% < 5) && (%random.1000% <= 40)
  mload obj 20319
end
if (%world.curobjs(20329)% < 5) && (%random.1000% <= 40)
  mload obj 20329
end
~
#20310
зашликМикуле~
0 r 100
*~
wait 2
say Стой русич!!!
say Меня ранили, и надежда только на тебя.
say Славный город Китеж осадили басурмане, и мудрый Князь наш, послал меня за подмогой. 
say Поможете ли  Вы супроть их выстоять?
attach 20322 %self.id%
attach 20323 %self.id%
detach 20310 %self.id%
~
#20311
загрузЦагхада~
0 n 100
*~
if (%world.curobjs(20304)% < 5) && (%random.1000% <= 40)
  mload obj 20304
end
if (%world.curobjs(20308)% < 5) && (%random.1000% <= 40)
  mload obj 20308
end
if (%world.curobjs(20313)% < 5) && (%random.1000% <= 40)
  mload obj 20313
end
if (%world.curobjs(20314)% < 5) && (%random.1000% <= 40)
  mload obj 20314
end
if (%world.curobjs(20315)% < 5) && (%random.1000% <= 40)
  mload obj 20315
end
if (%world.curobjs(20316)% < 5) && (%random.1000% <= 40)
  mload obj 20316
end
if (%world.curobjs(20326)% < 5) && (%random.1000% <= 40)
  mload obj 20326
end
~
#20312
загрузБаатура~
0 n 100
*~
if (%world.curobjs(20304)% < 6) && (%random.1000% <= 40)
  mload obj 20304
end
if (%world.curobjs(20309)% < 6) && (%random.1000% <= 40)
  mload obj 20309
end
if (%world.curobjs(20313)% < 6) && (%random.1000% <= 40)
  mload obj 20313
end
if (%world.curobjs(20315)% < 6) && (%random.1000% <= 40)
  mload obj 20315
end
if (%world.curobjs(20316)% < 6) && (%random.1000% <= 40)
  mload obj 20316
end
if (%world.curobjs(20317)% < 6) && (%random.1000% <= 40)
  mload obj 20317
end
~
#20313
загрузОрулук~
0 n 100
*~
if (%world.curobjs(20304)% < 6) && (%random.1000% <= 25)
  mload obj 20304
end
if (%world.curobjs(20308)% < 6) && (%random.1000% <= 25)
  mload obj 20308
end
if (%world.curobjs(20313)% < 6) && (%random.1000% <= 25)
  mload obj 20313
end
if (%world.curobjs(20315)% < 6) && (%random.1000% <= 30)
  mload obj 20315
end
if (%world.curobjs(20316)% < 6) && (%random.1000% <= 30)
  mload obj 20316
end
if (%world.curobjs(20317)% < 6) && (%random.1000% <= 30)
  mload obj 20317
end
if (%world.curobjs(20319)% < 6) && (%random.1000% <= 30)
  mload obj 20319
end
if (%world.curobjs(20329)% < 6) && (%random.1000% <= 30)
  mload obj 20329
end
~
#20314
загрузМэргэн~
0 n 100
*~
if (%world.curobjs(20303)% < 6) && (%random.1000% <= 30)
  mload obj 20303
end
if (%world.curobjs(20307)% < 6) && (%random.1000% <= 30)
  mload obj 20307
end
if (%world.curobjs(20308)% < 6) && (%random.1000% <= 30)
  mload obj 20308
end
if (%world.curobjs(20314)% < 6) && (%random.1000% <= 30)
  mload obj 20314
end
if (%world.curobjs(20315)% < 6) && (%random.1000% <= 30)
  mload obj 20315
end
if (%world.curobjs(20316)% < 6) && (%random.1000% <= 30)
  mload obj 20316
end
if (%world.curobjs(20321)% < 6) && (%random.1000% <= 30)
  mload obj 20321
end
if (%world.curobjs(20322)% < 6) && (%random.1000% <= 30)
  mload obj 20322
end
~
#20315
загрузКэкэритэна~
0 n 100
*~
if (%world.curobjs(20304)% < 6) && (%random.1000% <= 90)
  mload obj 20304
end
if (%world.curobjs(20308)% < 6) && (%random.1000% <= 90)
  mload obj 20308
end
if (%world.curobjs(20313)% < 6) && (%random.1000% <= 90)
  mload obj 20313
end
if (%world.curobjs(20316)% < 6) && (%random.1000% <= 90)
  mload obj 20316
end
if (%world.curobjs(20317)% < 6) && (%random.1000% <= 90)
  mload obj 20317
end
if (%world.curobjs(20326)% < 6) && (%random.1000% <= 90)
  mload obj 20326
end
if (%world.curobjs(20329)% < 6) && (%random.1000% <= 90)
  mload obj 20329
end
~
#20316
загрузДэгэлэй~
0 n 100
*~
if (%world.curobjs(20306)% < 6) && (%random.1000% <= 30)
  mload obj 20306
end
if (%world.curobjs(20308)% < 6) && (%random.1000% <= 30)
  mload obj 20308
end
if (%world.curobjs(20326)% < 6) && (%random.1000% <= 30)
  mload obj 20326
end
if (%world.curobjs(20329)% < 6) && (%random.1000% <= 30)
  mload obj 20329
end
~
#20317
загрузДуулгат~
0 n 100
*~
if (%world.curobjs(20308)% < 4) && (%random.1000% <= 90)
  mload obj 20308
end
if (%world.curobjs(20314)% < 4) && (%random.1000% <= 80)
  mload obj 20314
end
if (%world.curobjs(20315)% < 4) && (%random.1000% <= 90)
  mload obj 20315
end
if (%world.curobjs(20316)% < 4) && (%random.1000% <= 60)
  mload obj 20316
end
if (%world.curobjs(20318)% < 4) && (%random.1000% <= 80)
  mload obj 20318
end
if (%world.curobjs(20320)% < 4) && (%random.1000% <= 90)
  mload obj 20320
end
~
#20318
загрузЛубчитэн~
0 n 100
*~
if (%world.curobjs(20304)% < 3) && (%random.1000% <= 80)
  mload obj 20304
end
if (%world.curobjs(20308)% < 3) && (%random.1000% <= 90)
  mload obj 20308
end
if (%world.curobjs(20316)% < 3) && (%random.1000% <= 80)
  mload obj 20316
end
if (%world.curobjs(20317)% < 3) && (%random.1000% <= 79)
  mload obj 20317
end
if (%world.curobjs(20325)% < 3) && (%random.1000% <= 70)
  mload obj 20325
end
~
#20319
загрузТемника~
0 n 100
*~
if (%world.curobjs(20306)% < 3) && (%random.1000% <= 100)
  mload obj 20306
end
if (%world.curobjs(20309)% < 3) && (%random.1000% <= 100)
  mload obj 20309
end
if (%world.curobjs(20312)% < 3) && (%random.1000% <= 100)
  mload obj 20312
end
if (%world.curobjs(20316)% < 3) && (%random.1000% <= 100)
  mload obj 20316
end
if (%world.curobjs(20328)% < 3) && (%random.1000% <= 100)
  mload obj 20328
end1
~
#20320
загрузИммам~
0 n 100
*~
if (%world.curobjs(20327)% < 4) && (%random.1000% <= 100)
  mload obj 20327
end
if (%world.curobjs(20316)% < 4) && (%random.1000% <= 100)
  mload obj 20316
end
if (%world.curobjs(20305)% < 4) && (%random.1000% <= 100)
  mload obj 20305
end
~
#20321
загрузУлема~
0 n 100
*~
if (%world.curobjs(20316)% < 4) && (%random.1000% <= 100)
  mload obj 20316
end
if (%world.curobjs(20327)% < 4) && (%random.1000% <= 100)
  mload obj 20327
end
if (%world.curobjs(20306)% < 4) && (%random.1000% <= 100)
  mload obj 20306
end
if (%world.curobjs(20309)% < 4) && (%random.1000% <= 100)
  mload obj 20309
end
~
#20322
зашликМикуле2~
0 r 100
*~
wait 2
эм молящими глазами уставился на Вас.
~
#20323
гдамикуле~
0 d 100
помогу~
wait 10
makeuid xman %actor.id%
worlds xman
say Ступайте сквозь лес, да смотрите в болота не попадите. Как за холм зайдете, осмотритесь. 
say У подножия будет нора, туда и лезьте.
wait 20
mload obj 20301
дать оберег %actor.name%
say Одень это, что бы тебя наши признали. 
say Ступайте скорее, не дайте пасть городу, аки пал малый Китеж.
wait 4s
mecho Среди деревьев на востоке вспорхнула птица. 
mecho Ни слова не говоря Микула уверенным движением покрал стрелу на тетиву лука и пульнул 
mecho в ту сторону.
wait 20
calcuid tat 20308 room
attach 20324 %tat.id%
exec 20324 %tat.id%
detach 20322 %self.id%
detach 20323 %self.id%
~
#20324
лоадБасурманина~
2 z 100
*~
wait 2
wload mob 20334
calcuid bas 20334 mob 
attach  20325 %bas.id% 
exec 20325 %bas.id%
~
#20325
басурманинорет~
0 z 100
*~
wait 3
крича Ааааа... мой бедный попа!
wait 10
з
mecho Через пару секунд из-за деревьев появился узкоглазый воин, сжимающий в руках кривую саблю. 
mecho Смешно смотрелись его длинные черные усы, но холодные свиные глазки, уставившиеся прямо на 
mecho Вас настораживали.
wait 2s
say Ты билят ситрилял?!
вопр %xman.name%
wait 10
mecho Почему он Вас зовет Билятом было не понятно, но в любом случае сказать что стреляли не Вы стоит.
attach 20326 %self.id%
wait 5s
say Малчиш?! Значит ти, получай!
убить %xman.name%
detach 20326 %self.id%
~
#20326
басурманинорет2~
0 d 100
нет~
wait 1
detach 20325 %self.id%
wait 10
дум
wait 15
mecho Татарин одним большим шагом оказался рядом с русичем.
say Ага, значит ти билят ситрилял. Получай! 
wait 5
убить русич
calcuid mik 20333 mob
attach 20330 %mik.id%
~
#20327
у хана~
0 z 100
*~
wait 25
Эм презрительно осмотрел Вас и недовольно фыркнул
wait 10
дум
wait 20
Эм отхлебнул из блюдца зеленого чаю
wait 25
say Ви оборванцы не здешние, это сиразу видно. 
wait 5
say Мине не нужны ваши никчемные жизни, и посему Вы можете оситаться живими. 
Дум
wait 5
say При одном условии: по ночам, вдоль стен города биродят ниведомые твари, убивающие моих солдат. 
say Караульные говорят, чито видели, как они пару раз выбегали с болот, чито западнее города. 
say Видимо там их дом. Сиделай так, читобы я о них больше не слышал, и сможеш уйти живым. 
wait 5
say Карашо? 
Эм вопросительно посмотрел на Вас
attach 20328 %self.id%
attach 20329 %self.id%
detach 20327 %self.id%
~
#20328
г нет~
0 d 100
нет~
wait 5
makeuid wman %actor.id%
worlds wman
пож
кив басу
кив сэн
кив туш
calcuid tat1 20317 mob
attach 20332 %tat1.id%
exec 20332 %tat1.id%
calcuid tat1 20318 mob
attach 20332 %tat1.id%
exec 20332 %tat1.id%
calcuid tat1 20334 mob
attach 20334 %tat1.id%
exec 20334 %tat1.id%
detach 20328 %self.id%
detach 20329 %self.id%
~
#20329
г да~
0 d 100
да~
wait 25
say Тогда ситупай, и принеси мине доказательства симерти твари!
mecho Взглянул на басурманина, который в ту же секунду вышел из палатки.
calcuid tar 20334 mob
mpurge %tar%
attach 20334 %self.id%
detach 20328 %self.id%
detach 20329 %self.id%
~
#20330
рипМикулы~
0 f 100
*~
calcuid tar 20334 mob
attach 20331 %tar.id%
exec 20331 %tar.id%
~
#20331
Басурманинведеткхану~
0 z 100
*~
wait 20
say Ти пайдеш са мной к Великому Хану. Он решит чито делать!
wait 25
%echo Басурманин провел Вас под стражей через весь лагерь.
%echo Вы оказались в богатом шатре.
mteleport all 20375
wait 5
calcuid han 20300 mob
exec 20327 %han.id%
calcuid load 20375 room
attach 20333 %load.id%
exec 20333 %load.id%
mpurge %self%
~
#20332
агр~
0 z 100
*~
убить %wman.name%
~
#20333
лоадбасурманина~
2 z 100
~
wload mob 20334
~
#20334
сдаемквестХану~
0 j 100
*~
if (%object.vnum% !=  20331)
  return 0
  say Зачем мне это?
  halt
end
wait 1
mpurge %object%
wait 20
say Этой копной волос я украшу свой щит.
eval rand %random.1000%
if ((%rand% < 100) && (%world.curobjs(20332)% < 3))
  say Ти заслужил награду.
  mload obj 20332
  дать кольц %actor.name%
  wait 10
  say Теперь ухади!
elseif ((100 <= %rand%) && (%rand% < 250) && (%world.curobjs(20338)% < 3))
  say Ти заслужил награду.
  mload obj 20338
  дать перев %actor.name%
  wait 10
  say Теперь ухади!
else
  %actor.exp(+300000)%
  wait 5
  say Ти выполнил мое поручение, и можеш бить свободен.
end 
calcuid tem 20304 mob
attach 20341 %tem.id%
detach 20340 %tem.id%
~
#20335
сдохМонстр~
0 f 100
*~
mload obj 20331
~
#20336
часовойуходит~
0 m 1
*~
wait 1
if %amount% < 2000 then
  морщ
  halt
end
wait 1
с
с
в
~
#20337
заходимкУлему~
0 r 100
*~
wait 5
makeuid oman %actor.id%
worlds oman
mecho Удивленно уставился на Вас.
wait 15
say Кито тибя сюда пустил?!
Дум
wait 20
say Випрочим не важно. У миня есть для тибя интересное предложение...
wait 20
say Мои люди сообщили мине, чито в Китеже есть свой духовник. Именно билагодаря ему осада 
say затянулась и дух горожан еще не силомлен. Есили архидиякон умирет, Великий Хан обиратит 
say сивой билагосиклонний визор на миня. 
wait 20
say Я посилал своиго чиловека решить эту пироблему, но его до сих пор нет, а горожане не 
say сидаются...
wait 15
say Пимаги мине, а я награжу тибя.
say Есили ти наидеш моиво чилавека, передай ему это.
mload obj 20333
дать подвеск %oman.name%
wait 5
say Он тибе поможет. 
detach 20337 %self.id%
~
#20338
сдаемквестУлему~
0 j 100
*~
switch %object.vnum%
  case 20226
    wait 5
    mpurge %object.name%
    wait 20
    say Ну читоже, ти справился си моей пиросьбой и я дарю тибе самое ценное... Жизнь!
    eval rand %random.1000%
    if ((%rand% < 250) && (%world.curobjs(20334)% < 3))
      say Ах да, эту вещь можиш оставить сибе.
      mload obj 20334
      дать кулон %actor.name%
    elseif ((300 <= %rand%) && (%rand% < 550) && (%world.curobjs(20339)% < 3))
      say Ах да, эту вещь можиш оставить сибе.
      mload obj 20339
      дать оберег %actor.name%
    else
      %actor.exp(+350000)%
    end 
  done
~
#20339
сдохХан~
0 f 100
*~
mload obj 20302
~
#20340
заходимкТемнику1~
0 r 100
*~
wait 5
mecho Презрительно осмотрел Вас.
wait 5
say Пшел вон, оборванец!
wait 3s
say Ти меня не расслишал?!
say Зиначит поплатишся своей никчемной жизнию!
убить %actor.name%
~
#20341
заходимкТемнику2~
0 r 100
*~
wait 10
say Я силишал чито ти попал в милость к Хану.
Дум
wait 20
say Читож, ти можеш бить мине полезен.
wait 5
say Отнесешь это баскаку, в Малый Китеж, чито на востоке отсюда.
mload obj 20335
дать доск %actor.name%
wait 10
say Коли добрые вести от него пиренесешь, награжу подобающе.
attach 20344 %self.id%
detach 20341 %self.id%
~
#20342
ковыряемдеревяшку~
1 c 100
проковырять~
if !(%arg.contains(доску)%) 
  osend %actor% Что вы собрались ковырять?
  return 1
  halt
else
  wait 10
  osend %actor% Вы усердно занялись ковырянием.
  oechoaround %actor% %actor.name% начал%actor.g% усердно ковырять доску.
  wait 30
  oecho Воск плохо поддавался ковырянию, и Вы оставили доску в покое.
  oechoaround Воск плохо поддавался ковырянию, и %actor.name% оставил%actor.g% доску в покое.
  oload obj 20336
  opurge %self%
end
~
#20343
срезатьвоск~
1 c 100
срезать~
if !(%arg.contains(воск)%) 
  osend %actor% Что вы хотите срезать?
  return 1
  halt
else
  wait 10
  osend %actor% Приложив некоторые усилия Вы с трудом срезали воск.
  oechoaround %actor% %actor.name% с трудом срезал%actor.g% воск с доски.
  oload obj 20337
  opurge %self%
end
~
#20344
сдаемквестТемнику~
0 j 100
*~
wait 1
switch %object.vnum%
  case 20404
    wait 1
    mpurge %object%
    wait 20
    Ул
    wait 20
    say Вискоре к нам пирибудет подкирепление и ми сможим пиродолжить поход!
    say Хан не соминенно будет доволен миной.
    say Ти, холоп, заслужил награду.
    eval rand %random.1000%
    if ((%rand% < 300) && (%world.curobjs(20340)% < 3))
      mload obj 20340
      дать копье %actor.name%
      say Теперь ухади долой с моих глаз, и симотри не попадайся моим воинам!
    elseif  ((300 <= %rand%) && (%rand% < 600) && (%world.curobjs(20341)% < 3))
      mload obj 20341
      дать нагруд %actor.name%
      say Теперь ухади долой с моих глаз, и симотри не попадайся моим воинам!
    else
      %self.gold(+10000)%
      give 10000 кун .%actor.name%
      say Теперь ухади долой с моих глаз, и симотри не попадайся моим воинам!
    end
  break
  case 20405
    wait 1
    mpurge %object%
    Рыч
    emote стал похож на разъяренного буйвола.
    крича Ти сиволачь посимел мине пиренести отказ от баскака?! Убию обоих!!!
    wait 10
    mkill %actor%
  break
  default
    wait 1
    say Ти чего мне принес, аслиный башка?!
    drop %object.name
  done
~
#20345
сумонтелохов~
0 p 100
*~
wait 5
кричать ситража! Ко мне!
mload mob 20337
detach 20345 %self.id%
~
#20346
леземнахолм~
2 c 1
взобраться~
if !(%arg.contains(холм)%) 
  wsend %actor% Куда это Вы хотите залезть?
  return 1
  halt
else
  wait 1
  wteleport %actor% 20379
end
~
#20347
идемпоследу~
2 c 1
идти пройти~
if !((%arg.contains(по)%) && (%arg.contains(следу)%))
  wsend %actor% Куда это Вы собрались идти?
  return 1
  halt
else
  wait 5
  wsend %actor% Вы вышли на небольшую тропку, судя по всему, ведущую в какую-то деревню.
  wechoaround %actor% %actor.vname% побрел%actor.g% по следу.
  wteleport %actor.name% 20500
end
~
#20348
лисбежит~
2 e 100
*~
wait 1s
wecho Неожиданно прям у Ваc промеж ног прошмыгнул рыжий лисенок, и скрылся на северо-востоке за болотом.
wecho Видимо он шел, руководствуясь звериным чутьем, и можно пройти по его следу, не боясь утопнуть.
calcuid po 20378 room
attach 20347 %po.id%
detach 20348 %self.id%
~
$~
