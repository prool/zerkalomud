#27800
входведьма~
0 r 100
~
wait 1
if ((%actor.class% == 8) || (%actor.class% == 4))
  msend %actor.name% Ведьма косо посмотрела на Вас.
  mechoaround %actor% Ведьма косо посмотрела на  %actor.rname%.
  tell %actor.name% Ты тоже изучаешь силу темных неведомых сил, нам наверное есть
  tell %actor.name% о чем поговорить. Я вот здесь давно провожу эксперименты над лесом,
  tell %actor.name% хочу подчинить его своей власти.
  tell %actor.name% Дело понемногу движется, не заметно?
  ухм
  wait 1s 
  tell %actor.name% Но есть проблема.
  tell %actor.name% Здесь есть один старый лесоруб, он постоянно мешает мне,
  tell %actor.name% где-то он достал магический амулет, который не дает мне
  tell %actor.name% возможности продолжить мое дело. Убей его и я отблагодарю тебя.
  хих
else
  tell %actor.name% Зачем ты пришел сюда?
  mkill %actor.name%
end
~
#27801
смертьведьмы~
0 f 100
~
mload obj 27801
mload obj 27803
if (%random.1000% <= 150) && (%world.curobjs(511)% < 1)
  mload obj 511
end
~
#27802
входседойлесоруб~
0 r 100
~
wait 1
if %actor.class% == 8
  msend %actor% Седой лесоруб косо посмотрел на Вас.
  mechoaround %actor% Седой лесоруб косо посмотрел на %actor.vname%.
  tell %actor.name% Ех, не перевариваю я вашего брата, что-то вот говорит мне
  tell %actor.name% что черно у вас на душе.
  mecho Седой лесоруб достал из под рубахи амулет, посмотрел на него и снова убрал.
  tell %actor.name% Изучаете вы бесовские книги.
  tell %actor.name% Шел бы ты подальше по добру по здорову.
  wait 1s 
  ярость
else
  wait 2s
  msend %actor% Седой лесоруб пристально посмотрел на Вас.
  mechoaround %actor% Седой лесоруб пристально посмотрел на  %actor.rname%.
  tell %actor.name% Тяжелые времена наступили у нас, шаг в лесу не ступишь, то в ловушку
  tell %actor.name% попадешь, то деревья нападут на тебя. И это наш то лес, испокон века
  tell %actor.name% помогающий нам. Тут явно не обошлось без участия темных сил, будь
  tell %actor.name% они неладны. Если можешь, помоги нам, разберись с этим, а я не останусь
  tell %actor.name% в долгу. Думаю, тот кто это делает, владеет неким магическим предметом,
  tell %actor.name% принеси его, я думаю смогу его уничтожить.
end
~
#27803
смертьседойлесоруб~
0 f 100
~
mload obj 27802
~
#27804
далпрутохотник~
0 j 100
~
wait 1
if %object.vnum%==27807
  wait 1
  mpurge %object%
  mecho Охотник внимательно осмотрел прут.
  mecho Хороший прут, можно сделать сильный лук.
  wait 1s
  if (%random.5%==1) && (%world.curobjs(27808)%<10)
    wait 5s
    mecho Охотник долго возился с прутом, что-то делая с ним.
    mecho Долго выгибал прут, используя какие то свои инструменты.
    say Вот что получилось, возьми.
    mload obj 27808
    wait 1
    дать лук %actor.name%
  else
    mecho Охотник стал сгибать прут, как вдруг он хрустнул.
    руг
    wait 1
    say Жаль не получилось.
  end
end
~
#27805
датьамулетведьма~
0 j 100
~
wait 1
if (%object.vnum% != 27802)
  say Зачем ты мне это принес%actor.q%?
  halt
end
wait 1
mpurge %object%
if ((%actor.class% != 4) && (%actor.class% != 8))
  halt
end
say Вот и отлично.
mecho Ведьма резко подпрыгнула и похлопала в ладоши.
say Теперь весь лес мой, только мой, а потом и не только лес.
say Ну что сказать, награда твоя.
switch %actor.class%
  case 4
    if %random.1000% <= 150
      say Думаю, тебе пригодится рецепт вот этого зелья.
      mload obj 1754
      дать свиток .%actor.name%
    else
      say Могу подкинуть тебе немного деньжат.
      %self.gold(+300)%
      дать 300 кун %actor.name%
    end
  break
  case 8
    if (!%actor.spell(поднять труп)% && (%actor.level%>13)
      msend %actor% Вот держи, и надеюсь ты скоро присоединишься ко мне и поможешь.
      mspellturn %actor.name% поднять.труп set
      msend %actor% Поднять труп важное заклинание для чернокнижника.
    else
      удивл
      msend %actor% Ты уже знаешь заклинание поднять труп - могу только денег подкинуть.
      %self.gold(+300)%
      дать 300 кун %actor.name%
    end
  break
  default
    galt
  done
  %actor.align(-4)%
~
#27806
датьамулетседой~
0 j 100
~
wait 1
if (%object.vnum% != 27803 )
  halt
end
if %object.vnum%==27803
  wait 1
  mpurge %object%
  say %actor.name%, отличная работа.
  mecho Седой лесоруб внимательно осмотрел амулет.
  say Теперь у нас станет поспокойнее, народ сможет в лес ходить без опаски.
  say %actor.name%, чем смогу, отблагодарю.
  switch %actor.class%
    * лекарь
    case 0
      if (!%actor.spelltype(освящение)%) && (%actor.level%>11)
        mspellturn .%actor.name% освящение set
        say Вот, знай теперь освящение, %actor.name%. 
      else
        %self.gold(+300)%
        дать 300 кун %actor.name%
      end
    break
    * колдун
    case 1
      if (!%actor.spelltype(оцепенение)%) && (%actor.level%>17)
        mspellturn .%actor.name% оцепенение set
        say Вот, знай теперь оцепенение, %actor.name%. 
      else
        %self.gold(+300)%
        дать 300 кун %actor.name%
      end
    break
    * вор
    case 2
      if (!%actor.skill(подножка)%) && (%actor.level%>11)
        mskillturn %actor.name% подножка set
        say Вот, знай теперь подножку, %actor.name%.
      else
        %self.gold(+300)%
        дать 300 кун %actor.name%
      end
    break
    * богатырь
    case 3
      if (!%actor.skill(богатырский молот)%) && (%actor.level%>11)
        mskillturn %actor.name% богатырский.молот set
        say Вот, знай теперь богатырский молот, %actor.name%.
      else
        %self.gold(+300)%
        дать 300 кун %actor.name%
      end
    break
    * наемник
    case 4
      if (!%actor.skill(подножка)%) && (%actor.level%>11)
        mskillturn %actor.name% подножка set
        say Вот, знай теперь подножку, %actor.name%.
      else
        %self.gold(+300)%
        дать 300 кун %actor.name%
      end
    break
    * дружинник
    case 5
      if (!%actor.skill(лидерство)%) && (%actor.level%>11)
        mskillturn %actor.name% лидерство set
        say Вот, знай теперь лидерство, %actor.name%.
      else
        %self.gold(+300)%
        дать 300 кун %actor.name%
      end
    break
    * кудесник
    case 6
      if (!%actor.spelltype(оцепенение)%) && (%actor.level%>11)
        mspellturn .%actor.name% оцепенение set
        say Вот, знай теперь оцепенение, %actor.name%. 
      else
        %self.gold(+300)%
        дать 300 кун %actor.name%
      end
    break
    * волшебник
    case 7
      if (!%actor.spelltype(оцепенение)%) && (%actor.level%>13)
        mspellturn .%actor.name% оцепенение set
        say Вот, знай теперь оцепенение, %actor.name%. 
      else
        %self.gold(+300)%
        дать 300 кун %actor.name%
      end
    break
    * витязь
    case 9
      if (!%actor.spelltype(ускорение)%) && (%actor.level%>19)
        mspellturn .%actor.name% ускорение set
        say Вот, знай теперь ускорение, %actor.name%. 
      else
        %self.gold(+300)%
        дать 300 кун %actor.name%
      end
    break
    * купец
    case 12
      if (!%actor.spelltype(слово возврата)%) && (%actor.level%>18)
        mspellturn .%actor.name% слово.возврата set
        say Вот, знай теперь слово возврата, %actor.name%. 
      else
        %self.gold(+300)%
        дать 300 кун %actor.name%
      end
    break
    * волхв
    case 13
      if (%world.curobjs(207)% < 50) && (%random.100% <= 40)
        say Вот тебе волшебный камень, %actor.name%!
        mload obj 207
        дать рун %actor.name%
      else
        say Нет у меня сейчас ничего достойного такого волхва, как ты, %actor.name%!
        say Возьми же деньги в награду.
        %self.gold(+300)%
        дать 300 кун %actor.name%
      end
    break
    default
      %self.gold(+500)%
      дать 500 кун %actor.name%
    break
  done
  %actor.align(+4)%
  if (!(%actor.skill(чаговый настой)% > 0) && (%random.1000% < 100))
    say Научу я тебе зелью одному, с давних пор секрет его в нашей семье передается.
    say Смотри, да запоминай крепче.
    mskillturn %actor.name% чаговый.настой set
  end
~
$~
