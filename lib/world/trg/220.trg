#22000
репоп, загрузка раненого воина~
2 f 100
~
%load% mob 22003
calcuid warrior 22003 mob
eval %warrior.hitp(150)% 
attach 22001 %warrior.id%
eval helper 0
global helper
eval healer 0
global healer
eval voin 0
global voin
%door% 22058 down purge
attach 22011 %world.room(22058)%
eval loadroom %random.13%*5+22021
calcuid rm %loadroom% room
attach 22009 %loadroom%
eval healer %loadroom%
run 22009 %loadroom%
~
#22001
вход в комнату с воином~
0 q 100
~
wait 1s
встат
wait 1s 
say Здравствуй, %actor.name%.
say Не ожидал я встретить в этом проклятом лесу кого-нибудь.
say Но раз уж мы встретились, не откажи в помощи.
wait 1s
вопр .%actor.name%
~
#22002
сказали воину помогу~
0 d 100
помогу~
wait 1s
улыб
wait 1s
say Спасибо, %actor.name%, что согласил%actor.u% помочь.
say В этом лесу завелся волкодлак - злобная тварь.
say Из-за него весь лес полон волков,
say Ночью они собираются в стаю, и убивают любого кого найдут
say Много лесорубов и крестьян погибло из-за них.
wait 1s
взд
wait 1s
say Я решил одолеть этого волкодлака и пошел в лес. Нашел я пещеру, где он обитает.
say Да только не хватило сил мне справиться с этим отродьем. Вот сижу силенок набираюсь.
say Была у меня сумка с лечебныи зельями, подарок одного волхва, да только потерял я ее в лесу где-то.
wait 1s
печа
wait 1s
say Ну да ладно, с твоей помощью и так справимся!
say Как будешь готов%actor.a% к бою скажи и сразу пойдем.
wait 1s
отд
eval helper %actor.name%
global helper
calcuid warrior 22003 mob
attach 22003 %warrior.id%
detach 22001 %warrior.id%
detach 22002 %warrior.id%
~
#22003
сказали воину пошли~
0 d 100
пошли~
if ( %helper%==%actor.name%)
  wait 1 s
  вст
  wait 1 s
  say Ну чтож с богом.
  wait 1 s
  крест
  wait 1 s
  say Ступай за мной.
  wait 1 s
  запад
  calcuid warrior 22003 mob
  attach 22004 %warrior.id%
  detach 22011 22058 room
else
  halt
end
~
#22004
загрузка волкодлака~
0 r 100
~
%echo% В дальнем углу пещеры откатился камень и из появившегося прохода выпрыгнул Волкодлак.
%load% mob 22004
%door% 22058 D room 22095
wait 1 s
уб волкодл
calcuid warrior 22003 mob
detach 22003 %warrior.id%
detach 22004 %warrior.id%
~
#22005
дали сумку воину~
0 j 100
~
if (%object.vnum% != 22000)
  say Зачем мне это?
  return 0
  halt
end
wait 1
mpurge %object%
say Спасибо тебе, %actor.name%. Теперь я смогу подлечиться немного.
mecho Воин взял из сумки несколько снадобий и смазал ими свои раны.
wait 2s
mecho Воин выглядит намного лучше.
eval %self.hitp(1750)%
eval healer 1
global healer
~
#22006
смерть волкодлака~
0 f 100
~
if ( %voin%==0)
  calcuid warrior 22003 mob
  attach 22007 %warrior.id%
  run 22007 %warrior.id%
else
  %echo% Волкодлак наконец мертв.
  %echo% Скорее всего волки теперь убегут из леса, и люди смогут безопасно ходить по лесу.
end
if ( (%world.curobjs(22004)% < 8) && (%random.10% < 5) )
  mload obj 22004
end
if %random.1000% <= 80
  %load% obj 1711
end
~
#22007
воин - благодарности~
0 z 100
~
if ( %healer%==1)
  switch %random.2%
    case 1
      %load% obj 22002
      %load% obj 22002
    break
    case 2
      %load% obj 22002
      %load% obj 22002
      %load% obj 22002
    break
  done 
  switch %random.2%
    case 1
      %load% obj 22003
      %load% obj 22003
    break
    case 2
      %load% obj 22003
      %load% obj 22003
      %load% obj 22003
    break
  done
  wait 1 s
  say Я в тебе не ошибся!
  say Вместе мы прекрасно справились с этой тварью.
  say Спасибо тебе за помощь и прими от меня подарок.
  wait 1 s
  %load% obj 22001
  вз отвар
  вз отвар
  вз отвар
  вз снад
  вз снад
  вз снад
  полож снад сумк
  полож снад сумк
  полож снад сумк
  полож отвар сумк
  полож отвар сумк
  полож отвар сумк
  if %random.100% <= 25
    %load% obj 403
    дать книг .%helper.name%
  end
  дать сумка .%helper.name%
  wait 1 s
  say Вот, мне она не особенно нужна, а тебе в твоих путешествиях я думаю пригодится.
  calcuid warrior 22003 mob
  detach 22007 %warrior.id%
else
  wait 1 s
  say Я в тебе не ошибся!
  say Вместе мы прекрасно справились с этой тварью.
  say Спасибо тебе за помощь, жалко нечем мне тебя отблагодарить...
  взд
end
~
#22008
смерть воина~
0 f 100
~
eval voin 1
global voin
~
#22009
лоад сумки~
2 z 100
~
%load% obj 22000
~
#22010
волчий вой~
0 b 30
~
выть
switch %random.3%
  case 1
    masound &YНевдалеке раздался леденящий душу вой.&n
  break
  case 2
    masound &YОткуда-то из чащи послышался голодный волчий вой.&n
  break
  case 3
    masound &YНевдалеке раздался одинокий волчий вой.&n
  break
done
~
#22011
не пускаем на запад~
2 e 100
~
if %exist.mob(22003)%
  wasound Из пещеры донеслись завывания и хруст костей на крепких зубах.
  wat 22059 %echo% Воин сказал : 'Куда прешь?!Тварь там страшная!'
  wat 22059 %echo% Воин сказал : 'В одиночку с ней не справится, пойдем вместе?'
  wat 22059 %echo% Воин сказал : 'Авось одолеем нечисть проклятую.'
  return 0
end
~
#22012
пастух разговаривает~
0 q 100
~
wait 1s
шля
г В лес ближайший не ходите, человек хороший.
г Волки там вдруг чего-то завелись, злые, голодные.
г Надо вот новое пастбище искать для животинки.
Г А то загрызут ведь...
wait 1s
тоск
~
$~
