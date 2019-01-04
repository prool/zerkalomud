#77900
кормление подранка хлебом~
0 j 100
~
wait 1
if %object.vnum%!=77901
  halt
end
есть хлеб
~
#77901
вход в клетку с подранком~
0 r 100
~
wait 1
mecho Глаза раненого оленя подернулись пеленой.
mecho Он взбрыкнул копытами и попытался подняться, но это ему не удалось.
ужас
wait 1
дрожь
wait 1
mecho Трясясь от страха подранок выжидательно следит за Вами. 
~
#77902
приветствие переправа старик~
0 q 100
~
wait 1
msend %actor% Старик-паромщик сказал тебе:
msend %actor% - Здраве тебе, %actor.name%!
msend %actor% - Я могу перевести тебя через реку на западный берег за 10 кун.
~
#77903
приветствие переправа подручный~
0 q 100
~
wait 1
msend %actor% Мальчонка-подручный пробубнил тебе:
msend %actor% - Здраве %actor.name%.
msend %actor% - Я могу перевести тебя через реку на восточный берег за 10 кун.
~
#77904
перевоз старик-подручный  ~
0 m 10
~
wait 1
switch %amount%
  case 10
    wait 1
    msend %actor.name% Старик-паромщик неторопливо залез на паром, затем Вам помог разместиться в нем.
    wait 1s
    msend %actor.name% Вы поплыли на пароме через реку на другой берег.
    if %actor.sex%==1
      mechoaround %actor% %actor.name% залез на паром.
      mechoaround %actor% %actor.name% уплыл на другой берег.
    else
      mechoaround %actor% %actor.name% залезла на паром.
      mechoaround %actor% %actor.name% уплыла на другой берег.
    end
    wait 1s
    msend %actor.name% Вы приплыли к другому берегу реки.
    msend %actor.name% Паромщик забрался на паром и поплыл назад.
    mteleport %actor.name% 77966
    wait 1s
    if %actor.sex%==1
      mat 77966 mechoaround %actor% %actor.name% приплыл на пароме.
      mat 77966 mechoaround %actor% %actor.name% слез с него.
    else
      mat 77966 mechoaround %actor% %actor.name% приплыла на пароме.
      mat 77966 mechoaround %actor% %actor.name% слезла с него.
    end
    mat 77966 mechoaround %actor% Паромщик забрался на паром и поплыл назад
    wait 1s
    mat 77949 mecho Старик-паромщик приплыл назад.
  break
  default
    msend %actor% Что-то не то.
    msend %actor% Я называл необходимую сумму, а это непонятно что. 
    дать %amount% %actor.name%
  break    
done
~
#77905
перевоз подручный-старик~
0 m 10
~
wait 1
switch %amount%
  case 10
    wait 1
    msend %actor.name% Мальчонка-подручный торопливо залез на паром, затем Вам помог разместиться в нем.
    wait 1s
    msend %actor.name% Вы поплыли на пароме через реку на другой берег.
    if %actor.sex%==1
      mechoaround %actor% %actor.name% залез на паром.
      mechoaround %actor% %actor.name% уплыл на другой берег.
    else
      mechoaround %actor% %actor.name% залезла на паром.
      mechoaround %actor% %actor.name% уплыла на другой берег.
    end
    wait 1s
    msend %actor.name% Вы приплыли к другому берегу реки.
    msend %actor.name% Мальчонка-подручный забрался на паром и поплыл назад.
    mteleport %actor.name% 77949
    wait 1s
    if %actor.sex%==1
      mat 77949 mechoaround %actor% %actor.name% приплыл на пароме.
      mat 77949 mechoaround %actor% %actor.name% слез с него.
    else
      mat 77949 mechoaround %actor% %actor.name% приплыла на пароме.
      mat 77949 mechoaround %actor% %actor.name% слезла с него.
    end
    mat 77949 mechoaround %actor% Мальчонка-подручный забрался на паром и поплыл назад
    wait 1s
    mat 77966 mecho Мальчонка-подручный приплыл назад.
  break
  default
    msend %actor% Что-то не то.
    msend %actor% Я называл необходимую сумму, а это непонятно что. 
    дать %amount% %actor.name%
  break    
done
~
#77906
кормление подранка мухомором~
0 j 100
~
wait 1
if %object.vnum%!=77908
  halt
end
есть мухомор
~
#77907
смерть зверюшки~
0 f 100
~
if (%world.curobjs(77900)% < 10) && (%random.10% <= 3)
  mload obj 77900
end
~
#77908
смерть оленя~
0 f 100
~
if (%world.curobjs(77906)% < 3) && (%random.10% <= 1)
  mload obj 77906
end
~
#77909
смерть лихоимца~
0 f 100
~
if (%world.curobjs(77905)% < 6) && (%random.10% <= 2)
  mload obj 77905
end
~
#77910
дали знахарю~
0 j 100
~
wait 1
if %object.vnum% != 93603
  г Что это? Оно мне надо?
  брос все
  halt
end
wait 1
mpurge %object%
г О! Вы нашли мою штучку! А я всюду ее обыскался! вот это славно!
г За труды Ваши тяжкие отблагодарю я вас по... по-знахарски!
хих
if (%world.curobjs(77909)% < 2) && (%random.1000% =< 100)
  mecho - Вот, это мне подарила одна ведьма за родовспоможение.
  mecho - А ты найдешь им достойное применение.
  mload obj 77909
  give сапог %actor.name%
else
  mecho - Вот, возьми, это награда боярина за то, что я ему гнилой зуб удалил.
  msend %actor% Знахарь дал Вам 500 монет.
  %actor.gold(+500)%
  mechoaround %actor% Знахарь дал %actor.dname% горсть монет.
  if (%world.curobjs(239)% < 50) && (%random.1000% <= 100)
    mload obj 239
    дать рун %actor.name%
  end
end
~
$~
