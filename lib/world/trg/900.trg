#90000
Tree <Начало квеста>~
0 q 100
1~
if (%actor.vnum% != -1)
   halt
end
wait  1
msend %actor% _- Приветствую тебя, почтенн%actor.w% !
msend %actor% Я прибыл из далекой Тмутаракани !
msend %actor% Злобный тиран узурпировал трон нашей великой страны.
msend %actor% Если ты поможешь вернуть на престол законного наследника
msend %actor% старинного рода - твое имя войдет в историю наравне с
msend %actor% именами Кая Великого и Хлодвига Справедливого...
msend %actor% _- Готов ли ты отправиться в этот далекий путь ?
attach 90001 %self.id%
~
#90001
Tree <Ответили ДА>~
0 d 1
да yes jar~
if (%actor.vnum% != -1)
halt
end
wait 1
mecho ____Старик тяжело поднялся и, кряхтя, открыл сундук.
mecho На свет появилась коробочка темного дерева, украшенная золотыми молниями.
mecho В ней находилась измельченная волшебная трава. Затем он раскалил угли
mecho в жаровне и бросил туда горсть зеленого порошка.
mecho ____Едкий дым клубами поднялся к потолку.
mecho _- Carambella, tarriba, far trakas, - загробным голосом произносил
mecho старик старинное заклинание, - Churakka var xolita ! Varrida gur
mecho xo...
mecho    Тут дым попал старику в нос, он поперхнулся, закашлялся и вместо
mecho магического слова "xochura", завершавшего заклинание, произнес 
mecho "xochucha"...
wait  2s
eval num 0
foreach pc %self.pc%
if %pc.rentable%
mteleport %pc% 90001 horse
msend %pc% Вы очнулись посреди какой-то вонючей лужи...
eval num %num%+1
end
if %num% > 2
break
end
done
attach 90002 %self.id%
detach 90000 %self.id%
detach 90001 %self.id%
~
#90002
Tree <Кто-то что-то сказал>~
0 d 0
*~
if (%actor.vnum% != -1)
   halt
end
wait  1
msend %actor% "Я ошень пльохо тебя понимай" - сказал старик.
~
#90003
Tree <Установить дверь в комнату 90013>~
2 c 1
стучать колотить ломиться~
if (%actor.vnum% != -1)
   return 0
   halt
end
if !(%arg.contains(двер)%)
   return 0
   halt
end
wait  1
wecho _- Войди, о человече, в свой последний приют, - послышался торжественный
wecho голос...
wdoor   90011 east flags ab
wdoor   90011 east room  90013
detach  90003 %self.id%
~
#90004
Tree <Вошли к старику в красной халамиде>~
2 e 100
1~
wait   1
wecho _- Вот и окончился твой жизненный путь!
wecho Из тени вышел хозяин избушки, высокий старик в красной халамиде.
wload   mob 90003
attach  90006 %self.id%
detach  90004 %self.id%
~
#90005
Tree <Зачитан старик в красной халамиде>~
0 n 100
1~
wait  5s
if !%self.fighting%
   mecho _- Готовься принять смерть на черном алтаре, в честь Великого и Ужасного
   mecho демона преисподней, имя которого Абавул, - торжественно протянул старик.
   wait  5s
end
if !%self.fighting%
   mecho Изо рта у старика вылезли клыки, кожа стала зеленовато пятнистой, а руки
   mecho начали вытягиваться, как резиновые.
   mecho Выхватив здоровенный ржавый тесак он ринулся вперед.
   set FirstEnter %random.pc%
   mkill %FirstEnter%
   halt
end
~
#90006
Tree <РАЗБИТЬ БУТЫЛЬ>~
2 c 1
разбить расколоть~
if (%actor.vnum% != -1)
   return 0
   halt
end
if !%arg.contains(бутыль)%
   return 0
   halt
end
calcuid target 90002 obj
if !%target%
   return 0
   halt
end
wait    1
wpurge  %target%
wecho   Бутыль с грохотом раскололась.
if %exist.mob(90003)% 
calcuid mob 90003 mob
end
if %mob%
   wecho Старик охнул, весь сжался и исчез в клубах смрадного дыма.
   wpurge %mob%
end
wdoor 90013 east flags a
wdoor 90013 east room  90014
set     mob 0
calcuid mob 90004 mob
if %mob%
   wpurge %mob%
   wait   1
   wecho  В тот же миг пес превратился в дрожащего, абсолютно голого мужика.
   wload  mob 90005
end
detach 90006 %self.id%
~
#90007
Tree <Зачитан голый мужик>~
0 n 100
0~
wait 1
mecho _- О, Великие Боги, вы убили злого колдуна и разбили волшебный сосуд,
mecho подаренный ему демонами ада. - прошептал мужик, падая на грязный пол.
mecho _- Теперь рухнули черные чары, я и другие жертвы снова обрели человеческий
mecho облик. Так знайте же - в соседней комнате, под тряпьем, лежит еще одна
mecho жертва. Спасите ее и отведите к брату, и он щедро наградит вас.
~
#90008
Tree <Старик в красной халамиде убит>~
0 f 100
0~
if %world.curobjs(90003)% < 10 && %random.100% < 10
   mload obj 90003
end
if %world.curobjs(90004)% < 10 && %random.100% < 10
   mload obj 90004
end
*mdoor 90013 east flags a
*mdoor 90013 east room 90014
~
#90009
Tree <Кто-то что-то сказал старику>~
0 d 2
*~
if (%actor.vnum% != -1)
   halt
end
wait 1
if !(%self.fighting%)
   mecho _- Молчи, червь ! - взвизгнул старик фальцетом, моментально утратив
   mecho всю торжественность.
   mecho Изо рта у старика вылезли клыки, кожа стала зеленовато пятнистой, а руки
   mecho начали вытягиваться, как резиновые.
   mecho Выхватив здоровенный ржавый тесак он ринулся вперед.
   mkill %actor%
end
detach 90009 %self.id%
~
#90010
Tree <РАЗГРЕСТИ ТРЯПЬЕ>~
2 c 0
разгрести отбросить отшвырнуть~
if (%actor.vnum% != -1)
   return 0
   halt
end
if !(%arg.contains(тряпь)%) && !(%arg.contains(куч)%)
   return 0
   halt
end
wait 1
calcuid trap 90005 obj
if %trap%
   wpurge %trap%
   wsend %actor% Вы разгребли кучу тряпья... 
   wsend %actor% Под ней Вы обнаружили связанную девушку.
   wechoaround %actor% %actor.name% разгреб%actor.q% кучу тряпья...
   wload  mob 90006
end
calcuid room 90014 room
detach  90010 %room.id%
~
#90011
Tree <ОСВОБОДИТЬ ПРИНЦЕССУ>~
2 c 0
развязать освободить~
if (%actor.vnum% != -1)
   return 0
   halt
end
if !(%arg.contains(принцесс)%) && !(%arg.contains(девушк)%)
   return 0
   halt
end
wait 1
calcuid target 90006 mob
if !%target%
   halt
end
wpurge %target%
wsend %actor% Вы развязали юное создание...
wechoaround %actor% %actor.name% освободил%actor.g% девушку.
wload obj 90000
wload mob 90007
calcuid target 90007 mob
if %actor.sex% == 1
  wecho _- Спасибо тебе, мой спаситель ! Отведи меня к моему брату и он
  wecho щедро наградит тебя. Правда, путь к замку долог и опасен, впереди лежит
  wecho глухой лес, населенный страшными чудовищами и злодеями-разбойниками.
  wecho И еще многое другое...
  wecho Но тебе, о герой, победитель колдуна, не страшны никакие опасности.
else
  wecho _- Спасибо тебе, моя спасительница ! Отведи меня к моему брату и он
  wecho щедро наградит тебя. Правда, путь к замку долог и опасен, впереди лежит
  wecho глухой лес, населенный страшными чудовищами и злодеями-разбойниками.
  wecho И еще многое другое...
  wecho Но тебе, о бесстрашная амазонка, победительница колдуна, не страшны
  wecho никакие опасности.
end
wforce %target% follow %actor.name%
makeuid Keeper %actor.id%
remote Keeper %target.id%
calcuid room 90017 room
attach 90012 %room.id%
detach 90011 %self.id%
~
#90012
Tree <Вышли на поляну к демону>~
2 g 100
0~
if %actor.vnum% != 90007
   halt
end
wait 1
wecho ___Внезапно завыл ветер, захлопали огромные крылья, и на тропинку приземлился
wecho здоровенный рогатый демон.
wload mob 90008
calcuid Demon 90008 mob
wforce %Demon% attack %actor.name%
calcuid room 90017 room
detach 90012 %self.id%
~
#90013
Tree <PC пытался повредить принцессу>~
0 p 100
0~
if %damager.vnum% == -1
   return 1
   wait   1
   msend  %damager% - Не бей меня ! - взмолилась принцесса и залилась слезами.
   halt
end
return 0
~
#90014
Tree <Абавул убит>~
0 f 100
0~
if %world.curobjs(90007)% < 10 && %random.100% < 10
   mload obj 90007
end
if %world.curobjs(90008)% < 10 && %random.100% < 10
   mload obj 90008
end
calcuid House 90018 room
attach  90016 %House.id%
~
#90015
Tree <ОГРЕТЬ по БАШКЕ>~
0 c 1
огреть ударить навернуть вмазать оглушить треснуть~
if !%arg.contains(голов)% && !%arg.contains(башк)%
   return 0
   halt
end
wait    1
mecho   _- Только не по голове,- простонал Абавул, и повалился на землю.
mecho   Труп Абавула сморщился и превратился в прах земной.
calcuid House 90018 room
attach  90016 %House.id%
mpurge  %self%
~
#90016
Tree <КОПАТЬСЯ МУСОР>~
2 c 0
копаться разгрести рыться~
if !(%arg.contains(мусор)%) && !(%arg.contains(куч)%)
   return 0
   halt
end
wsend %actor% Вы запустили руку по самый локоть в кучу мусора...
wsend %actor% и нащупали что-то круглое и скользкое!
wechoaround %actor% %actor.name% запустил%actor.g% по локоть руки в кучу мусора.
wload  obj 90006
wait 1
detach  90016 %self.id%
~
#90017
Tree <Принцесса пришла к леснику с востока>~
2 g 100
0~
if (%actor.vnum% != 90007) || !(%direction.contains(east)%)
   halt
end
wait  1
wecho Окно со звоном распахнулось и в комнату влетели 2 огромные летучие мыши.
wecho Их глаза горели адским пламенем.
wecho Мыши захохотали дьявольскими голосами, смерчем закружились по комнате, и,
wecho подхватив юную принцессу, вылетели в окно. 
if %random.2% == 1
   eval roomis 90041+%random.2%
else
   eval roomis 90044+%random.2%
end
wteleport %actor% %roomis%
wdoor 90022 west flags a
wdoor 90022 west room 90023
wdoor 90023 east flags a
wdoor 90023 east room 90022
detach 90017 %self.id%
~
#90018
Tree <Граф Дракула убит>~
0 f 100
0~
mload obj 90001
if (%world.curobjs(216)%) < 50 && (%random.5% == 4)
   mload obj 216
end
if (%world.curobjs(90012)%) < 10 && (%random.10% < 2)
   * mload obj 90012
   halt
end
if (%world.curobjs(571)%) < 1 && (%random.10% < 2)
   mload obj 571
end
if %world.curobjs(1232)% < 1
if %world.curobjs(1231)% < 1
if %random.100% < 3
mload obj 1232
end
end
end
~
#90019
Tree <Граф Дракула сражается>~
0 k 100
0~
if !%exist.mob(90012)%
detach 90019 %self.id%
halt
end
calcuid  blondies 90012 mob
   if (%blondies.room% == %self.room%)
     halt
   end
   exec 90024 %blondies.id%
detach 90019 %self.id%
~
#90020
Tree <START TRIGGER ZONE 900>~
2 f 100
0~
wdoor   90011 east  purge
wdoor   90013 east  purge
wdoor   90023 east  purge
wdoor   90022 west  purge
wdoor   90026 south purge
calcuid wld 90011 room
attach  90003 %wld.id%
calcuid wld 90013 room
attach  90004 %wld.id%
detach  90006 %wld.id%
calcuid wld 90014 room
attach  90010 %wld.id%
attach  90011 %wld.id%
calcuid wld 90018 room
detach  90016 %wld.id%
calcuid wld 90025 room
attach  90017 %wld.id%
calcuid wld 90026 room
attach  90045 %wld.id%
calcuid sorceress 90036 mob
detach  90054     %sorceress.id%
calcuid room   90051 room
attach  90025  %room.id%
calcuid room   90057 room
attach  90034  %room.id%
calcuid room   90058 room
attach  90035  %room.id%
calcuid room   90059 room
attach  90038  %room.id%
calcuid room   90061 room
attach  90039  %room.id%
calcuid room   90048 room
attach  90041  %room.id%
calcuid room   90073 room
detach  90046  %room.id%
calcuid room   90093 room
detach 90065  %room.id%
wdoor   90050 west purge
wdoor   90054 east purge
wdoor   90057 west flags abc
wdoor   90058 east flags abc
wdoor   90076 east  purge
wdoor   90079 west  purge
wdoor   90083 down  flag  abc
wdoor   90058 west  purge
wdoor   90061 west  purge
calcuid volshebnik 90017 mob
detach 90002 %volshebnik.id%
attach 90000 %volshebnik.id%
end
~
#90021
Tree <Убита русалка>~
0 f 100
0~
if %world.curobjs(90009)% < 15 && %random.100% < 10
   mload obj 90009
end
~
#90022
Tree <Убита блондинка>~
0 f 100
0~
if %world.curobjs(90010)% < 4 && %random.100% < 10
   mload obj 90010
end
~
#90023
Tree <Убита брюнетка>~
0 f 100
0~
if %world.curobjs(90011)% < 10 && %random.100% < 10
   mload obj 90011
end
~
#90024
Tree <Блондинка встала и телепортнулась на помощь>~
0 z 100
0~
if %self.fighting%
   halt
end
stand
mteleport %self% 90039
~
#90025
Tree <Вошли в трактир>~
2 e 100
0~
calcuid BadGuy 90022 mob
attach  90026 %BadGuy.id%
exec    90026 %BadGuy.id%
return  1
calcuid room  90051 room
detach  90025 %self.id%
~
#90026
Tree <Вырвиглаз обижает старика>~
0 b 100
0~
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
~
#90027
Tree <Вырвиглаз убит>~
0 f 100
~
mload obj 90021
if %world.curobjs(90017)% < 10 && %random.10% < 2
   mload obj 90017
end
if %world.curobjs(90018)% < 10 && %random.10% < 2
   mload obj 90018
end
if %world.curobjs(90020)% < 10 && %random.10% < 2
   mload obj 90020
end
calcuid Baron 90020 mob
attach  90028 %Baron.id%
~
#90028
Tree <Нищему старику дали кошель>~
0 j 100
0~
if %object.vnum% != 90021
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
detach 90028 %self.id%
~
#90029
Tree <PC зашел к великанам>~
0 q 100
0~
wait 1
mecho - Привет, карлики, куда топаете ? - осклабился великан.
attach 90030 %self.id%
~
#90030
Tree <г ОХОТИМСЯ НА ВЕЛИКАНОВ>~
0 d 0
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
attach  90031 %velik.id%
detach  90029 %velik.id%
detach  90030 %velik.id%
~
#90031
Tree <г ТАЩИ ВТОРОГО>~
0 d 0
веди приведи тащи~
if (!%speech.contains(второго)% && !%speech.contains(брат)%) || (%actor.id% != %Hero.id%)
   halt
end
calcuid second 90025 mob
if %second%
   calcuid room 90056 room
   attach  90032 %room.id%
   exec    90032 %room.id%
   detach  90032 %room.id%
   if (%second.room% == %self.room%)
      wait 1
      attach  90033 %self.id%
      mecho - Щас !- обрадованно закивал громила и поплелся на запад.
      mecho Вскоре он показался, таща за руку хнычущего и упирающего
      mecho великана, только абсолютно белого.
      mecho - Не ешьте нас, - заревели братья, и принялись размазывать
      mecho грязные потоки по щекам.- Мы будем послушными, - продолжали
      mecho они, истекая слезами.
   end
end
detach  90031 %self.id%
~
#90032
Tree <телепортируем белого великана>~
2 z 100
100~
calcuid giant 90025 mob
wteleport %giant% 90056
~
#90033
Tree <г ДЕРИТЕСЬ>~
0 d 0
деритесь бейтесь~
if %actor.id% != %Hero.id%
   halt
end
mkill   белый
detach  90033 %self.id%
~
#90034
Tree <ТРЕСНУТЬ ВОРОТА>~
2 c 1
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
detach  90034 %room.id%
~
#90035
Tree <PC зашел во двор>~
2 e 100
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
detach  90035 %self.id%
~
#90036
Tree <Тенгиза замочили>~
0 f 100
~
if %world.curobjs(90022)% < 10 && %random.10% < 2
   mload obj 90022
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
#90037
Tree <Нарбека замочили>~
0 f 100
~
if %world.curobjs(90023)% < 10 && %random.10% < 2
   mload obj 90023
end
if %world.curobjs(90024)% < 10 && %random.10% < 2
   mload obj 90024
end
mdoor 90058 west flags a
mdoor 90058 west room  90059
~
#90038
Tree <PC вошел в замок>~
2 e 100
0~
if %started%
   halt
end
wait  1
set   started 1
while %IbnNalim%
      set     IbnNalim 0
      calcuid IbnNalim 90028 mob
      if !(%IbnNalim%)
         halt
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
detach  90038 %self.id%
~
#90039
Tree <PC вошел в первую комнату замка>~
2 e 100
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
detach  90038  %wizard.id%
detach  90039  %self.id%
~
#90040
Tree <ИбнНалима замочили>~
0 f 100
~
if %world.curobjs(90025)% < 10
if %random.10% == 1
mload obj 90025
end
end
if %world.curobjs(90026)% < 10
if %random.10% == 1
mload obj 90026
end
end
if %world.curobjs(90027)% < 10
if %random.10% == 1
mload obj 90027
end
end
if %world.curobjs(90028)% < 10
if %random.10% == 1
mload obj 90028
end
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
%actor.exp(+50000)
mecho Обрадованная девчонка быстро прошмыгнула мимо Вас и скрылась во дворе...
mpurge %Girl%
end
calcuid Older 90020 mob
if %Older%
if %Older.realroom% == %actor.realroom%
mpurge %Older%
mecho Старик растворился. На его месте оказался стройный молодой мужчина
mecho с орлиным взором.
end
end
return 0
set Hero %actor%
global Hero
calcuid qroom %self.realroom% room
remote Hero %qroom.id%
exec 90067  %qroom.id%
~
#90041
Tree <Принцесса вошла в зону 901>~
2 g 100
0~
if %actor.vnum% != 90007
   halt
end
wait    1
calcuid room   90073 room   
attach  90046  %room.id%
calcuid room   90093 room
attach  90065  %room.id%
attach  90042 %actor.id%
exec    90042 %actor.id%
detach  90042 %actor.id%
attach  90043 %actor.id%
detach  90016 %self.id%
~
#90042
Tree <Трансформация принцессы>~
0 z 100
0~
mtransform 90037
return     0
~
#90043
Tree <г ЖДИ>~
0 d 1
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
attach     90044 %self.id%
detach     90043 %self.id%
~
#90044
Tree <г ПОШЛИ>~
0 d 1
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
attach     90043  %self.id%
detach     90044  %self.id%
~
#90045
Tree <Принцесса вошла в последнюю комнату зоны>~
2 g 100
0~
if (%actor.vnum% != 90007)
   halt
end
wait 1
wecho Ветви деревьев расступились, открыв путь на юг.
wdoor  90026  south room 90048
detach 90045 %self.id%
~
#90046
Tree <Принцесса вошла в лес>~
2 g 100
0~
if (%actor.vnum% != 90037)
   halt
end
wait   1
attach 90047 %actor.id%
exec   90047 %actor.id%
detach 90047 %actor.id%
wteleport принцесса 90069
wecho Внезапно из-за кустов вылетела ватага оборванцев. Двое из них подхватили испуганную
wecho принцессу и поволокли в лес, а остальные набросились на вас.
wload  mob 90032
wload  mob 90032
wload  mob 90032
detach 90046 %self.id%
~
#90047
Tree <Трансформация и телепортация принцесса>~
0 z 0
100~
mtransform 90038
return     0
detach     90043 %self.id%
attach     90044 %self.id%
~
#90048
Tree <Зачитан оборванец>~
0 n 100
0~
attach 90051  %self.id%
set    target %random.pc%
attack %target.name%
~
#90049
Tree <Шамана убили>~
0 f 100
0~
if %world.curobjs(90031)% < 10 && %random.10% < 2
   mload obj 90031
end
if %world.curobjs(90032)% < 10 && %random.10% < 2
   mload obj 90032
end
mload  mob 90034
return 0
~
#90050
Tree <Зачитан принц>~
0 n 100
0~
mecho Внезапно на поляну выскочило ужасного вида чудовище.
wait 1
foreach next %self.npc%
if %next.vnum% == 90032
mecho При виде чудовища оборванец завизжал "Ой, мамочка !" и скрылся в кустах.
set oborvanec %next%
wait 1
mpurge %oborvanec%
end
done
if %exist.mob(90037)%
calcuid princess 90037 mob
end
if !%princess%
if %exist.mob(90038)%
calcuid princess 90038 mob
attach 90042 %princess.id%
exec 90042 %princess.id%
attach 90043 %princess.id%
detach 90044 %princess.id%
detach 90042 %princess.id%
end
end
if %princess%
mecho -Тетя ! - радостно завизжало чудовище и бросилось к принцессе.
follow принцесса
else
set princess %random.pc%
follow %princess.name%
end
attach 90052 %self.id%
attach 90053 %self.id%
if %exist.mob(90036)%
calcuid sorceress 90036 mob
attach 90054 %sorceress.id%
end
exec 90053 %self.id%
mdoor 90076 east flags a
mdoor 90076 east room  90079
mdoor 90079 west flags a
mdoor 90079 west room  90076
return 0
~
#90051
Tree <Оборванца убили>~
0 f 100
0~
if %world.curobjs(90029)% < 10 && %random.10% == 1
   mload obj 90029
end
if %world.curobjs(90030)% < 10 && %random.10% == 1
   mload obj 90030
end
~
#90052
Tree <Дамаджнули принца>~
0 p 100
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
#90053
Tree <Prince goes>~
0 b 100
0~
wait 1s
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
~
#90054
Tree <Принц зашел к фее>~
0 h 100
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
foreach tpc %self.pc%
if %tpc.sex% == 1
if !%menno%
mecho Фея многозначительно взглянула на кровать в углу (шикарный надо сказать
mecho сексодромчик), затем кинула многообещающий взгляд на
set menno 1
end
mecho %tpc.rname%
msend %tpc.name% (А хороша, стерва, -подумали Вы, оценив фигурку под прозрачным пеньюаром)
end
done
attach 90055 %self.id%
~
#90055
Tree <г СОГЛАСЕН>~
0 d 1
готов согласен иду~
if %actor.vnum% != -1
   halt
end
wait  1
mecho - Вот и чудесно ! - захлопала в ладоши фея.
mecho - Возьми этот амулет ! Если ты его оденешь - то черти примут тебя за своего.
mload obj 90033
give  амулет %actor.name%
wait  2s
foreach tpc %self.pc%
mteleport %tpc% 90081
msend %tpc% Вы очутились на дороге, ведущей к черной пещере.
done
detach 90054 %self.id%
detach 90055 %self.id%
~
#90056
Tree <Старый черт разгадывает кроссворд>~
0 h 100
0~
if %actor.vnum% != -1 || %answer% || %self.fighting%
   halt
end
wait 1
attach 90057 %self.id%
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
~
#90057
Tree <Сказали что-то охраннику>~
0 d 0
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
calcuid amuletObj 90033 obj
foreach target %self.pc%
set amulet 0
if %target.eq(4)%==%amuletObj%
set amulet 1
end
if %target.eq(3)%==%amuletObj%
set amulet 1
end
if %amulet%
break
end
done
if !%amulet%
mecho -Бей чужаков ! - завизжал он подсевшим голосом.
stand
set target %random.pc%
attack %target.name%
detach 90056  %self.id%
detach 90057  %self.id%
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
wait 1s
mecho - Проходи уж, - продолжил старый черт и открыл турникет.
mdoor 90083 d purge
mdoor 90083 d room 90084
*mdoor 90083 flags a - это лишнее
detach 90056 %self.id%
detach 90057 %self.id%
~
#90058
Tree <Черт не видит амулета на PC>~
0 q 100
0~
if %actor.vnum% != -1
   halt
end
calcuid amuletObj 90033 obj
foreach target %self.pc%
set amulet 0
if %target.eq(4)%==%amuletObj%
set amulet 1
end
if %target.eq(3)%==%amuletObj%
set amulet 1
end
if %amulet%
break
end
done
if !%amulet%
wait 1
mecho - Бей чужаков ! - заревел%self.g% %self.name%.
stand
set target %random.pc%
attack %target.name%
halt
end
~
#90059
Tree <Арнольда убили>~
0 f 100
0~
calcuid prince 90034 mob
if !%prince%
   halt
end
attach  90060 %prince.id%
exec    90060 %prince.id%
detach  90060 %prince.id%
if %actor.vnum% != -1
   halt
end
calcuid sorceress 90036 mob
attach  90061 %sorceress.id%
makeuid Killer %actor.id%
remote  Killer %sorceress.id%
~
#90060
Tree <Трансформация принца обратно>~
0 z 0
*~
mtransform 90035
follow     me
return     0
~
#90061
Tree <Вернулись к принцессе>~
0 q 100
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
if %actor.skill(заколоть)% < 100
mskilladd %actor.name% заколоть %random.3%
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
if %actor.skill(подножка)% < 100
mskilladd %actor.name% подножка %random.3%
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
   if %actor.skill(ремонт)% < 100
      mskilladd %actor.name% ремонт %random.3%
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
detach 90061 %self.id%
case 13
~
#90062
Tree <Убит черт с дубинкой>~
0 f 100
0~
if (%world.curobjs(90035)% < 10) && (%random.10% < 2)
   mload obj 90035
end
~
#90063
Tree <Убит черт в кожанке>~
0 f 100
0~
if (%world.curobjs(90034)% < 10) && (%random.10% < 2)
   mload obj 90034
end
~
#90065
Tree <Принцесса попала в последнюю комнату зоны>~
2 g 100
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
#90066
tree <Барон выдает награду>~
0 z 100
~
wait 1
switch %Hero.class%
case 2
if %Hero.skill(проникающее оружие)% < 100
mskilladd %Hero.name% проникающ.оруж %random.3%
дум %Hero.name%
mecho Барон сказал: Я научу тебя, %Hero.name%, лучше владеть некоторыми видами оружия.
вздох
end
break
case 4
if %Hero.skill(отравить)% < 100
mskilladd %Hero.name% отравить %random.3%
дум %Hero.name%
mecho Барон сказал: Я научу тебя, %Hero.name%, новым, более сильным рецептам ядов.
вздох
end
break
default
mecho Молодой мужчина сказал: Прими за помощь немного денег.
%Hero.gold(+1500)%
done
~
#90067
загрузка барона~
2 z 100
~
wload mob 90031
wait 2
calcuid Baron 90031 mob
remote Hero %baron.id%
exec 90066  %baron.id%
rdelete Hero %self.id%
~
$~
