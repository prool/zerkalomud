* BRusMUD trigger file v1.0
#90100
Tree <Вошли в трактир>~
2 e0 100
0~
calcuid BadGuy 90022 mob
attach  90101 %BadGuy.id%
exec    90101 %BadGuy.id%
return  1
calcuid room  90051 room
detach  90100 %self.id%





~
#90101
Tree <Вырвиглаз обижает старика>~
0 a0 100
0~
return 0
while  1
       wait 1
       if !%self.fighting%
         switch %random.8%
         case 1
         mecho   - Гы, ты, старая вонючка, - проревел Вырвиглаз  и запустил в старика костью.
         masound - Гы, ты, старая вонючка, - послышалось из соседней комнаты.
         break
         case 2
         mecho   - Че расселся здесь, старый козел ? - прорычал Вырвиглаз, и запустил в старика
         mecho   костью, которая больно ударила того в голову. Старик горько заплакал.
         masound - Че расселся здесь, старый козел ? - послышалось из соседней комнаты. Затем
         masound раздался чей-то тихий плач.
         break
         case 3
         mecho   - Ну ты, барон вшивый, вылижи-ка мне сапоги ! - проскрипел Вырвиглаз и пнул
         mecho   старика в бок. Старик застонал и отполз в угол.
         masound - Ну ты, барон вшивый, вылижи-ка мне сапоги ! - послышалось из соседней комнаты.
         break
         done
       end
       wait 4s
done








~
#90102
Tree <Вырвиглаз убит>~
0 f0 100
~
mload obj 90106
if %world.curobjs(90103)% < 10 && %random.10% < 2
   mload obj 90103
end
if %world.curobjs(90104)% < 10 && %random.10% < 2
   mload obj 90104
end
if %world.curobjs(90105)% < 10 && %random.10% < 2
   mload obj 90105
end
calcuid Baron 90020 mob
attach  90103 %Baron.id%





~
#90103
Tree <Нищему старику дали кошель>~
0 j0 100
0~
if %object.vnum% != 90106
   return 0
   halt
end
return 1
wait   1
if %actor.sex% == 2
   mecho - Спасибо тебе, сиятельная леди.
else
   mecho - Благодарствую тебя, великодушный рыцарь.
end
mecho - Был я когда-то влиятельным бароном, и мой замок располагался неподалеку
mecho отсюда.
mecho - Замок был богатый, кладовые ломились от золота и сокровищ.
mecho - Все кончилось в одночасье. Пришел злой Мустафа-ибн-Налим с сыновьями,
mecho из земель сарацинских. Сыночки его еще те, руками машут как мельницы, да
mecho и сам он злым чарам обученный. Перерезал людишек, а меня, посредством магии
mecho дьявольской превратил в нищего старика, хотя от роду мне всего 30 лет.
mecho - Затем он пинками выгнал меня из собственного дома, дабы кончил я свои дни
mecho в голоде и холоде.
mecho - Сейчас замок не укрепелен и охраняется слабо, ибо подступы к нему стерегут
mecho 2 великана, которых Ибн-Налим создал из глины посредством колдовства.
mecho - Великаны эти глупы, но силу имеют неимоверную. Круглые сутки бродят в
mecho окресностях деревни, кого увидят - так и растопчут.
mecho - Я покажу путь к замку, а Вы уж отомстите за старика.
mdoor  90050 west flags a
mdoor  90050 west room  90054
mdoor  90054 east flags a
mdoor  90054 east room 90050
follow %actor.name%
detach 90103 %self.id%





~
#90104
Tree <PC зашел к великанам>~
0 q0 100
0~
wait 1
mecho - Привет, карлики, куда топаете ? - осклабился великан.
attach 90105 %self.id%








~
#90105
Tree <г ОХОТИМСЯ НА ВЕЛИКАНОВ>~
0 d0 0
охотимся убиваем бьем~
if !%speech.contains(великан)%
   return 0
   halt
end
wait  1
mecho На физиономии великана отразилась лихорадочная работа извилин.
mecho - Ой-ой-ой, только не на меня, - внезапно захныкал он, - лучше
mecho - лучше на него! Громила начал усиленно кивать на запад.
makeuid Hero %actor.id%
global  Hero
calcuid velik 90024 mob 
attach  90106 %velik.id%
detach  90104 %velik.id%
detach  90105 %velik.id%



~
#90106
Tree <г ТАЩИ ВТОРОГО>~
0 d0 0
веди приведи тащи~
if (!%speech.contains(второго)% && !%speech.contains(брат)%) || (%actor.id% != %Hero.id%)
   halt
end
calcuid second 90025 mob
if %second%
   calcuid room 90056 room
   attach  90107 %room.id%
   exec    90107 %room.id%
   detach  90107 %room.id%
   if (%second.room% == %self.room%)
      wait 1
      attach  90108 %self.id%
      mecho - Щас !- обрадованно закивал громила и поплелся на запад.
      mecho Вскоре он показался, таща за руку хнычущего и упирающего
      mecho великана, только абсолютно белого.
      mecho - Не ешьте нас, - заревели братья, и принялись размазывать
      mecho грязные потоки по щекам.- Мы будем послушными, - продолжали
      mecho они, истекая слезами.
   end
end
detach  90106 %self.id%



~
#90107
Tree <телепортируем белого великана>~
2 z0 100
100~
wteleport белый.великан 90056
return    0



~
#90108
Tree <г ДЕРИТЕСЬ>~
0 d0 0
деритесь бейтесь~
if %actor.id% != %Hero.id%
   halt
end
mkill   белый
detach  90108 %self.id%








~
#90109
Tree <ТРЕСНУТЬ ВОРОТА>~
2 c0 1
колотить треснуть стукнуть~
if !%arg.contains(ворота)% && !%arg.contains(створк)%
   return 0
   halt
end
wecho Створки с грохотом упали на землю, открывая проход.
wdoor   90057 west purge
wdoor   90057 west room 90058
wdoor   90058 east purge
wdoor   90058 east room 90057
calcuid room 90057 room
detach  90109 %room.id%





~
#90110
Tree <PC зашел во двор>~
2 e0 100
0~
wait  1
wecho  -Тенгиз, сынок, пакажы подлым гяурам как дируца настаящие джыгиты ! -
wecho  послышался голос Ибн-Налима.
wload   mob 90026
calcuid Tengis 90026 mob
set     Target %random.pc%
if %Tengis% && %Target%
   wecho  На двор выпрыгнул здоровенный восточного вида парень в кимоно, подпоясанный
   wecho  коричневым поясом.
   wecho  Присев в низком "кибадучи" он сделал несколько приседаний и прыгнул вперед,
   wecho  выбросив голую пятку...
   wait   3s
   wforce %Tengis% attack %Target.name%
end
detach  90110 %self.id%





~
#90111
Tree <Тенгиза замочили>~
0 f0 100
~
if %world.curobjs(90107)% < 10 && %random.10% < 2
   mload obj 90107
end
mecho   -Нарбек, убэй их,-истерично завопил Ибн-Налим.
mload   mob 90027
calcuid Narbek 90027 mob
set     Target %random.pc%
return  0
if %Narbek% && %Target%
   mecho  Во дворе показался следующий боец, на этот раз в черном поясе.
   mecho  - Я твой ишак... - завопил он, увидев распростертое тело брата,
   mecho  и нанес вполне сносный "макиваши"
   mforce %Narbek% attack %Target.name%
end





~
#90112
Tree <Нарбека замочили>~
0 f0 100
~
if %world.curobjs(90108)% < 10 && %random.10% < 2
   mload obj 90108
end
if %world.curobjs(90109)% < 10 && %random.10% < 2
   mload obj 90109
end
mdoor 90058 west flags a
mdoor 90058 west room  90059





~
#90113
Tree <PC вошел в замок>~
2 e0 100
0~
if %started%
   halt
end
wait  1
set   started 1
while 1
      set     IbnNalim 0
      calcuid IbnNalim 90028 mob
      if !(%IbnNalim%)
         break
      end
      if !%IbnNalim.fighting%
         wait   1
         switch %random.4%
         case 1
         wecho   -Слюшай, танэц живата хачу, да, - послышался противный голос, а затем
         wecho   всхлипывание.
         wasound -Слюшай, танэц живата хачу, да, - послышался противный голос, а затем
         wasound всхлипывание.
         break
         case 2
         wecho   -Я тивой мама в гроб видэл, да, разиве эта танэц живата. - раздался истошный
         wecho   визг.
         wasound -Я тивой мама в гроб видэл, да, разиве эта танэц живата. - раздался истошный
         wasound визг.
         break
         done
      end
      wait 6s
done
detach  90113 %self.id%





~
#90114
Tree <PC вошел в первую комнату замка>~
2 e0 100
~
wait 1
wecho - Подлый гяур, ти убил мои сыны, сичас я тибе...
wecho - Сатан мутанто ! - нараспев проревел Ибн-Налим.
wload   mob 90029
calcuid monstr 90029 mob
if %monstr%
   wecho Но похоже, мозги у старого обкуренного Ибн-Налима че-то там напутали, и
   wecho вызванное "сатан мутанто" оказалось на редкость болезненным и худосочным.
   wecho С кряхтеньем и стонами оно поползло в Вашу сторону.
   wait   3s
   set    Target %random.pc%
   wforce %monstr% attack %Target.name%
end
wdoor   90061 west flags a
wdoor   90061 west room  90060
calcuid wizard 90028 mob
detach  90113  %wizard.id%
detach  90114  %self.id%



~
#90115
Tree <ИбнНалима замочили>~
0 f0 100
~
if %world.curobjs(90110)% < 10 && %random.10% < 2
   mload obj 90110
end
if %world.curobjs(90111)% < 10 && %random.10% < 2
   mload obj 90111
end
if %world.curobjs(90112)% < 10 && %random.10% < 2
   mload obj 90112
end
if %world.curobjs(90113)% < 10 && %random.10% < 2
   mload obj 90113
end
if !%actor% || %actor.vnum% != -1
   halt
end
calcuid Girl 90030 mob
if %Girl%
   if %actor.sex% == 2
       mecho - Спасибо тебе, тетечка, дай Бог тебе здоровья и жениха
       mecho не кривого.
   else
       mecho -Ой, дядечку, век помнить буду.
   end
   mexp   %actor% 50000
   mecho Обрадованная девчонка быстро прошмыгнула мимо Вас и скрылась во дворе...
   mpurge %Girl%
end
calcuid Older 90020 mob
if %Older% && %Older.room% == %actor.room%
   mpurge %Older%
   mecho  Старик растворился. На его месте оказался стройный молодой мужчина
   mecho  с орлиным взором.
   mload  mob 90031
end
return  0
wait 1
calcuid Baron 90031 mob
if %actor% && %Baron%
   switch %actor.class%
   case 0
   break
   case 1
     if %random.20% == 1
       mecho Молодой мужчина сказал: Прими за помощь эту книгу.
       mecho Может она и не нужна тебе, но у меня больше ничего нет.
       mload obj 529
       дать книг %actor.name%
     end
   break
   case 2
   if %actor.skill(проникающее оружие)% < 100
      mskilladd %actor.name% проникающ.оруж %random.3%
      дум %actor.name%
      mecho Барон сказал: Я научу тебя, %actor.name%, лучше владеть некоторыми видами оружия.
      вздох
   end
   break
   case 3
   break
   case 4
   if %actor.skill(отравить)% < 100
      mskilladd %actor.name% отравить %random.3%
      дум %actor.name%
      mecho Барон сказал: Я научу тебя, %actor.name%, новым, более сильным рецептам ядов.
      вздох
   end
   break
   case 5
     mecho Молодой мужчина сказал: Прими за помощь немного денег.
     %actor.gold(+15000)%
   break
   case 6
   break
   case 7
   break
   case 8
   break
   case 9
   break
   case 10
   break
   case 11
   break
   case 12
   break
   case 13
   break
   default
   break
   done
*   if %gold%
*      %actor.gold(%gold%)%
*   end

end





~
#90116
Tree <Принцесса вошла в зону 901>~
2 g0 100
0~
if %actor.vnum% != 90007
   halt
end
wait    1
calcuid room   90073 room   
attach  90121  %room.id%
calcuid room   90093 room
attach  90140  %room.id%
attach  90117 %actor.id%
exec    90117 %actor.id%
detach  90117 %actor.id%
attach  90118 %actor.id%
detach  90016 %self.id%





~
#90117
Tree <Трансформация принцессы>~
0 z0 100
0~
mtransform 90037
return     0





~
#90118
Tree <г ЖДИ>~
0 d0 1
стой жди отстань сядь~
if %actor.id% != %Keeper.id%
   halt
end
wait 1
if %actor.sex% == 2
   mecho - О, моя спасительница, я подожду тебя, - сказала принцесса.
else
   mecho - О, отважный рыцарь, мой спаситель, я готова ждать тебя целую вечность, -
   mecho кокетливо протянула принцесса.
end
mtransform 90038
сесть
attach     90119 %self.id%
detach     90118 %self.id%





~
#90119
Tree <г ПОШЛИ>~
0 d0 1
встань пошли следуй вперед~
if %actor.id% != %Keeper.id%
   halt
end
wait 1
if %actor.sex% == 2
   mecho - Я готова, - покорно прошептала принцесса.
else
   mecho - Пойдем, о прекрасный рыцарь,- не сводя с Вас влюбленного
   mecho взгляда пропела принцесса.
end
mtransform 90037
встать
attach     90118  %self.id%
detach     90119  %self.id%





~
#90120
Tree <START ZONE 901>~
2 f0 100
0~
calcuid sorceress 90036 mob
detach  90129     %sorceress.id%

calcuid room   90051 room
attach  90100  %room.id%
calcuid room   90057 room
attach  90109  %room.id%
calcuid room   90058 room
attach  90110  %room.id%
calcuid room   90059 room
attach  90113  %room.id%
calcuid room   90061 room
attach  90114  %room.id%
calcuid room   90048 room
attach  90116  %room.id%
calcuid room   90073 room
detach  90121  %room.id%
calcuid room   90093 room
detach 90140  %room.id%

wdoor   90050 west purge
wdoor   90054 east purge
wdoor   90057 west flags abc
wdoor   90058 east flags abc
wdoor   90076 east  purge
wdoor   90079 west  purge
wdoor   90083 down  flag  abc
wdoor   90058 west  purge
wdoor   90061 west  purge





~
#90121
Tree <Принцесса вошла в лес>~
2 g0 100
0~
if (%actor.vnum% != 90037)
   halt
end
wait   1
attach 90122 %actor.id%
exec   90122 %actor.id%
detach 90122 %actor.id%
wteleport принцесса 90069
wecho Внезапно из-за кустов вылетела ватага оборванцев. Двое из них подхватили испуганную
wecho принцессу и поволокли в лес, а остальные набросились на вас.
wload  mob 90032
wload  mob 90032
wload  mob 90032
detach 90121 %self.id%



~
#90122
Tree <Трансформация и телепортация принцесса>~
0 z0 0
100~
mtransform 90038
return     0
detach     90118 %self.id%
attach     90119 %self.id%





~
#90123
Tree <Зачитан оборванец>~
0 n0 100
0~
attach 90126  %self.id%
set    target %random.pc%
attack %target.name%








~
#90124
Tree <Шамана убили>~
0 f0 100
0~
if %world.curobjs(90116)% < 10 && %random.10% < 2
   mload obj 90116
end
if %world.curobjs(90117)% < 10 && %random.10% < 2
   mload obj 90117
end
mload  mob 90034
return 0





~
#90125
Tree <Зачитан принц>~
0 n0 100
0~
mecho .Внезапно на поляну выскочило ужасного вида чудовище.
wait  1
set   next %self.people%
while %next%
      if %next.vnum% == 90032
         mecho  При виде чудовища оборванец завизжал "Ой, мамочка!" и скрылся в кустах.
         makeuid oborvanec %next.id%
         set     next %next.next_in_room%
         mpurge  %oborvanec%
      else
          set next %next.next_in_room%
      end
done
calcuid princess 90037 mob
if !%princess%
   calcuid princess 90038 mob
   attach  90117 %princess.id%
   exec    90117 %princess.id%
   attach  90118 %princess.id%
   detach  90119 %princess.id%
   detach  90117 %princess.id%
end
if %princess%
   mecho  -Тетя ! - радостно завизжало чудовище и бросилось к принцессе.
   follow принцесса
else
   set    princess %random.pc%
   follow %princess.name%
end
attach  90127 %self.id%
attach  90128 %self.id%
calcuid sorceress 90036 mob
attach  90129 %sorceress.id%
exec    90128 %self.id%
mdoor   90076 east flags a
mdoor   90076 east room  90079
mdoor   90079 west flags a
mdoor   90079 west room  90076
return 0





~
#90126
Tree <Оборванца убили>~
0 f0 100
0~
if %world.curobjs(90114)% < 10 && %random.10% == 1
   mload obj 90114
end
if %world.curobjs(90115)% < 10 && %random.10% == 1
   mload obj 90115
end








~
#90127
Tree <Дамаджнули принца>~
0 p0 100
0~
if %damager.vnum% == -1
   if %damager.sex% == 2
      mecho - Не надо, тетечка, я буду хорошим. - разревел%self.u% %self.name%.
   else
      mecho - Если ты еще раз меня тронешь, я пожалуюсь папе, и он прикажет
      mecho тебя казнить. - заревел%self.g% %self.name%.
   end
   return 1
   halt
end
return 0








~
#90128
Tree <Prince goes>~
0 a0 100
0~
return 0
while 1
      wait 10s
      switch %random.8%
      case 1
      mecho - Какать хочу-у-у, - протянул%self.g% %self.name%.
      break
      case 2
      set  pc %random.pc%
      if %pc.sex% == 2
          mecho - Тетенька, дай конфетку-у-у ! - заревел%self.g% %self.name%.
      else
          mecho - Дяденька, хочу конфетку-у-у ! - заревел%self.g% %self.name%.
      end
      break
      case 3
      mecho - У-у-у, мороженого хочу-у-у ! - заскулил%self.g% %self.name%.
      break
      case 4
      mecho - Возьми на ручки-и-и ! - забасил%self.g% %self.name%.
      break
      case 5
      mecho - Я спать хочу-у-у ! - захныкал%self.g% %self.name%.
      break
      done
done








~
#90129
Tree <Принц зашел к фее>~
0 h0 100
0~
if %actor.vnum% != 90034
   halt
end
wait 1
mecho - Бедный ребенок ! - заголосила %self.name% и начала рвать
mecho _на себе роскошные волосы.
mecho - О, если кто-нибудь бы согласился найти этого ужасного Арнольда,
mecho чтоб ему серы не хватило, я бы ничего не пожалела для этого героя.
set   menno 0
set   pc    %self.people%
while %pc%
      if %pc.vnum% == -1
         if %pc.sex% == 1
            if !%menno%
               mecho Фея многозначительно взглянула на кровать в углу (шикарный надо сказать
               mecho сексодромчик), затем кинула многообещающий взгляд на
               set menno 1
            end
            mecho _%pc.rname%
            msend %pc.name% (А хороша, стерва, -подумали Вы, оценив фигурку под прозрачным пеньюаром)
         end
      end
      set pc %pc.next_in_room%
done
attach 90130 %self.id%



~
#90130
Tree <г СОГЛАСЕН>~
0 d0 1
готов согласен иду~
if %actor.vnum% != -1
   halt
end
wait  1
mecho - Вот и чудесно ! - захлопала в ладоши фея.
mecho - Возьми этот амулет ! Если ты его оденешь - то черти примут тебя за своего.
mload obj 90118
give  амулет %actor.name%
wait  2s
set   pc %self.people%
while %pc%
      set next_pc %pc.next_in_room%
      if %pc.vnum% == -1
          mteleport %pc% 90081
          if %pc.realroom% == 90081
             msend %pc% Вы очутились на дороге, ведущей к черной пещере.
          end
      end
      if %next_pc%
         makeuid pc %next_pc.id%
      else
         set pc 0
      end
done
detach 90129 %self.id%
detach 90130 %self.id%





~
#90131
Tree <Старый черт разгадывает кроссворд>~
0 h0 100
0~
if %actor.vnum% != -1 || %answer% || %self.fighting%
   halt
end
wait 1
attach 90132 %self.id%
while 1
      if !%self.fighting%
         switch %random.3%
         case 1
         mecho - Грешник, торгующий блудницами, семь букв, вторая "у", шестая "е", -
         mecho нараспев проскрипел черт и надолго задумался.
         set    answer сутенер
         global answer
         break
         case 2
         mecho - Игривое название шприца у наркоманов, семь букв, вторая "а", седьмая "а", -
         mecho пробормотал старик и замолк.
         set    answer машинка
         global answer
         break
         case 3
         mecho - Блатной хулиган, шесть букв, первая "б", пятая "а", -
         mecho прошепелявил охранник и начал скрести копытом в затылке.
         set    answer баклан
         global answer
         break
         done
      end
      wait  20s
done








~
#90132
Tree <Сказали что-то охраннику>~
0 d0 0
*~
if %actor.vnum% != -1
   halt
end
wait 1
if (%speech%==%answer%)
   set okquest 1
else
   set okquest 0
end
mecho   Старый черт удивленно поднял глаза.
set     pc  %actor.people%
calcuid amuletObj 90118 obj
set     amulet 0
while %amuletObj% && %pc% && !%amulet%
      if %pc.vnum%==-1
         if %pc.eq(3)%==%amuletObj% || %pc.eq(4)%==%amuletObj%
            set amulet 1
         end
      end
      set pc %pc.next_in_room%
done
if !%amulet%
   mecho  -Бей чужаков ! - завизжал он подсевшим голосом.
   stand
   set    target %random.pc%
   attack %target.name%
   detach 90131  %self.id%
   detach 90132  %self.id%
   halt
end
if !%okquest%
   mecho - Эх, молодежь нынче пошла, ничего не знает ! - сокрушенно пробормотал
   mecho он, и опять уткнулся в кроссворд.
   halt
end
if %actor.sex% == 2
   mecho - Какая смазливая чертовочка, - пропел охранник, пожирая %actor.vname% похотливым
   mecho взглядом, - и неглупа, к тому-же.
else
   mecho - Правильно, - удивленно пробормотал он, - Какой умный молодой черт.
end
wait  1s
mecho - Проходи уж, - продолжил старый черт и открыл турникет.
mdoor  90083 down  purge
mdoor  90083 flags a
mdoor  90083 down  room 90084
detach 90131 %self.id%
detach 90132 %self.id%





~
#90133
Tree <Черт не видит амулета на PC>~
0 q0 100
0~
if %actor.vnum% != -1
   halt
end
set pc  %actor.people%
calcuid amuletObj 90118 obj
set     amulet 0
while %pc% && !%amulet%
      if %pc.vnum%==-1
         if (%pc.eq(3)%==%amuletObj%) || (%pc.eq(4)%==%amuletObj%)
            set amulet 1
         end
      end
      set pc %pc.next_in_room%
done
if !%amulet%
   wait   1
   mecho  - Бей чужаков ! - заревел%self.g% %self.name%.
   stand
   set    target %random.pc%
   attack %target.name%
   halt
end








~
#90134
Tree <Арнольда убили>~
0 f0 100
0~
calcuid prince 90034 mob
if !%prince%
   halt
end
attach  90135 %prince.id%
exec    90135 %prince.id%
detach  90135 %prince.id%
if %actor.vnum% != -1
   halt
end
calcuid sorceress 90036 mob
attach  90136 %sorceress.id%
makeuid Killer %actor.id%
remote  Killer %sorceress.id%





~
#90135
Tree <Трансформация принца обратно>~
0 z0 0
*~
mtransform 90035
follow     me
return     0





~
#90136
Tree <Вернулись к принцессе>~
0 q0 100
*~
if %actor.name% != %Killer.name%
   halt
end
wait   1
mecho  - Я очень благодарна тебе, %actor.name% ! - обрадовано закричала фея.
if %actor.sex% == 1
   msend %actor% Она бросилась к Вам на шею и Ваши губы встретились. Вы обняли ее...
   msend %actor% (Что было дальше - Вы можете придумать сами. В общем эту, интимную,
   msend %actor% часть обещанной награды, она, будем считать, отдала)
end
wait 2
mecho Фея весело засмеялась, посмотрев на %actor.rname% и хлопнув в ладоши произнесла мудреное заклинание.
wait 1
switch %actor.class%
*лекарь
  case 1
   if %actor.skill(лидерство)% < 100
      mskilladd %actor.name% лидерство %random.3%
   else 
      дум %actor.name%
      mecho Фея глядя на %actor.rname% сказала: "Hепонятно, или заклинание слабое, или твоя тупая бошка не воспринимает знания!"
      вздох
   end
  break
*вор
  case 2
   if %actor.skill(короткие лезвия)% < 100
      mskilladd %actor.name% корот.лезви %random.3%
   else 
      дум %actor.name%
      mecho Фея сказала: Я научу тебя, %actor.name%, лучше владеть некоторыми видами оружия.
      вздох
   end
  break
*богатырь
  case 3
   if %actor.skill(богатырский молот)% < 100
      mskilladd %actor.name% богатырский.молот %random.3%
   else 
      дум %actor.name%
      mecho Фея глядя на %actor.rname% сказала: "Hепонятно, или заклинание слабое, или твоя тупая бошка не воспринимает знания!"
      вздох
   end
  break
*наемник
  case 4
   if %actor.skill(короткие лезвия)% < 100
      mskilladd %actor.name% корот.лезви %random.3%
   else 
      дум %actor.name%
      mecho Фея сказала: Я научу тебя, %actor.name%, лучше владеть некоторыми видами оружия.
      вздох
   end
  break
*друж
  case 5
   if %actor.skill(осторожный стиль)% < 100
      mskilladd %actor.name% осторожный.стиль %random.3%
   else 
      дум %actor.name%
      mecho Фея глядя на %actor.rname% сказала: "Hепонятно, или заклинание слабое, или твоя тупая бошка не воспринимает знания!"
      вздох
   end
  break
*витязь
  case 9
   if %actor.skill(точный стиль)% < 100
      mskilladd %actor.name% точный.стиль %random.3%
   else 
      дум %actor.name%
      mecho Фея глядя на %actor.rname% сказала: "Hепонятно, или заклинание слабое, или твоя тупая бошка не воспринимает знания!"
      вздох
   end
  break
*охотник
  case 10
   if %actor.skill(луки)% < 100
      mskilladd %actor.name% луки %random.3%
   else 
      дум %actor.name%
      mecho Фея глядя на %actor.rname% сказала: "Hепонятно, или заклинание слабое, или твоя тупая бошка не воспринимает знания!"
      вздох
   end
  break
*кузнец
  case 11
   if %actor.skill(заточить)% < 100
      mskilladd %actor.name% заточить %random.3%
   else 
      дум %actor.name%
      mecho Фея глядя на %actor.rname% сказала: "Hепонятно, или заклинание слабое, или твоя тупая бошка не воспринимает знания!"
      вздох
   end
  break
*купец
  case 12
   if %actor.skill(метнуть)% < 100
      mskilladd %actor.name% метнуть %random.3%
      Say Сообщить Стрибогу параметр ----- %actor.class%
   else 
      дум %actor.name%
      mecho Фея глядя на %actor.rname% сказала: "Hепонятно, или заклинание слабое, или твоя тупая бошка не воспринимает знания!"
      вздох
   end
  break
  default
   дум
   wait 3
   say Что-то или подустала я, или руки потные, не получилось ничего....
   вздох
  break
done   

detach 90136 %self.id%








~
#90137
Tree <Убит черт с дубинкой>~
0 f0 100
0~
if (%world.curobjs(90119)% < 10) && (%random.10% < 2)
   mload obj 90119
end








~
#90138
Tree <Убит черт в кожанке>~
0 f0 100
0~
if (%world.curobjs(90120)% < 10) && (%random.10% < 2)
   mload obj 90120
end








~
#90140
Tree <Принцесса попала в последнюю комнату зоны>~
2 g0 100
0~
if %actor.vnum% != 90037
   halt
end
wait    1
wforce  %actor% follow me
wpurge  %actor%
switch %random.10%
case 1
 if %world.curobjs(544)%==0
  wecho Прими за помощь эту книгу.
  wload obj 544
 end
 break
* контроль погоды
case 2
 if %world.curobjs(545)%==0
  wecho Прими за помощь эту книгу.
  wload obj 545
 end
 break
* свет
case 3
 if %world.curobjs(546)%==0
  wecho Прими за помощь эту книгу.
  wload obj 546
 end
 break
 default
wecho На земле прямо под вашими ногами вдруг проступила надпись: Спасибо.
wecho Хоть бы налили, ну да ладно, хоть не скучно было, подумали вы.
  wait 1s
wecho Только вы об этом подумали откудато сверху что-то упало.
  wload obj 101
  wload obj 102
  wload obj 103
 end
 break
done





~
$
$
