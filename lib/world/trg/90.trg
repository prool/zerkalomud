#9000
лезем на дерево~
2 c 1
лезть залезть влезть подняться~
if (!%arg.contains(дуб)% && !%arg.contains(дерево)%)
  wsend %actor% Куда это Вы полезли?
  halt
end
wechoaround %actor% %actor.name% полез%actor.q% на дуб.
wsend %actor% Вы влезли почти на самую верхушку дуба.
wteleport %actor% 9052
wechoaround %actor% Кто-то забрался на соседнюю ветку.
~
#9001
лезем в каморку~
2 c 1
лезть влезть залезть пролезть протиснуться втиснуться забраться карабкаться~
wait 1
if !(%arg.contains(вверх)%) 
  wsend %actor% Куда залезть-то хотите?
  halt
end
if !(%arg.contains(корн)%) 
  wsend %actor% И как это вы лезете? По голой стене?
  halt
end
if (%actor.dex% < 23)
  wsend %actor% Вы начали карабкаться по корням вверх.
  wsend %actor% Неожиданно опора под ногами пропала, а скользский корень вывернулся из рук.
  wsend %actor% Вы полетели вниз и больно шмякнулись мягким местом...
  %actor.position(6)%
  wsend %actor% Мда, чтобы туда взобраться, надо быть несколько половчей.
end
if (%actor.remort% > 3)
  wsend %actor% Да полно вам в детские игры играться...
  wsend %actor% Тоже выдумали - по стенкам лазать. Сходили бы, что ли, кузнецу помогли.
end
wechoaround %actor% %actor.name% нача%actor.q% карабкаться по корням. Интересно, куда?
wsend %actor% Взобравшись наверх, вы оказались в тесном отнорке пещеры.
wteleport %actor% 9046
wechoaround %actor% Кто-то забрался по корням сюда.
~
#9002
слезаем с дерева~
2 c 1
слезть спуститься~
wechoaround %actor% %actor.name% слез%actor.q% с дуба.
wsend %actor% Вы долго спускались по веткам, и наконец оказались на земле.
wteleport %actor% 9051
wechoaround %actor% Кто-то спрыгнул с нижних ветвей дуба.
~
#9003
прыгаем на крышу~
2 c 1
прыгнуть спрыгнуть слезть лезть~
if !(%arg.contains(крыш)%) 
  wsend %actor% Куда прыгаем? В никуда - опасно!
  halt
end
wechoaround %actor% %actor.name% с разбега прыгнул%actor.g% вниз. Интересно, не сломает ли себе шею?
wsend %actor% Сердце у Вас ушло в пятки, когда Вы поняли, что возможно промахнетесь мимо крыши.
wteleport %actor% 9053
wechoaround %actor% Кто-то спрыгнул сюда с верхней улицы. Рискованно...
~
#9004
слезаем с крыши~
2 c 0
лезть слезть спрыгнуть прыгнуть спуститься~
wechoaround %actor% %actor.name% осторожно спустил%actor.u% с крыши. Хорошо, хозяин не видит!
wsend %actor% Вы осторожно слезли с крыши дома.
wteleport %actor% 9035
wechoaround %actor% Кто-то спрыгнул с крыши.
~
#9005
подкормка нубов~
0 q 100
~
if %actor.level% >= 15 || (%actor.bank% >= 5000) 
  halt
end
wait 1
msend %actor% Кабатчик сказал Вам:
if %actor.sex% == 1
  msend %actor% - Такой молодой, %actor.name%, голодный, холодный, далеко от дома!
elseif
  %actor.sex% == 2
  msend %actor% - Такая молодая, %actor.name%, голодная, холодная, далеко от дома!
end
msend %actor% &K%self.name% жалостливо вздохнул и всплеснул руками.
msend %actor% - Сейчас, подожди, найду чем покормить...
dg_cast 'насыщение' %actor.name%
msend %actor% Отведав угощения, вы почувствовали приятную тяжесть в желудке.
~
#9006
мучаем первое гнездо~
2 c 0
ворошить разворошить разорить~
if !(%arg.contains(гнездо)
  wsend %actor% Что вы хотите разворошить?
  halt
end
wsend %actor% Вы начали ворошить гнездо.
wechoaround %actor% %actor.name% решил%actor.g% разворошить гнездо.
wait 1
wecho Внезапно на Вас спикировала сорока, взявшаяся невесть откуда.
wait 2
wecho Видимо, она не очень довольна, что Вы разоряете ее жилище.
wload mob 9044
detach 9006 %self.id%
~
#9007
Стражник встертил агрессора~
0 qr 80
~
wait 1
if %actor.clan% != null
  halt
end
if !%actor.agressor%
  halt
end
if ((%actor.agressor% > 7000) && (%actor.agressor% < 9999))
  set agr 1
end
if %agr% == 1
  if %actor.sex% == 1
    крича %actor.name%, - вот он, убивец, хватай его! Вяжи его!
  else
    крича %actor.name%, мерзавка, хватай ее! Вяжи ее!
  end
  Крича %actor.name% - вот он%actor.g% где, хватай, ребяты!
  mkill %actor% 
end
~
#9008
Стражник вошел к агрессору~
0 qrt 80
~
wait 1
if %actor.clan% != null
  halt
end
foreach char %self.pc%
  if ((%actor.agressor% > 7000) && (%actor.agressor% < 9999))
    set target %char%
  break
end
done
if !%target%
  halt
end
if %actor.sex% == 1
  крича %target.name%, - вот он, подлый убийца, хватай его!
else
  крича %target.name%, мерзавка, вяжи ее!
end
Крича %target.name% - вот он %target.g% где, хватай, ребяты!
появ
mforce %target.name% ухм
mkill %target% 
~
#9009
лохв тригует~
0 q 100
~
if ((%actor.remort% > 3) || (%actor.getquest(9000)% == %date.yday%) || (%actor.getquest(9000)% > 366))
  halt
end
%actor.unsetquest(9000)%
wait 1
say Здраве буде, %actor.name%!
вздох
say Беда у меня приключилась, не поможешь?
~
#9010
лохву грим да~
0 d 1
да хочу помогу~
if ((%actor.vnum% != -1) || (%actor.remort% > 3) || %actor.quested(9000)%)
  halt
end
wait 1
%actor.setquest(9000 1000)%
улы
say Был у меня набор рун, из священного дуба сделанных.
say Сам дуб мне ветвь для них отдал!
say Но вот унес ветер три руны, да сороки подхватили, в разные стороны унесли.
say Найди руны, принеси мне, а я уж отблагодарю чем сумею.
~
#9011
мыши пищат~
0 b 15
~
пищать
~
#9012
мост шатается~
2 eg 50
~
wait 1 
wsend %actor% Мостик дрожит под вашими ногами.
wechoaround %actor% Мостик задрожал, когда %actor.name% вступил на него.
~
#9013
кумушки трындят~
0 q 10
~
wait 2
msend %actor% Кумушки увидели Вас и усиленно зашептались, склонив друг к другу головы.
wechoaround %actor% Деревенские кумушки увидели %actor.rname% и оживленно зашептались.
~
#9014
лохву даем вещи~
0 j 100
~
if (!%actor.quested(9000)% || (%actor.getquest(9000)% == %date.yday%))
  return 0
  say Разве я тебя об этом просил?
  halt
end
switch %object.vnum%
  case 9016
    case 9017
      case 9018
        eval i %actor.getquest(9000)%+1
      break
      default
        return 0
        say Разве я тебя об этом просил?
      done
      wait 1
      mpurge %object%
      %actor.setquest(9000 %i%)%
      wait 1
      if (%actor.getquest(9000)% < 1006)
        say Спасибо, %actor.iname%, но где же остальные руны?
        halt
      end
      %actor.setquest(9000 1100)%
      say Спасибо тебе, уважи%actor.q%.
      if (%actor.str% >= 23)
        %actor.setquest(9000 %date.yday%)%
        mload obj 9020
        say Возьми это.
        give ключ .%actor.iname%
        say В пещере темной, за валуном, говорят сокровища скрыты. 
        say Только силушку надо иметь богатырскую, чтобы валун тот сдвинуть...
        пока %actor.name%
      elseif (%actor.dex% >= 23)
        %actor.setquest(9000 %date.yday%)%
        mload obj 9021
        say Возьми это.
        give ключ .%actor.iname%
        say В пещере темной, там где подземное озеро, скрыта потайная комната. 
        say Только самый ловкий сможет попасть в нее - находится она под самим сводом.
        say Придумаешь как забраться - считай, сделано дело.
        пока %actor.name%
      elseif (%actor.int% >= 23)
        шепт .%actor.iname% Запомни слово потайное: "Алохомора", оно тебе может пригодиться!
        say В пещере темной, там где подземное озеро, лежит древняя плита. 
        say Только самый умный сможет разгадать, что на ней написано.
        say Когда прочтешь - произнеси слово тайное. 
        пока %actor.name%
        calcuid plita 9045 room
        attach 9015 %plita.id%
        exec 9017 %plita.id%
      else
        say Надо бы наградить тебя..
        взд
        say Да что-то ни силы в тебе, как кметю надлежит, ни ловкости охотничеьй.
        say Да и умом дебя боги не наделили.
        say Возьми малость кун - им любой применение сыщет.
        %self.gold(+150)%
        дать 150 кун .%actor.name%
      end
~
#9015
награда мага~
2 d 1
Алохомора~
if (%actor.getquest(9000) != 1100)
  halt
end
%actor.setquest(9000 %date.yday%)%
wait 1s 
wsend %actor% От произнесенных Вами слов плита рассыпалась в прах.
wechoaround %actor% От произнесенных %actor.tname% слов плита рассыпалась в прах.
calcuid plita 9004 obj
wpurge %plita%
wait 1
wload obj 9023
~
#9016
репоп~
2 f 100
~
calcuid birdhouse 9052 room
attach 9018 %birdhouse%
calcuid birdhouse 9053 room
attach 9006 %birdhouse%
wdoor 9045 w purge
calcuid rodnik 9045 room
attach 9020 %rodnik%
~
#9017
лоад рун~
0 f 100
~
if (%actor.getquest(9000)% == 1000)
  mload obj 9016
  set i 1001
elseif (%actor.getquest(9000)% == 1001)
  mload obj 9017
  set i 1002
elseif (%actor.getquest(9000)% == 1002)
  mload obj 9018
  set i 1003
end
%actor.setquest(9000 %i%)%
~
#9018
мучаем второе гнездо~
2 c 0
ворошить разворошить разорить~
if !(%arg.contains(гнездо)
  wsend %actor% Что вы хотите разворошить?
  halt
end
wsend %actor% Вы начали ворошить гнездо.
wechoaround %actor% %actor.name% решил%actor.g% разворошить гнездо.
wait 2
wecho Внезапно на Вас спикировала сорока, взявшаяся невесть откуда.
wait 3
wecho Видимо, она не очень довольна, что Вы разоряете ее жилище.
wload mob 9045
detach 9018 %self.id%
~
#9019
выползаем из каморки~
0 c 1
вылезти слезть спуститься спрыгнуть~
wechoaround %actor% %actor.name% спустил%actor.u% откуда-то из-под свода пещеры.
wsend %actor% Вы благополучно спустились на землю.
wteleport %actor% 9045
~
#9020
Двигаем валун~
2 c 0
сдвинуть отодвинуть отвалить откатить~
wait 1
if (!%arg.contains(камень)% && !%arg.contains(валун)%)
  wsend %actor% Хорошо-хорошо, но над чем вы хотите это проделать?
  halt
end
if (%actor.str% < 22)
  wsend %actor% Вы обхватили камень руками, и навалились что есть сил.
  wsend %actor% Камень даже покачнулся было, но тут ваши руки соскользнули, и вы шлепнулись наземь.
  %actor.position(6)%
  wsend %actor% Каши надо было больше есть, не с вашими силенками такие глыбины ворочать.
  halt
end
if (%actor.remort% > 3)
  wsend %actor% Да полно вам в детские игры играться...
  wsend %actor% Тоже выдумали - камни без толку ворочать. Сходили бы, что ли, кузнецу помогли.
  halt
end
wechoaround %actor% %actor.name% откатил%actor.q% в сторону огромный валун!
wsend %actor% Навалившись всем телом, вы откатили валун в сторону.
wecho За валуном открылся узкий проход.
wdoor 9045 w room 9047
calcuid stone 9003 obj
wpurge %stone%
wload obj 9024
detach 9020 %self.id%
~
#9021
Пурж ключа дуболомов~
1 o 100
~
if (%actor.str% < 23)
  osend %actor% Как вы ни старались, вам так и не удалось повернуть ключ в проржаевшем замке.
  osend %actor% Тут надо бы кого-то посильней...
  return 0
  halt
end
wait 1
foreach item %actor.objs%
  if %item.vnum% == 9020
    opurge %item%
  end
done
osend %actor% Ключ хрустнул и сломался у Вас в руках.
~
#9022
Пурж ключа ловкачей~
1 o 100
~
if (%actor.dex% < 23)
  osend %actor% Как вы ни старались, вам так и не удалось нажать на все тайные пружины.
  osend %actor% Тут надо бы кого-то половчей...
  return 0
  halt
end
wait 1
foreach item %actor.objs%
  if %item.vnum% == 9021
    opurge %item%
  end
done
osend %actor% Ключ хрустнул и сломался у Вас в руках.
~
$~
