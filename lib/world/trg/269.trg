#26900
Приветствие ведуньи~
0 r 100
~
if !(%questor269%) && %exist.mob(26911)% && %exist.mob(26916)% && %exist.mob(26903)%
  wait 1
  if (%actor.sex% == 1)
    г Здравствуй, мил человек. Ты, наверное, удивлен тому, что все празднуют, а я сижу здесь.
  end
  if (%actor.sex% == 2)
    г Здравствуй, дочка. Ты, наверное, удивлена тому, что все празднуют, а я сижу здесь.
  end
  wait 1
  взд
  г Хорошо, я расскажу тебе, что за беда пришла к нам на хутор.
  г Невеста то, не настоящая. Злая ведьма выдает себя за нее,
  г а настоящую спрятала в землянке далеко в лесу. И наказала
  г подельнику своему, главарю местной шайки разбойников,
  г охранять ее и держать в заточении. А жених то, околдованный
  г чарами злыми, понять не может в чем тут дело.
  wait 1
  взд
  if (%actor.sex% == 1)
    г Ты, я вижу, силен, да снаряжен хорошо. Вот если бы ты согласился
    г помочь нам, освободить бедную девушку, мы бы в долгу не остались.
  end
  if (%actor.sex% == 2)
    г Ты, я вижу, сильна, да снаряжена хорошо. Вот если бы ты согласилась
    г помочь нам, освободить бедную девушку, мы бы в долгу не остались.
  end 
  wait 1
  вопр %actor.name% 
  attach 26901 %self.id%
end
else
halt
end
~
#26901
Ведунья дает квест~
0 d 1
помогу~
if !(%questor269%) && %exist.mob(26911)% && %exist.mob(26916)% && %exist.mob(26903)%
  wait 1
  г Хорошо! Слушай, что я расскажу тебе. Говорят у главаря много людей
  г в подчинении и все они прячутся в лесу, сам же он сидит под большой
  г сосной, в дальней части леса. Убей его и забери ключ от землянки.
  г Тогда ты сможешь освободить настоящую невесту. Приведи ее в дом
  г к жениху и тогда, увидев истинную возлюбленную, спадут злые чары с
  г парня, да и ведьме деваться будет некуда, как только показать свое
  г настоящее обличие.
  wait 1
  взд
  г Только поторопись, а то пройдет женитьба, и навсегда влюбленные 
  г останутся друг без друга.
  makeuid questor269 %actor.id%
  global  questor269
end
else
halt
end
~
#26902
Умер главарь шайки~
0 f 100
~
%echo% Раздался хриплый вздох, и главарь шайки упал замертво.
mload obj 26900
~
#26903
Освобождение девушки~
2 d 0
пошли пойдем~
if (%actor.vnum% != -1)
  return 0
  halt
end
wait 1
calcuid target 26904 mob
if %actor.sex% == 1
  wecho __Спасибо тебе, мой спаситель! Я уже и не надеялась на помощь.
end
if %actor.sex% == 2
  wecho __Спасибо тебе, моя спасительница! Я уже и не надеялась на помощь.
end
wecho __Отведи меня к моему жениху, если тебя это не затруднит.
wecho ___- жалобно забормотала девушка.
wforce %target% follow %actor.name%
makeuid Keeper %actor.id%
remote Keeper %target.id%
calcuid room 26922 room
attach 26904 %room.id%
detach 26903 %self.id%
~
#26904
Невеста пришла к жениху~
2 g 100
~
if %actor.vnum% != 26904
  halt
end
wait 1
calcuid target 26916 mob
if !%target%
  halt
end
wpurge %target%
wecho _____Внезапно, молодая девушка вспыхнула ярким сиянием 
wecho ___и с пронзительным воем превратилась в ужасную ведьму!
wload mob 26919
calcuid Vedma 26919 mob
wecho  - Как ты посмела придти сюда! - закричала старая ведьма, глядя на девушку.
wecho  - За это ты умрешь! - раздался вой, и ведьма бросилась в атаку.
wforce %Vedma% attack %actor.name%
detach 26904 %self.id%
~
#26905
Умерла Ведьма~
0 f 100
~
г Да чтоб у тебя.... волки съели!
calcuid room 26922 room
attach 26906 %room.id%
exec 26906 %room.id%
~
#26906
Загрузка настоящей невесты~
2 z 100
~
if !%exist.mob(26904)%
  halt
end
calcuid target 26904 mob
wpurge %target%
wload mob 26918
wecho __
wecho __
wecho __Заплаканная девушка вытерла слезы и стала похожа на счастливую молодую невесту.
wecho __
wecho Счастливая невеста сказала: Как я рада, что мы снова вместе! 
wecho Счастливая невеста сказала: Спасибо Вам, добрые люди!
wecho __
if %exist.mob(26905)%
  calcuid questor 26905 mob
end
attach 26907 %questor.id%
detach 26906 %self.id%
~
#26907
Награда за квест-1~
0 r 100
~
if (%questor269.id% == %actor.id%)
  wait 1s
  if %actor.sex% == 1
    г Спасибо тебе, мил человек! Не оставил нас в беде.
  end
  if %actor.sex% == 2
    г Спасибо тебе, дочка! Не оставила нас в беде.
  end
  г Теперь молодые поженятся, и все у них будет хорошо.
  г У тебя хватило сил и мужества наказать злую ведьму и бессовестного
  г главаря местных разбойников. Ну что ж... ты заслужил%actor.g% награду.
  г На вот, возьми это в знак нашей благодарности.
  wait 1s
  mecho Ведунья вытащила что-то из старого сундука.
  switch %random.10%
    case 1
      г Держи! Пусть это напоминает тебе, о единении жениха и невесты.
      mload obj 217
      дать все %actor.name%
    break
    case 2
      г Вот, держи, пусть внимательность поможет тебе различить настоящее от призрачного.
      mload obj 528
      дать все %actor.name%
    break
    case 3
      г Вот, держи, чтобы тебе было легче отличить добро от зла.
      mload obj 1709
      дать все %actor.name%
    break
    default
      ул %actor.name%
    done
    %self.gold(2500)%
    дать 2500 кун %actor.name%
    unset questor269
    detach 26907 %self.id%
  end
  
~
#26908
Обнуление переменных~
2 f 100
~
calcuid questor1 26905 mob
attach  26900 %questor1.id%
detach  26901 %questor1.id%
detach  26907 %questor1.id%
rdelete questor269 %questor1.id%
calcuid questor2 26910 mob
attach  26920 %questor2.id%
detach  26921 %questor2.id%
detach  26923 %questor2.id%
rdelete questor269add %questor2.id%
calcuid room48 26948 room
attach 26903 %room48.id%
attach 26924 %room48.id%
exec 26924 %room48.id%
calcuid room29 26929 room
attach 26916 %room29.id%
calcuid room11 26911 room
attach 26918 %room11.id%
calcuid room49 26949 room
attach 26922 %room49.id%
calcuid room22 26922 room
attach 26909 %room22.id%
exec 26909 %room22.id%
~
#26909
Purge мобов~
2 z 100
~
if %world.curmobs(26918)% > 0
  calcuid realnevesta 26918 mob
  wpurge %realnevesta% 
end
if %world.curmobs(26919)% > 0
  calcuid vedma 26919 mob
  wpurge %vedma% 
end
calcuid mob1 26912 mob
wpurge %mob1% 
calcuid mob2 26913 mob
wpurge %mob2% 
calcuid mob3 26914 mob
wpurge %mob3% 
calcuid mob4 26915 mob
wpurge %mob4% 
calcuid mob5 26917 mob
wpurge %mob5% 
wload mob 26917
wload mob 26914
wload mob 26913
wload mob 26912
wload mob 26915
calcuid mob1 26917 mob
attach 26915 %mob1.id%
calcuid mob2 26912 mob
attach 26914 %mob2.id%
calcuid mob3 26913 mob
attach 26914 %mob3.id%
calcuid mob4 26915 mob
attach 26914 %mob4.id%
~
#26910
Приветствие хуторянина~
0 r 50
~
wait 1s
шля %actor.name%
г Добро пожаловать на наш хутор, гости дорогие!
~
#26911
Встреча с хуторянкой~
0 r 50
~
wait 1s
if %actor.sex% == 1
  эм мило улыбнулась, отведя глаза в сторону
end
if %actor.sex% == 2
  ухм  %actor.name%
end
г Милости просим, проходите.
~
#26912
Встреча с молодой девкой~
0 r 50
~
wait 1s
г Посторонитесь, дайте пройти.
тороп %actor.name%
~
#26913
Помер жених~
0 f 100
~
г Прощай, любимая! Я твой навеки.
if ((%random.5% < 2) && (%world.curobjs(26908)% < 5))
  mload obj 26908
end
~
#26914
Крики гостей~
0 ar 100
0~
while  1
  wait 1s
  if !%self.fighting%
    switch %random.12%
      case 1
        г Горько! Почему все такое горькое?! Горько!
      break
      case 2
        г Дак выпьем же за молодых!
      break
      case 3
        см невест
        г Ух, хороша чертовка!
      break
      case 4
        см жени
        г Вот это да! Бравый хлопец!
      break
      case 5
        тост
      break
      case 6
        пет
      break
      case 7
        кури
      break
      case 8
        г Счастья Вам, Молодые! Горько!
        эм осушил кружку
      break
      case 9
        эм выпил чарку и закусил
        ик
      break
      case 10
        хих поп
      break
    done
  end
  wait 10s
done
~
#26915
Поп благословляет~
0 ar 100
0~
while 1
  wait 1s
  if !%self.fighting%
    switch %random.3%
      case 1
        благос жени
      break
      case 2
        благос невес
      break
    done
  end
  wait 10s
done
~
#26916
Телепортация девушки~
2 g 100
0~
if %actor.vnum% != 26904
  halt
end
wait 1s
wecho __- Вы помогли девушке выбраться из леса.
wteleport %actor% 26925
detach 26916 %self.id%
~
#26917
Померла невеста~
0 f 100
~
г Прощай, любимый! Я твоя навеки.
if ((%random.5% < 2) && (%world.curobjs(26908)% < 5))
  mload obj 26908
end
~
#26918
В церкве~
2 c 1
помолиться~
if (%actor.vnum% != -1)
  return 0
  halt
end
wsend %actor%  __Вы сложили руки на груди и начали взывать к Всевышнему.
wechoaround %actor% __ %actor.name% сложил%actor.g% руки на груди и начал%actor.g% взывать к Всевышнему.
wait 1s
wecho _- Белый ангел спустился с неба.
wsend %actor% _ангел взмахнул над Вами своим перстом.
wload mob 26920
calcuid angel 26920 mob
makeuid keeper %actor.id%
remote keeper %angel.id%
attach 26919 %angel.id%
exec 26919 %angel.id%
wpurge %angel% 
wecho ангел исчез.
detach 26918 %self.id%
~
#26919
Ангел кастит~
0 z 100
~
dg_cast 'освящение' %keeper.name%
~
#26920
Приветствие старика~
0 r 100
~
if !(%questor269add%)
  wait 1
  г Приветствую тебя, путник. Давно никто не захаживал в наши края.
  г Совсем некому помочь старому охотнику. Вот если бы я был помоложе.
  груст
  г Есть у меня дело небольшое. Не возьмешься ли сослужить мне службу?
  вопр %actor.name%
  attach 26921 %self.id%
end
~
#26921
Старик дает квест~
0 d 1
пойду сослужу~
if !(%questor269add%)
  wait 1s
  г Тогда слушай. Несчастье случилось у меня несколько лет назад,
  г когда я еще был способен держать в руках лук. Как-то отправился
  г я на охоту в наш лес. Бродил я три дня и три ночи и вот, наконец,
  г совсем отчаявшись в поисках добычи, я прилег под сосну. Только я
  г устроился, чтобы отдохнуть, как вдруг, откуда-то из леса выскочила
  г шайка разбойников и кинулась ко мне. Хоть я и храбрый воин, но их
  г было слишком много, поэтому я бросился наутек.
  взд
  г Пока я убегал от них, я обронил где-то в лесу свой лук. Лук тот особой
  г ценности собой не представляет, но для меня он дорог как память о
  г моем отце. Если ты сможешь разыскать и вернуть мне мой лук, я
  г вознагражу тебя, чем смогу.
  взд
  wait 1s
  if %actor.sex% == 1
    г Ступай же, но будь осторожен, в лесу до сих пор слышен разбойничий
    г свист.
  end
  if %actor.sex% == 2
    г Ступай же, но будь осторожна, в лесу до сих пор слышен разбойничий
    г свист.
  end
  благос %actor.name%
  makeuid questor269add %actor.id%
  global  questor269add
  attach 26923 %self.id%
  detach 26920 %self.id%
  detach 26921 %self.id%
end
else
halt
end
~
#26922
Сдигаем камень~
2 c 1
сдвинуть~
if %actor.fighting%
  return 0
  halt
end
if (%actor.vnum% != -1)
  return 0
  halt
end
if !(%arg.contains(камень)%)
  wsend %actor% _- Что вы пытаетесь сдвинуть?
  return 0
  halt
end
wait  1
wecho __
wsend %actor% _- Приложив немало усилий, Вам удалось сдвинуть камень,
wsend %actor% _под которым что-то заблестело.
wechoaround %actor% %actor.name% сдвинул%actor.g% камень.
wecho __
wload obj 26912
detach 26922 %self.id%
~
#26923
Награда за квест-2~
0 j 100
~
wait 1s
if %object.vnum% != 26912
  брос все
  halt
end
mpurge лук
if (%questor269add.id% == %actor.id%)
  if %actor.sex% == 1
    г Ты все-таки нашел его. Вот здорово! 
    г Вот порадовал старика на закате лет.
  end
  if %actor.sex% == 2
    г Ты все-таки нашла его. Вот здорово! 
    г Вот порадовала старика на закате лет.
  end
  ул %actor.name%
  if (%actor.class% == 10) && (!%actor.skill(сбить)%)
    wait 1s
    if (%actor.level%>24)
      г Ну что ж, пожалуй я научу тебя одному умению, 
      г которое будет помогать тебе в бою.
      wait 1s
      mskillturn %actor.name% сбить set
    end
    if (%actor.level%<=24)
      г Молод%actor.g% ты еще, чтобы изучить это умение,
      г но награду ты заслужил%actor.g%!
      wait 1s
      mecho Старик достал мешочек с деньгами.
      %self.gold(1500)%
      дать 1500 кун %actor.name%           
    end
  else
    wait 1s
    г Ну что ж, как и обещал, принимай награду.
    wait 1s
    mecho Старик достал мешочек с деньгами.
    %self.gold(1500)%
    дать 1500 кун %actor.name%
  end
else
  г Хм.... Я не просил тебя о помощи, но все равно, спасибо.
end
unset questor269add
detach 26920 %self.id%
detach 26921 %self.id%
detach 26923 %self.id%
~
#26924
Purge невесты~
2 z 0
~
if %world.curmobs(26904)% > 0
  calcuid uznik 26904 mob
  wpurge %uznik% 
  wload mob 26904
end
~
#26925
убили мирного хуторянина~
0 f 100
~
return 0
if (%actor.class% != 8)
  msend %actor% _За это черное дело Белобог лишил Вас 10000 очков опыта.
  %actor.exp(-10000)%
  halt
end
msend %actor% _За это черное дело Чернобог дал Вам 5000 очков опыта.
%actor.exp(+5000)%
~
#26926
убили бабку марфу~
0 f 100
~
return 0
if (%actor.class% != 8)
  msend %actor% _За это черное дело Белобог лишил Вас 10000 очков опыта.
  %actor.exp(-10000)%
  halt
end
msend %actor% _За это черное дело Чернобог дал Вам 5000 очков опыта.
%actor.exp(+5000)%
if (%world.curobjs(26913)% < 10) && (%random.10% <= 2)
  mload obj 26913
end
~
#26927
убили кузнеца~
0 f 100
~
return 0
if (%actor.class% != 8)
  msend %actor% _За это черное дело Белобог лишил Вас 10000 очков опыта.
  %actor.exp(-10000)%
  halt
end
msend %actor% _За это черное дело Чернобог дал Вам 5000 очков опыта.
%actor.exp(+5000)%
if (%world.curobjs(26914)% < 10) && (%random.10% <= 2)
  mload obj 26914
end
~
#26928
убили попа~
0 f 100
~
return 0
if (%actor.class% != 8)
  msend %actor% _За это черное дело Белобог лишил Вас 10000 очков опыта.
  %actor.exp(-10000)%
  halt
end
msend %actor% _За это черное дело Чернобог дал Вам 5000 очков опыта.
%actor.exp(+5000)%
if (%world.curobjs(26915)% < 10) && (%random.10% <= 1)
  mload obj 26915
end
~
#26929
убили подручного~
0 f 100
~
if (%world.curobjs(26916)% < 6) && (%random.10% <= 2)
  mload obj 26916
end
~
$~
