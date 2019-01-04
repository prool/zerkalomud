#20900
проверка клан шмота~
1 gj 100
~
wait 1
if %actor.clan% == рсп
 halt
end
%send% %actor% %self.name% рассыпал%self.u% у Вас в руках.
%purge% %self%
~
#20901
Богатырша гладит пса~
0 ab 10
~
%echo% Воительница нежно почесала кого-то за ухом.
~
#20902
Рычит волкодав~
0 q 10
~
if (%actor.clan%==рсп)
лиз %actor.name%
else
рыч %actor.name%
end
~
#20903
[позвать] [отпустить] волхва~
2 c 0
позвать отпустить~
if %cmd% == позвать
 if (%world.curmobs(20950)% > 0)
  wsend %actor% Зачем его звать, он уже здесь.
  halt
 end
 if %actor.clanrank% != 9
  wsend %actor% Волхв не услышал Вас.
  halt
 end
 wsend %actor% Волхв услышал Вас.
 wecho &KСерый туман начал клубиться вокруг Вас.&n
 wait 1s
 wecho Но вдруг порывы сильного ветра разметали его в клочья.
 wait 1s
 wecho  Вы перестали изумленно оглядываться по сторонам,
 wecho  и увидели человека, с улыбкой на лице и смотрящего в вашу сторону.
 wload mob 20950
elseif %cmd% == отпустить
if %actor.clanrank% != 9
wsend %actor% Волхв не услышал Вас.
halt
end
 if (%world.curmobs(20950)% > 0)
  wecho &KСерый туман скрыл волхва от Вас.&c
  calcuid volhv 20950 mob
  wpurge %volhv%
  wait 1s
  wecho Медленно туман отступил, и волхв исчез вместе с ним.
 else
  wsend %actor% Ну что вы! Кого вы хотите отпустить ?
 end
end
~
#20904
Действия охотника~
0 ab 25
~
*if (%actor.clan%==рсп)
%echo% Охотник отвлекся от изучения стрелы и осмотрел Вас с ног до головы.
*end
~
#20905
Найти соратника~
0 c 100
найти~
set enemy %arg%
if !(%enemy.clan%==%actor.clan%)||(%enemy.level%>30)
 %echo% Охотник хмуро посмотрел Вас и отвернулся.
 halt
else
 set enroom %enemy.realroom% 
* %echo% Охотник на мгновение задумался.
 дум 
 wait 2
 г Мне кажеться %enemy.name% находится в %enroom.name%
end
~
#20906
Пес на крыше дома~
2 b 20
~
%echo% Глаза железного пса на крыше дома ярко сверкнули.
~
#20907
Викинг не пускает чужих~
0 c 100
*~
if (%cmd.mudcommand% == юг)||(%cmd.mudcommand% == south)
 if %actor.clan% != рсп
  %echoaround% %actor% %actor.name% попытал%actor.u% пройти в дом, но варяг не пустил его.
  %send% %actor% Вы попытались пройти в дом, но варяг не пустил Вас.
  return 1
  halt
 end
end
*%send% %actor% Варяг внимательно осмотрел Вас, и отошел в сторону, освободив вход в дом.
return 0 
~
#20908
Вход на арену~
2 e 100
~
wait 2
wsend %actor.name% Вы на ристалище! 
wsend %actor.name% Вот где может разгуляться душа к бою привычная.
~
#20909
Выход с арены~
2 c 100
перелезть~
wait 1
wechoaround %actor% %actor.name% перелез%actor.q% через ограждение поля состязаний и убежал%actor.g%.
wsend %actor.name% _Вы перелезли через ограждение поля состязаний.
wteleport %actor% 20934 horse
wat 20934 wechoaround %actor% %actor.name% с громкими криками свалил%actor.u% с ограждения поля состязаний.
end
~
#20910
Приветствие мельника~
0 q 100
~
%send% %actor.name% Мельник сказал Вам : "Присаживайся и отдохни путник...."
%send% %actor.name% Мельник сказал Вам : "За 20 кун я накормлю тебя."
~
#20911
Дали деньги мельнику~
0 m 0
~
if %actor.vnum% != -1
 halt
end
tell %actor.name% Нечем мне тебя сегодня кормить. Пойди, поищи еду в другом месте.
return 0
halt
if %amount% < 20
 tell %actor.name% За такие деньги иди ищи сам себе еду
else
 %send% %actor% Мельник усадил вас за маленький стол, и начал угощать.
 eval temp %actor.wait(5)%
 dg_cast 'насыщение' .%actor.name%
end
~
#20912
Проверка 2рум на арене~
2 c 100
*~
if (%cmd.mudcommand% == юг)||(%cmd.mudcommand% == south)
 if %world.people(20969)% > 1
  %send% %actor% Слишком мало места.
  return 1
  halt
 end
end
return 0
~
#20913
Кузнец чинит~
0 ab 5
~
if %random.4% == 1
 %echo% Кузнец что-то окончательно доломал.
 руг
else
 %echo% Кузнец попытался починить что-то, но сломал это еще больше.
end
~
#20914
Действия ведьмы~
0 ab 5
~
%echo% Ведьма посмотрела на Вас и коварно облизнулась.
wait 1s
%echo% Ведьма отвернулась, и принялась варить какое-то снадобье.
~
#20915
[почесать] волкодава~
1 c 3
почесать~
if (%actor.clan%==рсп)
 oechoaround %actor% %actor.name% нежно почесал%actor.g% волкодава, и он ожил.
 osend %actor% Вы нежно почесали волкодава, и он ожил.
 oload mob 20924
 oforce %actor% оседла волкодав
 opurge %self%
else
 oechoaround %actor% %actor.name% попытал%actor.u% почесать волкодава, но он отказался чесаться.
 osend %actor% Вы попытались почесать волкодава, но он отказался чесаться.
end
~
#20916
[погладить] волкодава~
0 c 0
погладить~
if (%actor.clan%==рсп)
 if (%self.leader% == %actor%)
  mechoaround %actor% %actor.name% погладил%actor.g% волкодава и тот внезапно стал плюшевым.
  msend %actor% Вы погладили волкодава и тот снова стал плюшевым.
  бр все.двумех
  calcuid room %self.realroom% room
  attach 20919 %room.id%
  exec 20919 %room.id%
  if %actor.affect(верхом или под седлом)%
   mforce %actor% соскочить
  end
  mforce %actor% взять плюшев
  mpurge %self%
 else
  msend %actor% Это не ваш Волкодав.
 end
else
 mechoaround %actor% %actor.name% попытал%actor.u% погладить волкодава, но тот куснулся.
 msend %actor% Вы попытались погладить волкодава, но он вырвался из ваших рук.
end
~
#20917
[дать двумех волкодав]~
0 j 100
~
if (%actor.clan%!=рсп)
 if (%object.vnum%!=20906)
  return 0
  mecho Волкодав отодвинулся.
  halt
 end
end
wait 1
рыч
mecho Волкодав схватил двумех в зубы и забросил себе на спину.
~
#20918
[забрать] двумех у волкодава~
0 c 0
забрать~
wait 1
if %self.leader%!=%actor%
 halt
end
if (%actor.clan%==рсп)
 if %self.haveobj(20907)%
  лизнуть .%actor.name%
  дать двумех .%actor.name%
 else
  играть .%actor.name%
 end
end
~
#20919
плюшевый волкодав грузится~
2 z 0
~
wload obj 20905
detach 20919 %self.id%
~
#20920
хозяин сказал [фас] волкодаву~
0 c 0
фас~
if (%actor.clan%==рсп)
 if %self.leader%==%actor%
  mforce %actor% say Ату!
  рыч %arg%
  else
  msend %actor% Это не ваш Волкодав.
 end
else
 msend %actor% Волкодав рыча посмотрел на Вас.
end
~
#20921
дали 50 кун конюху~
0 m 0
~
wait 1
if (%amount% < 50)
say Ну что же ты, хочешь меня обидеть ? Забери свою мелочь обратно.
дать %amount% кун %actor.iname%
elseif (%amount% == 50)
say На вот, держи зачем пожаловал.
mload obj 20905
дать плю.волк %actor.iname%
wait 1
бр все
elseif (%amount% > 50)
say Спасибо за твою щедрость, приходи еще.
mload obj 20905
дать плю.волк %actor.iname%
wait 1
бр все
end
~
#20922
волкодав идет в пенту~
0 e 0
пентаграмме.~
wait 1
if %actor% == %self.leader%
 выть
 войти пентаграмма
end
~
#20923
волкодав не бьет РСП~
0 k 100
~
if (%actor.clan%==рсп)
 msend %actor% Почуствовав Ваш запах волкодав заскулил.
 бежать
end
~
#20950
[г прими] воевода волхву~
0 d 100
прими~
if %actor.clanrank% == 9
 attach 20951 %self.id%
 кивн
 say Пусть войдет
 wait 1
 жда
calcuid volhvroom %self.realroom% room
detach 20953 %volhvroom.id%
end
~
#20951
волхв встречает притендента~
0 q 100
~
calcuid volhvroom %self.realroom% room
attach 20953 %volhvroom.id%
wait 1
смотр .%actor.iname%
say Здравствуй, %actor.iname%, знаю о тебе много, хоть и не все.
wait 1
дум
if %actor.level% > 24
say Опытн%actor.w% ты уже, что же привело тебя ?
attach 20952 %self.id%
wait 100s
if !%bylotvet%
say Не знаешь зачем приш%actor.y% ? Тогда и нечего тебе тут делать.
msend %actor% Волхв грозно зыркнул на Вас, и Вам захотелось поскорее убраться.
mforce %actor% north
rdelete bylotvet %self.id%
detach 20952 %self.id%
detach 20953 %volhvroom.id%
detach 20951 %self.id%
halt
else
detach 20951 %self.id%
halt
end
elseif %actor.level% < 11
say Молод%actor.a% ты еще, как попал сюда ?
say Нечего здесь расхаживать !
msend %actor% Волхв грозно зыркнул на Вас, и Вам захотелось поскорее убраться.
mforce %actor% north
detach 20953 %volhvroom.id%
detach 20951 %self.id%
halt
else
say Хорош%actor.g% ты, думаешь хватит сил ?
* запускаем тригер для 11-24 уровней
attach 20954 %self.id%
detach 20951 %self.id%
halt
end
~
#20952
ответ волхву~
0 d 0
дружба судьба слава друзья смирение друг мечта везение удача секс sex честь~
set bylotvet 1
remote bylotvet %self.id%
wait 1
say Ну что же эта причина может считаться серьезной.
улыб
wait 1s
say Сядь со мной, поговорим.
msend %actor% Непреодолимая сила заставила Вас сесть.
mforce %actor% сесть
eval templag %actor.wait(12)%
wait 1s
say Вот возьми, выпей.
mecho Волхв взял чашку с сильным запахом с пола.
mload obj 20970
дать чашк %actor.iname%
wait 2s
mforce %actor% вст
mforce %actor% поклон волхв
wait 3s
mforce %actor% пить чашк
wait 1s
msend %actor% Винные пары ударили Вам в голову.
wait 3s
mforce %actor% бросить чашк
вз чашк
mpurge чашк
wait 1s
msend %actor% Сознание медленно покидает Вас.
msend %actor% Глаза застилает белесый туман.
wait 1s
msend %actor% Вы открыли глаза в новом месте.
mechoaround %actor% Резкий порыв ветра заставил Вас моргнуть, когда Вы открыли глаза
mechoaround %actor% %actor.rname% уже не оказалось на месте.
mteleport %actor% 20990 horse
wait 1s
msend %actor% Голос волхва донесся до Вас издалека:
msend %actor% - Будет сложно, зови Серого Пса.
msend %actor% - Удачи.
calcuid volhvroom %self.realroom% room
detach 20953 %volhvroom.id%
detach 20952 %self.id%
~
#20953
не пускаем в таинство посвящения~
2 e 100
~
wsend %actor% Чья-то сила не дает вам сделать шаг вперед.
return 0
~
#20954
11-24ур [г хватит]~
0 d 100
хватит~
say Ну что же. Можешь и ты попытать счастья.
wait 2s
say Поведай, что привело тебя ?
attach 20952 %self.id%
wait 100s
if !%bylotvet%
say Не ведаешь куда идешь, не ведаешь зачем идешь.
say Нечего тебе здесь делать!
wait 1s
msend %actor% Волхв грозно зыркнул на Вас, и Вам захотелось поскорее убраться.
mechoaround %actor% %actor.iname% попятил%actor.u% от волхва.
mforce %actor% north
detach 20952 %self.id%
calcuid volhvroom %self.realroom% room
detach 20953 %volhvroom.id%
detach 20954 %self.id%
halt
else
detach 20954 %self.id%
halt
end
~
#20955
появление волка~
2 e 100
~
if !%exist.mob(20951)%
wecho Матерый волчище вышел из леса.
wload mob 20951
end
calcuid volchish 20951 mob
run 20957 %volchish.id%
~
#20956
нельзя вернуться в лес~
2 g 100
~
if %actor.realroom% == 20991
wsend %actor% Обратно Вам в эту чащу не пролезть.
return 0
end
if %actor.realroom% == 20993
wsend %actor% Обратно Вам в эту чащу не пролезть.
return 0
end
~
#20957
у матерого волчищи~
0 z 100
~
wait %random.9%s
if %self.fighting%
 halt
end
mecho Матерый волчище угрюмо посмотрел на Вас.
wait %random.9%s
if %self.fighting%
 halt
end
рыч
wait %random.9%s
if %self.fighting%
 halt
end
mecho Матерый волчище показал клыки и двинулся на Вас.
wait %random.9%s
if %self.fighting%
 halt
end
wait 20s
mecho Матерый волчище завыл. Ему больно.
wait 2s
msend %actor% Присмотревшись к его пасти, Вы поняли : - Да у него там застряла кость!
msend %actor% Аккуратно подойдя к нему, Вы сунули руку в пасть, и вытащили мелкую косточку.
mload obj 20971
дат кост.квест .%actor.iname%
wait 2s
mecho Матерый волчище завилял хвостом.
лизну .%actor.iname%
wait 2s
mecho Он всего лишь хотел что б Вы вытащили кость, поэтому и не пускал Вас.
mecho Теперь он обрадовался и довольно урча скрылся в непроходимой чаще.
mecho Путь свободен.
calcuid volhv 20950 mob
set kvest 1
remote kvest %volhv.id%
mpurge %self%
~
#20958
смерть матерого волчищи~
0 f 100
~
calcuid volhv 20950 mob
set kvest 0
remote kvest %volhv.id%
~
#20959
окончание принятия~
0 z 100
~
mteleport %kvestor% %self.realroom%
if %kvest% == 0
 крич %kvestor.iname% не прош%kvestor.y% испытание !
else
 крич %kvestor.iname% прош%kvestor.y% испытание !
end
wait 1s
msend %kvestor% Вы встали.
wait 1s
msend %kvestor% Кажется это был всего-лишь сон.
wait 1s
if %kvest% == 0
 msend %kvestor% Но тогда откуда же раны ?
else
 if %actor.haveobj(20972)%
  msend %kvestor% Но тогда откуда же это перо ?
  mforce %kvestor% брос перо.филина
 elseif %actor.haveobj(20971)%
  msend %kvestor% Но тогда откуда же эта косточка ?
  mforce %kvestor% брос косточ.квест
 end
end
rdelete kvest %self.id%
rdelete kvestor %self.id%
~
#20960
прошел испытание~
2 e 100
~
wait 1
if (%actor.realroom% == 20992)
calcuid volhv 20950 mob
eval kvestor %actor%
remote kvestor %volhv.id%
run 20959 %volhv.id%
end
~
#20961
атака на филина~
0 p 100
~
if (%self.hitp% < 500)
msend %damager% Филин обиженно ухнул, посмотрел на Вас и улетел.
mechoaround %damager% Филин обиженно ухнул, взглянул на %damager.rname% и улетел.
calcuid room %self.realroom% room
run 20965 %room.id%
halt
end
return 0
~
#20962
зовут серого пса~
2 d 0
*~
if (%speech.contains(серого пса)% || %speech.contains(серый пес)%)
 if (%speech.contains(зову)% || %speech.contains(приди)% || %speech.contains(прошу)%)
 %send% %actor% Сразу же пришел отклик на Ваш зов:
 %send% %actor% - Только добрый и честный пройдет.
 %send% %actor% - Будь уверен в себе.
 end
end
~
#20963
[кормить филина]~
0 c 0
кормить накормить~
if (%actor.vnum% != -1)
%echo% %actor.iname% начал%actor.g% шарить по себе в поисках чего-то, но ничего не наш%actor.y%.
halt
end
if !%arg.contains(филин)%
%send% %actor% Кого Вы собрались кормить ?
halt
end
if %self.fighting%
%send% %actor% Не стоит отвлекаться в бою.
halt
end
wait 1s
%send% %actor% _Покопавшись в вещах, Вы обнаружили маленький кусочек мяса,
%send% %actor% _давно завалявшийся среди прочих припасов.
wait 4s
%send% %actor% Робко подойдя поближе, Вы протянули филину кусочек мяса.
wait 4s
%send% %actor% Большой филин взял мясо из Ваших рук.
wait 5s
%send% %actor% Большой филин съел мясо.
%send% %actor% Большой филин ухнул и полетел куда-то в лес. Из его хвоста выпало маленькое перо.
calcuid roomper %self.realroom% room
attach 20964 %roomper.id%
exec 20964 %roomper.id%
wait 1
%force% %actor% вз перо
wait 1
%send% %actor% Вы поплелись следом за большим филином.
wait 5s
%send% %actor% Через некоторое время вы заметили что лес начал редеть...
eval temppaus %actor.wait(1)%
wait 3s
calcuid volhv 20950 mob
set kvest 1
remote kvest %volhv.id%
%door% 20993 north room 20992 flags a
%force% %actor% север
wait 1s
%door% 20993 north purge
~
#20964
грузим перо филина~
2 z 0
~
wload obj 20972
detach 20964 %self.id%
~
#20965
филин улетел~
2 z 0
~
%purge% больш.филин
%send% %damager% Его взгляд заворожил Вас.
%send% %damager% Вы замерли на месте, не в силах пошевельнуться.
eval temppaus %damager.wait(3)%
wait 3s
%send% %damager% Когда Вы смогли пошевелиться, Вы оглянулись и увидели проход в чаще на север.
calcuid volhv 20950 mob
set kvest 0
remote kvest %volhv.id%
%door% 20993 north room 20992 flags a
%force% %damager% север
wait 1s
%door% 20993 north purge
~
$~
