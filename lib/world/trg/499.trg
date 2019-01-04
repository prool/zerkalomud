#49900
приветствие~
2 e 100
~
wait 1
wsend %actor% Волхв сказал тебе:
wsend %actor% - Здраве тебе, %actor.name%!
wsend %actor% - Я могу перенести тебя в город Корсунь, естественно небесплатно.
wsend %actor% - Заплатишь мне 1050 кун - и окажешься там в мгновение ока.
~
#49901
Дает сообщение о стоимости телепорта~
2 d 1
да конечно угу~
wait 1
wsend %actor% Волхв сказал тебе:
*wsend %actor% - Hо вот в тридевятое царство давай мне 200 кун.
wsend %actor% - В славный город Корсунь, перенесу дорого, гильдия мореходов запрещает мне это дешево делать, так что плати 1050 кун.
~
#49902
Телепортит в зоны~
2 z 0
~
wait 1
switch %amount%
  *case 200
  *wecho Волхв начал читать заклинание, разводя руками и делая странные пасы.
  *wechoaround %actor% %actor.name% исчез в воздушном круговороте.
  *wsend %actor% Вас подхватило воздухом и вы на миг потеряли сознание.
  *wteleport %actor% 90047 horse
  *wat 90047 wechoaround %actor% %actor.name% появил%actor.u% тут в клубах дыма.
  *break
  case 1050
    wecho Волхв начал читать заклинание, разводя руками и делая странные пасы.
    wechoaround %actor% %actor.name% исчез в воздушном круговороте.
    wsend %actor% Вас подхватило воздухом и вы на миг потеряли сознание.
    eval rand 27000+%random.60%
    wteleport %actor% %rand% horse
    wat %rand% wechoaround %actor% %actor.name% появил%actor.u% тут в клубах дыма.
    unset rand
  break
  default
    wsend %actor% Волхв сказал тебе:
    wsend %actor% - Спасибо за деньги, но я не знаю, куда тебя переместить за такую сумму. 
    wsend %actor% - Hо куны не верну... Знай что творишь.
  break	
done
~
#49903
запуск телепортящего триггера~
0 m 0
~
calcuid roomrun 49934 room
run 49902 %roomrun.id%
~
#49904
пурж себя~
0 z 100
~
mecho Предчувствуя неладное, жители разбежались в страхе.
mpurge %self%
~
#49905
к хозяину заходят угры~
0 z 100
~
wait 1
if %actor.vnum% == 34632
  mshou Спасайся кто может! Угры в Киеве....
end
wait 1
if %actor.vnum% == 34631
  mshou  Мамочка! Угры в гостинице! Спасай...
end
~
#49906
угры пуржатся~
2 g 100
~
wait 1
if %actor.vnum% == 34632
  calcuid ug34632r 34632 mob
  while  %ug34632r%
    exec 34607 %ug34632r.id%
    eval ug34632r 
    calcuid ug34632r  34632 mob
  done
  wecho Угры разбрелись в разные стороны.
end
wait 1
if %actor.vnum% == 34631
  calcuid ug34631r 34631 mob
  while  %ug34631r%
    exec 34607 %ug34631r.id%
    eval ug34631r 
    calcuid ug34631r  34631 mob
  done
  wecho Угры разбрелись в разные стороны.
end
wait 1
if %actor.vnum% == 34630
  calcuid ug34630r 34630 mob
  while  %ug34630r%
    exec 34607 %ug34630r.id%
    eval ug34630r 
    calcuid ug34630r  34630 mob
  done
  wecho Угры разбрелись в разные стороны.
end
wait 1
if %actor.vnum% == 34629
  calcuid ug34629r 34629 mob
  while  %ug34629r%
    exec 34607 %ug34629r.id%
    eval ug34629r 
    calcuid ug34629r  34629 mob
  done
end
~
#49907
дозорный предупреждает о набеге дракона (любого)~
0 ab 100
~
if ( (%reddragonraid915% == 1) || (%whitedragonraid915% == 1) )
  mshou Вижу красные всполохи в небе! Никак дракон двухголовый снова летит к нам за поживой!
  wait 1
  mshou Эй-хей воины славные, не дайте пасть стольному граду Киеву от змея лютого.
  switch %random.2%
    case 1
      wait 120s
    break
    case 2
      default
        wait 250s
      done
    end
~
#49908
стражник предупреждает о набеге (красного дракона)~
0 ab 100
~
if (%reddragonraid915% == 1)
  wait 5s
  mshou Не пустим чудище в город или умрем! Стража, сомкнуть ряды! Все кто готов драться - На стены!
  switch %random.2%
    case 1
      wait 60s
    break
    case 2
      default
        wait 150s
      done
    end
~
#49909
стражник предупреждает о набеге (белого дракона)~
0 ab 100
~
if (%whitedragonraid915% == 1)
  wait 5s
  mshou Не пустим чудище в город или умрем! Стража, сомкнуть ряды! Все кто готов драться - На стены!
  switch %random.2%
    case 1
      wait 60s
    break
    case 2
      default
        wait 150s
      done
    end
~
#49910
Профилактический сброс флага набега (!!!)~
2 abf 100
~
if (%whitedragonraid915% == 0) && (%reddragonraid915% == 0) && (%posessedraid814% == 0)
  unset raid499
end
~
#49911
даем ингры ворожее~
0 j 100
~
wait 1
If (%object.vnum%==721)
  If (%object.val1%>5)
    Say Отличный минерал!
    If  !(%self.haveobj(60064)%)
      Mload obj 60064
    Else 
      Say Не... минерал у меня уже есть. Второй не нужна пока.
    End
  Else
    Say Не... такой минерал слишком  мал для заклятия.
  end 
End
If (%object.vnum%==722)
  If (%object.val1%>5)
    Say Замечательный метал! В самый раз для заклинания!
    If  !(%self.haveobj(60065)%)
      mload obj 60065
    Else 
      Say У меня уже есть метал! Еще один пока не нужен!
    End
  Else
    Say Нет! Этот метал недостаточно прочен! Такой не подойдет.
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
mpurge %object%
if (%self.haveobj(60064)% && %self.haveobj(60065)%)
  say Отлично! Сейчас я принесу жертву и сотворю заклятье!
  say С его помощью я перенесу Вас в Корсунь
  mecho Ворожея что-то пошептала над ингредиентами и поднесла их к идолу.
  брос все
  mteleport all 27016
end
if (%self.haveobj(60064)% && %self.haveobj(60060)%)
  say Отлично! Сейчас я принесу жертву и сотворю заклятье!
  say С его помощью я перенесу Вас в Галич
  mecho Ворожея что-то пошептала над ингредиентами и поднесла их к идолу.
  брос все
  mteleport all 34405
end   
if (%self.haveobj(60065)% && %self.haveobj(60060)%)
  say Отлично! Сейчас я принесу жертву и сотворю заклятье!
  say С его помощью я перенесу Вас в Переяславль
  mecho Ворожея что-то пошептала над ингредиентами и поднесла их к идолу.
  брос все
  mteleport all 25005
end
~
#49912
приветствие ворожеи~
0 r 100
~
wait 1
msend %actor% Ворожея сказала тебе:
msend %actor% - Да защитит тебя Белобог от всякого зла, %actor.name%!
msend %actor% - Вижу, что не просто так ты сюда заш%actor.y%! Могу тебе помочь!
msend %actor% - Коли ты дашь мне немного кун для жертвы Яриле
msend %actor% - Я помогу тебе мигом добраться до нужного русского города.
~
#49913
дали деньги ворожее~
0 m 1
~
if (%amount% < 200)
  say За такую лепту сам%actor.g% Ярило разгневай. А я не рискну!
  halt
end
wait 1
msend %actor% - Ворожея сказала тебе:
msend %actor% - Коли в Корсунь хочешь - принеси мне камушек и металл.
msend %actor% - Если добудешь камушек и грибы то, смогу отправить тебя в Галич.
msend %actor% - А захочешь в Переяславль попасть - дай мне металл и грибы.
~
#49914
следование нищих~
0 qr 50
~
wait 1
context 915
if %target1%
  set target2 %actor%
  worlds target2
elseif %target2%
  set target3 %actor%
  worlds target3
elseif %target3%
  set target4 %actor%
  worlds target4
elseif %target4%
  set target5 %actor%
  worlds target5
else %target2%
  set target1 %actor%
  worlds target1
end
if %actor.id% == %agressor.id%
  halt
end
context 0
wait 1
ул
follow .%actor.name%
set victim %actor%
global victim
~
#49915
воришки фликают~
0 k 70
~
if %actor.vnum% != -1
  set agressor %actor.leader%
  global agressor
else
  set agressor %actor%
  global agressor
end
wait 4
follow я
flee
flee
~
#49916
Пацаны треплются~
0 b 9
~
switch %random.5%
  case 1
    if %victim.sex% == 1
      say Дяденька, дайте монетку, ну дяденька, дайте монетку! 
    else
      say Тетенька, дайте монетку, ну тетенька, дайте монетку!
    end
  break
  case 2
    say Вы представляете! В Киеве-то оказывается ВОРЫ есть!
  break
  case 3
    say Вы не поверите! Тут такое было! Уже 100 человек обокрали!
  break
  case 4
    emot подозрительно покосился на Вас и отодвинулся подальше
  break
  case 5
    say Вы не знаете, есть тут поблизости лавка из тех, что подержанными вещами торгуют?
    вопрос
  break
done
полож все сунду
полож все мешок
полож все торба
полож все пояс
полож все сума
полож все сумка
пол все кошел
~
#49917
На вход в гильдию кузнецов~
0 q 100
~
wait 1
взд
say Извиняйте, люди добрые, вход в гильдию мастеров кузнечных сегодня закрыт!
emot пристроился поудобней для отдыха
~
#49918
Дали воеводе головы змея~
0 j 100
~
wait 1
if %object.vnum% == 91517
  wait 1
  say Ик...!
  say Ну молодцы, управились с змеищем поганым.
  say Вот тебе и награда.
  switch %random.6%
    case 2
      mload obj 1170
      give гривна %actor.name%
      shou За победу над змеем, награждаю я %actor.name% золотой гривной!
    break
    case 3
      mload obj 1171
      give гривна %actor.name%
      shou За победу над змеем, награждаю я %actor.name% серебряной гривной!
    break
    case 4
      mload obj 1172
      give гривна %actor.name%
      shou За победу над змеем, награждаю я %actor.name% бронзовой гривной!
    break
    default
      eval buffer %self.gold(+5000)%
      give 5000 кун %actor.name%
      shou За победу над змеем, награждаю я %actor.name% золотом!
    done
    mpurge %object%
    halt
  elseif %object.vnum%  == 91522
    remote actor %self.id%
    exec 91536 %self.id%
    wait 1s
    halt
  end
  say Зачем ты мне это принес%actor.q%?
  бросить %object.name%
  halt
~
#49919
Вход к главе гильдии златокузнецов~
0 q 100
~
wait 1
if %actor.quested(49950)%
  halt
end
if %actor.quested(49911)%
  msend %actor% Посмотрел на Вас.
  mechoaround %actor% Посмотрел на %actor.vname%.
  ул
  wait 1s
  say Здраве будь, %actor.name%!
  mecho _- Ну что же... Нашелся ручатель за тебе, а коли так - согласен я принять тебя в гильдию.
  mecho _- Долю свою все в казну одинаково вносят, так и тебе придется, когда мастером станешь
  mecho _- И мастерской обзаведешься...
  mecho _- А пока - учись... ремесло наше хоть и почтенное, но не из легких будет.
  wait 1s
  msend %actor% Мастер Ефраим дал вам несколько наставлений по ювелирному искусству.
  msend %actor% Мастер Ефраим дал %actor.vname% несколько наставлений по ювелирному искусству.
  mskillturn %actor.name% ювелир set
  %actor.setquest(49950)%
  %actor.unsetquest(49911)%
  halt
end
mechoaround %actor% Золотых дел мастер внимательно посмотрел на %actor.rname%.
msend %actor% золотых дел мастер внимательно посмотрел на вас.
say Здрав%actor.g% будь.
say Зачем пожаловал?
вопрос .%actor.name%
~
#49920
Разговор с главой златокузнецов~
0 d 1
*~
wait 1
if %speech.contains(пизд)% || %speech.contains(мудак)% || %speech.contains(пидор)% || %speech.contains(пидар)% || %speech.contains(хуй)% || %speech.contains(залуп)% || %speech.contains(ебан)% || %speech.contains(еблан)% || %speech.contains(сран)%
  say А вот сквернословить я тебе позволенья не давал!
  say Эй, стража!
  mecho Откуда ни возьмись появилось несколько здоровенных молодцев с дубинками.
  say Выкиньте-ка отсюда невежу.
  wait 2
  указ .%actor.name%
  mechoaround %actor% Охранники схватили %actor.rname% и выпроводили за порог пинками.
  msend %actor% Охранники схватили вас и, намяв бока, вышвырнули за порог.
  *mteleport %actor% 49957
  %actor.position(6)%
  %actor.wait(3)%
  %actor.hitp(3)%
  halt
end
if %speech.contains(ювелир)% && !%speech.contains(учить)%
  say Хм... Ну да, тут гильдия мастеров златокузнецов, да ювелиров.
  say Ты-то чего хочешь?
  halt
end
if %speech.contains(вступить в гильдию)% || %speech.contains(учить)% || %speech.contains(стать ювелиром)%
  if %actor.class% != 11
    say Извиняй, но у всех мастеров в городе ученики уже есть - едва ли кто из них тебя в обучение примет.
    mecho _- Ступай лучше к кузнецам, или к чеканщикам.
    halt
  end
  eval cens 25 - %actor.remort% / 2
  if %actor.level% < %cens%
    say Рано тебе, пожалуй, к нам в ученики идти. 
    say Ветер у тебя в голове, да мысли о забавах пустых - остепенись сперва.
    halt
  end
  say В гильдию желаешь вступить? Учеником сделаться?
  mecho _- Ну что же, ремесло наше уважаемое и богу угодное.
  mecho _- Только правила у нас строгие, сам понимаешь - золото да камни самоцветные - это тебе не воск да пенька.
  mecho _- Нужно ручательство за тебя от мастера гильдейского
  *mecho  - Не меньше двух ручателей из гильдии должно у тебя быть.
  mecho _- Сделаем так: разошлю я весточки о тебе мастерам киевским, а уж с ними ты сам договаривайся.
  mecho  - Коли поручится кто за тебя - быть тебе учеником, а там, Бог даст, и мастером.
  %actor.setquest(49900)%
  wait 2s
  кив
  say Ступай.
end
~
#49921
Выдача квеста златокузнеца (кража)~
0 q 100
~
wait 1
if !%actor.quested(49900)% || %actor.quested(49901)% || %actor.quested(49911)%
  halt
end
%actor.setquest(49901)%
wait 1s
emot отложил свои дела и повернулся к вам
say Здрав%actor.g% будь, %actor.name%!
mecho _- Прислал мне весточку Ефраим насчет тебя.
wait 2
дум
say Что же - дам я тебе свое поручительство, коли поможешь мне в одном деле.
mecho _- Сделал я серьги золотые, с камнем-яхонтом, цены немалой, по заказу боярина Радонега.
mecho _- Да пропали серьги, а заказчик ждет! Того и гляди явиться работу глядеть - а что я ему скажу?
вздох
wait 3
say Есть у меня подозрение, что вор - это приказчик мой, Елфим.
mecho _- Были у него ключи от шкатулки, в которой серьги хранились.
mecho _- И видели его выходящим из дома, когда он в лавке быть должен.
mecho _- Так-то он работник справный да честный, но не в себе что-то с недавних пор.
wait 2
say Найди мне вора, верни серьги, вот тогда и поговорим!
wait 2s
say Да, вот еще... Дом его в посаде киевском, в ремесленном конце, что к закату от ворот Львовских.
emot занялся своим делом
~
#49922
Вошли к приказчику~
0 q 100
~
wait 1
if !%actor.quested(49901)% || %actor.quested(49902)%
  halt
end
mecho При виде вас приказчик побледнел и затрясся.
say Тебе, верно, мастер прислал?
say Сделай милость, не губи, дозволь слово молвить!
%actor.setquest(49902)%
~
#49923
Разговор с приказчиком~
0 d 1
говори рассказывай слушаю~
if %self.fighting% || !%actor.quested(49902)% ||  %actor.quested(49903)%
  halt
end
%actor.setquest(49903)%
wait 2
say Да, я украл серьги. Нужда заставила!
рыда
say Задолжал я лихому человеку, Калинке Лаптю, а отдавать нечем!
mecho _- Я уже и раздобыл было денег, да немного не хватало.
mecho _- И пригрозил он мне - верни долг, или самого на торгах продадут!
wait 2s
say Вот и взял я серьги, как залог отдать, всего-то на два дня.
mecho _- А кузнец возьми да заметь пропажу...
mecho _- Виноват я, но молю - поговори с Калинкой, может он тебя послушает, вернет серьги?
wait 2
say Калинка чаще пивом лакомится в кабаках у южных ворот, там и ищи его.
~
#49924
Вход к Калинке после разговора с приказчиком~
0 q 100
~
wait 1
if !%actor.quested(49903)% || %actor.quested(49904)% || %self.fighting%
  halt
end
%actor.setquest(49904)%
ухм .%actor.name%
say А-а, вот и гости к нам богатые да грозные.
say Что, биться будем, или о деле говорить?
~
#49925
Диалог с Калинкой~
0 d 1
драться биться говорить говори куплю выкуплю~
if !%actor.quested(49904)% || %self.fighting%
  halt
end
switch %speech%
  case драться
    case биться
      if %actor.quested(49907)%
        wait 1s
        смех
        say Ступай своей дорогой.
        halt
      end
      say Ну, сам того пожелал%actor.g%!
      mkill %actor%
    break
    case говори
      case говорить
        if %actor.quested(49905)%
          halt
        end
        %actor.setquest(49905)%
        wait 2
        say Вот и я так думаю, что всегда лучше сначала поговорить.
        ухм
        wait 2s
        say Значит так - знаю я, что тебе нужно. 
        mecho _- Вижу, ты слушать готов, так вот тебе мое слово:
        mecho _- Приказчик мне должен, и должен немало.
        mecho _- Но нехорошо будет, если я тебя заставлю чужие долги платить.
        mecho _- Или выкупишь серьги?
        вопрос .%actor.name%
      break
      case куплю
        case выкуплю
          if !%actor.quested(49905)% || %actor.quested(49906)%
            halt
          end
          %actor.setquest(49906)%
          wait 2
          say Ну, тогда выкладывай серебро, долг за ним - десять тысяч кун.
        break
      done
~
#49926
Выкуп сережек у Калинки~
0 m 1
~
if !%actor.quested(49906)% || %actor.quested(49907)%
  wait 2s
  вопрос .%actor.name%
  say Здрав будь, да и за подарок спасибо.
  ухм
  say Куны лишними не бывают.
  halt
end
if %amount% < 10000
  хмур
  say Эк ты как... 
  mecho _- Хочешь верь, хочешь нет, а счету я обучен.
  mecho _- Десять тысяч кун серебром - и ни куной меньше!
  give %amount% кун %actor.name%
  halt
end
%actor.setquest(49907)%
wait 2
кив
say По рукам
mload obj 49959
give questitem49901 .%actor.name%
mecho _Калинка Лапоть одним глотком осушил последнюю кружку, и вышел прочь, кинув пару монеток на стол.
wait 1
mpurge %self%
~
#49927
Сдали голову или серьги мастеру~
0 j 100
~
wait 1
switch %object.vnum%
  *голова
  case 49960
    wait 1
    mpurge %object%
    if !%actor.quested(49901)%
      halt
    end
    say Вот как, а серьги не принес? 
    say Успел продать, подлец... 
    if %random.1000% <= 200
      say Но нет работы - нет и награды, ступай себе...
    else
      *засчитано
      say Говорил я о награде - получи обещанное.
      say Поручусь я за тебя пред мастерами.
      %actor.setquest(49911)%
      %actor.unsetquest(49901)%
      %actor.unsetquest(49902)%
      %actor.unsetquest(49903)%
      %actor.unsetquest(49904)%
      %actor.unsetquest(49905)%
      %actor.unsetquest(49906)%
      %actor.unsetquest(49907)%
    end
  break
  *серьги
  case 49959
    wait 1
    mpurge %object%
    if !%actor.quested(49901)%
      halt
    end
    %actor.setquest(49909)%
    say Ай молодец, справился, вернул пропажу!
    say Скажи скорей, кто украл?
  break
done
~
#49928
Разговор с мастером после сдачи сережек~
0 d 1
приказчик Елфим вор Калинка ~
if !%actor.quested(49909)%
  halt
end
wait 2s
switch %speech%
  case приказчик
    case Елфим
      say Ах ворюга, ах подлец! Правильно я на него подумал!
      say Вернул ты мне украденное, вижу, можно за тебя поручиться!
    break
    case вор
      case Калинка
        %actor.setquest(49910)%
        say Вот оно что, значит зря я на приказчика думал.
        mecho _- Калинка этот давно на мою работу зарился,
        mecho _- Все грозился меня обокрасть, дураком выставить.
        mecho _- Вот, возьми от меня с благодарностью 
        wait 1s
        *помимо поручительства дает плюшку, куны или камешек из редких
        switch %random.7%
          case 1
            case 2
              mload obj 906
              give кам .%actor.name%
            break
            case 3
              mload obj 908
              give кам .%actor.name%
            break
            default
              %self.gold(3000)%
              give 3000 кун .%actor.name%
            done
          break
        done
        %actor.setquest(49911)%
        %actor.unsetquest(49901)%
        %actor.unsetquest(49902)%
        %actor.unsetquest(49903)%
        %actor.unsetquest(49904)%
        %actor.unsetquest(49905)%
        %actor.unsetquest(49906)%
        %actor.unsetquest(49907)%
        %actor.unsetquest(49909)%
~
#49929
Охранник неуязвим~
0 l 75
~
%self.hitp(%self.maxhitp%)%
~
#49930
Разговор с мастером Саватеем (квест на провожание в Галич)~
0 q 100
~
wait 1
if !%actor.quested(49900)% || %actor.quested(49914)% || %actor.quested(49913)%
  halt
end
%actor.setquest(49914)%
wait 1s
say Здравствуй-здравствуй %actor.name%!
mecho _- Ефраим говорил уже о тебе.
дум
wait 2s
say Что же, есть у меня работа для тебя, непростая.
mecho _- Для работы этой не только сила, но и ум немалый нужен.
mecho _- Коли выполнишь ее - я смогу за тебя поручиться.
wait 3s
say Попусту хвалиться не люблю, но всем ведомо - никто лучше меня в Киеве брони не делает!
mecho _- Из дальних стран приезжают на мою работу посмотреть, броню надежную прикупить.
mecho _- Был давеча купец из Галича, заказал мне кольчугу, в подарок сыну тамошнего князя.
mecho _- Кольчуга не простая, золотом и камнями самоцветными украшенная, а прочность...
mecho _- Ну, я говорил - никто лучше меня не делает!
mecho _- Ну и цена у нее куда как не малая.
wait 2s
say Повезет ту кольчугу мой подмастерье, с ним охранник будет.
mecho _- Ты же должен проследить, чтобы никто им не помешал. 
mecho _- От силы оружной рукой оградить, от коварства - словом нужным.
wait 1s
say Ну что - берешься?
вопрос %actor.name%
~
#49950
Телепортит в Корсунь~
2 z 100
~
wportal 27031 2
~
#49951
Телепортит в Муром~
2 z 100
~
wportal 76083 2
~
#49952
Телепортит в Брянск~
2 z 100
~
wportal 66034 2
~
#49953
Волхв сообщает о стоимости маг.врат~
0 q 100
~
wait 1
msend %actor% Волхв сказал тебе:
msend %actor% - Здраве тебе, %actor.name%!
msend %actor% - Я могу переместить тебя в некоторые города, естественно, не задаром.
msend %actor% - В Корсунь перенесу за 1100 кун.
msend %actor% - В Брянск - подороже возьму, 3500 кун.
msend %actor% - Можешь еще в Муром отправиться, но тогда 5200 кун не пожалей.
~
#49954
Волхв ставит врата куда просят~
0 m 1
~
wait 1
emot пересчитал монеты и спрятал их в карман
eval target 0
switch %amount%
  *Корсунь
  case 1100
    eval target 27031
  break
  *Муром
  case 5200
    eval target 76083
  break
  *Брянск
  case 3500
    eval target 66034
  break
  default
    msend %actor% - Спасибо за деньги, но я не знаю, куда тебя переместить за такую сумму. 
    msend %actor% - Hо куны не верну... Знай, что творишь.
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
#49997
Самоуничтожение пентаграммы~
0 n 100
~
mecho Лазурная пентаграмма возникла в воздухе.
wait 600s
mecho Лазурная пентаграмма медленно растаяла.
wait 1
mpurge %self%
~
#49998
пентаграмма~
0 c 1
вой войт войти~
wait 1
msend %actor% Ладушки... &RНу, ты сам%actor.g% этого хотел%actor.g%!!!&n
mechoaround %actor% %actor.name% исчез%actor.q% в пентаграмме.
switch %random.20%
  case 1
    mteleport %actor% 61663 horse
  break
  case 2
    mteleport %actor% 80662 horse
  break
  case 3
    mteleport %actor% 35174 horse
  break
  case 4
    mteleport %actor% 61304 horse
  break
  case 5
    mteleport %actor% 33545 horse
  break
  case 6
    mteleport %actor% 86126 horse
  break
  case 7
    mteleport %actor% 76580 horse
  break
  case 8
    mteleport %actor% 89900 horse
  break
  case 9
    mteleport %actor% 145000 horse
  break
  case 10
    mteleport %actor% 38383 horse
  break
  case 11
    mteleport %actor% 67232 horse
  break
  case 12
    mteleport %actor% 14525 horse
  break
  case 13
    mteleport %actor% 25531 horse
  break
  case 14
    mteleport %actor% 38573 horse
  break
  case 15
    mteleport %actor% 86621 horse
  break
  case 16
    mteleport %actor% 76338 horse
  break
  case 17
    mteleport %actor% 76108 horse
  break
  case 18
    mteleport %actor% 29233 horse
  break
  case 19
    mteleport %actor% 80887 horse
  break
  case 20
    mteleport %actor% 30300 horse
  break
done
log %actor.name% вошел в пенту! :)
~
#49999
Описание квестов в 499 зоне~
0 g 100
~
49900 - метка о начале квеста златокузнецов (разговор с главой гильдии)
49901 - метка о выдаче квеста на расследование кражи (49900 не снимается)
49902 - квестер вошел к приказчику
49903 - квестер поговорил с приказчиком
49904 - квестор входил к лихому
49905 - квестор разговаривал с лихим
49906 - квестор согласен выкупить серьги
49907 - квестор выкупил серьги
49909 - квестор сдал серьги
49910 - квестор назвал виновным вора
49911 - завершение квеста, если мастер согласен поручиться (метки 49901-49910 стираются в любом случае)
49912 - метка о награде приказчика (если приказчик оправдан)
~
$~
