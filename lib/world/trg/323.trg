#32300
Гать болотная~
2 c 1
гатить~
wait 1
if %actor.move% < 20 
  wsend %actor% _Вам не хватит сил на это.
  halt
end
if !%actor.haveobj(32302)% || !%actor.haveobj(32303)%
  wsend %actor% _Для этого вам нужны бревна и сучья.
  halt
end
wforce %actor% брос бревно
wforce %actor% брос сучья
wsend %actor% _Вы начали гатить болото бревнами и сучьями.
wechoaround %actor% _%actor.name% начал%actor.g% гатить болото.
wpurge бревно
wpurge сучья
eval %actor.move(-20)%
%actor.wait(2)%
wait 2s
if %self.west% || %self.east%
  eval shagnn %self.vnum% + 1
  wdoor %self.vnum% north room %shagnn%
  wdoor %shagnn.vnum% south room %self.vnum%
  unset shagnn
else
  switch %random.3%
    case 1
      eval shagn %self.vnum% + 1
      wdoor %self.vnum% north room %shagn%
      wdoor %shagn.vnum% south room %self.vnum%
      unset shagn
    break
    case 2
      eval shagw %self.vnum% + 1
      wdoor %self.vnum% west room %shagw%
      wdoor %shagw.vnum% east room %self.vnum%
      unset shagw
    break
    case 3
      eval shage %self.vnum% + 1
      wdoor %self.vnum% east room %shage%
      wdoor %shage.vnum% west room %self.vnum%
      unset shage
    break
  done
end
wsend %actor% _Вы закончили работу и теперь по болоту можно проехать.
wechoaround %actor% _%actor.name% сделал%actor.g% здесь прочный настил, дорога готова.
detach 32300 %self.id%
~
#32301
Приветствие князя~
0 q 100
~
if %actor.vnum% != -1
  halt
end
wait 1s
set i 0
foreach ktouknyazya323 %self.pc%
  * татенаемы
  unset kukclass
  set kukclass %ktouknyazya323.class%
  if (%kukclass% == 2) || (%kukclass% == 4)
    if !(%vor323% == %ktouknyazya323.id%)
      mechoaround %ktouknyazya323% _Князь подозрительно посмотрел на %ktouknyazya323.vname%.
      г Да ты, %ktouknyazya323.name%, никак темными делами промышляешь?
      г Собрал%ktouknyazya323.u% у меня в усадьбе озоровать? А ну отвечай, да или нет!
      unset vor323
      set vor323 %ktouknyazya323.id%
      global vor323
      attach 32302 %self.id%
      halt
    break
  else
    eval i %i% - 1
  end
end
* купцы
if %kukclass% == 12
  if !(%kupa323% == %ktouknyazya323.id%)
    г Добро пожаловать, %ktouknyazya323.name%!
    г Товару, небось, привез%ktouknyazya323.q% на продажу? Давай сюда, сразу и рассчитаемся.
    if %world.curobjs(32377)% < 10
      г Или у меня купи! Есть одна любопытная вещица, отдам за десять тысяч кун. Плати и бери.
      attach 32304 %self.id%
    end
    г А если не торгуешь, так и скажи.
    unset kupa323
    set kupa323 %ktouknyazya323.id%
    global kupa323
    attach 32303 %self.id%
    attach 32305 %self.id%
    halt
  break
else
  eval i %i% - 1
end
end
eval i %i% + 1
done
if %i% > 1
  г Добро пожаловать, гости дорогие!
  см .%actor.name%
  г Вы, видимо, во многих городах побывали, разные страны повидали.
  г А мы тут тихо живем, мед да брагу пьем. Вот только...
elseif %i% == 1
  г Добро пожаловать, %actor.name%!
  см .%actor.name%
  г Ты, видимо, во многих городах побывал%actor.g%, разные страны повидал%actor.g%.
  г А мы тут тихо живем, мед да брагу пьем. Вот только...
end
wait 2
exec 32307 %self.id%
wait 10s
~
#32302
У князя для татенаемов~
0 d 1
да нет~
wait 1
if (%actor.id% == %vor323%) && (%speech% == да)
  г Вот как! А ну-ка, посадить %actor.vname% в темницу!
  msend %actor% _Подбежали два крепких дружинника и поволокли вас куда-то.
  mechoaround %actor% _Подбежали два крепких дружинника и поволокли %actor.vname% куда-то.
  mat 32330 mecho _%actor.name% посажен%actor.a% в темницу!
  mteleport %actor% 32330
  detach 32302 %self.id%
elseif (%actor.id% == %vor323%) && (%speech% == нет)
  г Ну-ну. Ты учти, что я долго терпеть тебя здесь не буду.
  wait 1s
  exec 32307 %self.id%
  detach 32302 %self.id%
end
~
#32303
Князь покупает стаф~
0 j 100
~
wait 2
eval xpobj %object.name%
if %kupa323% != %actor.id%
  г Зачем мне это?
  бросить %xpobj.car%
else
  if %object.type% == 5
    if %object.timer% < 3000
      г Это барахло развалится скоро, мне такое не нужно!
      бросить %xpobj.car%
      halt
    end
    eval srednee %object.val1% * (%object.val2% + 1) / 2
    if %srednee% < 11
      г За кого ты меня принимаешь? В нашей дружине такого и отроки не носят!
      бросить %xpobj.car%
      halt
    else
      г Покупаю!
      if %srednee% < 19
        eval srednee %srednee% / 4
      end
      eval orkuny ((%srednee% * 7 + %object.timer% / 1800) / 10 + 1) * 10
      msend %actor% Князь дал Вам %orkuny% кун.
      mechoaround %actor% Князь дал %actor.dname% гору кун.
      %actor.gold(+%orkuny%)%
      mpurge %object%
      halt
    end
  elseif %object.type% == 9
    if %object.timer% < 3000
      г Это барахло развалится скоро, мне такое не нужно!
      бросить %xpobj.car%
      halt
    end
    eval acbronya %object.val0% * %object.val1%
    if %acbronya% < 13
      г За кого ты меня принимаешь? У нас такого даже холопы не носят!
      бросить %xpobj.car%
      halt
    else
      г Покупаю!
      eval brkuny ((%acbronya% * 8 + %object.timer% / 1200) / 10 + 1) * 10
      msend %actor% Князь дал Вам %brkuny% кун.
      mechoaround %actor% Князь дал %actor.dname% гору кун.
      %actor.gold(+%brkuny%)%
      mpurge %object%
      halt
    end
  elseif (%object.type% == 15) && (%object.val3% == 1)
    г Да ты не купец, а убийца!
    г А ну, посадить %actor.vname% в темницу!
    msend %actor% _Подбежали два крепких дружинника и поволокли вас куда-то.
    mechoaround %actor% _Подбежали два крепких дружинника и поволокли %actor.vname% куда-то.
    mat 32330 mecho _%actor.name% посажен%actor.a% в темницу!
    mteleport %actor% 32330
    mpurge %object%
    detach 32303 %self.id%
  else
    г Мне это не нужно.
    бросить %xpobj.car%
  end
end
~
#32304
Князь продает фигню~
0 m 10000
~
wait 1
if %actor.id% == %kupa323%
  if %world.curobjs(32377)% > 4
    г Слушай, холопы мои не могут найти вещицы той... кто-то украл, наверно!
    г Заходи в другой раз.
    дать %amount% кун .%actor.name%
  else
    г Вот, держи. В Киеве или еще где продашь с большой прибылью.
    mload obj 32377
    дать темн.зерк .%actor.name%
    if %amount% > 10000
      г А кун ты мне больше дал%actor.g%, чем нужно. Что ж так плохо считаешь, а еще купец!
      eval lishnee %amount% - 10000
      дать %lishnee% кун .%actor.name%
    end
  end
  %self.gold(-10000)%
  detach 32304 %self.id%
else
  г Дань? Принимаю!
end
~
#32305
У князя для купцов~
0 d 0
не торгую~
wait 1
if %actor.id% == %kupa323%
  г Не торгуешь - и не надо. Тогда вот что.
  wait 1
  exec 32307 %self.id%
  detach 32303 %self.id%
  detach 32304 %self.id%
  detach 32305 %self.id%
end
~
#32306
Строим мост~
2 c 1
строить~
if !(%arg.contains(мост)%)
  wsend %actor% _Что строить?
  halt
end
wait 1
if %actor.move% < 40
  wsend %actor% _Вам не хватит сил на это.
  halt
end
while %actor.haveobj(32302)%
  if %brevna323% > 3
  break
end
wforce %actor% брос бревно
wpurge бревно
eval brevna323 %brevna323% + 1
worlds brevna323
done
if %brevna323% < 4
  wsend %actor% _Нужно хотя бы четыре бревна.
  halt
end
wsend %actor% _Вы взялись наводить мост через реку из заготовленных бревен...
wechoaround %actor% _%actor.name% начал%actor.g% строить мост через реку из заготовленных бревен.
eval %actor.move(-40)%
%actor.wait(3)%
wait 4s
wdoor 32361 n purge
wdoor 32364 s purge
wdoor 32361 n room 32363
wdoor 32364 s room 32363
wsend %actor% _Вы с гордостью взглянули на дело рук своих - новый мост.
wechoaround %actor% _%actor.name% закончил%actor.g% работу. Новый мост готов!
detach 32306 %self.id%
~
#32307
Князь рассказывает про деревню~
0 z 0
~
г По рассказам смердов из дальних селений я знаю, что есть в лесах на севере деревенька одна.
г Живут там язычники... живут на землях княжества моего и дани не платят!
г Давно пора их было покорить и в веру христианскую окрестить, а тех что откажутся - казнить.
г Да дружина моя с воеводой уже три года великому князю в войне помогает, здесь немного ратников осталось.
г Пробовали пройти через лес, да заплутали и, говорят, повстречали чудищ страшных, ни с чем обратно пришли.
г Если ты с помощниками найдешь ту деревню, да путь туда укажешь, а может и дорогу пробьешь через чащу...
г Наградой тебе будет то, что там возьмешь, но дочиста не грабь, все же моя та земля по праву!
г И я приплачу еще немного за труды.
г Но поскольку ты человек свободный - хочешь, делай, а не хочешь - так погости и езжай себе дальше.
if %exist.mob(32315)%
  calcuid plo323 32315 mob
  attach 32308 %plo323.id%
  attach 32309 %plo323.id%
end
~
#32308
Плотник предлагает топор~
0 q 100
~
wait 1
г Если ты, %actor.name%, деревню на севере искать собрал%actor.u%, то там леса дремучие и пути нет.
г А если купишь лесосечный топор у меня, сможешь туда тропу, а то и дорогу проложить.
г Дешево отдам, за пятьсот кун.
~
#32309
Плотник продает топор~
0 m 500
~
wait 1
mload obj 32304
г Бери.
дать топор .%actor.name%
%self.gold(-500)%
if %amount% > 500
  mecho _Хотя денег было больше пяти сотен, плотник сделал вид, что не заметил этого.
end
detach 32308 %self.id%
set otknyazya323 %actor.id%
worlds otknyazya323
detach 32309 %self.id%
~
#32310
Выбиваем ворота~
2 c 1
выбить ломать выломать~
if !(%arg.contains(ворота)%)
  wsend %actor% _Вы начали крушить все вокруг.
  halt
end
switch %actor.class%
  *лекарь
  case 0
    wsend %actor% _Вы применили против ворот некое вредное заклинание!
    wechoaround %actor% _%actor.name% взглянул%actor.g% на ворота и произнес%actor.q% какие-то странные слова.
    wecho _Ворота повредились и раскрылись.
  break
  *колд
  case 1
    wsend %actor% _Вы швырнули в щель между створками ворот огненный шар!
    wechoaround %actor% _%actor.name% взглянул%actor.g% на ворота и произнес%actor.q% какие-то странные слова.
    wecho _Огненное заклинание сожгло засов и распахнуло ворота.
  break
  *кудес
  case 6
    wsend %actor% _Вы коснулись ворот своим ледяным заклинанием!
    wechoaround %actor% _%actor.name% взглянул%actor.g% на ворота и произнес%actor.q% какие-то странные слова.
    wecho _Засов на воротах рассыпался и они открылись.
  break
  *волш
  case 7
    wsend %actor% _Вы направили поток кислоты в щель между створками ворот!
    wechoaround %actor% _%actor.name% взглянул%actor.g% на ворота и произнес%actor.q% какие-то странные слова.
    wecho _Засов на воротах рассыпался и они открылись.
  break
  *чернок
  case 8
    wsend %actor% _Вы применили против ворот некое злобное заклинание!
    wechoaround %actor% _%actor.name% взглянул%actor.g% на ворота и произнес%actor.q% какие-то страшные слова.
    wecho _Засов на воротах превратился в пыль и они распахнулись.
  break
  *волхв
  case 13
    wsend %actor% _Вы сложили руны, которые вспыхнули ярким пламенем.
    wechoaround %actor% _%actor.name% сложил%actor.g% руны, которые вспыхнули ярким пламенем.
    wecho _Сила волшебства распахнула ворота.
  break
  default
    set brevno323 %actor.eq(18)%
    if !(%brevno323.vnum% == 32302)
      wsend %actor% _Такие ворота плечом не выбьешь, тут бревном надо...
      halt
    end
    if %actor.move% < 20 
      wsend %actor% _Вам не хватит сил на это.
      halt
    end
    wsend %actor% _Вы разбежались и ударили бревном в ворота. Створки распахнулись.
    wechoaround %actor% _%actor.name% разбежал%actor.u% и ударил бревном в ворота. Створки распахнулись.
    eval %actor.move(-20)%
  break
done
wdoor 32365 e purge
wdoor 32365 e room 32366
wdoor 32365 e name ворота|ворота
wdoor 32365 e description ворота
wdoor 32365 e flags a
wdoor 32366 w purge
wdoor 32366 w name ворота|ворота
wdoor 32366 w description ворота
wdoor 32366 w room 32365
wdoor 32366 w flags a
%actor.wait(2)%
detach 32310 %self.id%
~
#32311
Резет зоны~
2 f 100
~
unset kkonets323
unset skonets323
unset vkonets323
unset geroy323
*распределение мобов
eval poryadok323 %random.2%
worlds poryadok323
*князь
calcuid velesur323 32300 mob
detach 32301 %velesur323.id%
attach 32301 %velesur323.id%
*кладовая
wdoor 32307 s flags abc
wdoor 32307 s lock 20
calcuid dvor323 32307 room
detach 32333 %dvor323.id%
attach 32333 %dvor323.id%
*ворота в деревню
wdoor 32365 e flags abc
wdoor 32365 e lock 120
wdoor 32366 w flags ab
calcuid vorota323 32365 room
detach 32310 %vorota323.id%
attach 32310 %vorota323.id%
*опушка
wdoor 32334 n purge
wdoor 32334 e purge
wdoor 32334 w purge
calcuid opushka323 32334 room
detach 32312 %opushka323.id%
attach 32312 %opushka323.id%
*конец дороги
wdoor 32334 e purge
wdoor 32334 w purge
wdoor 32360 s purge
wdoor 32360 e purge
wdoor 32360 w purge
*река
wdoor 32361 n purge
wdoor 32361 n room 32362
wdoor 32364 s purge
wdoor 32364 s room 32362
set brevna323 0
worlds brevna323
calcuid ureki323 32361 room
detach 32306 %ureki323.id%
attach 32306 %ureki323.id%
*десятник
set pyan323 0
worlds pyan323
unset kras323
wdoor 32309 d flags abc
wdoor 32309 d lock 180
wdoor 32330 u flags abc
wdoor 32330 u lock 180
*ведунья
calcuid vedunya323 32346 mob
detach 32330 %vedunya323.id%
attach 32330 %vedunya323.id%
detach 32331 %vedunya323.id%
detach 32332 %vedunya323.id%
unset otknyazya323
*кузнец и староста
unset geroy323
calcuid vepr323 32307 mob
detach 32336 %vepr323.id%
calcuid mezenya323 32310 mob
detach 32335 %mezenya323.id%
*амбар
wdoor 32317 e flags abc
wdoor 32317 e lock 40
wdoor 32321 w flags abc
wdoor 32321 w lock 40
~
#32312
Рубим лес~
2 c 100
рубить~
wait 1
if !%arg.contains(лес)%
  wsend %actor% _Рубить что?
  halt
end
set topor323 %actor.eq(18)%
if !(%topor323.vnum% == 32304)
  wsend %actor% _Рубить лес надо лесосечным топором.
  halt
end
if %actor.move% < 30 
  wsend %actor% _Вам не хватит сил на это.
  halt
end
wsend %actor% _Вы принялись рубить лес, ожесточенно махая топором.
wechoaround %actor% _%actor.name% начал%actor.g% рубить деревья.
eval %actor.move(-30)%
%actor.wait(2)%
wait 2s
eval shag323 %self.vnum% + 1
if %self.west% || %self.east%
  wdoor %self% north room %shag323%
  wdoor %shag323.vnum% south room %self.vnum%
else
  if %self.vnum% == 32339 || %self.vnum% == 32347
    wdoor %self.vnum% north room %shag323%
    wdoor %shag323.vnum% south room %self.vnum%
  else
    switch %random.3%
      case 1
        wdoor %self.vnum% north room %shag323%
        wdoor %shag323.vnum% south room %self.vnum%
      break
      case 2
        wdoor %self.vnum% west room %shag323%
        wdoor %shag323.vnum% east room %self.vnum%
      break
      case 3
        wdoor %self.vnum% east room %shag323%
        wdoor %shag323.vnum% west room %self.vnum%
      break
    done
  end
end
if %poryadok323% == 1
  *в 32335 моб 32327
  eval sledmob323 %shag323% - 8
else
  *в 32348 моб 32327
  *64675 = 32340 + 32335
  eval sledmob323 64675 - %shag323%
end
if %shag323% < 32349
  wat %shag323% wload mob %sledmob323%
end
unset shag323
unset sledmob323
wsend %actor% _Вы расчистили достаточно места для дороги.
wechoaround %actor% _%actor.name% срубил%actor.g% несколько лесин (там, где они стояли пореже) и теперь здесь будет дорога.
wload obj 32303
if %self.vnum% < 32354
  if %random.2% == 1
    wload obj 32302
  end
  if %self.vnum% > 32346 && %world.curobjs(32302)% < 10
    wload obj 32302
  end
else
  wecho _Здесь начинается болото, придется его гатить, чтобы проложить дорогу дальше.
end
detach 32312 %self.id%
~
#32313
На реке опасно~
2 e 50
~
wait 1
if %weather.temp% > -1
  wsend %actor% _Вы стали переплывать реку, но чуть дальше середины попали в водоворот и ушли под воду.
  wsend %actor% _Вы ударились головой о корягу, едва не утонули, долго боролись с течением...
else
  wsend %actor% _Вы стали переходить реку по льду, но чуть дальше середины провалились и ушли под воду.
  wsend %actor% _Ледяной холод сковал ваше тело, и с огромным трудом вам удалось выбраться...
end
%actor.wait(5)%
set %actor.hitp(10)%
dg_affect %actor% обездвижен оцепенение 1 30 1
wsend %actor% _Вам хватило сил только добраться до берега и вы упали без сознания.
if %weather.temp% > -1
  wechoaround %actor% _%actor.name% стал%actor.g% переплывать реку, но попал%actor.g% в водоворот и исчез%actor.q%.
  wechoaround %actor% _Похоже, %actor.name% утонул%actor.g%... хотя нет - вы увидели как }%actor.name% еле-еле выбрал%actor.u% на берег и упал%actor.g% без чувств.
else
  wechoaround %actor% _%actor.name% стал%actor.g% переходить реку по льду, но провалил%actor.u%.
  wechoaround %actor% _Похоже, %actor.name% утонул%actor.g%... хотя нет - вы увидели как }%actor.name% выбрал%actor.u% на лед и упал%actor.g% без чувств.
end
wait 2
wteleport %actor% 32361 follower
wat 32361 wechoaround %actor% _%actor.name% еле-еле выбрал%actor.u% на берег и упал%actor.g% без чувств.
~
#32314
У девицы~
0 r 100
~
if %actor.vnum% != -1
  halt
end
wait 1
foreach udevitsy323 %self.pc%
  if %udevitsy323.sex% == 1 && %udevitsy323.canbeseen%
    msend %udevitsy323% _Девица увидела вас, завизжала и прикрылась веником.
    mechoaround %udevitsy323% _Девица увидела мужчину, завизжала и скорей прикрылась веником.
    крич Девки, бабы, бегите в мыльню, бейте охальника!
    foreach baby323 32313 32318 32303 32308 32319
      if %exist.mob(%baby323%)%
        unset zhen323
        calcuid zhen323 %baby323% mob
        if !(%zhen323.realroom% == 32318)
          if !(%zhen323.affect(оцепенение)%) && !(%zhen323.affect(сон)%)
            mechoaround %zhen323% %zhen323.name% услышала крик и побежала на помощь.
            mteleport %zhen323% 32318
            mechoaround %zhen323% %zhen323.name% прибежала с востока.
            mforce %zhen323% атак .%udevitsy323.name%
          end
        end
      end
    done
    msend %udevitsy323% Девица зыркнула на Вас и произнесла : '... замри.'.
    mechoaround %udevitsy323% Девица взглянула на %udevitsy323.vname% и произнесла : '... замри.'.
    dg_cast 'оцеп' .%udevitsy323.name%
    halt
  break
end
done
~
#32315
Вход к волхву~
0 q 100
~
if %actor.vnum% != -1
  halt
end
if %kkonets323% == 1
  halt
end
wait 1
set k 0
foreach osta323 32362 32363 32365 32367 32372 32373 32374 32378 32381
  if %exist.mob(%osta323%)%
    eval k %k% + 1
  end
done
if %k% < 6 && %skonets323% != 1
  г Душегубы! Вырезали нашу деревню!
  dg_cast 'масс оцеп' .%actor.name%
  dg_cast 'суд богов' .%actor.name%
  halt
end
г Что, пришли свободных людей закабалить, заставить от веры предков отказаться?
г Я волхв. Богов своих не предам и за род свой умру! Хотите - бейте меня!
wait 1s
if !%self.fighting%
  г Или, если одумались вы и желаете доброе дело сделать, выслушайте меня.
  вопр .%actor.name%
end
~
#32316
Волхв отправляет назад~
0 d 1
рассказывай выслушаю выслушаем~
if %actor.vnum% != -1
  halt
end
if %kkonets323% == 1
  halt
end
wait 1
г Пусть вы и оставите нас в покое, но князь соберет свою дружину и по вашей дороге к нам придет.
г Долго мы не сможем обороняться. Надо в дальние земли уходить, где чудь живет.
г Знаю, лет через сто и там до нас доберется княжеская власть и христианская вера.
г Но все, кто сейчас из нас остался, и дети наши - будут свободными и не предадут родных богов.
г Так что если желаете нам помочь - вернитесь к князю Велесуру, найдите там попа.
г Нерусский он, из армян. Лично убил волхва из другого селения, которое возле усадьбы было.
г А тот волхв владел волшебной вещью, которая позволяет на дальние расстояния перемещаться.
г У ведуньи, которая в лесу живет, похожая есть, только с ней можно лишь к самой усадьбе перенестись.
г Убей попа и принеси мне ту вещь, она у него. Я открою врата в дальние земли и мы уйдем туда.
detach 32315 %self.id%
detach 32316 %self.id%
~
#32317
Конец квеста через волхва~
0 j 100
~
if %actor.vnum% != -1
  halt
end
wait 1
set k 0
foreach osta323 32362 32363 32365 32367 32372 32373 32374 32378 32381
  if %exist.mob(%osta323%)%
    eval k %k% + 1
  end
done
if %k% < 6 && %skonets323% != 1
  г Душегубы! Вырезали нашу деревню!
  mecho _Волхв Тенесвет сложил руны!
  dg_cast 'масс оцеп' .%actor.name%
  dg_cast 'суд богов' .%actor.name%
  halt
end
if %object.vnum% == 32378
  wait 1
  mpurge %object%
  if %exist.mob(32300)%
    calcuid knyaz323 32300 mob
    detach 32301 %knyaz323.id%
  end
  wait 1s
  if %kkonets323% == 1
    г Нам это больше не поможет.
    halt
  end
  г Вы поступили правильно.
  eval maxskill323 85 + %actor.remort% * 5
  if maxskill323 > 175
    set maxskill323 175
  end
  switch %actor.class%
    *волхву руну
    case 13
      if %random.3% == 1 && %world.curobjs(217)% < 50
        mload obj 217
        дать рун .%actor.name%
      end
      case 0
        case 1
          case 6
            case 7
              case 8
                case 9
                  case 10
                    case 11
                      case 12
                        if %actor.skill(опознание)%
                          if %actor.skill(опознание)% < maxskill323
                            msend %actor% _Волхв Тенесвет сложил руны, которые вспыхнули ярким пламенем.
                            mechoaround %actor% _Волхв Тенесвет сложил руны и %actor.name% озарил%actor.u% белым светом.
                            mskilladd %actor.name% опознание 5
                          end
                        end
                      break
                      *тать
                      case 2
                        if %actor.skill(спрятаться)%
                          if %actor.skill(спрятаться)% < maxskill323
                            msend %actor% _Волхв Тенесвет сложил руны, которые вспыхнули ярким пламенем.
                            mechoaround %actor% _Волхв Тенесвет сложил руны и %actor.name% куда-то пропал%actor.g%, но тут же снова появил%actor.u%.
                            mskilladd %actor.name% спрятаться 5
                          end
                        end
                      break
                      *богатырь
                      case 3
                        if %actor.skill(боевой клич)%
                          if %actor.skill(боевой клич)% < maxskill323
                            msend %actor% _Волхв Тенесвет сложил руны, которые вспыхнули ярким пламенем.
                            mechoaround %actor% _Волхв Тенесвет сложил руны и %actor.name% широко ухмыльнул%actor.u%.
                            mskilladd %actor.name% боев.клич 5
                          end
                        end
                      break
                      *дружинник
                      case 5
                        if %actor.skill(лечить)%
                          if %actor.skill(лечить)% < maxskill323
                            msend %actor% _Волхв Тенесвет сложил руны, которые вспыхнули ярким пламенем.
                            mechoaround %actor% _Волхв Тенесвет сложил руны и %actor.name% озарил%actor.u% зеленым светом.
                            mskilladd %actor.name% лечить 5
                          end
                        end
                      break
                    done
                    msend %actor% _За это доброе дело вы получили 400000 очков опыта.
                    %actor.exp(+400000)%
                    set vkonets323 1
                    worlds vkonets323
                    г Соберу людей и мы отправимся в путь.
                    mecho Волхв Тенесвет ушел на север.
                    *ну и удалим мобов, которых нельзя убивать... чтобы не убили после квеста :P
                    foreach vse323 32362 32363 32365 32367 32372 32373 32374 32378 32381
                      if %exist.mob(%vse323%)%
                        unset poka323
                        calcuid poka323 %vse323% mob
                        exec 32334 %poka323.id%
                      end
                    done
                    mpurge %self%
                  end
~
#32318
Вход к старейшине~
0 q 100
~
if %actor.vnum% != -1
  halt
end
if %kkonets323% == 1
  halt
end
wait 1
set k 0
foreach osta323 32362 32363 32365 32367 32372 32373 32374 32378 32381
  if %exist.mob(%osta323%)%
    eval k %k% + 1
  end
done
if %k% < 6 && %vkonets323% != 1
  г Вы наш род истребили, не пощадили ни старого, ни малого!
  dg_cast 'землетряс' .%actor.name%
  dg_cast 'масс молч' .%actor.name%
  halt
end
г Вы победили нас. Но много ли получите от Велесура за свое черное дело?
г Не надеюсь на вашу совесть, но дам двадцать тысяч кун, если поможете нам, а не князю.
г В усадьбе есть десятник дружины, а у него ключи от сундуков, где лежит снаряжение для ратников.
г Сам он постоянно носит заговоренный меч (хоть и христианин) и такие же доспехи.
г В них он один двадцати умелых бойцов стоит.
if %actor.sex% == 2
  г Но если удастся тебе, %actor.name%, так дело устроить, чтобы он те доспехи и меч снял...
  миг .%actor.name%
else
  г Но если удастся тебе, %actor.name%, напоить его, так чтобы на ногах держаться не мог...
end
г то вы смогли бы легко добыть ключи, снаряжение достать и нам принести.
г Нам бы оно пригодилось, а дружина князя уже не смогла бы против нас пойти.
г А пока суд да дело, мы деревню укрепим и защитную ворожбу наведем.
wait 5s
~
#32319
Конец квеста через старейшину~
0 j 100
~
if %actor.vnum% != -1
  halt
end
wait 1
set k 0
foreach osta323 32362 32363 32365 32367 32372 32373 32374 32378 32381
  if %exist.mob(%osta323%)%
    eval k %k% + 1
  end
done
if %k% < 6 && %vkonets323% != 1
  г Вы наш род истребили, не пощадили ни старого, ни малого!
  dg_cast 'землетряс' .%actor.name%
  dg_cast 'масс молч' .%actor.name%
  halt
end
if %object.vnum% == 32381
  wait 1
  mpurge %object%
  if %exist.mob(32300)%
    calcuid knyaz323 32300 mob
    detach 32301 %knyaz323.id%
  end
  wait 1s
  if %kkonets323% == 1
    *по идее он мертв, но мало ли
    г Это мне уже ни к чему, я раб князя.
    halt
  end
  г Да хранят вас боги! Теперь мы от князя оборонимся.
  msend %actor% Старейшина дал вам 20000 кун.
  mechoaround %actor% Старейшина дал %actor.dname% большую кучку кун.
  %actor.gold(+20000)%
  detach 32318 %self.id%
  set skonets323 1
  worlds skonets323
  *ну и удалим мобов, которых нельзя убивать... чтобы не убили после квеста :P
  foreach vse323 32362 32363 32365 32367 32372 32373 32374 32378 32381
    if %exist.mob(%vse323%)%
      unset poka323
      calcuid poka323 %vse323% mob
      exec 32334 %poka323.id%
    end
  done
end
~
#32320
Конец квеста через князя~
0 j 100
~
if %actor.vnum% != -1
  halt
end
if %object.vnum% == 32384
  wait 1
  mpurge %object%
  detach 32301 %self.id%
  wait 1s
  msend %actor% _Вы рассказали князю Велесуру о том, как подчиняли деревню язычников.
  mechoaround %actor% _%actor.name% начал%actor.g% хвастливо расписывать князю Велесуру свои подвиги в походе на язычников.
  wait 1s
  if %vkonets323% == 1
    г А попа нашего кто убил, не ты ли?
    г Впрочем поп был паршивый, черт с ним.
    г Но тебе я ничего не дам, слишком умным быть хочешь.
    halt
  end
  if %skonets323% == 1
    г Да мне уже не до тех язычников, кто-то моего десятника убил и хранилище ограбил.
    дум
    halt
  end
  set k 0
  foreach osta323 32362 32363 32365 32367 32372 32373 32374 32378 32381
    if %exist.mob(%osta323%)%
      eval k %k% + 1
    end
  done
  if %k% < 6
    г А что же ты, %actor.name%, всех там поубивал%actor.g%? Я тебя об этом не просил.
    г Кто же мне теперь дань платить будет?
    г Убирайся подобру-поздорову, не получишь от меня ничего.
    halt
  end
  ухм
  г Спасибо за помощь!
  msend %actor% Князь Велесур дал вам 7000 кун.
  mechoaround %actor% Князь Велесур дал кучку кун %actor.dname%.
  %actor.gold(+7000)%
  msend %actor% _Свершив это черное дело, вы получили 300000 очков опыта.
  %actor.exp(+300000)%
  switch %actor.class%
    *лекарь
    case 0
      *витязь
      case 9
        г Сходи еще к ратайному старосте, он тебя кое-чему научит.
        calcuid mezenya323 32310 mob
        attach 32335 %mezenya323.id%
        set geroy323 %actor.id%
        worlds geroy323
      break
      *кузнец
      case 11
        г Сходи еще к нашему кузнецу, он тебя кое-чему научит.
        calcuid vepr323 32307 mob
        attach 32336 %vepr323.id%
        set geroy323 %actor.id%
        worlds geroy323
      break
    done
    set kkonets323 1
    worlds kkonets323
    *волхва в тюрьму
    if %exist.mob(32379)%
      calcuid tenesvet323 32379 mob
      mat 32330 mecho _Кто-то открыл крышку и сбросил сюда избитого человека в порванной одежде.
      mteleport %tenesvet323% 32330
    end
    *ну и удалим мобов, которых не нужно убивать... чтобы не убили после квеста :P
    foreach vse323 32362 32363 32365 32367 32372 32373 32374 32378 32381
      if %exist.mob(%vse323%)%
        unset poka323
        calcuid poka323 %vse323% mob
        exec 32334 %poka323.id%
      end
    done
  end
~
#32321
Резет выходов~
2 f 100
~
if %self.vnum% < 32355
  detach 32312 %self.id%
  attach 32312 %self.id%
else
  detach 32300 %self.id%
  attach 32300 %self.id%
end
*у берлоги
if %self.vnum% == 32340
  wdoor %self.vnum% n purge
  wdoor %self.vnum% s purge
  wdoor %self.vnum% e purge
  *у избушки
elseif %self.vnum% == 32348
  wdoor %self.vnum% n purge
  wdoor %self.vnum% s purge
  wdoor %self.vnum% w purge
  wdoor %self.vnum% e flags ab
  *везде
else
  wdoor %self.vnum% n purge
  wdoor %self.vnum% s purge
  wdoor %self.vnum% w purge
  wdoor %self.vnum% e purge
end
~
#32322
У десятника - М~
0 j 100
~
if %actor.vnum% != -1
  halt
end
if %actor.sex% == 2
  return 0
  halt
end
eval xpeh %object.name%
wait 2
if %object.type% != 17
  г Что ты мне тут суешь?
  брос %xpeh.car%
  halt
end
if %object.val1% == 0
  г Зачем мне пустая тара?
  брос %xpeh.car%
  halt
end
if (%object.val2% == 1 ) || (%object.val2% == 2 ) || (%object.val2% == 3 ) || (%object.val2% == 5 ) || (%object.val2% == 7 ) || (%object.val2% == 8 )
  г Выпить со мной хочешь? Давай!
  wait 1s
  if !(%object.val0% == %object.val1%)
    г А что не полн%object.w%-то?
    дать %xpeh.car% .%actor.name%
    halt
  end
  тост
  mecho _Десятник одним махом осушил %object.vname%.
  eval obyom %object.val1%
  if %obyom% > 20
    set obyom 20
  end
  eval pyan323 %pyan323% + %obyom%
  worlds pyan323
  mpurge %object%
  wait 1s
  if %pyan323% > 70
    switch %random.7%
      case 1
        ик
      break
      case 2
        петь
      break
      case 3
        рыг
      break
      case 4
        зев
      break
      case 5
        шутить
      break
      case 6
        смея
      break
      default
        пляс
      break
    done
  end
  wait 1s
  if %pyan323% > %random.200% + 100
    mecho _Десятника совсем развезло...
    сня все
    бро все
    mtransform 32384
    спать
    detach 32323 %self.id%
    detach 32322 %self.id%
  end
else
  г Что ты мне тут суешь?
  брос %xpeh.car%
end
~
#32323
У десятника - Ж~
0 c 1
подмигнуть ластиться соблазнить~
if %actor.vnum% != -1
  halt
end
if !(%arg.contains(десятник)%)
  msend %actor% _А кто цель ваших усилий?
  halt
end
if !(%actor.sex% == 2)
  msend %actor% Нет, мальчики десятнику не нравятся.
  halt
end
wait 2
mforce %actor% миг десятник
wait 1s
msend %actor% Десятник дружины оглядел вас с головы до пят.
mechoaround %actor% Десятник дружины посмотрел на %actor.vname%.
wait 1s
if %self.fighting%
  halt
end
if !(%actor.id% == %kras323.id%)
  if (%actor.age% < 26)
    г Хороша ты, красна девица, да на службе я, некогда с тобой развлекаться.
    настор
    msend %actor% _Вы подумали, что если вам накраситься и прихорошиться, то и служба не будет помехой...
  elseif (%actor.age% < 46)
    г Подруга, я женатый, не строй глазки зря.
    зев
    msend %actor% _Вы подумали, что если вам накраситься и прихорошиться, то про жену он забудет...
  else
    г Старуха, а туда же - глазки строить.
    морщ
    msend %actor% _Вы подумали, что если вам морщины с пятнами замазать, то глядишь и соблазнится...
  end
  halt
end
г Хороша ты, красна девица! А пойдем-ка погуляем со мной, покажу кое-что занимательное!
msend %actor% _Десятник дружины взял вас за руку и повел куда-то.
mechoaround %actor% _Десятник дружины приобнял %actor.vname% и пошел с ней куда-то.
mat 32317 mecho _Десятник дружины пришел сюда с %actor.tname%.
mat 32317 mecho _Десятник дружины открыл дверь в амбар и позвал туда %actor.vname%.
mat 32317 mecho _Десятник дружины запер дверь с той стороны.
mdoor 32317 e flags ab
mteleport %self% 32321
mteleport %actor% 32321
msend %actor% _Вы пришли в амбар...
mechoaround %actor% _Десятник дружины пришел сюда с %actor.tname%.
wait 1s
if %self.fighting%
  halt
end
foreach vambare323 %self.pc%
  if !(%vambare323% == %actor%)
    г А ну пош%vambare323.y% отсюда, %vambare323.name%!
    msend %vambare323% _Десятник выставил вас вон.
    mechoaround %vambare323% _Десятник выставил %vambare323.vname% вон.
    mat 32317 mecho %vambare323.name% прибежал%vambare323.g% с востока.
    mteleport %vambare323% 32317
  end
done
wait 1s
if %self.fighting%
  halt
end
mecho _Десятник снял доспехи, сложил их в углу, а сам прилег на лисьи шкуры.
mload obj 32388
сня все
бро все
отд
г Ложись рядом, милая, позабавимся!
mtransform 32383
set dev323 %actor.id%
global dev323
attach 32324 %self.id%
detach 32322 %self.id%
detach 32323 %self.id%
~
#32324
Десятник в амбаре~
0 b 100
~
if !(%self.fighting%) && (%dev323.realroom% == %self.realroom%)
  switch %random.7%
    case 1
      играть .%dev323.name%
    break
    case 2
      ласк .%dev323.name%
    break
    case 3
      лиз .%dev323.name%
    break
    case 4
      люб .%dev323.name%
    break
    case 5
      щип .%dev323.name%
    break
    case 6
      примос .%dev323.name%
    break
    default
      целов .%dev323.name%
    break
  done
end
~
#32325
Притирания~
1 c 2
накраситься~
if %actor.vnum% != -1
  halt
end
if !(%actor.sex% == 2)
  osend %actor% _Если вы это сделаете, слишком многие в этом мире вас не поймут :)
  halt
end
wait 2
osend %actor% _Вы открыли ящичек, достали &Mрумяна&n и &Wбелила&n и начали втирать их в щеки.
oechoaround %actor% _%actor.name% открыла ящичек, достала &Mрумяна&n и &Wбелила&n и начала втирать их в щеки.
wait 1s
osend %actor% _Вы &cподвели&n глаза и &Kнасурьмили&n брови.
oechoaround %actor% _%actor.name% &cподвела&n глаза и &Kнасурьмила&n брови.
wait 1s
osend %actor% _Вы взяли &Rпомаду&n и накрасили губы. Все!
oechoaround %actor% _%actor.name% накрасила губы &Rпомадой&n. Какая милашка!
if !%actor.affect(воздушная аура)%
  dg_affect %actor% воздушная_аура воздушная_аура 2 100
  dg_affect %actor% обаяние воздушная_аура 2 100
  dg_affect %actor% удача воздушная_аура 18 100
end
if (%actor.realroom% >= 32300) && (%actor.realroom% <= 32399)
  set kras323 %actor.id%
  worlds kras323
end
opurge %self%
~
#32326
Пятиугольник~
1 c 2
согнуть~
if %actor.vnum% != -1
  halt
end
if !(%arg.contains(пятиугольник)%)
  osend %actor% _И с чем вы хотите проделать это?
  halt
end
wait 2
osend %actor% _Вы попытались согнуть серебряный пятиугольник, но он выгнулся обратно и вспыхнул синим светом.
oechoaround %actor% _Серебряный пятиугольник в руках %actor.rname% вспыхнул синим светом.
calcuid penta323 %actor.realroom% room
attach 32329 %penta323.id%
exec 32329 %penta323.id%
detach 32329 %penta323.id%
if %random.9% == 1
  osend %actor% _Серебряный пятиугольник рассыпался.
  %purge% %self%
end
~
#32327
Рамка с сеткой~
1 t 90
~
wait 1
osend %actor% _Вы задели тонкий шнурок, привязанный к лежащей на земле рамке.
oechoaround %actor% _%actor.name% задел%actor.g% тонкий шнурок, привязанный к лежащей на земле рамке.
oecho _Спрятанная сеть вылетела вверх!
eval overok323 %actor.remort% * 2 + %actor.level%
if %overok323% < %random.100%
  osend %actor% Вы замерли на месте, не в силах пошевельнуться.
  oechoaround %actor% %actor.name% замер%actor.q% на месте !
  dg_affect %actor% обездвижен оцепенение 1 35 1
else
  osend %actor% _Вы отмахнулись от сети, и она упала.
  oechoaround %actor% _%actor.name% отмахнул%actor.u% от сети, которая упала обратно.
end
opurge %self%
~
#32328
Серый мешок~
1 c 2
развязать~
if %actor.vnum% != -1
  halt
end
if !(%arg.contains(мешок)%)
  osend %actor% _И с чем вы хотите проделать это?
  halt
end
wait 2
osend %actor% _Вы развязали серый мешок.
oechoaround %actor% _%actor.name% развязал%actor.g% серый мешок.
wait 1s
oecho _Из мешка выскочил трехрогий черт.
oload mob 32385
opurge %self%
~
#32329
Врата~
2 z 1
~
wportal 32300 2
~
#32330
У ведуньи~
0 q 100
~
if %actor.id% != %otknyazya323.id%
  halt
end
wait 1
г Ой, гости пожаловали!
хих
wait 1s
г Ладно, знаю кто ты, %actor.name%, и куда идешь. Я родом из той деревни и пытаюсь ее своим волшебством оберегать.
г Сама нападать на тебя не буду - мне богиня Макошь запрещает.
г Вряд ли ты от своей цели отступишься, но если желаешь, дам тебе вещицу одну, чтобы сразу назад к усадьбе вернуться.
г За тысячу кун!
г Я такой сама пользуюсь, если хочу узнать, что в усадьбе делается... ну и еще кое для чего...
смущ
attach 32331 %self.id%
wait 1s
foreach uvedunyi323 %self.pc%
  if %uvedunyi323.sex% == 2
    шеп .%uvedunyi323.name% Вот ты девушка, а ходишь в битвы да походы. А ведь и за собой ухаживать надо.
    шеп .%uvedunyi323.name% Есть у меня средства для этого - белила, румяна, помада, сурьма. Таких и в Киеве не купить!
    шеп .%uvedunyi323.name% Могу подарить. Хочешь? Так и скажи!
    attach 32332 %self.id%
  break
end
done
detach 32330 %self.id%
~
#32331
Куны ведунье~
0 m 1000
~
if %actor.vnum% != -1
  halt
end
wait 1
if %amount% >= 1000
  mload obj 32308
  дать пятиуг .%actor.name%
  if %amount% > 1000
    eval lishnee323 %amount% - 1000
    г Лишнего не надо.
    дать %lishnee323% кун .%actor.name%
  end
  detach 32330 %self.id%
  %self.gold(-1000)%
  wait 2
  mecho _Ведунья достала еще один пятиугольник, в последний раз взглянула на вас и вдруг исчезла.
  mpurge %self%
end
~
#32332
Ведунья дает притирания~
0 d 1
хочу~
if %speech% == хочу
  wait 1
  switch %actor.sex%
    case 1
      г А можешь?
      хих .%actor.name%
    break
    case 2
      mload obj 32387
      дать притир .%actor.name%
      detach 32332 %self.id%
    break
  done
end
~
#32333
Поцарапанный ключ~
2 c 1
искать поискать~
if %actor.vnum% != -1
  halt
end
wait 1
if !(%arg.contains(ключ)%)
  wsend %actor% _Чего искать-то?
  halt
end
if %random.4% != 1
  wsend %actor% _Вы долго пытались найти здесь ключ, да все без толку.
  wechoaround %actor% _%actor.name% стал%actor.g% что-то искать тут, старательно осматривая землю и бревенчатую стену.
else
  wsend %actor% _Вы нашли ключ в щели верхнего бревна.
  wechoaround %actor% _%actor.name% наш%actor.y% в щели верхнего бревна ключ.
  wload obj 32335
end
detach 32333 %self.id%
~
#32334
Уходим~
0 z 0
~
mecho _Вдруг %self.name% куда-то убежал%self.g%.
mpurge %self%
~
#32335
Староста учит~
0 q 100
~
if %actor.id% == %geroy323.id%
  wait 2
  г Приказал мне князь научить тебя, %actor.name%, тому, что знаю. Ну что ж...
  eval xskill323 82 + %actor.remort% * 5
  if xskill323 > 142
    set xskill323 142
  end
  if !%actor.skill(изгнать нежить)%
    msend %actor% Вы изучили умение 'изгнать нежить'.
    mskillturn %actor.name% изгнать.нежить set
  elseif %actor.skill(изгнать нежить)% < xskill323
    msend %actor% _Теперь вы лучше умеете изгонять нежить.
    mskilladd %actor.name% изгнать.нежить 8
  else
    г Э, да ты сам%actor.a% любого научишь!
  end
  detach 32335 %self.id%
end
~
#32336
Кузнец учит~
0 q 100
~
if %actor.id% == %geroy323.id%
  wait 2
  г Приказал мне князь научить тебя, %actor.name%, тому, что знаю. Ну что ж...
  eval xskill323 82 + %actor.remort% * 5
  if xskill323 > 142
    set xskill323 142
  end
  if !%actor.skill(ремонт)%
    msend %actor% Вы изучили умение 'ремонт'.
    mskillturn %actor.name% ремонт set
  elseif %actor.skill(ремонт)% < xskill323
    msend %actor% _Теперь вы лучше умеете чинить вещи.
    mskilladd %actor.name% ремонт 8
  else
    г Э, да ты сам%actor.a% любого научишь!
  end
  detach 32336 %self.id%
end
~
#32337
Лоад стафа с уменьшающимся шансом~
0 f 0
~
*из мобов падает стаф со внумом равным внуму моба
*шанс падает с 20% до 2,5%
if %random.10% > 1
  halt
end
eval shmotka323 %self.vnum%
if %random.5% > %world.curobjs(%shmotka323%)%
  mload obj %shmotka323%
end
~
#32338
Смерть старейшины~
0 f 0
~
if %exist.mob(32300)%
  calcuid velesur323 32300 mob
  detach 32303 %velesur323.id%
  attach 32320 %velesur323.id%
end
*квеститем
mload obj 32384
~
#32339
Смерть десятника~
0 f 0
~
*ключ
mload obj 32386
~
#32340
Холд~
0 q 100
~
wait 1
msend %actor% %self.name% зыркнул%self.g% на Вас и произнес%self.q% : '... замри.'.
mechoaround %actor% %self.name% взглянул%self.g% на %actor.vname% и произнес%self.q% : '... замри.'.
dg_cast 'оцеп' .%actor.name%
~
#32341
Камнепад~
0 q 100
~
wait 1
msend %actor% %self.name% зыркнул%self.g% на Вас и произнес%self.q% : 'пусть каменья падут'.
mechoaround %actor% %self.name% взглянул%self.g% на %actor.vname% и произнес%self.q% : 'пусть каменья падут'.
dg_cast 'камнепад' .%actor.name%
~
#32342
Смерть косолапого~
0 f 0
~
if %world.curobjs(32344)% < %random.12%
  mload obj 32344
end
~
#32343
Бабы~
0 q 100
~
if %actor.vnum% != -1
  halt
end
if %actor.sex% != 2
  halt
end
wait 1
г Ты что тут забыла, дура?
msend %actor% %self.name% зыркнула на Вас и произнесла : 'да коснется тебя Чернобог'.
mechoaround %actor% %self.name% взглянула на %actor.vname% и произнесла : 'да коснется тебя Чернобог'.
dg_cast 'выс жи' .%actor.name%
~
#32344
Смерть попа~
0 f 0
~
*ключ
mload obj 32385
~
$~
