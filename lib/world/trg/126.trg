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
ловушка (дверь)~
2 i 100
0~
wait 1
wechoaround %actor% Как только %actor.name% провернул%actor.g% ключ в замке, пол под Вами задрожал.
wsend %actor.name% Проворачивая ключ в замке, Вы услышали, как что-то тихонько там щелкнуло. 
wsend %actor.name% И вдруг пол задрожал у Вас под ногами.
if (%random.99% <= 15) 
  wait 1
  wechoaround %actor% Вдруг каменная плита под Вашими ногами провалилась, и Вы скользнули в темень
  wechoaround %actor% внезапно разверзшегося колодца.
  wsend %actor.name% Каменная плита пола провалилась под Вашими ногами, и Вы скользнули в темень
  wsend %actor.name% внезапно разверзшегося колодца.
  wait 1
else
  wait 2s
  wecho Однако, через пару ударов сердца все успокоилось. 
   halt
end
~
#12602
ловушка (страж)~
0 f 100
~
mecho Умирая, страж успел что-то пробормотать.
wait 2
if (%random.100% <= 99) 
  mecho Вдруг каменная плита под Вашими ногами провалилась, и Вы скользнули в темень
  mecho внезапно разверзшегося колодца.
  eval fchar %self.people%
  while %fchar%
    if %fchar.vnum%==-1
      mteleport %actor.name% 12614
    end
    eval pc %fchar.next_in_room%
    if %pc.id% && %pc.id%!=%fchar.id%
      makeuid fchar %pc.id%
    else
      unset fchar
    end
  done
  halt
else
  mecho Но ничего особенного не произошло.
   halt
end
~
#12603
зашел к страже~
0 r 100
0~
wait 1
if (%direction%==west) 
  mecho Страж хмуро поглядел на Вас, и произнес:
  mecho _- Путник, если хочешь пройти - назови пароль!
  mecho Или покажи знак, позволяющий пройти.
  attach 12604 %self.id%
  halt
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
  halt
end
~
#12606
вход на арену~
2 c 0
арена~
wait 1
wechoaround %actor% Задержав на мгновение дыхание, %actor.name% шагнул%actor.g% в огненный круг.
wsend %actor.name% Набравшись смелости, Вы шагнули в огненный круг.
wait 1
switch %random.4%
  case 1
wteleport %actor.name% 12604
wat 12604 %echoaround% %actor% %actor.name% появил%actor.u% из ниоткуда.
    break
  case 2
wteleport %actor.name% 12624
wat 12624 %echoaround% %actor% %actor.name% появил%actor.u% из ниоткуда.
    break
  case 3
wteleport %actor.name% 12646
wat 12646 %echoaround% %actor% %actor.name% появил%actor.u% из ниоткуда.
    break
  default
wteleport %actor.name% 12656
wat 12656 %echoaround% %actor% %actor.name% появил%actor.u% из ниоткуда.
  break
done
wait 1
%send% %actor% Вы очутились на ристалище Незримого Дозора.
~
#12608
вход ветеранов~
2 c 0
пароль~
wait 1
if !(%arg.contains(деньночь)%)
   wechoaround %actor% %actor.name% что-то прошептал%actor.g%.
   wsend %actor.name%  Чего, чего?
   return 0
   halt
end
if %actor.clan%!=НД || %actor.clanrank%<7
 wecho Стражник зевнул.
 wsend %actor.name%  _- Вход только для ветеранов Ночного Дозора.
 return 0
 halt
end
wechoaround %actor% %actor.name% что-то негромко сказал%actor.g%.
wechoaround %actor% Самоцветы ярко засветились, дверь открылась и %actor.name% шагнул%actor.g% вперед.
wechoaround %actor% После чего дверь снова закрылась наглухо.
wsend %actor.name% Сверкнули самоцветы, дверь открылась перед Вами.
wait 1s
wteleport %actor.name% 12636
wait 1
wsend %actor.name% Вы прошли мимо дверей, и оказались в покоях ветеранов Дозора.
wat 12636 wechoaround %actor% %actor.name% приш%actor.y% с юга.
~
#12609
Самоцветы~
0 k 35
~
eval damag 30+%random.30%
msend %actor% Из самоцвета на двери вырвалась молния и поразила Вас.
%actor.hitp(-%damag%)%
~
#12610
from trap~
2 c 0
назад~
wait 1
if %actor.clan%== НД
%teleport% %actor.name% 12662
end
~
#12611
потереть самоцвет~
1 c 3
потереть~
wait 1
if (%actor.clan%!=нд)
  oechoaround %actor% %actor.name% начал%actor.u% тереть черный самоцвет. С ним все в порядке?
  osend %actor% Вы начали тереть самоцвет. Достойное занятие.
  halt
end
  oechoaround %actor% %actor.name% начал%actor.g% тереть самоцвет и тот превратился в огромную сколопендру.
  osend %actor% Вы потерли самоцвет и он превратился в огромную сколопендру!
  oload mob 12611
opurge %self%
~
#12612
погладить сколопендру~
0 c 0
погладить~
wait 1
if (%actor.clan%!=нд)
  mechoaround %actor% %actor.name% попробовал%actor.g% погладил сколопендру, но та СМЕРТЕЛЬНО укусила его за палец.
  msend %actor% Вы попробовали погладить сколопенлру, но она СМЕРТЕЛЬНО укусила Вас за палец!
  halt
end
mechoaround %actor% %actor.name% осторожно погладил%actor.g% сколопендру. Сколопендра с громким хлопком изчезла.
msend %actor% Вы осторожно погладили сколопендру. Сколопендра с громким хлопком исчезла.
mload obj 12635
mpurge %self%
~
#12613
взяли самоцвет~
1 g 100
~
wait 1
if %actor.clan%==нд
halt
end
purge %self.id%
~
$~
