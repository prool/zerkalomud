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
  if %actor.clanrank% != 0 && %actor.name% != Наталья
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
  if %actor.clanrank% != 0 && %actor.name% != Наталья
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
0 ab 15
~
*if (%actor.clan%==рсп)
%echo% Охотник осмотрел Вас с ног до головы.
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
  г %enroom.name% - кажется, %enemy.name% именно там.
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
    %echoaround% %actor% %actor.name% попытал%actor.u% пройти в дом, но викинг не пустил его.
    %send% %actor% Вы попытались пройти в дом, но викинг не пустил Вас.
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
2 c 1
перелезть убежать ждать~
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
* тут глюк - если человек не вводил команду а следует за кем-то, то он сможет войти
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
wait 2s
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
#20924
Емеля 1~
0 q 100
~
if (%actor.name%==Кожедуб)
  %echoaround% %actor% Кузнец с громким воплем повис на шее Кожедуба.
  %send% %actor% С громким воплем кузнец повис у Вас на шее.
  wait 1
  г Кожедубище, брателло, где же ты пропадаал??
end
~
#20925
Воевода просит что то у матери~
0 d 0
*~
if !%speech.contains(дай)%
  halt
end
if %actor.clanrank% != 9
  г Хрен тебе холоп, рангом ты не вышел просить что то у меня!
  halt
end
if %speech.contains(ключ)%
  mload obj 20958
elseif %speech.contains(перв)%
  mload obj 20945
elseif %speech.contains(втор)%
  mload obj 20913
elseif %speech.contains(трет)%
  mload obj 20914
elseif %speech.contains(рун)%
  mload obj 20915
elseif %speech.contains(ингридиен)%
  mload obj 20916
elseif %speech.contains(знамя)%
  mload obj 20920
elseif %speech.contains(игвовед)%
  mload obj 20917
else
  halt
End
wait 1
дать все %actor.iname%
wait 1
г Держи эту вещь, и используй ее по назначению.
~
#20926
лезть щель~
2 c 100
лезть~
if !(%arg.contains(щель)%) 
  wsend       %actor% Куда это Вы хотите пролезть???
  return 0
  halt
end
%send%       %actor% Сев на корточки Вы с трудом протиснулись в узкую щель в ограде.
%echoaround% %actor% %actor.name% с трудом пролез%actor.q% в узкую щель в ограде.
wait 1s
wsend %actor% .- Вы оказались в глубокой яме.
wteleport %actor.name% 20916
wat 20916 wechoaround %actor% Кто-то пролез сюда.
~
#20927
Полюд 1~
0 q 100
~
if (%actor.name%==Полюд)
  %echoaround% %actor% Памятник с жутким скрипом повернулся к Полюду.
  %send% %actor% Памятник с жутким скрипом повернулся к Вам.
  wait 1
  ворч полюд
end
~
#20928
Курильщик кальяна~
0 b 20
~
switch %random.6%
  case 1
    хих
  break
  case 2
    смея
  break 
  case 3
    улыб
  break
  case 4
    ржат
  break
  case 5
    эм захихикал : 'гыыыы, сына, ЛООЛ!'
  break
  case 6
    эм закричал : 'Кто накурился?! Я накурился?'
  break
done
~
#20929
Раскуренный косяк~
1 b 40
~
eval uidchar %self.carried_by%
* ** UID чара который несет шмотку
if !%uidchar%
  halt
end
switch %random.10%
  case 1
    oforce %uidchar% хих
  break
  case 2
    oforce %uidchar% смеят
  break 
  case 3
    oforce %uidchar% улыб
  break
  case 4
    oforce %uidchar% ржат
  break
  case 5
    oforce %uidchar% эм захихикал%uidchar.g% : 'гыыыы, сына, ЛООЛ!'
  break
  case 6
    oforce %uidchar% эм закричал%uidchar.g% : 'Кто накурился?! Я накурил%uidchar.u%?'
  break
  default
    **%echo% Косячок завсетился.
    %send%       %uidchar% Вы с наслаждением затянулись самокруткой.
    %echoaround% %uidchar% %uidchar.name% с наслаждением затянул%uidchar.u% небольшой самокруткой.
  break
done
end
~
#20930
курить кальян~
0 c 100
покурить~
if !(%arg.contains(кальян)%) 
  %send% %actor% Что Вы собираетесь курить??
  return 0
  halt
end
%send% %actor% Вы с наслаждением начали курить кальян.
%echoaround% %actor% %actor.name% начал%actor.q% курить кальян.
wait 2s
%send% %actor% Отшельник повернул голову к Вам и хитро улыбнулся.
wait 1s
%send% %actor% Отшельник сказал Вам : 'Дарагой, зачем куришь мой кальян? Для тебя у меня есть вот что.'
%load% obj 20919
дат все %actor.name%
~
#20931
экипировка~
0 c 100
экипировка~
бро все
if %arg.contains(броня)%
  if (%actor.bank%<530)
    %send% %actor% Ты же совсем нищий! Иди сначала вложи 530 кун в банк, а потом проси шмот!
    halt
  end
  %load% obj 20931 *кольчуга 100 
  %load% obj 20932 *шлем     80
  %load% obj 20933 *штаны    50
  %load% obj 20934 *наручи   60
  %load% obj 20935 *перчи    35
  %load% obj 20938 *сапоги   60
  %load% obj 20939 *плащ     35
  %load% obj 20910 *сумка    10
  %load% obj 20953 *кольцо   20
  %load% obj 20953 *кольцо   20
  %load% obj 20954 *брас     30
  %load% obj 20954 *брас     30
  %actor.bank(-530)%
elseif %arg.contains(зелья)%
  if (%actor.bank%<2190)
    %send% %actor% Ты же совсем нищий! Иди сначала вложи 2190 кун в банк, а потом проси шмот!
    halt
  end
  %load% obj 139 *рекол 25 
  %load% obj 139 *рекол 25 
  %load% obj 139 *рекол 25 
  %load% obj 139 *рекол 25 
  %load% obj 139 *рекол 25 
  %load% obj 139 *рекол 25 
  %load% obj 139 *рекол 25 
  %load% obj 139 *рекол 25 
  %load% obj 139 *рекол 25 
  %load% obj 139 *рекол 25
  %load% obj 144 *всевид 100
  %load% obj 144 *всевид 100 
  %load% obj 144 *всевид 100
  %load% obj 144 *всевид 100
  %load% obj 144 *всевид 100
  %load% obj 144 *всевид 100
  %load% obj 144 *всевид 100
  %load% obj 144 *всевид 100
  %load% obj 144 *всевид 100
  %load% obj 144 *всевид 100
  %load% obj 141 *красный 300
  %load% obj 141 *красный 300
  %load% obj 141 *красный 300
  %load% obj 142 *серый 20
  %load% obj 142 *серый 20
  %actor.bank(-2190)%
elseif %arg.contains(еда)%
  if (%actor.bank%<450)
    %send% %actor% Ты же совсем нищий! Иди сначала вложи 450 кун в банк, а потом проси шмот!
    halt
  end
  %load% obj 20911 *кисель 30 
  %load% obj 20911 *кисель 30 
  %load% obj 20911 *кисель 30 
  %load% obj 20911 *кисель 30 
  %load% obj 20911 *кисель 30 
  %load% obj 20911 *кисель 30 
  %load% obj 20911 *кисель 30  
  %load% obj 20911 *кисель 30  
  %load% obj 20911 *кисель 30  
  %load% obj 20911 *кисель 30  
  %load% obj 20911 *кисель 30  
  %load% obj 20911 *кисель 30  
  %load% obj 20911 *кисель 30  
  %load% obj 20911 *кисель 30  
  %load% obj 20911 *кисель 30  
  %actor.bank(-450)%
elseif %arg.contains(вся)%
  if (%actor.bank%<3170)
    %send% %actor% Ты же совсем нищий! Иди сначала вложи 3170 кун в банк, а потом проси шмот!
    halt
  end
  %load% obj 139 *рекол 25 
  %load% obj 139 *рекол 25 
  %load% obj 139 *рекол 25 
  %load% obj 139 *рекол 25 
  %load% obj 139 *рекол 25 
  %load% obj 139 *рекол 25 
  %load% obj 139 *рекол 25 
  %load% obj 139 *рекол 25 
  %load% obj 139 *рекол 25 
  %load% obj 139 *рекол 25
  %load% obj 144 *всевид 100
  %load% obj 144 *всевид 100 
  %load% obj 144 *всевид 100
  %load% obj 144 *всевид 100
  %load% obj 144 *всевид 100
  %load% obj 144 *всевид 100
  %load% obj 144 *всевид 100
  %load% obj 144 *всевид 100
  %load% obj 144 *всевид 100
  %load% obj 144 *всевид 100
  %load% obj 141 *красный 300
  %load% obj 141 *красный 300
  %load% obj 141 *красный 300
  %load% obj 142 *серый 20
  %load% obj 142 *серый 20
  %load% obj 20911 *кисель 30 
  %load% obj 20911 *кисель 30 
  %load% obj 20911 *кисель 30 
  %load% obj 20911 *кисель 30 
  %load% obj 20911 *кисель 30 
  %load% obj 20911 *кисель 30 
  %load% obj 20911 *кисель 30  
  %load% obj 20911 *кисель 30  
  %load% obj 20911 *кисель 30  
  %load% obj 20911 *кисель 30  
  %load% obj 20911 *кисель 30  
  %load% obj 20911 *кисель 30  
  %load% obj 20911 *кисель 30  
  %load% obj 20911 *кисель 30  
  %load% obj 20911 *кисель 30   
  %load% obj 20931 *кольчуга 100 
  %load% obj 20932 *шлем     80
  %load% obj 20933 *штаны    50
  %load% obj 20934 *наручи   60
  %load% obj 20935 *перчи    35
  %load% obj 20938 *сапоги   60
  %load% obj 20939 *плащ     35
  %load% obj 20910 *сумка    10
  %load% obj 20953 *кольцо   20
  %load% obj 20953 *кольцо   20
  %load% obj 20954 *брас     30
  %load% obj 20954 *брас     30
  %actor.bank(-3170)%
Else
  %send% %actor% Какую экипировку ты хочешь получить?
  %send% %actor% Экипировка броня - я дам тебе полный доспех, он стоит 530 кун
  %send% %actor% Экипировка зелья - я обеспечу тебя необходимыми зельями для путешествия, это стоит 2190 кун
  %send% %actor% Экипировка еда   - я соберу тебе еду в путь, это будет стоить 450 кун
  %send% %actor% Экипировка вся   - я дам все вышеперечисленное, и стоить это будет 3170 кун
  halt
end
дать все %actor.name%
бро все
~
#20932
Ники кричит~
0 q 100
~
if %actor.clan% == рсп
  halt
end
крич &YРазве ты не знаешь, &W%actor.name%&Y, что это место лучше обходить дальней дорогой?&n
~
#20950
[г прими] воевода волхву~
0 d 100
прими~
if %actor.clanrank% == 0 || %actor.name% == Наталья
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
elseif ((%actor.level% < 11) && (%actor.remort% == 0))
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
#20966
Убили волкодава~
0 f 100
~
return 0
mecho Волкодав съежился и превратился в игрушку.
mload obj 20905
~
#20967
Бобик спамит~
0 b 10
~
wait 1
switch %random.4%
  case 1
    tell суратон Дай миллион, ну дай миллион!
  break
  case 2
    tell суратон Должок, за тобой человече! Не отягощай душу стяжательством - верни, что брал!
  break
  case 3
    tell суратон Не собирай себе богатств на земле - верни долг!
  break
  case 4
    tell суратон Дай миллион - добром прошу!
  done
~
#20968
Портал в степь~
2 e 100
~
wait 1
wecho Раздался переливчатый звон и в воздухе возникла лазурная пентаграмма.
wportal 131415 2
~
#20969
Муфта Тессы упирается :)~
1 l 100
~
if %actor.eq(9)% == %self%
  return 0
  osend %actor% Муфта отчаяанно заверещала и вцепилась коготками Вам в руки.
  oechoaround %actor% %actor.name% попыталась снять муфту.
  oechoaround %actor% Муфта истошно заверещала, а %actor.name% подскочила и взвизгнула.
end
~
#20970
Социалы муфты~
1 c 1
почесать~
return 0
wait 1
oechoaround %actor% %actor.name% почесала %self.vname%.
if %self.worn_by%
  oecho _%self.iname% блаженно замурлыкал%self.g% и расслабил%self.u%.
  set equiped 0
  global equiped
  wait 3s
  if %self.worn_by%
    set equiped 1
    global equiped
  end
  halt
end
switch %random.8%
  case 1
    oecho _%self.iname% недовольно зашипел%self.g% и выпустил%self.g% когти.
  break
  case 2
    oecho _%self.iname% заерзал%self.g% на месте, устраиваясь поудобней.
  break
  case 3
    oecho _%self.iname% заворчал%self.g% и начал%self.g% примеривать белые тапочки.
  break
  case 4
    oecho _%self.iname% сердито засопел%self.g% и топнул%self.g% ножкой.
  break
  case 5
    oecho _%self.iname% громко замурлыкал%self.g%.
  break
  case 6
    oecho _%self.iname% распустил%self.g% мех и начал%self.g% прихорашиваться.
  break
  case 7
    oecho _%self.iname% обалдело поморгал%self.g% зенками.
  break
  case 8
    oecho _%self.iname% довольно заурчал%self.g% и принял%actor.u% вылизывать Тессу.
  done
~
#20971
муфта вырывается~
1 g 100
~
if %actor.name% == Тесса || %actor.name% == Ясна
  wait 1s
  oecho %self.iname% довольно замурлыкал%self.g%.
  halt
end
wait 1
if !%self.carried_by%
  oecho %self.iname% истошно заверещал%self.g% и начала вырываться.
else
  return 0
  oechoaround %actor% %actor.name% попытал%actor.u% надеть %self.vname%.
  oechoaround %actor% %self.iname% истошно завопил%self.g% и вырвал%self.u% из рук %actor.rname%.
  osend %actor% %self.iname% истошно завопил%self.g% и вырвал%self.u% из ваших рук.
  oforce %actor% drop %self.name%
end
~
#20972
Прввращения муфты~
1 jl 100
~
if (%actor.name% != Тесса && %actor.name% != Ясна)
  oecho %self.name% истошно завопил%self.g% и выпустил%self.g% когти.
  return 0
  halt
end
if %equiped% == 1
  return 0
  osend %actor% %self.iname% отчаяанно заверещал%self.g% и вцепил%self.u% коготками Вам в руки.
  oechoaround %actor% %actor.name% попыталась снять %self.vname%.
  oechoaround %actor% %self.iname% истошно заверещал%self.g%, а %actor.name% подскочил%actor.g% и взвизгнула.
end
wait 1
set char %self.worn_by%
if (!%char% && %self.carried_by% && (%self.vnum% != 20975))
  oecho %self.iname% снова превратил%self.u% в &Wпушистую муфту&n!
  otransform 20975
end
set i 0
while %i% < 18
  eval i %i%+1
  if (%char.eq(%i%)% == %self%)
    switch %i%
      case 3
        case 4
          if %self.vnum% != 20976
            oecho %self.iname% обернул%self.u% вокруг шеи и превратил%self.u% в &WПушистое манто&n!
            otransform 20976
          end
        break
        case 9
          case 10
            if %self.vnum% != 20975
              oecho %self.iname% превратил%self.u% в &Wпушистую муфту&n!
              otransform 20975
            end
          break
          case 12
            if %self.vnum% != 20979
              oecho После одевания на плечи, %self.iname% волшебным образом обратил%self.u% &Wшубкой&n!!
              otransform 20979
            end
          break
          case 14
            if %self.vnum% != 20978
              oecho %self.iname% обернул%self.u%ь вокруг правого запястья, подмигнула Вам и превратил%self.u% в &Wбраслетик&n!
              otransform 20978
            end
          break
          case 15
            if %self.vnum% != 20978
              oecho %self.iname% обернул%self.u% вокруг левого запястья, &Rхищно моргнула &wи превратилось в &Wбраслетик&n!!
              otransform 20978
            end
          break
        done
      end
    done
    if %self.worn_by%
      set equiped 1
    else
      set equiped 0
    end
    global equiped
~
#20973
Охотник выпинывает левых~
0 r 100
~
wait 1
if (%actor.clan% == рсп)
  halt
end
msend %actor% Охотник хмуро взглянул на вас.
mechoaround %actor% Охотник хмуро взглянул на %actor.vname%.
say Чего надобно? Проваривай, откуда явил%actor.u%.
msend %actor% Вы почувствовали себя неловко, и поспешили оставить Велизара в покое.
mforce %actor% east
~
#20974
Иноземиец выпинывает афкеров в тьме~
0 b 20
~
foreach victim %self.pc%
  if %victim.affect(затемнение)%
    say %victim.name%, многовато тьмы в твоей головушке!
    say Иди-кось, проветрись!
    msend %actor% Тут же дюжие парни схватили вас за бока и сволокли в поруб.
    mechoaround %actor% Тут же дюжие парни схватили %victim.vname% за бока и сволокли в поруб.
    mforce %victim% wake
    mforce %victim% stand
    mforce %victim% w
    mforce %victim% n
    mforce %victim% w
    mforce %victim% w
    mforce %victim% w
    mforce %victim% w
    mforce %victim% w
    mforce %victim% w
    mforce %victim% w
    *mforce %victim% n
  end
done
~
$~
