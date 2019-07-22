#6000
на чуже~
0 r 100
~
tell %actor.name% Не подскажете, люди добрые, как добраться до библиотеки?
ухмылка
~
#6001
на чуже1~
0 d 100
*~
if %speech.contains(запад)%
  wait 3
  tell %actor.name% Спасибо!
  умница %actor.name%
endif
~
#6002
триггер на знахаре ~
0 j 100
труп~
wait 1
switch %object.name%
  case труп таракана
    say  Еще одним гадом меньше! Молодец, продолжай дальше, держи премию.
    %self.gold(+1)%
    дать 1 кун %actor.name%
    mpurge %object%
  break
  case труп клопа
    say  Еще одним гадом меньше! Молодец, продолжай дальше, держи премию.
    %self.gold(+1)%
    дать 1 кун %actor.name%
    mpurge %object%
  break
  case труп моли
    say  Еще одним гадом меньше! Молодец, продолжай дальше.
    mload obj 101
    дать ломоть %actor.name%
    mpurge %object%
  break
  case труп блохи
    say  Еще одним гадом меньше! Молодец, продолжай дальше.
    mload obj 101
    дать ломоть %actor.name%
    mpurge %object%
  break
  case труп серой мыши
    say  О, грызун, разносчик заразы! Получи премию.
    %self.gold(+5)%
    дать 5 кун %actor.name%
    mpurge %object%
  break
  default
    say  Зачем мне это?
    eval getobject %object.name%
    if  %getobject.car% == труп
      mpurge %object%
    else
      броси %getobject.car%.%getobject.cdr%
    end
  break
done
~
#6003
триггер на охотнике ~
0 j 100
труп~
wait 1
switch %object.name%
  case труп белки
    say  Из белки хорошая шкурка получится, продам потом иноземцу!
    улыб
    %self.gold(+10)%
    дать 10 кун %actor.name%
    mpurge %object%
  break
  case труп бобра
    say  Из бобра шикарная шкурка получится, продам потом иноземцу!
    %self.gold(+75)%
    дать 75 кун %actor.name%
    mpurge %object%
  break
  case труп рыси
    say  Из рыси шикарная шкурка получится, продам потом иноземцу!
    %self.gold(+100)%
    дать 100 кун %actor.name%
    mpurge %object%
  break
  case труп волка
    say  О ты убил волка! Это опасно, их целая стая!
    %self.gold(+20)%
    дать 20 кун %actor.name%
    mpurge %object%
  break
  default
    say  Зачем мне это?
    eval getobject %object.name%
    if  %getobject.car% == труп
      mpurge %object%
    else
      броси %getobject.car%.%getobject.cdr%
    end
  break
done
~
#6004
входнарентухая~
0 r 100
~
wait 1
set factor %self.people%
while %factor%
  set pc %factor.next_in_room%
  if (%factor.vnum% == -1) && (%factor.level%>19) && (%factor.level%<31)
    if %factor.sex%==1
      tell %factor.name% Вырос ты уже, нечего тебе здесь штаны просиживать.
    else
      tell %factor.name% Выросла ты уже, нечего тебе здесь юбку просиживать.
    end
    tell %factor.name% Не пушу я тебя здесь на постой, иди в город, там где большие нужны.
    tell %factor.name% А от вас только проблемы здесь будут.
    mechoaround %factor% Хозяйка вытолкнула %factor.rname% в трактир.
    msend %factor.name% Хозяйка вытолкнула вас в трактир.
    mteleport %factor.name% 6000
    if %factor.sex%==1
      mat 6000 mechoaround %factor% Немного взлохмоченный %factor.name% пришел сверху.
    else
      mat 6000 mechoaround %factor% Немного взлохмаченная %factor.name% пришла сверху.
    end
  end
end
if %pc%
  makeuid factor %pc.id%
else
  set factor 0
end
done
~
#6005
нападениежителя~
0 k 100
~
г %actor.name%, у нас найдется управа на таких обидчиков!
msend %actor% Вдруг прибежал здоровый парень и оглушил вас.
mechoaround %actor% Прибежал здоровый парень, оглушил %actor.rname% и куда-то уволок.
wait 1
msend %actor% Вы потеряли сознание.
wait 1
msend %actor.name% Вы пришли в сознание в глубокой яме от удара о землю.
if %actor.hitp%>0
  msend %actor.name% Кто-то сверху сильно ругнулся, помянул всех ваших родственников до десятого колена.
  msend %actor.name% Кто-то сверху сказал: Посиди здесь пока не успокоишься.
  msend %actor.name% Да, если хочешь выйти говори: простите меня дурака, может и выпущу.
  mteleport %actor% 6050
  mat 6050 mechoaround %actor% Решетка в яме открылась и %actor.name% упал сверху в яму.
  mat 6050 mechoaround %actor% Кто-то сильно ругнулся, помянул всех родственников %actor.rname% до десятого колена.
  mat 6050 mechoaround %actor% Кто-то сверху сказал: 
  mat 6050 mechoaround %actor% Посиди здесь пока не успокоишься.
  wait 1
  if %actor.sex%==1
    mat 6050 mechoaround %actor% Да, слушай внимательно!
    mat 6050 mechoaround %actor% Если хочешь выйти говори: простите меня дурака, может и выпущу.
    mat 6050 mechoaround %actor% Для непонятливых, надо набирать: г простите меня дурака
    mat 6050 mechoaround %actor% И выпустят скорее всего не с первого раз.
  else
    mat 6050 mechoaround %actor% Да, слушай внимательно!
    mat 6050 mechoaround %actor% Если хочешь выйти говори: простите меня дуру, может и выпущу.
    mat 6050 mechoaround %actor% Для непонятливых, надо набирать: г простите меня дуру
    mat 6050 mechoaround %actor% И выпустят скорее всего не с первого раз.
  endif
end
~
#6006
выходаизямы~
2 d 0
"простите меня дурака" "простите меня дуру"~
wait 1
if %random.10%<2
  wecho Решетка в яме открылась, оттуда показалась здоровенная полубритая физиономия.
  wecho Ладно, хватит хныкать, выпущу!
  wecho В следующий раз думай, прежде чем жителей обижать наших!
  if %actor.hitp%>0
    wteleport %actor.name% 6020
    wat 6020 wechoaround %actor% К решетке подошел здоровый парень, открыл замок.
    wat 6020 wechoaround %actor% Поднял решетку и одним движением вытащил кого-то.
    wat 6020 wechoaround %actor% Снова повесил массивный замок.
    wat 6020 wechoaround %actor% %actor.name% размял кости, похоже в яме ему было неудобно.
  end
else
  wechoaround %actor% Никто не прореагировал на слова %actor.rname%.
  wsend %actor% Никто не прореагировал на ваши слова.
  wsend %actor% Наверное не очень искренне все прозвучало, повторите с чувством.
end
~
#6007
халявнаякормежка~
0 r 100
~
if ((%actor.level% >= 10) || (%actor.bank% >= 20))
  halt
end
wait  1
msend %actor% Женщина сказала Вам:
msend %actor% - Эх ты горемычн%actor.w%, голодн%actor.w% наверное, %actor.name%.
msend %actor% - Что мы нехристи чтобы не накормить. 
msend %actor% - Сейчас, подожди...
dg_cast 'насыщение' .%actor.name%
~
#6008
встречает молодой следопыт~
0 r 100
~
*встречамолодой | Mobiles | Great-All PC | 100
tell %actor.name% Если хочешь выбраться отсюда, могу помочь!
tell %actor.name% Знаю о таких дорогах, что пройдем, никто и не заметит!
tell %actor.name% Выведу к одной из деревень далеко на севере, у реки!
eval needgold %actor.level%
tell %actor.name% Всего за %needgold% кун!
~
#6009
дать кун молодому следопыту~
0 m 1
~
*дать20молодому | Mobiles | Bribe | 1
if %actor.vnum% != -1
  halt
end
eval needgold %actor.level%
if %amount% < %needgold%
  дать %amount% кун %actor.name%
  tell %actor.name% Нехорошо обманывать!
  плюн
else
  mecho Следопыт быстро заглянул под навес, кому-то что-то сказал на неизвестном языке.
  msend %actor%  Из под навеса вышел совсем молодой следопыт, почти мальчишка и повел Вас за собой.
  mechoaround %actor% Из под навеса вышел совсем молодой следопыт, почти мальчишка и повел %actor.name% за собой.
  mechoaround %actor% %actor.name% уш%actor.y% вместе с проводником.
  mteleport %actor% 5054 horse
  msend %actor% Ваше путешествие окончилось.
  mechoaround %actor% %actor.name% появил%actor.u% с проводником.
end
~
$~
