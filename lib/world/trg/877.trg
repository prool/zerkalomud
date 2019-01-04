#87700
утешаем царя~
0 c 1
утешить~
wait 1
if (!%arg.contains(царя)% || ( %actor.vnum% != -1 ))
  msend %actor% _Кого утешить-то?
  halt
end
wait 2s
вздох
wait 3s
г Ох не утешайте меня. Кручина моя безутешна... 
wait 1s
%echo% Царь с невыразимой тоской поглядел на небо.
wait 2s
г Была у меня жена Настасья-золотая коса и два сына - Петр-царевич и Василий-царевич, третьего не успели...
wait 1s
г Пошла раз царица со своими мамушками и нянюшками прогуляться по саду.
г Вдруг налетел Вихрь, подхватил царицу и унес неведомо куда...
г С тех пор хожу сам не свой и не знаю как мне быть.   
wait 2s
if %actor.sex% == 1
  say Не возьмешься ли ты добрый молодец, Настасьюшку мою ненаглядную от Вихря вызволить
else
  say Не возьмешься ли ты красна девица, Настасьюшку мою ненаглядную от Вихря вызволить
end 
mecho _- Да сыновей, кровинушек моих отыскать?!
attach 87701 %self.id%
detach 87700 %self.id%
~
#87701
беремся за дело~
0 d 1
да ага угу конечно возьмусь~
wait 1
if %actor.vnum% != -1
  halt
end
context 877
set hero877 %actor%
worlds hero877
wait 2s
%echo% Лицо царя немного посветлело. 
wait 2s
г Ох, добрый молодец нелегкое это дело!
г Три года прошло, как сыновья мои уехали...
wait 1s
г Возьми вот этого доброго коня и отправляйся в путь, коли решился.
wait 1s
mecho Тут царь, ка-а-а-ак засвител по-молодецки! 
wait 3
mecho Вдали послышался стук копыт.
wait 2
mecho Перед Вами показался конь, да такой чудесный! 
mecho Жизнь можно прожить, а такого коня увидеть не доведется!
mload mob 87701
wait 5
г В добрый путь!
detach 87701 %self.id%
~
#87702
скачем~
0 c 1
вс вск вско вскоч вскочи вскочит вскочить~
context 877
wait 1
if %actor.vnum% != -1
  halt
end
if %actor% != %hero877%
  msend %actor% Добрый конь только фыркнул, да в сторону шагнул.
  return 1
  halt
end
return 0
%actor.wait(5)%
wait 2s 
msend %actor.name% Оседлали Вы доброго коня, да поехали в путь-дорогу. 
mechoaround %actor%_ Оседлал %actor.iname% доброго коня, кивнул Вам - мол поспешайте за мной и поехал в путь дорогу. 
wait 4
%echo% Ехали вы ехали... 
wait 7
%echo% Скоро сказка сказывается...
wait 9 
%echo% Да не скоро дело делается. 
wait 8
%echo% Долго ли коротко, да доехали вы до стеклянной горы.
*foreach victim %self.pc% 
if %actor.rentable%
  mteleport all 87701
end
*done
mteleport %self% 87701
*истощить энергию надобно 
calcuid pered_steklom 87701 room
exec 87703 %pered_steklom.id%  
detach 87702 %self.id%
~
#87703
перед стеклом~
2 z 100
~
wait 1
context 877
%hero877.wait(3)%
wload mob 87738
wload mob 87739
%echo% Из шатров появились две фигуры и лениво направились к вам.
wait 3
%echo% - Здравствуй, %hero877.name%! Ты куда путь держишь? - спросили братья.
wait 2 
wforce %hero877% say Настасью-золотую косу искать, да и вас тоже. 
wait 4
%echo% Братья почесали в затылках, поплевали на траву, переминулись с ноги на ногу. 
wait 3
%echo% - Эх, %hero877.name%, матушкин след мы давно нашли, да на том следу ноги не стоят.
%echo% - Пойди-ка попробуй на эту гору взобраться, а у нас уже моченьки нет.
%echo% - Мы три года внизу стоим, наверх взойти не можем. 
calcuid podsteklom 87704 room 
attach 87704 %podsteklom.id%
~
#87704
под стеклом~
2 c 1
лезть залезть карабкаться взбираться~
wait 1
if %actor.vnum% != -1
  halt
end
if !%arg.contains(наверх)% && !%arg.contains(вверх)% && !%arg.contains(на гору)%
  wsend %actor% _Хорошо-хорошо, только куда?
  halt
end
switch %actor.realroom%
  case 87704
    set targetroom 87733
  break
  case 87733
    set targetroom 87734
    set downroom 87704
  break
  case 87734
    set targetroom 87707
    set downroom 87733
  break
done
eval chanse %random.5%*(%actor.dex%+%actor.str%)
if %chanse% > 200
  switch %random.3%
    case 1
      wait 1  
      wsend %actor% _Подпрыгнув вы ловко ухватились за выступ и полезли по стеклянной горе.
      wait 1
      wsend %actor% _Ваши ноги проскальзывают, но Вы одними руками тянете себя все выше и выше!
      wait 1
      wsend %actor% _Стекло режет Ваши руки! 
      eval dmg %actor.hitp%/7
      wdamage %actor% %dmg%
      wsend %actor% _Но Вы упорно карабкаетесь все выше и выше.
      wteleport %actor.name% %targetroom%
      halt
    break
    case 2
      wait 1 
      wsend %actor% _Подрыгнув вы ловко ухватились за выступ и полезли по стеклянной горе.
      wait 1
      wsend %actor% _Ваши ноги проскальзывают, но Вы одними руками тянете себя все выше и выше!
      wait 1
      wsend %actor% _Стекло режет Ваши руки! 
      eval dmg %actor.hitp%/7 
      wdamage %actor% %dmg% 
      wsend %actor% _Руки предательски скользнули, ноги потеряли опору, но изогнувшись как рысь Вы буквально впились в стекло!
      eval dmg %actor.hitp%/8
      wdamage %actor% %dmg%
      wsend %actor% _И медленно но верно, Вы полезли все выше и выше.
      wteleport %actor.name% %targetroom%
      halt
    break
    case 3
      wait 1 
      wsend %actor% _Подрыгнув вы ловко ухватились за выступ и полезли по стеклянной горе.
      wait 1
      wsend %actor% _Ваши ноги проскальзывают, но Вы одними руками тянете себя все выше и выше!
      wait 1
      wsend %actor% _Стекло режет Ваши руки! 
      eval dmg %actor.hitp%/7 
      wdamage %actor% %dmg% 
      wsend %actor% _Руки предательски скользнули, ноги потеряли опору, и Вы кубарем покатились вниз!
      if %downroom%
        wteleport %actor% %downroom%
        wechoaround %actor% %actor.name% кубарем скатил%actor.u% сверху!
        %actor.position(2)%
      end
      wdamage %actor% 100
      halt
    break 
  done
end 
* II вариант
if %chanse% > 150
  switch %random.4%
    case 1
      wait 1  
      wsend %actor% _Подпрыгнув вы ловко ухватились за выступ и полезли по стеклянной горе.
      wait 1
      wsend %actor% _Ваши ноги проскальзывают, но Вы одними руками тянете себя все выше и выше!
      wait 1
      wsend %actor% _Стекло режет Ваши руки! 
      eval dmg %actor.hitp%/6
      wdamage %actor% %dmg%
      wsend %actor% _Но Вы упорно карабкаетесь все выше и выше.
      wteleport %actor.name% %targetroom%
      halt
    break
    case 2
      wait 1 
      wsend %actor% _Подрыгнув вы ловко ухватились за выступ и полезли по стеклянной горе.
      wait 1
      wsend %actor% _Ваши ноги проскальзывают, но Вы одними руками тянете себя все выше и выше!
      wait 1
      wsend %actor% _Стекло режет Ваши руки! 
      eval dmg %actor.hitp%/7 
      wdamage %actor% %dmg% 
      wsend %actor% _Руки предательски скользнули, ноги потеряли опору, но изогнувшись как рысь Вы буквально впились в стекло!
      eval dmg %actor.hitp%/8
      wdamage %actor% %dmg%
      wsend %actor% _И медленно но верно, Вы полезли все выше и выше.
      wteleport %actor.name% %targetroom%
      halt
    break
    case 3
      wait 1 
      wsend %actor% _Подпрыгнув вы ловко ухватились за выступ и полезли по стеклянной горе.
      wait 1
      wsend %actor% _Ваши ноги проскальзывают, но Вы одними руками тянете себя все выше и выше!
      wait 1
      wsend %actor% _Стекло режет Ваши руки! 
      eval dmg %actor.hitp%/7 
      wdamage %actor% %dmg% 
      wsend %actor% _Руки предательски скользнули, ноги потеряли опору, и Вы кубарем покатились вниз!
      wdamage %actor% 100
      halt
    break
    case 4
      wait 1 
      wsend %actor% _Подпрыгнув вы ловко ухватились за выступ и полезли по стеклянной горе.
      wait 1
      wsend %actor% _Ваши ноги проскальзывают, но Вы одними руками тянете себя все выше и выше! 
      wait 1
      wsend %actor% _Похоже Ваши руки не выдерживают!
      wait 1
      wsend %actor% _ - Нет, не сегодня,- думаете вы, скатываясь кубарем вниз. 
      if %downroom%
        wteleport %actor% %downroom%
        wechoaround %actor% %actor.name% кубарем скатил%actor.u% сверху!
        %actor.position(2)%
      end
      halt
    break  
  done
  halt
end  
* III вариант
if %chanse% > 100
  switch %random.3% 
    case 1
      wait 1  
      wsend %actor% _Подпрыгнув вы ловко ухватились за выступ и полезли по стеклянной горе.
      wait 1
      wsend %actor% _Стекло режет Ваши руки! 
      eval dmg %actor.hitp%/7
      wdamage %actor% %dmg% 
      wait 1
      wsend %actor% _Не в силах превозмочь боль, Вы разжали кровочащие ладони!
      wsend %actor% _Полет был недолгим.
      wdamage %actor% 100  
      halt
    break
    case 2
      wait 1 
      wsend %actor% _Подрыгнув вы ловко ухватились за выступ и полезли по стеклянной горе.
      wait 1
      wsend %actor%  Ваши ноги проскальзывают, но Вы одними руками тянете себя все выше и выше!
      wait 1
      wsend %actor% _Стекло крошиться под вашими ладонями и его осколки больно ранят Вас!
      eval dmg %actor.hitp%/7 
      wdamage %actor% %dmg% 
      wsend %actor% _Руки предательски скользнули, ноги потеряли опору, и Вы кубарем покатились вниз!
      if %downroom%
        wteleport %actor% %downroom%
        wechoaround %actor% %actor.name% кубарем скатил%actor.u% сверху!
        %actor.position(2)%
      end
      wdamage %actor% 100
      halt
    break 
    case 3
      wait 1 
      wsend %actor% _Подпрыгнув вы ловко ухватились за выступ и полезли по стеклянной горе. 
      wait 1
      wsend %actor% _Стекло режет Ваши руки! 
      eval dmg %actor.hitp%/7 
      wdamage %actor% %dmg% 
      wait 1
      wsend %actor% _Ваши ноги проскальзывают, но Вы одними руками тянете себя все выше и выше!
      wait 1
      wsend %actor% _Стекло режет Ваши руки! 
      eval dmg %actor.hitp%/7 
      wdamage %actor% %dmg% 
      wsend %actor% _Руки предательски скользнули, ноги потеряли опору, но изогнувшись как рысь Вы буквально впились в стекло!
      eval dmg %actor.hitp%/8
      wdamage %actor% %dmg%
      wsend %actor% _И медленно но верно, Вы полезли все выше и выше.
      wait 1
      wsend %actor% _Стекло режет Ваши руки! 
      eval dmg %actor.hitp%/7 
      wdamage %actor% %dmg% 
      wsend %actor% _Руки предательски скользнули, ноги потеряли опору, и Вы кубарем покатились вниз!
      wdamage %actor% 100
      halt
    break 
    case 4
      wait 1 
      wsend %actor% _Подрыгнув вы ловко ухватились за выступ и полезли по стеклянной горе.
      wait 1
      wsend %actor% _Ваши ноги проскальзывают, но Вы одними руками тянете себя все выше и выше!
      wait 1
      wsend %actor% _Стекло режет Ваши руки! 
      eval dmg %actor.hitp%/7 
      wdamage %actor% %dmg% 
      wsend %actor% _Руки предательски скользнули, ноги потеряли опору, но изогнувшись как рысь Вы буквально впились в стекло!
      eval dmg %actor.hitp%/8
      wdamage %actor% %dmg%
      wsend %actor% _И медленно но верно, Вы полезли все выше и выше.
      wteleport %actor.name% %targetroom%
    break
  done 
  halt
end 
*IV вариант
wsend %actor% _Подпрыгнув вы ловко ухватились за выступ и полезли по стеклянной горе.
wait 1
wsend %actor% _Ваши ноги проскальзывают, но Вы одними руками тянете себя все выше и выше! 
wait 1
wsend %actor% _Похоже Ваши руки не выдерживают!
wait 1
wsend %actor% _ - Нет, не сегодня,- думаете вы, скатываясь кубарем вниз. 
if %downroom%
  wteleport %actor% %downroom%
  wechoaround %actor% %actor.name% кубарем скатил%actor.u% сверху!
  %actor.position(2)%
  
  
  
end
~
#87705
у стража стеклянных ворот~
0 r 100
~
wait 1
ухм
wait 1
г Приветсвую вас, добры молодцы!
г Спешу огорчить - дальше вы не пройдете.
г Ибо, никому еще из смертных не удалось пройти мимо стража стеклянных ворот!
detach 87705 %self.id%
~
#87706
бой со стражем стеклянных ворот~
0 l 100
~
г Ох, не смогаю я!
wait 1
%echo% Страж улучив момент ударил что есть силы по стеклянным воротам!!!
mdoor 87710 e purge
mdoor 87710 e room 87711
wait 2
mecho \&W _Ворота треснули на несколько осколков. &n
mload mob 87703
mload mob 87703
mload mob 87703
wait 1
mecho \&W _Осколки взмыли вверх, описали круг и кинулись на помощь стражу!&n
detach 87706 %self.id%
~
#87707
медная царевна приветствует~
0 r 100
~
wait 2
if %actor.sex% == 1
  г Здравствуй, добрый молодец, %actor.name%.
else
  г Здравствуй, красна девица, %actor.name%.
end 
г Как же ты сюда попал%actor.g%: своей охотой или неволей?
attach 87708 %self.id% 
detach 87707 %self.id%
~
#87708
медная царевна выдает шарик~
0 d 1
охотой~
wait 2
if %actor.vnum% != -1
  halt
end
msend %actor.name%_ И вы рассказали медной царице, зачем здесь оказались.
mechoaround %actor% _%actor.name% принял%actor.u% рассказывать медной царице, зачем мы здесь оказались.
wait 2  
mecho Тень грусти прокатилась по лицу царевны.
wait 1 
г Не знаю, куда Вихрь унес Настасью-царицу...
г Но недалеко живет моя средняя сестрица, может она тебе скажет.
wait 2
mload obj 87700
г Чтоб не заплутать, да до серебрянного царства дойти, возьми вот это. 
wait 1
дать все .%actor.name%
wait 2
г Покати шарик, он тебе путь-дорогу до средней сестры укажет.
mecho Сказав так, царевна хлопнула в ладоши и исчезла.
wait 1
mpurge %self%
detach 87708 %self.id%
~
#87709
бросаем медный шарик~
1 h 100
~
wait 1
oecho Шарик, звеня, закрутился и весело покатился прочь. 
otransform 87701
wait 2s  
oecho Вы последовали за ним. 
wait 1
foreach victim %self.pc% 
  if (( %victim.realroom% > 87704 ) && ( %victim.realroom% < 87799 ))
    oteleport %victim% 87754 horse
  end
done
calcuid prum 87754 room
exec 87710 %prum.id%
wait 1 
opurge %self%  
~
#87710
идем по медному царству~
2 z 100
~
wait 2s
wecho Шли вы, шли...
wait 5s
wecho Скоро сказка сказывается...
wait 3s
wecho Да не скоро дело делается...
wait 5s
wecho Наконец вы подошли к границе медного царства.
wecho Похоже, путешествие подходит к концу.
wait 3s 
foreach victim %self.pc% 
  wteleport %victim% 87784 horse
done
~
#87711
бросаем серебрянный шарик~
1 h 100
~
wait 1
oecho Серебряное яичко, звеня, закрутилось и весело покатилось прочь. 
otransform 87703
wait 2s  
oecho Вы последовали за ним. 
wait 1
foreach victim %self.pc% 
  if (( %victim.realroom% > 87704 ) && ( %victim.realroom% < 87799 ))
    oteleport %victim% 87755 horse
  end
done
calcuid prum 87755 room
exec 87712 %prum.id%
wait 1 
opurge %self% 
~
#87712
идем по серебрянному царству~
2 z 100
~
wait 2s
wecho Шли вы, шли...
wait 5s
wecho Скоро сказка сказывается...
wait 3s
wecho Да не скоро дело делается...
wait 5s
wecho Наконец вы подошли к границе серебряного царства.
wecho Похоже, путешествие подходит к концу. 
wait 3s 
wteleport all 87727 horse
~
#87713
бросаем золотой шарик~
1 h 100
~
wait 1
oecho Шарик, звеня, закрутился и весело покатился прочь. 
otransform 87705
wait 2s  
oecho Вы последовали за ним. 
wait 1
foreach victim %self.pc% 
  if (( %victim.realroom% > 87704 ) && ( %victim.realroom% < 87799 ))
    oteleport %victim% 87756 horse
  end
done
calcuid prum 87756 room
exec 87714 %prum.id%
wait 1 
opurge %self%    
~
#87714
идем по золотому царству~
2 z 100
~
wait 2s
wecho Шли вы, шли...
wait 5s
wecho Скоро сказка сказывается...
wait 3s
wecho Да не скоро дело делается...
wait 5s
wecho Наконец вы подошли к границе золотого царства.
wecho Похоже, путешествие подходит к концу.
wait 3s 
wteleport all 87736 horse
~
#87715
серебрянная царевна приветствует~
0 r 100
~
wait 2
if %actor.sex% == 1
  г Здравствуй, добрый молодец, %actor.name%.
else
  г Здравствуй, красна девица, %actor.name%.
end 
if %exist.mob(87707)%
  say Уходи скорей, а то явится злой колдун Вихрь и погубит тебя!
  dg_cast 'слов возвр' %actor%
  halt
end
г Как же ты сюда попал%actor.g%: своей охотой или неволей?
attach 87716 %self.id%
detach 87715 %self.id%
~
#87716
серебрянная царевна плачет~
0 d 1
охотой~
wait 2
msend %actor.name%_ И вы рассказали серебряной царевне, зачем здесь оказались.
mechoaround %actor% _%actor.name% принялся рассказывать серебряной царевне, зачем мы здесь оказались.
wait 1s
mecho Царевна вдруг разрыдалась.
wait 3s
г Вот уже три года я сижу здесь в заточении.
г Одна отрада была у меня - по ночам беседовать с братцем моим, Месяцем.
г Прознал про это Вихор и напустил в башню всяку нечисть.
г Теперь живет она там и меня не пускает. 
wait 2s
г Раз ты со змеем о двух головах управился, не изведешь ли нечисть поганую?!
wait 2s
mecho Царевна утерла слезы и взглянула на вас.
attach 87717 %self.id%
detach 87716 %self.id%
~
#87717
беремся извести нечисть~
0 d 1
изведу конечно ага~
wait 1s 
mload obj 87706
г Это ключ от башни. Бог в помощь!
дать ключ .%actor.name% 
attach 87718 %self.id%
detach 87717 %self.id%
~
#87718
серебрянная царевна дает шарик~
0 q 100
~
wait 1
if (%exist.mob(87710)% || %exist.mob(87711)%)
  halt
end
wait 1s
mecho Царевна засияла увидев Вас живыми-невредимыми.
wait 2s
г Не перевелись богатыри на земле русской!!!   
mload obj 87702
wait 1s
г Спасибо тебе, %actor.name%! Да только я помочь тебе не могу.
mecho _- Вот возьми серебряное яичко.
mecho _- Покати его перед собой и ступай за ним следом.
mecho _- Оно доведет тебя до золотого царства, там старшая моя сестра - Елена Прекрасная.
mecho _- Может она поможет тебе.
wait 1s
дать яич %actor.name% 
switch %random.10%
  case 1
    if %world.curobjs(87708)% < 4
      mload obj 87708    
      wait 2s
      mecho Царевна вдруг спохватилась.
      г Ах да...
      ул %actor.name% 
      г Дарую тебе эти наручи из волшебного серебра. Быстрый ум всегда быстрее меча.
      wait 1s
      дать все .%actor.name%       
    else 
      mload obj 87757    
      wait 2s
      mecho Царевна вдруг спохватилась.
      г Ой, чуть не забыла...
      ул %actor.name% 
      г Трать их с умом, да с товарищами не забудь поделиться.
      wait 1s
      дать мешок %actor.name%    
    end 
  break 
  case 2
    if %world.curobjs(87710)% < 4
      mload obj 87709
      wait 2s
      mecho Царевна вдруг спохватилась.
      г Постой...
      ул %actor.name% 
      г Дарую тебе эти поножи из волшебного серебра. Их ослепительный блеск огорчит твоих врагов!
      wait 1s
      дать все %actor.name%   
    else
      mload obj 87757    
      wait 2s
      mecho Царевна вдруг спохватилась.
      г Ой, чуть не забыла...
      ул %actor.name% 
      г Трать их с умом, да с товарищами не забудь поделиться.
      wait 1s
      дать мешок %actor.name%    
    end
  break
  case 3
    if %world.curobjs(87712)% < 3
      mload obj 87712    
      wait 2s
      mecho Царевна вдруг спохватилась.
      г Память-то... девичья!
      ул %actor.name% 
      г Дарую тебе эту волшебную кольчугу. Легкая, но прочная - надежно защитит тельце мага.
      хих
      wait 1s
      дать все %actor.name%   
    else
      mload obj 87757    
      wait 2s
      mecho Царевна вдруг спохватилась.
      г Ой, чуть не забыла...
      ул %actor.name% 
      г Трать их с умом, да с товарищами не забудь поделиться.
      wait 1s
      дать мешок %actor.name%    
    end
  break   
  default 
    mload obj 87757    
    wait 2s
    mecho Царевна вдруг спохватилась.
    г Ой, чуть не забыла...
    ул %actor.name% 
    г Трать их с умом, да с товарищами не забудь поделиться.
    wait 1s
    дать мешок %actor.name%    
  done 
  mecho Сказав так, царевна хлопнула в ладоши и исчезла.
  wait 1
  mpurge %self%
  detach 87718 %self.id%
~
#87719
золотая царевна приветствует~
0 r 100
~
wait 2
if %actor.sex% == 1
  г Здравствуй, добрый молодец, %actor.name%.
else
  г Здравствуй, красна девица, %actor.name%.
end 
if %exist.mob(87708)%
  say Уходи скорей, а то явится злой колдун Вихрь и погубит тебя!
  dg_cast 'слов возвр' %actor%
  halt
end
г Как же ты сюда попал%actor.g%: своей охотой или неволей?
attach 87720 %self.id% 
detach 87719 %self.id%
~
#87720
золотая царевна грустит~
0 d 1
охотой~
wait 2
msend %actor.name%_ И вы рассказали золотой царевне, зачем здесь оказались.
mechoaround %actor% _%actor.name% принялся рассказывать золотой царевне, зачем мы здесь оказались.
wait 2s
mecho Лицо царевны затуманила тень воспоминаний.
say Послушай, добрый молодец...
mecho _- Вот уже три года я здесь в неволе.
mecho _- Дабы развлечь себя, я приглядела неподалеку золотое поле.
mecho _- Там я выращиваю коней-златогривых.
mecho _- Призвала я в помощь цыган, а кто лучше умеет с конями обходиться?
mecho _- А тут с горы - никуда ж не денешься...
wait 3s 
say Но полгода назад, вздыбилась стеклянная гора изнутри...
mecho _- И пришел черный колдун, обосновался в пещере, заколдовал моих цыган!
mecho _- Да так, что они в пещеры жить ушли, а по ночам воруют коней поганцы!
mecho _- Ах если бы ты смог вернуть моих коней, да колдуна с цыганами извести... я...
wait 3s
mecho Царевна так глянула на Вас, что стало понятно - отказать ей вы просто не в силах.
attach 87721 %self.id%
detach 87720 %self.id% 
~
#87721
беремся извести колдуна~
0 d 1
согласен да конечно возьмусь~
wait 1
say Вот и чудно, отправляйтесь немедля!
mecho Царевна хлопнула в ладоши.
ул
mload obj 87763
give ключ .%actor.name%
attach 87736 %self.id%
detach 87721 %self.id%
~
#87722
рипейник~
2 e 100
~
wait 1s
wecho Золотые иглы рипейника, будто ожили и страстно впились в Вас!
foreach target %self.pc%
  eval dmg %target.hitp%/3
  wdamage %target% %dmg%    
done 
wait 2s
foreach target %self.pc%
  eval dmg %target.hitp%/6
  wdamage %target% %dmg%    
done  
wait 2s
wecho Не в силах терпеть дальше эту боль, вы отступили назад.
foreach target %self.pc%
  wforce %target% север
done
~
#87723
прыгаем через рипейник~
0 c 1
вс вск вско вскоч вскочи вскочит вскочить~
* Проверка на комнату должна быть тут 
if %actor.vnum% != -1
  halt
end 
return 0
if %actor.realroom% != 87779
  halt
end
wait 1s
mecho Конь радостно заржал, встал на дыбы.
wait 1s
msend %actor% Конь обернулся к Вам и заговорил! 
tell %actor.name% Правильно ты cделал%actor.g%, %actor.name%, что вскочил%actor.g% на меня, держись теперь крепче!
msend %actor% Конь толкнулся и взлетел, только ветер засвистел в ушах!
mechoaround %actor% Златогривый конь с малость опешившим %actor% на спине взмыл над кустами репейника и скрылся из виду. 
mteleport %actor% 87780 horse
wait 1s
msend %actor% Перелетев через заросли репейника, умное животное встало как вкопанное. 
mforse %actor% south
detach 87723 %self.id% 
~
#87724
у молодого цыгана~
0 q 100
~
wait 2s
mecho Цыган, увидя Ваше внушительное появление, испуганно отпрыгнул.
mecho Цыган молниеносно сдернул нож с пояса и метнул в Вас!
mecho Конь под Вами дернулся, и острый нож вместо сердца, всего лишь полоснул по плечу.
foreach target %self.pc%
  eval dmg %target.hitp%/6
  wdamage %target% %dmg%    
done
wait 2s
mforce %actor% соскоч
mecho Увидев, что вы не желаете ему зла, цыган виновато развел руками.
wait 3s
if %actor.sex% == 1
  г Извини меня, добрый молодец.
else
  г Извини меня, красна девица.
end
mforce %actor% соскоч
mecho _- Долгое время я живу тут совершенно один в постоянном страхе.
mecho _- Черный колдун увел всех в пещеру...
mecho _- Один я случайно избег этой участи.
mecho _- Ах, если б ты взял%actor.u% помочь мне вернуть мой табор!
wait 1s
mecho Молодой цыган разрыдался.  
attach 87725 %self.id%  
detach 87724 %self.id%
~
#87725
цыган квестует~
0 d 1
да согласен согласна возьмусь~
wait 1s
г Ты не подумай, я пытался вызволить свих сородичей
mecho _- Мне даже удалось пробраться в пещеру...
mecho _- Однако, я вынужден был бежать оттуда.
mecho _- Один в поле не воин, так вы кажеться говорите.
mecho Молодой цыган грустно улыбнулся.
wait 1s
г Так вот слушай внимательно:
mecho _- Как спустишься в пещеру, не торопись идти дальше, а подожди и перебей всех соглядатаев.
mecho _- Опосля, иди по левому рукаву пещеры, там тебя никто не тронет.
mecho _- Найди нашего барона, и передай ему вот эту конопляную уздечку.
mecho _- Она должна ему кое-что напомнить, а наш барон - сильный человек, и тогда он скинет злые чары с себя и со своего народа!
mload obj 87732
дать уздеч %actor.name% 
calcuid goldkon 87712 mob
attach 87738 %goldkon.id%
detach 87725 %self.id%
~
#87726
на мосту~
2 e 100
~
wait 2
wecho Внезапно по мосту прошла дрожь.
wecho Дальний конец моста оторвался от бережка.
wecho Мост начал стремительно расти, неся Вас прямо на черные скалы!
if %self.west%
  wdoor 87762 e purge
  wdoor 87763 w purge
  wait 2s
  wdoor 87763 e room 87764
  wdoor 87764 w room 87763
else
  wdoor 87763 e purge
  wdoor 87764 w purge
  wait 2s
  wdoor 87763 w room 87762
  wdoor 87762 e room 87763
end
~
#87727
срываем яблоко~
1 c 4
сорвать~
wait 1
if !%arg.contains(яблоко)%
  osend %actor% Что вы хотите сорвать?
  halt
end
wait 1s 
osend %actor% Вы сорвали яблочко, но будучи криворуким - уронили, и едва не разбили его!
oechoaround %actor% %actor% сорвал%actor.g% яблочко, да так неловко, что выронил%actor.g% его!
wait 2s
oecho Внезапно потемнело небо, воздух огласился страшными криками.
oecho - На чужой каравай - рта не раззевай! - выбежал невесть откуда сторож. 
oload mob 87722
wait 2s 
oecho Сверху послышался лязг и клекот.
oecho И две тени спикировали вниз.
oload mob 87723
oload mob 87723
oload obj 87727
oforce %actor% взять яблоч 
detach 87727 %self.id%
~
#87728
срываем грушу~
1 c 4
сорвать~
wait 1
if !%arg.contains(грушу)%
  osend %actor% Что вы хотите сорвать?
  halt
end
wait 1s
osend %actor% Вы сорвали грушу, но будучи криворуким - уронили, и едва не разбили ее!
oechoaround %actor% %actor% сорвал%actor.g% грушу, да так неловко, что выронил%actor.g% ее!
wait 2s
oecho Внезапно потемнело небо, воздух огласился страшными криками.
oecho - На чужой каравай - рта не раззевай! - выбежал невесть откуда сторож. 
oload mob 87720
wait 2s 
oecho Сверху послышался лязг и клекот.
oecho И две тени спикировали вниз.
oload mob 87721
oload mob 87721
oload obj 87729
oforce %actor% взять груш   
detach 87728 %self.id%
~
#87729
срываем сливу~
1 c 4
сорвать~
wait 1
if !%arg.contains(сливу)%
  osend %actor% Что вы хотите сорвать?
  halt
end
wait 1s
osend %actor% Вы сорвали сливу, но будучи криворуким - уронили, и едва не разбили ее!
oechoaround %actor% %actor% сорвал%actor.g% сливу, да так неловко, что выронил%actor.g% ее!
wait 2s
oecho Внезапно потемнело небо, воздух огласился страшными криками.
oecho - На чужой каравай - рта не раззевай! - выбежал невесть откуда злобный садовник. 
oload mob 87724
wait 2s 
oecho Откуда-то послышался грохот.
oecho И двое бугаев поспешили на помощь садовнику.
oload mob 87729
oload mob 87729
oload obj 87728
oforce %actor% взять слив 
detach 87729 %self.id%
~
#87730
срываем вишенку~
1 c 4
сорвать~
wait 1
if !%arg.contains(вишню)%
  osend %actor% Что вы хотите сорвать?
  halt
end
wait 1s
osend %actor% Вы сорвали вишенку, но будучи криворуким - уронили, и едва не разбили ее!
oechoaround %actor% %actor% сорвал%actor.g% вишню, да так неловко, что выронил%actor.g% ее!
wait 2s
oecho Внезапно потемнело небо, воздух огласился страшными криками.
oecho - Это что еще за проказы!? - выбежал невесть откуда хранитель деревьев. 
oload mob 87726
wait 2s 
oecho Сверху послышался страшный свист.
oecho И две золотые полосы спикировали вниз.
oload mob 87727
oload mob 87727
oload obj 87731
oforce %actor% взять вишн  
detach 87730 %self.id%
~
#87731
срываем персик~
1 c 4
сорвать~
wait 1
if !%arg.contains(персик)%
  osend %actor% Что вы хотите сорвать?
  halt
end
wait 1s
osend %actor% Вы сорвали персик, но будучи криворуким - уронили, и едва не потеряли его!
oechoaround %actor% %actor% сорвал%actor.g% персик, да так неловко, что выронил%actor.g% его!
wait 2s
oecho Внезапно потемнело небо, воздух огласился страшными криками.
oecho - Сейчас кого-то станет меньше! - выбежал невесть откуда садовый охранник. 
oload mob 87725
wait 2s 
oecho Послышался топот мощных лап.
oecho На дорожке показались две огромные псины.
oload mob 87728
oload mob 87728
oload obj 87730
oforce %actor% взять персик   
detach 87731 %self.id%
~
#87732
входим к настасье~
0 r 100
~
wait 1s
mecho Настасья-царевна всплеснула руками, увидев вас.
г Да как же вы сюда добрались?!
if %exist.mob(87709)%
  say Уходи скорей, а то явится злой колдун Вихрь и погубит тебя!
  dg_cast 'слов возвр' %actor%
  halt
end
wait 3s
mecho Настасья испуганно заметалась по палатам.
г Вот сейчас Вирхь, должен вернуться.
г Беги скорей в погреб, выпей из большой бочки.
г В тебе силы молодецкой еще прибавиться!   
mload obj 87733
дать золот %actor.name% 
wait 1s
г СКОРЕЕ ЖЕ!!!
detach 87732 %self.id%
~
#87733
пьем из бочки~
2 c 1
пи пит пить dr dri drin drink~
if !%arg.contains(бочк)%
  wsend %actor% Из чего пить?
  return 1
  halt
end
wait 1s
wsend %actor% Вы отхлебнули из бочки, но магия похоже кончилась...  
wechoaround %actor% %actor% отхлебнул из бочки.  
wecho Послышался дикий свист ветра, и дворец содрогнулся от великанского топота.
wecho В подпол ворвался разгневанный Вихорь!
wload mob 87730
detach 87733 %self.id%
~
#87734
атака осколков~
0 n 100
~
mecho Осколок издал тонкий звук и задрожав ринулся на Вас!
set target %random.pc%
mkill %target%
~
#87735
месяц награждает~
2 z 0
~
* Проверка на день\ночь, и убита ли вся нечисть
wait 1 
if ( %time.hour% > 5 ) && ( %time.hour% < 20 )
  halt
end
if %exist.mob(87710)% || %exist.mob(87711)%
  halt
end
wait 2s
wecho И вот когда звуки боя стихли,
wait 2s
wecho Мягкий лунный свет залил поле битвы.   
wait 2s
wecho И по лунному лучу, Месяц в залу вплыл.   
wload mob 87737
~
#87736
золотая царевна дает шарик~
0 q 100
~
wait 1
if %exist.mob(87719)%
  halt
end
wait 1s
mecho Царевна золотого царства несказанно обрадовалась, увидев Вас живыми-невредимыми.
wait 1s
г Вы спасли моих коней! Ай молодцы! 
wait 1s
г Возьми этот шарик, он приведет тебя в стеклянное царство, там томится Настасья-царевна.
mload obj 87704
дать золо.шар %actor.name%
switch %random.3% 
  case 1
    if %world.curobjs(87746)% < 4
      mload obj 87746
      г За работу ратную прими от меня этот меч.
      дать меч.солн %actor.name% 
    else 
      mload obj 87759
      г Этих денег должно хватить на починку доспехов.
      дать мешок.золо %actor.name%  
    end
  break  
  case 2
    if %world.curobjs(87747)% < 4
      mload obj 87746
      г За работу ратную прими от меня этот знак.
      дать знак.солн %actor.name% 
    else 
      mload obj 87759
      г Этих денег должно хватить на починку доспехов.
      дать мешок.золо %actor.name%  
    end
  break
  default
    mload obj 87759
    г Этих денег должно хватить на починку доспехов.
    дать мешок.золо %actor.name%  
  break
done
mecho Сказав так, царевна хлопнула в ладоши и исчезла.
wait 1
mpurge %self%
detach 87736 %self.id%
~
#87737
даем уздечку барону~
0 j 100
~
wait 1
if %object.vnum% != 87732
  drop %object.name% 
  halt
end
wait 1
mpurge %object%
wait 1s
mecho Старый цыган без интереса уставился на уздечку.
wait 2s
mecho Старый цыган попробовал ее на вкус.
wait 1s
mecho Тень воспоминаний пробежала по его морщинистому лицу.
wait 1s
груст
wait 2s 
mecho Цыганский барон оглядел Вас с головы до пят.
wait 1s
г Страшное приключилось с моим народом...
г Спасибо тебе %actor.name%, что вернул мне разум.
* Убираем агрящих цыганок
while  %exist.mob(87716)%
  calcuid agromob 87716 mob
  mteleport %agromob% 87776
  mpurge %agromob%
  wait 2
done
wait 2s
say К черному колдуну путь держишь? Ну-ну...
mecho _- Силен он, вражина.
mecho _- Дабы отблагодарить тебя, даю тебе в подмогу бойца.
mecho _- Коли есть кому его повести за собой, берите.
wait 1s
mecho Цыганский барон пронзительно свистнул.
wait 1s
mecho Послышался мощный торопливый топот.
wait 1s
mecho Из-за угла пещеры показался здоровый цыган.
mload mob 87732
say Ну, иди же... А мне нужно вывести отсюда своих людей.
wait 1
mpurge %self%
~
#87738
прыгаем обратно через рипейник~
0 c 1
вс вск вско вскоч вскочи вскочит вскочить~
* Проверка на комнату должна быть тут 
if %actor.realroom% != 87780
  msend %actor% Златогривый конь шагнул в сторону.
  return 1
  halt
end
return 0
wait 1s
mecho Конь радостно заржал, встал на дыбы.
wait 1s
mteleport %actor% 87760 horse
wait 1s
msend %actor% Перелетев через заросли репейника, умное животное встало как вкопанное. 
detach 87738 %self.id%
~
#87739
страж горы уничтожен~
0 f 100
~
if (%world.curobjs(87734)% < 3) && (%random.10% <=2)  
  mload obj 87734
elseif (%world.curobjs(87721)% < 3) && (%random.10% <=2) 
  mload obj 87721
end
~
#87740
медный змей уничтожен~
0 f 100
~
eval chanse %world.curobjs(87717)%+22
if (( %random.25% > %chanse% ) || ( %random.100% == 53 ))
  mload obj 87717
end
~
#87741
серебряный змей уничтожен~
0 f 100
~
eval chanse %world.curobjs(87718)%+22
if (( %random.25% > %chanse% ) || ( %random.100% == 53 ))
  mload obj 87718
end
~
#87742
золотой змей уничтожен~
0 f 100
~
eval chanse %world.curobjs(87719)%+22
if (( %random.25% > %chanse% ) || ( %random.100% == 53 ))
  mload obj 87719
end
~
#87743
вытьянка уничтожена~
0 f 100
~
calcuid tower 87723 room
exec 87735 %tower.id%
eval chanse %world.curobjs(87735)%+22
if (( %random.25% > %chanse% ) || ( %random.100% == 53 ))
  mload obj 87735
  halt
end
eval chanse %world.curobjs(87736)%+22
if (( %random.25% > %chanse% ) || ( %random.100% == 53 ))
  mload obj 87736
end
~
#87744
серебряный лучик уничтожен~
0 f 100
~
eval chanse %world.curobjs(87707)%+22
if (( %random.25% > %chanse% ) || ( %random.100% == 53 ))
  mload obj 87707
  halt
end
~
#87745
соглядатай уничтожен~
0 f 100
~
eval chanse %world.curobjs(87738)%+25
if (( %random.28% > %chanse% ) || ( %random.100% == 53 ))
  mload obj 87738
end
eval chanse %world.curobjs(87739)%+25
if (( %random.28% > %chanse% ) || ( %random.100% == 53 ))
  mload obj 87739
end
eval chanse %world.curobjs(87740)%+20
if (( %random.25% > %chanse% ) || ( %random.100% == 53 ))
  mload obj 87740
end
~
#87746
колдун горы уничтожен~
0 f 100
~
eval chanse %world.curobjs(87720)%+10
if (( %random.12% > %chanse% ) || ( %random.100% == 53 ))
  mload obj 87720
  halt
end
~
#87747
индрик уничтожен~
0 f 100
~
eval chanse %world.curobjs(87741)%+20
if (( %random.23% > %chanse% ) || ( %random.100% == 53 ))
  mload obj 87741
end
eval chanse %world.curobjs(87742)%+20
if (( %random.24% > %chanse% ) || ( %random.100% == 53 ))
  mload obj 87742
end
eval chanse %world.curobjs(87744)%+20
if (( %random.24% > %chanse% ) || ( %random.100% == 53 ))
  mload obj 87744
end
~
#87748
Вихорь уничтожен~
0 f 100
~
calcuid nast 87731 mob
attach 87754 %nast.id%
eval chanse %world.curobjs(87743)%+24
if (( %random.27% > %chanse% ) || ( %random.100% == 53 ))
  mload obj 87743
  halt
end
eval chanse %world.curobjs(87745)%+25
if (( %random.28% > %chanse% ) || ( %random.100% == 53 ))
  mload obj 87745
  halt
end
~
#87749
седой сторож уничтожен~
0 f 100
~
eval chanse %world.curobjs(87748)%+20
if %random.23% > %chanse% || %random.100% == 53
  mload obj 87748
end
~
#87750
рыжий сторож уничтожен~
0 f 100
~
eval chanse %world.curobjs(87760)%+26
if (( %random.28% > %chanse% ) || ( %random.100% == 53 ))
  mload obj 87760
end
~
#87751
злобный садовник уничтожен~
0 f 100
~
eval chanse %world.curobjs(87756)%+15
if (( %random.17% > %chanse% ) || ( %random.100% == 53 ))
  mload obj 87756
end
~
#87752
садовый охранник уничтожен~
0 f 100
~
eval chanse %world.curobjs(87761)%+24
if (( %random.28% > %chanse% ) || ( %random.100% == 53 ))
  mload obj 87761
end
~
#87753
хранитель деревьев уничтожен~
0 f 100
~
eval chanse %world.curobjs(87751)%+24
if (( %random.27% > %chanse% ) || ( %random.100% == 53 ))
  mload obj 87751
end
~
#87754
царские шмотки!~
0 q 100
~
wait 1
emot при виде Вас радостно всплеснула руками
wait 1s
say Избавили вы меня от плена злого Вихря.
mecho _- Могу я теперь вернуться домой, но прежде награжу вас за свое спасение.
switch %random.5%
  case 1
    eval chanse %world.curobjs(87753)%+15
    if (( %random.17% > %chanse% ) || ( %random.100% == 53 ))
      mload obj 87753
    else
      mload obj 87759
    end
  break
  case 2
    eval chanse %world.curobjs(87754)%+15
    if (( %random.17% > %chanse% ) || ( %random.100% == 53 ))
      mload obj 87754
    else
      mload obj 87759
    end
  break
  case 3
    eval chanse %world.curobjs(87755)%+15
    if (( %random.17% > %chanse% ) || ( %random.100% == 53 ))
      mload obj 87755
    else
      mload obj 87759
    end
  break
  case 4
    eval chanse %world.curobjs(87756)%+15
    if (( %random.17% > %chanse% ) || ( %random.100% == 53 ))
      mload obj 87756
    else
      mload obj 87759
    end
  break
  case 5
    if (%world.curobjs(3310)% == 0)
      mload obj 3310
    else
      mload obj 87759
    end
  break
  default
    mload obj 87759
  done
  wait 2s
  give all .%actor.name%
  say Возьми вот это на память о стеклянной горе и Настасье-царевне!
  emot хлопнула в ладоши и исчезла
  wait 1
  mpurge %self%
~
#87755
Загрузочный у сторожей~
0 n 100
~
get all.treasure877
~
#87756
Игоша убита~
0 f 100
~
calcuid tower 87723 room
exec 87735 %tower.id%
~
#87757
Загрузочный у месяца~
0 n 100
~
wait 1s 
emot Месяц с улыбкой оглядел всех.
if %random.100% < 35
  mload obj 575
  mecho Молча положил перед вами книгу в змеином переплете, и плавно вылетел в ночь.
end
switch %random.5%
  case 1
    if %world.curobjs(87710)% < 4   
      mecho Молча положил перед вами огромный щит, и плавно вылетел в ночь.
      mload obj 87710  
    else
      mecho Молча положил перед вами кусок лунного камня, и плавно вылетел в ночь.
      mload obj 87758
    end 
  break   
  case 2
    if %world.curobjs(87713)% < 8   
      mecho Молча положил перед вами перстень с крупным камнем, и плавно вылетел в ночь.
      mload obj 87713  
    else
      mecho Молча положил перед вами кусок лунного камня, и плавно вылетел в ночь.
      mload obj 87758
    end 
  break   
  case 3
    if %world.curobjs(87714)% < 5  
      mecho Молча положил перед вами высокий серебряный шлем, и плавно вылетел в ночь.
      mload obj 87714  
    else
      mecho Молча положил перед вами кусок лунного камня, и плавно вылетел в ночь.
      mload obj 87758
    end 
  break
  case 4
    if %world.curobjs(87715)% < 4   
      mecho Молча положил перед вами ожерелье из невиданных камней, и плавно вылетел в ночь.
      mload obj 87715  
    else
      mecho Молча положил перед вами кусок лунного камня, и плавно вылетел в ночь.
      mload obj 87758
    end 
  break 
  default 
    mecho Молча положил перед вами кусок лунного камня, и плавно вылетел в ночь.
    mload obj 87758
  done 
  wait 1
  mpurge %self%
~
#87758
Репоп зоны~
2 f 100
~
context 877
unset hero877
calcuid berg 87704 room
detach 87704 %berg.id%
wdoor 87710 e purge
wdoor 87710 e room 87711
wdoor 87710 e flags abcd
wdoor 87710 e name Ворота
wdoor 87710 e description Ворота
wdoor 87763 e purge
wdoor 87764 w purge
wdoor 87763 w room 87762
wdoor 87762 e room 87763
calcuid podval 87750 room
attach 87733 %podval.id%
wdoor 87707 d purge
wdoor 87702 u purge
calcuid obr 87707 room
attach 87759 %obr.id%
~
#87759
Спускаем лесенку~
2 c 1
прикоснуться притронуться коснуться~
wait 1
if !%arg.contains(лесенке)%
  wsend %actor% К чему вы хотите прикоснуться?
  halt
end
wsend %actor% Вы прикоснулись к серебряной лесенке.
wechoaround %actor% %actor.name% прикоснул%actor.u% к серебряной лесенке.
wecho Внезапно лесенка вздрогнула, и начала расти!
wecho Росла-росла, и вытянулась к самому подножью стеклянной горы.
wdoor 87707 d room 87702
wdoor 87702 u room 87707
wat 87702 wload obj 87768
wat 87702 wecho Тонкая серебряная лесенка вдруг протянулась сверху к подножию горы.
detach 87759 %self.id%
~
#87760
Разбить ворота~
2 cg 1
разбить ударить~
wait 1
if !%arg.contains(ворот)%
  wsend %actor% Что вы хотите разбить?
  halt
end
wait 1
wechoaround %actor% %actor.name% ударил что есть силы по стеклянным воротам!!!
wsend %actor% Вы что есть силы ударили по стеклянным вратам!
wdoor 87710 e purge
wdoor 87710 e room 87711
wait 2
mecho &W_Ворота треснули на несколько осколков.&n
wload mob 87703
wload mob 87703
wload mob 87703
wait 1
detach 87706 %self.id%
~
$~
