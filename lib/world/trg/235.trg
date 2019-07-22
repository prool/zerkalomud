#23500
ругань_Седого_каменетеса~
0 q 100
~
*Седой каменетес ругается*
wait 1s 
say Говорил я вам, обалдуям, умерьте свой пыл!
say Дорвались до жилы - и сразу ум за разум зашел...
say На что вам эти безделушки сдались только?!
wait 1s
эм покрутил в руках какой-то блестящий камушек
wait 1s
say Только поругались зазря. Да Полоз-покровитель на нас всех из-за вас гневается,
say вот и напустил он на вас слуг своих, за то что не могли миром и честью разойтись.
вздох
wait 1s
say Да только вы не себе навредили а всей артели нашей.
say Слюда да кварц шли на продажу в земли другие, а наш город за них зерно выручал.
say Да на вас, двух дурней великовозрастных, весь город коситься будет!
say Кто теперь за вас пойдет просить Полоза? Кто змея изничтожет? Ты, Дарен, чтоли?
mecho Каменотес Дарен понуро опустил взгляд...
wait 1s
say Или ты, Молчан?!
mecho Молчан стал еще смурнее под строгим взглядом.
wait 1s
say Что притихли?! Кто нам теперь поможет?
attach 23501 %self.id%
detach 23500 %self.id%
~
#23501
выдача_квеста~
0 d 2
я помогу~
wait 1s
удив
say Прости старика, не приметил сразу. Уж слишком разошелся...
вздох
wait 1s
say Допекли, ироды.
эм кивнул в сторону поникших виновников
wait 1s
say Поругались из-за куска кварца с золотым самородком внутри.
msend %actor% Седой каменетес показал Вам камень.
wait 1s
say Полоз-покровитель золота прогневался на них и населил пещеру, где работали, своими слугами.
say И велел как одумаются - принести ему причину раздора. А как к нему теперь пройти?
say Мы к оружию не привыкшие. Ты уж отнеси ему, а?
say Да поклонись ему от нас.
вздох
mload obj 23506
дать кусок .%actor.name%
set questor235 %actor%
global questor235
calcuid target 23507 mob
remote questor235 %target.id%
attach 23502 %self%
detach 23501 %self%
~
#23502
оплата_квеста~
0 q 100
~
wait 1
if ((%actor% != %questor235%) || %exist.mob(23506)%)
  halt
end
поклон .%actor.name%
say Спасибо тебе...
эм едва не сорвался в слезы
wait 1s
say Мы в долгу не останемся.
эм пошел в дальний угол избы, порылся в непреметном сундуке и вернулся обратно едва не приплясывая.
wait 1s
switch %random.12%
  case 1
    case 2
      if ((%actor.religion% == 0) && (%world.curobjs(23508)% < 15)
        mload obj 23508
        дать кам .%actor.name%
      elseif ((%actor.religion% == 1) && (%world.curobjs(23509)% < 15)
        mload obj 23509
        дать кам .%actor.name%
      else
        eval money %random.500%+500
        %self.gold(+%money%)%
        give %money% кун .%actor.name%
      end
    break
    case 3
      case 4
        case 5
          if (%world.curobjs(23511)% < 50))
            mload obj 23511
            дать кам .%actor.name%
          else
            eval money %random.500%+500
            %self.gold(+%money%)%
            give %money% кун .%actor.name%
          end
        break
        case 6
          case 7
            if (%world.curobjs(235)% < 50))
              mload obj 235
              дать рун .%actor.name%
            else
              eval money %random.500%+500
              %self.gold(+%money%)%
              give %money% кун .%actor.name%
            end
          break
          case 8
            case 9
              if (%world.curobjs(521)% < 1))
                mload obj 521
                дать книг .%actor.name%
              else
                eval money %random.500%+500
                %self.gold(+%money%)%
                give %money% кун .%actor.name%
              end
            break
            default
              eval money %random.500%+500
              %self.gold(+%money%)%
              give %money% кун .%actor.name%
            done
            unset questor235
            detach 23502 %self%
~
#23503
Полозу_дали_кусок~
0 j 100
~
wait 1
if (%object.vnum% != 23506)
  say Мне от смертных ничего не нужно.
  дать %object.name% .%actor.name%
else
  wait 1
  mpurge %object%
  msend %actor% Полоз оценивающе посмотрел на Вас.
  mechoaround %actor% Полоз оценивающе посмотрел на %actor.vname%.
  взд
  say Знаю, с чем тебя послали ко мне, знаю.
  say Прощаю я их. А дабы больше не сорились - камень этот с собой заберу.
  wait 1s
  say Ладно. Дело сделано. Мне пора и тебе не скучать.
  say Возвращайся. Небось награда ждет?
  улыб .%actor.iname%
  wait 1s
  mecho Полоз оборотился огромной змеей и уполз прямо сквозь камни.
  wait 1
  mpurge %self%
end
~
#23504
рвем_паутину~
1 c 100
разорвать~
wait 1
if %arg.contains(паутин)%
  osend %actor% Вы начали рвать паутину.
  wait 1s
  oecho Паутина быстро разошлась в стороны.
  odoor 23544 s room 23553
  wait 1
  opurge %self%
else
  osend %actor% Вам лишь бы порвать что-нибудь. Вот только что конкретно?
end
~
#23505
ZONERESET~
2 f 100
~
wdoor 23544 s purge
calcuid room1 23561 room
attach 23507 %room1.id%
~
#23506
МИНЗДРАВ_предупрждает~
0 q 100
~
wait 1
if %actor% != %questor235%
  halt
end
msend %actor% Змеевка внимательно посмотрела на Вас...
mechoaround %actor% Змеевка внимательно посмотрела на %actor.vname%...
wait 5
if %actor.sex% == 1
  say Здравствуй, добрый молодец.
else
  say Здравствуй, красавица.
end
say Знаю зачем послали тебя. Да только зол больно батюшка мой.
say За тот кусок кварца чуть не убили друг-друга...
вздох
wait 1s
say Знаю, не остановить тебя, да все равно - остерегайся.
say Каменный змей на пути твоем...
эм мельком глянула на пещеру
вздох
wait 1s
say Только батюшке-Полозу не говори про меня ничего. Осерчает пуще прежнего.
mecho Девушка обернулась змеею и быстро уползла в пещеру. В том месте где она проползла остался золотой след.
wait 1
mpurge %self%
~
#23507
глюки~
2 c 1
смотреть посмотреть рассмотреть~
wait 1
if (%arg.contains(мешочек)% || %arg.contains(мешок)%)
  if ( %random.1000% < 250 )
    wload obj 23510
    wsend %actor% Внимательно присмотревшись, Вы обнаружили какой-то пыльный мешочек.
  else 
    wsend %actor% Внимательно присмотревшись, Вы обнаружили лишь какие-то обрывки.
  end
  detach 23507 %self%
else
  wsend %actor% Что вы хотите рассмотреть?
end
~
#23508
Лоад Уха~
0 f 15
~
if ((%world.curobjs(23512)% < 21) && (%random.1000% <= 250))
  mload obj 23512
end
~
#23509
Помер вуивир~
0 f 100
~
if ((%world.curobjs(25307)% < 15) && (%random.1000% <= 220))
  mload obj 23507
end
~
$~
