#32400
Священник~
0 q 100
~
if (%actor.religion% == 1 )
  wait 1s
  say Доброго времени суток Вам %actor.name%!
  say Заходите к нам в Христианскую обитель.
  эм схватился за поясницу и еле слышно простонал
  say Должен я идти молиться, а тут как на грех поясница прихватила
  взд
  груст
else
  say Извините, но язычникам не место в нашей обителе.
  *wait 1s
  mteleport .%actor.name% 32460
end
~
#32401
дали священику~
0 j 100
~
wait 1
if %object.vnum% != 32503
  wait 5
  ужас
  say Да вы что! Я дал обет нестяжательства! Не нужно мне ничего!
  вопр
  брос все
  halt
end
mpurge %object%
say Вот спасибо тебе, добрый человек!
wait 3
say Это замечательное лекарство для моих старых костей!
рад
wait 1
say Теперь с Божьей помощью мне полегче станет!
say Вот возьми за труды свои...
wait 3
эм достал что-то из сундучка у стены и протянул Вам.
if (%random.1000% < 90) && (%world.curobjs(32503)% < 3)
  mload obj 32413
else
  mload obj 32428
end
дать все %actor.name%
say Ни одно благое дело не должно оставаться без благодарности!
say До встречи, добрый человек человек!
say Пора мне к литургии готовится...
крест
%purge% %self%
end
~
#32404
ВорожеяПривет~
0 r 100
~
wait 1
msend %actor% Ворожея сказала тебе:
msend %actor% - Да защитит тебя Белобог от всякого зла, %actor.name%!
msend %actor% - Вижу, что не просто так ты сюда заш%actor.y%! Могу тебе помочь!
msend %actor% - Коли ты дашь мне немного кун для жертвы Яриле
msend %actor% - Я помогу тебе мигом добраться до нужного русского города.
~
#32405
БаблоВорожеи~
0 m 100
~
wait 1
if (%amount% < 200)
  say За такую лепту сам%actor.g% Ярило разгневай. А я не рискну!
  halt
end
emot пересчитал%self.g% монеты.
eval target 0
switch %amount%
  * Ладога
  case 3400
    eval target 30213
  break
  * Муром
  case 4200
    eval target 76083
  break
  * Псков
  case 5900
    eval target 75066
  break
  default
    wait 1
    msend %actor% Ворожея сказала тебе:
    msend %actor% - Могу переместить тебя куда попросишь, не задаром, конечно.
    msend %actor% - В Ладогу - за 3400 кун.
    msend %actor% - В Муром - за 4200 кун.
    msend %actor% - Ну а в Псков за - 5900 кун.
    msend %actor% - И это еще дешево, за столько-то верст!
    wait 2
    msend %actor% - Жалко кун - подыщи мне для ворожбы вещичек.
    msend %actor% - Коли в Ладогу хочешь - принеси мне ветку и сочные ягоды.
    msend %actor% - Если добудешь ветку подлиннее и грибы, то смогу отправить тебя в Муром.
    msend %actor% - А захочешь во Псков попасть - дай мне зубы и грибы.
    halt
  done
  кив
  emot сделал%self.g% несколько странных жестов
  mechoaround %actor% %actor.name% исчез%actor.q% в клубах дыма.
  msend %actor% У вас закружилась голова, и на миг вы потеряли сознание...
  *msend %actor% 
  mteleport %actor% %target%
  mechoaround %actor% %actor.name% появил%actor.u% здесь в клубах дыма.
~
#32406
ИнгрыВорожее~
0 j 100
~
wait 1
if (%object.vnum%==713)
  if (%object.val1%>5)
    say Отличная ветка! Подойдет для сотворения заклятья!
    if  !(%self.haveobj(60067)%)
      mload obj 60067
    else 
      say Не... ветка у меня уже есть. Вторая не нужна пока.
    end
  else
    say Не... ветка не достаточна длинная! Такая не подойдет.
  end 
end
if (%object.vnum%==705)
  if (%object.val1%>5)
    say Замечательные сочные ягоды! В самый раз для заклинания!
    if  !(%self.haveobj(60061)%)
      mload obj 60061
    else 
      say У меня уже есть ягоды! Еще одни пока не нужны!
    end
  else
    Say Нет! Эти ягоды недостаточно сочные! Такие не подойдут.
  end 
end
if (%object.vnum%==700)
  if (%object.val1%>5)
    say Уу-у! Замечательные грибы!
    if  !(%self.haveobj(60060)%)
      mload obj 60060
    else 
      say У меня уже есть гриб! Мне второй не нужен!
    end
  else
    say Не-е-ет! Этот грибок маленький и червивый. Такой не годиться!
  end 
end    
if (%object.vnum%==751)
  if (%object.val1%>5)
    say Отличные белые зубы!
    if  !(%self.haveobj(60068)%)
      mload obj 60068
    else 
      say Зубы у меня уже есть! Вторая челюсть пока не нужна!
    end
  else
    say Не..этот гнилой зуб не годиться для заклинания! Ищи те, что получше!
  end 
end
mpurge %object%
if (%self.haveobj(60067)% && %self.haveobj(60061)%)
  say Отлично! Сейчас я принесу жертву и сотворю заклятье!
  say С его помощью я перенесу Вас в Ладогу.
  mecho Ворожея что-то пошептала над ингредиентами и поднесла их к идолу.
  drop all
  mteleport all 30213
end
if (%self.haveobj(60067)% && %self.haveobj(60060)%)
  say Отлично! Сейчас я принесу жертву и сотворю заклятье!
  say С его помощью я перенесу Вас во Муром.
  mecho Ворожея что-то пошептала над ингредиентами и поднесла их к идолу.
  drop all
  mteleport all 76083
end   
if (%self.haveobj(60068)% && %self.haveobj(60060)%)
  say Отлично! Сейчас я принесу жертву и сотворю заклятье!
  say С его помощью я перенесу Вас в Псков.
  mecho Ворожея что-то пошептала над ингредиентами и поднесла их к идолу.
  drop all
  mteleport all 75066
end
~
#32407
ЗашлиКСтарику~
0 r 100
~
*32503 Туровский тать, изменить номер моба, если изменится номер зоны дорога Туров-Искоростень
if (%world.curmobs(32503)% > 0)
  wait 1s
  say Приветствую Вас!
  wait 5s
  say Эх, и Вы не обращаете внимания на старика!
  say Найти бы кому излить душу, да помощи попросить.
end
~
#32408
ГоворимДаСтарику~
0 d 0
слушаю~
*32503 Туровский тать, изменить номер моба, если изменится номер зоны дорога Туров-Искоростень
if (%world.curmobs(32503)% == 1)
  wait 1s
  say Нашелся хоть один человек готовый выслушать мою беду.
  wait 3s
  say Так вот, обучал я недавно одного молодого человека.
  say Отличный был ученик, способный... черезчур.
  say Да в одну ночь, пока все спали, выкрал он у меня вещицу одну
  say Прознали об этом стражи городские и прогнали его из Турова.
  say Живет теперь он изгоем где-то в лесах, что южнее Турова.
  say И настолько изучил там местность, что спрятаться там для него  - плевое дело!
  wait 2s
  say Если поможешь отнять у него мою вещицу, отблагадарю тебя
  say А ежели нет, то Бог тебе судья!
  say Ну так что?
else
  say Теперь Ваша помощь мне без надобности.
end
*detach 32408 %self%
~
#32409
ПомогуСтарику~
0 d 0
помогу~
wait 1s
say Отлично!
say Буду ждать Вас тут!
say Идите же...
detach 32407 %self%
detach 32408 %self%
detach 32409 %self%
~
#32410
НаградаСтарика~
0 j 100
~
wait 1s
if (%object.vnum% == 32416)
  *calcuid veshitzo 32416 obj
  say Вот спасибо тебе мил человек, выручил старика
  say Держи обещаную награду!
  *mpurge %veshitzo.id%
  wait 1s
  mpurge %object%
  %actor.exp(+10000)%
  switch %random.9% 
  break
  case 1
    if %world.curobjs(32417)% < 2
      mload obj 32417
      wait 1s
      дать перч .%actor.name%
      брос перч
    end
  break
  case 2
    if %world.curobjs(32418)% < 2
      mload obj 32418
      wait 1s
      дать перст .%actor.name%
      брос перст
    end
  break
  case 3
    if %world.curobjs(32419)% < 2
      mload obj 32419
      wait 1s
      дать сапог .%actor.name%
      брос сапог
    end
  break
  default 
    %self.gold(+1000)%
    дать 1000 кун .%actor.name%
  break
done 
end
~
#32411
ВыдачаКвеста1(женщина)~
0 q 100
~
wait 1
if !%exist.mob(32424)%
  halt
end
if %actor% == %turovquest% 
  halt
end
emot подняла голову и пристально посмотрела на Вас.
wait 2s
say Здраве буде мил человече.
if !%turovquest%
  say Хожу по городу уже который день.
  say Никого о помощи не могу допроситься.
  say Может Вы поможете? 
  attach 32412 %self%
end
~
#32412
ВыдачаКвеста2(жен)~
0 d 0
помогу~
*if %actor.vnum% != -1
*halt
*end
if %turovquest%
  wait 2
  say Я уже попросила о помощи %turovquest.vname%, жду вот..
  say Не знаю воротится, али сгинет.
  halt
end
if (%world.curmobs(32424)% == 0)
  halt
end
set turovquest %actor%
calcuid ivan 32424 mob
calcuid jrez 32423 mob
attach 32413 %ivan.id%
global turovquest
remote turovquest %ivan.id%
remote turovquest %jrez.id%
wait 1s
emot заплакала навзрыд и упала к Вам на плечо.
say Ох, спасибо тебе мил человек, что согласился помочь моему горю.
wait 1s
emot немного успокоилась и начала рассказ.
say Есть у меня внучок, малой совсем... Иванушкой зовут
say Один он у меня остался, родители его сгинули в болотах местных.
груст
wait 1s
say А теперь и сам пропал, да не без силы колдовской.
say Ходят слухи, что его забрал жрец, что в северном Турове живет.
say Да нету у нас в городе храбрецов, чтобы к нему сходить.
взд
wait 1s
say Ну вот, рассказала все что знала.
say А теперь ступай, я буду ждать новостей!
~
#32413
СпасаемИванушку~
0 q 100
~
if %actor% == %turovquest%
  улы
  say Спасибо %turovquest.name% что освободил меня от чар злого жреца!
  msend %actor% Иванушка бросился к Вам на шею!
  say Ладно, побегу я к бабушке, и Вы заходите к нам.
  mecho Иванушка сломя голову помчался домой. 
  %turovquest.exp(+5000)%
  calcuid babka 32422 mob
  attach 32416 %babka%
  mpurge %self%
else
  груст
  say Вы наверно очень храбрый, раз попали сюда.
  say Но боюсь Вам не совладать с чарами жреца.
  say Уходите иначе он Вас погубит!
end
~
#32414
ЗашлиКЖрецу1~
0 r 100
~
if %actor% == %turovquest%
  wait 1s
  хмур  
  say Прознала уже значит эта ведьма про меня!
  say И ты значит за ее щенком пришел?
  say Ну что ж, ладно, отдам тебе его, если поможешь мне кое в чем!
  ухм
  wait 2s
  say В Южном Турове в харчевне "Яр-Тур", Князь Туровский часто бывает.
  say Давно у меня с ним конфликты, веры у нас разные понимаешь ли!
  say Сходи к ниму, пообщайся, да свиток мне принеси с сургучной печатью.
  say Что стражи города меня не тронут! Тогда и получишь пацана!
  wait 1s
  say Ну чего стоишь? Проваливай!
else
  wait 1s
  say Чего пришел?!
  say Проваливай отсюда!
  halt
end
calcuid knieze 32425 mob
attach 32417 %knieze%
remote turovquest %knieze%
attach 32415 %self%
detach 32414 %self%
~
#32415
ЗашлиКЖрецу2~
0 j 100
~
if (%object.vnum% == 32421)
  wait 1s
  say А ты молодец!
  say С самим Князем сумел договориться!
  say На, держи ключ, раз я обещал.
  say Забирай пацана и катитесь к черту оба!
  mload obj 32420
  дать ключ %turovquest.name%
  бр ключ
end
detach 32415 %self%
~
#32416
НаградаЗаКвест~
0 r 100
~
if ( ( !%exist.mob(32424)% ) && ( %actor% == %turovquest% ) )
  wait 1s
  say Спасибо тебе мил человек!
  say Спасли внучка моего от злого языческого жреца!
  say Возмите награду!
  say Чем богаты, как говориться!
  switch %random.9%
  break
  case 1
    if %world.curobjs(32422)% < 2
      mload obj 32422
      wait 1s
      дать перч %turovquest.name%
      брос все
    else
      %self.gold(+500)%
      дать 500 кун .%actor.name%
    end
  break
  case 2
    if %world.curobjs(32423)% < 2
      mload obj 32423
      wait 1s
      дать плащ %turovquest.name%
      брос все
    else
      %self.gold(+500)%
      дать 500 кун .%actor.name%
    end
  break
  case 3
    if %world.curobjs(32424)% < 2
      mload obj 32424
      wait 1s
      дать пояс %turovquest.name%
      брос все
    else
      %self.gold(+500)%
      дать 500 кун .%actor.name%
    end
  break
  case 4
    if %world.curobjs(32425)% < 2
      mload obj 32425
      wait 1s
      дать понож %turovquest.name%
      брос все
    else
      %self.gold(+500)%
      дать 500 кун .%actor.name%
    end
  break
  case 5
    if %world.curobjs(32426)% < 2
      mload obj 32426
      wait 1s
      дать досп %turovquest.name%
      брос все
    else
      %self.gold(+500)%
      дать 500 кун .%actor.name%
    end
  break
  default 
    %self.gold(+500)%
    дать 500 кун %turovquest.name%
  break
done 
detach 32416 %self%
end
~
#32417
ИдемККнязю~
0 q 100
~
if %actor% == %turovquest%
  wait 1s
  say Здравствуй %turovquest.name%
  say Прослышал я, что ты у самого языческого жреца был.
  say Давние мы с ним недруги...
  say Что он на этот раз хочет?
  attach 32418 %self%
end
~
#32418
БеремСвитокУКнязя~
0 d 0
свиток~
if %actor% == %turovquest%
  wait 1s
  взд
  say Вот же шельма какой!
  say Не знаю право как и поступить...
  дум
  wait 4s
  say Ладно, держи сей свиток
  say Жизнь ребенка от меня зависит...
  say Дарую я жрецу свободу, глядишь одумается...
  mload obj 32421
  дать свит %turovquest.name%
  detach 32417 %self.id%
  detach 32418 %self.id%
else
  say Нет у меня ничего для тебя!
end
~
#32419
Репоп~
2 f 100
~
calcuid starik 32421 mob
attach 32407 %starik%
*calcuid starik 32421 mob
attach 32408 %starik%
*calcuid starik 32421 mob
attach 32409 %starik%
calcuid jrez 32423 mob
attach 32414 %jrez%
*calcuid jrez 32423 mob
rdelete turovquest %jrez%
calcuid kluka 32422 mob
attach 32411 %kluka%
*calcuid kluka 32422 mob
rdelete turovquest %kluka%
unset turovquest
*unset turovquest
~
#32420
ДаемCвитокИзПервойЧастиДороги~
0 j 100
~
wait 1s
if (%object.vnum% == 32600 )
  ул
  wait 1s
  say Ну-с, поглядим что за весть ты мне принес, путник.
  emot развернул свиток и начал внимательно изучать текст.
  wait 1s
  хму
  хму
  wait 2s
  мат
  wait 1s
  say Хреновые новости Князь киевский мне прислал.
  say Ну да ладно, кто предупрежден, тот вооружен!
  wait 1s
  say А ты чего досих пор здесь? Вознаграждения ждешь?
  хму
  wait 1s
  say На вот тебе на вино, и проваливай пока не вздернули на виселице!
  %self.gold(+500)%
  дать 500 кун %actor.name%
  wait 1
  mpurge %object%
  wait 10s
  крич Стража сомкнуть ряды! Запереть засовы!
  крич Войско вражье на город наш славный надвигается!
else
  брос все
end
~
$~
