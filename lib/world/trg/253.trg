#25300
горит камин~
1 t 20
~
wait %random.35%s
switch %random.9%
  case 9
    oecho _Огонь в камине заплясал и вспыхнул чуть ярче. 
  break 
  case 8
    oecho _Из камина с щелчком вылетел уголек и расспался искрами на полу. 
  break 
  case 7
    oecho _Пламя в камине чуть приопало.
  break 
  case 6
    oecho _Дрова в камине громко затрещали и начали рассыпаться на уголья. 
  break 
  case 5
    oecho _Языки пламени в камине приугасли и зал погрузился в полумрак. 
  break 
  case 4
    oecho _Огонь в камине взревел и языки пламени устремились в трубу. 
  break 
  case 3
    oecho _Небольшой уголек вылетел из камина и упал к вашим ногам.
  break  
  case 2
    oecho _От горящего камина вдруг распространился терпкий смолистый запах.
  break
  case 1
    oecho _Огонь в камине почти угас. 
  break 
done
~
#25301
пурж~
1 g 100
~
wait 1
if (%actor.clan% != дзп)
  %send% %actor% %self.name% вспыхнул%self.g% и рассыпал%self.u%. 
  %purge% %self%
end
~
#25302
заходят к ящерам~
0 r 100
~
wait 1
eval key %actor.eq(17)% 
if ( %key.vnum% != 139 )
  msend %actor% _Внезапно на вашу голову обрушился СТРАШНЫЙ удар и вы ясно увидели вспыхнувшие во тьме звезды.
  msend %actor% Вы смутно почувствовали, как вас хватают за ноги и тащат куда-то.
  dg cast 'сл возвр' %actor.name%
  %actor.position(6)% 
  %actor.wait(10)% 
  dg_cast 'сл возвр' %actor.name%
end
~
#25303
ящер заходит в комнату к игроку~
0 t 100
~
wait 1
foreach target %self.pc%
  eval key %target.eq(17)% 
  if ( %key.vnum% != 139 )
    msend %target% _Вы почувствовали чье-то странное присутствие. 
    msend %target% _Внезапно на вашу голову обрушился СТРАШНЫЙ удар и вы ясно увидели вспыхнувшие во тьме звезды.
    msend %target% Вы смутно почувствовали, как вас хватают за ноги и тащат куда-то.
    dg cast 'сл возвр' %target.name%
    %target.position(6)% 
    %target.wait(10)%
    dg_cast 'сл возвр' %target.name%
  end
done
~
#25304
у старого ведуна~
0 m 1
~
*if (%actor.clan% != ЗП)
*say Халявы захотелось??? Ступай-ка отсюда, покуда цел.
*give %amount% кун %actor.name%
*halt
*end
wait 1
mecho Старый ведун поднял руки, что-то прошептал и сделал несколько странных жестов. 
switch %amount%
  case 1
    mload obj 127
    give лампа %actor.name%
  break
  case 100
    mload obj 25336
    give уздечка %actor.name%
  break
  default
    say И чего же ты за эти деньги хочешь?
    say Вон - грамотку глянь, коли не разумеешь сам.
    give %amount% кун %actor.name%
  done
~
#25305
встряхнуть уздечку~
1 c 3
встряхнуть~
if (%actor.clan%  != дзп)
  %send% %actor% _Вы сильно встряхнули уздечку... и ничего не произошло.
  halt
end
if !%arg.contains(уздечку)%
  %send% %actor% _Кого же вы хотите потрясти?
  halt
end
%send% %actor% _Вы встряхнули уздечку.
%echoaround% %actor% _%actor.name% взя%actor.q% в руку золоченую уздечку и слегка встряхну%actor.q% ее.
%echo% _Послышалось хлопанье огромных крыльев и орлиный клекот. 
%echo% _Огромный белоснежный грифон прилетел сюда.
%load% mob 25312
%force% %actor.name% оседлать грифон
%purge% %self%
~
#25306
расседлать~
0 c 1
расседлать~
if !%arg.contains(грифона)%
  %send% %actor% _Кого вы хотите расседлать?
  halt
end
if (%actor.clan%  != дзп)
  %oecho% _Вы попытались снять уздечку с грифона но он едва не снес Вам голову с плеч!
  halt
end
wait 1
%send% %actor% _Вы расседлали белоснежного грифона.
%echoaround% %actor% _%actor.name% снял%actor.q% седло с белоснежного грифона.
%echo% _Грифон взмахнул крыльями, подняв сильный ветер, и улетел.
%load% obj 25336
%purge% %self%
~
#25307
give~
1 i 100
~
if (%victim.clan% != дзп)
  return 0
  wait 1
  %send% %actor% Вы хотите доверить ЭТО чужаку?!
  halt
end
~
#25308
у привратника~
0 d 0
"отворяй ворота!"~
wait 1
if (%actor.clan%  != дзп)
  хмур
  wait 3
  ворч
  wait 1s
  брысь %actor.name%
  halt
end
if %actor.name% == Витерн
  say Сквернословов не пущу - выпутывайся как знаешь.
  послать .%actor.name%
  halt
end
кив
%load% obj 25329
отпере дверь восток
отк дверь восток
mjunk all
wait 4s
%load% obj 25329
закр дверь восток
запере дверь восток
mjunk all
~
#25309
у ключника~
0 q 100
~
wait 1
if %actor.clan% != дзп
  хмур
  say Ты еще кто такой?!
  крича Стража!!!
  msend %actor% Несколько здоровенных гридней выставили вас вон.
  mteleport %actor% 25300 horse
  mecho Несколько здоровенных гридней выставили %actor.vname% вон.
  halt
end
wait %random.10%
switch %random.4%
  case 4
    здоров %actor.name%
  break
  case 3
    привет %actor.name%
  break
  case 2
    пожа %actor.name%
  break
  case 1
    улы %actor.name%
  break
  вздох
done
~
#25310
у хозяина грифонов~
0 c 1
зови!~
if %actor.clan% != дзп
  halt
end
if %actor.clanrank% >= 2
  halt
end
wait 1
кив
if !%exist.mob(25312)%
  say Все грифоны в замке.
  halt
end
calcuid griphon 25312 mob
while %griphon%
  %teleport% %griphon% 25327
  emot поднял руки и произнес непонятное заклинание..
  %echo% белоснежный грифон примчался откуда-то.
  emot отдал приказ белоснежному грифону
  wait 1s
  %purge% %griphon% 
  %echo% Грифон взмахнул крыльми и улетел.
  unset griphon
  calcuid griphon 25312 mob
  wait 2s
done
~
#25311
Милостыня у нищего.~
0 m 1
~
wait 2
if (%actor.clan% != дзп)
  say Спасибо, добрые люди!
  поклон %actor.name%
  каш
  halt
end
if %amount% < 10
  взд
  поклон %actor.name%
  halt
end
mload obj 25329
give ключ %actor.name%
emot начал клевать носом и задремал
~
#25312
Триггер мобов-дружинников :о)~
0 r 100
~
wait 1
if (%actor.clan% ==дзп)
  halt
else
  кричать К оружию, други! Враг в стенах крепости! ВСЕ В БОЙ !!!
end
~
#25313
Триггер камушка на обрыве~
2 c 1
перевернуть~
wait 1
if !%arg.contains(камень)%
  %send% %actor% _Чего изволите?
  halt
end
if %actor.clan% != дзп
  %send% %actor% _Вы перевернули камень, но ничего под ним не нашли.
  halt
end
%echoaround%  %actor% %actor.name% перевернул%actor.g% камень и вытащил%actor.g% что-то из-под него.
%load% obj 25329
%send% %actor% _Под камнем что-то блеснуло.
~
#25314
Зашли к привратнику~
0 r 100
~
if %direction% == east
  wait 5s
  mload obj 25329
  close дверь восток
  запер дверь восток
  mjunk all
end
if %actor.clan% == дзп
  halt
end
хмур
say Ты еще кто такой?!
крича Стража!!!
msend %actor% Несколько здоровенных гридней выставили вас вон.
mteleport %actor% 25300 horse
mecho Несколько здоровенных гридней выставили %actor.vname% вон.
~
#25315
Загрузка знаков~
0 c 1
знак~
wait 1
if %actor.clan% != дзп
  послать %actor.name%
  halt
end
if %actor.clanrank% > 0
  хмур %actor.name%
  halt
end
if %arg.cdr% == разрушить
  switch %arg%
    case 1
      calcuid znak 25363 obj
      exec 25320 %znak.id%
    break
    case 2
      calcuid znak 25364 obj
      exec 25320 %znak.id%
    break
    case 3
      calcuid znak 25365 obj
      exec 25320 %znak.id%
    done
    halt
  end
  switch %arg%
    case 1
      if %world.curobjs(25363)% < 10
        mload obj 25363
      else
        пожать
      end
    break
    case 2
      if %world.curobjs(25364)% < 10
        mload obj 25364
      else
        пожать
      end
    break
    case 3
      if %world.curobjs(25365)% < 10
        mload obj 25365
      else
        пожать
      end
    done
    give знак .%actor.name%
~
#25316
пытаются отдать знак~
1 i 100
~
if %actor.vnum% != -1
  halt
end
if (%actor.clan% == дзп ) && (%actor.clanrank% == 0 )
  oecho Знак мягко засветился синим светом.
  set owner %victim%
  global owner
  halt
end
if (%victim.clan% != дзп ) || (%victim.clanrank% > 0 )
  osend %actor% Знак вдруг вспыхнул синим огнем!
  return 0
  halt
end
~
#25317
надевают знак~
1 j 100
~
if %actor.clan%  != дзп 
  return 0
  halt
end
set owner %actor%
global owner
~
#25318
пытаются бросить знак~
1 h 100
~
return 0
halt
~
#25319
пытаются взять знак~
1 g 100
~
if %actor.clan% != дзп
  return 0
  halt
end
if ( %actor% != %owner% ) && (%actor.clanrank% > 0 )
  osend %actor% Знак полыхнул нестерпимым синим светом!
  return 0
  halt
end
~
#25320
Самоуничтожение знака~
1 z 100
~
osend %actor% _Внезапно по поверхности знака побежали синие искры.
osend %actor% __Знак вспыхнул синим пламенем и рассыпался в прах.
wait 1
opurge %self%
~
#25321
Привратник выгоняет левых чаров~
0 q 100
~
wait 1
if (( %actor.clan% == дзп ) || (%actor.vnum% != -1))
  halt
end
хмур
say Ты еще кто такой?!
крича Стража!!!
msend %actor% Несколько здоровенных гридней выставили вас вон.
mteleport %actor% 25300 horse
mecho Несколько здоровенных гридней выставили %actor.vname% вон.
~
#25322
Триг резиновой бабы~
0 qt 100
~
wait 1
set igva Игвовед
if (%igva.realroom% != %self.realroom%)
  halt
end
восторг
wait 2
switch %random.6%
  case 1
    ласк .ивгвов
  break
  case 2
    любовь .игвове
  break
  case 3
    say О, мой кумир! Мой Гуру! Мой сэнсей! Мой.. мой... Мойдодоры!
    восторг .игвовед
  break
  case 4
    петь .игвовед
  break
  case 5
    щип .игвовед
  break
  case 6
    say ООоо! Игвоведушка! Иди же ко мне мая лубоффьь!
  break
done
follow .Игвовед
~
#25323
Баба пуржится~
0 b 10
~
set igva Игвовед
if ((%self.realroom% != %igva.realroom%) && (%self.realroom% > 25399) && (%self.realroom% < 25300))
  искать
  рыд
  say Пропаал-потерялся мой Игвоведушко! Пойду искать...
  рыд
  : поспешно удалилась
  wait 1
  mpurge %self%
end
~
#25385
Пугалка~
1 c 1
пугать~
oecho test
~
#25396
Шмотина~
1 g 100
~
wait 1
if %actor.vnum% == -1
  oforce %actor% remove all
  oforce %actor% одеть шмот
end
~
#25397
Summon to Sventovit~
1 cfg 0
~
say My trigger commandlist is not complete!
~
#25398
Destruction Demon Killed~
0 f 100
~
if (%world.curobjs(25396)% < 1)
  mload obj 25396
  halt
end
if (%world.curobjs(25395)% < 1)
  mload obj 25395
  halt
end
if (%world.curobjs(25394)% < 1)
  mload obj 25394
  halt
end
if (%world.curobjs(25393)% < 1)
  mload obj 25393
  halt
end
if (%world.curobjs(25392)% < 1)
  mload obj 25392
  halt
end
~
$~
