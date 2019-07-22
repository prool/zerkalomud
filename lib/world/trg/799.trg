#79900
reset~
2 f 100
~
eval zabros 0
calcuid river 79925 room
remote zabros %river.id%
calcuid hovalaroom 79996 room
detach 79939 %hovalaroom.id%
attach 79953 %hovalaroom.id%
~
#79901
умер свирепый~
0 f 100
~
return 0
mecho Свирепый волк издал предсмертный вой и умер.
mecho Волчата услышали вой и примчались сюда!
mload mob 79910
mload mob 79910
~
#79902
умер лютый~
0 f 100
~
mecho Над трупом лютого волка возник его дух.
mload mob 79909
if ((%world.curobjs(79924)% < %world.maxobj(79924)%) 88 (20 >= %random.100%))
  %load% obj 79924
end
~
#79903
умерла птица~
0 f 100
~
mecho Увидев что их мать убита, птенцы набросились на Вас.
mload mob 79913
mload mob 79913
if ((%world.curobjs(79936)% < %world.maxobj(79936)%) && (20 >= %random.100%))
  %load% obj 79936
end
~
#79904
речь хранителя~
0 r 100
~
wait 1
say Куда собрал%actor.u%?
wait 1s
say На Стожар-гору запрещено подниматься!
wait 1s
if (%actor.sex% == 2)
  say Возвращайся туда, откуда пришла!
else
  say Возвращайся туда, откуда пришел!
end
~
#79905
умер дух горы~
0 f 100
~
mecho Перед смертью дух вызвал небольшое землетрясение.
calcuid troom %self.realroom% room
attach 79958 %troom.id%
exec 79958 %troom.id%
~
#79906
самон серебряного клинка~
0 k 100
~
mecho Серебряный разбойник произнес: 'argentum Lamina ad auxilium'.
wait 1s
mecho &CСеребряный клинок явился на зов своего владельца!&n
mload mob 79919
detach 79906 %self.id%
~
#79907
Серебряные двери открываются~
0 f 100
~
mdoor 79964 west purge 
mdoor 79964 west room 79962
mdoor 79974 east purge
mdoor 79974 east room 79975
mecho Вы услышали громкий скрип открывающихся дверей.
~
#79908
захлопнулись двери (серебро)~
2 e 100
~
wait 1
wecho Только Вы зашли в серебряные хоромы, дверь позади Вас захлопнулась.
detach 79908 %self.id%
~
#79909
захлопнулись двери (золото)~
2 e 100
~
wait 1
wecho Только Вы зашли в золотые хоромы, дверь позади Вас захлопнулась.
detach 79909 %self.id%
~
#79910
самон золотого головоруба~
0 k 100
~
mecho Золотой велет произнес: 'аurea Ferrum ad auxilium'.
wait 1s
mecho &YЗолотой головоруб явился на зов своего владельца.&n
mload mob 79922
detach 79910 %self.id%
~
#79911
Золотые двери открываются~
0 f 100
~
mdoor 79977 west purge 
mdoor 79977 west room 79976
mdoor 79983 east purge
mdoor 79983 east room 79987
mecho Вы услышали громкий скрип открывающихся дверей.
~
#79912
Драгоценный велет умер~
0 f 100
~
return 0
mecho Велет разлетелся на множество драгоценных осколков.
mload mob 79925
mload mob 79925
mload mob 79925
mload mob 79925
if ((%world.curobjs(79933)% < %world.maxobj(79933)%) && (20 >= %random.100%))
  %load% obj 79933
end
~
#79913
Птица подымает цель~
0 l 50
~
set target %random.pc%
if (!%target%)
  halt
end
mechoaround %target% Птица схватила %target.vname% своими железными когтями и взмыла ввысь.
msend %target% Птица схватила Вас своими железными когтями и взмыла ввысь.
%actor.wait(2)%
wait 2s
mechoaround %target% Птица разжала когти и %target.iname% полетел%target.g% на землю с огромной высоты.
msend %target% Птица разжала когти и Вы полетели на землю с огромной высоты.
%target.wait(1)%
%target.position(6)%
%echo% Шлеп!
mdamage %target% 250
detach 79913 %self.id%
~
#79914
Волк набрасывается~
0 l 50
~
set target %random.pc%
if (!%target%)
  halt
end
attach 79923 %self.id%
mechoaround %target% Волк набросился на %target.vname%, повалил на землю и принялся рвать %target.s% в клочья.
msend %target% Волк набросился на Вас, повалил на землю и принялся рвать Вас клыками.
eval temp %actor.wait(5s)%
eval temp %target.position(6)%
wait 10
mechoaround %actor% Волк разорвал на %actor.pname% часть одежды.
msend %actor% Волк разорвал на Вас часть одежды.
mdamage %actor% 100
wait 1s
set i 0
while ((%i% < 4) && %target%)
  mechoaround %actor% Волк оторвал от %actor.vname% кусок плоти.
  msend %actor% Волк оторвал от Вас изрядный кусок.
  mdamage %actor% 100
  wait 1s
  eval i %i%+1
done
eval temp %actor.wait(1s)%
mechoaround %actor% Волк отскочил от искалеченного тела %actor.vname%.
msend %actor% Волк отскочил от Вашего искалеченного тела.
detach 79914 %self.id%
~
#79915
приветствие конюха~
0 qz 100
~
wait 5
г Приветствую тебя, %actor.iname%!
wait 5
г Если я еще жив, значит ты помощь оказать мне хочешь?
г Стрелец говорил, что в беде меня не оставит.
wait 10
г Видимо, тебе уже известно о том, что здесь происходит и кто такой Ховала...
wait 5
г Верни мою упряжь конскую, пожалуйста!
wait 5
г А я тебя отблагодарю!
покл
detach 79915 %self.id%
~
#79916
приветствие рыбака~
0 qz 100
~
wait 5
г Здраве буде, %actor.iname%!
wait 5
if (%actor.sex% == 2)
  г Если я еще жив, значит ты пришла помочь мне?
else
  г Если я еще жив, значит ты пришел помочь мне?
end
г Стрелец говорил, что кого-нибудь пришлет.
wait 10
г Наверное, он уже рассказал о беде, которая с нами приключилась.
wait 5
г Верни мою сеть рыболовную, пожалуйста!
wait 5
г За мной не заржавеет!
покл
detach 79916 %self.id%
~
#79917
Приветствие амбарного~
0 qz 100
~
wait 5
г Здравствуй, %actor.iname%!
wait 5
г Если я еще жив, значит ты помощь оказать мне хочешь?
г Стрелец говорил, что найдет того кто сможет разобраться.
wait 10
г Если уж ты здесь, значит ты знаешь о беде по имени Ховала...
wait 5
г Верни мою мельницу-крупорушку ручную, пожалуйста!
wait 5
г Век благодарен буду!
покл
detach 79917 %self.id%
~
#79918
приветствие хлевного~
0 qz 100
~
wait 5
г Низкий поклон тебе, %actor.iname%!
wait 5
г Если я еще жив, значит ты помочь хочешь?
г Стрелец говорил, что просто так все это не оставит.
wait 10
г Наверное тебе Ховала тоже чем-то досадил, раз ты направляешся туда.
wait 5
г Верни моих телят-жеребят-козлят, пожалуйста!
wait 5
г Отблагодарю тебя чем смогу!
покл
detach 79918 %self.id%
~
#79919
Приветствие стрельца~
0 q 100
~
wait 5
г Приветствую тебя, %actor.iname%!
wait 5
г Нечем поделиться с тобой путник.
г Беда у нас приключилась!
wait 10
г И ничего поделать не можем, остается только терпеть и ждать...
attach 79920 %self.id%
detach 79919 %self.id%
~
#79920
диалог с стрельцом~
0 d 100
что случилось?~
wait 5
г Да ночью опять, как о прошлогодье, по деревне Ховала бродил
г со своими слугами - разбойными молодцами. 
г Унесли все, что плохо лежит.
wait 5
г Сети рыболовные с шестов для просушки.
г Упряжь конскую, что в конюшню убрать забыли.
г Мельницу-крупорушку ручную, что в амбар забыли отнести.
г Телят-жеребят-козлят увели, которых в хлев не заперли. 
wait 5
г Уволокли все подчистую!
всхлип
wait 5
mforce %actor% say А каков он, этот Ховала?
wait 1s
г Да старик седобородый с клюкою.
г На голове корона, вокруг нее двенадцать глаз огненных: ничто от них не скроется.
wait 1s
mforce %actor% say Что ж мужики-то Ваши деревенские за добро свое не вступились?
wait 1s
г Поди вступись.
г Лучами из глаз своих Ховала так ослепит - потом три дня будешь незрячим ходить, 
г молочком козьим глаза протирать.
г Нет управы на Ховалу, нет.
wait 5
mforce %actor% say Как бы мне, стрелец, того Ховалу разыскать?
wait 1s
г И не помышляй. Хоромы его за Волчьей падью, на Стожар-горе. 
г Туда ни пройти, ни проехать. 
wait 1s
г Днем птицы с железными клювами заклевывают неосторожного путника до смерти,
г ночью волки рыщут, добычу себе кровавую ищут.
г Духи бродят, проходу не дают.
г Охраняют Стожар-гору всячески.
wait 10
г Теперь ты знаешь беду нашу...
wait 1s
г Возьмешься?
attach 79921 %self.id%
detach 79920 %self.id%
~
#79921
квест стрельца~
0 d 1
да возьмусь помогу~
wait 1
г Вот и замечательно!
wait 2
г Сходи-ка ты к работягам нашим,
г Они тебе скажут что именно у них украл Ховала.
wait 2
г Желаю удачи!
calcuid rubak 79900 mob
attach 79916 %rubak.id%
calcuid konuh 79901 mob
attach 79915 %konuh.id%
calcuid xlevnik 79902 mob
attach 79918 %xlevnik.id%
calcuid ambarnik 79904 mob
attach 79917 %ambarnik.id%
~
#79922
приветствие жителя~
0 r 10
~
wait 2
г Приветствую тебя, путник.
~
#79923
испуг волка~
0 c 1
взмахнуть махнуть~
if !%arg.contains(факелом)%
  msend %actor% Чем Вы хотите взмахнуть ?
  halt       
end
mechoaround %actor% %actor.iname% взял%actor.g% в руку факел и взмахнул%actor.g% им перед волком.
msend %actor% Вы взяли в руку факел и взмахнули им перед волком.
wait 5
mecho При виде огня, волк в испуге отскочил от своей жертвы.
calcuid wolf 79908 mob
detach 79914 %wolf.id%
detach 79923 %self.id%     
~
#79924
самон глаз~
0 lz 100
~
exec 79953 %self.room%
~
#79925
смерть ховалы~
0 fz 100
~
if (%exist.mob(79927)%)
  calcuid eyes 79927 mob
  mecho Глаза вспыхнули ярким огнем и исчезли.
  mpurge %eyes%
end
if ((%world.curobjs(79927)% < %world.maxobj(79927)%) && (20 >= %random.100%))
  %load% obj 79927
end
~
#79926
вошли к Ховале~
0 r 100
~
foreach target %self.pc%
  %target.wait(15)%
done
wait 5
if (%actor.sex% == 2)
  г Зачем припожаловала, гостья непрошеная?
else
  г Зачем припожаловал, гость непрошеный?
end
wait 2s
mforce %actor% say Отдай добро, кое в позавчерашнюю ночь награбил
mforce %actor% say По-хорошему отдай. Не то саблей порублю, конем потопчу
wait 2s
mecho Усмехнулся старик, заиграли, зажмурились двенадцать глаз вокруг его короны.
mecho И помутился в Ваших глазах весь белый свет.
wait 5s
mecho Спустя некоторое время, Вы пришли в себя.
wait 2s
mecho Ховала взглянул и усмехнулся.
wait 10
if (%actor.sex% == 2)
  г Долгонько спала ты, гостья непрошеная.
else
  г Долгонько спал ты, гость непрошеный.
end
г Теперь понял%actor.g% каково невежей быть, хозяину чести не оказывать?
wait 2s
mforce %actor% say Прости меня, старче, за горячность
mforce %actor% say Сам понимаешь: мы, стрельцы - люди лихие
mforce %actor% say Больно уж людишек деревенских ограбленных жалко мне стало!
wait 2s
г Кого ты жалеешь, жизнью своей понапрасну рискуя?
г Нерадивых да нерачительных, неосмотрительных да нехозяйственных.
г У хорошего-то хозяина все под присмотром, все под замком.
г А плохо лежащее - моя добыча.
г Вот я ее и ховаю, прячу.
wait 5 
г Так предначертано небесами.
wait 10
mechoaround %actor% %actor.iname% замер%actor.q% на месте, не зная, что сказать в ответ.
msend %actor% Вы замерли на месте, не зная, что сказать в ответ.
wait 1s
г Ладно, повинную голову меч не сечет.
г Верну пожитки деревенские, дабы тебе не краснеть перед людьми за напрасное путешествие.
г Так и быть!
wait 10
msend %actor% Ховала открыл огромный ларец и достал из него все что добыл в деревне, сложил в мешок и дал Вам.
mechoaround %actor% Ховала открыл огромный ларец и достал из него все что добыл в деревне, сложил в мешок и дал %actor.dname%.
mload obj 79900
wait 1
дать все .%actor.name%
г Мешок волшебный! Отнеси его стрельцу - он разберется что к чему.
wait 10
г Ну все, ступай!
mdoor 79997 west purge 
mdoor 79997 west room 79995
mdoor 79995 east purge
mdoor 79995 east room 79997
detach 79926 %self.id%
~
#79927
предупреждение старика~
0 r 100
~
wait 5
if (%actor.sex% == 1)
  г Стой, юноша!
else
  г Постой, красавица!
end
wait 10
г Не ходи ты в падь волчью.
г Волки там лютые да свирепые,
г в миг жизнь свою загубишь там.
wait 1s
mforce %actor% say Я иду к Ховале! Добро ваше вернуть!
wait 5
г А, ну раз такое дело.
г Я дам тебе один совет.
г Вот, держи факел!
wait 10
mload obj 79905
wait 1
дать все .%actor.name%
wait 1s
г Если вдруг на волков свирепых наткнешься.
г Взмахни этим факелом, как только волк набросится на кого-нибудь.
г Как волки огонь увидят, сразу разбегаются в разные стороны.
wait 1s
г И факел постарайся не потерять, мне он еще пригодится!
wait 10
г Удачи!
mecho Старик вздохнул и ушел на восток.
calcuid starik 79928 mob
mteleport %starik% 79926
detach 79927 %self.id%
~
#79928
награда старика~
0 j 100
~
if %object.vnum% != 79905
  msend %actor% %self.dname% это не нужно.
  return 0
  halt
end
wait 1
mpurge %object%
mecho Старик обрадовался при виде Вас.
wait 1
г Спасибо тебе огромное!
г Держи награду!
wait 1
mload obj 79909
дать все %actor.name%
mecho Старик улыбнулся и ушел.
wait 1
mpurge %self%
~
#79929
награда конюха~
0 j 100
~
if %object.vnum% != 79901
  msend %actor% %self.dname% это не нужно.
  return 0
  halt
end
mecho Конюх обрадовался при виде упряжи конской.
wait 1
mpurge %object%
г Ты вернул%actor.g% мою упряжь!
г Награду тебе я дам за этот поступок!
г Если ларец откроешь, забирай все, что в нем найдешь.
wait 1
mload obj 79907
mecho Конюх улыбнулся и ушел.
wait 1
mpurge %self%
~
#79930
награда амбарного~
0 j 100
~
if %object.vnum% != 79903
  msend %actor% %self.dname% это не нужно.
  return 0
  halt
end
mecho Лукьян обрадовался при виде мельницы-крупорушки ручной.
wait 1
mpurge %object%
г Я уже думал никогда не верну свою мельницу!
г Вознаграждение тебе положено!
г Если ларец откроешь, забирай все, что в нем найдешь.
wait 1
mload obj 79907
mecho Лукьян улыбнулся и ушел.
wait 1
mpurge %self%
~
#79931
награда рыбака~
0 j 100
~
if %object.vnum% != 79902
  msend %actor% %self.dname% это не нужно.
  return 0
  halt
end
mecho Рыбак обрадовался при виде сети рыболовной.
wait 1
mpurge %object%
г Спасибо тебе! Сеть ты мне вернул%actor.g%! Что бы я без нее делал!
г Вознагражу тебя тем, что у меня есть!
г Если ларец откроешь, забирай все, что в нем найдешь.
wait 1
mload obj 79907
mecho Рыбак улыбнулся и ушел.
wait 1
mpurge %self%
~
#79932
награда хлевного~
0 j 100
~
if %object.vnum% != 79904
  msend %actor% %self.dname% это не нужно.
  return 0
  halt
end
mecho Мифодий обрадовался при виде телят-жеребят-козлят.
wait 1
mpurge %object%
г Вот спасибо! Вернул%actor.g% ты мою живность!
г За такой героический поступок я тебе выдам награду!
г Если ларец откроешь, забирай все, что в нем найдешь.
wait 1
mload obj 79907
mecho Мифодий улыбнулся и ушел.
wait 1
mpurge %self%
~
#79933
Награда стрельца~
0 j 100
~
if %object.vnum% != 79900
  msend %actor% %self.dname% это не нужно.
  return 0
  halt
end
wait 1
mpurge %object%
wait 1s
if (%actor.sex% == 2)
  г Мы уж и не чаяли увидеть тебя живой.
else
  г Мы уж и не чаяли увидеть тебя живым.
end
г Ты молодец!
wait 5
г Вот! Тебе от меня награда.
wait 1
mload obj 79908
дать все %actor.name%
wait 1s
mecho Стрелец развязал мешок и достал из него все, что награбил Ховала.
mload obj 79901
mload obj 79902
mload obj 79903
mload obj 79904
wait 1
г Вот, держи! Отнеси это куда нужно.
give all .%actor.name%
mecho Стрелец улыбнулся и ушел.
mpurge %self%
~
#79934
портал~
2 e 100
~
wait 10
wecho Перед Вами открылся портал, ведущий в деревню.
wportal 79919 2
~
#79935
рендом атака оружий~
0 n 100
~
eval target %random.pc%
if (!%target%)
  halt
end
mkill %target%
~
#79936
лоад короны~
0 n 100
~
if (%world.curobjs(79906)% < 1) && (%random.100% <= 10)
  mload obj 79906
end
~
#79937
награда из ларя~
1 p 100
~
switch %random.10%
  case 1
    set itemvnum 79913
  break
  case 2
    set itemvnum 79914
  break
  case 3
    set itemvnum 79915
  break
  case 4
    set itemvnum 79916
  break
  case 5
    set itemvnum 199
    eval itemvnum %itemvnum%+%random.45%
    if (%itemvnum% == 244)
      set itemvnum 245
    end
  break
  default
    set itemvnum 79919
  break
done
if (%world.curobjs(%itemvnum%)% >= %world.maxobj(%itemvnum%)%)
  set itemvnum 79919
end
oload obj %itemvnum%
calcuid item %itemvnum% obj
eval temp %item.put(%self%)%
~
#79938
пурж удочки~
1 cfg 0
~
if (%zabros% == 5)
  osend %actor% Удочка с треском сломалась в ваших руках.
  wait 1
  opurge %self%
end
~
#79939
запуск дамаги глаз~
2 b 100
~
if !%exist.mob(79926)%
  detach 79939 %self.id%
  halt
end
exec 79952 %fireeyes.id%
~
#79940
рыбалка (заброс)~
2 cz 100
забросить~
*рыбалка (заброс) : Rooms : Command,Auto : 100 : забросить
global actor
eval zabros %zabros%+1
global zabros
wechoaround %actor% %actor.iname% прицепил%actor.g% наживку на крючок и забросил%actor.g% удочку. Остается ждать поклевки.
wsend       %actor% Вы прицепили наживку на крючок и сделали заброс, остается только дождаться момента.
attach 79942 %self.id%
if (%zabros% >= 5)
  wsend %actor% У Вас закончилась наживка, пора заканчивать рыбалку.
  wait 1s
  if (%world.curobjs(79911)% < %world.maxobj(79911)%)
    wsend %actor% Вы заметили у своих ног небольшой ключик, покрытый тиной.
    wload obj 79911
  end
end
detach 79940 %self.id%
~
#79941
рыбалка (подсечь)~
2 c 100
подсечь~
*рыбалка (подсечь) : Rooms : Command : 100 : подсечь
wait 1
detach 79954 %self.id%
detach 79942 %self.id%
wait 10
switch %random.5%
  case 1
    wechoaround %actor% %actor.iname% сделал%actor.g% попытку подсечь улов, но рыба оказалась слишком крупной, и потянула %actor.s% за собою в омут.
    wsend %actor% Ваша добыча потянула Вас в след за собой на дно морское. Смотрите, как бы Вы не стали добычей.
    wteleport %actor% 79951
  break
  case 2
    wechoaround %actor% %actor.iname% поймал%actor.g% что-то на крючок и вытащил%actor.g% на берег без особых сложностей.
    wsend %actor% Вы поймали что-то на крючок и вытащили на берег без особых сложностей.
    wload obj 79911
  break
  case 3
    wechoaround %actor% %actor.iname% подцепил%actor.g% что-то тяжелое и стал%actor.g% вытягивать на берег с сияющими глазами.
    wsend %actor% Вы подцепили что-то тяжелое и стали вытягивать на берег с сияющими глазами.
    wload mob 79929
  break
  case 4
    wechoaround %actor% %actor.iname% подцепил%actor.g% что-то тяжелое и стал%actor.g% вытягивать на берег с сияющими глазами.
    wsend %actor% Вы подцепили что-то тяжелое и стали вытягивать на берег.
    wload obj 79912
  break
  case 5
    wechoaround %actor% %actor.iname% сделал%actor.g% попытку подцепить что-то, но увы, безуспешно.
    wsend %actor% Вы сделали попытку подцепить что-то, но увы, безуспешно.
  break
done
if (%zabros% < 5)
  attach 79940 %self.id%
end
detach 79941 %self.id%
~
#79942
рыбалка (клев)~
2 bz 100
~
*рыбалка (клев) : Rooms : Random,Auto : 100
wait 1s
wecho Поплавок начал странно покачиваться...
wsend %actor% Самое время подсекать!
attach 79954 %self.id%
attach 79941 %self.id%
exec 79954 %self.id%
~
#79943
макс сияний~
1 n 100
~
if (%world.curobjs(79912)% > %world.maxobj(79912)%)
  oecho Что-то булькнуло в воду.
  wait 1
  opurge %self%
end
~
#79944
макс ключей~
1 n 100
~
if (%world.curobjs(79911)% > %world.maxobj(79911)%)
  oecho Что-то булькнуло в воду.
  wait 1
  opurge %self%
end
~
#79945
аттач рыбалки~
1 j 100
~
*аттач рыбалки : Objects : Wear : 100
wait 1
calcuid zabros 79925 room
attach 79940 %zabros.id%
detach 79945 %self.id%
~
#79946
поп получает голову~
0 j 100
~
if %object.vnum% != 79917
  msend %actor% %self.dname% это не нужно.
  return 0
  halt
end
wait 1
%purge% %object%
%echo% %self.iname% оглядел голову утопленника.
wait 1s
say Я узнаю его.
wait 1s
say Когда-то его звали Прохором.
say Он был нашим пекарем.
say А мы то думали, куда он подевался.
wait 1s
mecho Поп кликнул служек, и те втащили в церковь гроб.
mecho Поп уложил голову в гроб, и принялся читать заупокойную.
wait 2s
say Надеюсь, теперь его душа обретет покой.
wait 1s
say Спасибо Вам.
wait 3
if (%random.500% < 100)
  mload obj 79918
  дать все .%actor.name%
end
detach 79946 %self.id%
~
#79947
макс голов~
1 n 100
~
if (%world.curobjs(79917)% > %world.maxobj(79917)%)
  oecho Что-то булькнуло в воду.
  wait 1
  opurge %self%
end
~
#79948
макс свечей~
1 n 100
~
if (%world.curobjs(79918)% > %world.maxobj(79918)%)
  wait 1
  opurge %self%
end
~
#79949
лоад головы~
0 f 100
~
mload obj 79917
if ((%world.curobjs(79930)% < %world.maxobj(79930)%) && (25 >= %random.100%))
  %load% obj 79930
end
~
#79950
выплыть~
2 c 100
выплыть~
wait 1
wecho Собравшись с силами, Вы попытались выплыть на поверхность!
wait 1
wteleport %actor% 79925 horse
wait 1
wsend %actor% И Вам это удалось!
~
#79951
триг храна~
0 v 100
~
wait 2s
set target %random.pc%
if (!%target%)
  halt
end
mechoaround %target% %self.iname% сжал %actor.vname% в своих кулачищах.
msend %target% %self.iname% сжал Вас в своих кулачищах.
%target.wait(1)%
wait 1s
mechoaround %target% %target.iname% застонал%target.g% от нестерпимой боли и рухнул%target.g% на землю.
msend %target% Вы застонали от нестерпимой боли и рухнули на землю.
%target.wait(1)%
%target.position(6)%
mdamage %target% 250
wait 6s
~
#79952
выстрел глаз~
0 z 100
~
set target %random.pc%
if !%target%
  halt
end
mechoaround %target% Глаза закружились и уставились на %target.vname%!
msend %target% Огненные глаза зыркнули по сторонам и уставились на Вас.
wait 2
mecho Глаза злобно прищурились и вспыхнули огнем.
mechoaround %target% Поток огненных стрел ударил в %target.vname%!
msend %target% Вас накрыл поток огненный стрел из глаз Ховалы.
set i 0
while (%i% < 12)
  dg_cast 'огн стрел' %target%
  eval i %i%+1
done
~
#79953
Загрузка глаз и запуск дамага.~
2 z 100
~
wecho Дюжина глаз распахнулась и начала кружить над короной Ховалы.
wload mob 79927
calcuid fireeyes 79927 mob
global fireeyes
attach 79939 %self.id%
detach 79953 %self.id%
~
#79954
рыбалка (прозевали)~
2 z 100
~
*рыбалка (прозевали) : Rooms : Auto : 100
detach 79942 %self.id%
eval rnd %random.3%+1
wait %rnd%s
wsend %actor% Вы прозевали свой улов.
detach 79941 %self.id%
if (%zabros% < 5)
  attach 79940 %self.id%
end
detach 79954 %self.id%
~
#79955
Лоад стафа с мобов~
0 f 100
~
set chance 20
switch %self.vnum%
  case 79900
    set vnum 79925
  break
  case 79901
    set vnum 79928
  break
  case 79905
    set vnum 79931
  break
  case 79906
    set vnum 79926
  break
  case 79910
    set vnum 79935
  break
  case 79911
    set vnum 79934
  break
  case 79913
    set vnum 79922
  break
  case 79915
    set vnum 79929
  break
  case 79917
    set vnum 79923
  break
  case 79921
    set vnum 79921
  break
  case 79925
    set vnum 79920
    set chance 5
  break
  case 79928
    set vnum 79932
  break
done
if ((%world.curobjs(%vnum%)% < %world.maxobj(%vnum%)%) && (%chance% >= %random.100%))
  %load% obj %vnum%
end
~
#79956
Триггер молний~
1 b 5
~
wait 1
set owner %self.worn_by%
if (!%owner.name%)
  halt
end
if (((%owner.class% != 5) && (%owner.class% != 9)) || !%owner.fighting%)
  *не друж и не витязь или один из них, но не сражается
  halt
end
set wieldweapon %owner.eq(17)%
if (%wieldweapon.vnum% != 79914)
  *в прайме не белая молния
  halt
end
oechoaround %owner% &CМолнии в руках %owner.rname% ярко полыхнули, извергнув рой сполохов.&n
osend %owner% &CМолнии в Ваших руках ярко полыхнули, извергнув рой сполохов.&n
dg_cast 'облако стрел' %owner%
~
#79957
Сняли молнию~
1 l 100
~
wait 1
if (!%actor.name%)
  halt
end
dg_affect %actor% облако_стрел облако_стрел 0 0
~
#79958
Землетряс духа горы~
2 z 100
~
*Землетряс духа горы : Rooms : Auto : 100
wecho Несколько камней обрушилось с горы на Вашу голову.
foreach target %self.char%
  wdamage %target% 150
done
detach 79958 %self.id%
~
$~
