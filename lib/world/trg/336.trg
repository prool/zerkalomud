#33600
у коваля~
0 b 50
~
wait 1
foreach fchar %self.pc%
  if !%fchar%
    halt
  end
  switch %random.15%
    case 1
      mecho Коваль ударил молотом и в стороны разлетелись каленые брызги.
      mecho Одна из брызг долетела до %fchar.rname% и обожгла.
      mdamage %fchar% 5
    break
    case 2
      mecho Коваль сильно ударил молотом и в стороны разлетелись каленые брызги.
      mecho Одна из брызг долетела до %fchar.rname% и обожгла.
      mdamage %fchar% 15
    break
    case 3
      say Работаем. Посторонись ка.
    break
    case 4
      mecho Коваль очень сильно ударил молотом и в стороны разлетелись каленые брызги.
      mecho Одна из брызг долетела до %fchar.rname% и обожгла.
      mdamage %fchar% 25
    break
    case 5
      mecho Коваль изо всех сил ударил молотом и в стороны разлетелись каленые брызги.
      mecho Одна из брызг долетела до %fchar.rname% и обожгла.
      mdamage %fchar% 55
    break
  done
done
~
#33601
у собаки~
0 q 100
~
wait 3s
mecho _Пес-дворняга старательно нюхает землю.
~
#33602
у девки~
0 q 100
~
wait 1
if      %actor.sex% == 1
  msend       %actor% Девица предложила Вам небольшой отдых.
  mechoaround %actor% Девушка сделала %actor.dname% весьма заманчивое предложение.
else
  msend       %actor% Девица взглянула на Вас и поняла, что толку ей с Вас, как с козла молока.
  mechoaround %actor% Девушка прошла мимо %actor.rname%, даже не взглянув не нее...
end
~
#33603
в мельнице~
2 b 100
~
wait 1
foreach fchar %self.pc%
  if %fchar.vnum% == -1
    switch %random.8%
      case 1
        wecho Жернова резко грохочут и у всех вокруг закладывает уши и болит голова.
        wdamage %fchar.name% 5
      break
      case 2
        wechoaround %fchar% Из грохочущих жернов вылетел камешек и попал %fchar.dname% в живот.
        wsend %fchar% Из грохочущих жернов вылетел камешек и попал Вам в живот.
        wdamage %fchar.name% 15
      break
      case 3
        wechoaround %fchar% Из грохочущих жернов вылетел камешек и попал %fchar.dname% в глаз.
        wsend %fchar% Из грохочущих жернов вылетел камешек и попал Вам в глаз.
        wdamage %fchar.name% 35
      break
      case 4
        wechoaround %fchar% Жернова развернулись и БОЛЬНО ударили %fchar.vname%.
        wsend %fchar% Жернова развернулись и БОЛЬНО ударили Вас.
        wdamage %fchar.name% 55
      break
      default
      break
    done
  end
done
~
#33604
помер лекарь~
0 f 100
~
*if (%world.curobjs(608)% < 40) && (%random.3% == 1)
*   mload obj 608
*end
~
#33605
подходят к холопу~
0 h 100
~
wait 1
if %actor.vnum% == 33833
  mshou Други! Татары у Киева! К оружию!
end
wait 1
if %actor.vnum% == 33834
  mshou  Помогите! Татарская орда наступает на Киев-град! За оружие!
end
~
#33698
дать20старухе~
0 m 1
~
if %actor.vnum% != -1
  halt
end
eval needgold %actor.level%*(%actor.remort%+1)
if %amount% < %needgold%
  дать %amount% кун %actor.name%
  tell %actor.name% Маловато будет!
else
  mecho Старуха слабо крикнула: 'Внучка, поди сюда, отведи мил человека к Корсуню.'
  wait 5
  mecho Откуда-то вдруг появилась девица в крепкой кожаной одежде,
  mecho в которой удобно ходить по лесу.
  tell %actor.name% Не беспокойся, доведет в целости и сохранности!
  tell %actor.name% Можешь фамилию нашу запомнить, так, на память.
  tell %actor.name% Сусанины мы. Вот Ивана тебя отведет к Корсуню.
  wait 2
  msend %actor% Девица махнула рукой, указывая следовать за ней, и скрылась в кустах.
  mechoaround %actor% Девица махнула %actor.dname% рукой, указывая следовать за ней, и скрылась в кустах.
  mechoaround %actor% %actor.name% уш%actor.y% за девицей в лесную чащу.
  mteleport %actor% 27498 horse
  mat 27498 mechoaround %actor% Девица вывела %actor.vname% из леса.
  wait 2
  mat 27498 mechoaround %actor% Девица быстро скрылась снова в лесу.
  wait 3
  mat 27498 msend %actor.name% Девица вывела Вас на какую-то поляну.
  mat 27498 msend %actor% Девица сказала: 'Все, я свое дело сделала, бывай!'
end
~
#33699
встречастаруха~
0 r 100
~
tell %actor.name% Привет, добр человек!
tell %actor.name% Не заплутал%actor.g%? А то могу проводить тебя к городищу Корсуню.
tell %actor.name% Конечно не я, а моя внучка, но она хорошо знает обходные дороги.
eval needgold %actor.level%*(%actor.remort%+1)
tell %actor.name% Ну не даром конечно, кун %needgold% нам на пропитанье и ты там!
tell %actor.name% Сам%actor.g% не дойдешь, поверь моим старым костям.
~
$~
