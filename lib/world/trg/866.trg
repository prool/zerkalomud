#86600
портал~
2 e 100
~
wait 5s
wportal 86659 2
wecho  &yВзрываясь тысячами молний портал ярко вспыхнул в непроглядной мгле.&n
~
#86601
лезть в дыру~
2 c 0
лезть пролезть ползти~
if !(%arg.contains(дыра)%) 
   wsend       %actor% _Куда это Вы хотите пролезть?
   wechoaround %actor% _%actor.name% начал%actor.g% ползать вокруг стен.
   return 0
   halt
end
wsend       %actor% _Вы осторожно протиснулись в узкую дыру в стене.
wechoaround %actor% _%actor.name% пролез%actor.q% через узкую дыру в стене внутрь поместья.
  wteleport %actor% 86611
  wat 86611 wechoaround %actor% _%actor.name% пролез%actor.q% сюда снаружи.
~
#86602
лезть в дыру обратно~
2 c 0
лезть пролезть ползти~
if !(%arg.contains(дыра)%) 
   wsend       %actor% _Куда это Вы хотите пролезть?
   wechoaround %actor% _%actor.name% начал%actor.g% ползать вокруг стен.
   return 0
   halt
end
wsend       %actor% _Вы осторожно протиснулись в узкую дыру в стене.
wechoaround %actor% _%actor.name% вылез%actor.q% через узкую дыру в стене из поместья.
  wteleport %actor% 86607
  wat 86607 wechoaround %actor% _%actor.name% пролез%actor.q% сюда из поместья.
~
#86603
стоит на перешейке~
2 e 100
~
wait 3s
foreach victim %self.pc%
     wecho _&rНе в силах более держаться на перешейке, вы полетели вниз.&n
     wteleport %victim% 86672
done
end
~
#86604
разобрать завал~
2 c 0
разобрать разгрести~
if !%arg.contains(завал)%
   wsend   %actor% _Что вы хотите тут разобрать?
   return 0
   halt
end
wait 1
wsend       %actor% _Вы начали потихоньку камень за камнем разгребать завал.
wechoaround %actor% _%actor.name% начал%actor.g% потихоньку разгребать завал из камней.
wait 3s
wecho       _Камни с грохотом обвалились, обнажив узкий проход.
wdoor  86630 north flags a
wdoor  86630 north room  86631
wdoor  86631 south flags a
wdoor  86631 south room  86630
detach 86604 %self.id%
~
#86605
залезть в старое окно~
2 c 0
запрыгнуть залезть лезть~
if !(%arg.contains(окно)%) 
   wsend       %actor% _Куда это Вы хотите залезть?
   wechoaround %actor% _%actor.name% начал%actor.g% прыгать на стены. Пожалуй, пора бы кому-то отдохнуть...
   return 0
   halt
end
wsend       %actor% _\&RВы стали пролезать сквозь окно, но старая рама, не выдержав такого веса, обрушилась на Вас.\&n
wechoaround %actor% _\&R%actor.name% стал%actor.g% пролезать сквозь окно, но старая рама, не выдержав такого веса, обрушилась.\&n
wdamage %actor% 125
detach 86605 %self.id%
~
#86606
балка падает сверху~
2 e 100
~
wait 3s
eval victim %random.pc%
     wecho _&rОгромная балка, покачнувшись, полетела прямо на Вас!&n
     wdamage %victim% 285
done
detach 86606 %self.id%
end
~
#86607
зашли на озеро~
2 e 100
~
wait 1s
wecho _&MКакая-то тварь медленно выползла из озера.&n
wload mob 86618
detach 86607 %self.id%
end
  
~
#86608
сорняк вылезает~
2 e 100
~
if %random.10% <= 6
 wait 2s
 wecho _&gГигантский сорняк появился из-под земли !&n
 wload mob 86604
 detach 86608 %self.id%
else
 detach 86608 %self.id%
~
#86609
сорняк атакует~
0 n 100
~
mkill %random.pc%
~
#86610
сорняк рип~
0 f 100
~
if (%world.curobjs(86604)% < 6) && (%random.100% <= 20)
   mload obj 86604
end
~
#86611
статуя оживает~
2 e 100
~
wait 1s
wecho _&MНа мнгновение вам показалось будто каменные изваяния на балконе зашевелились...&n
wload mob 86605
detach 86611 %self.id%
end
~
#86612
листают фолиант~
2 c 0
листать прочитать пролистать~
if !%arg.contains(фолиант)%
wsend       %actor% _И что же вы хотите здесь прочитать?
return 0
   halt
end
wsend       %actor% _Вы начали осторожно листать первые главы древнего фолианта...
wechoaround %actor% _%actor.name% стал%actor.g% осторожно перелистывать первые главы древнего фолианта...
wait 2s
wecho _Внезапно истории далекого прошлого ожили в умах всех присутствующих.
wecho _Изображения на пожелтевших страницах стали принимать отчетливые очертания.
wait 1s
wecho _Призрак старого барона появился буквально из ничего!
wload mob 86613
calcuid fol 86621 room
attach 86613 %fol.id%
detach 86612 %fol.id%
end
~
#86613
листают фолиант дальше~
2 c 0
листать прочитать пролистать~
if !%arg.contains(фолиант)%
wsend       %actor% _И что же вы хотите здесь прочитать?
return 0
   halt
end
if %random.100% <= 85
wsend       %actor% _Вы начали изучать главы из середины фолианта.
wechoaround %actor% _%actor.name% начал%actor.g% изучать главы из середины фолианта.
wait 2s
wecho _Диковинные, но правдивые истории прошлого возникли в памяти всех присутствующих.
wecho _Изображения на пожелтевших страницах стали принимать отчетливые очертания.
wait 1s
wecho _Охотник за дьявольскими порождениями внезапно возник посреди комнаты, сражаясь с каким-то чудищем...
wait 1s
wload mob 86609
wload mob 86606
detach 86613 %self.id%
else 
wsend       %actor% _Вы начали изучать главы из середины фолианта.
wechoaround %actor% _%actor.name% начал%actor.g% изучать главы из середины фолианта.
wait 2s
wecho _Древний фолиант, не выдержав приложенных к нему усилий, рассыпался в прах.
wpurge фолиант
detach 86613 %self.id%
end
~
#86614
охотник атакует~
0 n 100
~
mecho _Ведьмак молниеносно ринулся к чудовищу.
mkill куролиск
wait 1s
ухмыл
end
~
#86615
призрак барона рип~
0 f 100
~
mload obj 86601
if (%world.curobjs(86614)% < 4) && (%random.100% <= 20)
   mload obj 86614
end
~
#86616
у саркофага~
2 e 100
~
wait 2s
wecho _&KКрышка саркофага с оглушающим грохотом отлетела в сторону...&n
wload mob 86610 
detach 86616 %self.id%
end
~
#86617
вампир оживает~
0 f 100
~
if (%world.curobjs(86625)% < 5) && (%random.100% <= 20)
   mload obj 86625
end
if %random.100% <= 15
mecho _\&RОхраняемый мощной черной магией, вампир восстал из мертвых !\&n
mload mob 86610
detach 86617 %self.id%
end
~
#86618
титан храпит~
0 ab 40
~
if !%self.fighting%
eval son %random.2%
  if %son% > 1
храп
masound _Чей-то рокочущий храп донесся из соседних помещений.
calcuid troom 86697 room
exec 86619 %troom%
  elseif %son% > 0
кошм
end
end
~
#86619
дамажит от храпа~
2 z 100
~
wait 1s
wecho _&rОстрые, как пики, сталактиты посыпались сверху от чьего-то громкого храпа.&n
foreach victim %self.char%
wdamage %victim% 85
done
end
~
#86620
входят к божеству~
0 r 100
~
wait 1s
кри Презренные смертные и здесь вы не даете мне покоя!
calcuid son 86624 mob
detach 86618 %son.id%
exec 86626 %world.mob(86624)%
detach 86620 %self.id%
end
~
#86621
вампир атакует~
0 n 100
~
mkill %random.pc%
~
#86622
молния попадает~
2 ab 100
~
eval victim %random.pc%
if %victim%
     wecho _&RМощная молния попала прямо в Вас !&n
     wdamage %victim% 165
end
done
end
~
#86623
дракон рип~
0 f 100
~
if (%world.curobjs(86602)% < 3) && (%random.100% <= 15)
   mload obj 86602
end
if (%world.curobjs(86612)% < 5) && (%random.100% <= 20)
   mload obj 86612
end
~
#86624
призрак рыцаря рип~
0 f 100
~
if (%world.curobjs(86603)% < 4)
if (%random.100% <= 20 )
   mload obj 86603
end
end
~
#86625
охотник рип~
0 f 100
~
if (%world.curobjs(86603)% < 2) && (%random.100% <= 15)
   mload obj 86607
end
~
#86626
сонный спешит на помощь~
0 z 100
~
wait 3s
просн
вст
восток
юг
detach 86626 %self.id%
end
~
#86627
птица грома рип~
0 f 100
~
if (%world.curobjs(86609)% < 3)
if (%random.100% <= 10 )
   mload obj 86609
end
end
if (%world.curobjs(86627)% < 3)
if (%random.100% <= 10 )
   mload obj 86627
end
end
~
#86628
мантикора рип~
0 f 100
~
if (%world.curobjs(86613)% < 4) && (%random.100% <= 25)
   mload obj 86613
end
~
#86629
д'йин рип~
0 f 100
~
if (%world.curobjs(86615)% < 4 )
if ( %random.100% <= 14)
   mload obj 86615
end
end
~
#86630
жагница рип~
0 f 100
~
if (%world.curobjs(86617)% < 4 )
if ( %random.100% <= 14)
   mload obj 86617
end
end
~
#86631
огненный титан рип~
0 f 100
~
if (%world.curobjs(86618)% < 5 )
if ( %random.100% <= 12 )
   mload obj 86618
end
end
~
#86632
каменный титан рип~
0 f 100
~
if (%world.curobjs(86619)% < 5 )
if (%random.100% <= 15 )
   mload obj 86619
end
end
~
#86633
ледяной титан рип~
0 f 100
~
if (%world.curobjs(86620)% < 6 )
if (%random.100% <= 18 )
   mload obj 86620
end
end
~
#86634
облачный титан рип~
0 f 100
~
if (%world.curobjs(86621)% < 5) && (%random.100% <= 20)
   mload obj 86621
end
if (%world.curobjs(506)% < 1) && (%random.100% <= 15)
   mload obj 506
end
~
#86635
репоп тригов~
2 f 100
~
wdoor   86630 north purge
wdoor   86631 south purge
calcuid laz 86630 room
attach   86604 %laz.id%
calcuid okno 86605 room
detach 86605 %okno.id%
attach 86605 %okno.id%
calcuid balka 86613 room
detach 86606 %balka.id%
attach 86606 %balka.id%
calcuid ozero 86673 room
detach 86607 %ozero.id%
attach 86607 %ozero.id%
calcuid sor 86601 room
detach 86608 %sor.id%
attach 86608 %sor.id%
calcuid sor2 86602 room
detach 86608 %sor2.id%
attach 86608 %sor2.id%
calcuid sor3 86606 room
detach 86608 %sor3.id%
attach 86608 %sor3.id%
calcuid sor4 86603 room
detach 86608 %sor4.id%
attach 86608 %sor4.id%
calcuid sor5 86605 room
detach 86608 %sor5.id%
attach 86608 %sor5.id%
calcuid sor6 86604 room
detach 86608 %sor6.id%
attach 86608 %sor6.id%
calcuid stat 86624 room
detach 86611 %stat.id%
attach 86611 %stat.id%
calcuid foli 86621 room
detach 86613 %foli.id%
attach 86612 %foli.id%
calcuid sar 86641 room
detach 86616 %sar.id%
attach 86616 %sar.id%
calcuid sar2 86645 room
detach 86616 %sar2.id%
attach 86616 %sar2.id%
calcuid smerd 86600 mob
detach 86636 %smerd.id%
attach 86636 %smerd.id%
~
#86636
смерд пугается~
0 r 100
~
дрож
wait 1s
г Не ходите туды люди добрые, старое поместье проклято навеки!
рекол %actor.name%
detach 86636 %self.id%
~
#86637
лоад ключа~
0 f 100
~
mload obj 86624
~
#86638
Вампир убит~
0 f 100
~
if %world.curobjs(1058)% < 1
mload obj 1058
end
~
$~
