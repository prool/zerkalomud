#35700
у ваньки~
0 r 100
~
if %actor.clan%==сп
  wait 5
  say За скатертью пришли?
  say Она будет стоить Вам 100 кун.
else
  say Чужим здесь не место!
end
~
#35701
дали куны ваньке~
0 m 100
100~
if %actor.clan%==сп
  tell %actor.name% Хорошо!
  if %world.curobjs(35710)% < 50
    tell %actor.name% Держи свою скатерть!
    mload obj 35727
    give скатерть %actor.name%
  else
    tell %actor.name% Все, нету скатеретей.
  end
else
  say Чужим здесь не место!
end
~
#35702
пурж стаффа~
1 g 100
~
wait 1
if %actor.clan% == сп
  halt
endif
%purge% %self%
~
#35703
обкаст~
0 m 0
~
wait 1
фиг %actor.name%
halt
if %amount% < 20
  msend %actor.name% За такие деньги я даже пальцем не пошевелю!
  halt
endif
switch %amount%
  case 20
    mecho Священик зачитал свиток.
    dg_cast 'критич исцеление' %actor.name%
  break
  case 30
    mecho Священик прочитал заклинание из книги.
    dg_cast 'доблесть' %actor.name%
  break
  case 40
    mecho Священик посмотрел в резы и что-то пробормотал.
    dg_cast 'невидимость' %actor.name%
  break
  case 50
    mecho Священик зачитал свиток.
    dg_cast 'защита' %actor.name%
  break
  case 60
    mecho Священик зачитал свиток.
    dg_cast 'затуманивание' %actor.name%
  break
  case 70
    mecho Священик скукожился аки гриб сухой.
    dg_cast 'сила' %actor.name%
  break
  case 80
    mecho Священик взмахнул руками.
    dg_cast 'полет' %actor.name%
  break
  case 90
    mecho Священик взмахнул руками.
    dg_cast 'быст восст' %actor.name%
  break
  case 350
    mecho Священик зачитал свиток
    dg_cast 'доблесть' %actor.name%
    dg_cast 'невидимость' %actor.name%
    dg_cast 'защита' %actor.name%
    dg_cast 'затуманивание' %actor.name%
    dg_cast 'сила' %actor.name%
    dg_cast 'полет' %actor.name%
    dg_cast 'быст восст' %actor.name%
  break
  default
    msend %actor% Извините, но я не знаю что Вы хотите от меня за эти деньги.
    msend %actor% Вот что я могу сделать для Вас:
    msend %actor%  за 20 кун - подлечу тебя чуток.
    msend %actor%  за 30 кун - Бог будет с тобой.
    msend %actor%  за 40 кун - невидимкою будешь.
    msend %actor%  за 50 кун - ты станешь более защищен.
    msend %actor%  за 60 кун - твое тело станет туманным.
    msend %actor%  за 70 кун - сильнее во стократ станешь.
    msend %actor%  за 80 кун - сможешь летать,аки сокол в небе.
    msend %actor%  за 90 кун - сможешь быстрее жизнь и энергию восстанавливать.
    msend %actor%  за 350 кун - могу сразу все накастить...
  done
~
#35704
приход к знахарю~
0 g 100
~
wait 1
msend %actor% Вот что я могу сделать для Вас:
msend %actor%  за 20 кун - подлечу тебя чуток.
msend %actor%  за 30 кун - Бог будет с тобой.
msend %actor%  за 40 кун - невидимкою будешь.
msend %actor%  за 50 кун - ты станешь более защищен.
msend %actor%  за 60 кун - твое тело станет туманным.
msend %actor%  за 70 кун - сильнее во стократ станешь.
msend %actor%  за 80 кун - сможешь летать,аки сокол в небе.
msend %actor%  за 80 кун - сможешь быстрее жизнь и энергию восстанавливать.
msend %actor%  за 350 кун - могу сразу все накастить...
end
~
#35705
развернуть скатерть~
1 c 3
развернуть~
oechoaround %actor% %actor.name% развернул%actor.g% скатерть.
osend %actor% Вы аккуратно развернули скатерть.
oload mob 35710
calcuid cover 35727 obj
opurge %cover%
~
#35706
свернуть скатерть~
0 c 100
свернуть~
if (%actor.clan%==сп)
  mechoaround %actor% %actor.name% аккуратно сложил%actor.g% скатерть.
  msend %actor% Вы аккуратно сложили скатерть.
  mload obj 35727
  wait 1
  mpurge %self%
else
  mechoaround %actor% %actor.name% попытал%actor.u% сложить скатерть, но та вырвалась из рук.
  msend %actor% Вы попытались сложить скатерть, но она вырвалась из ваших рук.
end
~
#35707
спуститься к алтарю~
2 c 1
спуститься~
if (!%arg.contains(алтар)%)
  %send% %actor% Куда хотите спуститься?
  halt
end
%send% %actor% Вы спустились к алтарю для жертвоприношений.
%echoaround% %actor% %actor.iname% спустил%actor.u% к алтарю для жертвоприношений.
%teleport% %actor% 35781 horse
wait 1
%echoaround% %actor% %actor.iname% спустился сюда.
~
#35708
принести жертву~
2 c 1
принести~
*принести жертву : Rooms : Command : 1 : принести
if (!%arg.contains(жертв)%)
  %send% %actor% Что принести? Куда?
  halt
end
%send% %actor% &YВы вознесли руки к небесам, умоляя богов принять Вашу жертву.&n
%echoaround% %actor% &Y%actor.iname% вознес%actor.q% руки к небесам, умоляя богов принять %actor.s% жертву.&n
wait 1s
foreach ob %self.objects%
  wait 1
  set name %ob.iname%
  if (%ob.val3% && (%name.contains(труп)% || %name.contains(останки)%))
    %echo% Зачем богам мертвечина?
  elseif (%ob.effect(именной предмет)%)
    %echo% Что даровано богами - в жертву не приносится!
  elseif (%ob.name%)
    %echo% %ob.iname% отправил%ob.u% на небеса.
    %purge% %ob%
  end
done
set roomn 35700
while (%roomn% < 35782)
  wat %roomn% wecho &MХорс снизошел с небес и обратил свой взгляд на Вас!&n
  wat %roomn% wecho &MВидать, %actor.iname% принес%actor.q% очередную жертву своему Повелителю!&n
  eval roomn %roomn%+1
done
~
#35733
лизать иокасту (статуя)~
1 c 4
лизать~
if ((!%arg.contains(иокаст)%) && (!%arg.contains(стату)%))
  %send% %actor% Что? Кого лизать?
  halt
end
%send% %actor% Вы принялись лизать статую Иокасты.
%send% %actor% Шоколадный вкус ее тела овладел Вами.
%echoaround% %actor% %actor.iname% принял%actor.u% лобызать стопы статуи Иокасты.
wait 3
%send% %actor% Статуя Иокасты подмигнула Вам.
%echoaround% %actor% Статуя Иокасты подмигнула %actor.dname% и громко застонала.
%echoaround% %actor% Насытившись, %actor.iname% осоловело поглядел%actor.g% по сторонам.
if ((!%actor.canbeseen%) || (%actor.realroom% != %self.room%))
  halt
end
dg_cast 'насыщение' .%actor.name%
~
#35734
статуя тригает рандомно~
1 b 5
~
eval victim %random.pc%
if (!%victim%)
  halt
end
%send% %victim% Статуя Иокасты игриво подмигнула Вам и послала воздушный поцелуй.
%echoaround% %victim% Статуя Иокасты игриво подмигнула %victim.dname% и послала воздушный поцелуй.
~
#35735
Пинаем тьму с ренты~
0 bq 100
~
foreach victim %self.pc%
  if ((%victim.affect(затемнение)%) && (%victim.realroom% == %self.realroom%))
    wait 1
    хмур .%actor.name%
    г Не гоже тьму тут наводить.
    г Завязывай с этим или проваливай пока я палача не позвал!
    wait 30s
    if ((%victim.realroom% != %self.realroom%) || (!%victim.affect(затемнение)%))
      halt
    end
    calcuid vano 35715 mob
    detach 35737 %vano.id%
    г Ну, я тебя предупреждал!
    крич Вано! Тут клиент для тебя есть!
    wait 2
    %echo% Подручные палача прибежали с запада.
    %force% %victim% wake
    %force% %victim% stand
    %send% %victim% Подручные палача подхватили Вас под белы рученьки и куда-то поволокли.
    %echoaround% %victim% Подручные палача подхватили %victim.vname% под белы рученьки и куда-то поволокли.
    wait 2
    %force% %victim% west
    %force% %victim% north
    %force% %victim% west
    wait 2
    eval sinner %victim%
    remote sinner %vano.id%
    exec 35736 %vano.id%
  end
done
~
#35736
Сажаем на кол!~
0 z 100
~
wait 2
if ((!%sinner%) || (%sinner.realroom% != %self.realroom%))
  halt
end
set sinforgiven 0
global sinforgiven
eval temp %sinner.wait(3)%
%send% %sinner% Подручные палача передали Вас в сильные руки %self.rname%.
%echoaround% %victim% Подручные палача передали %sinner.vname% в руки %self.rname%.
wait 3
%send% %sinner% %self.iname% насадил Вас на острый кол, торчащий неподалеку от плахи.
%echoaround% %sinner% %self.iname% насадил %sinner.vname% на острый кол, торчащий неподалеку от плахи.
%send% %sinner% Не в силах терпеть эту адскую боль Вы закричали...
%force% %sinner% кричать Ох ты ж елки-иголки! Я больше не буууду!
wait 1s
г Не будешь, говоришь? Ну тогда слезай... когда сможешь!
смея
attach 35737 %self.id%
~
#35737
Входим к палачу~
0 q 100
~
if (!%sinner%)
  halt
end
wait 3
if ((%sinner.realroom% == %self.realroom%) && (%actor% != %sinner%))
  %send% %actor% Вы заметили, что %sinner.iname% усажен%sinner.g% здесь на кол.
  %send% %actor% Не иначе как за грехи свои тяжкие!
elseif (%actor% == %sinner%)
  if (!%sinforgiven%)
    set sinforgiven 1
    global sinforgiven
  else
    halt
  end
  г Вернул%sinner.u% еще посидеть?
  г Ну так давай я помогу!
  %send% %sinner% %self.iname% подхватил Вас на руки.
  %send% %sinner% Раньше, чем Вы успели опомниться, знакомая боль пронзила Ваше тело!
  %echoaround% %sinner% %self.iname% подхватил %sinner.vname% и резко усадил на кол!
  switch %random.3%
    case 1
      set mess У-ху-хууу!
    break
    case 2
      set mess Да что ж это делается! На кол всего лишь за тьму на ренте!
    break
    case 3
      set mess Ё! Больно же!
    break
  done
  %force% %sinner% кричать %mess%
end
~
#35738
Садимся за стол~
2 c 1
сесть~
if (!%arg.contains(за стол)%)
  return 0
  halt
end
if ((%attable.contains(%actor.iname%)%) && (%actor.position% <= 6))
  %send% %actor% Вы ведь уже за столом!
  halt
else
  eval temp %actor.position(6)%
  %send% %actor% Вы с облегчением плюхнулись в уютное кресло.
  %echoaround% %actor% %actor.iname% плюхнул%actor.u% за стол.
  set tmp %actor.iname%
end
foreach guest %attable%
  if ((%guest.realroom% == %self.vnum%) && (%guest.position% <= 6) && (!%tmp.contains(%guest.iname%)%))
    set tmp %tmp% %guest.iname%
  end
done
set attable %tmp%
global attable
wait 5
%send% %actor% Тот же час слуги принесли Вам на подносах всяческих яств.
%echoaround% %actor% Тот же час слуги принесли %actor.m% на подносах всяких яств.
%echoaround% %actor% %actor.iname% принял%actor.u% уплетать одно блюдо за другим.
dg_cast 'насыщение' .%actor.name%
~
#35739
Вошли в клетку со столом~
2 e 100
~
if (!%attable%)
  halt
end
wait 1s
foreach guest %attable%
  if ((%guest.realroom% == %self.vnum%) && (%guest.position% <= 6))
    set tmp %tmp% %guest.iname%
  end
done
set attable %tmp%
global attable
if (!%attable%)
  halt
end
%send% %actor% Вы заметили, что за столом нынче не пусто...
foreach sitter %attable%
  switch %random.10%
    case 1
      %send% %actor% %sitter% жадно уплетает странного вида морское блюдо.
    break
    case 2
      %send% %actor% %sitter% вырезает засапожником какую-то надпись на столе.
    break
    case 3
      %send% %actor% %sitter% травит бородатые анекдоты.
      %send% %actor% И сам%sitter.g% же потом над ними смеется.
    break
    case 4
      %send% %actor% %sitter% хмуро глядит по сторонам. Видать, обед пересолили.
    break
    case 5
      %send% %actor% %sitter% весело распевает пошлые частушки.
    break
    case 6
      %send% %actor% %sitter% рассказывает о своем неравном бою с чудовищем.
      %send% %actor% Угадайте, кто кого победил в рассказе? А на самом деле?
    break
    case 7
      %send% %actor% %sitter% смачно ковыряется в зубах небольшой щепой.
    break
    case 8
      %send% %actor% %sitter% клюёт носом в стол, того и гляди свалится.
    break
    case 9
      %send% %actor% %sitter% осоловело улыбается, глядя в пустоту.
      %send% %actor% Видать, перепил%sitter.g% малость.
    break
    case 10
      %send% %actor% %sitter% жадно уплетает вкуснейшее мясное блюдо.
    break
  done
done
~
#35740
Беспорядки за столом~
2 b 10
~
if (!%attable%)
  halt
end
foreach guest %attable%
  if ((%guest.realroom% == %self.vnum%) && (%guest.position% <= 6))
    set tmp %tmp% %guest.iname%
  end
done
set attable %tmp%
global attable
if (!%attable%)
  halt
end
%echo% Слуги поднесли водки заскучавшим за столом ратникам.
foreach sitter %attable%
  switch %random.8%
    case 1
      %send% %sitter% Вас вдруг что-то сильно расстроило.
      %send% %sitter% Резко вскочив, Вы запустили пустой тарелкой в стену.
      %echoaround% %sitter% Резко вскочив, %sitter.iname% запустил%sitter.g% пустой тарелкой в стену.
    break
    case 2
      %send% %sitter% Развеселившись, Вы стали кидаться в слуг объедками.
      %echoaround% %sitter% Развеселившись, %sitter.iname% стал%sitter.g% кидаться в слуг объедками.
    break
    case 3
      %send% %sitter% Взгрустнув немного, Вы решили спеть друзьям песенку о любви.
      %echoaround% %sitter% %sitter.iname% затянул%sitter.g% грустную песню о любви.
      %echo% _- ...Убегала, ох, как убегала!
      %echo% _- А любила - боже, как любила!
      %echo% _- Но девчонку молния догнала,
      %echo% _- Молния догнала и убила...
    break
    case 4
      %echoaround% %sitter% %sitter.iname% хмуро глядит по сторонам. Видать, недоперепил%sitter.g%.
    break
    case 5
      %send% %sitter% Вам вдруг захотелось сплясать, но ноги уже не слушаются.
      %send% %sitter% Еле получилось плюхнуться обратно за стол, ничего не задев... почти.
      %echoaround% %sitter% Ноги %sitter.rname% вдруг понесли %sitter.s% в пляс.
      %echoaround% %sitter% При %sitter.s% приземлении обратно за стол никто не пострадал... почти.
    break
    case 6
      %send% %sitter% Вы вдруг решили всем доказать, что Земля на самом деле плоская.
      %echoaround% %sitter% Яростно брызжа слюной, %sitter.iname% стал%sitter.g% доказывать, что Земля плоская.
    break
  done
done
~
#35741
Проверяем стаф на уходящем в ренту~
0 c 0
постой посто пост пос ren rent~
*Проверяем стаф на уходящем в ренту : Mobiles : Command : 0 : постой посто пост пос ren rent
if ((%actor.vnum% != -1) || ((%cmd.mudcommand% != постой) && (%cmd.mudcommand% != rent)))
  return 0
  halt
end
*список запрещенного для ренты стафа
set banlist 30625 79657 91521 91523 91524 91525 91529
*set poslist 121714+1514+153+43+43+4
*проверяем инвентарь чара по списку
foreach vnum %banlist%
  if (%actor.haveobj(%vnum%)%)
    calcuid item %vnum% obj
    set havestuff %havestuff% %item.vname%,
  end
done
*и проверяем некоторые позиции экипировки на конкретные стафины
set item %actor.eq(3)%
*шея
if ((%item.vnum% == 91524) || (%item.vnum% == 91525) || (%item.vnum% == 91529))
  set havestuff %havestuff% %item.vname%,
end
set item %actor.eq(4)%
*шея
if ((%item.vnum% == 91524) || (%item.vnum% == 91525) || (%item.vnum% == 91529))
  set havestuff %havestuff% %item.vname%,
end
set item %actor.eq(12)%
*плечи
if (%item.vnum% == 30625)
  set havestuff %havestuff% %item.vname%,
end
set item %actor.eq(14)%
*запястья
if ((%item.vnum% == 91521) || (%item.vnum% == 91523))
  set havestuff %havestuff% %item.vname%,
end
set item %actor.eq(15)%
*запястья
if ((%item.vnum% == 91521) || (%item.vnum% == 91523))
  set havestuff %havestuff% %item.vname%,
end
set item %actor.eq(17)%
*офф
if (%item.vnum% == 79657)
  set havestuff %havestuff% %item.vname%,
end
if (%havestuff.words% > 0)
  *если чего-то нашлось - теляем о борзости
  tell %actor.name% Не слишком ли много ты на себя берешь, унося на постой %havestuff% a?
end
%cmd.mudcommand%
return 0
~
#35742
Проверяем стаф при предложении ренты~
0 c 0
o of off offe offer пре пред предл предло предлож предложе предложен предложени предложение~
*Проверяем стаф на уходящем в ренту : Mobiles : Command : 0 : o of off offe offer пре пред предл предло предлож предложе предложен предложени предложение
if ((%actor.vnum% != -1) || ((%cmd.mudcommand% != предложение) && (%cmd.mudcommand% != offer)))
  return 0
  halt
end
*список запрещенного для ренты стафа
set banlist 30625 79657 91521 91523 91524 91525 91529
*set poslist 121714+1514+153+43+43+4
*проверяем инвентарь чара по списку
foreach vnum %banlist%
  if (%actor.haveobj(%vnum%)%)
    calcuid item %vnum% obj
    set havestuff %havestuff% %item.vname%,
  end
done
*и проверяем некоторые позиции экипировки на конкретные стафины
set item %actor.eq(3)%
*шея
if ((%item.vnum% == 91524) || (%item.vnum% == 91525) || (%item.vnum% == 91529))
  set havestuff %havestuff% %item.vname%,
end
set item %actor.eq(4)%
*шея
if ((%item.vnum% == 91524) || (%item.vnum% == 91525) || (%item.vnum% == 91529))
  set havestuff %havestuff% %item.vname%,
end
set item %actor.eq(12)%
*плечи
if (%item.vnum% == 30625)
  set havestuff %havestuff% %item.vname%,
end
set item %actor.eq(14)%
*запястья
if ((%item.vnum% == 91521) || (%item.vnum% == 91523))
  set havestuff %havestuff% %item.vname%,
end
set item %actor.eq(15)%
*запястья
if ((%item.vnum% == 91521) || (%item.vnum% == 91523))
  set havestuff %havestuff% %item.vname%,
end
set item %actor.eq(17)%
*офф
if (%item.vnum% == 79657)
  set havestuff %havestuff% %item.vname%,
end
if (%havestuff.words% > 0)
  *если чего-то нашлось - теляем о борзости
  tell %actor.name% Не слишком ли много ты на себя берешь, унося на постой %havestuff% a?
end
%cmd.mudcommand%
return 0
~
$~
