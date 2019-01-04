#49700
Приветствие~
0 d 0
да~
wait 1
say Приветствую тебя доблесный воин!
wait 1
say Вижу пришел ты сюда проверить силищу свою, богатырскую!
wait 1 
say Хвалю я тебя за это!
wait 2
say Если хочешь выбрать соперника, зверюгу опасную, то скажи "соперник"
say Если скажешь "убрать", я убиру всю нечисть с ристалища.
wait 2
if %actor.name%==Орина
     mecho Вдруг старик вскочил из-за стола и указывая пальцем на Орину заорал &R"Держи читера!"&n
     wait 2
     дум
     wait 2
     mecho Потом он опустился обратно на стул и тихонько произнес "Что я, я нечего это все Эйрар!" 
     wait 1
     буб
end
~
#49701
блокируем выход чармисам~
2 g 100
~
if ( %actor.vnum% > 49700 ) && ( %actor.vnum% < 497999 )
return 0
halt
end
~
#49702
Огромный Орел~
2 z 100
~
wload mob 49718
~
#49703
Дубыня + Горыня + Усыня Змеевичи~
2 z 100
~
wload mob 49708
wload mob 49709
wload mob 49710
~
#49704
Великан Усыня с хранителями~
2 z 100
~
wload mob 49702
wload mob 49703
wload mob 49703
~
#49705
загрузка мобов~
0 d 0
*~
wait 1
if (%actor.vnum% != -1)
halt
end
switch %speech%
case соперник
tell %actor.name% Ну, чтож, вот тебе список кандидатов:
tell %actor.name% 1.  Владыка морской
tell %actor.name% 2.  Владыка морской и 3 шторма
tell %actor.name% 3.  Владыка морской и 6 штормов
tell %actor.name% 4.  Морской ураган
tell %actor.name% 5.  Великанша
tell %actor.name% 6.  Великанша + сыновья
tell %actor.name% 7.  Дракула
tell %actor.name% 8.  Алконост
tell %actor.name% 9.  Великан Дубыня с хранителями
tell %actor.name% 10. Великан Горыня с хранителями
tell %actor.name% 11. Великан Усыня с хранителями
tell %actor.name% 12. Дубыня + Горыня + Усыня Змеевичи
tell %actor.name% 13. Огромный орел 
tell %actor.name% Чтобы сражаться скажи: "&Rбиться <номер>&C"&n
break
case убрать
emote щелкнул пальцами
calcuid arena 49713 room
exec 49716 %arena.id%
say Ристалище свободно.
break
done
if %speech.contains(биться)%
if %world.people(49713)% != 0 
руг
wait 2  
say Не справитесь вы с такой толпой!
halt
end
if %speech.contains(13)%
emote щелкнул пальцами
calcuid arena 49713 room
exec 49702 %arena.id%
say Огромный орел ждет вас на ристалище.
elseif %speech.contains(12)%
emote щелкнул пальцами
calcuid arena 49713 room
exec 49703 %arena.id%
say Дубыня, Усыня, Горыня Змеевичи ждут вас на ристалище.
elseif %speech.contains(11)%
emote щелкнул пальцами
calcuid arena 49713 room
exec 49704 %arena.id%
say Великан Усыня с хранителями ждут вас на ристалище.
elseif %speech.contains(10)%
emote щелкнул пальцами
calcuid arena 49713 room
exec 49706 %arena.id%
say Великан Горыня с хранителями ждут вас на ристалище.
elseif %speech.contains(9)%
emote щелкнул пальцами
calcuid arena 49713 room
exec 49707 %arena.id%
say Великан Дубыня с хранителями ждут вас на ристалище.
elseif %speech.contains(8)%
emote щелкнул пальцами
calcuid arena 49713 room
exec 49708 %arena.id%
say Алконост ждет вас на ристалище.
elseif %speech.contains(7)%
emote щелкнул пальцами
calcuid arena 49713 room
exec 49709 %arena.id%
say Дракула ждет вас на ристалище.
elseif %speech.contains(6)%
emote щелкнул пальцами
calcuid arena 49713 room
exec 49710 %arena.id%
say Великанша и сыновья ждут вас на ристалище.
elseif %speech.contains(5)%
emote щелкнул пальцами
calcuid arena 49713 room
exec 49711 %arena.id%
say Великанша ждет вас на ристалище.
elseif %speech.contains(4)%
emote щелкнул пальцами
calcuid arena 49713 room
exec 49712 %arena.id%
say Морской ураган ждет вас на ристалище.
elseif %speech.contains(3)%
emote щелкнул пальцами
calcuid arena 49713 room
exec 49713 %arena.id%
say Владыка морской и 6 штормов ждут вас на ристалище.
elseif %speech.contains(2)%
emote щелкнул пальцами
calcuid arena 49713 room
exec 49714 %arena.id%
say Владыка морской и 3 шторма ждут вас на ристалище.
elseif %speech.contains(1)%
emote щелкнул пальцами
calcuid arena 49713 room
exec 49715 %arena.id%
say Владыка морской ждет вас на ристалище.
else
say Я не понял, с кем вы хотите сражаться?
вопрос %actor.name%
end
end
end
~
#49706
Великан Горыня с хранителями~
2 z 100
~
wload mob 49707
wload mob 49706
wload mob 49706
~
#49707
Великан Дубыня с хранителями~
2 z 100
~
wload mob 49705
wload mob 49704
wload mob 49704
~
#49708
Алконост~
2 z 100
~
wload mob 49719
~
#49709
Дракула~
2 z 100
~
wload mob 49701
~
#49710
Великанша + сыновья~
2 z 100
~
wload mob 49711
wload mob 49712
wload mob 49713
wload mob 49714
~
#49711
Великанша~
2 z 100
~
wload mob 49711
~
#49712
Морской ураган~
2 z 100
~
wload mob 49717
~
#49713
Владыка морской и 6 штормов~
2 z 100
~
wload mob 49715
wload mob 49716
wload mob 49716
wload mob 49716
wload mob 49716
wload mob 49716
wload mob 49716
~
#49714
Владыка морской и 3 шторма~
2 z 100
~
wload mob 49715
wload mob 49716
wload mob 49716
wload mob 49716
~
#49715
Владыка морской~
2 z 100
~
wload mob 49715
~
#49716
удаление мобов~
2 z 100
~
if %self.pc%
halt
end
wecho Что-то ослепительно полыхнуло, и вас окружило пламя!
wait 1
wpurge
~
$~
