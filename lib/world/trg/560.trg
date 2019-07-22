#56000
стучать~
2 c 1
стучать~
wsend %actor% Вы постучали в ворота.
wechoaround %actor% %actor.name% принялся стучать по воротам.
wait 1s
wecho Вы услышали какую-то возню за воротами..
wait 1s
wecho Из-за ворот раздался жалобный стон :"Вася... Это ты? Опохмелиться принес?"
attach 56001 %self.id%
~
#56001
ответ~
2 d 1
да принес~
wait 2s
wecho Послышалалось лязг засовов и ворота открылись.
wdoor 56020 south purge
wdoor 56020 south room 56021
detach 56001 %self.id% 
detach 56000 %self.id%
~
#56002
закрываем ворота~
2 e 100
~
wait 1
if %direction% == north
  wdoor 56020 south purge  
  wdoor 56020 south room 56021 flags abcd
end
~
#56003
тестовый  тригг~
2 c 1
тест~
*лишний тригг
~
#56004
спустить лестницу~
1 c 4
спустить~
if (%arg.contains(лестницу)%)
  oechoaround %actor% %actor.name% опустил%actor.g% лестницу в черный провал пола.
  osend %actor% Вы опустили лестницу в черный провал пола.
  odoor 56090 down room 56091  
  wait 1s
  opurge %self%
end
osend %actor% Что вы хотите спустить вниз?
~
#56005
приветствие ивасек~
0 r 100
~
wait 1
if !%world.curmobs(56010)%
  halt
end
if (%direction% == up)
  emote расплылся в широкой улыбке
  say Здравствуйте, русичи... Я уж и ждать Вас притомился.
  wait 2s
  emote тяжело вздохнул
  say Вы бы мне опохмелиться принесли, тогда и пойдем. Расскажу что тут где,
  вздох
  wait 1s
  say да как, может еще что присоветую.
end
attach 56006 %self.id%
detach 56005 %self.id%
~
#56006
опохмел ивасек~
0 j 100
~
if !(%actor.vnum% == -1)
  halt
end
if !%world.curmobs(56010)%
  halt
end
if (%object.vnum% == 56026)
  wait 1
  mecho Ивасек жадно приложился к кувшину.
  wait 1s
  switch %actor.sex%
    case 1
      msend %actor% Ивасек задумчиво посмотрел на Вас.
      mechoaround %actor% Ивасек задумчиво посмотрел на %actor.vname%
      say Спасибо, братец, спас меня от напасти.
    break
    case 2
      msend %actor%  Ивасек восхищенно оглядел Вас и поклонился Вам до земли.
      mechoaround %actor% Ивасек восхищенно оглядел %actor.vname% и поклонился ей до земли.
      say Спасибо, сестрица, услужила ты мне.
    break
    default
      mecho Спасибо тебе %actor.name%
    break
  done
  wait 1s
  say Вы наверное видели уже высокий терем, что стоит в южной части двора крепости,
  say так вот там живет Великий Хазарский Полководец. Во многих науках он преуспел, 
  say а особенно в колдовстве черном..
  wait 1s
  say Много напастей он и его слуги принесли русичам. Я слышал что он готовит новый
  say набег на Русь. Останови его пока не поздно. 
  wait 1s
  say Я помогу тебе убить Полководца. Я имею с ним старые счеты.
  следов %actor.name%
  set hero %actor%
  calcuid kalinika 56015 mob
  attach 56010 %kalinika.id%
  remote hero %kalinika.id%
  detach 56006 %self.id%
else
  wait 1
  mecho Ивасек задумчиво повертел в руках %object.iname% и положил в широкий карман... на что-нибудь да сгодится.
  mpurge %object%
end
~
#56007
лоад кувшин~
0 f 100
~
if !(%world.curobjs(56026)%)
  mload obj 56026
end
~
#56008
ковер~
2 c 0
приподнять~
if (%arg.contains(ковер)%)
  wait 1
  wsend %actor% Вы приподняли один из ковров и обнаружили за ним дверь!
  wechoaround %actor% %actor.name% приподнял%actor.g% один из ковров и Вы увидели за ним дверь!
  wdoor 56058 east room 56062
  wait 2t  
  wdoor 56058 east purge
end
wait 1
wsend %actor% Что вы хотите приподнять?
~
#56009
квест на иваська~
0 r 100
~
if !%world.curmobs(56009)%
  wait 5s
  halt
end
wait 1     
switch %actor.sex%
  case 1
    msend %actor% Калиника внимательно посмотрела на Вас.
    mechoaround %actor% Калиника внимательно посмотрела на %actor.vname% 
    emote густо покраснела, отвела глаза и низко поклонилась.
    say Здравствуй, добрый молодец.. Хазары заточили в темнице моего мужа верного, Иваська.
    say Освободи его да помоги нам из неволи выбраться, а я чем смогу - помогу
  break
  case 2
    msend %actor% Калиника низко поклонилась Вам.
    mechoaround %actor% Калиника низко поклонилась %actor.dname% 
    say Здравствуй, сестрица. Хазары заточили в темнице моего мужа верного, Иваська.
    say Освободи его да помоги нам из неволи выбраться, а я чем смогу - помогу
  break
  default
    say Hету секса - нету квеста :)
  break
done
calcuid ivasek 56009 mob
attach 56005 %ivasek.id%
detach 56009 %self.id%
~
#56010
встреча~
0 r 100
~
if !%world.curmobs(56009)%  || %actor% != %hero%
  wait 1s
  halt
end
calcuid ivas 56009 mob 
wait 1s
if %ivas.realroom% != %self.realroom%
  halt
end
mforce %ivas% follow я
wait 1s
mecho Калиника бросилась на шею Иваська.
say Муженек, вот мы и вместе!
wait 1s
say Спасибо тебе %actor.name%, мил человек. Помог ты нам в нашем горе.
wait 1s 
if !%world.curmobs(56010)%
  say Ну вот мы и свободны. Что ж пора нам вернуться домой.
  mforce Ивасек say Спасибо тебе, %hero.name%. Ты сделал благое дело.
  mecho Сказав эти слова Калиника и Ивасек исчезли в неизвестном направлении.
  wait 1
  mpurge %self%
  mpurge %ivas%
  halt
end  
say Вот ключ, не знаю от какой он двери, но должно быть это очень важно, 
say Полководец очень злился когда обнаружил пропажу.
mload obj 56027
дать ключ %hero.name%
wait 1s
mforce Ивасек say Да, кстати. Я слышал что где-то здесь, на втором этаже, есть дверь,
mforce Ивасек say ведущая прямо в хоромы Полководца, минуя широкую лестницу.
mforce Ивасек say Если ты найдешь ее, то сможешь пройти к нему незамеченным.
wait 1s
say Я подожду здесь а вы ступайте.
calcuid polk 56010 mob
attach 56011 %polk.id%       
detach 56010 %self.id%
~
#56011
помер полководец~
0 f 100
~
if !%world.curmobs(56009)% || !%world.curmobs(56015)% 
  halt
end   
if %actor.vnum% == -1
  set hero3 %actor%
else
  set hero3 %actor.leader%
end
calcuid kalinika 56015 mob
attach 56013 %kalinika.id%
remote hero3 %kalinika.id%
~
#56012
засада~
2 e 100
~
if (%direction% == south && %exist.mob(56010)%)
  wait 1
  calcuid polkov 56010 mob
  wecho %polkov.iname% закричал : 'Бей русичей!!!'
  wforce %polkov% mkill %actor%
  wait 1s
  if (%exist.mob(56004)%)
    calcuid drakon 56004 mob
    wteleport %drakon% 56060
    wforce %drakon% mkill %actor%
  end
  wait 5s
  set tar %random.pc%
  if (%exist.mob(56013)%)
    calcuid tisyac 56013 mob
    wteleport %tisyac% 56060
    wforce %tisyac% mkill %tar%
  end
  wait 9s
  set tar %random.pc%
  if (%exist.mob(56012)%)
    calcuid sotnik 56012 mob
    wteleport %sotnik% 56060
    wforce %sotnik% mkill %tar%
  end
  wait 15s
  set tar %random.pc%
  if (%exist.mob(56011)%)
    calcuid desyat 56011 mob
    wteleport %desyat% 56060
    wforce %desyat% mkill %tar%
  end
  wait 5t
end
~
#56013
награда~
0 q 100
~
if (%actor% != %hero3% || !%world.curmobs(56009)%) && (%actor.level% <33)
  halt
end
calcuid ivas 56009 mob
wait 2s
say Ну вот мы и свободны. Что ж пора нам вернуться домой.
if (%actor.level% <= 24)
  say Спасибо тебе,%hero3.name%. Ты сделал%hero3.g% благое дело.
  wait 1
  *if (%actor.quested(560)% || %actor.level% >= 24)
  %actor.exp(+700000)%
  mecho Сказав эти слова Калиника и Ивасек исчезли в неизвестном направлении.
end
wait 1s
%actor.setquest(560)%
mecho Сказав эти слова Калиника и Ивасек исчезли в неизвестном направлении.
wait 1s
mpurge %ivas%
wait 1
mpurge %self%
~
#56014
репоп зоны Саркел~
2 f 100
~
calcuid enter 56020 room
detach 56000 %enter.id%
detach 56001 %enter.id%
attach 56000 %enter.id%
~
$~
