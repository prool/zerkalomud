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
крылья~
1 gj 100
~
if (%actor.name% != Велунд)
  return 0
  halt
end
~
#1003
new trigger~
2 d 100
мудак~
wecho Пошел на!
log &R%actor.name% - ЧИТЕРИТ!&n
~
#1004
Триггер хрустального доспеха (1092) - Прокиус~
1 j 100
~
if (( %actor.level% > 30 ) && (%actor.vnum% == -1))
  return 1
  halt
end
if ( %actor.name% == Жупел )
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
0 b 18
~
switch %random.22%
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
    emot : 'Солнцеее всхоодит и захоодит, а в тюрьмее мааей темнооо... Днеем и ночью злыые Иммы стереегуут маааае окноо...'
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
break
case 22
  г скоро БЗ Консерватории выступать буду. Уже полные залы собираю.
  г На днях вот пела ребятам из НД и ХРБ. Такие все важные, вещи всё перекладывали, и меня хвалили.
  Вещи всё сверкающие, красивые.. настоящие интелл теллин генты в общем чик чирик.
break
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
  opurge %victim%
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
if %actor.name% == рафаил || %actor.name% == переплут
  %world.zreset(%arg%)%
  log &c Рафаил резетил зону  %arg%.
end
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
log %actor.name% - ЧИТЕРИТ!
msend %actor% И НИ-ФИ-ГА...
~
#1013
skull~
1 c 1
гчереп~
wait 1
if !%actor.name%
  oecho &WЧереп&n в руке кого-то шевельнулся и зловеще проскрипел : '&R%arg%&n'
  halt
else
  oecho &WЧереп&n в руке %actor.rname% шевельнулся и зловеще проскрипел : '&R%arg%&n'
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
log &R%actor.name% использовал чит-триг крыльев Рафаила!&n
~
#1080
Пришла СМС-ка~
1 h 100
~
wait 1
foreach victim %self.pc%
  set dmg %victim.hitp%
  eval dmg1 %dmg%*2/3
  osend %victim% &GВам пришла СМС-ка!!!&n
  osend %victim% &GИ прям на ногу!!!&n
  odamage %victim% %dmg1%
done
~
#1081
крылышки~
1 gj 100
~
if %actor.name% != велунд
  return 0
  halt
end
~
#1087
Вампирская накидка сосет с причмоком~
1 bg 100
~
wait 1
set target %self.worn_by%
if !%target%
  set target %self.carried_by%
  if %target%
    if %target.vnum% != -1
      oecho Накидка презрительно сплюнула и вырвалась из рук %target.rname%.
      oforce %target% drop вампир.накид
      halt
    end
    osend %target% Накидка вдруг завозилась и попыталась взобраться к Вам на плечи.
    set trash %target.eq(12)%
    if %trash%
      set trashname %trash.name%
      oforce %target% снять %trashname.car%.%trashname.cdr%
    end
    oforce %target% одеть вамп.накид
  end
  halt
end
eval dmg %target.maxhitp%/10
if ((%target.hitp% < %dmg%) && (%target.vnum% == -1))
  osend %target%  Накидка в последний раз с гнусным причмокиванием присосалась к Вашей шее.
  eval dmg %target.hitp%+2
  set empty 1
end
osend %target% Вы чувствуете страшный упадок сил!
eval erg %target.move%-15
if %erg% > 0
  eval buf %target.move(-%erg%)%
end
if ((%target.maxhitp% < 100) || (%target.vnum% != -1) || (%empty% == 1))
  osend %target% Вампирская накидка недовольно поморщилась и сползла с Ваших плеч.
  osend %target% Последние капли крови вытекают из ужасных ран.
  oechoaround %target% Вампирская накидка недовольно поморщилась и сползла с плеч %target.rname%.
  detach 1089 %self.id%
  oforce %target% снять вампир.накид
  oforce %target% drop вампир.накид
  wait 1
  if (%target.vnum% == -1)
    odamage %target% %dmg%
  end
  attach 1089 %self.id%
  halt
end
odamage %target% %dmg%
switch %random.4%
  case 1
    osend %target% Накидка впилась в вашу шею и высасыват из вас кровушку!
    oechoaround %target% %target.name% захрипел%target.g%, пытаясь сорвать с шеи высасывающую кровь накидку!
  break
  case 2
    osend %target% Накидка с глухим урчанием терзает вашу шею клыками!
    oechoaround %target% Накидка с утробным урчанием сосет КРОВЬ из %target.rname%!
  break
  case 3
    osend %target% Вампирская накидка с гнусным сопением присосалась к вашей шее и сосет КРОВЬ!
    oechoaround %target% Накидка гнусно сопит, высасывая КРОВЬ из %target.rname%!
  break
  case 4
    osend %target% В вашу шею впились клыки вампирской накидки!!! БОЛЬНО!!!
    oechoaround %target% Накидка с урчанием запустила клыки в глотку %target.rname%!
  break
done
~
#1088
Блокировка выхода концом~
1 c 1
*~
set str конец
set str2 quit
if %str.contains(%cmd%)% || %str2.contains(%cmd%)%
  return 1
  osend %actor% Клыки вампирской накидки намертво вцепились в Вашу нежную плоть и не желают отпускать!
  halt
end
return 0
~
#1089
Нельзя снять накидку~
1 l 100
~
return 0
osend %actor% _Клыки вампирской накидки намертво впились в вашу шею!
oechoaround %actor% _%actor.name% попытал%actor.u% снять вампирскую накидку, но лишь взвыл%actor.g% от боли.
~
#1090
weea~
1 c 1
уии~
nop
~
#1091
Именной шмот - Прокиус~
1 gj 100
~
if (%actor.level% > 30 ) && (%actor.vnum% == -1 )
  halt
end
if %actor.name% != прокиус
  osend %actor% Пентаграмма на верхушке посоха ярко вспыхнула, Вы зажмурились.
  return 0
  halt
end
~
#1092
Открыли шкатулку Пандоры~
1 p 100
~
if %actor.level% > 30
  return 1
  halt
end
if %actor.realroom% < 10000
  osend %actor% Вы чуть не сорвали ногти - но так и не сумели открыть шкатулку.
  return 0
  halt
end
oechoaround %actor% %actor.name% открыл%actor.g% шкатулку Пандоры.
switch %random.2%
  case 1
    eval loadmob 1125
    eval text1 &RИз шкатулки послышалось басовитое гудение!&n
    eval i 0
    eval text2 &RСтайка назойливых комаров вылетела из шкатулки!&n
  break
  case 2
    eval loadmob 901
    eval text1 &RИз шкатулки послашался скрежетание и шорох.&n
    eval i 0
    eval text2 &RЦепочка рыжих муравьев выползла из шкатулки!&n
  break
done
eval i 0
wait 1
oecho %text1%
while ( %i% < 10 )
  wait 12s
  oecho %text2%
  oload mob %loadmob%
  oload mob %loadmob%
  oload mob %loadmob%
  oload mob %loadmob%
  oload mob %loadmob%
  oload mob %loadmob%
  oload mob %loadmob%
  oload mob %loadmob%
  oload mob %loadmob%
  oload mob %loadmob%
  wait 3s
  oecho %text1%
  eval i %i%+1
done
wait 1
opurge %self%
~
#1093
Попытались закрыть шкатулку~
1 r 100
~
if %actor.level% > 30
  return 1
  halt
end
osend %actor% _Вы приложили максимум усилий, но ничего не вышло!
return 0
halt
~
#1094
Бобик~
0 k 100
~
кричат Я ватный моб! Меня не трогьте!!!
flee
flee
if %actor.vnum% != -1
  halt
end
if %random.3% == 2
  %self.hitp(%self.maxhitp%)%
end
~
#1095
Бобик следует )~
0 q 100
~
wait 1
if %actor.name% == Урик
  восторг
  follow .Урик
  лизн шостак
end
~
#1096
Бобик кого-то встретил :-)~
0 t 100
~
wait 1
if %self.leader%
  halt
end
foreach victim %self.pc%
  if %victim.name% == Урик
    восторг
    follow .Урик
    лизн Урик
    halt
  end
done
~
$~
