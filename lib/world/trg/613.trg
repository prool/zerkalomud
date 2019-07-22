#61300
зашли к упырю~
0 q 100
~
wait 1s
mecho Упырь закричал:'Стойте! Не надо драться! Выслушайте меня сначала!'
wait 3s
if !%self.fighting%
  say Готовы ли вы меня выслушать?
  attach 61301 %self.id%
end
wait 2s
halt
~
#61301
упырь рассказывает~
0 dq 1
да готов готовы~
wait 1s
say Ну тогда слушайте.
say Несколько веков назад я бы с вами и разговаривать не стал.
say Молодой я был, боевой, сразу бы съел.
wait 1s
ухм
say Но с тех пор много времени побродил по миру, много людей повидал.
say Есть среди вас и хорошие, что не хватаются сразу за рогатину при моем виде.
say Вот теперь пока меня не тронут, я тоже никого не трогаю.
wait 1s
say Отвлекся я что-то.
wait 2s
say Так вот, решил я со своими упырятами на родное болото вернутся.
say Да не тут-то было.
say Летом все хорошо было, а вот сейчас совсем мне житья нету.
say Самые удобные омуты заняли водяники, и никого не пускают.
say А где мне с моими малышами  холода пережидать? В грязь что ли закапываться?
wait 1s
рыда
say Помоги мне омут отвоевать, я  найду чем тебе отплатить.
say Много чего я за свои путешествия повидал, и сокровищ нашел немало.
say Мне они без надобности, а вот хорошему человеку могу и отдать.
wait 1s        
calcuid upyr 61347 room       
attach 61302 %upyr%
*set hero %upyr%
*calcuid upyrr 61347 room
*remote hero %upyrr%
detach 61300 %self.id%
detach 61301 %self.id%
~
#61302
проверка выполнения и награда~
2 e 100
~
if !%actor%
  halt
end
if !%exist.mob(61314)%
  halt
end
if %actor% != %hero%
  halt
end
wait 1s  
calcuid upyr 61314 mob
*wecho %hero.name% ---------------
set n2name %hero%
remote n2name %upyr%
*
attach 61306 %upyr%
exec 61306 %upyr%
*ждем пока триг выше отработает
wait 7s 
wpurge %upyr%
*eval rum 61350+%random.2%
wait 10s 
switch %random.2%
  case 1
    calcuid r1 61351 room
  break
  case 2
    calcuid r1 61352 room
  break
done
set target %actor%
remote target %r1%
*
attach 61304 %r1%
exec 61304 %r1%
*detach 61304 %r1%
* *wecho ---- %rum% -----
*wteleport %dovol% %rum%
*calcuid dovol 61316 mob  
*if %dovol.fighting%
*  halt
*end
*exec 61304 %dovol.id%
detach 61302 %self%
~
#61303
умер водяник главный~
0 f 100
~
if %actor.vnum% == -1
  set hero %actor%
else
  *я не уверен что такое поле есть - но если работает - слава богу
  set hero %actor.leader%
end
calcuid upyrr 61347 room
remote hero %upyrr%  
*выложить сюда мелкую плюшку - мб руну?
* можно и выложить - когда руны будем перекладывать
~
#61304
загрузка довольного упыря и призыв~
2 z 100
~
wload mob 61316 
wload mob 61315
wload mob 61315
wload mob 61315
wload mob 61315 
wforce довольный взя все
wforce довольный оде все
wforce довольный воор топор
wforce довольный дер кинжал
wforce довольный взя все
wforce довольный оде все
wait 5s
if %target% && %target.realroom% > 61299 && %target.realroom% < 61400   
  *wteleport %target% %self.vnum%
  wechoaround %target% %target.name% растворил%target.u% в воздухе.
  wechoaround %target% Вы услышали зловещий смех упыря.
  wteleport %target% %self.vnum%
  wsend %target% Упырь призвал Вас!
  wait 1
  wforce довольный say Привет еще раз, я тут подумал, раз ты на болоте остался.
  wforce довольный say То будет чем моих упырят покормить.
  wforce довольный атак %target% 
elseif %target% && %random.3% == 1
  wechoaround %target% %target.name% растворил%target.u% в воздухе.
  wechoaround %target% Вы услышали зловещий смех упыря.
  wsend %target% Упырь призвал Вас!
  wteleport %target% %self.vnum% 
  wait 1
  wforce довольный say Упырята мои проголодались, а кроме тебя никого поблизости не осталось.
  wforce довольный say А виноват я в том, что хочется мне кушать...
  wforce довольный атак %target%
end
detach 61304 %self%
~
#61305
довольный упырь умер~
0 f 100
~
if (%random.1000% <= 50)
  mload obj 1702
end
~
#61306
НаградаУпыря~
0 z 0
~
кив
wait 1s
say Спасибо тебе, %n2name.iname%!
if ((%random.5% == 1) && (%world.curobjs(597)% < 1))
  %load% obj 597
  say Возьми вот эту книгу в помощь.
  дать книг .%actor.name%
else 
  say Возьми вот немного денег, что у меня с собой имеются.
  eval temp %actor.gold(+7000)%
end
wait 1s
say Если согласишься тут подождать немного, пару минут.
say Я сейчас к себе в трясину еще кое за чем схожу.
wait 1s                                            
mecho Упырь скрылся в трясине.
detach 81306 %self%
~
$~
