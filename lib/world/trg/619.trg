#61900
Семаргл приветствует~
0 r 100
~
if (%quest619.name% == %nil%)
  wait 1s
  ул
  г Приветствую тебя, %actor.iname%.
  смотр %actor.iname%
  wait 1s
  if %actor.sex% == 1
    г Вижу силен ты, да умен.
  elseif
    %actor.sex% == 2
    г Вижу сильна ты, да умна.
  end
  г Не откажи богу огня, помоги в просьбе одной.
  г А я в свою очередь отблагодарю тебя по-царски.
end
~
#61901
Семаргл дает задание~
0 d 100
помогу~
if (%quest619.name% = %nil%)
  set quest619 %actor%
  global quest619
  wait 1s
  г Спасибо, что не отказал%actor.g%.
  ул
  wait 1s
  г Стою я тут уж незнамо сколько лет, а может и веков.
  г Охраняю вход в мир людей от нечести, да нежити разной. 
  г А мне отлучиться надо, Купальница зовет, да не могу я оставить пост свой, зло проберется.
  wait 1s
  г Так что пойди, попробуй сразится с Великим Черным Змеем.
  г А убьешь, принеси голову его в доказательство.
  г Только помни, силен он да коварен.
  wait 1s
  г Вот тебе ключ от врат в мир его.
  г Иди же, врата в мир зла тут неподалеку.
  wait 1s 
  mload obj 61900
  дать ключ %actor.iname%
  detach 61900 %self.id%
  detach 61901 %self.id%
end
~
#61902
Змей помер~
0 f 100
~
msend %actor.name% Вот и Змей лишился своей ужасной головы.
mechoaround %actor.name% %actor.iname% сильнейшим ударом отрубил змею голову.
mload obj 61901
~
#61903
Награда~
0 j 100
~
wait 1
if %actor.id% == %quest619.id%
  if %object.vnum% == 61901
    wait 1
    mpurge %object%
    wait 10
    ул
    if %actor.sex% == 2
      г Молодец, доблестная воительница, ты помогла мне, а я награжу тебя за это.
    else
      г Молодец, доблестный воин, ты помог мне, а я награжу тебя за это.
    end
    г Что бы тебе дать такое?
    дум
    wait 1s
    switch %random.50%
      case 1
        mecho _Семаргл снял с себя прекрасного вида амулет и протянул его Вам.
        wait 1s
        mload obj 61902
        дать амулет .%actor.iname%
        г Вот завалялось тут у меня кой-чего, на, забирай.
      break
      case 2
        mecho _Семаргл снял с себя прекрасного вида кольцо и протянул его Вам.
        wait 1s
        mload obj 61903
        дать кольцо .%actor.iname%
        г Вот завалялось тут у меня кой-чего, на, забирай.
      break
      case 3
        mecho _Семаргл снял с себя прекрасного вида шлем и протянул его Вам.
        wait 1s
        mload obj 61904
        дать шлем .%actor.iname%
        г Вот завалялось тут у меня кой-чего, на, забирай.
      break
      case 4
        mecho _Семаргл снял с себя прекрасного вида доспех и протянул его Вам.
        wait 1s
        mload obj 61905
        дать доспех .%actor.iname%
        г Вот завалялось тут у меня кой-чего, на, забирай.
      break
      case 5
        mecho _Семаргл снял с себя прекрасного вида перстень и протянул его Вам.
        wait 1s
        mload obj 61906
        дать перстень .%actor.iname%
        г Вот завалялось тут у меня кой-чего, на, забирай.
      break
      case 6
        mecho _Семаргл достал прекрасного вида меч и протянул его Вам.
        wait 1s
        mload obj 61907
        дать меч .%actor.iname%
        г Вот завалялось тут у меня кой-чего, на, забирай.
      break
      case 7
        mecho _Семаргл достал прекрасного вида кинжал и протянул его Вам.
        wait 1s
        mload obj 61908
        дать кинжал .%actor.iname%
        г Вот завалялось тут у меня кой-чего, на, забирай.
      break
      case 8
        mecho _Семаргл достал прекрасного вида топор и протянул его Вам.
        wait 1s
        mload obj 61909
        дать топор .%actor.iname%
        г Вот завалялось тут у меня кой-чего, на, забирай.
      break
      case 9
        mecho _Семаргл снял прекрасного вида латы и протянул их Вам.
        wait 1s
        mload obj 61931
        дать латы .%actor.iname%
        г Вот завалялось тут у меня кой-чего, на, забирай.
      break
      case 10
        mecho _Семаргл снял прекрасного вида плащ и протянул его Вам.
        wait 1s
        mload obj 61932
        дать плащ .%actor.iname%
        г Вот завалялось тут у меня кой-чего, на, забирай.
      break
      case 11
        mecho _Семаргл снял прекрасного вида накидку и протянул ее Вам.
        wait 1s
        mload obj 61933
        дать накидка .%actor.iname%
        г Вот завалялось тут у меня кой-чего, на, забирай.
      break
      default
        mecho _Семаргл дал Вам большую кучу драгоценных камней.
        eval temp %actor.gold(+15000)%
        wait 1s
        г Вот возьми, это тебе пригодится!.
      break
    done
    брос all
  else
    хму
    брос %object.name%
  end
end
~
#61904
Добываем кусок лавы~
0 f 100
~
if (%random.3% == 1)
  msend %actor.iname% Вы увидели, как, погибая, скелет выронил кусок застывшей лавы.
  mechoaround %actor.iname% %actor.iname% сильнейшим ударом расколол%actor.g% кости этой твари. 
  mload obj 61919
end
~
#61905
Скелет - кузнец приветствует~
0 r 100
~
wait 1s
г О, не верю пустым глазам своим.
удив
г Живой, живой человек.
хох
wait 1s
г Да, не думал я, что кто-то забредет сюда...
г Но если попал сюда, помоги мне.
г Наказали меня боги за то, что при жизни иногда ковал плохие доспехи, да кривое оружие.
г Вот в наказание посадили меня сюда, да наказали выковать сто прекрасных вещей.
г Тогда может и отпустят.
wait 1s
г Принеси мне материал какой-нибудь, выкую на славу доспех прекрасный!
~
#61906
Скелет - кузнец делает вещи1~
0 j 100
~
wait 1
if %object.vnum% == 61919
  wait 1
  mpurge %object%
  eval addvnum %random.30%
  eval vnum %addvnum%+61920
  wait 10
  г Эхххх, отойди, зашибу!
  if %world.curobjs(%vnum%)% > 3 || %addvnum% > 10
    set addvnum  20
  end
  wait 2s
  switch %addvnum%
  break
  case 1
    wait 1s
    mload obj 61921
    дать загроб %actor.iname%
    г Вот, носи на здоровие!
  break
  case 2
    wait 1s
    mload obj 61922
    дать загроб %actor.iname%
    г Вот, носи на здоровие!
  break
  case 3
    wait 1s
    mload obj 61923
    дать загроб %actor.iname%
    г Вот, носи на здоровие!
  break
  case 4
    wait 1s
    mload obj 61924
    дать загроб %actor.iname%
    г Вот, носи на здоровие!
  break
  case 5
    wait 1s
    mload obj 61925
    дать загроб %actor.iname%
    г Вот, носи на здоровие!
  break
  case 6
    wait 1s
    mload obj 61926
    дать загроб %actor.iname%
    г Вот, носи на здоровие!
  break
  case 7
    wait 1s
    mload obj 61927
    дать загроб %actor.iname%
    г Вот, носи на здоровие!
  break
  case 8
    wait 1s
    mload obj 61928
    дать загроб %actor.iname%
    г Вот, носи на здоровие!
  break
  case 9
    wait 1s
    mload obj 61929
    дать загроб %actor.iname%
    г Вот, носи на здоровие!
  break
  case 10
    wait 1s
    mload obj 61930
    дать загроб %actor.iname%
    г Вот, носи на здоровие!
  break
  default 
    wait 1s
    г Вот незадача, опять испортил...
    г Найдешь еще, тащи, может и получится.
  break 
done
end
~
#61907
Завывания~
2 e 100
~
wait 1s
wecho _Вам послышались нечеловеческие завывания...
~
#61908
Через узкое место~
2 c 100
лезть~
if !%arg.contains(камни)% 
  wsend %actor% _Куда это Вы лезете?!
  return 0
  halt 
end
wsend %actor% _Скрипя зубами, разрывая руки в кровь, вы все же пролезли через завал.
wechoaround %actor% _%actor.name% полез%actor.q% через завал..
wteleport %actor% 61931
wsend %actor% _Вы выбрались из завала.
wechoaround %actor% _Кто-то плюясь и матерясь пролез через завал. 
end
~
#61909
Лезем обратно~
2 c 100
лезть~
if !%arg.contains(камни)% 
  wsend %actor% _Куда это Вы лезете?!
  return 0
  halt 
end
wsend %actor% Скрипя зубами, разрывая руки в кровь, Вы все же пролезли через завал.
wechoaround %actor% _%actor.name% полез%actor.q% через завал..
wteleport %actor% 61927
wsend %actor% _Вы выбрались из завала.
wechoaround %actor% _Кто-то плюясь и матерясь пролез через завал. 
end
~
#61910
Пинаем стену~
2 c 100
пнуть~
if !%arg.contains(стена)% 
  wsend %actor% _Что пнуть то так хотите ?!
  return 0
  halt 
end
wsend %actor% _Вы с размаху ударили ногой по непрочной стене, пробивая замурованный проход.
wechoaround %actor% %actor.iname% пнул%actor.g% стену, разбивая непрочные камни.
wdoor 61976 north room 61977
wdoor 61977 south room 61976
end
~
#61911
Репоп~
2 f 100
~
calcuid deletetrig 61900 mob
attach 61900 %deletetrig.id% 
attach 61901 %deletetrig.id%
attach 61903 %deletetrig.id%
calcuid deletetrig 61902 mob
attach 61902 %deletetrig.id%
calcuid deletetrig 61918 mob  
attach 61905 %deletetrig.id%
wdoor 61976 north purge room 61977
wdoor 61977 south purge room 61976
wdoor 61912 west purge room 61913
wdoor 61913 east purge room 61912  
~
#61913
Умер дьявол~
0 f 100
~
mload obj 61953
~
#61914
Выкинули дьявольский огонь~
2 h 100
~
if (%object.iname% == дьявольский огонь)
  wait 1s
  wecho _Вдруг огонь вспыхнул еще ярче, осветив все вокруг!
  wait 1s
  wecho _Замок на воротах стал отпираться! 
  wait 1s
  wecho _Ворота стали расходиться перед Вами!
  wdoor 61912 west room 61913
  wdoor 61913 east room 61912 
  wait 1s
  wecho _И вот ничто не преграждает Вам путь!
end
~
$~
