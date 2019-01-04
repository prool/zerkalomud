#4000
триггер на скорняке ~
0 j 100
~
wait 2
switch %object.name% 
  case труп мыши
    say  Благодарствую, ты меня выручаешь, получи плату. 
    %self.gold(+1)%
    дать 1 кун %actor.name%
    mpurge труп 
  break
  case труп норки
    say    Благодарствую, получится хорошая шкурка на шубу, получи плату. 
    %self.gold(+20)%
    дать   20 кун %actor.name%
    mpurge труп 
  break
  case труп лисы
    say    Благодарствую, получится хорошая шкурка на шубу, получи плату. 
    %self.gold(+30)%
    дать   30 кун %actor.name%
    mpurge труп 
  break
  case труп медведя
    say    Благодарствую, получится превосходный тулуп, получи плату. 
    %self.gold(+80)%
    дать   80 кун %actor.name%
    mpurge труп 
  break
  case труп зайца
    say    Благодарствую, получится хорошая шапка, получи плату. 
    %self.gold(+10)%
    дать   10 кун %actor.name%
    mpurge труп 
  break
  case труп ондатры
    say    Благодарствую, получится хороший воротник, получи плату. 
    %self.gold(+40)%
    дать   40 кун %actor.name%
    mpurge труп 
  break
  case труп бобра
    say    Благодарствую, хороший мех, получи плату. 
    %self.gold(+25)%
    дать   25 кун %actor.name%
    mpurge труп 
  break
  case труп барсука
    say    Благодарствую, хороший мех, получи плату. 
    %self.gold(+25)%
    дать   25 кун %actor.name%
    mpurge труп 
  break
  case труп выдры
    say    Благодарствую, хороший мех, получи плату. 
    %self.gold(+22)%
    дать   22 кун %actor.name%
    mpurge труп 
  break
  default
    say  Зачем мне это? 
    eval getobject %object.name%
    if  %getobject.car% == труп
      mpurge труп
    else
      броси %getobject.car%.%getobject.cdr%
    end
  break
done 
~
#4001
триггер на хозяйке мельницы ~
0 q 100
~
if %actor.level% >= 10 || (%actor.gold% >= 20) || (%actor.bank% >= 20) 
  halt
end
wait  1
msend %actor% Хозяйка сказала Вам:
if %actor.sex% == 1
  msend %actor% - Эх ты горемычный, голодный наверное, %actor.name%.
elseif
  %actor.sex% == 2
  msend %actor% - Эх ты горемычная, голодная наверное, %actor.name%.
end
msend %actor% - Что мы нехристи чтоли, чтоб не накормить. 
*  msend %actor% - всегда найду чем накормить, 
msend   %actor% - Сейчас, подожди...
dg_cast 'насыщение' %actor.name%
~
#4002
входнапостой~
0 r 100
~
wait 1
eval factor %self.people%
while %factor%
  eval pc %factor.next_in_room%
  if (%factor.vnum% == -1) && (%factor.level%>19) && (%factor.level%<31)
    if %factor.sex%==1
      tell %factor.name% Вырос ты уже, нечего тебе здесь штаны просиживать.
    else
      tell %factor.name% Выросла ты уже, нечего тебе здесь юбку просиживать.
    end
    tell %factor.name% Не пушу я тебя здесь на постой, иди в город, там где большие нужны.
    tell %factor.name% А от вас только проблемы здесь будут.
    mechoaround %factor% Хозяин вытолкнул %factor.vname% на улицу.
    msend %factor.name% Хозяин вытолкнул вас на улицу.
    mteleport %factor.name% 4014
    mteleport %factor.name% 4014
    mteleport %factor.name% 4014
    mteleport %factor.name% 4014
    mteleport %factor.name% 4014
    mteleport %factor.name% 4014
    mteleport %factor.name% 4014
    if %factor.sex%==1
      mat 4014 mechoaround %factor% Немного взлохмаченный %factor.name% пришел с запада.
    else
      mat 4014 mechoaround %factor% Немного взлохмаченная %factor.name% пришла с запада.
    end
  end
  if %pc.id% && %pc.id%!=%factor.id%
    makeuid factor %pc.id%
  else
    unset factor
  end
done
~
#4003
нападениежителя~
0 k 100
~
set name2 %actor%
if %actor.leader%
  set name1 %actor.leader%
  if (%name1.vnum% == -1) && (%actor.vnum% != -1))
    set name2 %actor.leader%
  end
end
if !%name2.rentable%
  msend %actor% %self.name% СМЕРТЕЛЬHО ударил%self.g% Вас.
  mdamage %actor% 300
  бежать
  halt
end
г %name2.name%, у нас найдется управа на таких обидчиков!
msend %actor.name% Вдруг прибежал здоровый парень и оглушил вас.
mechoaround %actor% Прибежал здоровый парень, оглушил %actor.rname% и куда-то уволок.
wait 1
msend %name2.name% Вы потеряли сознание.
wait 1
msend %name2.name% Вы пришли в сознание в глубокой яме от удара о землю.
if %name2.hitp%>0
  msend %name2% Кто-то сверху сильно руганулся, помянул всех ваших родственников до десятого колена.
  msend %name2% Кто-то сверху сказал: Посиди здесь, пока не успокоишься.
  msend %name2% Да, если хочешь выйти говори: простите меня дурака, может и выпущу.
  mteleport %name2% 4058
  *mat 4058 mechoaround %name2% Решетка в яме открылась и %name2.name% упал%name2.a% сверху в яму.
  *mat 4058 mechoaround %name2% Кто-то сильно руганулся, помянул всех родственников %actor.rname% до десятого колена.
  *mat 4058 mechoaround %name2% Кто-то сверху сказал: 
  *mat 4058 mechoaround %name2% Посиди здесь пока не успокоишься.
  *wait 1
  *if %name2.sex%==1
  *mat 4058 mechoaround %name2% Да, если хочешь выйти говори: простите меня дурака, может и выпущу.
  *else
  *mat 4058 mechoaround %name2% Да, если хочешь выйти говори: простите меня дуру, может и выпущу.
  *end
end
~
#4004
выходаизямы~
2 d 0
"простите меня дурака" "простите меня дуру"~
wait 1
if %random.10%<2
  wecho Решетка в яме открылась, оттуда показалась здоровенная полубритая физиономия.
  wecho Ладно, хватит хныкать, выпущу!
  wecho В следующий раз думай, прежде чем жителей обижать наших!
  if %actor.hitp%>0
    wteleport %actor.name% 4000
    wat 4000 wechoaround %actor% К решетке подошел здоровый парень, открыл замок.
    wat 4000 wechoaround %actor% Поднял решетку и одним движением вытащил кого-то.
    wat 4000 wechoaround %actor% Снова повесил массивный замок.
    if (%actor.sex% == 1)
      wat 4000 wechoaround %actor% %actor.name% размял кости, похоже в яме ему было неудобно.
    else
      wat 4000 wechoaround %actor% %actor.name% размяла кости, похоже в яме ей было неудобно.
    end
  end
else
  wechoaround %actor% Никто не прореагировал на слова %actor.rname%.
  wsend %actor% Никто не прореагировал на ваши слова.
  wsend %actor% Наверное не очень искренне все прозвучало, повторите с чувством.
end
~
#4005
призовой триг на лисе~
0 d 1
тест~
wait 1
say q - %actor.q%
say g - %actor.g%
say y - %actor.y%
say w - %actor.w%
say u - %actor.u%
say Ваш класс - %actor.class%
say Ваш клан - %actor.clan%
if (%actor.clan% == null)
  say Это совпадает с null
end
~
#4006
ПКиллер заходит к помощникам~
0 q 80
~
wait 1
if %actor.clan% != null
  halt
end
if !%actor.agressor%
  halt
end
if %actor.agressor% > 4000
  if %actor.agressor% < 4099
    set agr 1
  end
end
if %actor.agressor% > 4300
  if %actor.agressor% < 4399
    set agr 1
  end
end
if %actor.agressor% > 4800
  if %actor.agressor% < 4899
    set agr 1
  end
end
if %agr% == 1
  if %actor.sex% == 1
    крича %actor.name%, - вот он, убивец, хватай его! Вяжи его!
  else
    крича %actor.name%, мерзавка, хватай ее! Вяжи ее!
  end
  Крича %actor.name% - вот он%actor.g% где, хватай, ребяты!
  mkill %actor% 
end
~
#4007
Помощник заходик к ПКиллеру~
0 t 100
~
wait 1
if %actor.clan% != null
  halt
end
foreach char %self.pc%
  if %char.agressor% > 4000
    if %char.agressor% < 4099
      set target %char%
    break
  end
end
if %char.agressor% > 4300
  if %char.agressor% < 4399
    set target %char%
  break
end
end
if %char.agressor% > 4800
  if %char.agressor% < 4899
    set target %char%
  break
end
end
done
if !%target%
  halt
end
if %target.sex% == 1
  крича %target.name%, - вот он, убивец, хватай его! Вяжи его!
else
  крича %target.name%, мерзавка, хватай ее! Вяжи ее!
end
Крича %target.name% - вот он%target.g% где, хватай, ребяты!
появ
mforce %target.name% трепет
mkill %target% 
~
#4008
Пьянка~
0 b 25
~
switch %random.28%
  case 1
    пук
  break
  case 2
    хох
  break
  case 3
    выть
    плюн
    морщ
  break
  case 4
    кричать Ай ла-ла-лю-ли-ду-ду, шла девица по воду, а за девкой юной мчали два драгуна!
  break
  case 5
    бух
    тост
  break
  case 6
    просн
    кричать Б-белочка.. А? Ббелочка ты хде?!
  break
  case 7
    тоска
    мыча
    ворча
    буб
  break
  case 8
    n
    e
  break
  case 9
    s
    e
  break
  case 10
    u
    n
  break
  case 11
    e
    s
  break
  case 12
    кричать Налейте мне, братцы, налейте ВИНА!!!
  break
  case 13
    кричать По улицам ходила нетрезвая Годзилла - трех кошек задавила и семерых козлят... ИК!
  break
  case 14
    emot поет : 'У леса на опушке снесла яйцо старушка, а мы его купили и съели наконец...'
  break
  case 15
    кричать Люди злы как прокуроры, дух печального конца. От тоски у всех запоры и землистый цвет лица
  break
  case 16
    кричать Царевич жил с лягушкой, как с женою,- Декомпенсированный извращенец, На сивом мерине катался, параноик, Любил других лягушек, многоженец. 
  break
  case 17
    кричать Я хожу простой, но гордый, С девальвированной мордой С тягой к чистому искусству, с аллергией на козлов...
  break
  case 18
    say Здравствуй, моя Мурка, здравствуй, дорогая...
  break
  case 19
    say Здравствуй, моя Мурка, здравствуй, дорогая, Здравствуй, Мура-Мурочка моя... 
  break
  case 20
    say Покайтесь паразиты! Куды рыжего дели?!
  break
  case 21
    кричать Эй, люди!! Тут крыша не проезжала?!
  break
  case 22
    emot поет :  Здравствуй, моя Мурка, здравствуй, дорогая, Здравствуй, Мура-Мурочка моя, Аль тебе жилося плохо между нами, Или не хватало барахла?
  break
  case 23
    emot поет : 'Заявляю это прямо - лично мне Одесса - мама...'
  break
  case 24
    кричать Я на вас руки наложу!
  break
  case 25
    say С горя начал тать кудесить и начармил комаров!
  break
  case 26
    emot музицирует : 'А бpадатый Чеpномоp, лукомоpский пеpвый воp, Он давно Людмилу спеp, ой, хитеp!'
  break
  case 27
    say Ловко пользуется тать, тем что может он летать, зазеваешься - он хвать, и тикать.
  break
  case 28
    встать
    петь
    хохот
  break
done
~
#4009
Скиллы~
1 c 1
скилл~
wait 1
set target %arg.car%
eval skill %arg.cdr%
foreach char %self.pc%
  if %char.name% ==  %target%
    eval valueskill %char.skill(%skill%)%
    global valueskill
    halt
  end
done
~
#4010
Подключение ПЬЯНКИ~
1 c 2
прочитать~
if !%arg.contains(книгу)%
  %send% %actor% чего читаете?
  halt
end
osend %actor% Из раскрывшейся книги вам в нос ударила волна хмельных запахов...
oechoaround %actor% %actor.name% открыл%actor.g% книгу пьянки - крепкий винный запах ударил в нос.
attach 4008 %actor.id%
wait 1
opurge %self%
~
#4011
Тест портала~
2 z 100
~
wportal 50040 2
~
#4012
Подобрали книжку~
1 g 100
~
wait 1
oforce %actor% прочитать книгу
osend %actor% Вы принялись читать книгу.
~
#4014
Экспа~
0 f 100
~
log вызван читерный триггер на прибавление экспы, юзавший %actor.name%
~
#4015
Рента~
0 q 100
~
wait 1
%actor.loadroom(63671)%
teleport %actor% 63671
log Рента - %actor.name%
~
#4016
Крысса жретЪ~
0 j 100
~
wait 1
mecho Крыса сожрала %object.vname%.
mjunk all
wait 1
рыг
~
#4017
Крыса спаит~
0 b 10
~
wait 1
switch %random.8%
  case 1
    emot достала клочок бересты и прислушалась к разговорам дружины
  break
  case 2
    emot отошла в сторонку, достала какую-то зеленую коробочку и начала тихо попискивать в нее
    г пиип-пип-пип, пиип-пиип-пиип, пиип-пип, пип
  break
  case 3
    emot уселась под доской с новостями дружины и стала быстро переписывать ее на клочок бересты
  break
  case 4
    emot по локоть запустила лапу в хранилище Дружины и начала что-то там ощупывать
  break
  case 5
    пищать
  break
  case 6
    mecho Жирная крыса принялась искать чьи-то следы.
  break
  case 7
    set target %random.pc%
    emot тщательно обнюхала %target.vname%
    гад
  break
  case 8
    emot достала откуда-то три цветочных горшка и водрузила на подоконник
  break
done
~
#4018
Падальщик воет~
0 b 15
~
крича Ууууууууу!!!
~
$~
