#13900
Выдача стафа~
0 d 100
снаряжение~
* Триггер повешен на рентера. При желании можно его прицепить к другому мобу
* и добавить/убавить вещи, изменить комплектацию для определенных профессий,
* соответственно меняя стоимость.
wait 1
if %actor.vnum% != -1
  halt
end 
say Сейчас-сейчас...
wait 1
if %actor.bank% < 220
  дум
  say Э, да у тебя кун-то даже на припасы не хватит!
  halt
end
eval buffer %actor.bank(-220)%
mload obj 13945
mload obj 13946
mload obj 13948
mload obj 13949
mload obj 13949
mload obj 13949
mload obj 13949
mload obj 13949
mload obj 13949
mload obj 13949
mload obj 13949
mload obj 13949
mload obj 139
mload obj 139
put all сум
say Вот припасы твои.
give all .%actor.name%
drop all
wait 2
say Сейчас снаряжение тебе подберем...
if %actor.bank% < 300
  дум
  say Хм... а вот на него у тебя денег нет.
  halt
end
eval buffer %actor.bank(-300)%
switch %actor.class%
  *боевой маг
  case 1
    *вор
    case 2
      *наемник
      case 4
        *маг-кудесник
        case 6
          *маг-волшебник
          case 7
            *маг-некромант
            case 8
              *охотник
              case 10
                *купец
                case 12
                  *волхв
                  case 13
                    mload obj 13911
                    mload obj 13912
                    mload obj 13914
                    mload obj 13915
                    mload obj 13916
                    mload obj 13917
                    mload obj 13918
                    mload obj 13919
                    mload obj 13920
                    mload obj 13921
                  break
                  *лекарь
                  case 0
                    *богатырь
                    case 3
                      *дружинник
                      case 5
                        *витязь
                        case 9
                          *кузнец
                          case 11
                            mload obj 13900
                            mload obj 13901
                            mload obj 13903
                            mload obj 13904
                            mload obj 13905
                            mload obj 13906
                            mload obj 13907
                            mload obj 13908
                            mload obj 13909
                            mload obj 13910
                          done
                          mload obj 13922
                          mload obj 13923
                          give all .%actor.name% 
                          drop all
                          wait 1
                          say Оружие сам%actor.g% себе в кузне купи - не маленк%actor.w% уже.
~
#13901
Удаление шмота~
1 gj 100
~
* Триггер предовращает возможность использовния клан-стафа
* неприписанными чарами. Предпочтительно просто добавить
* всей экипировке описание, свидетельствующее о ее принадлежности, но
* можно использовать этот триггер - однако не подключайте его к емкостям и сумкам.
* Вместо "БК" надо указать аббревиатуру названия клана в нижнем регистре
if %actor.clan% == бк
  halt
end
osend %actor% %self.name% рассыпал%self.u% в ваших руках.
wait 1
opurge %self%
~
#13902
Лоад коня~
1 c 2
Встряхнуть~
* Триггер на лоад кланового коня. Цепляется к уздечке.
* Разумеется, если вы меняете названия предмета (уздечки)
* или коня, то в триггера необходимо внести изменения
wait 1
if !%arg.contains(уздечку)%
  osend %actor% Что вы трясете?
  halt
end
osend %actor% Вы встряхнули уздечку и кольца на ней тихо зазвенели.
if %actor.clan% != бк
  halt
end
if %world.curmobs(13908)% > 50
  osend %actor% ...и ничего не произошло!
  halt
end
oechoaround %actor% %actor.name% встряхнул%actor.g% уздечку.
oload mob 13908
oecho Послышлся стук копыт и перед вами предстал призрачный конь.
oforce %actor% оседлать конь
wait 1
opurge %self%
~
#13903
расседлать коня~
0 c 100
расседлать~
* Триггер на свертывание кланового коня. Цепляется к мобу-коню.
* Разумеется, если вы меняете названия предмета (уздечки)
* или коня, то в триггера необходимо внести изменения
wait 1
if %self.fighting%
  halt
end
if !%arg.contains(коня)%
  msend %actor%  Кого вы хотите расседлать?
  halt
end
if (%actor.clan% != бк) || (%actor% != %self.leader%)
  msend %actor% Это не Ваш скакун.
  halt
end
msend %actor% Вы расседлали коня.
mechoaround %actor% %actor.name% расседлал%actor.g% коня.
mload obj 13952
give уздечка .%actor.name%
wait 1
mecho Конь испарился в темноте.
wait 1
mpurge %self%
~
#13904
Выдача уздечек~
0 m 1
~
* Триг висит на конюхе
wait 1
if %amount% < 50
  wait 2
  say Маловато будет!
  give %amount% кун .%actor.name%
  halt
end
if %world.curobjs(2052)% >= 200
  wait 2
  say Нету уздечек, кончились!
  give %amount% кун .%actor.name%
  halt
end
wait 2
say Вот, извольте.
mload obj 13952
give уздечка .%actor.name%
~
#13905
Приход гостей~
0 q 100
~
wait 1
if %actor.clan% == бк
  halt
end
shout %actor.name% !!! Стоять! Дальше находится замок Братства Крови!
~
$~
