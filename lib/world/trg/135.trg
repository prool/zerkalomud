#13500
К мобу в комнату вошли ПС [Great-ALL PC]~
0 r 100
~
* К МОБУ В КЛЕТКУ ЗАШЕЛ PC *
if !%actor.name% || %actor.vnum% != -1
  halt
end
wait 1
switch %self.vnum%
  case 13511 * [Строгий воевода]
    switch %actor.clan%
      case ДНЗ
        say Киевских принесла нелегкая...
      break
      case ДСС
        хмур
        say Понаехали тут понимаешь...
      break
      case ГД
        прив
        say Смотри, не шали в нашем городе
      break
    done
  break
  case 13513 * [Веселый гуляка]
    if %acor.clanrank% < 4
      emote подобострастно посмотрел на Вас
    else
      белочка
    end
  break
  case 13516 * [кузнец]
    msend %actor% Кузнец сказал : 'Привет, я - кузнец Митрофан.'
    msend %actor% Кузнец сказал : 'Могу ковать, могу не ковать,'
    msend %actor% Кузнец сказал : 'а могу кувалду так запрятать, что фиг найдешь!'
    msend %actor% Кузнец сказал : 'Так чего тебе, ковать или не ковать?'
    msend %actor% &KКузнец взглянул на Вас, похоже его гложет какой-то вопрос.&n
    * Шутка взята из РПГ "Златогорье 2"
  break
done
~
#13501
лоад метательного ножа~
1 c 1
достать~
wait 1
if %arg.contains(нож)%
  if %world.curobjs(13560)% >= 500
    osend %actor% Вы пошарили рукой в поясе, но ножи кончились!
    halt
  end
  oload obj 13560
  osend %actor% Вы достали метательный нож из пояса с метательными ножами.
  oechoaround %actor.iname% достал%actor.g% метательный нож из пояса.
  oforce %actor% взять метательный.нож
else
  osend %actor% Что вы хотите достать?
end
~
#13502
Платный портал, комната 13568~
0 m 1
~
wait 1
emot пересчитал%self.g% монеты
eval target 0
switch %amount%
  * Псков
  case 2100
    eval target 75063
  break
  * Тотьма
  case 5100
    eval target 62025
  break
  default
    дум
    say И чего же ты за эти деньги хочешь?
    give %amount% кун .%actor.name%
    halt
  done
  кив
  emot сделал%self.g% несколько странных жестов
  mechoaround %actor% %actor.name% исчез%actor.q% в клубах дыма.
  msend %actor% У вас закружилась голова, и на миг вы потеряли сознание...
  msend %actor% 
  mteleport %actor% %target% horse
  mechoaround %actor% %actor.name% появил%actor.u% здесь в клубах дыма.
~
$~
