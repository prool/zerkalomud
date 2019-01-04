#9900
приветствие~
0 gh 100
~
wait 1s
г Ой горе, горюшко...
wait 1s
%force% %world.mob(9902)% всхлип
%force% %world.mob(9902)% осм .%actor.iname%
wait 1s
осм .%actor.iname%
if (%actor.sex% == 1)
  г Не откажи, добрый молодец, в помощи...
else
  г Не откажи, красна девица, в помощи...
end
~
#9901
квестит~
0 d 0
спасу~
wait 1
обн .%actor.iname%
set tmp кузнецам народным
if (%actor.class% == 11)
  set tmp братьям по ремеслу
end
if (%actor.sex% == 2)
  г Я знал, что такой молодец не откажет в помощи %tmp%!
else
  г Я знал, что такой молодец не откажет в помощи %tmp%!
end
wait 1s
г Лиса живет далеко в глухом лесу, да в таком глухом, что порой прорубаться надо!
г А лес у нас, ух, какой крепкий, простое оружее его не возьмет.
г Пошукай там в сарае, может найдешь чего подходящего.
exec 9903 %world.obj(9900)%
set s1 %world.obj(9903)%
set s2 %world.obj(9904)%
%s1.put(%world.obj(9900)%)%
%s2.put(%world.obj(9900)%)%
%load% mob 9900
%teleport% %world.mob(9900)% 9982
attach 9906 %world.mob(9900)%
взд
detach 9900 %self%
detach 9914 %self%
detach 9901 %self%
~
#9902
рубим деревья~
2 c 1
рубить деревья~
if ((%cmd% == рубить) && (%arg% == деревья))
  set s1 %actor.eq(16)%
  set s2 %actor.eq(17)%
  if (%s1.vnum% == 9903)
    if (%s2.vnum% == 9904)
      if ((%actor.class% > 1) && (%actor.class% < 12))
        %send% %actor% Вспомня детство, проведенное в MUD-школе, Вы с сумасшедшей скоростью принялись махать саблями в разные стороны.
        %send% %actor% Несчастные деревья, попадающиеся на пути ваших ударов, падали, словно держались на честном слове.
        %echoaround% %actor% %actor.iname% вспомнил%actor.g% детство, проведенное в MUD-школе, где он%actor.g% пытал%actor.u% попасть по мухе,
        %echoaround% %actor% И принял%actor.u% махать саблями в разные стороны, снося все на своем пути.
      else
        %send% %actor% Вы пару раз неуклюже взмахнули саблями, зацепив ими несколько деревьев.
        %send% %actor% И, подняв взгляд, с ужасом заметили, что снесли половину рощи... 
        %echoaround% %actor% %actor.iname% неуклюже взмахнул%actor.g% саблями, снеся при этом половину рощи. 
        %echoaround% %actor% Кто ж знал, что сабли такие острые?
      end
      %door% 9965 west room 9973
      %door% 9973 east room 9965
    else
      %send% %actor% Одной саблей тут не обойтись.
    end
  else
    if (%actor.eq(16)% || %actor.eq(17)% || %actor.eq(18)%)
      %send% %actor% Ваше оружие негодится для этого.
    else
      %send% %actor% Вы сломали пару веточек. Поздравляю!
      %send% %actor% Впереди еще пол-леса.
    end
  end
else
  if (%actor.eq(16)% || %actor.eq(17)% || %actor.eq(18)%)
    %send% %actor% "Что бы такое срубить?.."
    %send% %actor% С уважением, Ваш внутренний голос.
  else
    %send% %actor% Глупая это затея - рубить голыми руками...
  end
end
~
#9903
лоад сабель~
1 b 0
~
%load% obj 9903
%load% obj 9904
~
#9904
zedit по-новому~
2 f 100
~
%door% 9973 east purge
%door% 9965 west purge
~
#9905
лоад хвоста~
2 c 1
приглядеться осмотреть~
if (%cmd% == осмотреть && !%arg%)
  %send% %actor% Что Вы хотите осмотреть?
  halt
end
if (%cmd% == приглядеться || (%cmd% == осмотреть && (%arg% == земля || %arg% == землю)))
  %load% obj 9902
  %send% %actor% Наклонившись Вы смахнули землю с кусочка меха и разобрали в нем заячий хвост!
  %echoaround% %actor% %actor.iname% приглядел%actor.u% к кусочку меха и смахнул%actor.g% с него землю.
else
  return 0
end
~
#9906
жихарка орет~
0 b 30
~
крич Украла-украла! Лиса меня украла!!
~
#9907
разговор лисы~
0 qr 100
~
г ХВАТИТ ОРАТЬ!!
wait 1s
%force% %world.mob(9900)% г Не хочу что б ты меня ку-ша-ла!
wait 1s
г Да не буду я тебя кушать!
г Мы просто это.. поиграем в куличики...
wait 1s
%force% %world.mob(9900)% г Может в калачики?
wait 1s
г Нет. В куличики
wait 1s
%echo% Завидев Вас, Лиса нахмурилась и прикрыла Жихарку собой.
wait 1s
г Господи, поем я сегодня или нет?! Чего тебе надо? А ну иди своей дорогой!
вопр .%actor.iname%
detach 9907 %self%
~
#9908
спасаем жихарку~
0 ab 0
~
wait 1
г Ой! Мы с лисой так и не поиграли в куличики...
всхлип
wait 1
ужас
г Сейчас же бабайка придет! Я кота с воробьем не послушалась!
г Я c лисой играла!
wait 1
%echo% Тут Жихарки и след простыл.
attach 9909 %world.mob(9901)%
makeuid q99 %actor.id%
global q99
remote q99 %world.mob(9901)%
%load% mob 9909
%force% %world.mob(9909)% убить %actor.iname%
%purge% %world.mob(9900)%
~
#9909
награда~
0 qr 100
~
if (%actor% == %q99%)
  wait 1
  г Спасибо тебе, %actor.iname%, за спасение Жихарки!
  г Она нам как дочка родная!
  wait 1
  %force% %world.mob(9902)% г Да-да! Спасибо!
  %force% %world.mob(9902)% кив
  wait 1
  eval rnd %random.1000%
  if (%rnd% < 300)
    г Вот, возьми. Вдруг разберешься для чего он.
    wait 1
    %force% %world.mob(9902)% г На ярмарке купили, думали вместо лампы использовать, а он тусклый какой-то.
    %load% obj 563
    give гор.кам .%actor.iname%   
  else
    %self.gold(300)%
    give 300 кун .%actor.iname%
  end
  detach 9909 %self%
end
~
#9910
квест зайца~
2 h 100
~
if (%object.vnum% == 9902)
  wait 1s
  %echo% Из норки послышалось шебуршание и вскоре вылез бесхвостый заяц.
  %teleport% %world.mob(9903)% %self.vnum%
  wait 1s
  %echo% Он аккуратно, на трясущихся лапках, подошел к комочку шерсти и принюхался.
  %echo% Вдруг в его глаза заблестали искорки радости он схватил свой хвост и умчался прочь!
  %purge% %object%
  %purge% %world.mob(9903)%
  eval rnd %random.1000%
  eval nork %world.room(9989)%
  if (%rnd% < 100 && %world.curobjs(221)% < 51)
    %load% obj 221
    eval runn %world.obj(221)%
    %runn.put(%nork%)%
  else
    %load% obj 9905
    eval ppuh %world.obj(9905)%
    %ppuh.put(%nork%)%
  end
end
~
#9911
транслокатор в норку к зайцу~
2 c 0
лезть~
if (%arg% == норка || %arg% == норку)
  eval norkroom %world.room(9989)%
  eval n %norkroom.all%
  if (%n.words% >= 1)
    %send% %actor% Там занято!
    halt
  end
  if (%actor.rentable% == 0)
    %send% %actor% В чистую норку зайца с кровью на одежде нельзя!  
    halt
  end
  %echoaround% %actor% %actor.iname% проскользнул%actor.g% в заячью норку.
  %teleport% %actor% 9989
else
  %send% %actor% Куда направляемся?
end
~
#9912
смерть лисы~
0 f 100
~
exec 9908 %world.mob(9900)%
~
#9913
приставание к зайчихе~
0 ab 30
~
* special for Бальдр :)
eval k %world.curmobs(9911)%
while (%k% > 0)
  calcuid zai 9911 mob %i%
  if (%zai.realroom% == %self.realroom%)
    eval rnd %random.1000%
    if (%rnd% < 301)
      миг %zai.iname%
    end
    if (%rnd% > 300 && %rnd% < 601)
      ухаж %zai.iname%
    end
    if (%rnd% > 600)
      лесть %zai.iname%
    end
    halt
  end
  eval k %k%-1
done
~
#9914
history эбаут Жихарка~
0 d 0
расскажи~
wait 1
взд
wait 1s
г Живем мы с Воробьем давным-давно, куем разные полезные вещи и отвозим их на базар.
г И жила с нами маленькая хорошенькая девочка - Жихарка.
wait 1s
г И вот однажды собрались мы на ярмарку и оставили Жихарку за хозяйку.
всхлип
%force% %world.mob(9902)% г Велели ей не шалить и дверь никому не открывать.
wait 1s
%force% %world.mob(9902)% г Но хитрая Лиса все таки обманула девчушку нашу и украла...
%force% %world.mob(9902)% плак
wait 1s
утеш вороб.куз
г Спаси Жихарку из лап коварной лисы!
attach 9901 %self%
~
#9915
Бой с тараканом~
0 k 20
~
%load% mob 9916
%echo% &KНа шум из-под половицы выполз таракан и кинулся на помощь своему собрату!&n
%force% %world.mob(9916)% уб .%actor.iname%
~
$~
