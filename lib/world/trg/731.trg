#73100
Вход к волхву~
0 q 100
~
wait 2s
emot внимательно взглянул на Вас из-под кустистых бровей
if (%actor.class% != 13 ) || (%actor.level% < 28 )
wait 3
emot усмехнулся в бороду и принялся помешивать в костре тонкой веточкой
wait 3s
say Зря ты сюда зашел...
mecho _- Это древнее место - странные силы дремлют тут... 
mecho _- Тем, кто не знаком им, лучше держаться подальше отсюда.
wait 2s
say А ты едва ли понимаешь язык рун, звезд и древних камней.
attach 73122 %self.id%
halt
end
emot едва заметно улыбнулся
wait 1s
say Как видно, не один я нашел путь сюда...
mecho _- Приветствую внимающего языку воды и огня, ветра и камня.
wait 2s
say Присаживайся...
say Хочешь услышать, что я узнал об этом месте?
attach 73121 %self.id%
~
#73101
В бою с каменным проклятием~
0 p 40
~
msend %damager% Вы не смогли причинить Вреда каменному проклятию!
mechoaround %damager% %damager.name% не смог%damager.g% причинить вреда каменному проклятию!
~
#73102
Вошли в круг огня~
2 c 1
шагнуть войти~
if !%arg.contains(огонь)% && !%arg.contains(пламя)%
wsend %actor% _Куда это Вы шагнуть собрались?
return 0
halt 
end
wait 1
wsend %actor% _Вы шагнули в круг огня!
wechoaround %actor% _%actor.name% шагнул%actor.q% в круг огня!
wteleport %actor% 73180
wsend %actor% _Вы прошли сквозь огонь, как сквозь врата!
wechoaround %actor% _Кто-то очутился рядом с Вами.
end
~
#73103
В бою с порывестым ветром~
0 k 70
~
*башим атакующего
eval target %random.pc%
msend %target% Порыв ветра призвал на помощь силы воздуха! 
mechoaround %target% Воздушная волна, призванная порывом ветра сбила с ног %actor.rname%!
mdamage %target% 50
%target.position(6)%
%target.wait(3)%
~
#73104
Через валун~
2 c 100
перепрыгнуть~
if !%arg.contains(валун)% 
wsend %actor% _Что это вы перепрыгнуть собрались!?
return 0
halt 
end
if %exist.mob(73101)%
wsend %actor% Вы попытались прыгнуть через валун, но резкий порыв ветра отбросил вас назад!
halt
end
wsend %actor% _Разбежавшись Вы прыгнули через валун.
wechoaround %actor% _%actor.name% прыгнул%actor.q% через валун.
wteleport %actor% 73114
wsend %actor% _Вы перепрыгнули валун и оказались на горной тропке.
wechoaround %actor%  Кто-то прыгнул сюда. 
end
~
#73105
Через валун(обратно)~
2 c 100
перепрыгнуть~
if !%arg.contains(валун)% 
wsend %actor% _Что это вы перепрыгнуть собрались!?
return 0
halt 
end
wsend %actor% _Разбежавшись Вы прыгнули через валун.
wechoaround %actor% _%actor.name% прыгнул%actor.q% через валун.
wteleport %actor% 73111
wsend %actor% _Вы перепрыгнули валун и оказались на горной тропке.
wechoaround %actor% _Кто-то прыгнул суда. 
end
~
#73106
По мостику над пропастью~
2 e 100
~
*если у чара ловкости меньше 23, падаем в дт
if %actor.dex% > 22
wait 1
wsend %actor% _Порыв ветра сильно покачнул мостик, какое чудо, что вы не сорвались!
else
wait 1
wsend %actor% _Порыв ветра стал раскачивать мостик!
wsend %actor% _Размахивая руками, вы полетили в бездонную пропасть!
wteleport all 73132
end
~
#73107
Привязываем мостик~
2 c 100
привязать~
*Убираем предыдущий триг, теперь по мосту все могут пройти.
if !%arg.contains(мостик)% 
wsend %actor% _Что это вы привязать собираетесь!?
return 0
halt 
end
wsend %actor% _Вы крепко привязали мостик, теперь он не будет так раскачиваться!
wechoaround %actor% _%actor.name% крепко привязал%actor.q% мостик.
wait 1s
calcuid forroom 73128 room
detach 73106 %forroom%
calcuid forroom 73129 room
detach 73106 %forroom%
calcuid forroom 73130 room
detach 73106 %forroom%
detach 73107 %self%
~
#73108
На облако~
2 c 100
прыгнуть~
if !%arg.contains(облако)% 
wsend %actor% _Что это вы прыгнуть собрались!?
return 0
halt 
end
wsend %actor% _Разбежавшись Вы прыгнули в неизвестность.
wechoaround %actor% _%actor.name% прыгнул%actor.q% на облако.
wteleport %actor% 73138
wsend %actor% _Вы перепрыгнули на облако.
wechoaround %actor%  _Кто-то прыгнул сюда. 
end
~
#73109
Обратно с облака~
2 c 100
прыгнуть~
if !%arg.contains(скала)% 
wsend %actor% _Что это вы прыгнуть собрались!?
return 0
halt 
end
wsend %actor% _Разбежавшись Вы прыгнули в неизвестность.
wechoaround %actor% _%actor.name% прыгнул%actor.q% с облака.
wteleport %actor% 73137
wsend %actor% _Вы перепрыгнули на горную вершину.
wechoaround %actor% _Кто-то прыгнул суда. 
end
~
#73110
Рекол витязя~
0 k 100
~
if %self.hitp% < 500
  mecho _Небесный витязь взял свиток возврата в левую руку.
  mecho _Небесный витязь зачитал свиток возврата.
  mecho _Небесный витязь исчез.
  mteleport %self% 73147
  detach 73110 %self.id%
dg_cast 'исцелен' %self.name%
end
~
#73111
Рекол лекаря~
0 k 100
~
if %self.hitp% < 750
  mecho _Небесный знахарь взял свиток возврата в левую руку.
  mecho _Небесный знахарь зачитал свиток возврата.
  mecho _Небесный знахарь исчез.
  mteleport %self% 73147
  detach 73111 %self.id%
dg_cast 'исцелен' %self.name%
end
~
#73112
Умер знахарь~
0 f 100
~
if %world.curobjs(73132)% < 50
mload obj 73132
mload obj 73132
mload obj 73132
end
~
#73113
Рекол дружа~
0 k 100
~
if %self.hitp% < 350
  mecho _Небесный воин взял свиток возврата в левую руку.
  mecho _Небесный воин зачитал свиток возврата.
  mecho _Небесный воин исчез.
  mteleport %self% 73147
  detach 73113 %self.id%
end
~
#73114
Рекол батыра~
0 k 100
~
if %self.hitp% < 550
  mecho _Могучий небесный воин взял свиток возврата в левую руку.
  mecho _Могучий небесный воин зачитал свиток возврата.
  mecho _Могучий небесный воин исчез.
  mteleport %self% 73147
  detach 73114 %self.id%
dg_cast 'исцелен' %self.name%
end
~
#73115
Рекол колда~
0 k 100
~
if %self.hitp% < 780
  mecho _Заклинатель небес взял свиток возврата в левую руку.
  mecho _Заклинатель небес зачитал свиток возврата.
  mecho _Заклинатель небес исчез.
  mteleport %self% 73147
  detach 73115 %self.id%
dg_cast 'исцелен' %self.name%
end
~
#73116
Прыгаем с облака~
2 c 100
прыгнуть~
if !%arg.contains(вниз)% 
wsend %actor% _Куда это Вы прыгнуть собрались!?
return 0
halt 
end
wsend %actor% _Перекрестившись и помолившись своим богам, вы прыгнули в неизвестность.
wechoaround %actor% _%actor.name% спрыгнул%actor.q% с облака в неизвестность.
wteleport %actor% 73153
wsend %actor% _Пролетев огромное растояние, вы упали сильно ударившись о камни!
wechoaround %actor% _Кто-то свалился рядом с вами!
  if %actor.hitp% > 10 
    %actor.hitp(10)%
  end
end
~
#73117
Триг для владыки небес~
0 k 40
~
mecho _Небесный владыка призвал на помощь силы воздуха!
mecho _Молния сверкнула в небесах!
foreach ch %self.char%
  if %random.2% == 1
    msend %ch% _В Вас попала молния!
    mechoaround %ch% _Молния накрыла %ch.rname%
    mdamage %ch% %random.150%
  end
done 
~
#73118
В бою с окаменевшим воином~
0 k 50
~
set char %random.pc%
msend %char% _Окаменевший воин с силой ударил по земле!
  %char.position(6)%
  %char.wait(4)%
mechoaround %char% _&WОкаменевший воин ударил по земле и земля вздыбилась под ногами %actor.rname%!&n
~
#73119
Умер владыка стихий~
0 f 100
~
if (%random.4% == 2) && (%world.curobjs(73192)% < 1)
mload obj 73192
end
~
#73120
Репоп~
2 f 100
~
calcuid deletetrig 73109 mob
detach 73110 %deletetrig.id% 
attach 73110 %deletetri.idg% 
calcuid deletetrig 73110 mob
detach 73111 %deletetrig.id%
attach 73111 %deletetrig.id%
wait 1
calcuid deletetrig 73111 mob
detach 73113 %deletetrig.id%
attach 73113 %deletetrig.id%
calcuid deletetrig 73112 mob
detach 73114 %deletetrig.id%
attach 73114 %deletetrig.id%
wait 1
calcuid deletetrig 73113 mob
detach 73115 %deletetrig.id%
attach 73115 %deletetrig.id%
calcuid deletetrig 73115 mob
detach 73117 %deletetrig.id%
attach 73117 %deletetrig.id%
wait 1
calcuid deletetrig 73116 mob
detach 73118 %deletetrig.id%
attach 73118 %deletetrig.id%
calcuid deletetrig 73125 mob
detach 73119 %deletetrig.id%
attach 73119 %deletetrig.id%
wait 1
calcuid fromid 73131 room
detach 73107 %fromid.id%
attach 73107 %fromid.id%
calcuid fromid 73128 room
detach 73106 %fromid.id%
attach 73106 %fromid.id%
wait 1
calcuid fromid 73129 room
detach 73106 %fromid.id%
attach 73106 %fromid.id%
calcuid fromid 73130 room
attach 73106 %fromid.id%
detach 73106 %fromid.id%
wait 1
calcuid druid 73129 mob
detach 73121 %druid.id%
detach 73122 %druid.id%
rdelete qoestor731 %druid.id%
~
#73121
Волхв сказал "да"~
0 d 1
да хочу согласен конечно~
wait 1
if ( %actor.class% != 13 || %actor.level% < 28 ) && (%actor.id% != %questor731.id%)
emot искоса взглянул на вас и снова уставился в огонь
halt
end
%actor.wait(10)%
wait 1s
emot улыбнулся и кивнул
wait 3s
say Это древнее капище...
mecho _- Даже древней оно, чем кажется. Оно старше этих дубов, старше деревянных городов.
mecho _- Старше даже многих рек из тех, что текут там - в степи...
mecho _- Но построили его наши предки.
emot наклонился и бросил в костер щепотку земли
wait 2s
say Своим богам они давали совсем не те имена что мы...
wait 2s
emot что то тихо прошептал и языки пламени костра неожиданно взвились и снова опали
say Но они знали, какое бы имя мы не дали Силе, создавшей этот мир
wait 4
emot сделал какой-то странный жест и порыв ветра пронесся между менгирами
say Сила все равно остается той же...
mecho __________________Тут вы заметили, что все окружающее
mecho ________________ тает в смутной мгле, а сам старый волхв
mecho ________словно растворяется на фоне медленных языков пламени костра.
wait 1s
mecho __Послышался глухой рокот, словно от бега могучего потока воды
say Ветер и огонь, земля и вода - то, из чего сотворен этот мир...
mecho _- Здесь сокрыты ключи к силе этих первооснов.. 
wait 2
say Здесь дремлют и сами эти силы
mecho ___________ \&C==== \&Wяркая вспышка ослепила вас и все вокруг исчезло \&C====\&n
foreach ch %self.pc%
if %ch.rentable%
mteleport %ch% 73105 horse
end
done
detach 73100 %self.id%
detach 73121 %self.id%
detach 73122 %self.id%
~
#73122
волхву дали руну~
0 j 100
~
wait 1
if %object.vnum% < 200
дум
drop all
halt
elseif (%object.vnum% > 221 ) && (%object.vnum% < 226 )
emot посмотрел на %object.vname%
wait 3
смех
дать рун .%actor.name%
say Забавная игрушка...
взд
emot подбросил в костер пару веток
halt
elseif (%object.vnum% > 200 ) && (%object.vnum% < 244 )
wait 1
emot посмотрел на %object.vname% и слегка улыбнулся
wait 1
mpurge %object%
wait 2s
say Как видно, и ты что-то понимаешь в языке рун...
wait 2s
mecho _- Хочешь услышать мой рассказ об этом месте?
emot указал взмахом руки на замершие вокруг менгиры
set questor731 %actor%
global questor731
attach 73121 %self.id%
detach 73122 %self.id%
~
#73123
rогненный поток~
0 k 20
~
set target %random.pc%
dg_cast 'огн поток' target
dg_cast 'огн поток' target
~
#73124
бой с владыкой стихий~
0 k 10
~
mecho Владыка стихий воздел руки и проревел заклинание!
switch %random.3%
case 1
mload mob 73126
break
case 2
mload mob 73127
break
case 3
mload mob 73128
break
done
~
#73125
смерть проклятия~
0 f 0
~
mecho &WКаменное проклятие рассыпалось осколками скалы, и из него выплеснулось белое пламя!&n
mload mob 73130
mload mob 73130
mload mob 73130
~
#73126
В бою с повелителем ветров.~
0 k 20
~
set target %random.pc%
mechoaround %actor% Повелитель ветров взмахнул рукой и бешеный вихрь снес %target.vname% в сторону!
msend %actor% Повелитель ветров взмахнул рукой и бешеный вихрь обрушился на вас!
mteleport %target% 73125
%target.wait(2)%
~
#73127
Батлетриг шаровой молнии~
0 k 20
~
set target %random.pc%
dg_cast 'цеп мол' %target.name%
dg_cast 'цеп мол' %target.name%
~
#73128
Батлтриг огненых шаров~
0 k 30
~
set target %random.pc%
dg_cast 'обж хват' .%target.name%
dg_cast 'обж хват' .%target.name%
dg_cast 'обж хват' .%target.name%
~
$~
