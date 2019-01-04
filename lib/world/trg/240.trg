#24000
крестимся~
2 e 100
~
wait 2
if %actor.religion% == 1
  wsend %actor.name% _Вы посмотрели на икону над воротами, перекрестились и тихо прошептали молитву.
end
~
#24001
православн_священик_против_язычников~
0 q 100
~
wait 1
if %actor.religion% == 0
  ск %actor.name% Язычники в храме Господнем?! Покинь немедля обитель сию, нехристь!
  msend %actor.name% Отец Ефремий сурово глянул на Вас.
  mechoaround %actor.name% Отец Ефремий сурово глянул на %actor.vname%.
end
~
#24002
лоточник~
0 qt 100
~
wait 5
mecho _Лоточник, завидев Вас, проорал на всю улицу:
mecho _- А вот кому пряники, бублики, калачи!..
mecho _- А не отведаешь ли чего?
mecho _- Свеженький бублик всего 3 куны, пряник сладкий 7 кун, калач_- 15!
~
#24003
торгуем~
0 m 1
~
wait 3
if %amount% < 3 
  г За эти деньги я ничего тебе не дам.
  дат %amount% кун %actor.name%
  halt
end
switch %amount%
  case 3
    г Вот, возьми бублик!
    mload obj 24057
    дать бублик %actor.name%
  break
  case 7
    г Вот тебе пряничек!
    mload obj 24056
    дать пряник %actor.name%
  break
  case 15
    г Держи калач свежий!
    mload obj 24058
    дать калач %actor.name%
  break
  default
    дум
    say И чего ж ты за эти деньги желаешь?
    дат %amount% кун %actor.name%
  done
  set buf %self.gold(0)%
~
#24004
клянчим_монетку~
0 q 30
~
wait 1
ул %actor.name%
switch %actor.sex%
  case 1
    ск %actor.name% Дяденька, дяденька! Дай монетку!
  break
  case 2
    ск %actor.name% Тетенька, дай монетку!
  break
done
эм хитро прищурился
~
#24005
шкет_получил_монету~
0 m 0
~
wait 1
if %amount% == 1 
  г спасибо!
  ул %actor.name%
  эм подкинул монетку большим пальцем и лихо поймал на лету
  halt
end
if %amount% > 99
  г Ого!
  эм уставился на деньги и удивленно открыл рот от невиданной щедрости
  msend %actor.name% _Вы, вдруг, ощутили присутствие высших сил.
  msend %actor.name% _Странное чувство наполнило Вас, как будто кто-то смотрит Вам в спину.
  dg_cast 'доблесть' %actor.iname%
  msend %actor.name% _Вы резко обернулись, пытаясь увидеть хозяина этого взгляда. Но странное чувство уже пропало.
  msend %actor.name% Мальчишка заговорщически улыбнулся Вам.
  mechoaround %actor.name% Мальчишка заговорщически улыбнулся %actor.dname%.
  halt
end
mload obj 24059
mecho Мальчишка достал из-за пазухи леденец.
дат леденец %actor.name%
ул %actor.name%
wait 1
if %random.1000% <= 100
  %load% obj 229
  дать рун %actor.name%
  г Вдруг пригодится!
  detach 24005 %self.id%
end
~
#24006
Юродивый1~
0 r 50
~
wait 1s
set i %random.3%
switch %i%
  case 1
    г А я танцую лучше всех, а меня ждет большой успех!
    г А мне реклама не нужна, а меня знает вся страна!
    пляс
  break
  case 2
    эм сложил губы трубочкой и надул особо крупный пузырь из слюны
  break
  case 3
    mecho Юродивый встал в позу оленя, растопырил пальцы над головой и заскакал вокруг Вас.
    г Я - олень-вожак.
  break
done
~
#24007
Даем куны ворожее~
0 m 1
~
if (%amount% < 200)
  say За такую лепту сам%actor.g% Ярило разгневай. А я не рискну!
  halt
end
wait 1
г Коли хочешь в Корсунь попасть - принеси мне гриб и ягоду.
~
#24008
Даем ингры ворожее~
0 j 100
~
wait 1
If (%object.vnum%==705)
  If (%object.val1%>5)
    Say Отличные сочные ягоды !
    If !(%self.haveobj(60061)%)
      Mload obj 60061
    Else
      Say Не... ягода у меня уже есть. Вторая не нужна пока.
    End
  Else
    Say Не... такая ягода не достаточно сочная для заклятия.
  end
End
If (%object.vnum%==700)
  If (%object.val1%>5)
    Say Уу-у! Замечательные грибы!
    If !(%self.haveobj(60060)%)
      Mload obj 60060
    Else
      Say У меня уже есть гриб! Мне второй не нужен!
    End
  Else
    Say Не-е-ет! Этот грибок маленький и червивый. Такой не годится!
  end
End
%purge% %object%
if (%self.haveobj(60060)% && %self.haveobj(60061)%)
  wait 1
  say Отлично! Сейчас я принесу жертву и сотворю заклятье!
  say С его помощью я перенесу Вас в Корсунь.
  mecho Ворожея что-то пошептала над ингредиентами и поднесла их к идолу.
  брос все
  mteleport all 27031
end
~
#24009
паромщик предлагает~
0 q 100
~
wait 2
if %self.fighting%
  halt
end
say Здраве буде.
say Переправиться хочешь?
set j 0
set needgold 30
foreach target %self.pc%
  eval needgold %needgold%+%target.level%*(%target.remort%+2)
  eval j %j%+1
done
if %j% > 1
  say Со всех вас возьму...
else
  say С тебя будет...
end
mecho Паромщик что-то мысленно прикинул.
wait 2
say ...%needgold% кун.
кив
~
#24010
паромщику заплатили~
0 m 1
~
wait 2
set needgold 30
foreach target %self.pc%
  eval needgold %needgold%+%target.level%*(%target.remort%+1)
done
mecho Паромщик пересчитал монеты.
wait 1s
if %amount% < %needgold%
  say За столько кун тебя до середины реки довезу, да там и высажу.
  ухм
  give %amount% кун .%actor.name%
  halt
end
кив
wait 1
mecho И вот вы уже плывете по реке.
wait 1
mteleport all 8508
end
~
$~
