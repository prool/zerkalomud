#4700
входят к сторожевому псу~
0 q 33
~
wait 1
: неторопливо подошел к вам и обнюхал
~
#4701
Входят к хуторянину~
0 q 100
~
wait 1
if !%exist.mob(4723)%
  halt
end
if %actor.id% == %questor47.id%
  halt
end
emot поднял голову и пристально посмотрел на Вас
wait 3
say Здраве... Давненько уж ко мне никто не заходил.
if !%questor47%
  say Ну, коли пожаловал%actor.g% - может пособишь в одном деле?
  say Я уж отблагодарю, чем могу.
  attach 4702 %self.id%
else
  say В моем доме гостю рады всегда, хоть богатством я похвастать не могу.
end
~
#4702
Выдача квеста~
0 d 0
помогу слушаю согласен пособлю да~
if %actor.vnum% != -1
  halt
end
wait 1
if %questor47.id% ==  %actor.id%
  say Ну что ты заладил%actor.g% - "помогу" да "помогу".
  say Хочешь помочь - так я тебе уже сказал, чем мне угодить можешь.
  say Вот и ступай. Ну а коли не желаешь зря утруждаться, дело твое.
  ворчать
  halt
end
if %questor47%
  wait 2
  say Я уже попросил о помощи %questor47.vname%, жду вот.
  say А к тебе у меня просьб нет.
  say Присядь, передохни с дороги.
  halt
end
if (%world.curmobs(4723)% == 0)
  halt
end
set questor47 %actor%
calcuid mainwolf 4723 mob
attach 4703 %mainwolf.id%
global questor47
remote questor47 %mainwolf.id%
wait 1s
кашель
say Тут вот какое дело. Живу я один - овец вон развожу, да птицу, бывает, стреляю.
say Ну там вершу-другую в реку закинуть...
wait 1s
say Сам понимаешь - до деревни тут не близко, волков в округе хватает, но доселе я и сам с ними справлялся.
say Но уж седьмиц пять, как завелся в округе волк матерый. Я его раз вcего видел - ох и здоров же!
say И хитрый - что твой лис: под стрелу не суется, в яму не попадет.
wait 1s
say Устроил где-то логово себе в буераках окрестных - оттуда и выходит по ночам разбойничать.
say Недавно же лучшую овцу мою, которую я к корочуну откармливал, задрал и в лес уволок - только я его и видел
wait 1s
say Пробовал я его ловить... Да видать стар стал по оврагам лазить.
say Не сослужишь ли службу мне, прикончив этого зверя?
say Чем смогу - отблагодарю, но на сокровища великие не рассчитывай.
смея
say Небогат я нынче.
if (( %actor.quested(4700)% == 0 ) && ( %actor.level% < 15 ) && (%actor.realroom% == %self.realroom%))
  msend %actor% Старый хуторянин подмигнул Вам и что-то прошептал.
  dg_cast 'освящ' .%actor.name%
end
attach 4704 %self.id%
~
#4703
Вожак убит~
0 f 100
~
if %actor.vnum% == -1
  set killer47 %actor%
else
  set killer47 %actor.leader%
end
global killer47
calcuid hunter 4721 mob
remote killer47 %hunter.id%
mload obj 4704
~
#4704
награда за квест~
0 j 100
~
wait 1
if %object.vnum% != 4704
  say Зачем ты мне это принес%actor.q%?
  вопрос .%actor.name%
  drop all
  halt
end
wait 1
mjunk all
if (%actor.id% != %questor47.id%)
  say Я не просил тебя о помощи, но все равно, прими мою благодарность.
  поклон .%actor.name%
  detach 4704 %self.id%
  halt
end
if (%actor.id% != %killer47.id%)
  say Ну что же, тому, кто с волком управился, спасибо от меня...
  say Да только - это не ты ведь был%actor.g%, не так ли?!
  say Ступай-ка отсель, не терплю лжецов!
  гнев
  detach 4704 %self.id%
  halt
end
say Молодчина! Управил%actor.u% с этим зверем!
emot осмотрел громадную волчью голову
say Да... И впрямь здоров был.
say Давай-ка глянем, как бы наградить тебя.
wait 1s
say Ты, верно, понял%actor.g% - не всегда я простым охотником был да овец пас.
say Случалось мне и меч в руках держать, и броню примеривать, да и вождям служить славным.
say Все бывало... когда-то.
wait 2
if (%questor47.quested(4700)% == 0)
  switch %actor.class%
    case 2
      if !%actor.skill(подножка)%
        say Научу я тебя воинской хитрости одной, в честной битве может и не сгодится
        say Но вот караульного тихо убрать, так чтоб и крикнуть не успел - это да.
        mskillturn %actor% подножка set
      end
    break
    case 3
      if !%actor.skill(богатырский молот)%
        say Научу я тебя удару особому, против которого никто не устоит!
        mskillturn %actor% богатырский.молот set
      end
    break
    case 4
      if !%actor.skill(отравить)%
        say Научу я тебя как зелье составить, так что даже и малая рана от оружия твоего насмерть разить будет.
        mskillturn %actor% отравить set
      end
    break
    case 5
      if !%actor.skill(осторожный стиль)%
        say Научу я тебя, как в бою от хитростей вражьей и магии злой защищаться.
        mskillturn %actor% осторожный.стиль set
      end
    break
    case 9
      if !%actor.skill(точный стиль)%
        say Научу я тебя мечом владеть так, чтоб с одного удара мог недругу голову снять!
        mskillturn %actor% точный.стиль set
      end
    break
    case 10
      if !%actor.skill(лидерство)%
        say Научу я тебя, как друзей да воинов своих в бою и походе вести без потери и с легкостью.
        mskillturn %actor% лидерство set
      end
    break
    case 11
      if !%actor.skill(оглушить)%
        say Научу я тебя удару, после которого супротивник твой не сразу и вспомнит, кто он, да откуда родом.
        mskillturn %actor% оглушить set
      end
    break
    case 12
      if !%actor.skill(метнуть)%
        say Научу я тебя, как нож да копье в ворога метать следует, так что, бывает, боле и стараться не придется.
        say Коли попадешь верно.
        ул
        mskillturn %actor% метнуть set
      end
    break
  done
  mechoaround %actor% Старый воин дал %actor.dname% несколько наставлений по боевому искусству.
  msend %actor% Старый воин дал вам несколько наставлений по боевому искусству.
  %questor47.setquest(4700)%
end
eval chance %random.20%
if (%chance% < 2)
  say Вот, возьми эту книгу. Снадобье, секрет которого здесь описан, не раз тебе поможет!
  mload obj 1706
  set bonus 1
elseif (%chance% < 6)
  if %world.curobjs(4701)% < 10
    say Возьми-ка вот этот меч. Хотя и не из лучших клинок, но службу верную сослужил он мне.
    mload obj 4701
    set bonus 1
  end
elseif (%chance% < 9)
  if %world.curobjs(4703)% < 8
    say Возьми вот лук этот. Хотя и посильней луки бывали, но в руках умелых и этот - оружие верное.
    mload obj 4703
    set bonus 1
  end
elseif (%chance% < 15)
  if %world.curobjs(4705)% < 8
    *пока кладем кинжал - потом выложим здесь книгу "страха"
    say Возьми вот этот кинжал. Из дальнего похода привез я его, в бою взявши.
    mload obj 4705
    set bonus 1
  end
end
give all .%actor.name%
if (%bonus% != 1)
  say Прими, вот, за помощь свою немного кун.
  %send% %actor% %self.iname% протянул Вам мешочек с кунами.
  eval temp %actor.gold(+500)%
end
detach 4702 %self.id%
detach 4704 %self.id%
~
#4705
Репоп зоны "среди холмов"~
2 f 100
~
if %exist.mob(4723)% 
  calcuid wolf 4723 mob
  detach 4703 %wolf.id%
end
~
$~
