#92300
толкнуть дверь~
2 c 1
толкнуть толкать~
if !%arg.contains(дверь)%
  wsend %actor% Что вы хотите толкнуть?
  halt
end               
wait 1s
if %actor.str% < 33
  wechoaround %actor.name% попытал%actor.u% толкнуть дверь, но она даже не пошевелилась.
  wsend %actor% Вы попытались толкнуть дверь, но она даже не пошевелилась. 
  halt
end
wechoaround %actor.name% поднатужил%actor.u% и медленно открыл%actor.g% дверь.
wsend %actor% Вы поднатужились и медленно открыли дверь.
wdoor 92342 east purge
wdoor 92342 east room 92349  
detach 92300 %self.id%
~
#92301
с осколка слетает ЗБ~
0 kn 100
~
halt
eval wait %random.30%+20
wait %wait%s
mtransform 92313
detach 92301 %self.id%
~
#92302
в зеркальной комнате~
2 e 100
~
wait 1s        
if %actor.dex% > %random.30%
  halt
end
wechoaround %actor% %acrot.name% зацепил%actоr.g% одно из зеркал.
wsend %actor% Проходя, Вы случайно зацепили зацепили одно из зеркал.
wait 2s
wecho Зеркало упало и разбилось!
wecho Сверкающие осколки разлетелись по комнате!
set i 0
foreach calc %actor.pc%
  eval i %i%+1
done
*вычисляем сколько будет осколков в зависимости от количества чаров
eval num 2+%i%-%random.%i%%
eval num %random.%num%%
*загружаем осколки
while %num%>0
  wload mob 92312
  eval num %num% - 1
done
wait 30s
halt
~
#92303
триггер ловушек~
2 e 100
~
wait 1
eval chek 90+%random.50%
if %actor.skill(подкрасться)% > %chek%
  wsend %actor% Камень под вашей ногой чуть просел.
  wsend %actor% Вы быстро отдернули ногу.
  wsend %actor% Приглядевшись вы заметили отличие камня от остальных.
  attach 92304 %self.id% 
  halt
end 
*
if %self.vnum%==92326
  wload mob 92316
  wait 3s 
  calcuid statuya 92316 mob
  exec 92307 %statuya.id% 
  *
elseif %self.vnum%==92329
  wload mob 92315
  wait 3s 
  calcuid statuya 92315 mob
  exec 92306 %statuya.id% 
  *
elseif %self.vnum%==92340
  wload mob 92317
  wait 3s 
  calcuid statuya 92317 mob
  exec 92308 %statuya.id% 
  *
elseif %self.vnum%==92343
  wload mob 92318
  wait 3s 
  calcuid statuya 92318 mob
  exec 92309 %statuya.id% 
end
detach 92303 %self.id%
~
#92304
триггер обезвреживания ловушек~
2 c 1
обезвредить разрядить ~
if !%arg.contains(ловушку)%
  wsend %actor% И что же вы тут ломаете ?
  halt
end
if %random.25% < %actor.int%
  wsend %actor% Вы успешно обезвредили ловушку!
  wechoaround %actor% %actor.name% начал%actor.g% ковыряться в полу!
  wechoaround %actor% %actor.name% радостно вздохнул%actor.g%!
  detach 92303 %self.id%
  detach 92304 %self.id%
  halt
end 
*
wsend %actor% Ловушка сработала!
wechoaround %actor% %actor.name% начал%actor.g% ковыряться в полу!
wechoaround %actor% Что-то под ногами у %actor.rname% щелкнуло!
wait 1s
*
if %self.vnum%  == 92326
  wload mob 92316
  calcuid statuya 92316 mob
  exec 92307 %statuya.id% 
  *
elseif %self.vnum%  == 92329
  wload mob 92315
  calcuid statuya 92315 mob
  exec 92306 %statuya.id% 
  *
elseif %self.vnum%  == 92340
  wload mob 92317
  calcuid statuya 92317 mob
  exec 92308 %statuya.id% 
  *
elseif %self.vnum%  == 92343
  wload mob 92318
  calcuid statuya 92318 mob
  exec 92309 %statuya.id% 
end
detach 92304 %self.id%
~
#92305
не пускаем мобов~
2 g 100
~
if %actor.vnum% > 92299 && %actor.vnum% < 92400
  return 0
  halt
else
  return 1
  
~
#92306
ловушка статуи~
0 z 100
~
if !%random.pc%
  halt
end
set target %random.pc%
mecho Глаза статуи ярко вспыхнули!
dg_cast 'огнен шар' %target.name%
dg_cast 'огнен шар' %target.name%
wait 2s
mecho Статуя затряслась!   
dg_cast 'землетряс'
set target %random.pc%     
mecho Камни посыпались сверху!   
dg_cast 'метеор дож' %target.name%
dg_cast 'метеор дож' %target.name%
dg_cast 'метеор дож' %target.name%
wait 2s
mecho В ярком пламени взрыва статуя разлетелась на осколки! 
set i 0
foreach calc %self.pc%
  eval i %i%+1
done
set num 0
while %num%<%i%
  set target %random.pc%      
  dg_cast 'огн шар' %target.name%
  eval num %num%+1
done
wait 1s
mpurge %self%
~
#92307
ловушка фонтанчика молний~
0 z 100
~
if !%random.pc%
  halt
end
set target %random.pc%
mecho Яркие молнии ударили из фонтана!
dg_cast 'цеп молн' %target.name%
dg_cast 'цеп молн' %target.name%
wait 2s
mecho Свет померк!   
dg_cast 'суд богов'
set target %random.pc%     
mecho Молнии ударили во все стороны!   
set target %random.pc%     
dg_cast 'молн' %target.name%
set target %random.pc%     
dg_cast 'молн' %target.name%
set target %random.pc%     
dg_cast 'молн' %target.name%
set target %random.pc%     
dg_cast 'молн' %target.name%
set target %random.pc%     
dg_cast 'молн' %target.name%
wait 2s
mecho Рой шаровых молний вылетел из фонатана, и фонтан погас! 
set i 0
foreach calc %self.pc%
  eval i %i%+3
done
set num 0
while %num%<%i%
  set target %random.pc%      
  dg_cast 'шар молн' %target.name%
  eval num %num%+1
done
wait 1s
mpurge %self%
~
#92308
ловушка кувшина~
0 z 100
~
if !%random.pc%
  halt
end
set target %random.pc%
mecho Облако кислоты вылетело из кувшина!
dg_cast 'кислот' %target.name%
dg_cast 'кислот' %target.name%
dg_cast 'кислот' %target.name%
wait 2s
mecho Кислота залила все вокруг!   
foreach next %self.pc%
  dg_cast 'кислот' %next.name%
  dg_cast 'кислот' %next.name%
  dg_cast 'кислот' %next.name%
done
mecho Магические стрелы разлетелись во все стороны!   
set target %random.pc%     
dg_cast 'маг стрел' %target.name%
set target %random.pc%     
dg_cast 'маг стрел' %target.name%
set target %random.pc%     
dg_cast 'маг стрел' %target.name%
set target %random.pc%     
dg_cast 'маг стрел' %target.name%
set target %random.pc%     
dg_cast 'маг стрел' %target.name%
wait 2s
mecho Кувшин разлетелся на осколки обрызгав все остатками кислоты! 
set i 0
foreach calc %self.pc%
  eval i %i%+3
done
set num 0
while %num%<%i%
  set target %random.pc%      
  dg_cast 'кислот' %target.name%
  eval num %num%+1
done
wait 1s
mpurge %self%
~
#92309
ловушка льдины~
0 z 100
~
if !%random.pc%
  halt
end
set target %random.pc%
mecho Яркое свечение окутало льдину!
dg_cast 'гне богов' %target.name%
wait 2s
mecho Сверху посыпались огромные льдины!   
dg_cast 'лед шторм' %target.name%
dg_cast 'лед шторм' %target.name%
dg_cast 'лед шторм' %target.name%
set target %random.pc%     
mecho Холодный ветер закружился в вихре!   
set target %random.pc%     
dg_cast 'ледяной ветер' %target.name%
set target %random.pc%     
dg_cast 'ледяной ветер' %target.name%
set target %random.pc%     
dg_cast 'ледяной ветер' %target.name%
set target %random.pc%     
dg_cast 'ледяной ветер' %target.name%
set target %random.pc%     
dg_cast 'ледяной ветер' %target.name%
wait 2s
mecho Льдина ярко вспыхнула в гневе и растаяла! 
set i 0
foreach calc %self.pc%
  eval i %i%/2+1
done
set num 0
while %num%<%i%
  set target %random.pc%      
  dg_cast 'гнев богов' %target.name%
  eval num %num%+1
done
wait 1s 
mpurge %self%
~
#92310
репоп зоны~
2 f 100
~
calcuid rum 92326 room
detach 92303 %rum.id%
detach 92304 %rum.id%
attach 92303 %rum.id%
calcuid rum 92329 room
detach 92303 %rum.id%
detach 92304 %rum.id%
attach 92303 %rum.id%
calcuid rum 92340 room
detach 92303 %rum.id%
detach 92304 %rum.id%
attach 92303 %rum.id%
calcuid rum 92343 room
detach 92303 %rum.id%
detach 92304 %rum.id%
attach 92303 %rum.id%   
calcuid rum 92342 room
wdoor 92342 east purge
wdoor 92342 east room 92349 flags abcd
detach 92300 %rum.id%
attach 92300 %rum.id%
~
#92311
баттлетригг волхва~
0 k 100
~
if %self.position% < 7
  halt
end
eval action %random.15%
switch %action%
  case 1
    mecho %self.name% сложил%self.g% руны, которые вспыхнули ярким сиянием!
    dg_cast 'суд богов'
  break
  case 2
    mecho %self.name% сложил%self.g% руны, которые вспыхнули ярким сиянием!
    dg_cast 'землетряс'
  break
  case 3
    mecho %self.name% сложил%self.g% руны, которые вспыхнули ярким сиянием!
    dg_cast 'ледян шторм'
  break
  case 4
    mecho %self.name% сложил%self.g% руны, которые вспыхнули ярким сиянием!
    dg_cast 'мас слеп'
  break
  case 5
    mecho %self.name% сложил%self.g% руны, которые вспыхнули ярким сиянием!
    dg_cast 'масс  молч'
  break
  case 6
    mecho %self.name% сложил%self.g% руны, которые вспыхнули ярким сиянием!
    set target %random.pc%
    dg_cast 'гнев богов' %target.name%
  break
  case 7
    mecho %self.name% сложил%self.g% руны, которые вспыхнули ярким сиянием!
    set target %random.pc%
    dg_cast 'огнен шар' %target.name%
  break
  case 8
    mecho %self.name% сложил%self.g% руны, которые вспыхнули ярким сиянием!
    dg_cast 'метеорит дожд'
  break
  case 9
    mecho %self.name% сложил%self.g% руны, которые вспыхнули ярким сиянием!
    if %random.3% != 1
      mecho %self.name% создал%self.g% хранителя!
      mload mob 92309
    else
      mecho %self.name% создал%self.g% защитника!
      mload mob 92310
    end
  break
  default    
    mecho %self.name% сложил%self.g% руны, которые вспыхнули ярким сиянием!
    if %self.hitp% < 2000
      dg_cast 'исцелен'
    else
      set target %random.pc%
      dg_cast 'длит оцеп' %target.name%
    end
  break
done
~
#92312
Волхвы ищут цель~
2 e 100
~
wait 2s
if !%random.pc%
  halt
end
set actor %random.pc%
foreach next %actor.pc%
  if %next.fighting%
    eval volhv 92304+%random.4%
    if %exist.mob(%volhv%)%
      calcuid volhv %volhv% mob
      wait 2s
      if !(%volhv.realroom% == %self.vnum%)
        wecho &MФиолетовая пентаграмма появилась в воздухе!&n
        wecho %volhv.name% появил%actor.u% из пентаграммы.
        wteleport %volhv% %self.vnum%
        wait 1s
        wecho Пентаграмма медленно растаяла! 
      end
    end
    halt
  end
done
wait 10s
halt
~
#92313
баттлетригг орбена~
0 k 100
~
if %self.position% < 7
  halt
end
if %random.9% == 1
  dg_cast 'защит бог'
end
if %random.100% == 1
  mtransform 92302  
end
~
#92314
вошли к Скипер зверю~
0 q 100
~
wait 1
mecho Скипер зверь посмотрел на Вас!
say Опять какие-то букашки ко мне пришли.
say И что вам так неймется?
wait 1s
say Знайте же смертные, что мне на роду было написано умереть от руки Перуна.
say Так что все ваши потуги напрасны, готовьтесь присоединиться к моей охране.
mtransform 92321
mecho ____Сверкающие осколки отделились от зеркал!
mload mob 92322
mload mob 92322
mload mob 92322
mload mob 92322
wait 20t
~
#92315
Баттлетригг скипер зверя~
0 k 100
~
if %self.position% < 7
  halt
end
if %random.20% < 5 && %world.curmobs(92322)%<1
  mecho Скипер-зверь ударил копытом по полу!
  mecho Сверкающие осколки вылетели из зеркал!
  mload mob 92322
  mload mob 92322
end
~
#92316
дали платину скипер зверю~
0 j 100
~
if %object.vnum% > 91201 && %object.vnum% < 91207 
  mecho Яркая молния, пробив своды зала, ударила в Скипер зверя!
  mecho Слепяще-белое пламя окружило Скипер зверя!
  mecho Скипер-зверь яростно закричал от боли!    
  wait 1s
  say Смертные! Так значит Вы разбудили Перуна!
  say Ваше существование после смерти будет ужасным!
  mtransform 92320
  detach  92315 %self.id%
  attach  92317 %self.id%
end
~
#92317
Баттлетригг скипер зверя (2)~
0 k 100
~
if %random.22% < 4 && %world.curmobs(92322)%<1
  mecho Скипер-зверь ударил копытом по полу!
  mecho Сверкающие осколки вылетели из зеркал!
  mload mob 92322
  mload mob 92322
end
~
#92318
Скипер зверь умер~
0 f 100
~
mecho Яркая молния ударила сверху!
mecho Скипер зверь упал!
mecho Грозный Перун спустился на громовой колеснице!
mecho Сильным ударом Перун снес голову Скипер зверю!
mload mob 92323
calcuid perun 92323 mob
exec 92319 %perun.id%  
if %world.curobjs(92304)% < 3 && %random.8% == 1
  mload obj 92304    
elseif %world.curobjs(92305)% < 3 && %random.7% == 1
  mload obj 92305    
elseif %world.curobjs(92303)% < 3 && %random.6% == 1
  mload obj 92303    
end
~
#92319
триггер перуна~
0 z 100
~
wait 3s
mecho Перун окинул Вас взглядом.
взд
wait 2s
say Даже Смертные за меня работу стали делать. 
say Видно старею.
wait 2s
mecho Перун подошел к трону и ударил по нему кулаком.
mecho Каменный трон разлетелся в пыль!
wait 1s 
mecho Из прохода за троном вышли три молодые девицы. 
mecho Бела кожа у них - как слова кора.
mecho На них волос растет - как ковыль трава.
mload mob 92324
mload mob 92325
mload mob 92326
wait 2s
ужас 
wait 2s
say Вы пойдите, сестрицы, к Рипейским горам.
say Вы пойдите к Ирию светлому.
say Окунитесь в реку молочную и в сметанное чистое озеро.
say Искупайтеся во святых волнах, и омойте-ка лица белые.
say Набрались вы духа нечистого, от свирепого зверя-Скипера.
wait 1s
mecho Перун взмахнул рукой.
mecho Девицы обратились в белых лебедушек и взмыли вверх.
mteleport леля_моб 92299
mteleport жива_моб 92299
mteleport морена_моб 92299
wait 2s
mecho Перун взял с земли лебединое перышко. 
mload obj 92300
set actor %random.pc%
wait 1s
say Коли оказал%actor.u% ты тут, %actor.name%.
say Помоги мне сестриц моих вылечить.
дать перы %actor.name%
drop перышко
say Отнеси это перышко в Ирий-рай, и отдай его Ладе матушке.
mecho Перун вскочил в громовую колесницу и скрылся в небесах.
wait 1s
mteleport перун_моб 92299 
calcuid lada 91614 mob
attach 92320 %lada.id%
~
#92320
дали ладе перышко лебединое~
0 j 100
~
if %object.vnum% != 92300
  return 0
  halt
end       
wait 1
mpurge %object%
eval maxskl %actor.remort%*5+101
if %maxskl% > 141
  set maxskl 141
end
wait 1s
mecho Лада посмотрела на перышко, и бросила его в воду молочной реки.   
wait 2s
mecho Три белых лебедушки спустились с небес и нырнули в молочную реку.
wait 5s
mecho Из вод молочной реки вышли Леля, Жива, Морена.
mteleport леля_моб 91643
mteleport жива_моб 91643
mteleport морена_моб 91643
wait 2s
осм %actor.name%
wait 1s
say Спасибо %actor.name%, что помог спасти дочерей моих.
*НАГРАДА* 
say В благодарность, получи этот дар от сына моего Перуна.
if %actor.level% < 21
  %actor.exp(+100000)%
  detach 92320 %self.id%
end
wait 1s
switch %actor.class%
  *маги и лекари
  case 0
    case 1
      case 6
        case 8
          if !%actor.skill(палицы)%
            mskillturn %actor.name% палицы set
          end
          if !%actor.skill(короткие)%       
            mskillturn %actor.name% короткие set
          end
          if !%actor.skill(иное)%             
            mskillturn %actor.name% иное set
          end
          if %actor.skill(палицы)% < %maxskl%
            mskilladd %actor.name% палицы 10
          elseif if %actor.skill(короткие)% < %maxskl%
            mskilladd %actor.name%  которкие 10
          elseif %actor.skill(иное)% < %maxskl%
            mskilladd %actor.name% иное 10
          end  
        break         
        case 7
          if !%actor.skill(врата)%
            mskillturn %actor.name% врата set
          end
          if %actor.skill(врата)% < %maxskl%
            mskilladd %actor.name% врата 10
          end
        break
        *воры
        case 2
          if !%actor.skill(заколоть)%
            mskillturn %actor.name% заколоть set
          end
          if !%actor.skill(поднож)%       
            mskillturn %actor.name% поднож set
          end
          if !%actor.skill(украсть)%             
            mskillturn %actor.name% украсть set
          end
          if %actor.skill(заколоть)% < %maxskl%
            mskilladd %actor.name% заколоть 10
          elseif if %actor.skill(поднож)% < %maxskl%
            mskilladd %actor.name%  поднож 10
          elseif %actor.skill(украсть)% < %maxskl%
            mskilladd %actor.name% украсть 10
          end
        break   
        *батыры                        
        case 3
          if !%actor.skill(богатырский)%
            mskillturn %actor.name% богатырский set
          end
          if !%actor.skill(оглушить)%       
            mskillturn %actor.name% оглушить set
          end
          if !%actor.skill(ярость)%             
            mskillturn %actor.name% ярость set
          end
          if %actor.skill(богатырский)% < %maxskl%
            mskilladd %actor.name% богатырский 10
          elseif if %actor.skill(оглушить)% < %maxskl%
            mskilladd %actor.name% оглушить 10
          elseif %actor.skill(ярость)% < %maxskl%
            mskilladd %actor.name% ярость 10 
          end
        break                          
        *наемы
        case 4
          if !%actor.skill(заколоть)%
            mskillturn %actor.name% заколоть set
          end
          if !%actor.skill(поднож)%       
            mskillturn %actor.name% поднож set
          end
          if !%actor.skill(скрытый)%             
            mskillturn %actor.name% скрытый set
          end
          if %actor.skill(заколоть)% < %maxskl%
            mskilladd %actor.name% заколоть 10
          elseif if %actor.skill(поднож)% < %maxskl%
            mskilladd %actor.name% поднож 10
          elseif %actor.skill(скрытый)% < %maxskl%
            mskilladd %actor.name% скрытый 10 
          end
        break                       
        *друж
        case 5
          if !%actor.skill(осторож)%
            mskillturn %actor.name% осторож set
          end
          if !%actor.skill(спасти)%       
            mskillturn %actor.name% спасти set
          end
          if !%actor.skill(веер)%             
            mskillturn %actor.name% веер set
          end
          if %actor.skill(осторож)% < %maxskl%
            mskilladd %actor.name% осторож 10
          elseif if %actor.skill(спасти)% < %maxskl%
            mskilladd %actor.name% спасти 10
          elseif %actor.skill(веер)% < %maxskl%
            mskilladd %actor.name% веер 10 
          end
        break  
        *витязь
        case 9
          if !%actor.skill(блок)%
            mskillturn %actor.name% блок set
          end
          if !%actor.skill(сбить)%       
            mskillturn %actor.name% сбить set
          end
          if !%actor.skill(точный)%             
            mskillturn %actor.name% точный set
          end
          if %actor.skill(блок)% < %maxskl%
            mskilladd %actor.name% блок 10
          elseif if %actor.skill(сбить)% < %maxskl%
            mskilladd %actor.name% сбить 10
          elseif %actor.skill(точный)% < %maxskl%
            mskilladd %actor.name% точный 10 
          end
        break                      
        *охотник
        case 10
          if !%actor.skill(уклон)%
            mskillturn %actor.name% уклон set
          end
          if !%actor.skill(луки)%       
            mskillturn %actor.name% луки set
          end
          if !%actor.skill(дополнит)%             
            mskillturn %actor.name% дополнит set
          end
          if %actor.skill(уклон)% < %maxskl%
            mskilladd %actor.name% уклон 10
          elseif if %actor.skill(луки)% < %maxskl%
            mskilladd %actor.name% луки 10
          elseif %actor.skill(дополнит)% < %maxskl%
            mskilladd %actor.name% дополнит 10 
          end
        break                        
        *кузнец
        case 11
          if !%actor.skill(оглушить)%
            mskillturn %actor.name% оглушить set
          end
          if !%actor.skill(железный ветер)%
            mskillturn %actor.name% железный.ветер set
          end
          if !%actor.skill(заточить)%             
            mskillturn %actor.name% заточить set
          end
          if %actor.skill(оглушить)% < %maxskl%
            mskilladd %actor.name% оглушить 10
          elseif %actor.skill(пнуть)% < %maxskl%
            mskilladd %actor.name% пнуть 10 
          elseif %actor.skill(железный)% < %maxskl%
            mskilladd %actor.name% железный.ветер 10 
          end
        break                        
        *купец
        case 12
          if !%actor.skill(метнуть)%
            mskillturn %actor.name% метнуть set
          end
          if !%actor.skill(спрятат)%       
            mskillturn %actor.name% спрятат set
          end
          if !%actor.skill(осторож)%             
            mskillturn %actor.name% осторож set
          end
          if %actor.skill(метнуть)% < %maxskl%
            mskilladd %actor.name% метнуть 10
          elseif if %actor.skill(спрятат)% < %maxskl%
            mskilladd %actor.name% спрятат 10
          elseif %actor.skill(осторож)% < %maxskl%
            mskilladd %actor.name% осторож 10 
          end
        break
        *волхв
        case 13                   
          if !%actor.skill(палицы)%
            mskillturn %actor.name% палицы set
          end
          if !%actor.skill(иное)%       
            mskillturn %actor.name% иное set
          end
          if !%actor.skill(сглазить)%             
            mskillturn %actor.name% сглазить set
          end
          if %actor.skill(палицы)% < %maxskl%
            mskilladd %actor.name% палицы 10
          elseif if %actor.skill(иное)% < %maxskl%
            mskilladd %actor.name% иное 10
          elseif %actor.skill(сглазить)% < %maxskl%
            mskilladd %actor.name% сглазить 10 
          end
        break
      done
      wait 2s
      say А этот дар от дочерей моих.
      set i 0 
      set staff 1253 1252 1245 1237 1236 1265 1266 92726 92718    
      while %i% < 4 
        set num %random.11%  
        set  j 1
        foreach prize %staff%
          if %j%==%num% && !%world.curobjs(%prize%)%
            mload obj %prize%
            дать все %actor.name% 
            wait 1s
            detach 92320 %self.id%
          end
          eval j %j%+1             
        done
        eval i %i%+1
      done   
      if %actor.level% > 25
        %actor.exp(+2000000)%  
      end
      detach 92320 %self.id% 
~
#92321
умер лекарь~
0 f 100
~
if %world.curobjs(92301)% < 2 && %random.4% == 1
  mload obj 92301    
end
~
#92322
умер колдун~
0 f 100
~
if %world.curobjs(92302)% < 2 && %random.4% == 1
  mload obj 92302    
end
~
#92323
умер волхв~
0 f 100
~
if %world.curobjs(92303)% < 2 && %random.11% == 1
  mload obj 92303    
end
~
$~
