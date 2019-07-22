#14100
речь Федота~
0 q 100
~
if (%speaking% == 0)
  eval speaking 1
  wait 2s
  тоск
  г Я, Марусенька, царю
  г Прямо так и говорю
  г Мол, с утра температурю
  г Мол, буквально, весь горю
  wait 2s
  г Царь, как сьемши белены
  г Гнет свое и хоть бы хны -
  г -- Енто, Федька, ассамблея
  г А не тещины блины!.
  wait 2s
  взд
  г Он у шведского посла
  г Забивал вчерась козла
  г И расхвастал что культура
  г Наша шибко возросла
  wait 2s
  г Вот, к примеру, мол, Федот
  г Был типичный обормот
  г А теперь на удивленье
  г Жизнь культурную ведет.
  wait 2s
  г Пьет не пиво, а боржом
  г Борщ ест с вилкой и ножом
  г Исполняет па-де-грасы
  г Хоть бери камер-пажом.
  wait 2s
  груст
  г Тот под ентот коленкор
  г Говорит -- извольте спор
  г Ну хотяб на Кемску волость
  г Кто из нас ловчей танцор.
  wait 2s
  г Я, Марусь, совсем зачах --
  г Вон, штаны на помочах
  г А посол как лось разьелся
  г На казенных-то харчах.
  wait 2s
  г Так отплясывает, гад
  г Аж портки на ем трещат
  г Он заткнет меня за пояс
  г В две минуты, аккурат.
  wait 2s
  безнад
  г Чую, завтра лажану
  г Опозорю Русь родну
  г Али в скатерть насморкаюсь
  г Али на царя чихну.
  рыдать 
  attach 14101 %self.id%
  eval speaking 0
end    
~
#14101
помогу~
0 d 0
помогу~
рыч %actor.iname%
г Я от ваших 'помогу'
г Ощущаю резь в мозгу!
г Щас как дам тебе по шее!
г Маня, дай-ка кочергу! 
wait 2s
calcuid Marusya 14101 mob
mforce %Marusya% укор .Федот
mforce %Marusya% г Аль ты, Федя, грубиян?!
mforce %Marusya% г Али горем обуян?
mforce %Marusya% г Помощь нам придется кстати
mforce %Marusya% г У мене родился план.
wait 2s
mforce %Marusya% г Есть в лесу, где самый гнус
mforce %Marusya% г Домик в стиле а ля рюс
mforce %Marusya% г Там живет одна старушка..
mforce %Marusya% г Ты вникаешь в мой дискурс?
wait 2s
крест
г Маня, ты чего ж, эге,
г Шлешь никак меня к Яге?!
г Лучше я на плахе сгину
г Чем у ей на языке!
фиг %Marusya.iname%    
wait 2s
mforce %Marusya% снять жемчуг
mforce %Marusya% дать жемчуг Федот
mforce %Marusya% г Поднесешь ей жемчуга
mforce %Marusya% г Станет добрая Яга
mforce %Marusya% г Я слыхала ей не чужды
mforce %Marusya% г Матерьяльные блага.
wait 2s
mforce %Marusya% г И еще слыхала весть
mforce %Marusya% г Крем у ей особый есть
mforce %Marusya% г Он тебя излечит мигом
mforce %Marusya% г Правда кожа может слезть.
mforce %Marusya% смущ
wait 2s
г Раз такие пироги
г Надо топать до Яги
г Наливай, Марусь, по чарке
г Пьем до дна, на ход ноги.
wait 2s
тост             
mforce %actor% тост
wait 2s
mload obj 14102
дать огурец %actor.iname%
г На, родимый, похрусти
г Бинди на меня 'спасти'
г И пойдем искать дорогу
г Ну, Маруся, не грусти!
след %actor.iname%
пока %Marusya.iname%
makeuid questor141 %actor.id%
global questor141
calcuid Tsar 14102 mob
remote questor141 %Tsar.id%
calcuid Sosny 14135 room
remote questor141 %Sosny.id%
detach 14100 %self.id%
detach 14101 %self.id%
~
#14102
речь Бабы-яги~
0 gq 100
~
calcuid Fedot 14100 mob
настор
г Чую запах алкоголя...
г Русским духом тянет, чтоли...
wait 3s 
if (%yaga_gifted% != 1)
  настор
  wait 3s
end
if (%yaga_gifted% != 1)
  настор
  wait 3s
end
if (%yaga_gifted% == 1)
  if (%Fedot% && %Fedot.room%==%self.room%)
    г Ох, уважили меня
    г Я ж как раз второго дня
    г Именины отмечала,
    г Собиралася родня.
    wait 2s
    г За подарок гран мерси
    г А теперь давай, проси
    г Без нужды к Яге являться
    г Не водилось на Руси
    wait 2s
    mechoaround %Fedot% Федот от страха икает, горе свое излагает.
    wait 2s
    г Так и быть уж, излечу
    г Мне такое по плечу
    г Дай-ка кое-где помажу
    г И чавой-то пошепчу...
    шепт %Fedot.iname% чуфырь-чуфырь-чуфырь
    exec 14109 %Fedot.id%
    wait 2s
    вопрос %Fedot.iname%
    г Чтой-то ты не рад, сынок
    г Аль лечение не впрок?
    г Аль робеешь с непривычки? -- 
    г Вон, кафтан под мышкой взмок..
    wait 2s
    mforce %Fedot% г Опасаюсь выйдет срам
    mforce %Fedot% г Не привычный я к пирам
    mforce %Fedot% г Я от ентого волненья
    mforce %Fedot% г Может даже дуба дам.
    mforce %Fedot% тоск
    wait 2s        
    плюн
    г Тьфу ты, Федька, как телок!
    г Только чем жену привлек!
    г Ладно уж, пока живая
    г Преподам тебе урок.
    wait 2s            
    mechoaround %self% Баба-Яга грудь вперед, плечи взад и ну плясать на заморский лад.
    mechoaround %self% Да как ловко, что значит сноровка!
    mechoaround %self% Ну прямо придворная дама.
    wait 2s
    г Ты не ножками сучи,
    г А движения учи
    г Ты в младенчестве не падал
    г Головою вниз с печи?
    wait 2s
    г Руки вместе, ноги врозь
    г Головою дергать брось!
    г Делай раз! Теперь еще раз!
    г Ну, хорош, сойдет небось.
    wait 2s
    mechoaround %Fedot% Федот запыхался, но кой-чему нахватался.
    attach 14103 %self.id%
    detach 14102 %self.id%  
  end
else
  уб %actor.iname%
  detach 14102 %self.id%
end
~
#14103
Баба-яга бухтит~
0 d 1
*~
if (%random.10% == 1)
  г Ну, чаво еще тебе?
  г Кыш, мешаешь ворожбе!
end
~
#14104
танцы~
0 q 100
~
if !%exist.mob(14127)%
  halt
end
calcuid Fedot 14127 mob
wait 1
if (!%Fedot% || (%Fedot.realroom%!=%self.realroom%))
  halt
end
wait 3s
г Федь, ты здеся, аль не здесь?!
г Я ужо извелся весь.
г Начинаем состязанья!
г Щас собьем с чухонца спесь.
mforce %Fedot% след я
wait 2s
mechoaround %self% Ну, кажись, пляски начались.
wait 2s
mechoaround %self% Посол со всех ног пустился в прискок.
mechoaround %self% А Федька в ответ - заложил пируэт.
wait 2s
mechoaround %self% Шведский посол сильно в раж вошел.
mechoaround %self% А Федька-стрелец БОЛЬНО ловок, шельмец.
wait 2s
mechoaround %self% Гляди, у посла носом кровь пошла!
mechoaround %self% А Федька вприсядь пустился плясать.
wait 2s
mforce %questor141% крич Долой шведа! Федота победа!
wait 2s
хих швед
г Что, Альфред, продул пари?!
г Ну-кась юшку подотри!
г Будешь должен Кемску волость
г И чего там в ей внутри
wait 2s
ласк .%Fedot.name%
г Федя, подь ко мне сюда
г Как рассейский государь
г Я тебе за верну службу
г Щас пожалую медаль
wait 2s
mechoaround %self% Батюшка-царь полез в инвентарь.
wait 2s
if ((%random.2% == 1) && (%world.curobjs(14100)% < 3))
  г Всем медалям медаль!
  г Кованная сталь!
  mload obj 14100
  дать медаль %Fedot.iname%
else
  г Нету, Федя, медали
  г Видать все раздали...
  пожа
end
if (%questor141.class% == 10 && %questor141.can_get_skill(уклониться)%)
  wait 2s
  mforce %Fedot% пожа %questor141.iname%
  mforce %Fedot% г Я тебя из лучших чувств
  mforce %Fedot% г Уклоненьям обучу --
  mforce %Fedot% г Верткость в жизни пригодится...
  mforce %Fedot% г Вот, гляди, как я верчусь.
  mskillturn %questor141% уклониться set
end
wait 2s
mforce %Fedot% дать медаль %questor141.iname%
mforce %Fedot% г Мне наградою с лихвой
mforce %Fedot% г Служит факт, что я живой
mforce %Fedot% г Я пойду, покуда снова
mforce %Fedot% г Не удумали чаво...
mforce %Fedot% пока
mteleport %Fedot% 14100
detach 14104 %self.id%
~
#14105
засада~
0 g 100
~
calcuid Fedot 14100 mob
if (%Fedot% && %Fedot.room%==%self.room%)
  mechoaround %self% Ктой-то засвистал в ветвях - енто значит дело швах.
  wait 2s
  mechoaround %Fedot% На Федьке от страха намокла рубаха. 
  wait 2s
  встать
  г Приступаем к грабежу!
  г Кто филонит - накажу!  
  foreach ch %self.npc%
    if (%ch.vnum%==14123)
      mforce %ch% уб %Fedot.iname%
    end
  done
  уб %Fedot.iname% 
  attach 14107 %Fedot.id% 
  detach 14105 %Fedot.id%                       
end
~
#14106
репоп~
2 f 100
~
eval speaking 0
global speaking
*eval yaga gifted 0
*global yaga gifted
if %exist.mob(14124)%
  calcuid yaga 14124 mob
  detach 14103 %yaga.id%
end
if %exist.mob(14127)%
  calcuid Fedot_da_ne_tot 14127 mob
  wpurge %Fedot_da_ne_tot%
end
if %exist.mob(14102)%
  calcuid zar 14102 mob
  attach 14104 %zar%
end
wait 1
calcuid r1 14135 room
%door% %r1% north purge
attach 14110 %r1%
~
#14107
роняем жемчуг~
0 p 100
~
mechoaround %self% Федька в драке разьярясь, уронил чегой-то в грязь.
брос жемчуг  
detach 14107 %self.id%
~
#14108
дали Яге жемчуг~
0 j 100
~
if (%object.vnum%==14101)
  wait 1s
  %purge% %object%
  рад
  *одеть жемчуг
  eval yaga_gifted 1
  global yaga_gifted
end
~
#14109
Федот перекидывается~
0 z 100
~
mtransform 14127
~
#14110
в трех соснах~
2 eg 10
~
if (%questor141% && %questor141.realroom%==14135)
  wdoor 14135 n room 14144
  detach 14110 %world.room(14135)%
end
~
#14111
убили царя~
0 f 100
~
if (%random.1000% < 100) && (%world.curobjs(14103)% < 6)
  mload obj 14103
end
~
#14112
убили стрельца~
0 f 100
~
if (%random.1000% < 100) && (%world.curobjs(14107)% < 6)
  mload obj 14107
end
~
#14113
убили потешника~
0 f 100
~
if (%random.1000% < 100) && (%world.curobjs(14108)% < 6)
  mload obj 14108
end
~
#14114
убили турецкого пашу~
0 f 100
~
if (%random.1000% < 100) && (%world.curobjs(14109)% < 6)
  mload obj 14109
end
~
#14115
убили гишпанца~
0 f 100
~
if (%random.1000% < 100) && (%world.curobjs(14110)% < 6)
  mload obj 14110
end
~
#14116
убили германца~
0 f 100
~
if (%random.1000% < 100) && (%world.curobjs(14111)% < 6)
  mload obj 14111
end
~
#14117
убили царевну~
0 f 100
~
if (%random.1000% < 100) && (%world.curobjs(14112)% < 6)
  mload obj 14112
end
~
#14118
убили генерала~
0 f 100
~
if (%random.1000% < 100) && (%world.curobjs(14113)% < 6)
  mload obj 14113
end
~
#14119
убили посла~
0 f 100
~
if (%random.1000% < 100) && (%world.curobjs(14114)% < 6)
  mload obj 14114
end
~
#14120
убили посла~
0 f 100
*~
if (%random.1000% < 100) && (%world.curobjs(14115)% < 6)
  mload obj 14115
end
if (%random.1000% < 100) && (%world.curobjs(14104)% < 6)
  mload obj 14104
end
~
#14121
убили бандита~
0 f 100
~
if (%random.1000% < 100) && (%world.curobjs(14116)% < 6)
  mload obj 14116
end
~
#14122
убили английского посла~
0 f 100
~
if (%random.1000% < 100) && (%world.curobjs(14117)% < 6)
  mload obj 14117
end
~
#14123
убили царицу~
0 f 100
~
if (%random.1000% < 100) && (%world.curobjs(14118)% < 6)
  mload obj 14118
end
~
#14124
убили бабу-ягу~
0 f 100
~
if (%random.1000% < 100) && (%world.curobjs(14119)% < 6)
  mload obj 14119
end
~
#14125
убили стрельца~
0 f 100
~
if (%random.1000% < 100) && (%world.curobjs(14120)% < 6)
  mload obj 14120
end
~
#14126
убили зверя~
0 f 100
~
if (%random.1000% < 3) && (%world.curobjs(14121)% < 2)
  mload obj 14121
end
~
#14127
убили купца~
0 f 100
~
if (%random.1000% < 15) && (%world.curobjs(14122)% < 3)
  mload obj 14122
end
~
#14128
убили филата~
0 f 100
~
if (%random.1000% < 15) && (%world.curobjs(14123)% < 5)
  mload obj 14123
end
~
#14129
убили прова~
0 f 100
~
if (%random.1000% < 15) && (%world.curobjs(14124)% < 5)
  mload obj 14124
end
~
#14130
убили устина~
0 f 100
~
if (%random.1000% < 15) && (%world.curobjs(14125)% < 5)
  mload obj 14125
end
~
$~
