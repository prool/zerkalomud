#80800
засада 1~
2 e 80
~
%actor.wait(1s)%
wait 1
wload mob 80803
wload mob 80802
wload mob 80802
wecho Резкий переливчатый свист раздался!
wecho Словно из-под земли выросли на дороге всадники на низкорослых мохноногих лошаденках.
wecho __ЗАСАДА!!!
detach 80800 %self.id%
~
#80801
репоп южного шляха ~
2 f 100
~
*устраиваем засаду на дороге вероятность 1/2
if %zasada1%
detach 80800 %zasada1.id%
rdelete zasada1 %self.id%
end
if %random.2% == 1
eval room1 %random.21%+7
eval snip1 80800+%room1%
calcuid zasada1 %snip1% room
global zasada1
detach 80800 %zasada1.id%
attach 80800 %zasada1.id%
end
if %zasada2%
detach 80800 %zasada2.id%
rdelete zasada2 %self.id%
end
if %random.2% == 1
eval room2 %random.24%
eval snip2 80900+%room2%
calcuid zasada2 %snip2% room
global zasada2
detach 80800 %zasada2.id%
attach 80800 %zasada2.id%
end
calcuid kipchak 80808 mob
*грузим раненого воина в случайную комнату если квест был взят и выполнен
*если квест не выполнен - раненый не появится, пока не убьют кипчака 80808
*телепортирование кипчака в зону производится только если он в виртуалке
if  !%exist.mob(80807)% && (%kipchak.realroom% == 80886)
eval num %random.70%+15
eval room3 80800+%num%
calcuid trgroom %room3% room
attach 80814 %trgroom.id%
exec 80814 %trgroom.id%
end
~
#80802
лучники следуют за мечником~
0 n 100
~
wait 1
follow мечник
mforce мечник group all
~
#80803
воет ветер в степи~
0 b 20
~
if %random.2% ==1
masound _Ветер свистит и воет над степью.
else
masound _Резкий порыв ветра наожиданно хлестнул вас по лицу.
end
~
#80804
убегаем если хп меньше одной пятой~
0 l 20
~
flee
flee
if %random.5% == 3
detach 80804 %self.id%
end
~
#80805
мечник атакует~
0 n 100
~
wait 2
mecho _Ближайший всадник дико заулюлюкал и бросился на Вас, занося меч!
set victim %random.pc%
kill %victim.name%
~
#80806
вошли к раненому воину~
2 e 100
~
if !(%actor.vnum% == -1)
halt
end
wait 1
wecho При виде Вас раненый воин сделал попытку приподняться, но тут же снова упал на землю.
wecho Кровь хлынула у него из ран.
wait 3s
wecho Раненый воин прохрипел:
wecho   - Друг...
wecho   - Степняки...  ...в набег...
wecho   - Грамота...  ... .аву в оc....г....
wecho Раненый воин потянулся к вспоротой дорожной сумке на бедре.
wait 1
wecho Воин застонал и вскрикнул:
wecho   - Степняки!...
wecho Раненый воин уткнулся лицом в землю, содрогнулся и затих.
calcuid warrior 80807 mob
wpurge %warrior%
wload obj 80802
calcuid kipchak 80808 mob
if %kipchak% && (%kipchak.realroom% == 80886)
switch %random.3%
case 3
wteleport %kipchak% 80810
break
case 2
wteleport %kipchak% 80871
break
default
wteleport %kipchak% 80967
done
wechoaround %kipchak% _Кипчак-наворопник пришел с севера.
end
detach 80806 %self.id%
~
#80807
зарезали кипчака ╧2~
0 f 100
~
mload obj 80803
~
#80808
убили буранчик или суховея~
0 f 100
~
return 0
mecho _Ветер утих...
mteleport %self% 80899
~
#80809
Дали грамоту воеводе Всеславу~
0 j 100
~
wait 1
if !(%object.vnum% == 80803) || !(%actor.vnum% == -1)
удивл
say Ступай-ка отсюда, занят я.
drop %object.name% 
halt
end
emot быстро прочел грамоту и взглянул на Вас
say Так это ты - Радив?
wait 1
say  Нет, что это я... это не можешь быть ты...
wait 2s
say  Вот значит оно что...
emot печально посмотрел на покрытую кровью грамоту
say  Пусть земля будет ему пухом.
wait 1s
say Недобрые же вести привез%actor.q% ты мне...
say Впрочем, твоей вины тут нет. Но и ты ведь мог%actor.q% степнякам треклятым попасться?
say Надо бы вознаградить тебя за службу.
mecho _Воевода покопался в поставце и что-то достал оттуда.
if (%world.curobjs(80804)% < 10)
mload obj 80804 
give подсайдаш %actor.name%
say Вот... он верой и правдой служил мне десять лет. Теперь пускай тебе послужит.
else 
say Оружие нам сейчас самим понадобится...  Возьми вот кун немного.
msend %actor% _Воевода дал Вам кожаный кошель с монетами.
mechoaround %actor%  _Воевода дал %actor.name% небольшой кошель с монетами.
%actor.gold(+600)%
end 
emot достал кусок бересты, чернильницу и стило и принялся что-то быстро писать
mpurge %object%
~
#80810
Татарин заходит в комнату к погорельцу.~
0 h 100
~
if (%actor.vnum% == 80811) || (%actor.vnum% == 80814)
wait 1s
mecho _Беженец упал на землю и завопил от ужаса.
mecho _%actor.name% презрительно сплюнул.
mecho _%actor.name% БОЛЬНО хлестнул беженца и поехал своей дорогой.
wait 1s
рыда
end
~
#80811
убили беженца~
0 f 100
~
return 0
if !(%actor.class% == 8)
msend %actor% _За это черное дело Белобог лишил Вас 20000 очков опыта.
%actor.exp(-20000)%
else
if %actor.level% < 18
halt
end
msend %actor% _За это черное дело Чернобог дал Вам 5000 очков опыта.
%actor.exp(+5000)%
if %world.curobjs(80807)% > 25
halt
end
mload obj 80807
msend %actor% _Вы удовлетворенно посмотрели на труп.
mechoaround %actor% _%actor.name% удовлетворенно взглянул%actor.g% на труп.
end
~
#80812
вошли к караульному-русичу~
0 q 100
~
if %self.position% == 7
halt
end
wait 2s
улы
say Гой еси, %actor.name%, куда путь держишь?
~
#80813
напали на караульного-русича~
0 l 100
~
wait 1s
if %self.affect(молчание)%
halt
end
руг
кри _Тревога!!! Тревога!!  %actor.name% предал%actor.g% святую Русь!!! 
кри _На помощь,  други!!!!
wait 1s
mecho _Несколько воинов-русичей прибыло на зов.
mload mob 80818
mload mob 80818
detach 80812 %self.id%
detach 80813 %self.id%
~
#80814
загрузка раненого воина и трупаков~
0 z 0
~
wload mob 80807
attach 80806 %self.id%
wload obj 80805
wload obj 80805
wload obj 80805
detach 80814 %self.id%
~
#80815
напали на караульного-татарина~
0 l 99
~
wait 1s
if %self.affect(молчание)%
halt
end
кри  _Айиии! Урус, урус яман!!!! Айиии!!
кри  _Ипташ, айии! Ипташ!!!
*что-то типа "плохо - русские тут, друзья на помощь"
* "ипташ" - кипчакский яз. - приятель, друг
wait 1s
mecho _Несколько татарских воинов прибыло на зов караульного.
mload mob 80820
mload mob 80820
detach 80815 %self.id%
~
#80816
караульные нашли нападавшего~
0 o 100
~
switch %random.3%
case 3
say %actor.name%, предатель!!!
break
case 2
say %actor.name% !
Попался, презренный вор!!!
break
default
say %actor.name%!
say Умри, мерзавец!
done
mkill %actor%
~
#80817
запоминаем нападавщего~
0 n 100
~
*хотелось добавить немного ролеплея
*для этого написал эти два триггера
mkill %random.pc%
wait 1
if %self.position% == 7
eval enemy %self.fighting%
mremember %enemy%
end
detach 80817 %self.id%
~
#80818
Оглядеться на башне~
2 c 100
огляд~
return 0
if !(%cmd.mudcommand% == оглядеться)
halt
end
wsend %actor% _Коль на сервер взглянешь -
wsend %actor% _там лес густой, для русича -
wsend %actor% _дом и прибежище.
wsend %actor% _
wsend %actor% _Коль на юг - там острог стоит
wsend %actor% _от степняков поганых защита.
wsend %actor% _
wsend %actor% _На востоке же со закатом
wsend %actor% _все степь да степь без конца и краю...
~
#80819
убили караульного-русича~
0 f 100
~
if (%random.3% == 2) && (%world.curobjs(80809) < 15)
mload obj 80809
end
~
#80820
убили караульного-татарина~
0 f 100
~
if (%random.3% == 2) && (%world.curobjs(80808) < 15)
mload obj 80808
end
~
#80821
этот тригер свободный~
0 f 100
~

~
#80822
свободный триг~
2 z 100
~

~
$~
