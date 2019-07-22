#67800
Завывание ветра~
2 e 100
~
wait 1s
wecho _Вам послышалось ужасное завывание ветра.
~
#67801
В бою со стражем гор~
0 k 5
~
set char %random.pc%
msend %char% _Страж гор призвал на помощь силы земли и вас завалило на землю!
%char.position(6)%
%char.wait(4)%
mechoaround %char% _Страж гор взмахнул рукой и глыбы вздыбились под ногами %actor.rname% 
уронив его на землю!
~
#67802
В бою с холодным ветром~
0 k 5
~
set char %random.pc%
msend %char%  Холодный ветер сильно дунул, заморозив Вам косточки!
%char.position(6)%
%char.wait(2)%
mechoaround %char%  Холодный ветер заморозил %actor.vname%
~
#67803
В бою с горным духом~
0 k 5
~
mecho _Горный дух швырнул множество мелких камней! 
foreach char %self.char%
  if %random.2% == 1
    msend %char% _В Вас попало несколько мелких камней, кинутых горным духом!
    mechoaround %actor% _Несколько камней угодило прямо в лицо %actor.rname%
    mdamage %char% 100
  end
done
~
#67804
Прыгаем через пропасть~
2 c 100
прыгнуть~
if !%arg.contains(пропасть)% 
  wsend %actor% _Куда это Вы прыгнуть собрались!?
  return 0
  halt 
end
wsend %actor% _Разбежавшись и как следует оттокнувшись вы прыгнули через пропасть.
wechoaround %actor% _%actor.name% перепрыгнул%actor.g% через пропасть.
wteleport %actor% 67855
wsend %actor% _Вы перепрыгнули через пропасть.
wechoaround %actor% _Кто-то прыгнул сюда. 
end
~
#67805
Через пропасть обратно~
2 c 100
прыгнуть~
if !%arg.contains(пропасть)% 
  wsend %actor% _Куда это Вы прыгнуть собрались!?
  return 0
  halt 
end
wsend %actor%  Разбежавшись и как следует оттолкнувшись Вы прыгнули через пропасть.
wechoaround %actor% _%actor.name% перепрыгнул%actor.g% через пропасть.
wteleport %actor% 67853
wsend %actor% _Вы перепрыгнули через пропасть.
wechoaround %actor% _Кто-то прыгнул сюда. 
end
~
#67806
Откалываем кусок льда~
2 c 100
отколоть~
if  !%arg.contains(кусок)%
  wsend %actor% _Что вы хотите отколоть?!
  halt
end                                              
wechoaround %actor% _%actor.iname% ударил%actor.g% по одному из кусков льда, отколов его.
wsend %actor% _Вы откололи один кусок льда.
wload obj 67825
~
$~
