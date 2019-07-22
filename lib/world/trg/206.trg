#20600
РЕПОП~
2 f 100
*~
context 261
unset uman
context 2061
unset bman
context 2062
unset mman
wdoor 20608 EAST purge
wdoor 20645 north purge
wdoor 20603 n purge
*видимо попытка убрать ученика с помощью трига 20617 
*20217 тут вообще непричем - он даже не вызывается из трига 
*calcuid uch 20600 mob
*attach 20217 %uch.id%
*exec 20217 %uch.id%
~
#20601
встретилиученика~
0 q 100
*~
context 206
wait 3
if %actor.id% != %uman.id%
  эм хмуро посмотрел на Вас
  halt
end
г эй!
wait 3
г подойди суда!
wait 5
msend %actor% парень совершенно не внушал никакого страха и Вы спокойно подошли к нему.
wait 10
шепт .%actor.name% я слышал ты решил%actor.g% князю службой помочь?
wait 10
шептать .%actor.name% да в одиночку ни в жизнь не справишься!
wait 20
ул
wait 15
шептать .%actor.name% коли решишь за помощью обратиться, найди моего деда и передай это.
mload obj 20600
wait 5
дать симв .%actor.name%
wait 15
шептать .%actor.name% он живет на хуторе рядом с болотом, что близ города.
wait 10
msend %actor% после этих слов парень совершенно потерял к Вам интерес, и, кажется, делает вид,
msend %actor% что вообще не замечает.
calcuid star 20602 mob
attach 20604 %star%
detach 20601 %self%
~
#20602
у князя~
0 q 100
*~
wait 4
context 206
mecho Увидев Вас, молодой князь обрадовался.
say Не обманул Микула, прсилал храбрецов на подмогу.
say Слушайте же:
wait 2
взд
wait 2
say Беда у нас, осадили город степняки - печенеги, да вы и сами знаете наверно.
say Одолевают псы , долго не продержимся мы, не хватит сил ни людских ни небесных, чтобы удержать город
mecho Из библиотеки послышался писклявый голос: 
mecho "Да, да... Почти получилось... Осталось найти всего один компонент, и меня услышит 
mecho мать-природа, и защитит своею мудростью от черного войска славный Китеж."
wait 10
взд
say И от волхва нашего никакой помощи, что то мудрит, четвертый день из библиотеки не выходит
say Говорил отец мой, -- не доверяй волхвам, они за руны  и князя своего продадут и город 
say огню предадут, да привык я к старику...
wait 9
mecho Князь внезапно выпрямился, лицо его стало властным и решительным.
say Вот как мы поступим.
say Крикну я гридней  своих, пусть посадят они супостата в казематы, дабы смуту не сеял. 
say А Вы же ступайте, да Хана убейте.
say И пусть войско его не устрашится и отсупит от Китежа.
wait 9
взд
say Одна на Вас надежда.
set uman %actor.id% 
worlds uman
calcuid uchen 20600 mob
attach 20601 %uchen.id%
calcuid Knaz 20200 mob
attach 20214 %Knaz.id%
calcuid Volxv 20203 mob
attach 20210 %Volxv.id%
detach 20208 %self.id%
~
#20603
у старика~
0 q 100
*~
wait 10
эм строго глянул в Вашу сторону
г чего тут забыл%actor.g%?
calcuid ruch 20252 room
attach 20616 %ruch.id%
exec 20616 %ruch.id%
detach 20216 %ruch.id%
attach 20618 %self.id%
detach 20603 %self.id%
~
#20604
даемсимвол~
0 j 100
*~
switch %object.vnum%
  case 20600
    wait 10
    mpurge %object%
    if (%actor.sex% == 1)
      *if %actor.remort% < 0
      if %actor.remort% < 14
        г э не парниша, молодой ты еще, не опытный.
        wait 20
        г сгинешь ты по дороге и никакой пользы не принесешь, ни себе ни князю.
        wait 20
        г ступай ка сначала опыта поднаберись!
      elseif %actor.remort% > 50
        г у ты какой крутой!
        wait 20
        г пади таких делов тут натворить можешь, что ого-го!
        wait 20
        г ни к чему тебе наша помощь, сам справишься.
        wait 20
        г а коли скучно станет ступай к горам самоцветным, там говорят таких как ты нехватает!
      else
        context 2062
        set mman %actor.id%
        worlds mman
        wait 10
        г ну чтож, не подкачал внучок!
        wait 5
        г да и князь видать правильного человека выбрал для дела важного.
        wait 20
        г таперача слушай внимательно!
        wait 20
        г Был я некогда мастером и числился смотрителем в лагере душегубов, что подле Менска. 
        wait 5
        г Да жизнь подлюка так сложилась, что вынудила в эту глушь селиться. 
        wait 25
        г А, впрочем, и не жалко! 
        wait 20
        г Обжился я здесь, жену завел. 
        wait 20
        г И уж грешным делом думал вовек горя знать не буду. 
        wait 20
        г Да где там!
        wait 35
        г Навалилась орда басурманская на матерь-землюшку русскую и давай ее топтать. 
        wait 20
        Вот уже и до Китежа славного добрались.
        wait 20
        Взд
        wait 30
        г Много их, не сдюжит князь в одиночку.
        wait 20
        г Вот и послал я весточку своим другам былым, мол, за не кислую денежку надо бы кое-кого порешить.
        wait 20
        ул
        wait 30
        г Вмиг примчались и уже ждут они средь черного болота гонца от князя.
        wait 20
        г Сами то в город соваться на отрез отказались.
        wait 30
        г В общем, коли, сумеешь до них добраться, золотцем тебя князь не обидит!
        wait 5
        г Да и мне на старости лет, на коврижки хватит.
        wait 30
        г Так что, берешься?
        wait 10
        Эм вопросительно уставился на Вас
        attach 20609 %self.id%
      end
    else
      wait 5
      г ух внучок удружил! 
      wait 5
      г да и князь тоже хорош - бабу на войну посылать!
      wait 5
      рыч
      wait 20
      г ступай-ка ты девица лучше детей рожать, а война - не бабское дело!
      wait 30
      г ну что стоишь не уходишь?
      wait 20
      г неужто все равно пойдешь?
      attach 20605 %self.id%
    end
  done
end
~
#20605
бабагритпойду~
0 d 1
да пойду~
if (%actor.sex% == 1)
  wait 5
  г а тебя кто спрашивал??
  msend %actor% схватив Вас зашиворот хуторянин выпер Вас из дома, напоследок отвесив смачного пендаля.
  mteleport %actor% 20606
else
  context 2061
  set bman %actor.id% 
  worlds bman
  хох
  г ну раз так, проходи в комнату, там и поговорим!
  %bman.wait(7)%
  msend       %actor% Как только Вы зашли в комнатушку сзади раздался скрежет засова.
  mteleport %actor% 20609
  mechoaround %actor% %actor.name% прошла в каморку, а следом проследовал и хуторянин. 
  %teleport% hutor 20609
  mechoaround %actor% Неожиданно Вы услышали скрип заперающегося засова.
  wait 30
  msend %actor% сильные руки схватили Вас за плечи и наклонили вперед, и, не дав опомниться, 
  msend %actor% спустили портки.
  wait 30
  msend %actor% через секунду резкая боль пронзила все тело. 
  wait 30
  msend %actor% подлый хуторянин сотворил с Вами то, что многие мужики делают с бабами.
  dg_affect %actor% ловкость смирение -20 0
  dg_affect %actor% ловкость смирение -20 10000
  dg_affect %actor% интеллект плач -20 0
  dg_affect %actor% интеллект плач -20 10000
  wait 30
  msend %actor% Вдруг, из сеней раздался какой-то шум.
  wait 20
  msend %actor% Вскоре, мощным ударом выбив дверь, в комнату влетела растрепаная женщина.
  calcuid jenasen 20607 room
  exec 20607 %jenasen.id%
  calcuid jenasv 20608 room
  exec 20608 %jenasv.id%
  mload mob 20603
  attach 20621 %self.id%
  detach 20605 %self.id%
end
~
#20606
женалоад~
0 n 100
*~
context 2061
wait 4
кричать ах ты кобель драный!
wait 5
г только я за порг, а ты уже кого-нибуть оприходуешь?!
wait 30
г а ты что молчишь?!
wait 10
эм разъяренная женщина уставилась прямо на Вас.
wait 20
г мужа увести захотела развратница???
msend %bman% и только Вы собирались все объяснить, как жена хуторянина схватила стоящий подле двери табурет
msend %bman% и метнула Вас!
mdamage %bman.id% 500
wait 25
кричать пошла вон!!!
убить .%bman.name%
~
#20607
женавсенях~
2 z 100
*~
wait 20
wecho Неожиданно в дом вбежала какая-то женщина, и громко протопав ворвалась в светлицу.
~
#20608
женавсветлице~
2 z 100
*~
wait 20
wecho Неожиданно в комнату вбежала какая-то женщина и, мощным ударом выбив дверь в камору влетела внутрь.
wdoor 20608 EAST room 20609
~
#20609
беремся!~
0 d 1
да берусь~
context 2062
wait 10
if %actor.id% != %mman.id%
  хмур %actor.name%
  г Ты не знаешь что в чужие разговоры встревать не хорошо?
  msend %actor% схватив Вас зашиворот хуторянин выпер Вас из дома, напоследок отвесив смачного пендаля.
  mteleport %actor% 20606
  halt
end
*проверка всех на бд
calcuid sRoom 20608 room
foreach i %sRoom.pc%
  *mecho %i.name% -----------------
  if !%i.rentable% 
    дум %i.name%
    wait 1s
    г Да ты что, родной!
    г У тебя же руки, еще в крови, да и сам слаб еще, от боя не отошел...
    г Не пущу я вас на смерть лютую!
    г И не уговаривай!
    г Как все в здравии будут, приходите!
    эм отвернулся и занялся своими делами
    halt
  end
  *
done
*
wait 15
msend %actor% Вы прошли вслед за старым мастером за хутор, где он подробно рассказал 
msend %actor% про тайную тропку, которую еще не поглотило болото.
*mteleport %actor% 20610
mechoaround %actor% Быстрым шагом старый мастер вышел из комнаты, а за ним, еле поспевая, выбежал %actor.name%
*что за хутор я хз. не нашла определения переменной (если это переменная)
*%teleport% hutor 20610
* телепорт группы
mechoaround %actor% Ну, а следом за ним, беспокойно оглядываясь, поспешили и все остальные.
mat 20610 mecho Кто-то пришел сюда со стороны болота.
mteleport all 20610
wait 20
г Это твой единственный шанс пройти к наемникам, однако знай, что путь будет не легок!
wait 5
г Множество злобных тварей понаплодилось в этих местах.
wait 20
г Да и среди мастеров разный люд попадается. 
wait 20
г Бывает, уходят они из лагеря за наживой, и, коли встретят кого - добычу не упускают!
wait 20
г Но я верю, что ты справишься! Ступай же!
г Если тяжело будет, не стесняйся и помощь друзей принять!
wait 3s
ю
з
с
з
з
с
attach 20620 %self.id%
detach 20609 %self.id%
~
#20610
заходимкглаве~
0 q 100
~
context 2062
wait 10
if %actor.id% == %mman.id%
  wait 10
  msend %actor% с самого порога, дабы не сделалось чего худого, Вы сообщили, что пришли от князя с заказом.
  wait 30
  msend %actor% Через некоторое время, проведенной за беседой с мастерами умерщвления, 
  msend %actor% был заключен договор на голову Хана.
  wait 20
  Mload obj 20601
  Дать договор %actor.name%
  wait 10
  г отнеси это князю.
  wait 10
  г мы свою работу выполним!
  calcuid knyaz 20200 mob
  attach 20611 %knyaz.id%
  detach 20214 %knyaz.id%
  detach 20610 %self.id%
end
~
#20611
идемккнязю~
0 j 100
*~
switch %object.vnum%
  case 20601
    wait 10
    mpurge %object%
    Эм внимательно прочел договор.
    wait 10
    Взд
    wait 10
    г Ну что ж, ты решил предоставить работу мастерам...
    wait 20
    г Впрочем, я не сомневаюсь, что они справятся.
    wait 20
    г Прими это за труды свои.
    msend %actor% Князь щедро отсыпал Вам золотых монет.
    %actor.gold(+50000)%
    detach 20214 %self.id%
  done
~
#20612
зашликследопыту~
0 q 100
*~
*стремный посох
halt
context 2062
wait 5
Эм с прищуром посмотрел на Вас
wait 10
г Ну что малыха, тяжко было нас найти?
wait 10
Ул
wait 20
г Небаись, в следующий раз будет полегче!
context 2062
wait 10
if ((%actor.id% == %mman.id%) && (%world.curobjs(20619)% < 5))
  wait 30
  эм еще раз взглянул на Вас
  wait 1s
  г я смотрю мы схожим ремеслом заняты?
  wait 20
  ул
  wait 10
  г ходь сюды, трофеем угощу!
  wait 20
  ул
  wait 10
  mload obj 20619 
  дать посох %actor.name%
  wait 10
  г заказали нам как то одного колдунишку. Так у него этого хлама целый сундук был!
  г пользуйся пока можешь.
  wait 10
  эм хитро Вам подмигнул
  detach 20612 %self.id%
end
~
#20613
убилинаемника~
0 f 100
*~
eval rand %random.1000%
if ((%rand% < 67) && (%world.curobjs(20602)% < 1))
  mload obj 20602
elseif ((67 <= %rand%) && (%rand% < 133) && (%world.curobjs(20603)% < 1))
  mload obj 20603
elseif ((133 <= %rand%) && (%rand% < 190) && (%world.curobjs(20604)% < 1))
  mload obj 20604
elseif ((190 <= %rand%) && (%rand% < 257) && (%world.curobjs(20605)% < 1))
  mload obj 20605
elseif ((257 <= %rand%) && (%rand% < 333) && (%world.curobjs(20606)% < 1))
  mload obj 20606
elseif ((333 <= %rand%) && (%rand% < 390) && (%world.curobjs(20607)% < 1))
  mload obj 20607
elseif ((390 <= %rand%) && (%rand% < 457) && (%world.curobjs(20608)% < 1))
  mload obj 20608
elseif ((457 <= %rand%) && (%rand% < 533) && (%world.curobjs(20609)% < 1))
  mload obj 20609
elseif ((533 <= %rand%) && (%rand% < 590) && (%world.curobjs(20610)% < 1))
  mload obj 20610
elseif ((590 <= %rand%) && (%rand% < 657) && (%world.curobjs(20611)% < 1))
  mload obj 20611
elseif ((657 <= %rand%) && (%rand% < 733) && (%world.curobjs(20612)% < 1))
  mload obj 20612
elseif ((733 <= %rand%) && (%rand% < 790) && (%world.curobjs(20613)% < 1))
  mload obj 20613
elseif ((790 <= %rand%) && (%rand% < 857) && (%world.curobjs(20614)% < 1))
  mload obj 20614
elseif ((857 <= %rand%) && (%rand% < 933) && (%world.curobjs(20615)% < 1))
  mload obj 20615
elseif ((933 <= %rand%) && (%rand% <= 1000) && (%world.curobjs(20616)% < 1))
  mload obj 20616
end
~
#20614
делаемвходдальше~
2 c 1
идти~
if (%arg.contains(точно)% && %arg.contains(по)% && %arg.contains(тропке)%) 
  wait 2
  wsend %actor% Шаг за шагом Вы осторожно протоптали безопасный путь.
  wdoor  20645 north room 20646
end
~
#20615
рипаемубийцу~
0 f 100
*~
eval rand %random.150%
if ((%rand% < 5) && (%world.curobjs(20602)% < 2))
  mload obj 20602
elseif ((5 <= %rand%) && (%rand% < 10) && (%world.curobjs(20603)% < 2))
  mload obj 20603
elseif ((10 <= %rand%) && (%rand% < 15) && (%world.curobjs(20604)% < 2))
  mload obj 20604
elseif ((15 <= %rand%) && (%rand% < 20) && (%world.curobjs(20605)% < 2))
  mload obj 20605
elseif ((20 <= %rand%) && (%rand% < 25) && (%world.curobjs(20606)% < 2))
  mload obj 20606
elseif ((25 <= %rand%) && (%rand% < 30) && (%world.curobjs(20607)% < 2))
  mload obj 20607
elseif ((30 <= %rand%) && (%rand% < 35) && (%world.curobjs(20608)% < 2))
  mload obj 20608
elseif ((35 <= %rand%) && (%rand% < 40) && (%world.curobjs(20609)% < 2))
  mload obj 20609
elseif ((40 <= %rand%) && (%rand% < 45) && (%world.curobjs(20610)% < 2))
  mload obj 20610
elseif ((45 <= %rand%) && (%rand% < 50) && (%world.curobjs(20611)% < 2))
  mload obj 20611
elseif ((50 <= %rand%) && (%rand% < 55) && (%world.curobjs(20612)% < 2))
  mload obj 20612
elseif ((55 <= %rand%) && (%rand% < 60) && (%world.curobjs(20613)% < 2))
  mload obj 20613
elseif ((60 <= %rand%) && (%rand% < 65) && (%world.curobjs(20614)% < 2))
  mload obj 20614
elseif ((65 <= %rand%) && (%rand% < 70) && (%world.curobjs(20615)% < 2))
  mload obj 20615
elseif ((70 <= %rand%) && (%rand% < 75) && (%world.curobjs(20616)% < 2))
  mload obj 20616
elseif ((75 <= %rand%) && (%rand% < 80) && (%world.curobjs(20618)% < 2))
  mload obj 20618
end
~
#20616
лоадученика~
2 z 100
*~
wload mob 20600
~
#20617
мретученик~
0 z 100
*~
*mpurge %self%
* нафиг надо. ставлю ученика в удаляемые
~
#20618
устарика~
0 q 100
*~
wait 10
эм строго глянул в Вашу сторону
г чего тут забыл%actor.g%?
~
#20619
рипаемстаруху~
0 f 100
*~
eval rand %random.1000%
if ((%rand% < 150) && (%world.curobjs(20617)% < 2))
  mload obj 20617
end
~
#20620
хуторянинпослевзятияквеста~
0 q 100
*~
wait 1s
ик
if (%actor.sex% == 1)
  wait 30
  г еще чтоли помошники князевы?
  attach 20622 %self.id%
else
  wait 30
  г опачки!
  wait 10
  г деванька!
  wait 30
  г неужто на старости лет старика потешить решила?
  ул
  г али также князю службу сослужить решила?
  attach 20605 %self.id%
end
~
#20621
послебабы~
0 r 100
*~
wait 1s
г что, опять от князя?!
wait 1s
мат
wait 1s
г значится так, как выйдешь со двора, ступай вдоль хутора.
г попадешь на тропку, что ведет вглубь болота.
г по ней доберешся до нужного места.
mdoor 20603 n room 20655
mdoor 20603 n flags e 
wait 35
mecho после этих слов старик насупился и перестал Вас замечать.
mecho отойдя, до Вас долетело сердитое ворчание: "уж и развелось же героев этих недоделанных!"
~
#20622
дастарику~
0 d 1
да~
wait 1s
г значится так, как выйдешь со двора, ступай вдоль хутора.
г попадешь на тропку, что ведет вглубь болота.
г по ней доберешся до нужного места.
wait 2s
г ступай!
mdoor 20603 n room 20655
mdoor 20603 n flags e 
attach 20621 %self.id%
detach 20622 %self.id%
~
#20623
выходыделаемиз56~
2 e 100
*~
wait 1
eval rand0 %random.1000%
if %rand0% <= 100
  wload mob 20699
end
wdoor 20656 south purge
wdoor 20656 north purge
wdoor 20656 west purge
wdoor 20656 east purge
*юг
eval rand1 %random.1000%
if %rand1% <= 433
  wdoor  20656 south room 20656
elseif %rand1% <= 866
  wdoor  20656 south room 20657
else 
  wdoor  20656 south room 20657
end
*север
eval rand2 %random.1000%
if %rand2% <= 433
  wdoor  20656 north room 20656
elseif %rand2% <= 866
  wdoor  20656 north room 20657
else
  wdoor  20656 north room 20658
end
*запад
eval rand3 %random.1000%
if %rand3% <= 433
  wdoor  20656 west room 20656
elseif %rand3% <= 866
  wdoor  20656 west room 20657
else
  wdoor  20656 west room 20658
end 
~
#20624
выходыделаемиз57~
2 e 100
*~
wait 1
eval rand0 %random.1000%
if %rand0% <= 100
  wload mob 20699
end
wdoor 20657 south purge
wdoor 20657 north purge
wdoor 20657 west purge
wdoor 20657 east purge
*юг
eval rand1 %random.1000%
if %rand1% <= 433
  wdoor  20657 south room 20656
elseif %rand1% <= 866
  wdoor  20657 south room 20655
else 
  wdoor  20657 south room 20655
end
*север
eval rand2 %random.1000%
if %rand2% <= 433
  wdoor  20657 north room 20656
elseif %rand2% <= 866
  wdoor  20657 north room 20657
else
  wdoor  20657 north room 20658
end
*запад
eval rand3 %random.1000%
if %rand3% <= 433
  wdoor  20657 west room 20656
elseif %rand3% <= 866
  wdoor  20657 west room 20657
else
  wdoor  20657 west room 20658
end 
*восток
eval rand4 %random.1000%
if %rand4% <= 433
  wdoor  20657 east room 20656
elseif %rand4% <= 866
  wdoor  20657 east room 20657
else
  wdoor  20657 east room 20655
end 
~
#20625
выходыделаемиз58~
2 e 100
*~
wait 1
eval rand0 %random.1000%
if %rand0% <= 100
  wload mob 20699
end
wdoor 20658 south purge
wdoor 20658 north purge
wdoor 20658 west purge
wdoor 20658 east purge
*юг
eval rand1 %random.1000%
if %rand1% <= 433
  wdoor  20658 south room 20656
elseif %rand1% <= 866
  wdoor  20658 south room 20657
else
  wdoor  20658 south room 20655
end
*север
eval rand2 %random.1000%
if %rand2% <= 433
  wdoor  20658 north room 20656
elseif %rand2% <= 866
  wdoor  20658 north room 20657
else
  wdoor  20658 north room 20659
end
*запад
eval rand3 %random.1000%
if %rand3% <= 433
  wdoor  20658 west room 20656
elseif %rand3% <= 866
  wdoor  20658 west room 20657
else
  wdoor  20658 west room 20659
end 
*восток
eval rand4 %random.1000%
if %rand4% <= 433
  wdoor  20658 east room 20656
elseif %rand4% <= 866
  wdoor  20658 east room 20657
else
  wdoor  20658 east room 20659
end 
~
#20626
выходыделаемиз59~
2 e 100
*~
wait 1
eval rand0 %random.1000%
if %rand0% <= 100
  wload mob 20699
end
wdoor 20659 south purge
wdoor 20659 north purge
wdoor 20659 west purge
wdoor 20659 east purge
*юг
eval rand1 %random.1000%
if %rand1% <= 433
  wdoor  20659 south room 20656
elseif %rand1% <= 866
  wdoor  20659 south room 20657
else
  wdoor  20659 south room 20658
end
*север
eval rand2 %random.1000%
if %rand2% <= 433
  wdoor  20659 north room 20656
elseif %rand2% <= 866
  wdoor  20659 north room 20657
else
  wdoor  20659 north room 20658
end
*запад
eval rand3 %random.1000%
if %rand3% <= 433
  wdoor  20659 west room 20656
elseif %rand3% <= 866
  wdoor  20659 west room 20657
else
  wdoor  20659 west room 20658
end
~
#20627
смерть болотной нечисти~
0 f 100
~
eval rand %random.1000%
if ((%rand% < 10) && (%world.curobjs(20620)% < 3))
  mload obj 20620
elseif ((%rand% > 990) && (%world.curobjs(20621)% < 3))
  mload obj 20621
end
~
#20628
одеваем тину~
1 j 1
~
if %self.worn_by%
  halt
end
wait 1
%send% %actor% Мда, вонять вы теперь будете...
%echoaround% %actor% %actor.name% издает неподражаемый запах гнилого болота.
~
$~
