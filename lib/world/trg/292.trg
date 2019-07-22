#29200
приветствие старушки~
0 q 100
~
wait 2
msend %actor% Старушка печально взглянула на Вас.
mechoaround %actor% Старушка печально взглянула на %actor.vname%.
wait 1s
msend %actor% - Каким ветром занесло, путник добрый?
msend %actor% - А не попадались ли тебе травы целебные в долгих скитаниях?
msend %actor% - Стара я стала, не могу уже как раньше бегать по лесу да искать их сама.
msend %actor% - Уж если принесешь мне травы разные, так и быть, сварю я отвар целебный.
msend %actor% - И с тобой поделиться не забуду.
~
#29201
появление растений~
2 e 100
~
if %random.4% == 1
  wait 1s
  wecho Вдруг из надтреснутой земли пророс странный зеленый лепесток.
  switch %random.6%
    case 1
      if %world.curobjs(29200)%<100
        wload obj 29200
      end
    break
    case 2
      if %world.curobjs(29201)%<100
        wload obj 29201
      end
    break
    case 3
      if %world.curobjs(29202)%<100
        wload obj 29202
      end
    break
    case 4
      if %world.curobjs(29203)%<100
        wload obj 29203
      end
    break
    case 5
      if %world.curobjs(29204)%<100
        wload obj 29204
      end
    break
    case 6
      if %world.curobjs(29205)%<100
        wload obj 29205
      end
    break
    default
    break
  done
end
~
#29202
старухе дали травки или передали весточку от старика дуба~
0 j 100
~
wait 1
eval objectvnum %object.vnum%
if (( %object.vnum% >= 29200 ) && ( %object.vnum% =< 29299 ))
  wait 1
  mpurge %object%
end
switch %objectvnum%
  case 29307
    wait 1
    mpurge %object%
    wait 2s
    msend %actor% - Что! Что это! Неужели это мой братец, которого я не видела уже
    msend %actor% - вторую сотню лет, соизволил мне написать?
    mecho Старушка вытащила из кармана два маленьких стеклышка и надела их на нос.
    wait 1s
    mecho Старушка принялась читать весточку братца.
    wait 2s
    mecho Старушка прекратила читать, и на лице ее появились слезы счастья.
    msend %actor% - Выходит, мой братец жив, и живет-то, паразит, совсем рядом,
    msend %actor% - Не мог навестить меня раньше, помру ведь уж скоро.
    if ( %actor.level% < 6 ) 
      wait 1
      say Спасибо тебе...
    elseif ( %actor.level% < 10 ) && ( %actor.level% > 6 )
      wait 1s
      msend %actor% За доброе дело Вы получили 5000 очков опыта...
      %actor.exp(+5000)%
    else
      wait 1s
      msend %actor% За доброе дело Вы получили 10000 очков опыта...
      %actor.exp(+10000)%
    end
  break
  case 29204
    wait 1s
    say Спасибо. Выручил%actor.g%!
    wait 1s
    mecho Старушка бросила траву в котел, помешала и слила все в коричневую колбочку.
    wait 1
    *mpurge %object%
    if ((%random.30% > %world.curobjs(29207)%) || (%random.100% == 6))
      mload obj 29207
      wait 2s
      дать колбочка %actor.name% 
    else
      say Травка засохшая уж совсем... посвежей надоть бы!
    end
  break
  case 29203
    wait 1s
    say Спасибо. Выручил%actor.g%!
    wait 1s
    mecho Старушка бросила траву в котел, помешала и слила все в зеленую колбочку.
    wait 1
    *mpurge %object%
    if ((%random.30% > %world.curobjs(29209)%) || (%random.100% == 6))
      mload obj 29209
      wait 2s
      дать колбочка %actor.name%
    else
      say Травка засохшая уж совсем... посвежей надоть бы!
    end
  break
  case 29205
    wait 1s
    say Спасибо. Выручил%actor.g%!
    wait 1s
    mecho Старушка бросила траву в котел, помешала и слила все в серую колбочку.
    wait 1
    *mpurge %object%
    if ((%random.30% > %world.curobjs(29208)%) || (%random.100% == 6))
      mload obj 29208
      wait 2s
      дат колбочка %actor.name%
    else
      say Травка засохшая уж совсем... посвежей надоть бы!
    end
  break
  case 29202
    wait 1s
    say Спасибо. Выручил%actor.g%!
    wait 1s
    mecho Старушка бросила траву в котел, помешала и слила все в голубую колбочку.
    wait 1
    *mpurge %object%
    if ((%random.30% > %world.curobjs(29210)%) || (%random.100% == 6))
      mload obj 29210
      wait 2s
      дать колбочка %actor.name%
    else
      say Травка засохшая уж совсем... посвежей надоть бы!
    end
  break
  case 29200
    wait 1s
    say Спасибо. Выручил%actor.g%!
    wait 1s
    mecho Старушка бросила траву в котел, помешала и слила все в черную колбочку.
    wait 1
    *mpurge %object%
    if ((%random.30% > %world.curobjs(29206)%) || (%random.100% == 6))
      mload obj 29206
      wait 2s
      дать колбочка %actor.name%
    else
      say Травка засохшая уж совсем... посвежей надоть бы!
    end
  break
  case 29201
    wait 1s
    say Спасибо. Выручил%actor.g%!
    wait 1s
    mecho Старушка бросила траву в котел, помешала и слила все в белую колбочку.
    wait 1
    *mpurge %object%
    if ((%random.30% > %world.curobjs(29211)%) || (%random.100% == 6))
      mload obj 29211
      wait 2s
      дать колбочка %actor.name%
    else
      say Травка засохшая уж совсем... посвежей надоть бы!
    end
  break
  default
    drop all
  done
~
#29203
приветствие мол.лодочника~
0 r 100
~
wait 2s
msend %actor% - За двадцать кун я мог бы перевезти вас на другой берег.
msend %actor% - На остров Травень.
улыб
~
#29204
приветствие лодочника~
0 r 100
~
wait 2s
msend %actor% - За двадцать кун я мог бы перевести вас на другой берег.
улыб
~
#29205
дали 20 кун лодочнику~
0 m 0
~
wait 1
if %amount% <20 then
  дум
  say Нет, денег маловато! Я же говорил, 20 кун за перевоз...
  halt
end
wait 1
mecho Лодочник громко свистнул и с другого берега примчался паренек в лодке.
msend   %actor% Паренек посадил Вас в лодку и быстро заработал веслами.
mechoaround %actor% Паренек посадил %actor.vname% в лодку и быстро заработал веслами.
wait 2s
msend   %actor% Вам стало немного страшновато, когда вы очутились на середине реки.
mechoaround %actor% Через пару минут %actor.name% исчез%actor.q% из виду, растворившись в речном тумане.
mteleport %actor.name% 29275 
msend   %actor% В конце концов Вы причалили к противоположному берегу, рядом с деревней.
mat %actor.realroom% mechoaround %actor% Кто-то прибыл сюда с реки.
~
#29206
дали 20 кун мол.лодочнику~
0 m 0
~
wait 1
if %amount% <20 then
  дум
  say Нет, денег маловато! Я же говорил, 20 кун за перевоз...
  halt
end
wait 1
mecho Лодочник громко свистнул и с другого берега примчался паренек в лодке.
msend   %actor% Паренек посадил Вас в лодку и быстро заработал веслами.
mechoaround %actor% Паренек посадил %actor.vname% в лодку и быстро заработал веслами.
wait 2s
msend   %actor% Вам стало немного страшновато, когда вы очутились на середине реки.
mechoaround %actor% Через пару минут %actor.name% исчез%actor.q% из виду, растворившись в речном тумане.
mteleport %actor.name% 29262 
msend   %actor% В конце концов Вы причалили к поросшему высокими деревьями острову.
mat %actor.realroom% mechoaround %actor% Кто-то прибыл сюда с реки.
~
#29207
убили медведя~
0 f 100
~
mecho По лесу прошел странный гул, похожий на раскат грома.
mecho Тело медведя надломилось и из него вылез бесплотный дух косолапого.
mload mob 29211
~
#29208
приветствие белуна~
0 q 100
~
msend %actor% Белун шмыгнул носом и с надеждой посмотрел на Вас.
mechoaround %actor% Белун шмыгнул носом и с надеждой посмотрел на %actor.vname%.
wait 1s
msend %actor% - Здравствуйте!
msend %actor% - Не могли бы вы оказать мне одну маленькую услугу?
msend %actor% - Вытереть соплю, что висит у меня на носу.
~
#29209
вытерли соплю~
0 c 0
вытереть утереть~
if !(%arg.contains(сопли)%) 
  return 0
  halt
end
msend %actor% Зажмурив глаза, вы вытерли своим рукавом сопли на носу у Белуна.
mechoaround %actor% %actor.name%, зажмурив глаза, размазал%actor.g% сопли Белуна по своему рукаву.
wait 1s
switch %random.5%
  case 1
    mecho Белун улыбнулся, и достал из-за пазухи увесистый мешочек.
    wait 1s 
    msend %actor% - Держи! Вот уже сотни лет люди брезгуют вытереть мне соплю,
    msend %actor% - только ты переборол%actor.g% себя, и не побрезговал%actor.g% помочь мне.
    дат 100 кун  %actor.name%
    wait 1s 
    mecho Белун взмахнул рукой в прощальном жесте и растворился в клубах дыма.
    mpurge %self%
  break
  case 2
    mecho Белун задумался, и достал из-за пазухи большущую грязную тряпку.
    wait 1s
    mecho Просморкался.
    msend %actor% - Плохо у тебя получилось, не помог ты мне.
    mecho Белун взмахнул рукой в прощальном жесте и растворился в клубах дыма.
    mpurge %self%
  break
  default
    say БОЛЬНО! Да ты нос мне свернул, ну держись!
    mkill %actor%
  break
done
~
$~
