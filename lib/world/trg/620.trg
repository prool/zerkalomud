#62000
у охранников (реакция на попытки напасть)~
0 p 100
*~
*if (%cmd.mudcommand% == ударить) || (%cmd.mudcommand% == убить) 
*   (%cmd.mudcommand% == атаковать) || (%cmd.mudcommand% == молот) 
*   (%cmd.mudcommand% == оглушить) || (%cmd.mudcommand% == заколоть) 
*   (%cmd.mudcommand% == пнуть) || (%cmd.mudcommand% == метнуть) 
*   (%cmd.mudcommand% == обезоружить) || (%cmd.mudcommand% == подножка) 
*   (%cmd.mudcommand% == kill ) || (%cmd.mudcommand% == backstab ) 
*   (%cmd.mudcommand% == kick ) || (%cmd.mudcommand% == bash ) 
*   (%cmd.mudcommand% == murder )
*return 1
* какой дибил сделал такое длинное условие?? крешает, переделал
* тип триггера с act на damage если считаете что не прав исправьте
msend %damager%  Едва только Вы схватились за оружие, как охранник кинулся на Вас и схватили за бока.
msend %damager% _Охранник выставил Вас за дверь при помощи хорошего пинка пониже спины. 
mechoaround %damager% _%damager.name% попытал%damager.u% схватит%damager.u% за оружие.
mechoaround %damager% Охранник выставил %damager.vname% за порог, сопроводив это действо мощным пинком. 
if (%damager.hitp% > 100)
  mdamage %damager% 100
else
  mdamage %damager% %damager.hitp%
end
mteleport %damager% 62022
%damager.position(6)%
%damager.wait(6)%
mechoaround %damager% _%damager.name% вылетел%damager.g% из дверей лавки златокузнеца и плюхну%damager.u% в грязную лужу.
return 1
~
#62001
у старого волхва~
0 c 0
пожертвовать~
if (%actor.vnum% != -1)
  halt
end
if (%actor.religion% == 1)
  emot что-то недовольно пробурчал и отвернулся
  halt
end
msend %actor% _Вы принесли жертву Богам.
mechoaround %actor% %actor.name% принес%actor.q% жертву богам.
say Да услышат тебя Боги, и да будет тебе удача...
согл
dg_cast 'доблесть' %actor.name% 
~
#62002
у архиерея~
0 c 0
помолиться~
if (%actor.vnum% != -1)
  halt
end
if (%actor.religion% == 0)
  морщ
  emot отвернулся и принялся крестится
  halt
end
msend %actor% _Вы вознесли молитву.
mechoaround %actor%  %actor.name% вознес%actor.q% молитву.
say Да услышит Господь твою молитву...
кив
dg_cast 'защита от тьм' %actor.name% 
~
#62003
вход к распорядителю~
0 q 70
~
wait 1
if (%direction% == south)                    
  mecho Распорядитель турниров сказал: "Поздрову! 
  mecho - Я здесь слежу за порядком на ристалище, да воев молодых обучаю."
  emot внимательно присмотрелся к Вам
  mecho Распорядитель турниров сказал: "Возможно, ты сможешь оказаться достойным противником...
  mecho - Хочешь с моими воспитанниками сразиться? Да? Тогда назови - с кем биться желаешь. 
  mecho - Или же со своими товарищами хочешь силушкой померяться?
  mecho - Коли так - плати 100 кун, ристалище-то в порядке держать - тоже деньги потребны..."
else
  wait 30s 
  close ворота
  lock ворота
end
~
#62004
проверка - есть ли кто на арене~
2 z 0
~
eval char %random.pc%
if %char%
  global char
  remote char %world.mob(62012)%
  rdelete char %self.id%
end
~
#62005
дали деньги распорядителю~
0 m 1
~
rdelete char %self.id%
if %amount% < 100
  say За такие деньги иди в кабаке кулаки чеши!
  хох
  halt
end
exec 62004 %world.room(62012)%
exec 62004 %world.room(62013)%
exec 62004 %world.room(62010)%
exec 62004 %world.room(62008)%
wait 2s
if %char%
  say Совсем забыл, на ристалище-то уже бой идет...
  say Придется Вам погодить малость.
  give %amount% кун %actor.name%
  halt
end
exec 62013 %world.room(62012)%
exec 62013 %world.room(62013)%
exec 62013 %world.room(62010)%
exec 62013 %world.room(62008)%    
mload obj 62016
дать ключ %actor.name%
wait 40s
~
#62006
у городских стражников~
0 k 60
~
if (%actor.vnum% == -1)
  set target %actor%
else
  set target %actor.leader%
end
if (!%target% || (%target.clan% == тв) || (%target.vnum% != -1))
  halt
end
if ((%actor.vnum% != -1) || (%actor.hitp% < 160))
  mechoaround %target% _%target.name% потерял%actor.g% сознание от сильнейшего удара.
  mechoaround %target% _Стражники уволокли бесчувственное тело в городской поруб.
  msend %target%  Вы потеряли сознание от сильнейшего удара городского стражника. 
  mteleport %target% 62060
  %actor.position(6)%
  %actor.wait(4)%
  msend %target%  Вы очнулись в каком-то подземелье.
  eval buffer %target.loadroom(62060)%
end
~
#62007
сказали "да" у смотрителя~
0 d 0
да ифодий алигур оргас лидий боец зверь~
rdelete char %self.id%
exec 62004 %world.room(62012)%
exec 62004 %world.room(62013)%
exec 62004 %world.room(62010)%
exec 62004 %world.room(62008)%
wait 1s
if %char%
  say Совсем забыл, на ристалище-то уже бой идет...
  say Придется вам погодить малость.
  halt
end
eval enemy %speech%
global enemy
remote enemy %world.room(62008)%
switch %speech%
  case да
    mecho Распорядитель турниров сказал: "Славненько...
    mecho - Итак:
    mecho - За 250 кун можешь ты сразится с молодым Ифодием-богатырем.
    mecho - За 500 - встретишься с витязем справным - Алигуром
    mecho - За 700 - позову сюда двоих сразу - Оргаса и Трекуна
    mecho - За 900 - с троими сразишься Лидием, Лутошей и Феклием
    mecho - Гостит сейчас в детинце знатный кулачный боец из земли ромейской.
    mecho - За 1200 кун согласится он, верно, с тобой силою померятся.
    mecho - Ну а за 2000 прикажу я выпустить на ристалище зверя невиданного, в лесах дремучих пойманного."
    wait 3
    say Скажи - с кем биться желаешь?
    halt
  break
  case ифодий
    if (%actor.gold% < 250)
      say В долг не верю, не обессудь.
      halt
    end
    %actor.gold(-250)%
  break 
  case алигур
    if (%actor.gold% < 500)
      say В долг не верю, не обессудь.
      halt
    end
    %actor.gold(-500)%
  break
  case оргас
    if (%actor.gold% < 700)
      say В долг не верю, не обессудь.
      halt
    end
    %actor.gold(-700)%
  break
  case  лидий
    if (%actor.gold% < 900)
      say В долг не верю, не обессудь.
      halt
    end
    %actor.gold(-900)%
  break
  case  боец
    if (%actor.gold% < 1200)
      say В долг не верю, не обессудь.
      halt
    end
    %actor.gold(-1200)%
  break
  case  зверь
    if (%actor.gold% < 2000)
      say В долг не верю, не обессудь.
      halt
    end
    %actor.gold(-2000)%
  break 
  default
    say Хм... нет у меня таких-то... 
    halt
  done
  emot шепнул что-то отроку и тот быстро куда-то убежал
  exec 62013 %world.room(62012)%
  exec 62013 %world.room(62013)%
  exec 62013 %world.room(62010)%
  exec 62013 %world.room(62008)%
  wait 3
  say Отлично... все готово - можешь идти на ристалище.
  mload obj 62016
  дать ключ %actor.name%
  run 62014 %world.room(62008)%
~
#62008
убили тюремщика~
0 f 100
~
mload obj 62017
~
#62009
у городских стражников ╧2~
0 q 100
~
if (%actor.clan% == тв)
  if (%random.3% == 2)
    msend %actor% %self.name% вытянулся перед Вами и отсалютовал оружием.
    mechoaround %actor%  %self.name% вытянулся перед %actor.tname% и отсалютовал оружием.
    покл %actor.name%
  end
else
  if %random.5% == 2
    msend %actor% _%self.name% хмуро оглядел Вас с ног до головы 
    mechoaround %actor%  _%self.name% хмуро оглядел %actor.vname% с ног до головы.
  end
  if %actor.level% > 24
    if (%actor.vname% == %char1%) || (%actor.vname% == %char2%) || (%actor.vname% == %char3%) || (%actor.vname% == %char4%) || (%actor.vname% == %char5%)
      halt
    end
    eval num %num%+1
    global num
    switch %num%
      case 1
        eval char1 %actor.vname%
        global char1
      break
      case 2
        eval char2 %actor.vname%
        global char2
      break
      case 3
        eval char3 %actor.vname%
        global char3
      break
      case 4
        eval char4 %actor.vname%
        global char4
      break
      default
        eval char5 %actor.vname%
        global char5
        eval num 0
        global num
      done
    end
  end
~
#62010
загрузочный у стражников~
0 n 0
~
eval num 0
global num
~
#62011
докладывают стражники~
0 d 0
доложись~
if (%actor.clan% != тв)
  msend %actor% _%self.name% презрительно взглянул на Вас
  mechoaround %actor% _%self.name% презрительно посмотрел на %actor.vname%
  морщ
  вмаз %actor.name%
  eval damage %actor.hitp%/10
  mdamage %actor% %damage%
  halt
end
emot вытянулся по стойке смирно
mechoaround %actor% _%self.name% что-то сказал %actor.dname%.
msend %actor% _%self.name% доложил:
msend %actor% Я видел в городе следующих подозрительных типов:
if %char1%
  msend %actor% %char1%
end
if %char2%
  msend %actor% %char2%
end
if %char3%
  msend %actor% %char3%
end
if %char4%
  msend %actor% %char4%
end
if %char5%
  msend %actor% и еще %char5%.
end
~
#62012
у городских стражников ╧2 - (ночь)~
0 g 100
~
if (%actor.vnum% == 62033) || (%actor.vnum% == 62032)
  if (%random.3% == 2)
    kill %actor.name%
  end
  halt
end
if (%actor.vnum% != -1)
  halt
end
if (%actor.clan% == морское.братство)
  if (%random.char.3% == 2)
    msend %actor% %self.name% вытянулся перед Вами и отсалютовал оружием.
    mechoaround %actor% %self.name% вытянулся перед %actor.tname% и отсалютовал оружием.
    покл %actor.name%
  end
else
  if %random.5% == 2
    msend %actor% _%self.name% хмуро оглядел Вас с ног до головы
    mechoaround %actor% _%self.name% хмуро оглядел %actor.vname% с ног до головы.
  end
  if %actor.level% > 24
    if (%actor.vname% == %char1%) || (%actor.vname% == %char2%) || (%actor.vname% == %char3%) || (%actor.vname% == %char4%) || (%actor.vname% == %char5%)
      halt
    end
    eval num %num%+1
    global num
    switch %num%
      case 1
        eval char1 %actor.vname%
        global char1
      break
      case 2
        eval char2 %actor.vname%
        global char2
      break
      case 3
        eval char3 %actor.vname%
        global char3
      break
      case 4
        eval char4 %actor.vname%
        global char4
      break
      default
        eval char5 %actor.vname%
        global char5
        eval num 0
        global num
      done
    end
  end
~
#62013
удаляем мобов с ристалища~
2 z 0
~
foreach victim %self.npc%
  wpurge %victim%
done
~
#62014
загрузка моба-поединщика~
2 z 0
~
switch %enemy%
  case ифодий
    wload mob 62042
  break
  case алигур
    wload mob 62043
  break
  case оргас
    wload mob 62045
    wload mob 62044
  break
  case лидий
    wload mob 62047
    wload mob 62046
    wload mob 62048
  break
  case боец
    wload mob 62056
  break
  case зверь
    wload mob 62049
  break
  default
    halt
  done
~
#62015
поет скоморошка~
0 m 50
~
wait 5
eval victim %random.pc%
if %victim% == %actor%
  улы %actor.name%
  emot запела: 
else
  emot взглянула на %victim.name% и запела:
end
wait 2s
eval sing %random.9%
if %sing% > 8
  mecho _Ехала деревня мимо мужика.
  mecho _Вдруг из-под собаки лают ворота.
  mecho _Выбегает палка с мальчиком в руке.
  mecho _Больно бьет собака палку по спине.
  mecho _Тпру! - сказала лошадь, а мужик заржал.
  mecho  Лошадь пошла в гости - а мужик стоял,
  mecho _Лошадь ела шаньги, а мужик - овес,
  mecho _Лошадь села в сани, а мужик повез.
elseif %sing% > 7
  mecho _Тут нашелся удалой молодец,
  mecho _Нарядился серой козонькой.
  mecho _И пошла коза по улице гулять,
  mecho _Она стукнула копытом о бревно.
  mecho _Кабы эта сера козонька
  mecho _Ко мне, младе на тесовую кровать!
elseif %sing% > 6
  mecho _Поповы ребята горох молотили,
  mecho _Цепы поломали, в овин побросали.
  mecho _Косой загляделся - овин загорелся.
  mecho _Поп испугался, домой отправлялся.
  mecho _Попадья - с печки, дьякон - из-под лавки.
  mecho _Кочет с полицы поломал косицы.
elseif %sing% > 5
  mecho _Кто богат да скуп: пива не варит,
  mecho _Нас, молодцев, не кормит, не поит,
  mecho _Тому бог даст кошачье вздыханье,
  mecho _Собачье взрыданье.
  mecho _Небогатому да тароватому
  mecho _Кто пиво варит, нас, молодцев поит,
  mecho _Даст бог на поле приплод,
  mecho _На гумне примолот,
  mecho _В квашне спорину,
  mecho _На столе сдвижину.
elseif %sing% > 4
  mecho _Что вы, девки, губы жмете -
  mecho _Иль ребят хороших ждете?
  mecho _К вам хороши не придут,
  mecho _И плохие все уйдут.
elseif %sing% > 3
  mecho _Тысятский-то наш воевода!
  mecho _Как поехал он воевати
  mecho _Среди печи, на лопате
  mecho _(С печи он на полати
  mecho _На хлебной он на лопате)
  mecho _Со большим братом - со ухватом,
  mecho _Со сестрою он - кочергою,
  mecho _Кабы кошки не поспели,
  mecho _Так его бы мыши съели.
elseif %sing% > 2
  mecho _...А еще на том почестном пиру
  mecho _Жена мужу говорит таковы слова:
  mecho _Все люди сидят, будто свечки горят.
  mecho _Мой-то муж на покрасу сел,
  mecho _Бороду закусит, ус разлощит,
  mecho _Ус разлощит, глаза вытаращит,
  mecho _Глядит на меня, будто черт на попа,
  mecho _А я на него помилее того.
elseif %sing% > 1
  mecho _У большого боярина
  mecho _У Петра-та Семеновича
  mecho _Голова - как у мерина,
  mecho _Она нечесана, не глажена...
  mecho _Девки, сходим по борону
  mecho _Расчесать ему голову, -
  mecho _У малого боярина нет бороды!
  mecho _Надо нарастить из черной пиз.ы.
  mecho _Девки подружки пойдем на лужок,
  mecho _Вырвем у каждой один волосок.
  mecho _Сложимся вместе по волосу,
  mecho Приростим ему бороду.
  wait 2
  краснеть
else
  mecho _Ах, никто, братцы, про хмелюшку не знает,
  mecho _Дагде-то я, хмель зародился в чистом поле,
  mecho _В чистом поле зародился, в косогоре.
  mecho _Как проведал про меня да огородник,
  mecho _Он и выкопал хмелевое коренье,
  mecho _Перенес мое коренье во деревню;
  mecho _Посадил меня мужик в огороде,
  mecho _обложил меня мужик черной грязью,
  mecho _Еще той ли щепою, перегноем.
  mecho _Вот и тут-то мне хмелюшке тошно,
  mecho _Веселой моей головке тяжеленько!
  wait 4s
  mecho _Да однако ж я, хмель, догадался:
  mecho _За сырую я за землю принимался,
  mecho _По тычиночкам вверх я взвивался;
  mecho _Как в заутре у нас, братцы, торжина,
  mecho _Уж как все люди пива заварили,-
  mecho _Вот и ходит мужик по огороду,
  mecho _А в рука носит вострый он ножик:
  mecho _Он обрезал мои скоры ноги,
  mecho _Опустил мои хмелевые все шишки;
  mecho Перенес меня мужик в черну избу,
  mecho _Посадил меня мужик на полати;
  mecho _Он коптил меня, мужик, трои сутки.
  mecho _Вот тут-то мне, хмелюшке, тошно,
  mecho _Веселой моей головке тяжеленько!
  wait 4s
  mecho _Посадил меня мужик в водочанец,
  mecho _Обливал меня мужик сладким суслом:
  mecho _Вот тут-то мне, хмелюшке, любо,
  mecho _Веселой моей головке веселенько!
  mecho _Я за сладкое сусло принимался.
  mecho _По дубовым по бочкам разливался.
  mecho _Как напился мужик пива допьяна,
  mecho _Вот уж тут-то я над ним насмеялся:
  mecho _Я ударил его в тын головою,
  mecho _Я просунул его в грязь бородою.
end 
wait 1s
emot закончила петь и поклонилась
say вот и песне конец, кто же слушал молодец
say Добры люди - не скупы будте
say Пожалуйте за пенье, сколько вам в терпенье.
~
#62016
убили скоморошку~
0 l 30
~
makeuid killer %actor.id%
if ( %actor.vnum% != -1 )
  makeuid killer %actor.leader%
end
if (%killer.sex% == 1)
  mshou _Помогите! Убивает меня злодей-душегуб - %killer.name%. Спаси...
elseif (%killer.sex% == 2)
  mshou  Помогите! Убивает меня злодейка - %killer.name%. Спаси...
else
  mshou _Помоги....
end
mdamage %self% %self.hitp%
~
#62017
ночные стражники рипают ворье~
0 s 45
~
wait 1
foreach victim %self.npc%
  if (%victim.vnum% == 62033) || (%victim.vnum% == 62032)
    kill %victim.name%
    halt
  end
done
~
#62018
дали грамоту боярину~
0 j 100
~
wait 1
if !(%object.vnum% == 62045)
  say Это мне зачем?
  drop %object.name%
  halt
end
wait 3
emot недовольно поднял взор
emot внимательно просмотрел грамоту и поскреб ногтем печать
emot что-то недовольно пробурчал
wait 1s
say Ну что ж... Все честь по чести. Держи
mload obj 62046
give ключ %actor.name%
mpurge %object%
~
#62019
оброк~
0 c 0
оброк~
say Тебя, видно, сам князь прислал?
wait 1s
клан %actor.name%
eval obrok %self.gold%
give %obrok% кун %actor.name% 
вздох
~
#62020
слухи у корчамря~
0 m 50
~
eval sluh %random.12%                                         
msend %actor% Корчмарь сказал Вам:
if (%sluh% > 11 )
  msend %actor% - Давеча у старого Рамоха на дворе была потеха - возчики с торгового обоза подгулявши полезли служанкам подолы драть.
  msend %actor% - Рамох-то им бока и обломал вместе с работниками своими.
  msend %actor% - Сидят теперь они в порубе, ждут пока кто виру за них уплатит - свой-то заработок почитай весь в корчмах спустили.
  halt
elseif (%sluh% > 10 )
  msend %actor% - Купец ромейский на прошлой седьмице в кости продулся, всю казну спустил, да еще и должен остался.
  msend %actor% - Говорят, продал нескольких холопов-гребцов, они в корабельных сараях на пристанях сидят, торга ждут.
  msend %actor% - Небось рады - всяко лучше будет, чем у ромеев на весле.
  halt
elseif (%sluh% > 9 )
  msend %actor% - Коваль наш, Лемша, мастер наипервейший.
  msend %actor% - Коли нужно чего по оружейной части - так это к нему.
  halt
elseif (%sluh% > 8 )
  msend %actor% - Финн старик - странный мужик... Пива не пьет, на праздники не выходит.
  msend %actor% - Да и народ к нему в лавку странный шастает.
  msend %actor% - Да еще и торгует не разбери чем - склянки какие-то, зелья...
  halt
elseif (%sluh% > 7 )
  msend %actor% - Волхв наш городской с архиереем едва не на ножах.
  msend %actor% - На дух друг друга не переносит.
  msend %actor% - Архиерей как выпьет - волынку заводит - извести, мол, идолов потребно.
  msend %actor% - А волхв давеча приказал какого-то служку, сдуру в святилище забредшего да
  msend %actor%  под дуб священный по пьяному делу струю пустившего в смоле и перьях
  msend %actor% _вывалять да на борове по городу прокатить.
  halt
elseif (%sluh% > 6 )
  msend %actor% - Купец Надол уехал опять за товаром.
  msend %actor% - Дом его пуст стоит - вся челядь по городским корчмам засела.
  msend %actor% - Только псы и остались сторожить... да и что сторожить? Ключницу пустую?
  хох
  msend %actor% - Деньги-то купец, не будь дурак, у золотых дел мастера держит.
  halt
elseif (%sluh% > 5 )
  msend %actor% - Стража городская - народ сурьезный.
  msend %actor% - Только над собою и чтут - что дружинных с боярами.
  msend %actor% - А простому люду чуть что не так - так и в глаз получить недолго.
  halt
elseif (%sluh% > 4 )
  msend %actor% - Говорят Марика-скоморошка опять в городе.
  msend %actor% - Бродит - песни поет.
  msend %actor% - За иные из тех песенок воевода наш уже сулился вожжами ее отходить.
  msend %actor% - Небось охолохнет, пень бородатый, - и не таким она от ворот поворот давала.
  смея 
  halt
elseif (%sluh% > 3 )
  msend %actor% - Неспокойно в городе...
  вздох                                                                      
  msend %actor% - Ворье по ночам по улицам шастает - не приведи Перун, в дом влезут.
  msend %actor% - И то еще ладно если ограбят, а то ведь и живота решить могут.
  msend %actor% - Так что стражникам нынче покою нет.
  halt
elseif (%sluh% > 2 )
  msend %actor% - Недавно кметь какой-то урманский, пришлый, напившись начал на торговой площади буянить.
  msend %actor% - Ну стражники и его в поруб упекли - там таким самое место.
  halt
elseif (%sluh% > 1 )
  msend %actor% - Говорят, какой-то ворюга в городе завелся!
  msend %actor% - Делает ключи от дверей да ключниц, даже от городского поруба, сказывают, ключ у него есть.
  halt
else
  msend %actor% - Вои дружинные давеча по пьянке изловили в лесу незнамо какую зверюгу...
  msend %actor% - Говорят, на ристалище ее выпустить хотят, душу потешить.
  msend %actor% - Не знаю уж, что за потеха получится - и как ревет-то, послушать страшно, а уж увидеть - Боги не приведи... 
end
~
#62021
загрузка у поединщиков ╧1~
0 n 100
~
wait 2
follow волшебник
~
#62022
загрузка у поединщиков ╧2~
0 n 100
~
wait 2
follow колдун
~
#62023
ревет зверь~
0 k 20
~
emot заревел страшным ревом
mecho _У вас поджилки затряслись от ужаса.
foreach target %self.pc%
  if (%random.3% != 2) 
    dg_cast 'страх' %target.name%
  end
done
~
#62024
боевой у кулачного бойца~
0 k 22
~
switch %random.3%
  case 3
    eval victim %random.char%
    msend %victim%  Ромейский боец нанес вам несколько быстрых ударов и БОЛЬНО хлестнул по горлу!
    mechoaround %victim% _Точный удар ромейского бойца оглушил %victim.vname%!
    dg_cast 'глух' %victim.name%
    dg_cast 'слеп' %victim.name%
    dg_cast 'молч' %victim.name%
  break
  case 4
    eval victim %random.char%
    mecho _Фемистоклис нанес %victim.dname% удар, от которого бедняга отлетел%victim.g% куда-то в сторону.
    mechoaround %victim% _Вы отлетели куда-то в сторону от могучего удара бойца Фемистоклиса.
    switch %random.4%
      case 1
        eval room 62012
      break
      case 2
        eval room 62008
      break
      case 3
        eval room 62013
      break
      case 4
        eval room 62010
      break
    done 
    %victim.wait(10)% 
    *mteleport %victim% %room%
  break
  case 5
    * mass trip
    mecho _Внезапно боец Фемистоклис быстро крутанулся на месте, новровя зацепить Вас по ногам.
    foreach victim %self.char%
      if (%random.3% == 2)
        mecho _Боец Фемистоклис ловко подсек %victim.name%, уронив на землю.
        mechoaround %victim% _Боец Фемистоклис ловко подсек Вас и вы рухнули на землю!
        %victim.position(6)%
        %victim.wait(2)%
      end
    done
  done
~
#62025
дали кольцо купцу~
0 j 100
~
wait 1
if !(%object.vnum% == 62062)
  say Не понимайт.. Зачим ты мне это дал?
  drop %object.name%
  halt
end
wait 1
mpurge %object%
wait 3
рад
say О! Это исть карашо.. я боялися, совсем пропало...
if %world.curobjs(62039)% < 4
  emot снял с себя кафтан
  mload obj 62039
  give кафтан %actor.name%
else
  msend %actor% дал Вам несколько стариных заморских монет.... - и что теперь с энтим богатством делать?
  mechoaround %actor% Заморский купец дал пригоршню монет %actor.dname%.
end
say Возьмите. Это в подарок.. это кольцо есть очен дорого мене, понимайт?
~
#62026
ударили в колокол~
2 cz 0
дернуть~
if !%arg.contains(било)% && !%arg.contains(веревк)% 
  wsend %actor% _Что вы хотите дернуть?
  halt
end
wsend %actor% _Вы ударили в вечевое било. 
wechoaround %actor% _%actor.name% дернул%actor.g% за веревку вечевого била.
wzoneecho 62027 &Y БАММ !!! - прокатился удар вечевого колокола. &n
~
#62027
Помер зверь~
0 f 100
~
mload obj 50058
~
#62028
Скоморошка фликает от Илерия~
0 q 100
~
wait 1
if %actor.name% == Илерий
  крест .Илерий
  switch %random.4%
    case 4
      n
      flee
      n
      e
      e
      m
      w
    break
    case 3
      e
      e
      flee
      n
      n
      w
      w
    break
    case 2
      flee
      s
      s
      w
      w
      flee
      s
      s
      e
    break
    case 1
      w
      w
      n
      n
      w
      w
      s
    break
  done
  кричать Спасите! Душегуб Илерий по душу мою явился!!
end
flee
~
#62029
Загрузочный у мастера~
0 n 100
~
eval skinok 0
eval goldok 0
eval kost 0
global skinok
global goldok
global kost
~
#62030
Торговец скупает диковинки~
0 j 100
~
wait 1
switch %object.vnum%
  case 95440
    case 95445
      case 95413
        case 95417
          case 95418
            case 95419
              case 95429
                case 95433
                  case 95434
                    wait 1
                    mpurge %object%
                    say Хм... Интересная вещь.
                    mecho _- Пожалуй, я сумею найти ей применение... Хотя это будет непросто.
                    mecho _- Как бы тебя отблагодарить?
                  break
                  default
                    дум
                    say Нет, это мне не нужно.
                    give all %actor.name%
                    halt
                  done
                  switch %random.12%
                    case 1
                      eval chanse %world.curobjs(95430)%+15
                      if (( %random.19% > %chanse% ) || ( %random.100% == 53 ))
                        mload obj 95430
                      else
                        eval bonus 100+%random.300%
                        %self.gold(+%bonus%)%
                        give %bonus% кун .%actor.name%
                      end
                    break
                    case 2
                      eval chanse %world.curobjs(95441)%+15
                      if (( %random.19% > %chanse% ) || ( %random.100% == 53 ))
                        mload obj 95441
                      else
                        eval bonus 100+%random.300%
                        %self.gold(+%bonus%)%
                        give %bonus% кун .%actor.name%
                      end
                    break
                    case 3
                      eval chanse %world.curobjs(95406)%+15
                      if (( %random.18% > %chanse% ) || ( %random.100% == 53 ))
                        mload obj 95406
                      else
                        eval bonus 100+%random.300%
                        %self.gold(+%bonus%)%
                        give %bonus% кун .%actor.name%
                      end
                    break
                    case 4
                      eval chanse %world.curobjs(95407)%+15
                      if (( %random.18% > %chanse% ) || ( %random.100% == 53 ))
                        mload obj 95407
                      else
                        eval bonus 100+%random.300%
                        %self.gold(+%bonus%)%
                        give %bonus% кун .%actor.name%
                      end
                    break
                    case 5
                      eval chanse %world.curobjs(95443)%+15
                      if (( %random.20% > %chanse% ) || ( %random.100% == 53 ))
                        mload obj 95443
                      else
                        eval bonus 100+%random.300%
                        %self.gold(+%bonus%)%
                        give %bonus% кун .%actor.name%
                      end
                    break
                    case 6
                      eval chanse %world.curobjs(95450)%+10
                      if (( %random.15% > %chanse% ) || ( %random.100% == 53 ))
                        mload obj 95450
                      else
                        eval bonus 100+%random.300%
                        %self.gold(+%bonus%)%
                        give %bonus% кун .%actor.name%
                      end
                    break
                    case 7
                      eval chanse %world.curobjs(95452)%+15
                      if (( %random.19% > %chanse% ) || ( %random.100% == 53 ))
                        mload obj 95452
                      else
                        eval bonus 100+%random.300%
                        %self.gold(+%bonus%)%
                        give %bonus% кун .%actor.name%
                      end
                    break
                    case 8
                      eval chanse %world.curobjs(95453)%+15
                      if (( %random.20% > %chanse% ) || ( %random.100% == 53 ))
                        mload obj 95453
                      else
                        eval bonus 100+%random.300%
                        %self.gold(+%bonus%)%
                        give %bonus% кун .%actor.name%
                      end
                    break
                    case 9
                      eval chanse %world.curobjs(95454)%+15
                      if (( %random.18% > %chanse% ) || ( %random.100% == 53 ))
                        mload obj 95454
                      else
                        eval bonus 100+%random.300%
                        %self.gold(+%bonus%)%
                        give %bonus% кун .%actor.name%
                      end
                    break
                    case 10
                      eval chanse %world.curobjs(95402)%+25
                      if (( %random.30% > %chanse% ) || ( %random.100% == 53 ))
                        mload obj 95402
                      else
                        eval bonus 100+%random.300%
                        %self.gold(+%bonus%)%
                        give %bonus% кун .%actor.name%
                      end
                    break
                    case 11
                      eval chanse %world.curobjs(95403)%+15
                      if (( %random.19% > %chanse% ) || ( %random.100% == 53 ))
                        mload obj 95403
                      else
                        eval bonus 100+%random.300%
                        %self.gold(+%bonus%)%
                        give %bonus% кун .%actor.name%
                      end
                    break
                    case 12
                      eval chanse %world.curobjs(95486)%+15
                      if (( %random.19% > %chanse% ) || ( %random.100% == 53 ))
                        mload obj 95486
                      else
                        eval bonus 100+%random.300%
                        %self.gold(+%bonus%)%
                        give %bonus% кун .%actor.name%
                      end
                    break
                  done
                  wait 1s
                  кив
                  say Думаю, это достойная награда.
                  give all .%actor.name%
~
#62031
Оплата работы скорняка~
0 m 1
~
wait 1
if !%kost%
  дум
  wait 1s
  say Мы с тобой ни о какой работе не договорились, так за что же ты платишь?
  say Нет, это не по мне - вот будет работа, тогда и о деньгах речь пойдет.
  give %amount% кун %actor.name%
  halt
end
emot пересчитал монеты
wait 1s
if %amount% != %kost%
  say Нет уж, я своему слову хозяин.
  say Ровно %kost% кун - не больше, не меньше.
  halt
end
eval goldok 1
global goldok
say Хорошо, давай сюда свой материал.
~
#62032
Скорняк делает предметы~
0 j 100
~
wait 1
*тут надо поставить отшивалку если дают левый предмет
switch %object.vnum%
  case 95416
    case 95415
      case 95423
        case 95421
          case 95426
            case 95469
              case 95444
              break
              default
                wait 1s
                say Думаю, из этого я ничего не смогу сделать.
                give all %actor.name%
                halt
              done
              *шкуру еще не давали - определяем цену и запоминаем
              if !%skinok%
                eval kost 200+%random.300%
                eval skinok %object.vnum%
                global kost
                global skinok
                eval goldok 0
                global goldok
                emot внимательно осмотрел %object.vname%
                wait 2s
                say Кхм.. да.
                say Стоящий материал. 
                say Я согласен попробовать поработать с ним.
                say Плата невысока - %kost% кун.
                give all %actor.name%
                halt
              end
              *шкуру дали верную, но деньги не вылачены
              if !%goldok%
                say Прощенья просим, но мне семью кормить надо, так что задарма ищи других работников.
                give all %actor.name%
                halt
              end
              *дали не ту шкуру
              if %object.vnum% != %skinok%
                wait 2s
                say У нас был договор о другом материале.
                say За этот и цена другая.
                *eval skinok 0
                *eval goldok 0
                *eval kost 0
                *global skinok
                *global goldok
                *global kost
                give all %actor.name%
                halt
              end
              wait 1
              set shkura %skinok%
              eval skinok 0
              global skinok
              mpurge %object%
              say Хорошо, приступим...
              emot взял шкуру, и передал подмастерьям
              mecho  Вскоре в мастерской закипела работа.
              eval pause 5+%random.5%
              wait %pause%s
              switch %shkura%
                case 95416
                  case 95415
                    eval chanse %world.curobjs(95427)%+8
                    if (( %random.13% > %chanse% ) || ( %random.1000% <= 10 ))
                      mload obj 95427
                      say Вот, кажется что-то получилось.
                      give all %actor.name%
                      rdelete goldok %self.id%
                      halt
                    end
                    eval chanse %world.curobjs(95432)%+8
                    if (( %random.15% > %chanse% ) || ( %random.1000% <= 10 ))
                      mload obj 95432
                      say Вот, кажется что-то получилось.
                      give all %actor.name%
                      rdelete goldok %self.id%
                      halt
                    end
                  break
                  case 95423
                    eval chanse %world.curobjs(95451)%+8
                    if (( %random.14% > %chanse% ) || ( %random.1000% <= 10 ))
                      mload obj 95451
                      say Вот, кажется что-то получилось.
                      give all %actor.name%
                      rdelete goldok %self.id%
                      halt
                    end
                    eval chanse %world.curobjs(95485)%+8
                    if (( %random.13% > %chanse% ) || ( %random.1000% <= 10 ))
                      mload obj 95485
                      say Вот, кажется что-то получилось.
                      give all %actor.name%
                      rdelete goldok %self.id%
                      halt
                    end
                    case 95421
                      eval chanse %world.curobjs(95409)%+8
                      if (( %random.13% > %chanse% ) || ( %random.1000% <= 10 ))
                        mload obj 95409
                        say Вот, кажется что-то получилось.
                        give all %actor.name%
                        rdelete goldok %self.id%
                        halt
                      end
                    break
                    case 95426
                      eval chanse %world.curobjs(95432)%+8
                      if (( %random.14% > %chanse% ) || ( %random.1000% <= 10 ))
                        mload obj 95432
                        say Вот, кажется что-то получилось.
                        give all %actor.name%
                        rdelete goldok %self.id%
                        halt
                      end
                      eval chanse %world.curobjs(95458)%+8
                      if (( %random.13% > %chanse% ) || ( %random.1000% <= 10 ))
                        mload obj 95458
                        say Вот, кажется что-то получилось.
                        give all %actor.name%
                        rdelete goldok %self.id%
                        halt
                      end
                    break
                    case 95469
                      case 95444
                        eval chanse %world.curobjs(95483)%+8
                        if (( %random.13% > %chanse% ) || ( %random.1000% <= 10 ))
                          mload obj 95483
                          say Вот, кажется что-то получилось.
                          give all %actor.name%
                          rdelete goldok %self.id%
                          halt
                        end
                        eval chanse %world.curobjs(95484)%+8
                        if (( %random.13% > %chanse% ) || ( %random.1000% <= 10 ))
                          mload obj 95484
                          say Вот, кажется что-то получилось.
                          give all %actor.name%
                          rdelete goldok %self.id%
                          halt
                        end
                      break
                      default
                      done
                      say Как видно, шкура была слишком сильно попорчена.
                      say Ничего путного не вышло...
                      say Я верну половину стоимости работы, остальное - в счет потраченного времени.
                      eval geld %kost%/2
                      give %geld% кун .%actor.name%
~
#62033
Вход к торговцу~
0 q 100
~
wait 1s
emot нетерпеливо потер руки
say Что же, если у Вас есть что-то интересное, давайте это рассмотрим.
say Если же нету, чего ради Вы тут топчетесь?
~
#62034
Платный портал~
0 m 1
~
wait 1
emot пересчитал%self.g% монеты
eval target 0
switch %amount%
  * Брянск
  case 4300
    eval target 66034
  break
  * Менск
  case 7900
    eval target 77007+%random.30%
  break
  * Галич
  case 5500
    eval target 34410
  break
  default
    дум
    say И чего же ты за эти деньги хочешь?
    give %amount% кун .%actor.name%
    halt
  done
  кив
  emot сделал%self.g% несколько странных жестов
  mechoaround %actor% %actor.name% исчез%actor.q% в клубах дыма.
  msend %actor% У вас закружилась голова, и на миг Вы потеряли сознание...
  msend %actor% 
  mteleport %actor% %target% horse
  mechoaround %actor% %actor.name% появил%actor.u% здесь в клубах дыма.
~
$~
