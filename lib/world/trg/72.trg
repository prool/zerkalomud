#7200
стругать щепку~
1 c 2
мастерить~
if !%arg.contains(щепк)%
  osend %actor% Из чего?
  halt
end
if !%arg.contains(кораблик)%
  osend %actor% А что именно?
  halt
end
if !%actor.haveobj(7201)%
  osend %actor% Нету у вас подходящей щепки.
  halt
end
osend %actor% Вы ловко выстругали из щепки кораблик.    
oechoaround %actor% %actor.iname% ловко выстругал%actor.g% из щепки кораблик.
oload obj 7203
oforce %actor% взять кораблик
wait 1
opurge %self%
~
#7201
пустить кораблик~
2 c 0
спустить пустить запустить пускать запускать спускать~
if !%arg.contains(корабл)%
  wsend  %actor% Куда больше? Все и так сильно запущено..
  halt
end
if !%actor.haveobj(7203)%
  wsend  %actor% Куда дел%actor.g% кораблик, растяпа???
  halt
end
wait 1
wsend  %actor% Пуская слюни от умиления, вы спустили кораблик на воду.
wsend %actor% Через мгновение он благополучно затонул.
wechoaround %actor% %actor.name% спустил%actor.g% кораблик на воду.
wechoaround %actor% Не прошло и минуты как он благополучно затонул.
calcuid korablik 7203 obj
wpurge %korablik%
set questor721 %actor%
global questor721
wait 5
wecho Вдруг вода помутнела и запузырилась. Запахло серой.
wait 5
wecho Фыркая и отряхиваясь по собачьи, из под воды вынырнул седой черт.
wload mob 7200
calcuid chert 7200 mob 
remote questor721 %chert.id%
rdelete questor721 %self.id%
exec 7202 %chert.id%
~
#7202
черт бухтит~
0 z 0
~
wait 1
хму %questor721.iname%
г Так, так...
г Вот значится кто мне воду мутит.
ворч
wait 5
г И откуды ж ты здесь, горе луковое?
г Али маменька не учила заброшеную мельницу за версту обходить?
~
#7203
черту сказали учила~
0 d 1
учила~
wait 1s
хих
г Ну а ты, стало быть, на ейное ученье плевать хотел%actor.g%?
г Люблю таких, самостоятельных.
льст %actor.name%
wait 5
г Службишка у меня для тебя есть.
г Ты правда с виду чтой-то тепленьк%actor.w%, ну да дело нехитрое.
г Главное голову береги, слабая она у тебя.
wait 5
г Дык вот, проигрался я как-то мельнику в буру.
г Продул ступку серебряну, да пестик в комплекте с ей.
г Теперь они ему без надобности, а мне б пригодились.
г Фамильные они, от бабушки достались..
всхлип
wait 5
г Дуй, короче.
attach 7208 %self.id%
detach 7203 %self.id%
~
#7204
щекотать пятку~
2 c 0
щекотать пощекотать~
if !(%world.curobjs(7207)%)
  return 0
  halt
end
if !(%arg.contains(пятк)%) 
  wsend  %actor% Себя?
  halt
end
wsend  %actor% Вы ухватились за торчащую пятку и стали ее щекотать.
wechoaround %actor% %actor.name% схватил%actor.g% торчащую пятку и принялся ее щекотать.
set shekotun %actor%
wait 5
wecho Разворошив сено, из копнушки вылез заспаный и растрепаный рыжий парень.
wload mob 7201
calcuid kopna 7207 obj
wpurge %kopna%
wload obj 7216
calcuid ryzhiytat 7201 mob 
remote shekotun %ryzhiytat.id%
rdelete  shekotun %self.id%
exec 7205 %ryzhiytat.id%
~
#7205
тать бухтит~
0 z 0
~
wait 5
гнев .%shekotun.name%
г Меня будить??!
уб .%shekotun.name%
~
#7206
к татю вошли~
0 q 20
~
wait 1
вст
г Не агрим! Перекур 5 мин
отд
~
#7207
тать убит~
0 f 100
~
mecho Рыжий тать из последних сил приподнялся на локте.
кашл  
mecho Рыжий тать прошептал : 'Передайте маменьке... в Корсунь'
mecho Рыжий тать прошептал : 'Мол, сгинул ваш сынок на чужбине'
mecho Рыжий тать прошептал : 'Ни за медный грош'
пока
mecho Бедняга испустил дух.
mload obj 7215
calcuid kopna 7207 obj
exec 7214 %kopna.id%
~
#7208
прием серебра~
0 j 100
~
wait 2
if (%object.vnum% == 7215)
  mecho Седой черт повертел серебряный пестик в руках.
  г Ага! Он, родимый.
  wait 1
  mpurge %object%
  eval sdalpestik %actor%
  global sdalpestik
end
if (%object.vnum% == 7214)
  mecho Седой черт повертел серебряную ступку в руках.
  г Она, она! Бабушкина.
  wait 1
  mpurge %object%
  eval sdalstupku %actor%
  global sdalstupku
end
if (%sdalpestik% && %sdalstupku%)
  if (%sdalpestik.id% == %sdalstupku.id%)
    пляс
    лиз %sdalpestik.name%
    г Ну, спасибочки. Вот тебе награда.
    wait 6
    switch %random.5%
      case 1
        if %world.curobjs(527)% >= 1 
          фиг %sdalpestik.name%
        else
          mload obj 527
        end
      break
      case 2
        if %world.curobjs(202)% >= 100 
          фиг %sdalpestik.name%
        else
          mload obj 202
        end
      break
      case 3
        if %world.curobjs(7217)% > 2 
          фиг %sdalpestik.name%
        else
          mload obj 7217
        end
      break
      default
        фиг %sdalpestik.name%
      done
      дать все .%actor.name%
    else
      г Спасибо, конечно, ребяты.
      г Только заморочили вы мне голову - кто что дал??.
      г Так что идите в баню.
    end
    wait 1
    пока 
    mecho Черт ухмыльнулся и исчез, оставив густой запах серы.
    wait 1
    mpurge %self%
  end
~
#7209
берут ступку из кучи мешков~
1 g 100
~
if %exist.mob(7213)%
  return 1
  halt
end
wait 1
osend %actor% Вы засунули руку в груду мешков.
osend %actor% Вдруг кто-то пребольно тяпнул вас за руку.
eval buf %actor.hitp(-12)%
oechoaround %actor% %actor.name% сунул%actor.g% руку в груду мешков.
oechoaround %actor% %actor.name% заорал%actor.g% благим матом и отдернул%actor.g% руку.
wait 5
oecho Сердито пыхтя, из груды мешков вылезла буйная мышь!
oload mob 7213
calcuid buynayamysh 7213 mob
exec 7210 %buynayamysh.id%
detach 7209 %self.id
~
#7210
буйная мышь рвет~
0 z 0
~
wait 1
эм топнула ножкой
wait 5
запад
~
#7212
филин ухает~
0 r 50
~
wait 3s
эм приоткрыл один глаз и недовольно покосился на Вас
wait 4
г Уху, уху
эм потерял к Вам всякий интерес
~
#7213
барсук охает~
0 r 100
~
wait 1s
вст
изум %actor.name%
wait 5
ик
~
#7214
Лоад копны без пяток~
1 z 100
~
oload obj 7216
wait 1
opurge %self%
~
$~
