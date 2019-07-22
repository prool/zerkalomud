#5000
на чуже~
0 r 100
~
tell %actor.name% Не подскажете, люди добрые, как добраться до Киева?
ухмылка
~
#5001
на чуже1~
0 d 100
запад~
if %speech%==запад
  tell %actor.name% Спасибо!
  умница %actor.name%
endif
~
#5002
триггер на знахаре ~
0 j 100
труп~
wait 1
switch %object.name%
  case труп таракана
    say  Еще одним гадом меньше! Молодец, продолжай дальше, держи премию.
    %self.gold(+1)%
    дать 1 кун %actor.name%
    mpurge %object%
  break
  case труп клопа
    say  Еще одним гадом меньше! Молодец, продолжай дальше, держи премию.
    %self.gold(+1)%
    дать 1 кун %actor.name%
    mpurge %object%
  break
  case труп моли
    say  Еще одним гадом меньше! Молодец, продолжай дальше.
    mload obj 101
    дать ломоть %actor.name%
    mpurge %object%
  break
  case труп блохи
    say  Еще одним гадом меньше! Молодец, продолжай дальше.
    mload obj 101
    дать ломоть %actor.name%
    mpurge %object%
  break
  case труп серой мыши
    say  О, грызун, разносчик заразы! Получи премию.
    %self.gold(+5)%
    дать 5 кун %actor.name%
    mpurge %object%
  break
  default
    say  Зачем мне это?
    eval getobject %object.name%
    if  %getobject.car% == труп
      mpurge %object%
    else
      броси %getobject.car%.%getobject.cdr%
    end
  break
done
~
#5003
триггер на охотнике ~
0 j 100
труп~
wait 1
switch %object.name%
  case труп белки
    say  Из белки хорошая шкурка получится, продам потом иноземцу!
    улыб
    %self.gold(+10)%
    дать 10 кун %actor.name%
    mpurge %object%
  break
  case труп бобра
    say  Из бобра шикарная шкурка получится, продам потом иноземцу!
    %self.gold(+75)%
    дать 75 кун %actor.name%
    mpurge %object%
  break
  case труп рыси
    say  Из рыси шикарная шкурка получится, продам потом иноземцу!
    %self.gold(+100)%
    дать 100 кун %actor.name%
    mpurge %object%
  break
  case труп волка
    say О, ты убил%actor.g% волка! Это опасно, их целая стая!
    %self.gold(+20)%
    дать 20 кун %actor.name%
    mpurge %object%
  break
  default
    say  Зачем мне это?
    броси all
  break
done
~
#5004
входнарентухая~
0 r 100
~
wait 1
set factor %self.people%
while %factor%
  set pc %factor.next_in_room%
  if (%factor.vnum% == -1) && (%factor.level%>19) && (%factor.level%<31)
    if %factor.sex%==1
      tell %factor.name% Вырос ты уже, нечего тебе здесь штаны просиживать.
    else
      tell %factor.name% Выросла ты уже, нечего тебе здесь юбку просиживать.
    end
    tell %factor.name% Не пушу я тебя здесь на постой, иди в город, там где большие нужны.
    tell %factor.name% А от вас только проблемы здесь будут.
    mechoaround %factor% Хозяйка вытолкнула %factor.rname% в трактир.
    msend %factor.name% Хозяйка вытолкнула вас в трактир.
    mteleport %factor.name% 5001
    if %factor.sex%==1
      mat 5001 mechoaround %factor% Немного взлохмоченный %factor.name% пришел сверху.
    else
      mat 5001 mechoaround %factor% Немного взлохмоченная %factor.name% пришла сверху.
    end
  end
end
if %pc%
  makeuid factor %pc.id%
else
  set factor 0
end
done
~
#5005
триггер на дочке~
0 q 100
~
if ((%actor.level% >= 10) || (%actor.bank% >= 20))
  halt
end
wait  1
msend %actor% Дочка сказала Вам:
msend %actor% - Эх ты горемычн%actor.w%, голодн%actor.w% наверное, %actor.name%.
msend %actor% - Что мы нехристи чтобы не накормить. 
msend %actor% - Сейчас, подожди...
dg_cast 'насыщение' .%actor.name%
~
#5006
Стражник заходит к ПКиллеру~
0 t 75
~
wait 1
if %actor.clan% != null
  halt
end
foreach char %self.pc%
  if %char.agressor% > 5000
    if %char.agressor% < 5099
      set target %char%
    break
  end
end
if %char.agressor% > 5100
  if %char.agressor% < 5199
    set target %char%
  break
end
end
if %char.agressor% > 5600
  if %char.agressor% < 5699
    set target %char%
  break
end
end
done
if !%target%
  halt
end
if %target.sex% == 1
  крича %target.name%, - вот он, убивец, хватай его! Вяжи его!
else
  крича %target.name%, мерзавка, хватай ее! Вяжи ее!
end
Крича %target.name% - вот он%target.g% где, хватай, ребяты!
mforce %target.name% просн
mforce %target.name% stand
появ
mforce %target.name% трепет
mforce %target.name% следовать r1guarg
group all
kill %target.name% 
~
#5007
ПКллер заходит к стражнику~
0 q 80
~
wait 1
if %actor.clan% != null
  halt
end
if !%actor.agressor%
  halt
end
if %actor.agressor% > 5000
  if %actor.agressor% < 5099
    set agr 1
  end
end
if %actor.agressor% > 5100
  if %actor.agressor% < 5199
    set agr 1
  end
end
if %actor.agressor% > 5600
  if %actor.agressor% < 5699
    set agr 1
  end
end
if %agr% == 1
  if %actor.sex% == 1
    крича %actor.name%, - вот он, убивец, хватай его! Вяжи его!
  else
    крича %actor.name%, мерзавка, хватай ее! Вяжи ее!
  end
  Крича %actor.name% - вот он%actor.g% где, хватай, ребяты!
  mforce %actor.name% stand
  mforce %actor.name% следовать r2guard
  group all
  kill %actor.name% 
end
~
#5008
Заходят к страннику~
0 r 75
~
wait 1
emot поднял голову и прислушался к вашим шагам
say Остановись, добрый человек! Удели мне минуту!
attach 5009 %self.id%
~
#5009
слушаем странника~
0 d 0
слушаю говори~
if %speech% == слушаю
  wait 1s
  say Да будет на тебе благословение богов! Я не здешний, пришел сюда в поисках одной вещи...
  wait 1s
  say Хочешь ли ты выслушать мою историю? Готов ли ты помочь?
  attach 5018 %self.id%
  detach 5009 %self.id%
end
~
#5010
Дали осколок старику~
0 j 100
~
wait 1
if %object.vnum% != 5050
  wait 1s
  mecho %self.name% внимательно ощупал %object.vname%.
  wait 1s
  say Я не чувствую исходящего от него жара, опять какую-то безделушку мне принесли.
  wait 1s
  drop %object.name%
  взд
  halt
end
wait 1
mpurge %object%
wait 1s
say Да, это он! Я чувствую жар его! Благодарю тебя, мой спаситель!
wait 2s
if (%actor.can_get_feat(предсмертная ярость)% && !%actor.feat(предсмертная ярость)%)
  say Я хоть и слеп, а все же кое-что из воинского мастерства помню. Подойди, покажу тебе одну ухватку. 
  mechoaround %actor% 
  mfeatturn %actor% предсмертная.ярость set
  halt
end
if %random.1000% < 310
  say Нечем мне тебя отблагодарить, но вот возьми эту книгу, может, ее удастся выгодно продать ?
  wait 5
  mload obj 514
  дать книг .%actor.name%
  halt
end
msend %actor% За доброе дело вы получили несколько очков опыта!
%actor.exp(+50000)%
detach 5010 %self.id%
~
#5011
Заходит квестер к Ефимию~
0 r 100
~
if %quest50% && %quest50.id% == %actor.id%
  wait 2s
  if %quest50.room% == %self.room%
    say Ну что стоишь ? Что надобно ?
    attach 5012 %self.id%
    detach 5011 %self.id%
  end
end
~
#5012
Говорим Ефимию что надо~
0 d 0
осколок камень скол~
wait 1s
say Что-то нынче он всем нужен? И с чего бы это?
say Обычный желтый камешек, разве что теплый даже в мороз.
say Может, раз он тебе так нужен, кунами за него дашь? Скажем 8000 кун?
wait 1s
if %actor.sex% == 1
  say Согласен?
else
  say Согласна?
end
attach 5013 %self.id%
attach 5014 %self.id%
detach 5012 %self.id%
~
#5013
Незахотели давать денег ефимию~
0 d 0
нет~
wait 1s
%actor.setquest(5004)%
detach 5014 %self.id%
say Ну, тогда отработать придется.
say Я от дядьки своего давно вестей не получал.
say Сходи, отнеси ему весточку, помоги, если надо.
say Постараешься - награжу. Вот, возьми.
wait 1
mload obj 5051
дать письм %actor.name%
say Живет он на хуторе, что в лесу на закат от деревни.
detach 5013 %self.id%
~
#5014
Дали денег Ефимию~
0 m 200
~
if %amount% < 8000
  wait 1s
  mecho Ефимий аккуратно пересчитал деньги.
  wait 1s
  say ОБМАНЩИК!
  wait 4
  set dam %actor.hitp%
  msend %actor% Неуловимый удар громадного кулака отбросил Вас к стене!
  mechoaround %actor% Неуловимый удар громадного кулака отбросил %actor.vname% к стене!
  mdamage %actor.name% %dam%
else
  wait 1s
  mecho Ефимий аккуратно пересчитал деньги.
  %self.gold(-8000)%
  mecho Ефимий припрятал деньги за пазухой.
  mload obj 5050
  дать камень %actor.name%
  wait 1s
  say Надо же, за такую пустяковину деньги платить! Совсем одурел народ.
  detach 5013 %self.id%
  detach 5014 %self.id%
end
~
#5015
дали письмо дядюшки Ефимию~
0 j 100
~
wait 1
if %object.vnum% != 5518
  дум
  say Иди-ка ты своей дорогой...
  брос %object.name%
  halt
end
wait 1
mpurge %object%
wait 1s
if !%actor.quested(5004)%
  emot прочитал весточку
  say Тебя, видать, дядюшка послал?
  wait 1s
  say ну что же, благодарствую за помощь
  поклон
  say И за вести спасибо.
  halt
end
%actor.unsetquest(5000)%
%actor.unsetquest(5001)%
%actor.unsetquest(5002)%
%actor.unsetquest(5003)%
%actor.unsetquest(5004)%
say Постарался, вижу, вижу. Хорошие слова о тебе родич мой пишет. 
say Что ж, раз обещал - отдам. Бери вот...
wait 5
mload obj 5050
дать оскол %actor.name%
~
#5016
принесли письмо дядьке~
0 j 100
~
wait 1s
if %object.vnum% == 5051
  say Спасибо, что принес весточку от родича. Давно я к ним не хаживал.
  say Что-то ноги отниматься стали. Знахарь наш какое-то зелье готовит, оно вроде и помогает...
  say Да только он сам признается - не будет в зелье силы без нужных добавок.
  say А найти их он не может, стар уже по лесам да полям бегать.
  wait 1
  say Вот что, родич пишет, что ты работу подрядился выполнить?
  say Значит и найди их.
  say Принеси мне ...., ...., да ...., и тогда буду считать твою службу исполненной!
  attach 5017 %self.id%
  mpurge %object%
  detach 5016 %self.id%
end
~
#5017
приносим ингры - и получаем письмо~
0 j 100
~
detach 5017 %self.id%
~
#5018
Рассказ странника~
0 d 1
слушаю продолжай говори готов готова~
wait 1s
say Тогда слушай. Когда-то я был богатым купцом.
mecho _- Были у меня лавки, полные добра.
mecho _- Были ладьи быстроходные, были приказчики проворные да охрана надежная.
wait 1s
взд
wait 2s
say Но как-то во хмелю сказал я, не подумавши, о Богах старых нехорошие слова.
mecho _- А Они и услышали. И наказали - стал я слепнуть день ото дня.
mecho _- Без догляду хозяйского развалилась торговля, ушло богатство.
mecho _- Волхвы сказали, что большими дарами можно искупить вину.
mecho _- И отнес я все добро на капище. Не помогло, видно не те дары Богам нужны...
wait 1s
say  Но как-то услышал я, что есть в этих местах семья, которая владеет редкой диковинкой.
mecho _- Скол секиры громовой, которой Перун Змея гоняет.
mecho _- Пришел я к ним, да прогнали со двора нищего калеку,
mecho _- Что я им дать могу, чем отблагодарить?
mecho _- Прошу - добудь мне драгоценный дар, уговори аль отслужи.
mecho _- Может, если бы отнес такой дар, не богатством кичась, а почтение выказывая
mecho _- Может тогда простят мне глупые слова, да от хвори избавят?
set quest50 %actor%
calcuid efim 5029 mob
attach 5011 %efim.id%
remote quest50 %efim.id%
*attach 5010 %self.id%
detach 5008 %self.id%
detach 5018 %self.id%
~
#5019
встречает старый цыган~
0 g 100
~
tell %actor.name% Хочешь довезут тебя до одного места, сам туда ты не проберешься!
eval needgold %actor.level%
tell %actor.name% Всего-то кун эдак %needgold% и ты там!
~
#5020
дали куны цыгану5031~
0 m 1
~
if %actor.vnum% != -1
  halt
end
eval needgold %actor.level%
if %amount% < %needgold%
  дать %amount% кун %actor.name%
  tell %actor.name% Маловато будет!
else
  mecho Цыган обернулся куда-то к кустам и громко свистнул.
  mecho Из-за кустов выскочил цыганенок с телегой.
  msend %actor.name% С ветерком довезут, глазом моргнуть не успеешь!
  msend %actor% Цыганенок быстро подвел Вам телегу.
  mechoaround %actor% %actor.iname% влез%actor.q% на телегу.
  mecho Цыганенок крикнул: А ну залетные!
  wait 1
  mteleport %actor.name% 4064 horse
  wait 1
  msend %actor% Не успели Вы и глазом моргнуть, уже приехали!
  msend %actor% Цыганенок быстро развернул телегу и умчался обратно.
  mechoaround %actor% %actor.iname% слез%actor.q% с подъехавшей телеги.
  mechoaround %actor% Телега развернулась и умчалась прочь.
end
~
#5021
встречает старый следопыт~
0 r 100
~
*встречастарый | Mobiles | Great-All PC | 100
tell %actor.name% Могу провести неизвестными никому дорогами до степной деревни!
eval needgold %actor.level%
tell %actor.name% Всего за %needgold% кун!
~
#5022
дать кун старому следопыту~
0 m 1
~
*дать20старому | Mobiles | Bribe | 1
if %actor.vnum% != -1
  halt
end
eval needgold %actor.level%
if %amount% < %needgold%
  дать %amount% кун %actor.name%
  tell %actor.name% Мало, договор превыше всего!
else
  mecho Следопыт коротко крякнул как утка.
  msend %actor.name% Из-за кустов вылез еще один следопыт и махнул рукой чтобы следовали за ним.
  if %actor.sex%==1
    mechoaround %actor% Из-за кустов вылез еще один следопыт и махнул рукой для %actor.name% чтобы следовал за ним.
    mechoaround %actor% %actor.name% исчез в кустах вместе с проводником.
  else
    mechoaround %actor% Из-за кустов вылез еще один следопыт и махнул рукой для %actor.name% чтобы следовала за ним.
    mechoaround %actor% %actor.name% исчезла в кустах вместе с проводником.
  endif
  mteleport %actor.name% 6053 horse
  msend %actor% Ваше путешествие окончилось.
  * if %actor.sex%==1
  *  mat 6053 mechoaround %actor% %actor.name% появился с проводником.
  * else
  *  mat 6053 mechoaround %actor% %actor.name% появилась с проводником.
  * end
  *  mat 6053 mecho Проводник скрылся под навесом.
  *end
end
~
$~
