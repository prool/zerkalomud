#73000
Платные порталы~
0 m 1
~
wait 1
emot пересчитал%self.g% монеты
eval target 0
switch %amount%
  * Ладога
  case 5200
    eval target 30224
  break
  * НК
  case 4800
    eval target 49947
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
#73001
ВстречаетВорожея~
0 g 100
~
wait 1
msend %actor% При виде Вас молодая ворожея поднялась и прошептала Вам на ухо:
msend %actor% - Да защитят тебя родные Боги от всякого зла, %actor.name%!
msend %actor% - Далеко забрел%actor.g% ты от дома своего...
msend %actor% - Ведаю я как с помощью травок, да вещей по миру перемещаться!
msend %actor% Девушка загадочно улыбнулась.
wait 2s
msend %actor% - Коли ветку и ягоды в лесу найдешь, перенесу я тебя во град Полоцк.
msend %actor% - Коли камень и ягоды cыщешь, перенесу я тебя в Тотьму.
msend %actor% - Ну, а если камень и ветку принесешь, перенесу я тебя в Туров-град.
~
#73002
ДалиИнгрыВорожее~
0 j 100
~
wait 1
If (%object.vnum%==713)
  If (%object.val1%>5)
    If  !(%self.haveobj(60064)%)
      mload obj 60064
    else
      нет
      say Ветка у меня уже есть. Поищи другой ингридиент.
    End
  Else
    say Эта ветка кем-то покусана, такая не подойдет.
  end
End
If (%object.vnum%==705)
  If (%object.val1%>5)
    say Да, эта ягода как раз подойдет.
    If  !(%self.haveobj(60065)%)
      mload obj 60065
    Else
      нет
      say У меня уже есть ягода! Куда мне еще?
    End
  Else
    эм надкусила ягоду, попробовала на зуб
    say  Нет, эта ягода испорченная! Такая не подойдет.
  end
End
If (%object.vnum%==721)
  If (%object.val1%>5)
    Say Замечательные камушки!
    If  !(%self.haveobj(60060)%)
      Mload obj 60060
    Else
      say У меня уже есть камень!
    End
  Else
    say Да чтож такой непрочный камень? Не пойдет такой!
  end
End
mpurge %object%
if (%self.haveobj(60064)% && %self.haveobj(60065)%)
  say Отлично! Сейчас я сварю нужное зелье.
  say С его помощью я перенесу Вас в Полоцк.
  mecho Ворожея положила ингридиенты на землю и что-то зашептала.
  %send% %actor% Произнесенные слова унесли Вас далеко отсюда...
  wait 1s
  mteleport all 72038
  брос все
end
if (%self.haveobj(60065)% && %self.haveobj(60060)%)
  say Отлично! Сейчас я сварю нужное зелье.
  say С его помощью я перенесу Вас в Тотьму.
  mecho Ворожея положила ингридиенты на землю и что-то зашептала.
  %send% %actor% Произнесенные слова унесли Вас далеко отсюда...
  wait 1s
  mteleport all 62034
  брос все
end
if (%self.haveobj(60064)% && %self.haveobj(60060)%)
  say Отлично! Сейчас я сварю нужное зелье.
  say С его помощью я перенесу Вас в Туров-град.
  mecho Ворожея положила ингридиенты на землю и что-то зашептала
  %send% %actor% Произнесенные слова унесли Вас далеко отсюда...
  wait 1s
  mteleport all 32428
  брос все
end
~
$~
