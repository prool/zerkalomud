#1000
ладон сдулся~
1 c 4
проткнуть~
wait 1
%echo% С громким звуком ПУФФФФ Ладон сдулся и превратился в маленький кусочек резины.
%purge% %self%
~
#1001
Милич~
1 j 100
~
wait 1
* oechoarround %actor.name% начал тереть свой амулет.
* osend %actor% Вы начали тереть свой амулет.
oecho Вокруг вспыхнула яркая радуга.
~
#1002
тестовый триг~
2 g 100
~

~
#1003
new trigger~
2 d 100
мудак~
%actor.remort(10)%
wecho СОСАТЬ!!!!
~
#1004
Триггер хрустального доспеха (1092) - Прокиус~
1 j 100
~
if ( %actor.level% > 30 )
return 1
halt
end
if ( %actor.name% == Прокиус )
return 1
wait 1
%echoaround% %actor% Лучи света весело засверкали на гранях доспеха, и вы почувствовали как этот свет ободряет и придает сил.
%send% %actor% Лучи света весело и ярко заиграли на бесчисленных гранях доспеха.
else
return 0
%echoaround% %actor% %actor.name% попытал%actor.u% напялить доспех, но лишь ободрал%actor.u% об острые грани.
%send% %actor% Вы попытались напялить доспех, но лишь оцарапались об острые грани хрусталя.
eval dmg %actor.hitp%/10
odamage %actor% %dmg%
end
~
#1005
Птичка....~
0 b 10
~
switch %random.21%
case 1
петь
break
case 2
каш
тоск
break
case 3
говор Ну выпустите меня отсюда - сколько можно!
говор Я тут голос потеряю, или ваще от пневмонии загнусь!!!
break
case 4
emot немузыкально заорала : 'И не дают мне больше интересных книжек, и ма-ая гита-а-ррра бееееез струны...'
break
case 5
say И ваще - ну что за место для пения? Акустики никакой... Влажность..
морщ
break
case 6
say А мож скинемся, на лапу сунем - выпустят?
вопрос
break
case 7
say Эй, не запирайте, люди!!! Плачут дома детки!
break
case 8
say Ну господи, господи - куда я попала? 
say Никакого разнообразия - Зоман-Авис-Зоман-Авис..
say Хоть бы Мурата для компании!
break
case 9
say Ну что за публика - ни почтения к артисту, ни уважения...
say То ли дело - Такурусаву...
мечта
break
case 10
say Тувинское горловое пение!
emot : ЫЫЫЫЫЫЫЫЫЫЭЭЭЭЭЭЭЭУУЭЭЭЭЭЭЭЫЫЫЫЫЫЫЫЫЫЫ!!!!!!!!!!!!!!!!!
break
case 11
say Сколько я зарезал, сколько перерезал. сколько душ невинных загубил...
wait 1
say Ой, о чем это я, меньше надо телевизер смотреть.
break
case 12
say Крылья-ноги, крылья-ноги, а самое главное х... э... хмм..
красн
break
case 13
лаг
вздох
break
case 14
%force% заплечных брысь птичка
break
case 15
say Ох, судьбинушка моя тяжкая...
emot : "Сижу за решеткой в темнице сырой, вскормленный неволей синиц молодой..."
wait 2
say Да еще Некрас вечно на мне точку качает... А я птичка! Редкая! 
break
case 16
emot : 'Солнцеее всооодит и захоодит, а в тюрьмее маааей темноооо... Днеем и ночью злыые Иммы стеерееегут маааае окноо...'
рыда
break
case 17
eval target %random.pc%
mforce заплечных вмаз %target.name%
break
case 18
say Ну и вкусы у здешней публики! Подавай всем "мурку"! А я кошек ТЕРПЕТЬ НЕНАВИЖУ!!!
done
break
case 19
eval target %random.pc%
плюн %target.name%
break
case 20
say Эй, вы там, наверху! У нас тут перенаселение! Давайте вводите высшую меру! А то все ложут и ложут!!!
break
case 21
say Тут недавно Шателье был... Во матерщинник-то! Как загнул, как загнул... Мну релоадить пришлось :-(
судь
dreak
done
~
#1006
Триггер на жезле правосудия.~
1 c 1
взмахнуть~
if %arg.contains(удалить)%
calcuid victim 193 mob
%echoaround% %victim% Раздался громовой удар и княжеский палач исчез в клубах дыма!
wait 1
opurge княжеский.палач
halt
end
if %arg.contains(создать)%
if %world.curmobs(193)% > 9
%send% %actor% Ничего не произошло!
halt
end
%echo%  Раздался громовой удар и княжеский палач возник здесь в клубах дыма!
oload mob 193
halt
end
if %arg.contains(приказать)%
set cmmd %arg.cdr%
oforce княжеский.палач %cmmd%
halt
end
~
#1007
zone reset~
2 c 0
zreset~
%world.zreset(%arg%)%
~
#1008
Горыныч~
0 i 100
~
wait 1s
eval target %self.people%
if %target% == %self%
eval target2 %target.next_in_room%
if %target2%
mkill %target2%
end
end
~
#1009
sword~
1 c 1
возвестить~
eval spch %arg.car%
eval string %arg.cdr%
if ( %spch% == глас )
oforce глашатай.корсунь tell %string%
halt
end
if ( %spch% == весть )
oforce глашатай.корсунь болтать %string%
end
~
#1010
flash~
1 c 1
молния~
eval victim %arg.car%
eval value %arg.cdr%
foreach target %self.all%
eval string %target.iname%
set targetname %string.car%
if ( %targetname% == %victim% )
log  &B%actor.name% шарахнул молнией на %value% хитов по %victim% !!!&g
%echoaround% %target% ~~%actor.name% грозно воздел десницу и слепящая молния ударила из грозового облака в %target.vname%!
%send% %target% ~~%actor.name% грозно воздел десницу и слепящая молния ударила прямо в Вас!
eval buffer %target.hitp(-%value%)%
odamage %target% %value%
halt
end
done
~
#1011
Rafail's wings~
1 c 1
взмахнуть~
wait 1
%echo% Шестикрылый Рафаил взмахнул крыльями и по комнате пронесся порыв холодного ветра.
~
#1012
наградной триг~
0 f 100
~
*лекарь
if (%actor.class% == 0)
mspellturn %actor.name% исцеление set
*боевой маг
elseif (%actor.class% == 1)
mspellturn %actor.name% огненный.шар set
*вор
elseif (%actor.class% == 2)
mskilladd %actor.name% заколоть 10
*богатырь
elseif (%actor.class% == 3)
mskilladd %actor.name% богатырский.молот 20
*наемник
elseif (%actor.class% == 4)
mskillturn %actor.name% осторожный.стиль set
*дружинник
elseif (%actor.class% == 5)
mskillturn %actor.name% веерная.защита set
*маг-кудесник
elseif (%actor.class% == 6)
mspellturn %actor.name% групповая.сила set
*маг-волшебник
elseif (%actor.class% == 7)
mspellturn %actor.name% длительное.оцепенение set
*маг-некромант
elseif (%actor.class% == 8)
mspellturn %actor.name% оживить.труп set
*витязь
elseif (%actor.class% == 9)
mskilladd %actor.name% точный.стиль 10
*охотник
elseif (%actor.class% == 10)
mskilladd %actor.name% дополнительный.выстрел 25
*кузнец
elseif (%actor.class% == 11)
mskilladd %actor.name% оглушить 20
*купец
elseif (%actor.class% == 12)
mskillturn %actor.name% осторожный.стиль set
*волхв
elseif (%actor.class% == 13)
mload obj 215
mload obj 209
mload obj 243
end
~
#1013
skull~
1 c 1
гчереп~
eval string1 %arg.car%
if %string1% == load
if %world.curobjs(1049)% < 30
oload obj 1049
halt
end
end
if !%actor.name%
oecho Череп в руке кого-то шевельнулся и прошамкал : '%arg%'
halt
else
oecho Череп в руке %actor.rname% шевельнулся и прошамкал : '%arg%'
end
~
#1014
морока с балахоном )~
1 c 1
лаг~
eval victim %arg.car%
eval value %arg.cdr%
foreach target %self.all%
eval string %target.iname%
set targetname %string.car%
if ( %targetname% == %victim% )
%echoaround% %target%  %actor.name% разгневанно взглянул на %target.vname% - и зеленое пламя вспыхнуло вокруг!
%echoaround% %target%  %target.name% исчез%actor.q% в глыбе зеленого льда.
%send% %target%  %actor.name% разгневанно взглянул на Вас и страшный холод сковал ваше тело!
eval buffer %target.wait(%value%)%
halt
end
done
~
#1015
губозакатывалка~
1 c 1
закатать~
wait 1
%send% %actor% вы закатали губы всем присутствующим.
%echoaround% %actor% %actor.name% закатал%actor.g% губы всем присутствующим (не исключая и себя).
%echo% Хорошо молчим!
~
#1016
rafail wings2~
1 c 1
loa~
oload %arg%
osend %actor% &R loa %arg% - &Cготово&n
~
$~
