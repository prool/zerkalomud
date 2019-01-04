#72400
Приветствие стража~
0 r 100
~
wait 1
г Привет, робяты. Шо, не знакомы?
г Условия простые, я пускаю внутрь только если у меня хорошее настроение.
г А настроение у меня начинает подниматься при виде тридцати тысяч кун,
г А лучше трехсот или пятисот. Тысяч, естественно. А уж за миллион я...
г Тьфу!
плю
wait 1
г Так о чем же это я толкую? А, вот! Настроение, значицца, у меня, конечно
г поднимается, но бывает, что и не сразу. Все зависит от суммы добровольной помощи.
г Так что придется очень постараться, чтобы меня заинтересовать.
г Ну? Ясно?
wait 1s
ухм
halt
~
#72401
стражу дали бабки~
0 m 1
~
wait 1
if ((%amount% > 0) && (%amount% < 30000))
  г Маловато будет!
  wait 1
  ухм
  %self.gold(2)%
  halt
elseif ((%amount% >= 30000) && (%amount% < 300000))
  if %random.1000% > 500
    г Везет тебе сегодня! Ладно уж, проходи.
    mecho Привратник цепко зажал в руке кошелек и исчез среди скал.
    %self.gold(2)%
    mpurge %self%
  else
    г Спасибо, друзья! И все же настроение нужно еще чуть-чуть приподнять.
    ик
  end
elseif (%amount% == 300000)
  г Вот это другой разговор!
  mjunk all
  mload obj 72400
  бро все
  mpurge %self%
else
  г Ого, да ты богач!
  mjunk all
end
~
#72402
вошли к наемнику~
0 r 100
~
wait 1
г Стойте, не подходите!
wait 3
г Лютует дух тверди, страшно!
г Не любит он людей нашей профессии, не любит.
г Семеро нас было, я один еле ноги унес.
wait 10
взд
wait 10
г А один среди нас был не наемник, а богатырь. Ему хоть бы хны. Да и остальным всем ничего.
г Не берет его, значить, магия злая. Так что парнишка не обезумел, как остальные.
г Крысы его правда потом сожрали, да-а... Страшные это твари, и вороватые притом!
wait 1 s
г Кстати, о крысах! У стража, говорят, есть какое-то адское снадобье против этих тварей.
г Все мечтает продать его подороже доверчивым простакам...
wait 1
кашл
г Так вот, коли есть среди вас наемники - не суйтесь без нужды.
г Убить не убьет, но поглупеете, как младенцы.
wait 10
: начал пускать слюни..
mecho Кто-то тихо удалился отсюда.
mpurge %self%
~
#72403
бросают яд~
1 h 100
~
if (%actor.realroom% != 72401)
  osend %actor% Вряд ли стоит здесь бросать подобные вещи.
  return 0
  halt
end
calcuid vspomoga 72400 room
run 72417 %vspomoga.id%
~
#72404
яд брошен~
0 z 100
~
mload mob 72413
mpurge %self%
~
#72405
сыплют яд~
1 c 2
рассыпать~
if (%actor.realroom% == 72401)
  while (%exist.mob(72403)% == 1)
    calcuid bkrisa 72403 mob
    exec 72406 %bkrisa.id%
  done
end
~
#72406
яд рассыпан~
0 z 100
~
mload mob 72404
mpurge %self%
~
#72407
наемник зашел~
2 e 100
~
if ((%actor.class% == 4) && (%actor.exp% > 400000000) && (%actor.level% < 31))
  set buf %actor.exp(-100000000)%
  set buf %actor.exp(-100000000)%
  set buf %actor.exp(-100000000)%
  set buf %actor.exp(-100000000)%
end
~
#72408
убили рудокопа~
0 f 0
~
mload mob 72402
if ((%random.1000% > 900) && (%world.curobjs(72401)% < 2))
  mload obj 72401
end
~
#72409
убили призрака~
0 f 100
~
set randomic %random.1000%
if ((%randomic% > 950) && (%world.curobjs(72402)% < 2))
  mload obj 72402
elseif ((%randomic% < 951) && (%world.curobjs(72403)% < 2))
  mload obj 72403
end
~
#72410
убили крысу~
0 f 0
~
halt
if %random.1000% > 300
  halt
else
  switch %random.3%
    case 1
      set anticrash 1
      set loadok 0
      while ((%anticrach% < 20) && (%loadok% == 0))
        eval staffnum (20201 + %random.23%)
        if (%world.curobjs(%staffnum%)% < 2)               
          mload obj %staffnum%
          set loadok 1
        else
          eval anticrash (%anticrash%+1)
        end
      done
    break
    case 2
      set anticrash 1
      set loadok 0
      while ((%anticrach% < 20) && (%loadok% == 0))
        eval staffnum (20601 + %random.18%)
        if (%world.curobjs(%staffnum%) < 2)
          mload obj %staffnum%
          set loadok 1
        else
          eval anticrash (%anticrash%+1)
        end
      done
    break
    case 3
      switch %random.9%
        case 1
          mload obj 209
        break
        case 2
          mload obj 205
        break
        case 3
          mload obj 215
        break
        case 4
          mload obj 220
        break
        case 5
          mload obj 226
        break
        case 6
          mload obj 216
        break
        case 7
          mload obj 242
        break
        case 8
          mload obj 240
        break
        case 9
          mload obj 211
        break
      done
    break
  done
end
~
#72411
убили змея~
0 f 0
~
set rand %random.1000%
if ((%rand% > 800) && (%rand% < 900) && (%world.curobjs(72408)% < 2))
  mload obj 72408
elseif ((%rand% > 900) && (%world.curobjs(72409)% < 2))
  mload obj 72409
end
~
#72412
убили духа~
0 f 0
~
set rand %random.1000%
if ((%rand% > 800) && (%rand% < 900) && (%world.curobjs(72405)% < 2))
  mload obj 72405
elseif ((%rand% > 900) && (%world.curobjs(72406)% < 2))
  mload obj 72406
elseif ((%rand% > 700) && (%rand% < 800) && (%world.curobjs(72407)% < 2))
  mload obj 72407
end
~
#72413
убили паука~
0 f 0
~
set rand %random.1000%
if ((%rand% > 900) && (%world.curobjs(72404)% < 2))
  mload obj 72404
end
~
#72414
убили смотрителя~
0 f 0
~
set rand %random.1000%
if ((%rand% > 900) && (%world.curobjs(72410)% < 4))
  mload obj 72410
end
~
#72415
зашли к духу~
2 ez 100
~
wait 1
wforce %actor% кри сюда!
wsend %actor% И о чем только болтает Ваш поганый язык??
calcuid bondage 72443 room
exec 72416 %bondage.id%
wait 5
wecho Дух тверди радостно потер руки - все в сборе.
wecho Дух начал медленно растворяться прямо в скале!
wecho Вы расслышали слова страшного заклинания: "Non vagina, non reda cogorta - pre pater ad Inferno!"
~
#72416
всех тянет на север~
2 z 100
~
wecho И ВЫ ПОПЛЕЛИСЬ ТУДА ЖЕ!!!
wforce all wake
wforce all stand
wecho Стойте и не шевелитесь - только так Вы сможете избежать верной гибели...
wforce all north
~
#72417
вспомогательный триггер~
2 z 0
~
while (%exist.mob(72403)% == 1)
  calcuid bkrisa 72403 mob
  exec 72404 %bkrisa.id%
done
return 1
~
#72418
дамадж в комнате~
2 c 1
*~
wait 1
wdamage %actor% 5000
~
$~
