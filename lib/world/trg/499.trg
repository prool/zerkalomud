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
      Mload obj 60061
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
say Вы не знаете, есть тут поблизости лавка из тех, что подержаными вещами торгуют?
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
 say Зачем ты мне это принес%actor.q%?
 бросить %object.name%
 halt
elseif %object.vnum%  == 91522
remote actor %self.id%
remote object %self.id%
exec 91536 %self.id%
wait 1s
halt
 end
wait 1
mpurge %object%
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
~
$~
