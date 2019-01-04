#92400
Вычитаем мувы при ходьбе через завалы.~
2 e 100
~
if %actor.move% < 30 
  wsend %actor% Вы слишком устали пробираясь по этим завалам!
  return 0
else
  *%actor.move(-30)%
end
~
#92401
триггер создания саламандр~
2 ab 100
~
if %world.curmobs(92400)%<9 && %random.3%==1
  wecho Огненная саламандра вылезла из дыры!
  wload mob 92400
  wait 30s
end
~
#92402
дамаг на карнизах от жара~
2 e 100
~
eval dam 10+%random.40%
wdamage %actor% %dam%
~
#92403
поглощение дамаги мобами ( ну не ставит редактор много хитов :( )~
0 p 100
~
eval dam %amount%*(100 - %self.level%)/100
eval dam %dam%-(%self.level%/2)
eval reg %amount%-%dam%
if %dam% > 0
  eval buf %self.hitp(+%reg)%
  return %dam%
else
  return 0
end
~
#92404
батлетригг саламандры~
0 k 100
~
dg_cast 'обж хватк'
~
#92405
батлетригг черта~
0 k 100
~
dg_cast 'гор рук' 
~
#92406
боевой триггер огненного вихря~
0 k 100
~
if !%random.pc%
  halt
end
set mode %random.10%
foreach char %self.pc%
  if mode == 1
    dg_cast 'огнен шар' %char.name%
    mecho Огненный вихрь залил все пламенем!
  elseif mode < 4
    dg_cast 'обж хватк' %char.name%
  end                   
done
if mode >2
  set target %random.pc%
  dg_cast 'огнен шар' %target.name%
end
~
#92407
путешествия огненных вихрей~
0 ab 100
~
if %random.8% <4
  eval wait %random.10%
  wait %wait%s
  if !(%self.fighting%)
    eval fly 92411+%random.28%
    if %self.realroom% != %fly%
      mecho Огненный вихрь взлетел вверх!
      mteleport %self% %fly% 
      wait 1s
      mecho Огненный вихрь спустился сверху!
    end
  end
  
end
~
#92408
батлетригг элементала~
0 k 100
~
dg_cast 'огн шар'
dg_cast 'огн шар' 
~
#92409
путешествия огненного элементала~
0 ab 100
~
if %random.8% <4
  eval wait %random.10%
  wait %wait%s
  if !(%self.fighting%)
    eval fly 92411+%random.28%
    if %self.realroom% != %fly%
      mecho Огненный элементал нырнул в озеро!
      mteleport %self% %fly%  
      wait 1s
      mecho Огненный элементал вылетел на берег!
    end
  end
  
end
~
#92410
таймер портала~
2 ab 100
~
halt
if %random.30000% < 6
  wait 40000s
  calcuid volhv 49931 mob  
  attach 92425 %volhv.id%
  calcuid koldun 92413 mob   
  attach 92426 %koldun.id%
  if %random.5% == 1
    set rum 49947
  elseif %random.4% == 1
    set rum 49928
  elseif %random.3% == 1
    set rum 49976
  else
    set rum 49922
  end
  wat %rum% wecho Красная пентаграмма появилась в воздухе.
  wload mob 92410
  wteleport пентаграмма_92410 %rum%
  calcuid portal 92410 mob
  exec 92411 %portal.id%
  detach 92410 %self.id%
end
~
#92411
пентаграмма появилась - таймер работы~
0 z 100
~
attach 92412 %self.id%  
mload mob 92411 
mecho Пламенный страж вышел из пентаграммы!
mload mob 92411 
mecho Пламенный страж вышел из пентаграммы!
attach 92414 %self.id% 
wait 2400s
detach 92414 %self.id%  
mecho Пентаграмма загорелась ярче!
attach 92415 %self.id% 
wait 2400s
detach 92415 %self.id%
mecho Пентаграмма загорелась ярче!
attach 92416 %self.id%
wait 2400s
detach 92416 %self.id% 
mecho Пентаграмма загорелась ярче!
attach 92417 %self.id%
wait 2400s
detach 92417 %self.id% 
mecho Пентаграмма загорелась ярче!
attach 92418 %self.id%
wait 5000s   
calcuid pentroom 92453 room
exec 92413 %pentroom.id%  
mteleport портала_92411 92299
mteleport портала_92411 92299
~
#92412
пентаграмма уничтожена~
0 f 100
~
if %random.20% < 5    
  *если выпал шанс награды!
  set naem 0            
  *проверяем если ли в группе наемник 29+ без осторожки
  foreach chr %actor.group%
    if %chr.class% == 4 && %chr.level% > 28 && !%actor.skill(осторожн)%
      set naem %chr%
    end          
  done   
  *если наемник 29+ без осторожки есть - то он ее получает
  if %naem%
    mechoaround %naem% Божественный свет пролился на %naem.vname%!
    msend %naem% Внутри себя Вы услышали громовой голос Перуна!
    mskillturn %naem.name% осторожн set 
    *иначе лоадится либо руна власти либо руна погибели с равной вероятностью!
  elseif %random.2% == 1
    mload obj 220
  else
    mload obj 240
  end
end
calcuid pentroom 92453 room
exec 92413 %pentroom.id%  
mteleport портала_92411 92299
mteleport портала_92411 92299
~
#92413
перезапуск пенты~
2 z 100
~
if %world.curmobs(92410)%
  calcuid penta 92410 mob
  wechoaround %penta% Пентаграмма медленно растаяла!
  wpurge %penta% 
end    
wait 1s        
attach 92427 %self.id%
calcuid koldun 92413 mob   
detach 92426 %koldun.id%
calcuid volhv 49931 mob  
detach 92425 %volhv.id%
wait 40000s
attach 92410 %self.id% 
~
#92414
1-й час пентаграммы~
0 ab 100
~
if %random.20% == 1
  mecho Бес появился из пентаграммы!
  mload mob 92406
end
~
#92415
2-й час пентаграммы~
0 ab 100
~
if %random.20% == 1
  mecho Бес появился из пентаграммы!
  mload mob 92406
elseif %random.30% == 1
  mecho Черт появился из пентаграммы!
  mload mob 92407
end
~
#92416
3-й час пентаграммы~
0 ab 100
~
if %random.20% == 1
  mecho Бес появился из пентаграммы!
  mload mob 92406
elseif %random.30% == 1
  mecho Черт появился из пентаграммы!
  mload mob 92407 
elseif  %random.50% == 1
  mecho Саламандра появилась из пентаграммы!
  mload mob 92412
end
~
#92417
4-й час пентаграммы~
0 ab 100
~
if %random.20% == 1
  mecho Бес появился из пентаграммы!
  mload mob 92406
elseif %random.30% == 1
  mecho Черт появился из пентаграммы!
  mload mob 92407 
elseif %random.50% == 1
  mecho Саламандра появилась из пентаграммы!
  mload mob 92412 
elseif %random.75% == 1
  mecho Огненный великан появился из пентаграммы!
  mload mob 92406
end
~
#92418
5-6-й час пентаграммы~
0 ab 100
~
if %random.20% == 1
  mecho Бес появился из пентаграммы!
  mload mob 92406
elseif %random.30% == 1
  mecho Черт появился из пентаграммы!
  mload mob 92407 
elseif %random.50% == 1
  mecho Саламандра появилась из пентаграммы!
  mload mob 92412 
elseif %random.75% == 1
  mecho Огненный великан появился из пентаграммы!
  mload mob 92408
elseif %random.100% == 1
  mecho Огненный элементал появился из пентаграммы!
  mload mob 92409
end
~
#92419
войти портал~
0 c 1
войти~
if !%arg.contains(пентаграмма)% && %world.curmobs(92411)% && !%arg.contains(портал)%
  halt 
end  
mecho Красная пентаграмма слегка вспыхнула! 
wait 1s
if %actor.fighting%
  msend %actor% Вы не можете войти в пентаграмму во время боя!
  halt
end
mteleport %actor% 92453
mecho %actor.name% вошел в пентаграмму!
mechoaround %actor% %actor.name% появил%actor.g% из пентаграммы!
mremember %actor%
~
#92420
вторая попытка войти в пентаграмму~
0 o 100
~
вст
mecho Пентаграмма вспыхнула!
dg_cast 'огненный шар' %actor.name%
~
#92421
умер черт ~
0 f 100
~
eval numer 92401+%random.3%
eval altnum 92404+%random.3%
if %random.10% == 1 && %world.curobjs(%numer%)% < 3
  mload obj %numer%
end
if %random.10% == 1 && %world.curobjs(%altnum%)% < 3
  mload obj %altnum%
end
~
#92422
умерла саламандра  ~
0 f 100
~
eval numer 92407+%random.4%
eval altnum 92411+%random.4%
if %random.11% == 1 && %world.curobjs(%numer%)% < 3
  mload obj %numer%
end
if %random.11% == 1 && %world.curobjs(%altnum%)% < 3
  mload obj %altnum%
end
~
#92423
умер вихрь~
0 f 100
~
eval numer 92415+%random.2%
eval altnum 92417+%random.2%
if %random.7% == 1 && %world.curobjs(%numer%)% < 3
  mload obj %numer%
end
if %random.7% == 1 && %world.curobjs(%altnum%)% < 3
  mload obj %altnum%
end
~
#92424
умер великан~
0 f 100
~
if %random.7% == 1 && %world.curobjs(92420)% < 3
  mload obj 92420
end
if %random.7% == 1 && %world.curobjs(92421)% < 3
  mload obj 92421
end
~
#92425
волхв предупреждает о открытом портале!~
0 ab 100
~
if %random.7% == 1
  mshou Чую сильную волшбу в Стольном Граде Киеве!
  wait 1s
  mshou Никак опять твари из Царства мертвых открыли портал огненный!
  wait 60s
end
~
#92426
умер безумный колдун во время открытого портала~
0 f 100
~
*calcuid pentroom 92453 room
*exec 92413 %pentroom.id%  
*mteleport портала_92411 92299
*mteleport портала_92411 92299
if %random.10% < 3
  mload obj 563
end
~
#92427
крутые мобы после уничтожения пенты разбегаются ~
2 ab 100
~
if %world.curmobs(92409)%  
  calcuid target 92409 mob
  wechoaround %target% Огненный элементал растворился в воздухе!
  wpurge %target%                                        
elseif %world.curmobs(92408)%
  calcuid target 92408 mob
  wechoaround %target% Огненный великан провалился под землю!
  wpurge %target%                                        
elseif %world.curmobs(92412)%
  calcuid target 92412 mob
  wechoaround %target% Саламандра быстро зарылась в землю!
  wpurge %target%       
else
  detach 92427 %self.id%   
end  
*а чертей и бесов стража(мб и игроки) поубивают                          
~
$~
