#89900
повар приветсвует~
0 c 1
ул улы улыб улыбн улыбну улыбнут улыбнуть улыбнутьс улыбнуться~
wait 1
return 0
if !%arg.contains(повар)%
  halt
end
msend %actor.name%  Вы приятельски улыбнулись повару.
mechoaround %actor% _%actor.name% расплылся в улыбке, глядя на повара.
wait 1s
say Чего лыбишься?
wait 2s
emot хитро прищурился
wait 1s
say Жрать небось хочешь? 
attach 89901 %self.id%
detach 89900 %self.id%
~
#89901
повар дает квест~
0 d 0
да хочу ага~
if %actor.vnum% != -1
  halt
end
set questor899 %actor%
global  questor899
wait 1s
mecho - Ха! Ты чего сюда, ...есть пришел?! - расхохотался повар.
wait 1s
смея %actor.name%.
wait 2s
mechoaround %actor% _Закончив смеяться, повар наклонился к самому лицу %actor.rname%, и о чем-то серьезно заговорил.
msend %actor% Отсмеявшись, повар наклонился к вашему уху быстро заговорил:
msend %actor% - Тут такое дело... Свиные ребрышки хотел сготовить...
msend %actor% - Да нож мой, для разделки туш, как скозь землю провалился.
msend %actor% - Если не сготовлю - магистр-то, даром что старик, а дюже скор на расправу.
msend %actor% Повар утер выступивший пот, о чем то задумался.
wait 2s
msend %actor% - Конюх, будь он неладен, положил глаз свой поганый на этот нож.
msend %actor% - Все в карты пытался у меня его выиграть.
msend %actor% - Я бы сам разобрался, но он седьмая вода на киселе одному из рыцарей.
msend %actor% - Ты, я сразу понял - не из простых, уж разберись с ним построже... 
wait 1s
msend %actor% - А за мной дело не станет, отблагодарю тебя. 
calcuid horseman 89918 mob
remote questor899 %horseman.id%  
attach 89916 %self.id%
detach 89901 %self.id%
~
#89902
магистр приветствует~
0 r 100
~
wait 1
%actor.wait(10)%
mecho Магистр, не мигая, уставился на вас.
wait 1s
%echo% Магистр подал знак охранникам. 
wait 1s
%echo% Рыцари живо выхватили мечи и окружили Вас, приставив их к Вашему горлу.
foreach target %self.pc%
  eval dmg %target.hitp%/3
  mdamage %target% %dmg%
done
wait 2s
%echo% Магистр кивнул командиру. 
calcuid komandir 89920 mob
exec 89909 %komandir.id%
wait 4s
г Итак, кто такие? Почему не в армии?
wait 2s
хмур
wait 3s
г Ладно, это я шучу так... 
wait 2s
ухмыл
wait 2s
г Казнить вас что ли, а то ходят и ходят, работать мешают?
wait 2s
г Скольких мы казнили на прошлой неделе?
exec 89910 %komandir.id%
wait 3s
морщ
wait 1s
г Я же просил не называть меня так, в здешних краях это выглядит смешно!
укор officer899
wait 2s
%echo% Магистр о чем-то задумался, изредка посматривая на вас.
wait 3s
%echo% - Ладно, - магистр пришел к какому-то решению, - Хотите службу служить?
wait 1s
%echo% Магистр с издевкой уставился на вас.
wait 1s
г Или будем сидеть тут, пока от голода не умрем?
attach 89911 %self.id%
~
#89903
конюх невничает~
0 q 100
~
wait 1
if %self.fighting%
  halt
end
wait 1s
if %actor.id% != %questor899.id%  
  halt
end
wait 1s
emot с деланным безразличием отвернулся в другую сторону
wait 3s
%echo% _Видя, что вы не уходите, конюх беспокойно заерзал на месте.
wait 2s
%echo% - Ну что им надо? Ходят тут всякие... - забормотал конюх себе под нос.
wait 1s
%echo% Волнение совсем разобрало бедолагу, и его начала колотить мелкая дрожь.
wait 2s
mecho - Ну что надо-то!? Сейчас как позову, двоюродного племянника сводной сестры моей троюродной тетки, по материнской линии, благородного рыцаря Ульриха Заштатгольштадского! - срываясь заорал конюх
~
#89904
бьем конюха~
0 l 100
~
if ( %actor.id% == %questor899.id% )
  if ( %self.hitp% < 350 )
    say Не бейте, дяденька!
    mload mob 89918
    wait 1
    mpurge %self%
  end
end
~
#89905
конюх плачет~
0 n 100
~
wait 1s
emot утер кровавые сопли
wait 2s
say Все скажу, только по почкам не бейте.
wait 1s
плак
wait 1s
%echo% - Так, чего Вам надо-то? - всхлипнул конюх.
attach 89906 %self.id%    
~
#89906
конюх сознается~
0 d 0
нож~
wait 1
if %actor.vnum% != -1
  halt
end
*if %actor.id% != %questor899.id%
*halt
*end
wait 1s
mecho Конюха аж передернуло.
wait 2s
say Ну, повар, ну, зараза... - пробормотал конюх, осторожно трогая разбитый нос.
mecho _- Да ребятки, был грешок, это богопротивный лекарь Иоганн... - конюх вдруг осекся.
wait 3s
say Это он подговорил меня взять нож. Уж больно приглянулся он ему...
mecho _- Костоправ проклятый! Для чего он ему, даже подумать мне страшно.
mecho _- Надеюсь, что после вашего визита он не выживет...
wait 1s
mecho Тут конюх, поняв что и так наговорил лишнего, поспешно заткнулся. 
calcuid iogann 89905 mob 
attach 89907 %iogann.id%
set questor89901 %actor%
global questor89901
remote questor89901 %iogann.id%
detach 89903 %self.id%
detach 89904 %self.id%
detach 89905 %self.id%
detach 89906 %self.id%
~
#89907
входим к Иоганну~
0 q 100
~
wait 1s
%echo% Иоганн хмуро уставился на Вас, он явно не рад незванным пришельцам.
wait 1s
%echo% - Бубонная чума вас забери, что вам нужно?! - лекарь угрожающе поднялся над столом.
attach 89908 %self.id% 
~
#89908
требуем нож у Иоганна~
0 d 1
нож~
wait 1
if %actor.vnum% != -1
  halt
end
if %actor.id% != %questor89901.id% 
  halt
end
wait 1s
%echo% Иоганн гневно нахмурил брови - Нож?! Да кто ты так%actor.w%?! Холера на тебя и твои колена!
%echo% - Небось тебя легат подослал, я знал, что он меня предаст!
wait 2s 
%echo% - Вот что, просьба у меня к тебе будет, передай привет от меня легату... 
wait 2s
mkill %actor%
wait 1s
%echo% - На том свете!!!
хохот 
calcuid qlegat 89906 mob
set questor89902 %actor%
global questor89902
remote questor89902 %qlegat.id%
attach 89924 %self.id% 
detach 89907 %self.id% 
detach 89908 %self.id%
~
#89909
командир закрывает полог~
0 z 100
~
wait 1s
закрыть дверь
запере дверь
~
#89910
ответ командира~
0 z 100
~
wait 2s
г Девятнадцатерых, майн херр.
~
#89911
Магистр квестует~
0 d 0
хочу хотим да~
if %actor.vnum% != -1
  halt
end
set hero899 %actor%
global  hero899
calcuid iogann 89905 mob
attach 89934 %iogann.id%
*mat 89941 mload mob 89906
wait 1s
улыб
wait 1s
г С некоторого времени сопровождает нас папский легат.
г Он мне сразу не понравился. Но это не важно.
г А важно то, что есть у меня подозрения...
wait 3s
г ...что не совсем он тот за кого себя выдает.
г Схватить бы его, да прижечь каленым копьем...
wait 1s
%echo% Магистр мечтательно уставился в потолок.
wait 2s
г Гмм... да... Да только, если я ошибаюсь. Папа живо спустит на меня своих собак.
wait 1s
%echo% Охранники нервно переглянулись.
wait 4s
г Так вот, все бы ничего, но начались в моем лагере таинственные исчезновения.
г Сначала пропадали пленные...
г А недавно исчез молодой рыцарь, родственник шведской королевской фамилии.
г И посол тут приехал совсем некстати!
%echo% Магистр с досадой хлопнул рукой по столу.
wait 4s
mechoaround %actor% _Магистр знаком приказал %actor.dname% приблизиться.
msend %actor% Магистр знаком приказал Вам подойти поближе.
msend %actor% _- Слушай сюда внимательно, сынок. 
msend %actor% _- Караульные легата с общего котла не питаются, 
msend %actor% _- они вообще похоже не едят... Чуешь к чему я? Патрульные мне докладывают,
msend %actor% _- что по ночам несколько раз видели тени. Тени те шастают по лагерю, но
msend %actor% _- поймать их мы не можем. Один из рыцарей было схватил одного, но после
msend %actor% _- схватки стал как безумен... И совершенно сед... 
msend %actor% _- Да что там, я сам прошлой ночью слышал странные звуки из-под земли...
wait 2s
msend %actor% Старый магистр перевел дух и продолжил:
wait 2s
msend %actor% _- Итак, мой отчаянный друг, мне нужны у-бе-ди-тель-ные доказательства против легата, такие доказательства,
msend %actor% _- которые я бы мог представить Папе.
wait 2s   
msend %actor% _- Коли разберешься с этим делом, ждет тебя награда королевская! 
wait 2s
г Теперь ступайте, и да пребудет с вами сила Господа нашего...
mecho Магистр быстро осекся.
wait 2s
г Удачи вам воины, удачи... 
calcuid komandir 89920 mob
exec 89912 %komandir.id%  
calcuid legat 89906 mob
remote hero899 %legat.id%
attach 89913 %legat.id%
detach 89915 %legat.id%
attach 89920 %self.id%
detach 89902 %self.id%
detach 89911 %self.id% 
~
#89912
командир открывает полог~
0 z 100
~
wait 2s
отпер две
откр две
~
#89913
входим к легату с миссией от магистра~
0 q 100
~
wait 1
if %actor.id% != %hero899.id%
  halt
end
wait 2s                          
%echo% Легат принялся внимательно разглядывать Вас.
wait 2s
mecho Где-то глубоко внутри вы почуствовали странный холод, 
mecho ___словно легат своим взглядом проник внутрь и пытается рассмотреть, что у Вас на уме. 
wait 3s
%echo% Губы легата скривились в подобии усмешки.
wait 1s
г Я так и думал...
wait 1s
г Посланцы магистра,...
wait 1s
г ...что ж этот старикашка слишком близко ко мне подобрался...
wait 2s 
г Надеюсь вы не питаете надежд выйти отсюда живыми?!
wait 1s
%echo% Легат зловеще расхохотался. Вы почуствовали, как мороз пробежал по вашей коже.
wait 2s
mkill %actor%
attach 89914 %self.id%
detach 89913 %self.id%
~
#89914
смерть легата~
0 f 100
~
if ((%random.10000% < 50) && (%world.curobjs(3377)% < 1) && (%world.curobjs(3378)% < 1))
  mload obj 3377
end
mecho &KТемный дух взметнулся над трупом легата. &n
mecho Сделав круг по комнате, он схватил небольшую книгу в переплете из черной кожи и адски хохоча, провалился сквозь землю!
mecho Из под земли донесся загробный голос: 
mecho _&c- Хотите умереть в муках?! Идите за мной...&n
mecho _&c- Ууу-ха-хаха-ха-ааааа-уууу!!!&n
mat 89984 mload mob 89921
eval chanse %world.curobjs(89906)%+25
if (%random.29% > %chanse%) || ( %random.100% == 53 ))
  mload obj 89906
end
eval chanse %world.curobjs(89909)%+25
if (%random.29% > %chanse%) || ( %random.100% == 53 ))
  mload obj 89909
end
eval chanse %world.curobjs(89910)%+25
if (%random.28% > %chanse%) || ( %random.100% == 53 ))
  mload obj 89910
end
~
#89915
передаем привет легату от Иоганна~
0 q 100
~
wait 1
if %actor.id% != %questor89902.id%
  halt
end
wait 1s
msend %actor.name%  Вы передали привет от лекаря Иоганна.
mechoaround %actor%_ %actor.iname% передал привет от лекаря Иоганна.
wait 1s
%echo% Легат недоуменно поглядел на Вас.
wait 2s
%echo% Легат с интересом оглядел бурые пятна на Вашей одежде.
wait 1s
хохот
wait 1s
%echo% - Т-а-а-а-к, значит старый дурак плохо кончил! - легат удовлетворенно потер руки.
wait 1s  
%echo% (в сторону) - Как вовремя, точно сам Люцифер послал мне этих варваров. 
wait 1s
%echo% - Хорошо, раз вы смогли убить Иоганна...
wait 1s
дум
wait 1s
%echo% - Не взялись бы вы за дело, связанное с устраннением одной очень важной особы?
wait 1s 
%echo% (в сторону) - Да эти варвары, за хороший шмот, и маму родную...
wait 1s
вопр 
attach 89917 %self.id%  
detach 89915 %self.id%
~
#89916
нож повару~
0 j 100
~
wait 1
if %object.vnum% != 89904
  брос все
  halt
end
wait 1
mpurge %object%
wait 1s
say Хы... Мой нож! Ты отыскал его!
wait 1s
if %actor.id% != %questor899.id%
  say Спасибо что вернул%actor.q%.
  halt
end
if (%actor.class% == 9) && (!%actor.spelltype(увеличение)%)
  г Ты, %actor%, должен знать, что размер имеет значение... 
  mspellturn %actor.name% увеличение set 
  halt
end
switch %random.2%
  case 1
    eval chanse %world.curobjs(89922)%+2
    if ((%random.12% > %chanse%) || ( %random.100% == 68 ))
      say Этот браслет мне достался от одного знатного рыцаря.
      mload obj 89922
      дать брас %actor.name%
    elseif %random.100% == 45
      say Этот браслет мне достался от одного знатного рыцаря.
      mload obj 89922
      дать брас %actor.name%
    else
      say Вот несколько золотых тебе за помощь.
      %actor.gold(+2000)%
    end
  break
  case 2
    eval chanse %world.curobjs(89921)%+2
    if ((%random.12% > %chanse%) || ( %random.100% == 68 ))
      say Этот браслет мне достался от одного знатного рыцаря.
      mload obj 89921
      дать брас %actor.name%
    elseif %random.100% == 45
      say Этот браслет мне достался от одного знатного рыцаря.
      mload obj 89921
      дать брас %actor.name%
    else
      say Вот несколько золотых тебе за помощь.
      %actor.gold(+2000)%
    end
  break
done
~
#89917
легат квестует~
0 d 0
да возьмусь помогу~
wait 1
if %actor.vnum% != -1
  halt
end
if (%actor.id% != %questor89902.id% )
  halt
end
set questor89903 %actor%
global questor89903
calcuid magistr 89902 mob
remote questor89903 %magistr.id%
wait 2s
г Я так и знал!
г Видишь ли, я занимаюсь изучением очень древнего знания, и Иоганн весьма помог мне...
wait 2s
г ... в практической части. Но он чересчур труслив был... И какой-то нервный, ненадежный одним словом.
г Конечно, если кто-нибудь проведает бы о моих опытах, мне придется туго.
wait 1s
взд
wait 1s
г Эти недоумки просто не понимают - какую силу мы обретем в результате!
г Магистр что-то пронюхал, ведь мне все тяжелей и тяжелей сохранять все в тайне.
wait 1s
%echo% Легат горесно покачал головой.
wait 1s 
г Но мне нужно всего несколько дней!!!
г Мне нужна голова Магистра, его смерть даст мне столь необходимую отсрочку.
г Благодарность моя не будет знать границ... э-э-э в разумных пределах, естественно.
wait 1s
emot в волнении заходил по комнате
wait 1s
г Иди же, мне надо работать!
attach 89922 %self.id%
detach 89917 %self.id%
~
#89918
смерть духа легата~
0 f 100
~
%echo% Темная сторона души легата испустила душераздирающий крик и отправилась прямиком в АД.
%echo% На земле осталась лишь книжица в темном переплете.
%load% obj 89918
~
#89919
смерть магистра~
0 f 100
~
msend %actor.iname% Ого! Ловким движением Вам удалось отсечь голову магистра!
msend %actor.iname% Молодец! Так держать сынок!
mechoaround %actor.iname% Ловким ударом %actor.iname% отрубил%actor.g% голову магистра!
mechoaround %actor.iname% Вот это удар! 
mload obj 89928
~
#89920
магистр выдает награду~
0 j 100
~
wait 1s
if %object.vnum% != 89918
  хму
  wait 1s
  г Не морочь мне голову!
  бро все
  halt
end
wait 1  
mpurge %object%
%echo% Магистр с интересом осмотрел книгу.
%echo% Едва заметная улыбка озарила его чело.
say Великолепно... О лучшем доказательстве нельзя и мечтать..
switch %random.5%
  case 1
    eval chanse %world.curobjs(89919)%+15
    if (( %random.20% > %chanse% ) || ( %random.1000% <= 10 ))
      mload obj 89919 
      г Дарую плащ с моего плеча!
      дать все %actor.name%
    else
      say Звонкая монета всегда найдет применение!
      mload obj 89929
      give все .%actor.name%
    end
  break
  case 2
    eval chanse %world.curobjs(89920)%+15
    if (( %random.17% > %chanse% ) || ( %random.1000% <= 10 ))
      mload obj 89920 
      г Держи %actor.iname%, отличный доспех, бери, бери... у меня их два.
      дать все %actor.name% 
    else
      say Звонкая монета всегда найдет применение!
      mload obj 89929
      give все .%actor.name%
    end
  break
break
case 3
  eval chanse %world.curobjs(89923)%+15
  if (( %random.20% > %chanse% ) || ( %random.1000% <= 10 ))
    mload obj 89923 
    г Вот это мы с одного мага язычника сняли, но они так воняют, что вряд ли кто-нибудь из нас это оденет.
    дать штан %actor.name%
  else
    say Звонкая монета всегда найдет применение!
    mload obj 89929
    give все .%actor.name%
  end
break
case 4
  eval chanse %world.curobjs(89924)%+15
  if (( %random.19% > %chanse% ) || ( %random.1000% <= 10 ))
    mload obj 89924 
    г Дарую тебе этот великолепный перстень!
    дать перс %actor.name%
  else
    say Звонкая монета всегда найдет применение!
    mload obj 89929
    give все .%actor.name%
  end
break
default
  mload obj 89929 
  г Что может быть лучше денег?!
  дать пригор %actor.name% 
end
done
if %actor.align% < 100
  %actor.align(+20)%
end
~
#89921
прыжок~
2 c 1
подпрыгнуть~
eval sumsize %actor.size%+%actor.sizeadd%
if ( %sumsize% <= 63 )
  wsend %actor% Пол опасно заколебался под вашими ногами, но ничего не произошло.
  halt
end
%echo% Хлипкие деревянные подпорки таки не выдержали!
%echo% Земля разошлась под вашими ногами и вы рухнули куда-то вниз.
wteleport %actor% 89940 horse
foreach victim %actor.group% 
  if %victim.realroom% == 89983
    eval dmg %victim.hitp%/5
    wdamage %victim% %dmg%
    wteleport %victim% 89940 horse
  end
done
detach 89921 %self.id%
~
#89922
легат выдает награду~
0 j 100
~
wait 1
if %actor.vnum% != -1
  брос %object.name%
  halt
end
if %object.vnum% != 89928
  хму
  wait 1s
  г Вот превращу тебя в крысу, шутник!
  бро все
  halt
end
wait 1
mpurge %object%
wait 1s
mecho Легат с удовлетворением уставился на голову.
mecho Злобная улыбка исказило его лицо.
wait 1s
say Клянусь Вельзелвулом, отличная работа!
switch %random.5%
  case 1
    eval chanse %world.curobjs(89925)%+10
    if (( %random.15% > %chanse% ) || ( %random.100% == 53 ))
      wait 2s
      mload obj 89925 
      г Вот, отличный головной убор, испачкался правда, ну да для вас пойдет.
      дать все %actor.name%
    else
      say Золото! Что может быть лучше...
      mload obj 89929
      give все .%actor.name%
    end
  break
  case 2
    eval chanse %world.curobjs(89926)%+10
    if (( %random.15% > %chanse% ) || ( %random.100% == 53 ))
      wait 2s
      mload obj 89926 
      г Вот, осталось от одного пленного, ох еле-еле схомутали мы его тогда с Иоганном!
      дать все %actor.name% 
    else
      say Золото! Что может быть лучше...
      mload obj 89929
      give все .%actor.name%
    end
  break
  case 3
    eval chanse %world.curobjs(89927)%+10
    if (( %random.15% > %chanse% ) || ( %random.100% == 53 ))
      wait 2s
      mload obj 89927 
      г Это мы с Иоганном сделали на досуге, да только мне это никчему, а бравому воину самое то.
      дать все %actor.name% 
    else
      say Золото! Что может быть лучше...
      mload obj 89929
      give все .%actor.name%
    end
  break
  case 4
    eval chanse %world.curobjs(89930)%+10
    if (( %random.15% > %chanse% ) || ( %random.100% == 53 ))
      wait 2s
      mload obj 89930
      г Это мы с Иоганном сделали на досуге, да только мне это никчему, а бравому воину самое то.
      дать все %actor.name% 
    else
      say Золото! Что может быть лучше...
      mload obj 89929
      give все .%actor.name%
    end
  break
  default
    wait 2s
    mload obj 89929 
    г Хорошо поработал - получи награду, деньги будут править миром!
    дать все %actor.name% 
  done
  if %actor.align% > 300
    %actor.align(-20)%
  end
~
#89923
карабкаемся~
2 c 1
вскарабкаться лезть карабкаться~
wait 1
wsend %actor% Вы принялись отчаянно карабкаться по корням.
wechoaround %actor% %actor.name% принял%actor.u% отчаянно карабкать%actor.u% по корням.
wait 2s
wsend %actor% Где-то на середине пути вы поняли, что застряли!
wait 2s 
wsend %actor% Корни обхватили Вас, и начали понемногу сжимать.
wait 1s
wsend %actor% Сделав отчаянное усилие Вы таки вырвались, чуть не потеряв ногу! 
eval dmg %actor.hitp%/4
wdamage %actor% %dmg%
wteleport %actor% 89983 horse
wechoaround %actor% Кто-то выбрался из темной дыры в полу.
~
#89924
Смерть лекаря~
0 f 100
~
mload obj 89904
mload obj 89916  
calcuid legat 89906 mob
attach 89915 %legat.id%
~
#89925
репоп зоны~
2 f 100
~
calcuid magistr 89902 mob
detach 89902 %magistr.id%
detach 89911 %magistr.id%
detach 89920 %magistr.id%
attach 89902 %magistr.id%
rdelete hero899 %magistr.id%
wait 2
calcuid iogann 89905 mob
detach 89907 %iogann.id%
detach 89908 %iogann.id%
detach 89924 %iogann.id%
detach 89934 %iogann.id%
rdelete questor89901 %iogann.id%
rdelete questor89902 %iogann.id%
wait 2
calcuid legat 89906 mob
detach 89913 %legat.id%
*detach 89914 %legat.id%
detach 89915 %legat.id%
detach 89917 %legat.id%
detach 89922 %legat.id%
rdelete questor89902 %legat.id%
rdelete hero899 %legat.id%
wait 2
calcuid cook 89915 mob
detach 89900 %cook.id%
detach 89901 %cook.id%
detach 89916 %cook.id%
attach 89900 %cook.id%
rdelete questor899 %cook.id%
wait 2
calcuid groom 89918 mob
detach 89903 %groom.id%
detach 89904 %groom.id%
detach 89905 %groom.id%
detach 89905 %groom.id%
attach 89903 %groom.id%
attach 89904 %groom.id%
attach 89905 %groom.id%
rdelete questor899 %groom.id%
rdelete questor89901 %groom.id%
wait 2
calcuid room1 89983 room
attach 89921 %room1.id%
~
#89926
Боевой триг монаха~
0 k 25
~
set target %random.pc%
if %target%
  msend %target% _Улучив момент, монах ловко пнул Вас!
  mechoaround %target% _Улучив момент, монах ловко пнул %target.vname%!
  %actor.wait(1)%
  eval dmg %random.100%
  mdamage %target% %dmg%
end
~
#89927
убили рыцаря~
0 f 100
~
eval chanse %world.curobjs(89900)%+25
if (( %random.32% > %chanse% ) || ( %random.100% == 53 ))
  mload obj 89900
end
eval chanse %world.curobjs(89901)%+25
if (( %random.31% > %chanse% ) || ( %random.100% == 53 ))
  mload obj 89901
end
eval chanse %world.curobjs(89902)%+25
if (( %random.30% > %chanse% ) || ( %random.100% == 53 ))
  mload obj 89902
end
eval chanse %world.curobjs(89908)%+25
if (( %random.31% > %chanse% ) || ( %random.100% == 53 ))
  mload obj 89908
end
~
#89928
убили лучника~
0 f 100
~
eval chanse %world.curobjs(89912)%+25
if (( %random.32% > %chanse% ) || ( %random.100% == 53 ))
  mload obj 89912
end
eval chanse %world.curobjs(89914)%+25
if (( %random.28% > %chanse% ) || ( %random.100% == 53 ))
  mload obj 89914
end
~
#89929
Убили доминиканца~
0 f 100
~
eval chanse %world.curobjs(89903)%+25
if (( %random.35% > %chanse% ) || ( %random.100% == 53 ))
  mload obj 89903
end
eval chanse %world.curobjs(89938)%+25
if (( %random.31% > %chanse% ) || ( %random.100% == 53 ))
  mload obj 89938
end
~
#89930
убили ландмейтера~
0 f 100
~
eval chanse %world.curobjs(89905)%+25
if (( %random.33% > %chanse% ) || ( %random.100% == 53 ))
  mload obj 89905
end
eval chanse %world.curobjs(89939)%+15
if (( %random.20% > %chanse% ) || ( %random.100% == 53 ))
  mload obj 89939
end
eval chanse %world.curobjs(89935)%+15
if (( %random.17% > %chanse% ) || ( %random.100% == 53 ))
  mload obj 89935
end
~
#89931
убили конюха~
0 f 100
~
if %random.100% < 10
  mload obj 89937
end
~
#89932
звуки лагеря~
2 b 7
~
switch %random.8%
  case 1
    wzoneecho 89900 Слышится конское ржание.
  break
  case 2
    wzoneecho 89900 Откуда-то доносится лязг доспехов и чужеземный говор.
  break
  case 3
    wzoneecho 89900 Слышится хлопанье полотнищ шатров на ветру.
  break
  case 4
    wzoneecho 89900 Порыв ветра принес запах костра.
  break
  case 5
    wzoneecho 89900 Откуда-то послышались торопливые шаги.
  break
  case 6
    wzoneecho 89900 Вы услышали цоканье подкованых копыт.
  break
  case 7
    wzoneecho 89900 Неясная тень промелькнула мимо вас.
  break
  case 8
    wzoneecho 89900 Внезапно послышался громкий крик и брань.
  break
done
~
#89933
Буферный триг на легате~
0 z 1
~
say Это пустой триггер!
~
#89934
Смерть лекаря (квест магистра)~
0 f 100
~
mload obj 89916
~
#89935
Рандом агро у герм. рыцарей~
0 q 56
~
wait 1
if %self.fighting%
  halt
end
mecho _%self.name% посмотрел на вас.
say Хто таки?! Я вас не звал!
stand
set target %random.pc%
kill .%target.name%
~
#89936
Рандом агр у доминиканцев~
0 qt 63
~
wait 1
if %self.fighting%
  halt
end
mecho _%self.name% посмотрел на вас.
рыч
крича Язычники!!! Во славу господа - БЕЙ ИХ!!!
set target %random.pc%
mkill %target%
~
#89937
Рандом агро у патрульных~
0 qt 100
~
wait 1
if %self.fighting%
  halt
end
mecho _%self.name% посмотрел на вас.
крича Лазутчики! Ко мне, братья-рыцари!!!
mkill %actor.name%
set target %random.pc%
mkill %target%
~
#89938
Лоад кнехта~
0 n 100
~
eval chanse %world.curobjs(89940)%+22
if (( %random.30% > %chanse% ) || ( %random.100% == 53 ))
  mload obj 89940
  wield гизарм
end
~
#89939
Слутили моб-стуф~
1 g 100
~
say My trigger commandlist is not complete!
wait 1
if %actor.vnum% != -1
  wait 1
  opurge %self%
end
~
#89940
Загрузка моб-стафа~
0 n 100
~
mload obj 89941
wield меч
~
#89941
Изучение скилла !изгнать нежить! по тригу с книги~
1 c 2
изучить~
wait 1
if !%arg.contains(книгу)%
  osend %actor% _Что вы желаете изучить?
  halt
end
if ((%actor.level%+%actor.remort% < 20) || ((%actor.class% != 0) && (%actor.class% != 9)))
  osend %actor% Вы пролистали книгу, подавляя тошноту при виде жутких рисунков,
  osend %actor% изображающих омерзительных тварей и нежить всех видов.
  osend %actor% Несмотря на все свои старания, вы так и не сумели прочесть ни строчки.
  osend %actor% Видимо, Вам нужно еще поднабраться ума.
  halt
end
if (%actor.skill(изгнать нежить% > 0)
  osend %actor% Вы принялись изучать книгу, но быстро поняли, что ничего нового тут не прочтете.
  halt
end
osend %actor% Вы принялись внимательно изучать книгу, разглядывая устрашающие рисунки.
osend %actor% Через какое-то время на одной из страниц вы обнаружили описание способа уничтожать нежить.
oechoaround %actor% %actor.name% открыл книгу в черном переплете и принял%actor.u% внимательно ее изучать.
oskillturn %actor.name% изгнать.нежить set
wait 1
osend %actor% Книга вспыхнула и рассыпалась в прах.
wait 1
opurge %self%
~
$~
