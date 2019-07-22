#2100
Бросок костяных бабок~
1 h 100
~
eval kost2601 %random.6%
eval kost2602 %random.6%
wait 3
oecho Костяные бабки упали на землю и выпало %kost2601% и %kost2602%
wait 1
~
#2101
Трансформация свечки после догорания~
1 jl 100
~
wait 1
if (%self.val2% == 0)
  otransform 2199
  detach 2101 %self.id%
end
~
#2102
Выдача базовой экипировки~
0 d 100
помоги~
wait 1
if !%actor.canbeseen%
  г Кто здесь? Кому помогать? Не вижу!
  чесат
  halt
end
%send% %actor% %self.name% внимательно осмотрел%self.g% Вас.
if (%actor.level% > 14) || (%actor.remort% > 0)
  г И не стыдно тебе? Уже опытнее меня, а все о помощи просишь.
  укор .%actor.name%
  halt
end
eval money %actor.gold%+%actor.bank%
if (%money% > 200)
  г Да ты ведь богаче меня уже! Не дам ничего!
  фиг .%actor.name%
  halt
end
eval datem (%date.unix%-%actor.getquest(2102)%)/60
if (%datem% < 24)
  г А не слишком ли ты часто просишь о помощи?!
  хмур .%actor.name%
  г Чаще двух раз за день помогать не стану!
  halt
end
дум
mjunk all
switch %actor.class%
  case 13
    * волхв - руны
    %load% obj 222
    %load% obj 223
    %load% obj 224
    %load% obj 225
    case 0
      case 8
        * клер чернок волхв - дубина портки
        %load% obj 2212
        %load% obj 2102
      break
      case 2
        case 4
          case 12
            * тать наем купа - кинжал(проник) портки
            %load% obj 2214
            %load% obj 2102
          break
          case 1
            case 6
              case 7
                * колдун волш кудес - нож(короткое) портки
                %load% obj 2208
                %load% obj 2102
              break
              case 3
                * батыр - доспех перчи поножи
                %load% obj 2116
                %load% obj 2120
                %load% obj 2118
              break
              case 5
                * друж - шлем
                %load% obj 2117
                case 9
                  * друж витя - доспех меч поножи
                  %load% obj 2116
                  %load% obj 2202
                  %load% obj 2118
                break
                case 10
                  * охот - куртка лук портки
                  %load% obj 2100
                  %load% obj 2210
                  %load% obj 2102
                break
                case 11
                  * кузя - доспех секира поножи
                  %load% obj 2116
                  %load% obj 2216
                  %load% obj 2118
                break
                default
                  * для чармисов и новых проф
                  г Даже не знаю чем тебе помочь.
                  пож
                  halt
                break
              done
              *холщовый мешок
              %load% obj 2189
              *фляга
              %load% obj 2182
              *свечка
              %load% obj 2186
              *каравай
              %load% obj 2005
              *луковица
              %load% obj 2049
              *карта деревни
              switch %self.realroom%
                case 4071
                  %load% obj 4004
                break
                case 5053
                  %load% obj 5017
                break
                case 6052
                  %load% obj 6004
                break
              done
              foreach item %self.objs%
                %item.effect(+рассыпется)%
                %item.effect(+!продать)%
              done
              %echo% %self.name% достал%self.g% некоторые вещи из сундучка, припрятанного неподалеку.
              полож all мешок
              log room [%self.realroom%] char %actor.name%
              %actor.setquest(2102 %date.unix%)%
              give all .%actor.name%
~
$~
