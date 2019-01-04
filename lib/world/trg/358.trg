#35800
осмотрели омутницу~
0 e 0
Вас с головы до пят.~
wait 1
eval int %actor.int%+%actor.intadd%
if (%int% > 30)
  msend %actor% Увидев такую красоту вы почувствовали непреодолимое искушение, но смогли его побороть.
  halt
end
msend %actor% Вы плотоядно оглядели намеченную жертву и приблизились к ней с нецеломудренными намерениями.
wait 1
пощеч .%actor.name%
mdamage %actor% 50
mkill %actor%
detach 35800 %self.id%
~
#35801
кукарекаем~
0 b 100
~
if ((%weather.sunlight% == рассвет) || (%weather.sunlight% == закат))
  крич Ку-ка-рреку!
end
~
#35802
крестьянин приветствует~
0 q 100
~
wait 1s 
say Здраве буде.
wait 2 
дум
say Странные люди вы, путешественники. Вот так, просто, в чужой дом без стука...
wait 2 
say Но проходи, я гостям рад.
wait 2 
say Что делаешь ты в наших краях?
вопр .%actor.name%
say Мир смотришь или славы ратной ищешь?
attach 35803 %self.id%
attach 35804 %self.id%
detach 35802 %self.id%
~
#35803
гсмотрим мир~
0 d 1
смотрю мир~
wait 1
улы
say Что ж, смотри - места здесь красивые. Хотя остерегись на север ходить.
mecho _- Там опасное болото, а коли и его минуешь - темный лес.
attach 35805 %self.id%
mecho _- В нем Баба Яга хозяйствует.
detach 35803 %self.id%
~
#35804
гищем слав~
0 d 1
ищу славу~
wait 1
хох
say Тогда тебе не к нам надобно. Какие дела тут для героев?
ухм
wait 5
say Проблемы наши обычные, не интересно тебе будет о них слушать.
attach 35805 %self.id%
*detach 35803 %self.id%
detach 35804 %self.id%
~
#35805
слушаем о проблемах~
0 d 1
да слушаю расскажи~
wait 1
if (%actor.vnum% != -1)
  halt
end
set quester35801 %actor.id%
global quester35801
calcuid witch 35803 mob
attach 35806 %witch.id%
remote quester35801 %witch.id%
calcuid багник 35809 mob
remote quester35801 %багник.id%
дум
wait 1s 
say 
say Было все хорошо у нас - урожай, зверье в лесах, нечисть местная не докучала. 
mecho _- Даже с Бабой Ягой ладили, вместе проблемы решали. В гости к нам прилетала, не
mecho _- смотрели что нечисть, как свою привечали. А тут с ней разругались, и пропал
mecho _- после этого у нас домовой. Похоже, украла она его!
wait 1s 
say Как нам теперь без домового-то жить? Дом ветшает, нечисть, того и гляди, прямо
mecho _- по двору гулять начнет, и вообще не спорятся дела теперь.
взд
wait 1s 
say Забери у Яги домового, попроси вернуть его, может тебе согласится отдать. 
mecho _- Или... или силой отбери, а то боязно мне самому к ней теперь идти.
дрож
detach 35805 %self.id%
~
#35806
яга приветствует~
0 gq 100
~
wait 1s 
say Вот и обед сам и пришел!
улы .%actor.name%
wait 2s 
хмур
say Зачем пожаловал?
вопр .%actor.name%
attach 35807 %self.id%
detach 35806 %self.id%
~
#35807
говорим с ягой о домовом~
0 d 0
верни отдай возвращай где~
if (%actor.id% != %quester35801%)
  halt
end
if !%speech.contains(домово)%
  wait 1
  say Чаво-чаво тебе?
  halt
end
wait 1s 
say Так тебя этот ворюга прислал?
настор
say Втемяшилось в его голову пустую, что домовой у меня.
пожа
wait 1s 
say К чему мне домовых воровать?
пожа
say Может домовой сам от него сбежал?
ухм
wait 1s 
говор Что мне до его проблем теперь?
говор Кошку мою небось он у себя запер в отместку, вот подожду пару денечков, да наведаюсь...
хмур
говор Не поздоровится.
wait 1s
говор Ну или помоги мне ты - найди мою кошку ведьмовскую. Самой недосуг искать.
говор Пропала она, или потерялась или украл ее дурень старый.
attach 35808 %self.id%
detach 35807 %self.id%
~
#35808
соглашаемся с ягой~
0 d 1
да помогу~
wait 1
кив
say Иди. Да под ноги гляди - хитник следы оставил.
mecho Грязищу развел, половину болота в избу затащил.
буб
эмо погрозила кому-то метлой.
calcuid swampghost 35809 mob
attach 35809 %swampghost.id%
remote quester35801 %swampghost.id%
detach 35808 %self.id%
~
#35809
говорим с багником~
0 d 0
верни отдай возвращай где~
wait 1
if (%actor.id% != %quester35801%)
  halt
end
if !%speech.contains(кошк)%
  say Чего явился? Чего надобно?!
  say Проваливай по-хорошему, пока мавкам на вечерю не отдал!
  ухм
  halt
end
wait 1
msend %actor% Вы потребовали от багника вернуть украденную кошку.
wait 2s 
Дум
wait 3s 
say Ничего не знаю, а знал бы - не сказал.
ухм
wait 3s 
say Разве что... Принесешь ты мне голову водяного. 
mecho  - Тогда и подумаю - видел ли я что-то, кто куда ходил, кто что крал...
if (%world.curmobs(35814)%>0)
  calcuid waterghost 35814 mob
  detach 35818 %waterghost.id%
  attach 35810 %waterghost.id%
  attach 35811 %waterghost.id%
  remote quester35801 %waterghost.id%
end
detach 35809 %self.id%
~
#35810
лоад бошки водяного~
0 f 100
~
mload obj 35811
if ((%world.curobjs(35817)% < 4) && (%random.100% < 16))
  mload obj 35817
end
~
#35811
водяной смотрит~
0 q 100
~
if (%actor.id% != %quester35801%)
  halt
end
wait 1
emot угрожающе забулькал.
wait 2s
г Ты от багника! 
мор
г По запаху чую.
плюнут
поя
г Погубить хочет все озера, весь лес, еще и людей подсылает. 
say До чего опустился.
взд
г Убей лучше его самого. Вам же, людям, лучше будет.
calcuid swampghost 35809 mob
attach 35812 %swampghost.id%
attach 35813 %swampghost.id%
detach 35811 %self.id%
~
#35812
лоад бошки болотника~
0 f 0
~
mload obj 35816 
mload obj 35812
if ((%world.curobjs(35820)% < 4) && (%random.100% < 21))
  mload obj 35821
end
~
#35813
зашел после водяного к болоту~
0 q 100
~
wait 1
if !%exist.mob(35814)%
  halt
end
foreach human %self.pc%
  if (%human.id% == %quester35801%)
    эмо осмотрел Вас с головы до ног.
    г Смотрю я, не убил ты водяного. 
    г Придется самому, ибо говорят люди - хочешь сделать хорошо - сделай сам.
    г Дураков этих ссортить - мне, с водяным разбитьаться - мне.
    буб 
    взд
    mkill %actor%
    halt
  end
done
~
#35814
вход к домовому и котэ~
2 e 100
~
wait 1
wecho Кот да домовой, обнявшись, поют песни.
calcuid dom 35804 mob
calcuid cot 35824 mob
wecho Увидев, что ничто их больше не держит, вскочили они да бросились наружу, по домам.
wecho Только их и видели.
wpurge %dom%
wpurge %cot%
wat 35881 wload mob 35840
detach 35814 %self.id%
~
#35815
отдали бошку водяного-награда~
0 j 100
~
wait 1
if (%object.vnum% != 35811)
  брос все
  halt
end
wait 1
mpurge %object%
wait 1s
emot взвесил голову водяного на ладони.
say Вот и славно. 
wait 1s
if (%actor.id% != %quester35801%)
  say Благодарствую за помощь.
  пока
  detach 35815 %self.id%
  halt
end
say Вот твоя награда
%self.gold(+5000)%
дать 5000 кун .%actor.name%
*устраиваем погром в доме крестьянина
if (%world.curmobs(35800)%>0)
  calcuid krest1 35800 mob
  mechoaround %krest1% Что-то сверкнуло, громыхнуло и %krest1.name% замертво повалил%krest1.u% на землю.
  mechoaround %krest1% Вам показалось, что мимо пронеслась улюлюкающая старуха на помеле.
  eval damage %krest1.hitp%+11
  mdamage %krest1% %damage%
end
if (%world.curmobs(35836)%>0)
  calcuid krest1 35836 mob
  mechoaround %krest1% Что-то сверкнуло, громыхнуло и %krest1.name% замертво повалил%krest1.u% на землю.
  mechoaround %krest1% Вам показалось, что мимо пронеслась улюлюкающая старуха на помеле.
  eval damage %krest1.hitp%+11
  mdamage %krest1% %damage%
end
if (%world.curmobs(35837)%>0)
  calcuid krest1 35837 mob
  mechoaround %krest1% Что-то сверкнуло, громыхнуло и %krest1.name% замертво повалил%krest1.u% на землю.
  mechoaround %krest1% Вам показалось, что мимо пронеслась улюлюкающая старуха на помеле.
  eval damage %krest1.hitp%+11
  mdamage %krest1% %damage%
end
mat 35826 mload obj 35812
~
#35816
отдали бошку багника-награда~
0 j 100
~
wait 1
if (%object.vnum% != 35816)
  брос все
  halt
end
wait 1
mpurge %object%
wait 1s
emot взвесил голову багника на ладони.
say Вот и славно. 
wait 1s
if (%actor.id% != %quester35801%)
  say Благодарствую за помощь.
  пока
  detach 35816 %self.id%
  halt
end
say Вот твоя награда
%self.gold(+5000)%
дать 5000 кун .%actor.name%
~
#35817
Убили мавку~
0 f 100
~
if ((%world.curobjs(35814)% < 4) && (%random.100% < 21))
  mload obj 35814
end
~
#35818
Убили водяного~
0 f 100
~
if ((%world.curobjs(35817)% < 4) && (%random.100% < 25))
  mload obj 35817
end
~
#35819
Убили оборотня~
0 f 100
~
if ((%world.curobjs(35818)% < 4) && (%random.100% < 21))
  mload obj 35818
end
~
#35820
Убили болотный огонь~
0 f 100
~
if ((%world.curobjs(35819)% < 4) && (%random.100% < 16))
  mload obj 35819
end
~
#35821
Убили болотника~
0 f 100
~
if ((%world.curobjs(35820)% < 4) && (%random.100% < 21))
  mload obj 35821
end
~
#35822
Убили полудницу или денницу~
0 f 100
~
if ((%world.curobjs(35821)% < 4) && (%random.100% < 16))
  mload obj 35821
end
~
#35823
багник приветствует~
0 gq 100
~
ухм .%actor.name%
Кто это заплутал, кто же к нам пожаловал?
Что же ты тут ищешь?
осм .%actor.name%
wait 2s 
эмо прислонился к дверце и ехидно посмотрел на Вас
detach 35823 %self.id%
~
#35824
убили омутницу~
0 f 100
~
if ((%world.curobjs(35820)% < 4) && (%random.100% < 25))
  mload obj 35820
end
~
$~
