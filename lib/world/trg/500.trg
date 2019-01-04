#50000
камень_падает~
1 h 100
~
context 500quest
wait 1
set room %self.room%
attach 50083 %room.id%
oecho Время пошло !
wait %pause%s
oecho Время закончилось!
detach 50083 %room.id%
attach 50084 %room.id%
oecho Победитель - тот кто возьмет доказательство!
set schet 2
while (%schet% > 1)
  set schet 0
  set igrok %room.people%
  while %igrok%
    if %igrok.vnum% == -1
      eval schet %schet%+1
    end
    set igrok %igrok.next_in_room%
  done
  wait 10s
done
oecho Вы победитель !
wait 5s
set schet 0
set igrok %room.people%
while %igrok%
  if %igrok.vnum% == -1
    eval schet %schet%+1
  end
  set igrok %igrok.next_in_room%
done
if %schet% == 0
  oecho Здесь нет ниодного игрока!!!
  oecho Некому быть победителем!!!
  detach 50084 %room.id%
  oecho Теперь все могут войти.
  opurge %self%
  halt
else
  oecho Возьмите доказательство Вашей победы.
  oload obj 50001
end
opurge %self%
~
#50001
начало_квестов_переходы_в_зону_500~
2 c 100
начать~
context 500quest
if %pause%
  wecho Один квест уже начат!
  halt
end
if !%arg%
  wecho Скажите какой квест начать !
  halt
end
if %arg% == камень
  wdoor 50082 west purge
  wdoor 50082 west room 50001
  wdoor 50082 west flags a
  wforce вестник.богов.квест орать Боги зовут вас доказать свою стойкость, встаньте у камня, и возьмите доказательство.
  wforce вестник.богов.квест орать Проводники помогут вам попасть в это волшебное место. Ищите их по всему миру.
  eval pause 900+%random.1100%
  worlds pause
  exec 50008 %self.id%
elseif %arg% == кровь
  wdoor 50082 east purge
  wdoor 50082 east room 50014
  wdoor 50082 east flags 0
  wforce вестник.богов.квест орать Боги зовут вас на &Rкровавую&Y битву, ступайте к проводникам, и докажите
  wforce вестник.богов.квест орать что именно Вы достойны Славы и Чести быть Последним кто останется в живых!
  wforce вестник.богов.квест орать У Вас мало времени, что бы успеть к месту битвы! Торопитесь!
  eval pause 900+%random.120%
  worlds pause
else
  wecho Нет такого квеста !
  halt
end
wecho Повинуясь вашему желанию в мире стали появляться Проводники.
wecho комнаты: корса 27030, НК - 49954, галич - 34453, брянск - 66001, ВН - 60050
wat 60050 %load% mob 50000
wat 66001 %load% mob 50000
wat 34453 %load% mob 50000
wat 49954 %load% mob 50000
wat 27030 %load% mob 50000
wait %pause%s
wat 27030 %purge% проводник.квест
wat 27030 wecho Проводник улыбнулся и расстворился в воздухе.
wat 49954 %purge% проводник.квест
wat 49954 wecho Проводник улыбнулся и расстворился в воздухе.
wat 34453 %purge% проводник.квест
wat 34453 wecho Проводник улыбнулся и расстворился в воздухе.
wat 66001 %purge% проводник.квест
wat 66001 wecho Проводник улыбнулся и расстворился в воздухе.
wat 60050 %purge% проводник.квест
wat 60050 wecho Проводник улыбнулся и расстворился в воздухе.
wdoor 50082 east flags abcd
~
#50002
вход_к_проводнику~
0 q 100
~
wait 1
say Приветствую тебя, хочешь попасть в мир заданий и соревнований ?
~
#50003
игрок сказал хочу~
0 cd 0
хочу да конечно~
if %actor.level% > 1
  say Ну что же, тогда милости просим.
  *
end
calcuid room %self.realroom% room
attach 50005 %room.id%
exec 50005 %room.id%
detach 50005 %room.id%
~
#50004
автозакрытие_двери~
2 j 100
~
*if %drection% == west
wait 3s
wecho С тихим шелестом круглая дверь закрылась.
wdoor 50082 west flags b
*end
* в связи с тем что бага какая-то и направление не передается, просто закрваю дверь
~
#50005
портал_в_начало_квест-зоны~
2 z 100
~
wportal 50080 1
~
#50006
возврат_из_квеста~
0 cd 1
вернуться~
say Не знаю вот, получится мне тебя среколить, ну если что попробуй еще раз.
msend %actor% Да уж, устали Вы что-то, пора и честь знать.
dg_cast 'слово возврата' %actor.name%
say Пока, %actor.name%.
~
#50007
делит~
2 g 100
~
wait 1
wecho Ваша энергия уменьшилась!
eval temp %actor.move(-30)%
~
#50008
запуск_квест_камень~
2 z 100
~
calcuid nablud 50001 mob
attach 50009 %nablud.id%
run 50009 %nablud.id%
detach 50009 %nablud.id%
~
#50009
квест_камень_бросаем_камень~
0 z 100
~
mload obj 50000
west
south
бр камень
north
east
появ
~
#50010
взял доказательство~
1 g 100
~
if %actor.vnum% != -1
  return 0
  halt
else
  wait 1
  set room %self.room%
  detach 50084 %room.id%
  oecho Теперь все могут войти.
  osend %actor% Вам надо отдать доказательство наблюдателю, он здесь рядом!
end
detach 50010 %self.id%
~
#50011
дали доказательство наблюдателю~
0 j 100
~
if %object.vnum% != 50001
  say Зачем мне это ?
  бр все
  halt
else
  wait 1
  mpurge %object%
  сказа %actor.name% ну что же, выдам тебе я приз, пусть судьба решит, что это будет
  wait 1s
  mecho Наблюдатель отвернулся, и Вы услышали стук падающих костей.
  wait 1s
  switch %random.3%
    case 1
      mload obj 50012
      say Это удобный браслет, для твоих рук.
      д брасл.побе %actor.iname%
    break
    case 2
      mload obj 50013
      say Это медаль, для твоей груди.
      д медаль.побе %actor.iname%
    break
    case 3
      say Это кольцо, одень его.
      mload obj 50014
      д кольц.побе %actor.iname%
    break
  done
  context 500quest
  unset pause
end
~
#50012
ресет зоны~
2 f 100
~
context 500quest
if !%pause%
  wdoor 50082 east flags abcd
  wdoor 50082 west flags abcd
  calcuid nablud 50001 mob
  wpurge %nablud%
  wat 50002 wload mob 50001
end
~
#50013
Трусы волонда~
1 j 100
~
if %actor.name% != Волонд
  osend %actor% Да туда трех таких как вы засунуть можно...
  return 0
  halt
else
  oechoaround %actor% %actor.name% напялил шикарные семейные трусы и засветился от счастья, прикрывая прореху на заднице.
end
~
#50020
добавить_слава_5~
1 j 100
~

~
#50021
торт Волонда~
1 g 100
~
if %actor.name% != Волонд
  osend %actor% ___&RПоложь, где росло!&n
  return 0
  halt
end
~
#50022
Низя снять игрушку~
1 l 100
~
return 0
osend %actor% _Вы обнаружили, что игрушечные драконьи головы намертво вцепились в Ваши пальцы!
oechoaround %actor% _%actor.name% попытал%actor.u% снять с пальцев китайскую игрушку, но ничего не получилось.
~
#50023
Снять игрушку и блокировка выхода концом~
1 c 1
*~
set str конец
set str2 quit
if %str.contains(%cmd%)% || %str2.contains(%cmd%)%
  return 1
  osend %actor% Китайская игрушка намертво вцепилась в Ваши пальцы и не отпускает Вас!
  halt
end
set str1 нажать
set str2 надавить
if ((%cmd% == %str1%) || (%cmd% == %str2%))
  if !%arg.contains(глаза)%
    osend %actor% Что именно вы хотите надавить?
    return 1
    halt
  end
  osend %actor% Вы надавили пальцами на глаза игрушечного дракончика и его клыки временно ослабили хватку.
  attach 50024 %self.id%
  detach 50022 %self.id%
  wait 5s
  attach 50022 %self.id%
  detach 50024 %self.id%
  halt
end
return 0
~
#50024
Сняли китайскую игрушку~
1 l 100
~
wait 1
if !%self.worn_by%
  otransform 51819
  attach 50025 %self.id%
end
~
#50025
Надели китайскую игрушку~
1 j 100
~
if %actor.vnum% != -1
  return 0
  halt
end
wait 1
if ((%self.vnum% == 51819) && %self.worn_by%)
  otransform 51820
end
detach 50025 %self.id%
~
#50030
ВстречаетМетель~
0 q 100
~
wait 1s
г Зона на реставрации!
г Велено никого не пускать!
wait 1s
mecho _&WЗашумели ветры буйные, застлали очи колючими снежинками.&n
mecho _&WНе пройти, не проехати!
~
#50031
ТригМетели~
0 d 0
*~
wait 1s
if %actor.name% == морена
  switch %speech%
    case следуй
      кив
      wait 1s
      след .морена
    break
    case исчезни
      взд
      wait 1s
      лиз .морена
      %purge% %self%
    break
    default
      пож
      вопрос .морена
    break
  done
else
  рыч .%actor.name%
end
~
#50037
Пуржатся двое из ларца~
0 n 100
~
wait 180s
say Чой-та мы притомились! Пойдем себе...
mecho Двое-из-ларца канули куда-то, вы и глазом моргнуть не успели.
wait 1
mpurge %self%
~
#50038
Постучать в ларец~
1 c 4
постучать~
wait 1
if (!%arg.contains(в ларец)% || (%self.val3% >= 50))
  osend %actor% Вы громко постучали себе по лбу.
  halt
end
osend %actor% Вы постучали в полированную крышку ларца... Совсем с глузду съехали?
oechoaround %actor% %actor.name% наклонил%actor.u% и постучал%actor.g% в крышку ларца.
wait 1
if (%world.curmobs(50039)% > 0)
  calcuid two 50039 mob
  if (%two.realroom% == %actor.realroom%)
    oforce %two% say Ну воооот еще...
    oecho Вы и глазом моргнуть не успели, как двое-из-ларца канули обратно в ларец.
    opurge %two%
  else
    oecho И ничего не произошло!
  end
  halt
end
oecho Крышка с треском распахнулась, и откуда ни возьмись явились двое-из-ларца.
oload mob 50039
eval num %self.val3%+1
%self.val3(%num%)%
~
#50039
Двое-из-ларца~
0 j 100
~
wait 1
eval oname %object.name%
eval oname %oname.car%
say Э-эх,где наша не пропадала!
cast 'починка' %oname%
wait 1
give %oname% %actor.name%
say Принимай работу!
~
#50040
Триггер серебряной свирели~
1 c 1
сыграть~
wait 1
if !%arg.contains(мелодию)%
  osend %actor% Что вы хотите сыграть?
  halt
end
oecho %actor.name% поднес%actor.q% свирель к губам и слегка подул в нее.
if (%world.curmobs(50049)% < 1)
  wait 1s
  oecho Послышалась переливчатая зовущая мелодия.
  wait 1s
  oecho Лунный зверь медленно сгустился из воздуха, зачарованно глядя на вас.
  oechoaround %actor% Лунный зверь медленно сгустился из воздуха, зачарованно глядя на %actor.vname%
  oload mob 50049
  halt
end
calcuid moonanimal 50049 mob
if ((%moonanimal.realroom% == %actor.realroom%) && !%moonanimal.leader%)
  wait 1s
  oecho Послышалась грустная прощальная мелодия.
  oecho Лунный зверь тоскливо взывыл и растаял в воздухе.
  wait 1
  opurge %moonanimal%
  halt
end
if ((%moonanimal.realroom% == %actor.realroom%) && (%moonanimal.leader% == %actor%))
  oecho Послышалась переливчатая прозрачная мелодия.
  wait 1s
  oechoaround %actor% Лунный зверь танцует в воздухе, зачарованно глядя на %actor.vname%
  oecho Лунный зверь танцует в воздухе, зачарованно глядя на вас.
  halt
end
if ((%moonanimal.realroom% == %actor.realroom%) && (%moonanimal.leader% != %actor%))
  oecho Послышалась тонкая звенящая мелодия.
  wait 1s
  oecho Лунный зверь беспокойно взвыл.
  oforce %moonanimal% follow я
  wait 3
  oechoaround %actor% Лунный зверь подлетел ближе к %actor.dname%
  oecho Лунный зверь подлетел поближе к вам.
  halt
end
if (%moonanimal.realroom% != %actor.realroom%)
  oecho Послышалась настойчивая зовущая мелодия.
  wait 1s
  oechoaround %moonanimal% Лунный зверь вдруг беспокойно взвыл и растаял в воздухе.
  oecho Лунный зверь со свистом причался откуда-то, и подлетел к вам.
  oteleport %moonanimal% %actor.realroom%
end
~
#50041
Триггер заговоренного манка~
1 c 1
дунуть~
wait 1
if !%arg.contains(в манок)%
  osend %actor% Чего-чего дунуть?! А вот как доберутся до вас стражники из приказу по контролю за оборотом медовухи!
  halt
end
osend %actor% Вы с силой дунули в заговоренный манок.
oechoaround %actor% %actor.name% с силой дунул%actor.g% в заговоренный манок.
oecho Послышался протяжный тоскливый звук.
eval i %world.curmobs(50041)%
while (%i% > 0)
  wait 1
  calcuid raven 50041 mob %i%
  if (%raven.leader% == %actor%)
    oecho Призрачный ворон явился на зов.
    oteleport %raven% %actor.realroom%
    halt
  end
  eval i %i%-1
done
oecho Призрачный ворон с хриплым криком возник из тени.
oload mob 50041
calcuid raven 50041 mob 1
oforce %raven% follow .%actor.name%
eval count %self.val0%+1
%self.val0(%count%)%
if (%self.val0% == 10)
  osend %actor% Заговоренный манок вспыхнул, и рассыпался в прах.
  wait 1
  opurge %self%
end
~
#50042
Призрак пуржится~
0 ab 100
~
if !%self.leader%
  mecho Призрачный ворон взмахнул крыльями и растаял.
  wait 1
  mpurge %self%
end
~
#50043
Открываем портал по зеркалу~
2 z 100
~
wait 1
wportal %target% 2
wait 1
rdelete target %self.id%
detach 50043 %self.id%
~
#50044
Взглянуть в зеркальце~
1 c 1
посмотреть~
wait 1
if !%arg.contains(прямо)% && !%arg.contains(искоса)%
  osend %actor% Зеркальце блеснуло на свету, но ничего не произошло.
end
if %arg.contains(прямо)%
  osend %actor% Вы посмотрели прямо в волшебное зеркальце.
  osend %actor% Вдруг ваше отражение на миг исчезло, а все вокруг напротив стало видно ясно.
  osend %actor% Зеркальце мягко блеснуло и померкло.
  osend %actor% Вам показалось, что зеркальце словно запомнило все вокруг вас.
  %self.val0(%actor.realroom%%)%
end
if %arg.contains(искоса)%
  osend %actor% Вы повернули зеркало и искоса взглянули в него.
  osend %actor% Поверхность зеркала мягко засветилась!
  wait 1
  if (%self.val0% != 0)
    calcuid room %actor.realroom% room
    osend %actor% В зеркале вдруг появилось отражение совсем другого места!
    attach 50043 %room.id%
    set target %self.val0%
    global target
    remote target %room.id%
    exec 50043 %room.id%
    eval count %self.val1%+1
    %self.val1(%count%)%
    rdelete target %self.id%
  else
    osend %actor% Но ничего не произошло...
  end
end
if (%self.val1% == 5)
  osend %actor% Волшебное зеркальце вспыхнуло и рассыпалось в прах.
  wait 1
  opurge %self%
end
~
#50046
триг хрустального кушака~
1 gj 100
~
%echo% тест
~
#50047
Именной шмот пуржится~
1 b 5
~
*log Trigger 50047 work
eval objname %self.name%
eval owner %self.carried_by%
if !%owner%
  halt
end
switch %self.vnum%
  case 50050
    if %owner.name% != Сташа
      wait 1
      oforce %owner% бросить %objname.car%.%objname.cdr%
    end
  break
  case 50051
    if ((%owner.name% != Урик) && (%owner.name% != Старь)
      wait 1
      oforce %owner% бросить %objname.car%.%objname.cdr%
    end
  break
  case 50052
    if %owner.name% != Лешко  %owner.name% != Тайгал  %owner.name% != Лина
      wait 1
      oforce %owner% бросить %objname.car%.%objname.cdr%
    end
  break
  case 50053
    if %owner.name% != Амрина
      wait 1
      oforce %owner% бросить %objname.car%.%objname.cdr%
    end
  break
  case 50054
    if %owner.name% != Дилок && %owner.name% != Мильян && %owner.name% != Ладобор
      wait 1
      oforce %owner% бросить %objname.car%.%objname.cdr%
    end
  break
  case 50055
    if ( %owner.name% != Некрас ) && ( %owner.name% != Лихья )
      wait 1
      oforce %owner% бросить %objname.car%.%objname.cdr%
    end
  break
  case 50056
    if %owner.name% != Кирдан
      wait 1
      oforce %owner% бросить %objname.car%.%objname.cdr%
    end
  break
  case 50057
    if (%owner.name% != Далим) && (%owner.name% != Дера))
      wait 1
      oforce %owner% бросить %objname.car%.%objname.cdr%
    end
  break
  case 50058
    if %owner.name% != Илерий && %owner.name% != Земовит && %owner.name% != Велеян
      wait 1
      oforce %owner% бросить %objname.car%.%objname.cdr%
    end
  break
  case 50059
    if ((%owner.name% != Женя) && (%owner.name% != Тарам) && (%owner.name% != Ивица))
      wait 1
      oforce %owner% бросить %objname.car%.%objname.cdr%
    end
  break
  case 50060
    if %owner.name% != Никомир
      wait 1
      oforce %owner% бросить %objname.car%.%objname.cdr%
    end
  break
  case 50061
    if %owner.name% != Тирфа
      wait 1
      oforce %owner% бросить %objname.car%.%objname.cdr%
    end
  break
  case 50062
    if %owner.name% != Феосий
      wait 1
      oforce %owner% бросить %objname.car%.%objname.cdr%
    end
  break
  case 50063
    if %owner.name% != Удал && %owner.name% != Стойко && %owner.clan% != вд && %owner.clan% != гд && %owner.clan% != нд
      wait 1
      oforce %owner% бросить %objname.car%.%objname.cdr%
    end
  break
  case 50064
    if ( %owner.name% != Ювеналий ) && ( %owner.name% != Шмуэль )
      wait 1
      oforce %owner% бросить %objname.car%.%objname.cdr%
    end
  break
  case 50065
    if %owner.name% != Рианда
      wait 1
      oforce %owner% бросить %objname.car%.%objname.cdr%
    end
  break
  case 50066
    if ((%owner.name% != Тимон) && (%owner.name% != Вианэт) && (%owner.name% != Миромах) && (%owner.name% != Гневлон))
      wait 1
      oforce %owner% бросить %objname.car%.%objname.cdr%
    end
  break
  case 50067
    if %owner.name% != Ильмо
      wait 1
      oforce %owner% бросить %objname.car%.%objname.cdr%
    end
  break
  case 50068
    if %owner.name% != Орина
      wait 1
      oforce %owner% бросить %objname.car%.%objname.cdr%
    end
  break
  case 50069
    if %owner.name% != Эйрар
      wait 1
      oforce %owner% бросить %objname.car%.%objname.cdr%
    end
  break
  case 50070
    if %owner.name% != Чино
      wait 1
      oforce %owner% бросить %objname.car%.%objname.cdr%
    end
  break
  case 50071
    if %owner.name% != Урик
      wait 1
      oforce %owner% бросить %objname.car%.%objname.cdr%
    end
  break
  case 50072
    wait 1
    if ((%owner.name% != Хромунд) && (%owner.name% != Акся))
      oforce %owner% бросить %objname.car%.%objname.cdr%
    end
  break
  case 50073
    wait 1
    if %owner.name% != Волимир
      oforce %owner% бросить %objname.car%.%objname.cdr%
    end
  break
  case 50074
    wait 1
    if %owner.name% != Курлан
      oforce %owner% бросить %objname.car%.%objname.cdr%
    end
  break
  case 50075
    wait 1
    if ((%owner.name% != Владэк) && (%owner.name% != Чарва) && (%owner.name% != Мергана))
      oforce %owner% бросить %objname.car%.%objname.cdr%
    end
  break
  case 50088
    wait 1
    if %owner.name% != Глузд
      oforce %owner% бросить %objname.car%.%objname.cdr%
    end
  break
  case 50076
    if ((%owner.name% != Аладори ) && (%owner.name% != Наталья ) && (%owner.name% != Магура ))
      oforce %owner% бросить %objname.car%.%objname.cdr%
    end
  break
  case 50077
    if %owner.name% != Рогнеда
      oforce %owner% бросить %objname.car%.%objname.cdr%
    end
  break
  case 50079
    if %owner.name% != Делан
      oforce %owner% бросить %objname.car%.%objname.cdr%
    end
  break
done
~
#50048
Выдача именного шмота - корчмарь~
0 q 100
~
wait 1
if (%actor.name% == Удал || %actor.name% == Стойко)
  if (%world.curobjs(50063)% == 0)
    say Мое почтение! Вот ваша вещица, не пропала!
    mload obj 50063
    дать голова .%actor.name%
  end
elseif (%actor.name% == Ювеналий) || (%actor.name% == Шмуэль)
  if (%world.curobjs(50064)% == 0)
    say Ааа, %actor.name%! Пожаловал... Забирай свою коробку...
    морщ
    крест
    mload obj 50064
    дать тфилин .%actor.name%
  end
elseif (%actor.name% == Рианда)
  if (%world.curobjs(50065)% == 0)
    шляп
    say Приветствую, волхвам мое почтение! Вот и сумка ваша.
    mload obj 50065
    дать сумка .рианда
  end
elseif (%actor.name% == Феклуша)
  if (%world.curobjs(50066)% == 0)
    ул
    mload obj 50066
    дать рюкзак .%actor.name%
  end
elseif %actor.name% == Ильмо
  if (%world.curobjs(50067)% == 0)
    челю
    крест
    mload obj 50067
    дать нимб .Ильмо
    крест
  end
elseif %actor.name% == Орина
  if (%world.curobjs(50068)% == 0)
    шляп
    say Здраве будь, красавица!
    say Вот и сумка ваша, в сохранности.
    mload obj 50068
    дать сума .орина
  end
elseif ( %actor.name% == Эйрар ) || ( %actor.name% == Морита ) ||  ( %actor.name% == Гуннар ) ||  ( %actor.name% == Ресвальд ) ||  ( %actor.name% == Родмир ) ||  ( %actor.name% == Ассаши ) ||  ( %actor.name% == Харитон ) 
  if ( %world.curobjs(50069)% == 0 )
    say Здраве будь, %actor.name%!
    say Вот сумка ваша, сохранялась с бережением.
    mload obj 50069
    дать сума .%actor.name%
  end
elseif %actor.name% == Чино
  if ( %world.curobjs(50070)% == 0 )
    say Здраве будь, охотник!
    say Вот трофей твой охотничий, не пропал.
    mload obj 50070
    дать брюшко .%actor.name%
  end
elseif %actor.name% == Урик
  mechoaround %actor% Корчмарь дружески икнул Урику.
  msend %actor% Корчмарь заметил вас и дружески вам икнул.
  тост
  курить
  if ( %world.curobjs(50071)% == 0 )
    mload obj 50071
    дать баян .Урик
  end
elseif ((%actor.name% == Хромунд) || (%actor.name% == Акся))
  say Вот держи свою сумку... Вечно она по полкам ползает да сопит.
  дум
  if ( %world.curobjs(50072)% == 0 )
    mload obj 50072
    дать сум .%actor.name%
  end
elseif (%actor.name% == Волимир)
  if ( %world.curobjs(50073)% == 0 )
    say А, Волимир, здрав будь... Забери свою сумку, у меня на нее разрешения нет.
    mload obj 50073
    дать сума .Волимир
  end
elseif (%actor.name% == Курлан)
  if ( %world.curobjs(50074)% == 0 )
    say А, Курлан, здрав будь... Забери свою сумку, у меня на нее разрешения нет.
    mload obj 50074
    дать сума .Курлан
  end
elseif (%actor.name% == Владэк)
  if ( %world.curobjs(50075)% == 0 )
    say Здрав будь! Вот твое лукошко, забирай.
    mload obj 50075
    дать лукошко .Владэк
  end
elseif (%actor.name% == Глузд)
  if ( %world.curobjs(50088)% == 0 )
    mload obj 50088
    дать сумка .Глузд
  end
elseif ((%actor.name% == Добря) || (%actor.name% == Наталья ) || (%actor.name% == Обида ))
  if ( %world.curobjs(50076)% == 0 )
    mload obj 50076
    дать торба .%actor.name%
  end
elseif (%actor.name% == Рогнеда || %actor.name% == Гинор)
  if ( %world.curobjs(50077)% == 0 )
    mload obj 50077
    ____дать баул .%actor%
  end
elseif (%actor.name% == Шана)
  if ( %world.curobjs(50078)% == 0 )
    mload obj 50078
    дать сум .шана
  end
elseif (%actor.name% == Делан)
  if ( %world.curobjs(50079)% == 0 )
    mload obj 50079
    ужас .%actor.name%
    бледн
    дать саквояж .делан
  end
elseif ((%actor.name% == Огалай) || (%actor.name% == Илья))
  if ( %world.curobjs(50082)% == 0 )
    mload obj 50082
    emot почесал чучело камышового кота за ухом.
    дать чучело .%actor.name%
  end
end
~
#50049
Хранитель выдает шмот~
0 q 100
~
wait 1
if (%actor.name% == Мильян)
  if (%world.curobjs(50054)% == 0)
    say Смотри кто пожаловал, давно тебя жду, заберешь ты, наконец, свой кусячий узелок или нет ? На держи.
    mload obj 50054
    д кушак .мильян
  end
end
if (%actor.name% == Урик)
  if (%world.curobjs(50051)% == 0)
    say Да, знаю твое горе, где-то тут у меня валяется эта красная тряпочка...
    mload obj 50051
    give урик .урик
  end
end
if %actor.name% == Прокиус
  if %world.curobjs(1091)% == 0
    say Здравствуй, Прокиус! Знаю я зачем ты пришел.
    say Сейчас, сейчас, найду.
    wait 1s
    say Ах, вот он!
    mload obj 1091
    д посо прокиус
  end
end
if %actor.name% == Сташа
  if %world.curobjs(50050)% == 0
    say Приветствую тебя, Сташа. Рад видеть у себя в гостях, вот и подарочек припас.
    wait 1s
    mload obj 50050
    д авоська cташа
  end
elseif %actor.name% == Лешко
  if %world.curobjs(50052)% == 0
    say Ах, да... старый Лешко. Здаров, вижу я зачем ты пожаловал, держи свою вышивку.
    хих лешко
    mload obj 50052
    д авось.лешк .лешко
  end
elseif (%actor.name% == Амрина)
  if %world.curobjs(50053)% == 0
    say Ааа, пришла за своим мешком ? Да в него наверное пол НК влезет, забирай, он тут у меня кучу места жрет.
    mload obj 50053
    give сума .%actor.name%
  end
elseif ( %actor.name% == Некрас ) || ( %actor.name% == Лихья )
  if %world.curobjs(50055)% == 0
    say За котомкой явился? Забирай эту царапучую - она мне все лавки когтями ободрала!
    mload obj 50055
    give котомка .лихья
    give котомка .некрас
  end
elseif %actor.name% == Кирдан
  if %world.curobjs(50056)% == 0
    say За сумкой явился? Ну забирай... А то она тут вечно храпит во сне.
    say И княжеский пожарнадзор штраф взять норовит!
    mload obj 50056
    give сумка .Кирдан
  end
elseif %actor.name% == Далим
  if %world.curobjs(50057)% == 0
    say Ааа, Далим, пожаловал наконец!
    say Вот твоя сума - негоже снаряжением разбрасываться!
    mload obj 50057
    give сума .Далим
  end
elseif ((%actor.name% == Женя) || (%actor.name% == Тарам) || (%actor.name% == Ивица))
  if %world.curobjs(50059)% == 0
    say Явился, наконец, жулик!
    ворч
    say Вот твоя котомка - забирай. Орет без конца, да еще и подмигивает, скотина!
    mload obj 50059
    give котом .%actor.name%
  end
elseif %actor.name% == Илерий
  if %world.curobjs(50058)% == 0
    say Здравствуй, здравствуй, Илерий!
    шляп
    say Вот твоя награда - не пропала.
    mload obj 50058
    give орден .илерий
  end
elseif %actor.name% == Никомир
  if %world.curobjs(50060)% == 0
    say Лекарю-травнику мое почтение!
    шляп
    say Вот и сумка ваша - не запропала.
    mload obj 50060
    give сумка .Никомир
  end
elseif %actor.name% == Тирфа
  if %world.curobjs(50061)% == 0
    say Здраве буде, Тирфа!
    шляп
    say Помню-помню, за чем ты пришла... Вот она, пожалуйста.
    mload obj 50061
    give сумочка .тирфа
  end
elseif %actor.name% == Феосий
  if %world.curobjs(50062)% == 0
    say Онвад с унод, друже Феосий? 
    : хитро ухмыльнулся и подмигнул Вам
    say Знаю, зачем ты пришел, знаю... Вот он, узелок твой.
    mload obj 50062
    give узелок .феосий
  end
end
бр все
~
#50050
именной_шмот_Сташа~
1 ghjp 100
~
if (%actor.level% > 30 ) && (%actor.vnum% == -1 )
  halt
end
if %actor.name% != Сташа
  oechoaround %actor% Цветы на авоське Сташи зашевелились, открылись, вокруг разлилось благоухание.
  osend %actor% Цветы повернули к Вам свои бутоны, и распахнулись. Запах Весны заполнил все вокруг.
  return 0
  halt
else
  wait 1
  osend %actor% _Авоська выскользнула у вас из рук.
end
~
#50051
именной шмот Урик~
1 gjp 100
~
if (%actor.level% > 30 ) && (%actor.vnum% == -1 )
  halt
end
if %actor.name% != Урик && %actor.name% != Старь
  osend %actor%  Труп Урика вырвался у вас из рук и снова прилег на землю.
  return 0
  halt
else
  wait 1
  *oechoaround %actor% Кровушка стынет в жилах от предсмертного крика Урика.
end
~
#50052
именной шмот Лешко~
1 gjp 100
~
if (%actor.level% > 30 ) && (%actor.vnum% == -1 )
  halt
end
if (%actor.name% != Лешко) && (%actor.name% != Тайгал) && (%actor.name% != Лина)
  osend %actor% Вы попытались взять сумку могильного холода, но у Вас отмерзли пальцы.
  return 0
  halt
else
  wait 1
  osend %actor% Холод мягким коконом окутал Вас.
  oechoaround %actor% Холод исходящий от сумки, пробирает Вас до костей.
end
~
#50053
Именной шмот - Амрина~
1 gjp 100
~
if (%actor.level% > 30 )  (%actor.vnum% == -1 )
  halt
end
if %actor.name% == Амрина
  wait 1
  oechoaround %actor% Сума Амрины начала раздуваться в предвкушении сладостей.
  osend %actor% Ваша сума проголодалась и требует сладких плюшек.
  halt
else
  osend %actor% Сума Амрины брезгливо осмотрела Вас в поисках вкусного, не найдя ничего интересного тяпнула Вас за нос.
  osend %actor% &RЭто действительно БОЛЬНО!&n
  oechoaround %actor% %actor.name% вздумал%actor.g% присвоить добро Амрины, но преданная сума откусила обидчику нос. Поделом!
  otransform 50053
  return 0
  halt
end
~
#50054
именной шмот Мильян~
1 ghjp 100
~
if (%actor.level% > 30 ) && (%actor.vnum% == -1 )
  halt
end
if ( %actor.name% == Мильян ) || ( %actor.name% == Дилок ) || ( %actor.name% == Ладобор )
  wait 1
  osend %actor% Кровавая Зверюшка на узелке облизнула короткие острые зубки.
  oechoaround %actor% Кровавая Зверюшка на узелке %actor.rname% осмотрела Вас в надежде найти что-нибудь полезное.
else
  oechoaround %actor% %actor.iname% испуганно отдернул руку от узелка, Вам показалось его кто-то укусил.
  osend %actor% Странная зверушка на узелке цапнула Вас за палец, от неожиданности Вы отдернули руку.
  otransform 50054
  return 0
  halt
end
~
#50055
Именной шмот - Некрас~
1 ghjp 100
~
if (%actor.level% > 30 ) && (%actor.vnum% == -1 )
  halt
end
if ( %actor.name% == Некрас ) || ( %actor.name% == Лихья )
  wait 1
  oechoaround %actor% Легенький белый &Wп&Kу&Wш&Kо&Wк&n на котомке %actor.rname% слегка зашевелился на ветру.
  osend %actor% Легенький белый &Wп&Kу&Wш&Kо&Wк&n на котомке слегка зашевелился на ветру.
  halt
else
  oechoaround %actor% %actor.iname% взвизгнул%actor.g% и отскочил%actor.g% в сторону от пушистой котомки.
  osend %actor% Из котомки вдруг высунулась лапа с острыми когтями и вы едва не поплатились пальцем за нахальство.
  return 0
  halt
end
~
#50056
Именной шмот Кирдан~
1 ghjp 100
~
if (%actor.level% > 30 ) && (%actor.vnum% == -1 )
  halt
end
if %actor.name% != Кирдан
  return 0
  oechoaround %actor% Лежащая на земле сумка вдруг лязгнула зубищами и БОЛЬНО цапнула %actor.vname%!
  oechoaround %actor% %actor.iname% завопил%actor.g% и отскочил%actor.g% в сторону.
  osend %actor% Сумка вдруг лязгнула зубами и ОЧЕНЬ БОЛЬНО укусила Вас!
  halt
else
  wait 1
  *oecho _Сумка Кирдана завозилась, устраиваясь поудобнее.
  *oecho __Кащей Бессмертный вспомнил своего ручного змея и загрустил...
end
~
#50057
Именной шмот - Дера~
1 gjp 100
~
if (%actor.level% > 30 ) && (%actor.vnum% == -1 )
  halt
end
if ((%actor.name% != Далим) && (%actor.name% != Дера))
  return 0
  osend %actor% _Вам не по силам поднять эту авоську - в ней же не меньше чем пол-пуда!
  halt
end
~
#50058
Именной шмот Илерий~
1 gjp 100
~
if (%actor.level% > 30 ) && (%actor.vnum% == -1 )
  halt
end
if %actor.name% != Илерий && %actor.name% != Земовит && %actor.name% != Велеян && %actor.name% != Ведаш
  otransform 50058
  return 0
  oecho ___&YОрден &Rна суме&n вдруг яросто вспыхнул, и едва не спалил Вас дотла!
  halt
else
  wait 1
  oecho _ &RОрден &YУдомельского &Rбратства&n на суме %actor.rname% &Wярко сверкнул&n.
end
~
#50059
Именной шмот - Иаким~
1 gjp 100
~
if (%actor.level% > 30 ) && (%actor.vnum% == -1 )
  halt
end
if ((%actor.name% != Женя) && (%actor.name% != Тарам) && (%actor.name% != Ивица))
  return 0
  oechoaround %actor% %actor.name% попытался взять котомку.
  oecho ___Нарисованный на котомке драконий глаз едва не испепелил %actor.vname% дотла!
  halt
else
  wait 1
  oecho _Глаз на котомке Жени вдруг засветился и подмигнул Вам.
  oecho ___Неожиданно раздался ЖУТКИЙ вопль и глаз полыхнул кровавым огнем!
end
~
#50060
Именной шмот - Никомир~
1 gjp 100
~
if (%actor.level% > 30 ) && (%actor.vnum% == -1 )
  halt
end
if %actor.name% != Никомир
  return 0
  oechoaround %actor% %actor.name% попытал%actor.u% взять сумку, но вдруг покачнул%actor.u% и едва не упал%actor.g%.
  oecho __Запах из внезапно открывшейся сумки был настолько резким, что вы на секунду потеряли сознание.
  halt
else
  wait 1
  oecho _Никомир положил еще пару стебельков в сумку для сбора трав.
end
~
#50061
Именной шмот - Тирфа~
1 ghjp 100
~
if (%actor.level% > 30 ) && (%actor.vnum% == -1 )
  halt
end
if %actor.name% != Тирфа
  return 0
  oechoaround %actor% %actor.name% наклонил%actor.u% над сумкой, но вдруг вскрикнул%actor.g% и отскочил%actor.g%.
  osend %actor%  _Сумочка вдруг распахнулась, и два ряда белоснежных зубов едва не оставили Вас без пальцев!
  halt
else
  wait 1
  oecho Глаза нетопыря на сумочке Тирфы сверкнули недобрым блеском.
end
~
#50062
Именной щмот - Феосий~
1 ghjp 100
~
if (%actor.level% > 30 ) && (%actor.vnum% == -1 )
  halt
end
if %actor.name% != Феосий && %actor.name% != Вуара && %actor.name% != Рэйра
  otransform 50062
  return 0
  oechoaround %actor% %actor.name% наклонил%actor.u% чтобы взять узелок...
  oechoaround %actor% __...но откуда-то появился вор, выхватил узелок и был таков.
  osend %actor% __Вор изображенный на узелке Феосия чуть не отрубил Вам руку и скрылся.
  *opurge %self%
  halt
else
  wait 1
  oecho На мгновение вам показалось, что ваши вещи переходят в узелок %actor.rname%.
end
~
#50063
Именной шмот - Удал~
1 ghjp 100
~
if (%actor.level% > 30 ) && (%actor.vnum% == -1 )
  halt
end
if %actor.name% != Удал && %actor.name% != Стойко && %actor.clan% != нд && %actor.clan% != вд && %actor.clan% != гд
  otransform 50063
  oechoaround %actor% %actor.name% наклонил%actor.u% и протянул руку к акульей голове.
  oechoaround %actor% Зубы акулы впились в руку %actor.rname%!
  osend %actor% &R __Акульи зубы впились вам в руку! 
  osend %actor% &R __Это действительно БОЛЬНО!&n
  if %actor.clan% != вд
    return 0
    halt
  end
else
  wait 1
  oecho Акулья голова лязгнула зубами, вызвав ужас у окружающих.
end
~
#50064
Именной шмот - Ювеналий~
1 gjp 100
~
if (%actor.level% > 30 ) && (%actor.vnum% == -1 )
  halt
end
if ( %actor.name% != Ювеналий ) && ( %actor.name% != Шмуэль )
  oechoaround %actor% _Громко матерясь, тфилин отскочил от гойской руки %actor.rname% !
  osend %actor%  __Громко матерясь, тфилин отскочил от вашей руки!
  return 0
  halt
else
  wait 1
  oecho _Тфилин тихо забормотал древнюю молитву.
end
~
#50065
Именной шмот - Рианда~
1 gjp 100
~
if (%actor.level% > 30 ) && (%actor.vnum% == -1 )
  halt
end
if %actor.name% != Рианда
  oechoaround %actor%  Нарисованый на сумке бельчонок негодующе фыркнул и укусил %actor.vname% за палец.
  osend %actor% _Нарисованый на сумке бельчоно негодующе фыркнул и отвернулся.
  return 0
  halt
else
  wait 1
  oecho _Нарисованый на сумке для рун бельчонок загадочно вам подмигнул.
end
~
#50066
Именной шмот - Вианэт~
1 gjp 100
~
if (%actor.level% > 30 ) && (%actor.vnum% == -1 )
  halt
end
if ((%actor.name% != Миромах) && (%actor.name% != Гневлон) && (%actor.name% != Тимон) && (%actor.name% != Вианэт))
  osend %actor% Походный мешок бродяги: Вы не в состоянии нести еще и его !
  return 0
  halt
end
~
#50067
Именной шмот - Ильмо~
1 ghj 100
~
if (%actor.level% > 30 ) && (%actor.vnum% == -1 )
  halt
end
if %actor.name% != Ильмо
  osend %actor% _Вас обожгло при попытке прикоснуться к нимбу ангела!
  return 0
  halt
else
  wait 1
  oecho _Нимб над головой Ильмо ярко вспыхнул, освятив это место.
end
~
#50068
Именной шмот - Орина~
1 ghjp 100
~
if (%actor.level% > 30 ) && (%actor.vnum% == -1 )
  halt
end
if %actor.name% != орина
  osend %actor%  Вы лишь обожгли руки, прикоснувшись к суме!
  return 0
  halt
end
~
#50069
Именной шмот - Эйрар~
1 gjp 100
~
if (%actor.level% > 30 ) && (%actor.vnum% == -1 )
  halt
end
if ( %actor.name% != Эйрар ) && ( %actor.name% != Морита ) &&  ( %actor.name% != Гуннар ) &&  ( %actor.name% != Ресвальд ) &&  ( %actor.name% != Родмир ) &&  ( %actor.name% != Ассаши ) &&  ( %actor.name% != Харитон )
  osend %actor%  _Почувствовав магическую силу, исходящую от черной сумы Вы остановились.
  return 0
  halt
else
  wait 1
  oecho _Красные ленты на черной суме тихонько зашелестели.
end
~
#50070
Именной шмот - Эльвуд~
1 gjp 100
~
if (%actor.level% > 30 ) && (%actor.vnum% == -1 )
  halt
end
if %actor.name% != Чино
  osend %actor% _Брюшко навозного жучка надулось от возмущения.
  return 0
  halt
else
  osend %actor% Брюшко навозного жучка улыбнулось и захлопало лапками от радости.
  oechoaround %actor% Брюшко навозного жучка улыбнулось и захлопало лапками от радости.
end
~
#50071
Именной шмот - Шостак~
1 gj 100
~
if (%actor.level% > 30 ) && (%actor.vnum% == -1 )
  halt
end
if %actor.name% != Урик
  osend %actor% _Коли дурманом смешиться, весь ум прахом, и быть тебе аки Урику дурнем ветреным.
  osend %actor% ___...так что положь где росло!
  return 0
  halt
else
  wait 1
  oecho _Литровый баянище весело звякнул в руках Урика.
  oecho __Глаза Урика приобрели мутный оттенок.
end
~
#50072
Именной шмот - Сердитко~
1 gjp 100
~
if (%actor.level% > 30 ) && (%actor.vnum% == -1 )
  halt
end
if %actor.name% != Хромунд && %actor.name% != Акся && %actor.name% != Олеша && %actor.name% !=  Весняна
  osend %actor% _Дорожная сумка проворно осткочила в сторону, избежав ваших пальцев.
  return 0
  halt
else
  wait 1
end
~
#50073
Именной шмот - Волимир~
1 gjp 100
~
if (%actor.level% > 30 ) && (%actor.vnum% == -1 )
  halt
end
if %actor.name% != Волимир
  osend %actor% _Знамя на суме Волжского Защитника оттолкнуло Вас.
  return 0
  halt
else
  wait 1
  oecho _Знамя на суме Волжского Защитника сверкнуло синим цветом.
end
~
#50074
Именной шмот - Курлан~
1 gjp 100
~
if (%actor.level% > 30 ) && (%actor.vnum% == -1 )
  halt
end
if %actor.name% != Курлан
  osend %actor% _Прикоснувшись к сетке, вы чуть не превратились в овощ, и еле успели убрать руку.
  return 0
  halt
else
  wait 1
  oecho _Один из овощей попытался очнутся, но не тут-то было.
end
~
#50075
Именной шмот - Владэк~
1 gjp 100
~
if (%actor.level% > 30 ) && (%actor.vnum% == -1 )
  halt
end
if ((%actor.name% != Владэк) && (%actor.name% != Чарва) && (%actor.name% != Владух) && (%actor.name% != Мергана))
  otransform 50075
  osend %actor% _Лукошко проворно отскочило от вашей руки.
  return 0
  halt
else
  wait 1
end
~
#50076
Именной шмот - Добря~
1 gjlp 100
~
if (%actor.level% > 30 ) && (%actor.vnum% == -1 )
  halt
end
switch %random.9%
  case 1
    set word &Wлепестков&n
  break
  case 2
    set word &Yлепестков&n
  break
  case 3
    set word &Mлепестков&n
  break
  case 4
    set word &Bлепестков&n
  break
  case 5
    set word &Cлепестков&n
  break
  case 6
    set word &Rлепестков&n
  break
  case 7
    set word &rлепестков&n
  break
  case 8
    set word &bлепестков&n
  break
  case 9
    set word &mлепестков&n
  done
  if ((%Actor.name% != Аладори ) && (%Actor.name% != Наталья ) && (%Actor.name% != Магура ))
    osend %actor%  Торба из %word% сакуры протекла у вас между пальцев и снова мирно улеглась на земле.
    return 0
    halt
  else
    wait 1
    oecho ____&KПорыв&n ветра сорвал с торбы несколько %word%.
  end
~
#50077
Сумка Рогнеды - Огромадный баул~
1 gjp 100
~
if (%actor.level% > 30 ) && (%actor.vnum% == -1 )
  halt
end
if %actor.name% != Рогнеда && %actor.name% != Гинор
  osend %actor%  Вам не удалось взять баул, ну очень уж он огромадный...
  return 0
  halt
else
  osend %actor% Вы взяли баул, он оказался почти невесомым, несмотря на свои размеры...
  oechoaround %actor% %actor.iname% взял%actor.g% баул, он оказался почти невесомым, несмотря на свои размеры...
end
~
#50078
именной шмот - Хромунд~
1 gjp 100
~
if (%actor.level% > 30)
  halt
end
if ( %actor.name% != Шана)
  *%self.val1% = 0
  otransform %self.vnum%
  osend %actor% _Магический знак на шкатулке засветился ярко-красным светом.
  *return 0
  halt
end
wait 1
set owner %self.worn_by%
if (%owner.name% == Шана )
  halt
end
oechoaround %actor% _Магический знак на %self.pname% на мгновение засветился тусклым изумрудным светом.
osend %actor%  _Магический знак на %self.pname% на мгновение засветился тусклым изумрудным светом.
~
#50079
Именной шмот - Делан~
1 gjop 100
~
if ((%actor.level% > 30) && (%actor.level% == -1))
  halt
end
if %actor.name% != Делан && %actor.name% != Нелад
  otransform 50079
  osend %actor%  Саквояж потрошителя приоткрылся.
  osend %actor%  Вас передернуло от страха и вы передумали подбирать чужое...
  if ( %actor.clan% != нд )
    oforce %actor% drop саквояж
    return 0
  end
else
  set owner %self.worn_by%
  if %owner.name% == Делан || %owner.name% == Нелад
    halt
  end
  wait 1
  osend %actor% Вы достали саквояж саквояж &Rп&Kо&Rт&Kр&Rо&Kш&Rи&Kт&Rе&Kл&Rя&n и начали медленно раскладывать инструменты.
  oechoaround %actor% %actor.name% достал%actor.g% саквояж &Rп&Kо&Rт&Kр&Rо&Kш&Rи&Kт&Rе&Kл&Rя&n и начал%owner.g% медленно раскладывать инструменты.
end
~
#50080
дали деньги для входа~
0 m 1
~
say Прости, пока что вход закрыт.
say Вам дальше по корридору :)
return 0
halt
wait 1
if %amount% == 100
  улы
  wait 1
  say Хочешь быть зрителем ? Ну что ж, можно это устроить.
  msend %actor% Детина приоткрыл дверь, и вы быстро шмыгнули в проем.
  mechoaround %actor% Детина приоткрыл дверь и %actor.name% быстро шмыгнул%actor.g% в проем.
~
#50081
проверка душика~
0 e 100
~
if %actor.is_killer%
  eval dushik 1
else
  eval dushik 0
endif
dg_affect %actor.name% невидимость 10 100
~
#50082
Именной шмот - Огалай~
1 gjp 100
~
if (%actor.level% > 30 ) && (%actor.vnum% == -1 )
  halt
end
if ((%actor.name% != Огалай ) && (%actor.name% != Илья ) && (%actor.name% != Остомир ))
  osend %actor% _&RКамышовый кот приподнял лапу и злобно зашипел.&n
  return 0
  halt
else
  wait 1
  *oecho Камышовый кот зажмурил глаза и замурлыкал.
~
#50083
вход в комнату к двум~
2 g 100
~
if %actor.vnum% != -1
  halt
end
set schet 0
set igrok %self.people%
while %igrok%
  if %igrok.vnum% == -1
    eval schet %schet%+1
  end
  * wecho %igrok.name%  тут есть! %schet% - равен счет ! %actor.vnum% - внум
  set igrok %igrok.next_in_room%
done
if %schet% > 1
  return 0
  wsend %actor% Вы не можете туда пройти, там занято.
else
  return 1
end
halt
~
#50084
не_пускает_к_победителю~
2 g 100
~
if %actor.vnum% != -1
  halt
end
set schet 0
set igrok %self.people%
while %igrok%
  if %igrok.vnum% == -1
    eval schet %schet%+1
  end
  * wecho %igrok.name%  тут есть! %schet% - равен счет ! %actor.vnum% - внум
  set igrok %igrok.next_in_room%
done
if %schet% > 0
  return 0
  wsend %actor% Вы не можете туда пройти, там занято.
else
  return 1
end
~
#50085
попытка взять камень~
1 g 100
~
osend %actor% Вы не можете взять Этот камень.
return 0
~
#50086
Именной шмот - Яснолик~
1 gjp 100
~
if (%actor.level% > 30 ) && (%actor.vnum% == -1 )
  halt
end
if %actor.name% != Яснолик
  osend %actor%  Вы лишь обожгли руки, прикоснувшись к суме!
  return 0
  halt
end
~
#50087
Божок~
1 c 4
божок~
wait 1
if %actor.name% != ховард
  halt
end
oecho Статуэтка божка зло прищурилась и зыркнула на %arg%!
~
#50088
Именной шмот - Глузд~
1 gjp 100
~
if (%actor.level% > 30 ) && (%actor.vnum% == -1 )
  halt
end
if %actor.name% != Глузд
  osend %actor%  Сумка черной ночи спряталась от ваших пальцев в непроглядном мраке...
  return 0
  halt
else
  oechoaround %actor% Сумка чёрной ночи радостно замахала лямкями...
  osend %actor% Сумка чёрной ночи радостно замахала лямкями...
end
~
#50089
Пугалка~
1 c 2
пугать~
wait 1
oecho Горыня Змеевич прилетел с севера.
oecho &RГорыня Змеевич ЧРЕЗВЫЧАЙНО БОЛЬНО укусил вас.&n
oecho Это действительно БОЛЬНО!
oecho Горыня Змеевич вцепился вам в глотку, загрыз досмерти.
oecho Вы мертвы!  Hам очень жаль...
oecho Вы потеряли 66666666 очков опыта.
oecho _
oecho 0) Отсоединиться.
oecho 1) Начать игру.
oecho 2) Ввести описание Вашего персонажа.
oecho 3) Узнать историю.
oecho 4) Изменить пароль.
oecho 5) Удалить персонаж.
%actor.wait(3)%
~
#50090
разжигание костра~
0 z 100
~
разжечь
purg %self%
~
#50091
используем огниво~
1 c 100
поджечь~
wait 1
osend %actor% Вы попробывали воспользоваться огнивом.
oechoaround %actor% %actor.iname% попробывал%actor.a% воспользоваться огнивом.
oload mob 50090
calcuid razhech 50090 mob
attach 50090 %razhech.id%
run 50090 %razhech.id%
~
#50092
Триг перстня~
1 j 100
~
if (( %actor.level% >= 31) || !%actor% || (%actor.vnum% != -1))
  halt
end
return 0
osend %actor% Вы едва не сгорели, попытавшись примерить перстень!
%actor.hitp(1)%
oechoaround %actor%   %actor.name% едва не сгорел%actor.g% в ослепительной вспышке, когда попытал%actor.u% надеть перстеть Стрибога!
oecho Мда, мания величия до добра не доводит...
~
#50093
Второй триг перстня~
1 j 100
~
wait 1
osend %actor% Яркое сияние озарило Вас.
osend %actor% Славьте Стрибога!
~
#50094
Растворитель~
1 c 1
применить~
wait 1
if !%arg.contains(растворитель)%
  osend %actor% Что вы хотите применить?
  halt
end
osend %actor% Вы решились применить растворитель!
osend %actor% Вас мама не учила не трогать незнакомые вещи?..
foreach target %self.pc%
  if %target% != %actor%
    wait 1
    oecho %target.name% растворил%target.u% на Ваших глазах.
  end
done
%actor.wait(6)%
~
#50095
Перезарядка посоха~
1 c 1
перезарядить~
wait 1
osend %actor% Вы вставили в посох новую обойму и молодецки крепко прихлопнули ее ладонью.
oecho &GПосох распорядителя турнира засветился изумрудным светом.&n
wait 1
otransform 50092
~
#50096
именная сумка - Эрин~
1 gjp 100
~
if (%actor.level% > 30 ) && (%actor.vnum% == -1 )
  halt
end
if %actor.name% != Вета && %actor.name% != Эрин && %actor.name% != Меньши
  osend %actor% &RПлюшевый совенок возмущенно заклекотал и ОЧЕНЬ БОЛЬНО укусил вас за нос!&n
  return 0
  halt
else
  oechoaround %actor% &YПлюшевый совенок радостно захлопал крыльями и воинственно заклекотал в  ожидании новых побед &n
end
~
#50097
Пугалка 2~
1 c 2
пугать~
wait 1
oecho Делор прилетел с запада.
oecho Волонд прилетел с запада.
oecho Двойник Волонда прилетел с запада
oecho Двойник Волонда прилетел с запада
oecho Двойник Волонда прилетел с запада
oecho Двойник Волонда прилетел с запада
oecho Малагант прилетел с запада
oecho Двойник Малаганта прилетел с запада
oecho Двойник Малаганта прилетел с запада
oecho Двойник Малаганта прилетел с запада
oecho Двойник Малаганта прилетел с запада
oecho Шелди прилетел с запада
oecho Двойник Шелди прилетел с запада
oecho Двойник Шелди прилетел с запада
oecho Двойник Шелди прилетел с запада
oecho Двойник Шелди прилетел с запада
oecho Пилатий прилетел с запада
oecho Жалын прилетел с запада
~
$~
