#63000
cтражи приветствуют~
0 r 100
~
if %actor.clan% == рп
  switch %random.5%
    case 1
      поклон %actor.iname%
    break
  done 
end
~
#63001
мальчишка кашляет~
0 qt 10
~
кашл %actor.iname%
~
#63002
божанка (приветствие)~
0 r 100
~
wait 10
сказ %actor.iname% Привет тебе %actor.iname%!
сказ %actor.iname% Я практикуюсь в магии и могу произнести для тебя заклинания.
сказ %actor.iname% Если ты в этом заинтересован%actor.g% в этом, дай мне знать.
~
#63003
божанка (говорит заклинания)~
0 d 0
продолжай да хорошо заинтересован заинтересована говори~
wait 10
сказ %actor.iname% Итак.
сказ %actor.iname% Доблесть будет стоит тебе 200 кун.
сказ %actor.iname% Защита обойдется всего в 300 кун.
сказ %actor.iname% Свет можешь получить, всего-то за 150 кун.
*сказ %actor.iname% А вот за освящение придется выложить 800 кун.
сказ %actor.iname% Тебе выбирать.
~
#63004
божанка (бросает заклинания)~
0 m 1
~
wait 1s
if %amount% < 150 
  сказ %actor.iname%  Ну за эти деньги, я тебе ни чего делать не буду!
  сказ %actor.iname% На. Забери их обратно!
  дать %amount% кун %actor.iname%
  halt
end  
switch %amount%
  case 200
    msend %actor.iname% _Божанка нахмурилась и взмахнула рукой.
    msend %actor.iname% _Все вокруг вдруг ярко вспыхнуло!    
    dg_cast 'доблесть' %actor.iname%
  break 
  case 300
    msend %actor.iname% _Божанка зыркнула на Вас и что-то пробормотала.
    dg_cast 'защита' %actor.iname%
  break 
  case 150
    msend %actor.iname% _Божанка взяла свечу и глядя на пламя что-то зашептала.
    dg_cast 'свет' %actor.iname%
  break                         
  *case 800
  *msend %actor.iname% _Божанка начала читать молитву, постоянно упоминая Ваше имя.
  *dg_cast 'освящение' %actor.iname%
break
done
~
#63005
толстый голубь~
2 e 5
~
wsend %actor.iname% _Толстый голубь, не смог вовремя сманеврировать и врезался вам в голову!
wechoaround %actor.iname% _Толстый голубь, не смог вовремя осознать препятствие и врезался в голову %actor.rname%!
~
#63006
пьяница у корчмы~
2 e 15
~
wait 10
wecho _Из корчмы послышались звуки перебранки.
wecho _Через некоторое время из дверей с диким ревом вылетел пьяный мужик.
wecho _По его налитыми кровью глазам, в вашей голове мелькнула мысль
wecho _Что сейчас он может наброситься на вас.  
wait 10
wecho _Пьяница злобно посмотрел по сторонам и с гордым видом ушел куда-то во дворы.
~
#63007
поскрипывают городские ворота~
2 e 10
~
wait 10
wecho _Створки городских ворот злобно заскрепели и...
wecho _Вам показалось, что они готовы упасть на вас!
~
#63008
голоса молитв~
2 e 10
~
wait 10
wecho  Откуда-то сверху донеслись завывающие звуки молитвы.
~
#63009
спотыкаемся~
2 e 5
~
wait 1
wecho _Вы споткнулись о небольшой камешек и немного разодрали локти.
wecho  Откуда он вообще тут взялся?!
wdamage %actor% 50
~
#63010
шатается мост у южных ворот~
2 e 15
~
wecho _Под вашими ногами мост медлено покачнулся...
wecho _Или вам это показалось?
~
#63011
падаем с северного моста~
2 e 5
~
%actor.wait(3)%
wsend %actor% Вам показалось, что мост пошатнулся под вашими ногами.
wsend %actor% Ваше сознание снова вернулось к вам, только тогда
wsend %actor% Когда местные жители вытащили ваше безсознательное и покусанное
wsend %actor% Мелкими гадами тело из городского рва.
wechoaround %actor% %actor.iname% вдруг сильно закачал%actor.u% и с размаху бросил%actor.u% в городской ров.
wechoaround %actor% Проходящие мимо местные жители быстро вытащили из рва
wechoaround %actor% бессознательное тело %actor.rname%.
wechoaround %actor% Через несколько минут %actor.name% пришел в себя
wechoaround %actor% и с непониминием посмотрел%actor.g% по сторонам.
wdamage %actor% 100
~
#63012
лекарь (приветствие)~
0 r 100
~
wait 1s
сказ %actor.iname% Привет странник.
сказ %actor.iname% Я практикуюсь в приготовлении отваров и если ты принесешь мне
сказ %actor.iname% ингредиенты, то я смогу сварить тебе некоторые простые отвары.
~
#63013
лекарь (варит)~
0 j 100
~
wait 1
if (( %object.vnum% < 700 ) || ( %object.vnum% > 799 ))
  say Это мне не нужно...
  брос %object.name%
  halt
end
eval ovnum %object.vnum%
wait 1
mpurge %object%
if (%object.val1%<8)
  say Ты эту штуку на помойке нашел?
  морщ
  wait 1
  say Нет, не подойдет, слишком низкое качество.
  брос %object.name%
  halt
end
if %number% < 5
  eval number %number%+1
  global number
  say У меня нет всего, что нужно для этого зелья, может быть, ты принесешь еще что-нибудь?
  halt
else
  eval number 0
  global number
end
if ( %random.25% < %random.50% )
  взд
  say Ничего не получилось, как видно, я то-то напутал с рецептом...
  eval number 0
  global number
  halt
end
switch %ovnum%
  case 700
    mecho Вот держи. Это все, что смог сделать.
    mload obj 63052
    дать отвар %actor.iname%
  break
  case 701
    mecho Вот держи. Это все, что смог сделать.
    mload obj 63042
    дать отвар %actor.iname%
  break
  case 705
    mecho Вот держи. Это все, что смог сделать.
    mload obj 63052
    дать отвар %actor.iname%
  break
  case 751
    mecho Вот держи. Это все, что смог сделать.
    mload obj 63051
    дать отвар %actor.iname%
  break
  case 752
    mecho Вот держи. Это все, что смог сделать.
    mload obj 63043
    дать отвар %actor.iname%
  break
  case 754
    mecho Вот держи. Это все, что смог сделать.
    mload obj 63049
    дать отвар %actor.iname%
  break
  case 755
    mecho Вот держи. Это все, что смог сделать.
    mload obj 63053
    дать отвар %actor.iname%
  break
  case 756
    mecho Вот держи. Это все, что смог сделать.
    mload obj 63046
    дать отвар %actor.iname%
  break
  case 757
    mecho Вот держи. Это все, что смог сделать.
    mload obj 63047
    дать отвар %actor.iname%
  break
  case 758
    mecho Вот держи. Это все, что смог сделать.
    mload obj 63050
    дать отвар %actor.iname%
  break
  case 721
    mecho Вот держи. Это все, что смог сделать.
    mload obj 63045
    дать отвар %actor.iname%
  break
  case 722
    mecho Вот держи. Это все, что смог сделать.
    mload obj 63048
    дать отвар %actor.iname%
  break
  case 724
    mecho Вот держи. Это все, что смог сделать.
    mload obj 63044
    дать отвар %actor.iname%
  break
  default
    г Мне это не надо.
    брос %object.iname%
    halt
  done
~
#63014
приветствие ворожеи~
0 q 100
~
wait 1
msend %actor% Ворожея сказала тебе:
msend %actor% - Да защитит тебя Белобог от всякого зла, %actor.name%!
msend %actor% - Вижу, что не просто так ты сюда заглянул%actor.g%! Могу тебе помочь!
msend %actor% - Коли ты дашь мне немного кун для жертвы Яриле
msend %actor% - Я помогу тебе мигом добраться до нужного русского города.
~
#63015
дали деньги ворожее~
0 m 1
~
if (%amount% < 200)
  say За такую лепту сам%actor.g% Ярило разгневай. А я не рискну!
  halt
end
wait 1
msend %actor% - Ворожея сказала тебе:
msend %actor% - Если добудешь металл и грибы то, смогу отправить тебя в Переяславль.
msend %actor% - А захочешь во Владимир попасть - дай мне зубы и грибы.
msend %actor% - Коли в Туров хочешь - принеси мне ветку и печень.
~
#63016
даем ингры ворожее~
0 j 100
~
wait 1
If (%object.vnum%==713)
  If (%object.val1%>5)
    Say Отличная ветка! Подойдет для сотворения заклятья!
    If  !(%self.haveobj(60067)%)
      Mload obj 60067
    Else 
      Say Не... ветка у меня уже есть. Вторая не нужна пока.
    End
  Else
    Say Не... ветка не достаточна длинная! Такая не подойдет.
  end 
End
If (%object.vnum%==754)
  If (%object.val1%>5)
    Say Замечательная белая печень! В самый раз для заклинания!
    If  !(%self.haveobj(60066)%)
      Mload obj 60066
    Else 
      Say У меня уже есть печень! Еще одна пока не нужна!
    End
  Else
    Say Нет! Эта печень не достаточно жирная! Такая не подойдет.
  end 
End
If (%object.vnum%==700)
  If (%object.val1%>5)
    Say Уу-у! Замечательные грибы!
    If  !(%self.haveobj(60060)%)
      Mload obj 60060
    Else 
      Say У меня уже есть гриб! Мне второй не нужен!
    End
  Else
    Say Не-е-ет! Этот грибок маленький и червивый. Такой не годиться!
  end 
End    
If (%object.vnum%==751)
  If (%object.val1%>10)
    Say Отличные белые зубы!
    If  !(%self.haveobj(60068)%)
      Mload obj 60068
    Else 
      Say Зубы у меня уже есть! Вторая челюсть пока не нужна!
    End
  Else
    Say Не..этот гнилой зуб не годиться для заклинания! Ищи те, что получше!
  end 
End  
If (%object.vnum%==722)
  If (%object.val1%>5)
    Say Замечательный метал! В самый раз для заклинания!
    If  !(%self.haveobj(60065)%)
      Mload obj 60065
    Else 
      Say У меня уже есть метал! Еще один пока не нужен!
    End
  Else
    Say Нет! Этот металл недостаточно прочен! Такой не подойдет.
  end 
End
Mpurge %object%
if (%self.haveobj(60067)% && %self.haveobj(60066)%)
  say Отлично! Сейчас я принесу жертву и сотворю заклятье!
  say С его помощью я перенесу Вас в Туров
  mecho Ворожея что-то пошептала над ингредиентами и поднесла их к идолу.
  брос все
  mteleport all 32419
end
if (%self.haveobj(60065)% && %self.haveobj(60060)%)
  say Отлично! Сейчас я принесу жертву и сотворю заклятье!
  say С его помощью я перенесу Вас в Переяславль
  mecho Ворожея что-то пошептала над ингредиентами и поднесла их к идолу.
  брос все
  mteleport all 25005
end   
if (%self.haveobj(60068)% && %self.haveobj(60060)%)
  say Отлично! Сейчас я принесу жертву и сотворю заклятье!
  say С его помощью я перенесу Вас во Владимир
  mecho Ворожея что-то пошептала над ингредиентами и поднесла их к идолу.
  брос все
  mteleport all 18206
end
~
#63017
Лоад знахаря~
0 n 100
~
wait 1
eval number 0
global number
~
#63018
Платный портал у волхва~
0 m 1
~
wait 1
emot пересчитал%self.g% монеты
eval target 0
switch %amount%
  * Муром
  case 2600
    eval target 76083
  break
  * Меньск
  case 4900
    eval target 77040
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
  msend %actor% У вас закружилась голова, и на миг вы потеряли сознание...
  msend %actor% 
  mteleport %actor% %target% horse
  mechoaround %actor% %actor.name% появил%actor.u% здесь в клубах дыма.
~
$~
