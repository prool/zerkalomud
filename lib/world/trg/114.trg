#11400
пришел к леснику~
0 q 100
~
*маг-некромант или купец
wait 1
if %actor.quested(27001)%
  halt
end
if ((%actor.class% == 8) || (%actor.class% == 12)) && %actor.quested(27010)%
  if %world.gameobjs(11407)% > 0
    halt
  end
  wait 1s
  say Чего приш%actor.y%?
  mecho _- Лес - не лавка со сластями. Ш%actor.y% бы себе до дому.
  wait 3s
  ворч
  say Ну, чего нужно?
  %actor.unsetquest(27002)%
  %actor.unsetquest(27000)%
  %actor.setquest(27001)%
  halt
end
wait 5
if !%exist.mob(11406)%
  halt
end
say Здравствуй %actor.name%!
say Я всю жизнь прослужил егерем у нашего князя
say А вот на старости лет поселился в этой глуши.
say Крестьяне меня недолюбливают, я им не давал браконьерить в угодьях княжьих
say Вот и пришлось здесь обосноваться.
wait 3
взд
say Да напасть тут приключилась недавно! Медведь стал шастать возле моей избы
say А вот сил, совладать с ним уже не осталось! Не поможешь ли?
~
#11401
сказал помогу~
0 d 1
*~
wait 1
if %speech.contains(пизд)% || %speech.contains(мудак)% || %speech.contains(пидор)% || %speech.contains(пидар)% || %speech.contains(хуй)% || %speech.contains(залуп)% || %speech.contains(ебан)% || %speech.contains(еблан)% || %speech.contains(сран)%
  морщ
  say Ишь, какие слова знает-то!
  say А ну - вон отсель!
  msend %actor% _Охотник выставил вас за порог при помощи изрядной затрещины.
  mteleport %actor% 11410
  mecho _Охотник выставил %actor.vname% за порог при помощи изрядной затрещины.
  mechoaround %actor% %actor.name% вылетел%actor.g% из избушки и кубарем покатил%actor.u% по земле.
  eval dmg %actor.hitp%/2
  mdamage %actor% %dmg%
  %actor.position(2)%
  %actor.wait(3)%
end
if ((%actor.class% == 8) || (%actor.class% == 12)) && %actor.quested(27001)%
  if %speech.contains(сало)% && %speech.contains(медвежье)%
    if %actor.quested(27002)% || %actor.quested(27003)%
      halt
    end
    wait 2
    if %world.gameobjs(11407)%
      halt
    end
    say эк как...
    mecho _- А ты сам медведя в глаза хоть видел%actor.g%?
    mecho _- На копье взять пробовал%actor.g%?!
    упрек .%actor.name%
    say Вот тоже...
    взд
    wait 2s
    say Ладно, вот что я скажу.
    mecho _- Есть у меня дочка - у Переяславля живет, в слободке рыбачьей.
    mecho _- Муж ее утонул запрошлый год...
    взд
    say Отнесешь ей от меня гостинцев, а от нее весточку передашь, или что она там скажет.
    mecho _- Тогда и я тебе помогу.
    wait 1s
    mload obj 11407
    дать мешок .%actor.name%
    %actor.unsetquest(27001)%
    %actor.setquest(27000)%
    %actor.setquest(27002)%
    attach 11408 %self.id%
    detach 11400 %self.id%
    detach 11401 %self.id%
    halt
  end
end
if %speech.contains(помогу)%
  wait 5
  say Берлога его в глубине леса
  say Медведь огромный и сильный, так что зря не рискуй, и будь осторожней!
  wait 5
  взд
  wait 5
  say Коли удастся совладать с медведем, шкуру мне снеси.
  say Я в долгу не останусь!
  detach 11400 %self.id%
  detach 11401 %self.id%
end
*attach 11402 %self.id%
~
#11402
дал шкуру леснику~
0 j 100
~
wait 1
switch %object.vnum%
  case 33037
    wait 1
    mpurge %object%
    дум .%actor.name%
    emot Прочел весточку
    wait 2s
    say Да.. такие дела.
    if !%actor.quested(27007)%
      say Спасибо тебе, %actor.name%, коли помощь нужна будет, чем смогу - выручу.
      halt
    end
    %actor.setquest(27008)%
    say Ну что же, выручил%actor.g% ты меня, теперь мой черед.
    mecho _- Только сам я на мевдедя не пойду - стар уже.
    mecho _- Есть тут рядом в лесу берлога медвежья  - вот тебе и медведь.
    mecho _- Принесешь мне его шкуру, а уж сало я сам срежу.
    mecho _- А то знаю я вас, молодых,  ничегошеньки-то сами не умеете
    ворч
  break
  case 11400
    wait 1
    mpurge %object%
    if %actor.quested(27008)%
      wait 2s
      удивл
      say Надо же!
      mecho _- Одолел%actor.g% зверя - молодец.
      mecho _- Ну, из этого сало я потом приготовлю, а для тебя готовое есть.
      wait 2s
      mload obj 11408
      say Вот, держи.
      give all .%actor.name%
      %actor.setquest(27009)%
      halt
    end
    wat 10
    say Ну вот и слава Богу! Я хоть из избы выходить спокойно смогу!
    say А в награду за дело твое доброе, вот что я тебе подарю
    wait 5
    mecho Старый охотник полез в сундук и что-то достал из него.
    wait 5
    eval rand %random.100%
    if (%rand% < 10) & (%world.curobjs(11401)% < 10)
      mload obj 11401
      дать сапоги %actor.name%
    elseif (%rand% < 20) & (%world.curobjs(11402)% < 10)
      mload obj 11402
      дать шапка %actor.name%
    elseif (%rand% < 30) & (%world.curobjs(11403)% < 10)
      mload obj 11403
      дать рукавицы %actor.name%
    else
      say Вот прими за труды свои... тут немного, но я сам беден, уж не обессудь.
      msend %actor% Старый охотник дал Вам небольшую кучку кун.
      %actor.gold(+1000)%
    end
  break
  default
    say Зачем ты мне это даешь ?
    wait 1
    хму
    drop все
  done
~
#11403
убили медведя~
0 f 100
~
if %world.curobjs(11400)% <5
  mload obj 11400
end
~
#11404
резет зоны~
0 n 100
~
attach 11400 %self.id%
attach 11401 %self.id%
~
#11405
убили лисицу~
0 f 100
~
if (%world.curobjs(11405)% < 30) && (%random.10% <= 2)
  mload obj 11405
end
~
#11406
убили белку~
0 f 100
~
if (%world.curobjs(11404)% < 30) && (%random.10% <= 2)
  mload obj 11404
end
~
#11407
убили волка~
0 f 100
~
if (%world.curobjs(11406)% < 30) && (%random.10% <= 2)
  mload obj 11406
end
~
#11408
Вход у охотника если квестов нет~
0 q 100
~
wait 1
ворчать
say Дверь-то прикрой, сквозняк...
say И не суетись тут, занят я.
~
$~
