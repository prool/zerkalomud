#12600
выход с арены~
2 c 0
войти~
wait 1
wechoaround %actor% %actor.name% вош%actor.y% в круг и исчез%actor.q%.
wsend %actor.name% Яркая вспышка ослепила Вас на мгновение.
wait 1
wteleport %actor.name% 12664
wsend %actor.name% Вы очутились у портала на арену.
~
#12601
зашли к мастеру боевых искусств~
0 q 100
~
wait 1
if %actor.name%==Делан
  аплодисмент %actor.name%
elseif %actor.clan%==нд && %actor.clanrank% < 6
  поклон %actor.name%
end
tell %actor.name% Приветствую тебя %actor.name%!
tell %actor.name% Чтобы попасть на арену напиши "&Rарена&C".&n
if %actor.clan%==нд && %actor.clanrank% < 4
  tell %actor.name% Если хочешь, чтобы я кого-нибудь привел на арену скажи "&Rда&C".&n
  tell %actor.name% Если хочешь, чтобы я убрал мобов с арены скажи "&Rубрать&C".&n
end
~
#12602
даем разрешение на ношение клан стафа~
1 c 2
разрешить~
wait 1
if %actor.clan%==нд && actor.clanrank < 4
  osend %actor.name% Вы разрешили использовать %self.vname% посторонним.
  detach 12613 %self.id%
  detach 12602 %self.id%
end
~
#12603
зашел к страже~
0 r 100
0~
wait 1
if (%direction%==west || %direction%==south)
  mecho Страж хмуро поглядел на Вас, и произнес:
  mecho _- Путник, если хочешь пройти - назови пароль!
  mecho Или покажи знак, позволяющий пройти.
  * attach 12604 %self.id%
end
~
#12604
дать обломок знака~
0 j 100
~
if (%object.vnum% == 12400)
  wait 1
  mpurge %object%
  wait 1s
  tell %actor.name% Да, это тот самый знак, %actor.name%!
  tell %actor.name% Но он поврежден... Как ты посмел сломать его?!
  гнева
  wait 2s
  mkill %actor.name%
  halt
else
  wait 1
  say Конечно мне понятно, что ты хочешь попасть дальше.
  say Но это не то что надо.
  eval getobject %object.name%
  броси %getobject.car%.%getobject.cdr%
end
~
#12605
говорим с мастером боевых искусств~
0 d 1
*~
wait 1
if %actor.vnum% != -1 || %actor.clan%!=нд || %actor.clanrank% > 3
  halt
end
switch %speech%
  case да
    tell %actor.name% Ну, чтож, вот тебе список кандидатов:
    tell %actor.name% 1.  Царь морской
    tell %actor.name% 2.  Царь морской и 3 шторма
    tell %actor.name% 3.  Царь морской и 6 штормов
    tell %actor.name% 4.  Родительница скелетов
    tell %actor.name% 5.  Красный двухголовый змей
    tell %actor.name% 6.  Зеленый двухголовый змей
    tell %actor.name% 7.  Белый двухголовый змей
    tell %actor.name% 8.  Семиглавый змей
    tell %actor.name% 9.  Злобный и Мерзкий демоны
    tell %actor.name% 10. Великан Дубыня с хранителями
    tell %actor.name% 11. Великан Горыня с хранителями
    tell %actor.name% 12. Великан Усыня с хранителями
    tell %actor.name% 13. Дубыня + Горыня + Усыня Змеевичи (р2)
    tell %actor.name% 14. Рарог
    tell %actor.name% 15. Стратим
    tell %actor.name% 16. Алконост
    tell %actor.name% 17. Буря Яга
    tell %actor.name% 18. Рута и компани
    tell %actor.name% 19. Финист
    tell %actor.name% 20. Огненный змей
    tell %actor.name% Чтобы сражаться скажи: "&Rсражаться <номер>&C"&n
  break
  case убрать
    emote взмахнул рукой
    eval room126 %world.room(12602)%
    foreach vict126 %room126.npc%
      mat 12602 mpurge %vict126%
    done
    say Убрал мобов с арены.
  break
done
if %speech.contains(сражаться)%
  if  %world.people(12602)% != 0 
    say Но, на арене вас уже ждут!
    halt
  end
  if %speech.contains(20)% 
    emote взмахнул рукой
    mat 12602 mload mob 12646
    say Огненный змей ждет вас на арене.
  elseif %speech.contains(19)% 
    emote взмахнул рукой
    mat 12602 mload mob 12644
    say Финист ждет вас на арене.
  elseif %speech.contains(18)% 
    emote взмахнул рукой
    mat 12602 mload mob 12632
    mat 12602 mload mob 12633
    mat 12602 mload mob 12634
    mat 12602 mload mob 12635
    mat 12602 mload mob 12636
    say Рута и компани ждут вас на арене.
  elseif %speech.contains(17)% 
    emote взмахнул рукой
    mat 12602 mload mob 12637
    mat 12602 mload mob 12638
    mat 12602 mload mob 12638
    say Буря-Яга ждет вас на арене.
  elseif %speech.contains(16)%
    emote взмахнул рукой
    mat 12602 mload mob 12631
    say Алконост ждет вас на арене.
  elseif %speech.contains(15)% 
    emote взмахнул рукой
    mat 12602 mload mob 12630
    say Стратим ждет вас на арене.
  elseif %speech.contains(14)%
    emote взмахнул рукой
    mat 12602 mload mob 12629
    say Рарог ждет вас на арене.
  elseif %speech.contains(13)%
    emote взмахнул рукой
    mat 12602 mload mob 12626
    mat 12602 mload mob 12627
    mat 12602 mload mob 12628
    say Дубыня, Усыня, Горыня Змеевичи ждут вас на арене.
  elseif %speech.contains(12)%
    mat 12602 mload mob 12624
    mat 12602 mload mob 12625
    mat 12602 mload mob 12625
    mat 12602 mload mob 12625
    emote взмахнул рукой
    say Великан Усыня с хранителями ждут вас на арене.
  elseif %speech.contains(11)%
    emote взмахнул рукой
    mat 12602 mload mob 12619
    mat 12602 mload mob 12623
    mat 12602 mload mob 12623
    mat 12602 mload mob 12623
    say Великан Горыня с хранителями ждут вас на арене.
  elseif %speech.contains(10)%
    emote взмахнул рукой
    mat 12602 mload mob 12617
    mat 12602 mload mob 12618
    mat 12602 mload mob 12618
    mat 12602 mload mob 12618
    say Великан Дубыня с хранителями ждут вас на арене.
  elseif %speech.contains(9)%
    mat 12602 mload mob 12620
    mat 12602 mload mob 12621
    emote взмахнул рукой
    say Злобный и мерзкий демоны ждут вас на арене.
  elseif %speech.contains(8)%
    emote взмахнул рукой
    mat 12602 mload mob 12600
    say Семиглвый змей ждет вас на арене.
  elseif %speech.contains(7)%
    emote взмахнул рукой
    mat 12602 mload mob 12616
    say Белый двухголовый змей ждет вас на арене.
  elseif %speech.contains(6)%
    emote взмахнул рукой
    mat 12602 mload mob 12615
    say Зеленый двухголовый змей ждет вас на арене.
  elseif %speech.contains(5)%
    emote взмахнул рукой
    mat 12602 mload mob 12614
    say Красный двухголовый змей ждет вас на арене.
  elseif %speech.contains(4)%
    emote взмахнул рукой
    mat 12602 mload mob 12639
    say Родительница скелетов ждет вас на арене.
  elseif %speech.contains(3)%
    emote взмахнул рукой
    mat 12602 mload mob 12612
    mat 12602 mload mob 12613
    mat 12602 mload mob 12613
    mat 12602 mload mob 12613
    mat 12602 mload mob 12613
    mat 12602 mload mob 12613
    mat 12602 mload mob 12613
    say Царь морской и 6 штормов ждут вас на арене.
  elseif %speech.contains(2)%
    emote взмахнул рукой
    mat 12602 mload mob 12612
    mat 12602 mload mob 12613
    mat 12602 mload mob 12613
    mat 12602 mload mob 12613
    say Царь морской и 3 шторма ждут вас на арене.
  elseif %speech.contains(1)%
    emote взмахнул рукой
    mat 12602 mload mob 12612
    say Царь морской ждет вас на арене.
  else
    say Я не понял, с кем вы хотите сражаться?
    вопрос %actor.name%
  end
end
~
#12606
вход на арену~
2 c 0
арена~
wait 1
if !%actor.rentable%
  %send% %actor.name% В случае боевых действий смерть на арене приводит к тяжелым результатам...
  halt
end
wechoaround %actor% Задержав на мгновение дыхание, %actor.name% шагнул%actor.g% в огненный круг.
wsend %actor.name% Набравшись смелости, Вы шагнули в огненный круг.
wait 1
switch %random.4%
  case 1
    wteleport %actor% 12604 horse
    wat 12604 %echoaround% %actor% %actor.name% появил%actor.u% из ниоткуда.
  break
  case 2
    wteleport %actor% 12624 horse
    wat 12624 %echoaround% %actor% %actor.name% появил%actor.u% из ниоткуда.
  break
  case 3
    wteleport %actor% 12646 horse
    wat 12646 %echoaround% %actor% %actor.name% появил%actor.u% из ниоткуда.
  break
  default
    wteleport %actor% 12656 horse
    wat 12656 %echoaround% %actor% %actor.name% появил%actor.u% из ниоткуда.
  break
done
wait 1
%send% %actor.name% Вы очутились на ристалище Незримого Дозора.
~
#12607
отключение триггеров~
2 c 0
надавить~
wait 1
if !(%arg.contains(камен)%)
  wechoaround %actor% %actor.name% начал%actor.g% что-то нащупывать на стене.
  wsend %actor.iname% На что вы хотите надавить?
  return 0
  halt
end
%actor.wait(2)%
wechoaround %actor% %actor.name% нащупал%actor.g% что-то на стене, после чего раздался тихий щелчок.
wsend %actor.iname% Вы коснулись стены, нащупали нужный камень, слегка по нему стукнули. Раздался тихий щелчок.
detach 12609 %world.room(12666)%
detach 12609 %world.room(12667)%
detach 12609 %world.room(12668)%
end
~
#12608
включение триггеров~
2 e 100
~
wait 1
%actor.wait(2)%
wait 2
if ( %world.people(12666)% == 0 ) && ( %world.people(12667)% == 0 ) && ( %world.people(12668)% == 0 )
  wecho Стоило %actor.dname% наступить на один из камней как послышался резкий щелчок.
  attach 12609 %world.room(12666)%
  attach 12609 %world.room(12667)%
  attach 12609 %world.room(12668)%
end
~
#12609
триггер на дротики~
2 g 100
~
wait 1
%actor.wait(2)%
wecho Внезапно из замаскированных в стене бойниц вылетел рой дротиков.
wecho Уклоняться практически бесполезно, Вы истекаете кровью...
foreach victim %self.all%
  if (%victim.maxhitp% < %victim.hitp%)
    eval dam126 %victim.hitp%*17/20
  else
    eval dam126 %victim.maxhitp%*17/20
  end
  wdamage %victim% %dam126%
done
~
#12610
from trap~
2 c 0
назад~
wait 1
if (%actor.clan% == нд ) && %actor.rentable%
  wteleport %actor% 12662
end
~
#12611
потереть самоцвет~
1 c 3
потереть~
wait 1
if (%actor.clan%!=НД)
  oechoaround %actor% %actor.name% начал%actor.u% тереть черный самоцвет. С ним все в порядке?
  osend %actor% Вы начали тереть самоцвет. Достойное занятие.
  halt
end
if %world.curmobs(12611)% < 50
  oechoaround %actor% %actor.name% начал%actor.g% тереть самоцвет и тот превратился в огромную сколопендру.
  osend %actor% Вы потерли самоцвет и он превратился в огромную сколопендру!
  oload mob 12611
  wait 1
  opurge %self%
else
  osend %actor% Вы потерли самоцвет но ничего не произошло.
end
~
#12612
погладить сколопендру~
0 c 0
погладить~
wait 1
if (%actor.clan%!=НД)
  mechoaround %actor% %actor.name% попробовал%actor.g% погладил сколопендру, но та СМЕРТЕЛЬНО укусила его за палец.
  msend %actor% Вы попробовали погладить сколопендру, но она СМЕРТЕЛЬНО укусила Вас за палец!
  halt
end
mechoaround %actor% %actor.name% осторожно погладил%actor.g% сколопендру. Сколопендра с громким хлопком изчезла.
msend %actor% Вы осторожно погладили сколопендру. Сколопендра с громким хлопком исчезла.
mload obj 12635
wait 1
mpurge %self%
~
#12613
клан шмот НД подняли с земли или взяли из контейнера~
1 g 100
~
* триг дикеит клан-стаф при попытке взять его игроком нейтрально-враждебным к клану НД
if ( %actor.vnum% != -1 )
  halt
end
wait 1
* союзники если такие есть -- могут носить
if %actor.clan% == СО1 || %actor.clan% == СО2 || %actor.clan% == СО3
  halt
end
* Не НД и не союзники -- не могут
if ( %actor.clan% != нд )
  oecho Внезапно %self.iname% исчез%self.q% в яркой вспышке.
  wait 1
  opurge %self.id%
end
~
#12614
антуражные взмахи когтями~
0 k 40
~
%echo%  \&rУдары когтей %self.rname% оставляют в воздухе кровавые росчерки.\&n
~
#12615
баттлетригг Усыни~
0 k 100
~
eval sniper %random.pc%
if (%sniper.class% == 9)
  eval value %sniper.cha%-5
elseif (%sniper.class% == 3)
  eval value %sniper.cha%-9
elseif (%sniper.class% == 11)
  eval value %sniper.cha%-13
elseif (%sniper.class% == 10)
  eval value %sniper.cha%-17
elseif (%sniper.class% == 5)
  eval value %sniper.cha%-21
else 
  eval value 1+1
end
if (%value% < 2)
  eval value 1+1
end
if (%random.100% < %value%)
  msend %sniper.name% Вы метким ударом повредили язык Усыне.
  mechoaround %sniper.name% %sniper.name% метким ударом повредил%sniper.g% Усыне язык.
  detach 12615 %self.id%
end
unset value
unset sniper
if %random.9% == 1
  eval target %random.pc% 
  dg cast 'кислота' %target.name%
  unset target
end
~
#12616
баттлетригг Дубыни (3 головы)~
0 k 100
~
eval sniper %random.pc%
if (%sniper.class% == 9)
  eval value %sniper.cha%
elseif (%sniper.class% == 3)
  eval value %sniper.cha%-4
elseif (%sniper.class% == 11)
  eval value %sniper.cha%-8
elseif (%sniper.class% == 10)
  eval value %sniper.cha%-12
elseif (%sniper.class% == 5)
  eval value %sniper.cha%-16
else 
  eval value 1+1
end
if (%value% < 2)
  eval value 1+1
end
if (%random.100% < %value%)
  msend %sniper.name% Вы метким ударом снесли Дубыне левую голову!
  mechoaround %sniper.name% %sniper.name% метким ударом снес%sniper.g% Дубыне левую голову!
  attach 12617 %self.id%
  detach 12616 %self.id%
end
unset value
unset sniper
if %random.20% == 1
  dg cast 'исцел' дубыня
  dg cast 'исцел' усыня
  dg cast 'исцел' горыня
  mecho Правая голова Дубыни произнесла исцеляющее заклинание!
end
if %random.15% == 1
  dg cast 'масс слеп' 
  mecho Левая голова Дубыни произнесла ослепляющее заклинание!
end
~
#12617
баттлетригг Дубыни (2 головы)~
0 k 100
~
eval sniper %random.pc%
if (%sniper.class% == 9)
  eval value %sniper.cha%-3
elseif (%sniper.class% == 3)
  eval value %sniper.cha%-7
elseif (%sniper.class% == 11)
  eval value %sniper.cha%-11
elseif (%sniper.class% == 10)
  eval value %sniper.cha%-15
elseif (%sniper.class% == 5)
  eval value %sniper.cha%-19
else 
  eval value 1+1
end
if (%value% < 2)
  eval value 1+1
end
if (%random.100% < %value%)
  msend %sniper.name% Вы метким ударом снесли Дубыне правую голову!
  mechoaround %sniper.name% %sniper.name% метким ударом снес%sniper.g% Дубыне правую голову!
  detach 12617 %self.id%
end
unset value
unset sniper
if %random.20% == 1
  dg cast 'исцел' дубыня
  dg cast 'исцел' усыня
  dg cast 'исцел' горыня
  mecho Правая голова Дубыни произнесла исцеляющее заклинание!
end
~
#12618
баттлетригг Горыни (6 голов)~
0 k 100
~
eval sniper %random.pc%
if (%sniper.class% == 9)
  eval value %sniper.cha%
elseif (%sniper.class% == 3)
  eval value %sniper.cha%-4
elseif (%sniper.class% == 11)
  eval value %sniper.cha%-8
elseif (%sniper.class% == 10)
  eval value %sniper.cha%-12
elseif (%sniper.class% == 5)
  eval value %sniper.cha%-16
else 
  eval value 1+1
end
if (%value% < 2)
  eval value 1+1
end
if (%random.100% < %value%)
  msend %sniper.name% Вы метким ударом снесли Горыне шестую голову!
  mechoaround %sniper.name% %sniper.name% метким ударом снес%sniper.g% Горыне шестую голову!
  attach 12619 %self.id%
  detach 12618 %self.id%
end
unset value
unset sniper
if %random.20% == 1
  mecho Шестая голова Дубыни произнесла заклинание суда!
  dg cast 'суд бог' 
end
if %random.19% == 1
  mecho Пятая голова Дубыни дыхнула огнем!
  dg cast 'огн пот' 
end
if %random.18% == 1
  mecho Четвертая голова Дубыни вызвала метеоритный дождь!
  dg cast 'метеор дож' 
end
if %random.17% == 1
  mecho Третья голова Дубыни разгневалась!
  eval target %random.pc% 
  dg cast 'гне бог' %target.name%
  unset target
end
if %random.16% == 1
  mecho Вторая голова Дубыни плюнула огненным шаром!
  eval target %random.pc% 
  dg cast 'огн шар' %target.name%
  unset target
end
~
#12619
баттлетригг Горыни (5 голов)~
0 k 100
~
eval sniper %random.pc%
if (%sniper.class% == 9)
  eval value %sniper.cha%-1
elseif (%sniper.class% == 3)
  eval value %sniper.cha%-5
elseif (%sniper.class% == 11)
  eval value %sniper.cha%-9
elseif (%sniper.class% == 10)
  eval value %sniper.cha%-13
elseif (%sniper.class% == 5)
  eval value %sniper.cha%-17
else 
  eval value 1+1
end
if (%value% < 2)
  eval value 1+1
end
if (%random.100% < %value%)
  msend %sniper.name% Вы метким ударом снесли Горыне пятую голову!
  mechoaround %sniper.name% %sniper.name% метким ударом снес%sniper.g% Горыне пятую голову!
  attach 12620 %self.id%
  detach 12619 %self.id%
end
unset value
unset sniper
if %random.18% == 1
  mecho Пятая голова Дубыни дыхнула огнем!
  dg cast 'огн пот' 
end
if %random.17% == 1
  mecho Четвертая голова Дубыни вызвала метеоритный дождь!
  dg cast 'метеор дож' 
end
if %random.16% == 1
  mecho Третья голова Дубыни разгневалась!
  eval target %random.pc% 
  dg cast 'гне бог' %target.name%
  unset target
end
if %random.15% == 1
  mecho Вторая голова Дубыни плюнула огненным шаром!
  eval target %random.pc% 
  dg cast 'огн шар' %target.name%
  unset target
end
~
#12620
баттлетригг Горыни (4 головы)~
0 k 100
~
eval sniper %random.pc%
if (%sniper.class% == 9)
  eval value %sniper.cha%-2
elseif (%sniper.class% == 3)
  eval value %sniper.cha%-6
elseif (%sniper.class% == 11)
  eval value %sniper.cha%-10
elseif (%sniper.class% == 10)
  eval value %sniper.cha%-14
elseif (%sniper.class% == 5)
  eval value %sniper.cha%-18
else 
  eval value 1+1
end
if (%value% < 2)
  eval value 1+1
end
if (%random.100% < %value%)
  msend %sniper.name% Вы метким ударом снесли Горыне четвертую голову!
  mechoaround %sniper.name% %sniper.name% метким ударом снес%sniper.g% Горыне четвертую голову!
  attach 12621 %self.id%
  detach 12620 %self.id%
end
unset value
unset sniper
if %random.16% == 1
  mecho Четвертая голова Дубыни вызвала метеоритный дождь!
  dg cast 'метеор дож' 
end
if %random.15% == 1
  mecho Третья голова Дубыни разгневалась!
  eval target %random.pc% 
  dg cast 'гне бог' %target.name%
  unset target
end
if %random.14% == 1
  mecho Вторая голова Дубыни плюнула огненным шаром!
  eval target %random.pc% 
  dg cast 'огн шар' %target.name%
  unset target
end
~
#12621
баттлетригг Горыни (3 головы)~
0 k 100
~
eval sniper %random.pc%
if (%sniper.class% == 9)
  eval value %sniper.cha%-3
elseif (%sniper.class% == 3)
  eval value %sniper.cha%-7
elseif (%sniper.class% == 11)
  eval value %sniper.cha%-11
elseif (%sniper.class% == 10)
  eval value %sniper.cha%-15
elseif (%sniper.class% == 5)
  eval value %sniper.cha%-19
else 
  eval value 1+1
end
if (%value% < 2)
  eval value 1+1
end
if (%random.100% < %value%)
  msend %sniper.name% Вы метким ударом снесли Горыне третью голову!
  mechoaround %sniper.name% %sniper.name% метким ударом снес%sniper.g% Горыне третью голову!
  attach 12622 %self.id%
  detach 12621 %self.id%
end
unset value
unset sniper
if %random.14% == 1
  mecho Третья голова Дубыни разгневалась!
  eval target %random.pc% 
  dg cast 'гне бог' %target.name%
  unset target
end
if %random.13% == 1
  mecho Вторая голова Дубыни плюнула огненным шаром!
  eval target %random.pc% 
  dg cast 'огн шар' %target.name%
  unset target
end
~
#12622
баттлетригг Горыни (2 головы)~
0 k 100
~
eval sniper %random.pc%
if (%sniper.class% == 9)
  eval value %sniper.cha%-4
elseif (%sniper.class% == 3)
  eval value %sniper.cha%-8
elseif (%sniper.class% == 11)
  eval value %sniper.cha%-12
elseif (%sniper.class% == 10)
  eval value %sniper.cha%-16
elseif (%sniper.class% == 5)
  eval value %sniper.cha%-20
else 
  eval value 1+1
end
if (%value% < 2)
  eval value 1+1
end
if (%random.100% < %value%)
  msend %sniper.name% Вы метким ударом снесли Горыне вторую голову!
  mechoaround %sniper.name% %sniper.name% метким ударом снес%sniper.g% Горыне вторую голову!
  detach 12622 %self.id%
end
unset value
unset sniper
if %random.12% == 1
  mecho Вторая голова Дубыни плюнула огненным шаром!
  eval target %random.pc% 
  dg cast 'огн шар' %target.name%
  unset target
end
~
#12623
быстрая закупка после рипа~
0 c 1
закупка~
wait 1
say Для тебя у меня ничего нет, прогуляйся к мятельнику.
halt
wait 1
* if %arc.contains(закупка)%
if %actor.clan%!=нд
  msend %actor.name% Совершай покупки в другом месте!
  halt
end
if %actor.bank%<1050
  msend %actor.name% Твоих денег в банке не хватает на закупку!
  halt
end
%actor.bank(-1050)%
* кольчужный шлем = 80 кун
mload obj 12602
* кожаные штаны = 50 кун
mload obj 12603
* кожаные наручи = 60 кун
mload obj 12604 
* кожаные перчатки = 35 кун
mload obj 12605 
* кожаный доспех = 70 кун
mload obj 12606 
* кожаный пояс = 30 кун
mload obj 12607 
* кожаные сапоги = 60 кун
mload obj 12608 
* черный плащ = 35 кун
mload obj 12609 
* кожаная сума = 35 кун
mload obj 12619 
* платок 2 шт. = 15+15=30 кун
mload obj 12628 
mload obj 12628 
* кожаный браслет 2 шт. = 35+35=70 кун
mload obj 12632 
mload obj 12632 
* простое кольцо 2 шт. = 5+5=10 кун
mload obj 12637 
mload obj 12637 
* свиток возврата 3 шт. = 25+25+25=75 кун
mload obj 12621 
mload obj 12621 
mload obj 12621 
* напиток магического зрения = 100 кун
mload obj 12623 
* напиток восстановления сил = 300 кун
mload obj 12624 
* колба с серой жидкостью = 20 кун
mload obj 142
* факел = 10 кун
mload obj 12620 
give all %actor.name%
*end
~
#12624
боевой тригг бури-яги~
0 k 100
~
if %random.3% == 1
  eval spell %random.18%
  if %spell% == 1
    dg_cast 'суд богов'
  elseif %spell% <4
    eval target %random.pc% 
    dg_cast 'гнев богов' %target.name%
    unset target
  elseif %spell% <7
    dg_cast 'за бо'
  elseif %self.hitp% < 15000
    mecho Буря-Яга взяла голубое зелье в левую руку.
    mecho Буря-Яга осушила голубое зелье.
    dg_cast 'крит исц'
    dg_cast 'крит исц'
    dg_cast 'крит исц'
    dg_cast 'крит исц'
    dg_cast 'крит исц'
  end
elseif %random.30% == 1 && %self.hitp% < 12000
  dg_cast 'исцеление'
  mecho Буря-Яга взяла напиток сурья в левую руку.
  mecho Буря-Яга осушила напиток сурья.
end
~
#12625
боевой триг разрыв травы~
0 k 100
~
dg_cast 'сер исц' 
eval target %random.pc% 
dg_cast 'оцеп' %target.name%
unset target
eval target %random.pc% 
dg_cast 'выс жиз' %target.name%
unset target
if %world.curmobs(12638)% <5 && %self.hitp% > 3000
  mecho Разрыв трава разрослась!
  mload mob 12638
  mload mob 12638
  mpurge %self%
end
~
#12626
в бою с родительницей скелетов~
0 k 50
~
switch %random.6%
  case 1
    if %world.curmobs(12640)% < 10
      mecho _Родительница скелетов легко произвела на свет новорожденного скелета.
      mload mob 12640
    end
  break
  case 2
    if %world.curmobs(12641)% < 10
      mecho _Родительница скелетов напряглась, и произвела на свет окрепшего скелета.
      mload mob 12641
    end
  break
  case 3
    if %world.curmobs(12642)% < 10
      mecho _Родительница скелетов в судорогах произвела на свет скелета-война.
      mload mob 12642
    end
  break
  case 4
    if %world.curmobs(12643)% < 10
      mecho _Родительница скелетов изогнулась, и с диким воем родила скелета Ужаса.
      mload mob 12643
    end
  break
  default
  break
done
end
~
#12627
родительница скелетов померла~
0 f 100
~
mecho _Из трупа родительницы скелетов вывалилось несколько недоносков.
mload mob 12640
mload mob 12640
mload mob 12641
mload mob 12642
mload mob 12643
~
#12628
баттлетригг  финиста~
0 k 100
~
eval wai %random.4%*2+4
wait %wai%s
if %self.vnum% == 12644
  mtransform 12645
else
  mtransform 12644
end
~
#12629
боевой тригг огненного змея~
0 k 100
~
set i 0
if %self.hitp% < 10000
  eval i (%self.hitp%)/1000+4
  if !%self.affect(молчание)% && %self.position% > 6 && %random.%i%% < 2
    mecho _Небесное пламя окутало Огненного змея!
    dg_cast 'защ бог'
    dg_cast 'исцел'
  end
end
eval wai %random.3%*2+4
wait %wai%s
mtransform 12646
wait 2s
mtransform 12647
~
#12630
трансформ клан сумки~
1 c 3
трансформ~
* при вводе команды сумка (12619) превращается в мешок (12653)
if %actor.clan% == нд
  osend %actor% Внезапно &K%self.iname%&n ярко вспыхнул%self.g%.
  if (%self.vnum% == 12619)
    otransform 12653
  else
    otransform 12619
  end
end
~
#12631
читать НД доску только НД~
1 c 4
*~
if (%cmd.mudcommand% == читать || %cmd.mudcommand% == read)
  if (%actor.clan% != нд || !%actor.name%)
    wait 1
    if %actor%
      osend %actor% Вам не дозволено читать эту доску сообщений!
    end
  end
end
return 0
~
#12632
поиск НД~
1 c 3
разыскать~
wait 1
if %actor.clan% == нд && %actor.clanrank% < 4
  set ndmember %arg%
  if %ndmember.clan% == нд
    set memberlocation %ndmember.realroom%
    if %ndmember.rentable%
      osend %actor% %ndmember.name% %ndmember.hitp%/%ndmember.maxhitp%H %ndmember.move%/%ndmember.maxmove%M %ndmember.level%L находится: %memberlocation.name%
    else
      osend %actor% %ndmember.name% %ndmember.hitp%/%ndmember.maxhitp%H %ndmember.move%/%ndmember.maxmove%M %ndmember.level%L [БД!] находится: %memberlocation.name%
    end
  end
end
~
$~
