#4300
старик~
0 g 30
~
if %actor.id%!=-1
  exit
end
wait 1
say Приветствую тебя странник, мои старческие кости ослабли, силы покинули меня.
вздох
wait 1
say Я пытался найти недостающий компонент лечебного зелья, оранжевый цветок, но устал. Не мог бы ты помочь мне в этом? Он растет где-то на гнилом болоте.
~
#4301
отдача цветка~
0 j 100
~
if %object.vnum% != 4300
  wait 1
  say Зачем мне это???
  drop all
  halt
end
wait 1
mpurge %object%
say Благодарствую, ты очень помог%actor.q% мне.
wait 2
say Возьми за это скромную плату от меня.
switch %random.8%
  case 1
    mload obj 202
    дать рун %actor.name%
  break
  case 2
    mload obj 225
    дать рун %actor.name%
  break
  case 3
    case 4
      mload obj 527
      дать книга %actor.name%
    break
    case 5
      mload obj 1703
      дать все .%actor.name%
    break
    default
      %self.gold(+20)%
      дать 20 кун %actor.name%
    break
  done
~
$~
