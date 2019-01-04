#27000
Выдача наград у глашатая~
0 j 100
~
wait 1
if %actor.level% > 24
if ( %object.vnum% == 27029 )
wait 1s
say Да будет с тобой милость божья, %actor.name%, благодарствую за помощь.
exec 27030 %self.id%
wait 1
mjunk all
end
if ( %object.vnum% == 27030 )
wait 1s
say Да будет с тобой милость божья, %actor.name%, благодарствую за помощь.
exec 27030 %self.id%
wait 1
mjunk all
end
halt
end
switch %object.vnum%
case 27029
wait 1s
say Хм, выходит вора кара настигла?
say Ну, ведомо тебе, за живого награда больше была бы.
say А так всего лишь 1000 кун серебром.
%send% %actor% Глашатай дал Вам связку монет.
%echoaround% %actor% Глашатай дал %actor.dname% связку монет.
%actor.gold(+1000)%
exec 27030 %self.id%
wait 1
%purge% голова
wait 1
break
case 27030
wait 1s
say Одолели-таки зверя! 
say Что же, вот и награда из воеводской казны.
%send% %actor% Глашатай дал Вам связку монет.
%echoaround% %actor% Глашатай дал %actor.dname% связку монет.
%actor.gold(+800)%
exec 27030 %self.id%
wait 1
%purge% клыки
wait 1
break
default
say Это мне зачем еще?
drop все
done
~
#27001
Тест выполнения квеста и выбор квестов.~
2 f 100
~
calcuid glashatay 27017 mob
rdelete questor %glashatay.id% 
if (%random.100% < 30)
halt
end
*тестируем квест 1 (сепка)
if !%exist.mob(27018)%
if (%random.100% < 70)
exec 27004 %self.id%
exec 27005 %glashatay.id%
end
end
*тестируем квест 2 (вепрь)
if !%exist.mob(27019)%
if (%random.100% < 60)
exec 27010 %self.id%
exec 27005 %glashatay.id%
end
end
*тестируем квест 3 (проводить дочку)
halt
if !%exist.mob(27020)%
if (%random.100% < 80)
set quest3 1
global quest3
remote quest3 %glashatay.id%
end
end
~
#27002
Забили Сепку~
0 f 100
~
%load% obj 27029
~
#27003
лоад ключа от поруба~
0 f 100
~
mload obj 27033
~
#27004
Загрузка Сепки~
2 z 100
~
wload mob 27018
calcuid target 27018 mob
switch %random.4%
case 4
wteleport %target% 33979
break
case 3
wteleport %target% 33066
break
case 2
wteleport %target% 4000
break
case 1
wteleport %target% 5012
done
~
#27005
Глашатай орет о начале квеста.~
0 z 100
~
кричать Слушайте меня, православные! Воевода града Корсунь издал указ!
wait 3
кричать Просит он о помощи воителей славных! 
wait 3
кричать Кто смел и духом крепок, да помочь готов и желает - пожаловать просим ко мне, на двор воеводский! 
кричать Там да у меня и грамотку испросите.
~
#27007
Выдача указов у глашатая~
0 d 0
согласен готов помогу желаю~
wait 1
if ( %actor.vnum% != -1 )
halt
end
if ( %actor.id% == %questor.id% )
say Тебе уже сказано было, в чем помощь потребна. Что еще нужно?!
halt
end
if %actor.level% < 12
say Рано тебе за дела богатырские браться - только голову сложишь зазря.
halt
end
if !%exist.mob(27018)%
if !%exist.mob(27019)%
set test 1
end
end
if ( %test% ==  1 )
say Нет у меня сейчас просьб к тебе, %actor.name%!
halt
end
eval arg %speech.cdr%
if !%arg%
if %exist.mob(27018)%
say Сбежал от суда воеводского душегуб-убивец.
set quest 1
end
wait 2
if %exist.mob(27019)%
say В лесах окрестных завелся зверь страшный.
set quest 1
end
wait 2
if %quest3% == 1
say Велеслава - дочь воеводы нашего к родичу своему, славному боярину Воебору собралась.
say Провожатый потребен ей - дорога до Чернигова неблизкая...
set quest 1
end
wait 1
if ( %quest% == 1 )
say Так скажи - с чем помочь желаешь?
end
halt
end
if %arg.contains(душегуб)%
if %actor.haveobj(27028)%
say Указ тебе уже был даден - чего еще надобно?!
halt
end
set setquest 1
set questor %actor%
global questor
mload obj 27028
give указ %actor.name%
end
if %arg.contains(звер)%
if %actor.haveobj(27031)%
say Указ тебе уже был даден - чего еще надобно?!
halt
end
set setquest 1
mload obj 27031
give указ %actor.name%
set questor %actor%
global questor
end
if %arg.contains(доч)%
if %quest3% == 1
wait 1
set setquest 1
emot оглядел Вас с головы до пят
say Ну гляди - коли оплошаешь - головы тебе не снести!
emot что-то шепнул пробегавшему мимо отроку и тот мигом умчался в дом.
mecho Прошло немного времени и на пороге воеводского дома появилась молодая девушка в дорожном платье.
mload mob 27020
wait 2
mforce questmob2703 follow %actor.name%
set quest3 0
global quest3
set questor %actor%
global questor
halt
end
end
if %setquest% == 1
say Что же, вот тебе указ, собственноручно воеводой подписанный!
say Сказано в нем все честь по чести.
end
~
#27008
Проверка квеста вепря~
2 z 100
~
if !%exist.mob(27019)%
set comlete 1
else
set complete 0
end
global complete
detach 27008 %self.id%
~
#27009
Вепрь убит~
0 f 100
~
%load% obj 27030
~
#27010
Загрузка вепря~
2 z 100
~
wload mob 27019
calcuid target 27019 mob
switch %random.3%
case 3
wteleport %target% 11443
break
case 2
wteleport %target% 4543
break
case 1
wteleport %target% 38017
done
~
#27011
даем ингры ворожее~
0 j 100
~
wait 1
If (%object.vnum%==721)
 If (%object.val1%>5)
   Say Отличный минерал!
   If  !(%self.haveobj(60064)%)
      Mload obj 60064
   Else 
      Say Не... минерал у меня уже есть. Второй не нужна пока.
   End
 Else
   Say Не... такой минерал слишком  мал для заклятия.
 end 
End  
If (%object.vnum%==705)
 If (%object.val1%>5)
   Say Отличные сочные ягоды !
   If  !(%self.haveobj(60061)%)
      Mload obj 60061
   Else 
      Say Не... ягода у меня уже есть. Вторая не нужна пока.
   End
 Else
   Say Не... такая ягода не достаточно сочная для заклятия.
 end 
End
If (%object.vnum%==722)
 If (%object.val1%>5)
   Say Замечательный метал! В самый раз для заклинания!
   If  !(%self.haveobj(60065)%)
      Mload obj 60061
   Else 
      Say У меня уже есть метал! Еще один пока не нужен!
   End
 Else
   Say Нет! Этот метал недостаточно прочен! Такой не подойдет.
 end 
End
If (%object.vnum%==700)
 If (%object.val1%>5)
   Say Уу-у! Замечательные грибы!
   If  !(%self.haveobj(60060)%)
      Mload obj 60060
   Else 
      Say У меня уже есть гриб! Мне второй не нужен!
   End
 Else
   Say Не-е-ет! Этот грибок маленький и червивый. Такой не годиться!
 end 
End    
mpurge %object%
if (%self.haveobj(60060)% && %self.haveobj(60061)%)
  say Отлично! Сейчас я принесу жертву и сотворю заклятье!
  say С его помощью я перенесу Вас в Киев
  mecho Ворожея что-то пошептала над ингредиентами и поднесла их к идолу.
  брос все
  mteleport all 49934
end
if (%self.haveobj(60064)% && %self.haveobj(60060)%)
  say Отлично! Сейчас я принесу жертву и сотворю заклятье!
  say С его помощью я перенесу Вас в Галич
  mecho Ворожея что-то пошептала над ингредиентами и поднесла их к идолу.
  брос все
  mteleport all 34405
end   
if (%self.haveobj(60065)% && %self.haveobj(60060)%)
  say Отлично! Сейчас я принесу жертву и сотворю заклятье!
  say С его помощью я перенесу Вас в Переяславль
  mecho Ворожея что-то пошептала над ингредиентами и поднесла их к идолу.
  брос все
  mteleport all 25005
end
~
#27012
приветствие ворожеи~
0 r 100
~
wait 1
msend %actor% Ворожея сказала тебе:
msend %actor% - Да защитит тебя Белобог от всякого зла, %actor.name%!
msend %actor% - Вижу что не просто так ты сюда заш%actor.y%! Могу тебе помочь!
msend %actor% - Коли ты дашь мне немного кун для жертвы Яриле
msend %actor% - Я помогу тебе мигом добраться до нужного русского города.
~
#27013
дали деньги ворожее~
0 m 1
~
 if (%amount% < 200)
say За такую лепту сам%actor.g% Ярило разгневай. А я не рискну!
halt
end
wait 1
msend %actor% - Ворожея сказала тебе:
msend %actor% - Коли в Киев хочешь - принеси мне ягодки и грибочки.
msend %actor% - Если добудешь камушек и грибы то, смогу отправить тебя в Галич.
msend %actor% - А захочешь в Переяславль попасть - дай мне металл и грибы.
~
#27014
Лоад квест 3 (доставка письма в Чернигов)~
2 z 100
~
wload mob 68022
calcuid mercht 68022 mob
wteleport %mercht% 68078
~
#27015
агр на глашатая~
0 l 100
~
if (%random.100% < 40 )
halt
end
wait 1
if ( %random.100% < 10 )
крича Стража!!!!
end
if ( %actor.vnum% != -1 )
eval target %actor.leader%
if %target%
if %target.rentable%
mecho Набежавшие стражники схватили %target.vname!
mteleport %target% 27071
end
end
else
if %actor.rentable%
mecho Набежавшие стражники схватили %actor.vname%!
mteleport %actor% 27071
eval buffer %actor.loadroom(27071)%
end
end
eval gopa %actor.group%
foreach char %gopa%
if %char.rentable%
mecho Набежавшие стражники схватили %char.vname%!
mteleport %char% 27071
eval buffer %char.loadroom(27071)%
end
done
~
#27016
кто-то вылез из темницы~
0 r 100
~
if ( %direction% == down )
wait 15s
mload obj 27033
закр дв вниз
запер дверь вниз
wait 1
mjunk all
end
~
#27017
автоделет дочки при потере следования~
0 ab 100
~
set char %self.leader%
if !%char%
mecho Девушка грустно вздохнула и пошла по своим делам.
wait 1
%purge% %self%
end
~
#27018
при загрузке дочки~
0 n 100
~
set cmpquest 0
global cmpquest
~
#27019
триг на попрошайке~
0 q 51
~
if %actor.id% == %agressor.id%
halt
end
wait 1
follow .%actor.name%
хих
set victim %actor%
global victim
~
#27020
попрошайка базарит~
0 b 8
*~
switch %random.15%
case 1
say Дай денюжку, ну дай денюжку!
вопрос %victim.name%
break
case 2
облиз %victim.name%
лизн %victim.name%
break
case 3
say Подайте люди доообрыя, сами мы не местныя... ходим вот, никто ничего не даст...
плак
упрек %victim.name%
break
case 4
emot начал шумно и со вкусом чесаться
break
case 5
рыг
г Падайте люди...  пахмельнуться нечем!
break
case 6
tell %victim.name% Дай миллион, ну дай миллион!
break
case 7
if %victim.sex% == 2
halt
end
tell %victim.name% Куды девал%victim.g% сокровища убиенной тобой тещи?!
break
case 8
tell %victim.name% Падаааааааайте на пропитааааание!!!!!
break
case 9
просить
break
case 10
say Ну хоть хлебушка дайте!
облиз
тоск
break
case 11
фиг
break
case 12
tell %victim.name% Ну дай денюжку, я ж тебя знаю - ты ж на второй платиновый доспех копишь!
break
case 13
tell %victim.name% Ну зачем тебе столько денег - придет душегубец да отнимет... а я ими распоряжусь по-божески!
break
case 14
фиг %victim.name%
break
case 15
tell %victim.name% Что тебе воевода наш сдался? Мне лучше деньги давай, у меня - аки у Христа за пазухой!
break
done
~
#27021
попрошайке дали денег~
0 m 1
~
switch %random.3%
case 3
рад
восторг
break
case 2
поклон %actor.name%
благ %actor.name%
break
case 1
удив %actor.name%
follow %actor.name%
set victim %actor%
global victim
break
done
~
#27022
попрошайка фликает~
0 k 90
~
if %actor.vnum% != -1
set agressor %actor.leader%
global agressor
else 
set agressor %actor%
global agressor
end
follow я
wait 4
flee
flee
if %random.100% > 15
halt
end
if %actor.vnum% != -1
set victim %actor.leader%
крича Спасите православные, убивають! Душегубец %victim.name% меня живота решить хочет!
halt
end
крича Спасите православные, убивають! Душегубец %actor.name% меня живота решить хочет!
~
#27023
Агро на стражей~
0 k 30
~
wait 1
if %actor.vnum% != -1
eval target %actor.leader%
if %target%
if %target.rentable%
mechoaround %target% Вдруг сбежалась целая толпа стражников и схватила %target.vname%!
msend %target%  Вдруг набежавшие стражники схватили вас и утащили в поруб.
mteleport %target% 27071
eval buffer %target.loadroom(27071)%
end
end
else
if %actor.rentable%
mechoaround %actor% Вдруг сбежалась целая толпа стражников и схватила %actor.vname%!
msend %actor%  Вдруг набежавшие стражники схватили вас и утащили в поруб.
mteleport %actor% 27071
eval buffer %actor.loadroom(27071)%
end
end
calcuid turm 27023 mob
exec 27035 %turm.id%
~
#27024
Триг на тюремщике~
0 z 100
~
wait 1s
say По приказу воеводскому, кто меру свою наказания отбыл может волен быть!
mload obj 27033
отпере дверь
отк дверь
wait 300s
закр дверь
запер дверь
mjunk all
~
#27025
репоп на остроге~
2 f 100
~
if %random.500% != 323
halt
end
calcuid turm 27023 mob
wforce глашатай.корсунь орать Воевода града Корсуни явил милость! 
wforce глашатай.корсунь орать Негодяи да душегубы, кои меру свою наказания отбыли, могут вольны быть, да впредь пущай не попадаются!
wait 140s
exec 27024 %turm.id%
~
#27026
Нет названного игрока в темнице~
0 z 100
~
wait 1s
say Хм, да нет у нас в порубе таких!
say Может тебе другого кого надо? 
~
#27027
выпускаем заключенных из поруба~
2 z 100
~
foreach char %self.pc%
if %char.name% == %target.name%
wecho Тюремщик мрачно вздохнул.
wait 1
wecho Тюремщик отпер дверь.
wecho Тюремщик открыл дверь.
wsend %char% Тюремщик вывел вас наружу.
wteleport %char% 27072
eval buffer %char.loadroom(27018)%
wechoaround %char% Старый волхв кивнул, и что-то крикнул в подпол.
wechoaround %char% Мрачный бородатый тюремщик вывел %char.vname% наверх.
wecho Тюремщик вывел %char.vname% наверх.
wecho Тюремщик закрыл дверь.
wecho Тюремщик запер дверь.
calcuid desat 27021 mob
detach 27028 %desat.id%
detach 27029 %desat.id%
wait 1s
attach 27028 %desat.id%
halt
end
done
calcuid desat 27021 mob
exec 27026 %desat.id%
~
#27028
десятнику дали указ~
0 j 100
~
wait 1
if %object.vnum% != 27035
вопрос %actor.name%
mjunk all
halt
end
wait 1
mjunk all
wait 1s
emot внимательнейшим образом осмотрел грамоту
say Все верно. Что же - назови, кого желаешь из поруба вызволить?
attach 27029 %self.id%
wait 120s
say Что же - видать нет у нас тех, кто тебе нужен.
say Ступай в другом месте поищи.
detach 27029 %self.id%
~
#27029
десятнику назвали имя~
0 d 1
*~
set target %speech%
calcuid ostrog 27071 room
remote target %ostrog.id%
wait 1
exec 27027 %ostrog.id%
~
#27030
Глашатай выдает грамоты~
0 z 100
~
wait 2s
if %random.10% < 5
say Вот и еще одна награда от воеводы для тебя...
mload obj 27035
emot протянул вам вольную грамоту, но та вдруг выскользнула у него из руки и упала на землю.
брос грамота
end
~
#27031
распродажа~
0 m 100
~
wait 1
if %amount% == 100
if %world.curobjs(33901)% < 500
mload obj 33901
give яйцо %actor.name%
end
end
~
#27032
Стражник заходит в комнату к игрокам~
0 t 100
~
wait 1
if %actor.clan% != null
halt
end
foreach char %self.pc%
if %char.agressor% > 27000
if %char.agressor% < 27099
set target %char%
break
end
end
done
if !%target%
halt
end
появ
mforce %target.name% просн
mforce %target.name% встать
say %target.name%, за пролитие крови на улицах града Корсуни, ты будешь брошен%target.g% в острог!
mforce %target.name% ужас korsguard
mforce %target.name% обморок
mkill %target%
if %target.sex% == 1
крича %target.name%, мерзавец, хватай его! Вяжи его!
else
крича %target.name%, мерзавка, хватай ее! Вяжи ее!
end
eval rnd (%random.100%+%random.100%+%random.100%)/3
if %rnd% < 11
mechoaround %target% Вдруг сбежалась целая толпа стражников и схватила %target.vname%!
msend %target%  Вдруг набежавшие стражники схватили вас и утащили в поруб.
mteleport %target% 27071
eval buffer %target.loadroom(27071)%
end
wait 1
foreach char %self.pc%
if %char.agressor% > 27000
if %char.agressor% < 27099
set target %char%
break
end
end
done
if !%target%
halt
end
появ
mforce %target.name% просн
mforce %target.name% встать
say %target.name%, за пролитие крови на улицах града Корсуни, ты будешь брошен%target.g% в острог!
mforce %target.name% ужас korsguard
mforce %target.name% обморок
mkill %target%
if %target.sex% == 1
крича %target.name%, мерзавец, хватай его! Вяжи его!
else
крича %target.name%, мерзавка, хватай ее! Вяжи ее!
end
~
#27033
входят к городским стражам~
0 q 75
~
wait 1
if %actor.clan% != null
halt
end
if !%actor.agressor%
halt
end
if %actor.agressor% > 27000
if %actor.agressor% < 27099
say %actor.name%, за пролитие крови на улицах града Корсуни, ты будешь брошен%target.g% в острог!
Крича %actor.name% - вот он%actor.g% где, держи-хватай, ребяты!
mkill %actor.name% 
if %actor.sex% == 1
крича %actor.name%, мерзавец, хватай его! Вяжи его!
else
крича %actor.name%, мерзавка, хватай ее! Вяжи ее!
end
end
end
~
#27034
Приветствие у скорняка~
0 q 66
~
wait 1s
emot поднял на вас взгляд
say Зря приш%actor.y% - товара нет пока на продажу, и учеников сейчас в обучение не беру.
emot вновь склонился над своей работой
~
#27035
Тюремщик объясняет рапорядок )~
0 z 100
~
wait 1
say Ну вот, самое тут тебе место!
say Татям, да душегубам - в остроге сидеть положено, а не по улицам шастать, народ честной стужить.
say Коли есть, кому за тебя слово замолвить - пусть указ глядит на дворе воеводском.
say Да гляди - коли выпустят, да вдругорядь вздумаешь ты жителей наших забижать - острогом не отделаешься!
~
#27036
Приветствие травницы.~
0 q 60
~
wait 1
улы .%actor.name%
say Здраве буде!
say Извини, %actor.name%, мастер сегодня занят, приходи в другой раз.
say Впрочем, можешь посмотреть зелья на продажу.
~
$~
