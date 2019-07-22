#92200
Башо - поддерживает количество скелетов-воинов~
0 ab 100
~
if %world.curmobs(92213)% < 4
  mecho _________Башо создал скелета воина!
  mload  mob 92213
end
~
#92201
Кэлос - поддерживает количество костяных драконов~
0 ab 100
~
if %world.curmobs(92204)% < 1
  mecho _________Кэлос создал костяного дракона!
  mload  mob 92204
elseif %world.curmobs(92205)% < 1
  mecho _________Кэлос создал костяного дракона!
  mload  mob 92205
elseif %world.curmobs(92206)% < 1
  mecho _________Кэлос создал костяного дракона!
  mload  mob 92206
end
~
#92202
Рольт - поддерживает количество адских гончих~
0 ab 100
~
if %world.curmobs(92207)% < 1
  mecho _________Рольт призвал адскую гончую!
  mload  mob 92207
elseif %world.curmobs(92208)% < 1
  mecho _________Рольт призвал адскую гончую!
  mload  mob 92208
elseif %world.curmobs(92209)% < 1
  mecho _________Рольт призвал адскую гончую!
  mload  mob 92209
end
~
#92203
Ярпен - поддерживает количество скелетов~
0 ab 100
~
if %world.curmobs(92210)% < 1
  mecho _________Ярпен оживил труп!
  mload  mob 92210
elseif %world.curmobs(92211)% < 1
  mecho _________Ярпен создал скелета!
  mload  mob 92211
elseif %world.curmobs(92212)% < 1
  mecho _________Ярпен создал скелета!
  mload  mob 92212
end
~
#92204
тригг вооружения скелета воина~
0 ab 100
~
wait 1s
mload obj 92200
mload obj 92201  
взя все
оде все
воо меч
wait 1s
detach 92204 %self.id%
~
#92205
баттлетригг скелета-воина~
0 k 100
~
if %random.2% == 1
  set target %random.pc%
  foreach next %self.pc%
    eval hit %next.hitp%
    if %next.affect(призматическая.аура)%
      eval hit %hit% / 2
    end
    if %next.affect(огненный щит)%
      eval hit %hit% * 23 / 20
    end
    if %next.affect(ледяной щит)%
      eval hit %hit% * 14 / 10
    end
    if %next.affect(воздушный щит)%
      eval hit %hit% * 14 / 10
    end
    if %next.affect(освящение)%
      eval hit %hit% * 2
    end
    if (!%next.affect(воздушный щит)%)  && %next.affect(ледяной щит)% && %next.affect(огненный щит)%
      if %next.position% < 5
        eval hit %hit%/2
      elseif %next.position% < 6
        eval hit %hit%*2/3
      elseif %next.position% < 7
        eval hit %hit%*3/4
      end
    end
    if  %next.affect(оцепенение)% ||  %next.affect(длительное оцепенение)% 
      eval hit %hit%*3/4
    end
    if %next.affect(защита богов)%
      set hit 30000
      if %random.3% == 1
        dg_cast 'лег вред' %next.name%
      end
    end
    if %hit% < %target.hitp%
      makeuid target %next.id%
    end
  done
  mecho Скелет воин обратил на %target.vname% свой жуткий взгляд!
  dg_cast 'прокл' %target.name%
  wait 1s
  атак %target.name%
  wait 4s
end
~
#92206
автолечение нежити~
0 k 100
~
dg cast 'крит исц'
~
#92207
вызов чернокнижника~
2 e 100
~
if %random.4% == 1
  wait 3s
  halt
end
eval wait %random.10%
wait %wait%s
eval mobvnum %random.4% +92199
if %mobvnum% == 92201
  halt
end
if !%world.curmobs(%mobvnum%)%
  wait 7s
  halt
end 
calcuid attaker %mobvnum% mob   
wteleport %attaker% %self.vnum%
wecho Серый портал появился в воздухе!
wecho Из портала дыхнуло холодом!
wecho %attaker.name% появился из портала!
eval tnum %mobvnum%+8
exec %tnum% %attaker.id%
wait 1s
wecho Портал задрожал и исчез!
eval wait %random.30%+20
wait %wait%s
halt
~
#92208
Триггер атаки Кэлоса~
0 z 100
~
*рекол если никого нету
if !%random.pc% 
  exec 92212 %self.id%
  halt
end
mteleport костяной1 %self.realroom%
mteleport костяной2 %self.realroom%
mteleport костяной3 %self.realroom%
mecho Костяные драконы появились из портала!
set target1 %random.pc%
set tnum 1
eval mode %random.100%
set target2 0
set target3 0
foreach next %self.pc%
  *вычисление наиболее уязвимой цели если сценарий это предусматривает
  if %mode%>50 
    eval hit %next.hitp%
    if %next.affect(призматическая.аура)%
      eval hit %hit% / 2
    end
    if %next.affect(огненный щит)%
      eval hit %hit% * 23 / 20
    end
    if %next.affect(ледяной щит)%
      eval hit %hit% * 14 / 10
    end
    if %next.affect(воздушный щит)%
      eval hit %hit% * 14 / 10
    end
    if %next.affect(освящение)%
      eval hit %hit% * 2
    end
    if (!%next.affect(воздушный щит)%)  && %next.affect(ледяной щит)% && %next.affect(огненный щит)%
      if %next.position% < 5
        eval hit %hit%/2
      elseif %next.position% < 6
        eval hit %hit%*2/3
      elseif %next.position% < 7
        eval hit %hit%*3/4
      end
    end
    if  %next.affect(оцепенение)% ||  %next.affect(длительное оцепенение)% 
      eval hit %hit%*3/4
    end
    if %next.affect(защита богов)%
      set hit 30000
    end
  end
  *вычисление цели сооответственно сценарию
  if %mode%<11 
    if %next.class% == 5
      makeuid target1 %next.id%
    end
  elseif %mode%<31
    if %next.leader%
      set target1 %next.leader%
    end
  elseif %mode%<51
    if %next.class% == 0
      set target3 %target2%
      set target2 %target1%
      makeuid target1 %next.id%
    end
  elseif %mode%<76
    if %target1.hitp% < %hit%
      makeuid target1 %next.id%
    end
  else
    if %target1.hitp% < %hit%
      set target3 %target2%
      set target2 %target1%
      makeuid target1 %next.id%
    end
  end
done
*присвоение неустановленных целей
if !%target3%
  set target3 %target1%
end
if !%target2%
  set target2 %target1%
end
if (%world.curmobs(92204)%>0)
  calcuid drak1 92204 mob
  set draktarget1 %target1.id%
  remote draktarget1 %drak1.id%
  exec 92217 %drak1.id%
end
if (%world.curmobs(92205)%>0)
  calcuid drak2 92205 mob
  set draktarget2 %target2.id%
  remote draktarget2 %drak2.id%
  exec 92218 %drak2.id%
end
if (%world.curmobs(92206)%>0)
  calcuid drak3 92206 mob
  set draktarget3 %target3.id%
  remote draktarget3 %drak3.id%
  exec 92219 %drak3.id%
end
*рекол если сценарий его предусматривает
wait 1s
if %mode%>10
  exec 92212 %self.id%
end
~
#92209
тригг одевания брони батырам~
0 ab 100
~
if %random.5% == 1
  eval wait %random.30%
  wait %wait%s
  mload obj 92202
  mload obj 92201
  mload obj 92207 
  взя все
  оде все
  wait 1s
  detach 92209 %self.id%
end
~
#92210
Триггер атаки Ярпена~
0 z 100
~
if !%random.pc%
  exec 92214 %self.id%
  halt
end
if %exist.mob(92210)%
  mforce большой1 вст
  mteleport большой1 %self.realroom%
end
if %exist.mob(92211)%
  mforce ловкий1 вст
  mteleport ловкий1 %self.realroom%
end
if %exist.mob(92212)%
  mforce ловкий2 вст
  mteleport ловкий2 %self.realroom%
end
mecho Мертвецы появились из портала!
set target1 %random.pc%
set tnum 1
eval mode %random.100%
set target2 0
set target3 0
foreach next %self.pc%
  eval hit %next.hitp%
  if %next.affect(призматическая.аура)%
    eval hit %hit% / 2
  end
  if %next.affect(огненный щит)%
    eval hit %hit% * 23 / 20
  end
  if %next.affect(ледяной щит)%
    eval hit %hit% * 14 / 10
  end
  if %next.affect(воздушный щит)%
    eval hit %hit% * 14 / 10
  end
  if %next.affect(освящение)%
    eval hit %hit% * 2
  end
  if (!%next.affect(воздушный щит)%)  && %next.affect(ледяной щит)% && %next.affect(огненный щит)%
    if %next.position% < 5
      eval hit %hit%/2
    elseif %next.position% < 6
      eval hit %hit%*2/3
    elseif %next.position% < 7
      eval hit %hit%*3/4
    end
  end
  if  %next.affect(оцепенение)% ||  %next.affect(длительное оцепенение)% 
    eval hit %hit%*3/4
  end
  if %next.affect(защита богов)%
    set hit 30000
  end
  if %mode%<11
    if %next.class% == 5
      makeuid target1 %next.id%
    end
  elseif %mode%<21
    if %next.leader%
      set target1 %next.leader%
    end
  elseif %mode%<36
    if %next.class% == 0 && !%next.affect(защита богов)%
      makeuid target1 %next.id%
    end
  elseif %mode%<51
    if %target1.hitp% < %hit%
      makeuid target1 %next.id%
    end
  else
    if %target1.hitp% < %hit%
      set target3 %target2%
      set target2 %target1%
      makeuid target1 %next.id%
    end
  end
done
if !%target3%
  set target3 %target1%
end
if !%target2%
  set target2 %target1%
end
mecho Ярпен отдал приказ!
if %exist.mob(92210)%
  calcuid drak1 92210 mob
  set draktarget1 %target1.id%
  remote draktarget1 %drak1.id%
  exec 92217 %drak1.id%
end
if %exist.mob(92211)%
  calcuid drak2 92211 mob
  set draktarget2 %target2.id%
  remote draktarget2 %drak2.id%
  exec 92218 %drak2.id%
end
if %exist.mob(92212)%
  calcuid drak3 92212 mob
  set draktarget3 %target3.id%
  remote draktarget3 %drak3.id%
  exec 92219 %drak3.id%
end
wait 1s
if %mode%>20
  exec 92214 %self.id%
end
~
#92211
Триггер атаки Рольта~
0 z 100
~
if !%random.pc%
  exec 92215 %self.id%
  halt
end
if (%exist.mob(92207)%)
  calcuid helldogone 92207 mob
  eval tmp %helldogone.position(8)%
  mteleport %helldogone% %self.realroom%
end
if (%exist.mob(92208)%)
  calcuid helldogtwo 92208 mob
  eval tmp %helldogtwo.position(8)%
  mteleport %helldogtwo% %self.realroom%
end
if (%exist.mob(92209)%)
  calcuid helldogtri 92209 mob
  eval tmp %helldogtri.position(8)%
  mteleport %helldogtri% %self.realroom%
end
mecho Адские гончии появились из портала!
set target1 %random.pc%
set tnum 1
eval mode %random.100%
set target2 0
set target3 0
foreach next %self.pc%
  eval hit %next.hitp%
  if %next.affect(призматическая.аура)%
    eval hit %hit% * 2
  end
  if %next.affect(огненный щит)%
    eval hit %hit% * 23 / 20
  end
  if %next.affect(ледяной щит)%
    eval hit %hit% * 14 / 10
  end
  if %next.affect(воздушный щит)%
    eval hit %hit% * 14 / 10
  end
  if %next.affect(освящение)%
    eval hit %hit% / 2
  end
  if (!%next.affect(воздушный щит)%)  && %next.affect(ледяной щит)% && %next.affect(огненный щит)%
    if %next.position% < 5
      eval hit %hit%/2
    elseif %next.position% < 6
      eval hit %hit%*2/3
    elseif %next.position% < 7
      eval hit %hit%*3/4
    end
  end
  if  %next.affect(оцепенение)% ||  %next.affect(длительное оцепенение)% 
    eval hit %hit%*3/4
  end
  if %next.affect(защита богов)%
    set hit 30000
  end
  if %mode%<41
    if %next.class% == 5
      makeuid target1 %next.id%
    end
  elseif %mode%<71
    if %next.leader%
      set target1 %next.leader%
    end
  else
    if %target1.hitp% < %hit%
      set target3 %target2%
      set target2 %target1%
      makeuid target1 %next.id%
    end
  end
done
if !%target3%
  set target3 %target1%
end
if !%target2%
  set target2 %target1%
end
mecho Рольт отдал приказ! 
calcuid drak1 92207 mob
calcuid drak2 92208 mob
calcuid drak3 92209 mob
set draktarget1 %target1.id%
set draktarget2 %target2.id%
set draktarget3 %target3.id%
remote draktarget1 %drak1.id%
remote draktarget2 %drak2.id%
remote draktarget3 %drak3.id%
exec 92217 %drak1.id%
exec 92218 %drak2.id%
exec 92219 %drak3.id%
wait 1s
if %mode%>10
  exec 92215 %self.id%
end
~
#92212
рекол Кэлоса~
0 z 100
~
if %self.realroom% != 92228 && %self.realroom% != 92226 && %self.realroom% != 92223
  eval room %random.3%
  mecho Кэлос взял свиток возврата в левую руку.
  mecho Кэлос зачитал свиток возврата.
  switch %room%
    case 1
      mteleport кэлос_моб 92228
    break
    case 2
      mteleport кэлос_моб 92226
    break
    case 3
      mteleport кэлос_моб 92223
    break
  done
end
~
#92213
дополнительный сценарий боя Башо~
0 z 100
~
foreach next %self.pc%
  eval hit %next.hitp%
  if %next.affect(призматическая.аура)%
    eval hit %hit% * 2
  end
  if %next.affect(огненный щит)%
    eval hit %hit% * 23 / 20
  end
  if %next.affect(ледяной щит)%
    eval hit %hit% * 14 / 10
  end
  if %next.affect(воздушный щит)%
    eval hit %hit% * 14 / 10
  end
  if %next.affect(освящение)%
    eval hit %hit% / 2
  end
  if (!%next.affect(воздушный щит)%)  && %next.affect(ледяной щит)% && %next.affect(огненный щит)%
    if %next.position% < 5
      eval hit %hit%/2
    elseif %next.position% < 6
      eval hit %hit%*2/3
    elseif %next.position% < 7
      eval hit %hit%*3/4
    end
  end
  if  %next.affect(оцепенение)% ||  %next.affect(длительное оцепенение)% 
    eval hit %hit%*3/4
  end
  if %next.affect(защита богов)%
    set hit 30000
  end
  if %target1.hitp% < %hit%
    makeuid target1 %next.id%
  end
done
mecho Башо взял свиток ярости в левую руку.
mecho Башо зачитал свиток ярости.
gd_cast 'гнев бог' %target1.name%
атак %target1.name%
~
#92214
рекол Ярпена~
0 z 100
~
if %self.realroom% != 92227 && %self.realroom% != 92225 && %self.realroom% != 92224
  eval room %random.3%
  mecho Ярпен взял свиток возврата в левую руку.
  mecho Ярпен зачитал свиток возврата.
  switch %room%
    case 1
      mteleport ярпен_моб 92227
    break
    case 2
      mteleport ярпен_моб 92225
    break
    case 3
      mteleport ярпен_моб 92224
    break
  done
end
~
#92215
рекол Рольта~
0 z 100
~
if %self.realroom% != 92218 && %self.realroom% != 92219 && %self.realroom% != 92220
  eval room %random.3%
  mecho Рольт взял свиток возврата в левую руку.
  mecho Рольт зачитал свиток возврата.
  switch %room%
    case 1
      mteleport рольт_моб 92218
    break
    case 2
      mteleport рольт_моб 92219
    break
    case 3
      mteleport рольт_моб 92220
    break
  done
end
~
#92216
Баттлетриг чернокнижника~
0 k 100
~
dg_cast 'ув жиз'
if %random.3% == 1
  eval target %random.pc% 
  dg_cast 'вы жиз' %target.name%
  unset target
end
if %random.50% == 1
  mecho %self.name% произнес неизвестное заклинание.
  eval target %random.pc% 
  dg_cast 'камен прокл' %target.name%
  unset target
end
if %self.hitp% < 1000 && %random.3%==1
  if %random.4% == 1
    eval tnum %self.vnum% + 12
    exec %tnum% %self.id%
  else
    mecho %self.name% взял свиток исцеления в левую руку.
    mecho %self.name% зачитал свиток исцеления.
    dg_cast 'исцел'
  end
end
~
#92217
атака дракона 1~
0 z 100
~
mkill %draktarget1%  
dg_cast 'лег вре' %draktarget1.name%
wait 2s
unset %draktarget1%
~
#92218
атака дракона 2~
0 z 100
~
mkill %draktarget2%  
dg_cast 'лег вре' %draktarget2.name%
wait 2s
unset %draktarget2%
~
#92219
атака дракона 3~
0 z 100
~
mkill %draktarget3%  
dg_cast 'лег вре' %draktarget3.name%
wait 2s
unset %draktarget3%
~
#92220
тригг вооружения чаров-воинов~
0 ab 100
~
if %random.5% == 1
  eval wait %random.30%
  wait %wait%s
  mload obj 92202
  mload obj 92201
  mload obj 92203
  mload obj 92204
  взя все  
  оде все
  воо топор
  дер сабл
  wait 1s
  detach 92220 %self.id%
end
~
#92221
тригг вооружения Тэрсайда~
0 ab 100
~
if !%self.haveobj(92202)%
  mload obj 92202
  mload obj 92201
  mload obj 92205
  взя все
  оде все
  дер кинжал
end
if !%self.haveobj(92206)%
  mload obj 92206
  воо копье
end
end        
~
#92222
баттлетригг заберя (атакует лекарей 80%, самого слабого 20%)~
0 k 100
~
eval mode %random.20%
if %mode% > 3
  halt
end
set target1 %random.pc%
foreach next %self.pc%
  eval hit %next.hitp%
  if %next.affect(призматическая.аура)%
    eval hit %hit% / 2
  end
  if %next.affect(огненный щит)%
    eval hit %hit% * 23 / 20
  end
  if %next.affect(ледяной щит)%
    eval hit %hit% * 14 / 10
  end
  if %next.affect(воздушный щит)%
    eval hit %hit% * 14 / 10
  end
  if %next.affect(освящение)%
    eval hit %hit% * 2
  end
  if (!%next.affect(воздушный щит)%)  && %next.affect(ледяной щит)% && %next.affect(огненный щит)%
    if %next.position% < 5
      eval hit %hit%/2
    elseif %next.position% < 6
      eval hit %hit%*2/3
    elseif %next.position% < 7
      eval hit %hit%*3/4
    end
  end
  if  %next.affect(оцепенение)% ||  %next.affect(длительное оцепенение)% 
    eval hit %hit%*3/4
  end
  if %next.affect(защита богов)%
    set hit 30000
  end
  if %mode% == 1
    if %target1.hitp% < %hit%
      makeuid target1 %next.id%
    end
  else
    if %target1.hitp% < %hit%  && %target1.class% == 0
      makeuid target1 %next.id%
    end 
  end
done
if !%self.attackers% && %self.fighting%
  mecho Заберь оступил из боя и потерялся из вида!
  mteleport заберь_моб 92299
  wait 2s
  mteleport заберь_моб %target1.realroom%
  mecho В тени горящего черепа Вы заметили Заберя!
  wait 1s
  dg_cast 'прокл' .%target1.name%
else
  dg_cast 'прокл' .%target1.name%
  атак .%target1.name%
end
~
#92223
баттлетригг кроу (атакует магов 80%, самого слабого 20%)~
0 k 100
~
eval mode %random.20%
if %mode% > 3
  halt
end
set target1 %random.pc%
foreach next %self.pc%
  eval hit %next.hitp%
  if %next.affect(призматическая.аура)%
    eval hit %hit% / 2
  end
  if %next.affect(огненный щит)%
    eval hit %hit% * 23 / 20
  end
  if %next.affect(ледяной щит)%
    eval hit %hit% * 14 / 10
  end
  if %next.affect(воздушный щит)%
    eval hit %hit% * 14 / 10
  end
  if %next.affect(освящение)%
    eval hit %hit% * 2
  end
  if (!%next.affect(воздушный щит)%)  && %next.affect(ледяной щит)% && %next.affect(огненный щит)%
    if %next.position% < 5
      eval hit %hit%/2
    elseif %next.position% < 6
      eval hit %hit%*2/3
    elseif %next.position% < 7
      eval hit %hit%*3/4
    end
  end
  if  %next.affect(оцепенение)% ||  %next.affect(длительное оцепенение)% 
    eval hit %hit%*3/4
  end
  if %next.affect(защита богов)%
    set hit 30000
  end
  if %mode% == 1
    if %target1.hitp% < %hit%
      makeuid target1 %next.id%
    end
  else
    if %target1.hitp% < %hit%  && (%target1.class% == 1 || %target1.class% == 6 || %target1.class% == 7)
      makeuid target1 %next.id%
    end 
  end
done
set i 0
foreach j %self.attackers%
done
if !%self.attackers% && %self.fighting%
  mecho Кроу оступил из боя и потерялся из вида!
  mteleport кроу_моб 92299
  wait 2s
  mteleport кроу_моб %target1.realroom%
  mecho В тени горящего черепа Вы заметили Кроу!
  wait 1s
  dg_cast 'прокл' .%target1.name%
else
  dg_cast 'прокл' .%target1.name%
  атак .%target1.name%
end
~
#92224
баттлетригг Мирта~
0 k 100
~
if %world.curmobs(92214)%
  calcuid zaber 92214 mob
end
if %world.curmobs(92215)%
  calcuid krou 92215 mob
end
if %self.hitp% < 1400 && %random.8% == 1
  mecho Мирт прекратил использовать саблю.
  mecho Мирт взял напиток сурья в левую руку.
  mecho Мирт осушил напиток сурья.
  dg_cast 'исцелен'
  mecho Мирт взял саблю в левую руку.
  halt
end
if (%zaber.hitp% >500 && %krou.hitp% > 500) || %random.4% == 1
  halt
end
if %zaber.hitp% < %crou.hitp%
  if %zaber%  
    exec 92225 %zaber.id%
  end
else
  if %crou%  
    exec 92226 %crou.id%
  end
end
~
#92225
рекол и возврат заберя~
0 z 100
~
if %world.curmobs(92216)%
  calcuid mirt 92216 mob
end
calcuid room %self.realroom% room
mecho Мирт прекратил использовать саблю.
mecho Мирт взял свиток возврата в левую руку.
mecho Мирт зачитал свиток возврата.
mteleport заберь_моб 92299
mecho Мирт взял саблю в левую руку.
dg_cast 'исцел'
dg_cast 'выл сле'
dg_cast 'сня про'
dg_cast 'вы лих'
dg_cast 'сня молч'
вст
eval wait %random.5% + 4
wait %wait%s
if %world.curmobs(92216)% == 1
  mat %mirt.realroom% mecho Серый портал появился в  воздухе!
  mteleport заберь_моб %mirt.realroom%
  mecho Заберь появился из портала!
  wait 1s
  mecho Портал задрожал и растворился в  воздухе.
else
  mat %room.vnum% mecho Серый портал появился в  воздухе!
  mteleport заберь_моб %room.vnum%
  mecho Заберь появился из портала!
  wait 1s
  mecho Портал задрожал и растворился в  воздухе.
end
~
#92226
рекол и возврат кроу~
0 z 100
~
if %world.curmobs(92216)%
  calcuid mirt 92216 mob
end
calcuid room %self.realroom% room
mecho Мирт прекратил использовать саблю.
mecho Мирт взял свиток возврата в левую руку.
mecho Мирт зачитал свиток возврата.
mteleport кроу_моб 92299
mecho Мирт взял саблю в левую руку.
dg_cast 'исцел'
dg_cast 'выл сле'
dg_cast 'сня про'
dg_cast 'вы лих'
dg_cast 'сня молч'
вст
eval wait %random.5% + 4
wait %wait%s
if %world.curmobs(92216)%
  mat %mirt.realroom% mecho Серый портал появился в  воздухе!
  mteleport кроу_моб %mirt.realroom%
  mecho Кроу появился из портала!
  wait 1s
  mecho Портал задрожал и растворился в  воздухе.
else
  mat %room.vnum% mecho Серый портал появился в  воздухе!
  mteleport кроу_моб %room.vnum%
  mecho Кроу появился из портала!
  wait 1s
  mecho Портал задрожал и растворился в  воздухе.
end
~
#92227
баттлетригг Мюрата~
0 k 100
~
if %world.curmobs(92219)%
  calcuid kiton 92219 mob
end
if %world.curmobs(92220)%
  calcuid terside 92220 mob
end
if %self.hitp% < 1400 && %random.8% == 1
  mecho Мюрат прекратил использовать саблю.
  mecho Мюрат взял напиток сурья в левую руку.
  mecho Мюрат осушил напиток сурья.
  dg_cast 'исцелен'
  mecho Мюрат взял саблю в левую руку.
  halt
end
if (%kiton.hitp% >500 && %terside.hitp% > 500) || %random.4% == 1
  halt
end
if %kiton.hitp% < %terside.hitp%
  exec 92228 %kiton.id%
else
  exec 92229 %terside.id%
end
~
#92228
рекол и возврат китона~
0 z 100
~
if %world.curmobs(92218)%
  calcuid myrat 92218 mob
end
calcuid room %self.realroom% room
mecho Мюрат прекратил использовать саблю.
mecho Мюрат взял свиток возврата в левую руку.
mecho Мюрат зачитал свиток возврата.
mteleport китон_моб 92299
mecho Мюрат взял саблю в левую руку.
dg_cast 'исцел'
dg_cast 'выл сле'
dg_cast 'сня про'
dg_cast 'вы лих'
dg_cast 'сня молч'
вст
eval wait %random.5% + 4
wait %wait%s
if %world.curmobs(92218)%
  mat %myrat.realroom% mecho Серый портал появился в  воздухе!
  mteleport китон_моб %myrat.realroom%
  mecho Китон появился из портала!
  wait 1s
  mecho Портал задрожал и растворился в  воздухе.
else
  mat %room.vnum% mecho Серый портал появился в  воздухе!
  mteleport китон_моб %room.vnum%
  mecho Китон появился из портала!
  wait 1s
  mecho Портал задрожал и растворился в  воздухе.
end
~
#92229
рекол и возврат тэрсайда~
0 z 100
~
if %world.curmobs(92218)%
  calcuid myrat 92218 mob
end
calcuid room %self.realroom% room
mecho Мюрат прекратил использовать саблю.
mecho Мюрат взял свиток возврата в левую руку.
mecho Мюрат зачитал свиток возврата.
mteleport тэрсайд_моб 92299
mecho Мюрат взял саблю в левую руку.
dg_cast 'исцел'
dg_cast 'выл сле'
dg_cast 'сня про'
dg_cast 'вы лих'
dg_cast 'сня молч'
вст
eval wait %random.5% + 4
wait %wait%s
if %world.curmobs(92218)%
  mat %myrat.realroom% mecho Серый портал появился в  воздухе!
  mteleport тэрсайд_моб %myrat.realroom%
  mecho Тэрсайд появился из портала!
  wait 1s
  mecho Портал задрожал и растворился в  воздухе.
else
  mat %room.vnum% mecho Серый портал появился в  воздухе!
  mteleport тэрсайд_моб %room.vnum%
  mecho Тэрсайд появился из портала!
  wait 1s
  mecho Портал задрожал и растворился в  воздухе.
end
~
#92230
баттлетригг китона (атакует магов 80%, самого слабого 20%)~
0 k 100
~
eval mode %random.20%
if %mode% > 3
  halt
end
set target1 %random.pc%
foreach next %self.pc%
  eval hit %next.hitp%
  if %next.affect(призматическая.аура)%
    eval hit %hit% / 2
  end
  if %next.affect(огненный щит)%
    eval hit %hit% * 23 / 20
  end
  if %next.affect(ледяной щит)%
    eval hit %hit% * 14 / 10
  end
  if %next.affect(воздушный щит)%
    eval hit %hit% * 14 / 10
  end
  if %next.affect(освящение)%
    eval hit %hit% * 2
  end
  if (!%next.affect(воздушный щит)%)  && %next.affect(ледяной щит)% && %next.affect(огненный щит)%
    if %next.position% < 5
      eval hit %hit%/2
    elseif %next.position% < 6
      eval hit %hit%*2/3
    elseif %next.position% < 7
      eval hit %hit%*3/4
    end
  end
  if  %next.affect(оцепенение)% ||  %next.affect(длительное оцепенение)% 
    eval hit %hit%*3/4
  end
  if %next.affect(защита богов)%
    set hit 30000
  end
  if %mode% == 1
    if %target1.hitp% < %hit%
      makeuid target1 %next.id%
    end
  else
    if %target1.hitp% < %hit%  && (%target1.class% == 1 || %target1.class% == 6 || %target1.class% == 7)
      makeuid target1 %next.id%
    end 
  end
done
set i 0
foreach j %self.attakers%
done
if !%self.attackers% && %self.fighting%
  mecho Китон оступил из боя и потерялся из вида!
  mteleport китон_моб 92299
  wait 2s
  mteleport китон_моб %target1.realroom%
  mecho В тени горящего черепа Вы заметили Китона!
  wait 1s
  dg_cast 'прокл' .%target1.name%
else
  dg_cast 'прокл' .%target1.name%
  атак .%target1.name%
end
~
#92231
Баттлтригг Руты~
0 k 100
~
if %self.position% < 7
  halt
end
if %random.9% == 1
  dg_cast 'защит бог'
end
if %random.100% == 1
  mtransform 92227  
end
~
#92232
Баттлетригг Жиглона-ожидание режима реска~
0 k 100
~
if %world.curmobs(92227)%
  calcuid ryta 92227 mob
end
if %ryta.hitp% < 1000
  mtransform 92225
  attach 92233 %self.id%
  detach 92232 %self.id%
end
~
#92233
Баттлетригг Жиглона-ожидание боевого режима~
0 k 100
~
if %world.curmobs(92227)%
  calcuid ryta 92227 mob
end
if %ryta.hitp% > 2000
  mtransform 92224
  attach 92232 %self.id%
  detach 92233 %self.id%
end
~
#92234
Баттлетригг Дарана-ожидание режима реска~
0 k 100
~
if %world.curmobs(92227)%
  calcuid ryta 92227 mob
end
if %ryta.hitp% < 1000
  mtransform 92223
  attach 92235 %self.id%
  detach 92234 %self.id%
end
~
#92235
Баттлетригг Дарана-ожидание боевого режима~
0 k 100
~
if %world.curmobs(92227)%
  calcuid ryta 92227 mob
end
if %ryta.hitp% > 2000
  mtransform 92222
  attach 92234 %self.id%
  detach 92235 %self.id%
end
~
#92236
поглядеть замок~
2 c 1
поглядеть~
if !%arg.contains(замок)%
  wsend %actor% И что же вы так внимательно осматриваете?
  halt
end
if ((%actor.class% != 2) && !%actor.haveobj(92103)%)
  wsend %actor% Вы считаете себя большим специалистом по замкам?
  wechoaround %actor% %actor.name% посмотрел%actor.g% на замок, как баран на новые ворота!
  halt
end
if %actor.level% < 29 
  wsend %actor% Внимательно осмотрев замок Вы ничего не смогли понять.   
  wechoaround %actor% %actor.name% осмотрел%actor.g% замок и задумчиво почесал затылок!
  halt
end 
if %actor.skill(взломать)% > 100  %actor.intadd% > 20
  wsend %actor% Хитрый механизм, пришла в голову мысль, но если...
  wsend %actor% Правая рука рефлекторно потянулась за отмычкой.
  wsend %actor% Вы ловко ковырнули отмычкой, и дверь с грохотом распахнулась!
  wechoaround %actor% %actor.name% осмотрел%actor.g% замок, в ^%actor.name% глазах мелькнула догадка!
  wechoaround %actor% %actor.name% привычным движением потянул%actor.u% за отмычкой.
  wechoaround %actor% %actor.name% начал%actor.g% ковырятся отмычкой в замке.
  wechoaround %actor% Замок щелкнул и дверь с грохотом распахнулась!    
  wdoor 92256 west purge  
  wdoor 92256 west room 92300
  attach 92253 %self.id%
  detach 92236 %self.id%
elseif %actor.haveobj(92103)%
  wsend %actor% Вы всунули стебелек разрыв-травы в отверстие для ключа.
  wechoaround %actor% %actor.name% сунул%actor.g% в отверстие для ключа какую-то траву.
  wecho С страшным грохотом дверь разлетелась в щепки.
  wdoor 92256 west purge  
  wdoor 92256 west room 92300
  attach 92253 %self.id%
  detach 92236 %self.id%
else
  wsend %actor% Вы осмотрели замок и поняли - для отмычки у Вас навыков маловато.
  wsend %actor% Была бы с собой разрыв трава - мелькнула давняя мечта взломщика.
  wsend %actor% Перед ней ни один замок не устоит.
  wechoaround %actor% %actor.name% осмотрел%actor.g% замок, и разочарованно вздохнул%actor.g%!
end
~
#92243
рекол и возврат биглона~
0 z 100
~
if %world.curmobs(92221)%
  calcuid andora 92221 mob
end
calcuid room %self.realroom% room
mecho Андора прекратила использовать саблю.
mecho Андора взяла свиток возврата в левую руку.
mecho Андора зачитала свиток возврата.
mteleport биглон_моб 92299
mecho Андора взяла саблю в левую руку.
dg_cast 'исцел'
dg_cast 'исцел'
dg_cast 'выл сле'
dg_cast 'сня про'
dg_cast 'вы лих'
dg_cast 'сня молч'
вст
маскиров
eval wait %random.7% + 7
wait %wait%s
if %world.curmobs(92227)% == 1
  mteleport биглон_моб %andora.realroom%
else
  mteleport биглон_моб %room.vnum%
end
set target1 %random.pc%
foreach next %self.pc%
  eval hit %next.hitp%
  if %next.affect(призматическая.аура)%
    eval hit %hit% / 2
  end
  if %next.affect(огненный щит)%
    eval hit %hit% * 23 / 20
  end
  if %next.affect(ледяной щит)%
    eval hit %hit% * 14 / 10
  end
  if %next.affect(воздушный щит)%
    eval hit %hit% * 14 / 10
  end
  if %next.affect(освящение)%
    eval hit %hit% * 2
  end
  if (!%next.affect(воздушный щит)%)  && %next.affect(ледяной щит)%
    if %next.position% < 5
      eval hit %hit%/2
    elseif %next.position% < 6
      eval hit %hit%*2/3
    elseif %next.position% < 7
      eval hit %hit%*3/4
    end
  end
  if  %next.affect(оцепенение)% ||  %next.affect(длительное оцепенение)% 
    eval hit %hit%*3/4
  end
  if %next.affect(защита богов)%
    set hit 30000
  end
  if %target1.hitp% < %hit%
    makeuid target1 %next.id%
  end
done
заколоть .%target1.name%
~
#92244
баттлетригг Андоры~
0 k 100
~
if %world.curmobs(92226)%
  calcuid biglon 92226 mob
else
  halt
end
if %self.hitp% < 1400 && %random.8% == 1
  mecho Андора прекратила использовать саблю.
  mecho Андора взяла напиток сурья в левую руку.
  mecho Андора осушила напиток сурья.
  dg_cast 'исцелен'
  mecho Андора взяла саблю в левую руку.
  halt
end
if (%biglon.hitp% >900 || %random.4% == 1)
  halt
end
exec 92243 %biglon.id%
~
#92245
дабы не одевали мобстафф ~
1 j 100
~
if %actor.vnum% < 92200 || %actor.vnum% > 92399
  wait 1s
  opurge %self%
end
~
#92246
умер чернокнижник~
0 f 100
~
if %world.curobjs(92208)% < 2 && %random.12% == 1
  mload obj 92208          
end
~
#92247
умер кузнец~
0 f 100
~
if %world.curobjs(92209)% < 2 && %random.9% == 1
  mload obj 92209          
end
~
#92248
умер витязь~
0 f 100
~
if %world.curobjs(92210)% < 2 && %random.4% == 1
  mload obj 92210          
end
~
#92249
умер купец~
0 f 100
~
if %world.curobjs(92211)% < 2 && %random.4% == 1
  mload obj 92211          
end
~
#92250
умер богатырь~
0 f 100
~
if %world.curobjs(92212)% < 2 && %random.9% == 1
  mload obj 92212          
end
~
#92251
умер дружинник~
0 f 100
~
if %world.curobjs(92213)% < 2 && %random.11% == 1
  mload obj 92213          
end
~
#92252
умер вор~
0 f 100
~
if %world.curobjs(92214)% < 2 && %random.3% == 1
  mload obj 92214          
end
~
#92253
репоп зоны~
2 f 100
~
wdoor 92256 west purge  
wdoor 92256 west flags abcd room 92300
attach 92236 %self.id%
detach 92253 %self.id%
~
#92254
триггер~
0  0
~
set i 0
foreach chr %self.pc%
  eval i %i%+1
done
*берем любого чара         
set target1 %random.pc%  
set target2 %target1%
set target3 %target1%
*прогоняем список чаров, дабы выбрать самого малохитастого
foreach chr %self.pc%
  if %target1.hitp% < %chr.hitp%
    set target1 %chr%             
  end                                                        
done 
if %i% > 1                
  *берем любого чара кроме цели1
  while %target2% == %target1%
    set target2 %random.pc%
  done
  *прогоняем список чаров, дабы выбрать самого малохитастого кроме цели1
  
  foreach chr %self.pc%                                     
    if %target2.hitp% < %chr.hitp% && %chr% != %target1%
      set target2 %chr%             
    end
  done     
end
if %i% > 2           
  *берем любого чара кроме цели1 и цели 2
  while %target3% == %target1% || %target3% == %target2%
    set target3 %random.pc%
  done                                 
  *ну и понятно
  foreach chr %self.pc%
    if %target3.hitp% < %chr.hitp% && %chr% != %target1%  && %chr% != %target2%
      set target3 %chr%             
    end
  done
end
~
$~
