#68800
шпион говорит с игроком~
0 r 100
~
wait 5
msend %actor% _Шпион:
msend %actor% _- Эй ты! 
msend %actor% _- А ну как погодь.
msend %actor% _- У меня к тебе дело есть...
msend %actor% _- Хорошо оплачиваемое.
msend %actor% _- Ты человек здесь новый, неприметный.
msend %actor% _- Тебе будет легче справиться с этой работенкой.
wait 10
msend %actor% _- Ну как, желаешь подзаработать?
~
#68801
шпион выдает квест~
0 d 0
да помогу хорошо продолжай~
wait 10          
detach 68800 %self.id%
set quester %actor%
global quester
msend %actor% _Шпион:
msend %actor% _- Я знал, что ты согласишься.
msend %actor% _- Думаю, лишние деньги тебе бы пригодились.
wait 10
msend %actor% _- Так вот слушай, что тебе предстоит сделать.
msend %actor% _- В крепости есть воевода.
msend %actor% _- У него есть бронзовый колт, который нужен моему хозяину.
msend %actor% _- Если ты принесешь мне его, я щедро вознагражу тебя
wait 10
msend %actor% _- Думаю, это все, что тебе стоит знать.
msend %actor% _- Иди же.  
detach 68801 %self.id%
~
#68802
шпион принимает колт~
0 j 100
~
if %actor.iname% == %quester.iname%
if %object.iname% == Бронзовый колт
wait 1 
mpurge колт
msend %actor% _Шпион:
msend %actor% _- Вот молодчина!
msend %actor% _- Не ожидал я от тебя такой прыти.
msend %actor% _- Вот тебе твоя награда, за такой нелегкий труд.
switch %random.5%
case 1
if %world.curobjs(68808)% < 15 
msend %actor% _- Вот тебе монетка, которую я всегда ношу с собой.
msend %actor% _- С помощью ее всегда можно разрешить спор, не прибегая к насилию.
msend %actor% _- Пусть она принесет тебе удачи.
mload obj 68808    
дать монетк %actor.iname%
end
break
case 2
if %world.curobjs(68809)% < 15
msend %actor% _- Вот держи-ка этот кинжал.
msend %actor% _- С его помощью, можно убить противника
msend %actor% _- Ни издав при этом ни малейшего шума.
mload obj 68809    
дать кинж %actor.iname%
end
case 3
if %world.curobjs(68810)% < 15
msend %actor% _- Вот тебе мой пояс.
msend %actor% _- Его шипы помогут тебе в битве и нанесут дополнительные раны твоему врагу.
mload obj 68810    
дать пояс %actor.iname%
end
break
default
msend %actor% _- Вот, держи этот мешочек кун.
msend %actor% _Шпион дал Вам небольшую горсть кун.
msend %actor% _Это составило 500 кун.
%actor.gold(+500)%
mechoaround %actor% _Шпион дал небольшую кучку кун %actor.dname%.
break
done
else
msend %actor% _- На кой нужна мне эта дрянь?
msend %actor% _- Куда я, по-твоему, должен ее деть?!
брос %object.iname%
end 
else
msend %actor% _- Слушай!
msend %actor% _- Я не помню тебя.
msend %actor% _- Зачем ты суешь мну эту дрянь?
msend %actor% _- Подставить меня хочешь?!
брос %object.iname%
end
~
#68803
поскрыпывают ворота~
2 e 25
~
wecho _Ворота жалобно заскрипели и немного покосились.
~
#68804
бросили монетку~
1 h 100
~
wait 10
oechoaround %actor% _%actor.iname% подбросил%actor.g% и она звонко упала на землю. 
osend %actor% _Вы подбросили монетку и она звонко упала на землю.
switch %random.2%
case 1
oecho _На монетке выпала сторона с изображением всадника.
break
case 2
oecho _На монетке выпала сторона с изображением пятиглавого огнедышащего змея.
break
done
~
#68805
РЕПОП~
2 f 100
~
calcuid fromob 68824 mob
attach 68800 %fromob.id%
attach 68801 %fromob.id%
calcuid fromob 68818 mob
attach 68806 %fromob.id%
attach 68807 %fromob.id%
calcuid fromob 68803 mob
attach 68809 %fromob.id%
attach 68810 %fromob.id%
~
#68806
кладовщик приветствует~
0 r 100
~
wait 10
msend %actor% _Кладовщик:
msend %actor% _- Привет путешественник.
msend %actor% _- Не желаешь ли заработать немного кун?
msend %actor% _- Работенка не пыльная и очень легкая?
msend %actor% _- Ну как, ты согласен?
~
#68807
кладовщик дает задание~
0 d 0
да помогу хорошо~
wait 1
detach 68806 %self.id%
msend %actor% _Кладовщик:
msend %actor% _- Вот и отлично.
msend %actor% _- Вот тебе мешочек.  
mload obj 68817
дать меш %actor.iname%
msend %actor% _- Отнеси его отроку в дом воеводы.
msend %actor% _- Он же тебе и заплатит за работу.
msend %actor% _- И поторопись!
detach 68807 %self.id%
~
#68808
отрок принимает мешочек и дает куны~
0 j 100
~
if %object.iname% == маленький мешочек
wait 1
mpurge мешочек
msend %actor% _Шустрый отрок:
msend %actor% _- Отлично!
msend %actor% _- Как раз вовремя.
msend %actor% _- Я уж начал думать, что этот старый пень ни кого не пошлет сюда.
msend %actor% _- Спасибо тебе за помощь.
wait 6
msend %actor% _Отрок покопался в темном углу и дал вам стальной ключик.
msend %actor% _- На смотровой башне есть сундук.
msend %actor% _- Все его содержимое - теперь твое.
mechoaround %actor% _Отрок покопался в темном углу и %actor.dname% стальной ключик.
mload obj 68813
дать ключик %actor.iname%
else  
wait 5
msend %actor% _- Хм. Это мне не нужно.
msend %actor% _- Поэтому оставь это себе!
дать %object.iname% %actor.iname%
end
~
#68809
воевода приветствует~
0 r 100
~
wait 5
msend %actor% _Воевода:
msend %actor% _- Привет тебе, странник.
msend %actor% _- Рад видеть здесь хороших людей.
msend %actor% _- Вижу ты очень устал%actor.g% с дороги.
msend %actor% _- Но все же не откажешь ли ты мне в небольшой услуге?
msend %actor% _- Поможешь ли ты старому человеку?
~
#68810
воевода дает задание~
0 d 0
да помогу хорошо продолжай~
wait 5 
detach 68809 %self.id%
msend %actor% _Воевода:
msend %actor% _- Вот и ладушки.
msend %actor% _- Недавно, я совершая обход по лагерю, потерял свой браслет.
msend %actor% _- Я долго узнавал у воинов, куда он мог деться.
msend %actor% _- Но все только разводят руками.
wait 10
msend %actor%  - Подозреваю, что его кто-то куда-то спрятал и решил оставить себе.
msend %actor% _- Если ты найдешь его, я не постою за наградой.
detach 68810 %self.id%
~
#68811
воеводе дали браслет~
0 j 100
~
if %object.vnum% == 68818
wait 1
mpurge %object%
msend %actor% _Воевода:
msend %actor% _- Ты все же смог%actor.g% найти его!
msend %actor% _- А я уже и не надеялся.
msend %actor%  - Я не желаю знать, кто уволок его, но ты заслужил%actor.g% награду. 
wait 5
if %exist.obj(68807)%
сн колт
дать колт %actor.iname%
msend %actor% _- Вот, думаю это щедрая награда.
msend %actor% _- Пусть он защитит тебя.
else
msend %actor% Воевода дал вам пригоршню монет.
msend %actor% ...Но увы - все до одной они оказались неясно чьей чеканки :(
end
else                                   
msend %actor% _- Это не моя вещь!
msend %actor% _- Она мне не нужна.
брос %object.iname%
end
~
$~
