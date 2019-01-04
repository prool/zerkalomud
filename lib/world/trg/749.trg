#74900
пришли к деду~
0 q 100
*~
wait 2
say Прывiтанне спадарожник.
say Цi не па наша гора ты зайшоy?
say Цi паслухаеш пра бяду вескi нашай?
end
~
#74901
паслухаю~
0 d 100
паслухаю~
wait 3
say Мы народ бедны i усе што маем -- зямля. Яна нас i кормiць.
say Засеялi мы у гэтым годзе збожжа, ды бяда здарылася.
say Нехта у начы усе папераламау, да павытаптау.
say Узялася моладзь наша нябожчыка са свету звесцi, узялi лукi са стрэламi, ды ноччу
say пайшлi на поле.
wait 1
say Глядзь, а негоднiкам тым журавель апынууся.
say Толькi нацэлiлiся на яго паляунiчыя, як той гаворыць чалавечым голасам:
say "Вы гэта што удумалi, людзi?"
say "Ды застрэлiць цябе збiраемся, бо ты ус╦ збожжа патаптау. Мы люд бедны, уся веска 
say з голаду памрэ. А з цябе хоць трохi мяса будзе." -- адказваюць яму.
say "Адпусцi мяне чалавеча! Не ведау я што гэта ваша збожжа, думау панава. А калi вы 
say такiя бедныя, то я вам дапаму" -- гаворыць журавель.
wait 2
say Вось так мы i атрымалi цудоуны абрус. Скажаш яму: 
say "абрус, раскацiся, раскруцiся, дай пiцення, дай ядзення" 
say I такi багаты стол адкрываецца, што i у паноу не убачыш: пiрагi да караваi, 
say варанае, ды смажанае, мiска вяндлiны ды розныя вiны...
say А як скажаш:
say "абрус, скацiся, скруцiся, пiценне, яденне згарнiся"
say абрус зноу становiцца такiм як быу.
say I праз гэты цуд уся веска гора не ведала. 
say Алеж празнау пра яго пан, ды адабрау. Вось i гаруем мы.
взд
wait 4
say Цi не дапаможаш?
attach 74902 %self.id%
attach 74903 %self.id%
detach 74900 %self.id%
detach 74901 %self.id%
end
~
#74902
невзялквестудеда~
0 q 100
*~
wait 1
эм с надеждой вздохнул
~
#74903
дапамагу~
0 d 100
дапамагу~
wait 2
say Цудоуна, да толькi сам ты на пана нашага управу не знойдеш. Ты схадзi да журауля.
say Ен за полем жыве, каля грушы. Авось чаго да падкажа.
attach 74904 %self.id%
calcuid jur 74900 mob
attach 74905 %jur.id%
attach 74906 %jur.id%
attach 74913 %self.id%
detach 74902 %self.id%
detach 74903 %self.id%
end
~
#74904
взялквестудеда~
0 q 100
*~
wait 3
say Ну што там з нашым абрусам?
end
~
#74905
зашелкжуравлю~
0 q 100
*~
wait 3
say Дабрыдзень чалавеча!
say Як там сельскi люд, цi спадабауся iм мой абрус? 
say Цi не здарылася бяды якой?
end
~
#74906
здарылася~
0 d 100
здарылася~
wait 3
say Як?! Няужож пан забрау абрус?
say Эх нягоднiк.
wait 5
взд
wait 10
say Трэба наказаць ашуканца, ды слабы я стау. 
say Нейкую хваробу падчапiу i летаю дрэнна.
say Ты пайдзi да траунiцы у веску, спытай траукi якой цалебнай,
say а тады ужо i я з панам памагу.
attach 74907 %self.id%
calcuid trav 74907 mob
attach 74908 %trav.id%
detach 74905 %self.id%
detach 74906 %self.id%
end
~
#74907
выть~
0 q 100
*~
wait 3
выть
end
~
#74908
утравницы~
0 q 100
*~
wait 2
say Бачу не спраста да мяне завiтау.
say Хочаш каб я жураулю дапамагла? Да я б i без цябе памагла, але ж рэдкая у яго хвароба.
say I каб выратаваць птушку спатрэбiцца капна валос Бабы Ягi.
say Ды де ж яе возьмеш? Усiх iх разам з Кашчэямi папалiлi дауно. 
wait 5
say А хаця пагадзi. Гавораць паляунiчыя, быцам у старой весцы, што у старонцы ад дарогi, 
say бачылi некалькi раз старуху. Мабыць i не Баба Яга, ды па беднасцi згадзiцца, 
say i вяскоуцы удзячны будуць.
wait 10
say Ступай да яе. Пагутары па свойску, па геройскi.
say А каб у заброшаную веску папасць, знайдзi лесавiка, што за полем у лесе жыве.
say Ен усе тайныя тропкi у нашых месцах ведае.
attach 74909 %self.id%
calcuid lesh 74904 mob
attach 74910 %lesh.id%
attach 74911 %self.id%
detach 74908 %self.id%
end
~
#74909
взялквестутравницы~
0 r 100
*~
say Ты ужо зняу праклен са старой вескi?
вопр
~
#74910
улесомыки~
0 q 100
*~
wait 2
say А вось i наш герой! Зачакауся я цябе, ведаю па што прыйшоу, i чым дапамагчы.
say Слухай.
say Ля дарогi есць вялiзны куст без лicця. Ен ужо дайно не цвяце, зрэж яго, цi вырвi, калi
say сiлы хопiць. За iм убачыш патаемную тропку. Па ей iдзi i нiкуды не зварочвай.
say Ступай.
calcuid qroom 74929 room
attach 74915 %qroom.id%
detach 74910 %self.id%
end
~
#74911
даемворожеискальп~
0 j 100
*~
switch %object.vnum%
  case 74900
    wait 5
    say Ай маладец! Зняу пракл╦н са старой вескi. У хуткiм часе загучаць там маладыя галасы.
    say Ды i валос нарыу добра.
    эм кинула копну волос в котел с черным зельем. Судя по запаху, основным компонентом варева 
    была не трава, а самогон.
    say Трымай!
    mload obj 74901
    дать варево %actor.name%
    say Ды хутчэй да журауля бягi!
    attach 74915 %self.id%
    attach 74914 %self.id%
    detach 74909 %self.id%
    detach 74911 %self.id%
  end
~
#74912
даемсэмжуравлю~
0 j 100
*~

if (%object.vnum% == 74901)
  wait 10
  эм принюхался к зелью.
  wait 10
  эм чуток окосел.
  wait 1s
  осуш зелье
  wait 10
  msend %actor% У Вас потекли слюнки.
  wait 1s
  wecho Через минуту журавль уже летел под облаками.
  wecho "Нае... Обманул!"-- горестно подумали Вы.
  wecho Ан нет! Вон уже летит обратно и несет что-то в клюве.
  wait 10
  say Гэты срэбраны рог дапаможа табе.
  mload obj 74902
  дать рог %actor.name%
  wait 10
  say Як да пана прыйдзеш, дай яму рог.
  say А калi прагучыць: "З гэтага рога усяго многа!", так адайдзi трохi далей i не мешай.
  say Потым пан стане меньш упарты.
  ул
  attach 74914 %self.id%
  detach 74907 %self.id%
  detach 74912 %self.id%
end
~
#74913
сдаемквестдеду~
0 j 100
*~
switch %object.vnum%
  case 74903
    wait 5
    эм заплакал от радасти.
    say Дзякую чалавеча! Добры ты, а для добрых людзей нiчога не жалка.
    eval rand %random.100%
    if (%rand% < 10) && (%world.curobjs(74922)% < 4)
      mload obj 74922
      дать оберег %actor.name%
    elseif (%rand% < 20) && (%world.curobjs(74923)% < 10)
      mload obj 74923
      дать колечко %actor.name%
    else
      msend %actor% Старик дал небольшую кучку кун.
      %actor.gold(+2000)%
    end
    attach 74914 %self.id%
    detach 74904 %self.id%
    detach 74913 %self.id%
  end
~
#74914
последнийразкдеду~
0 q 100
*~
wait 2
say Дзень добры!
end
~
#74915
срубить срезать вырвать~
2 c 100
вырвать~
if !%arg.contains(куст)% 
  return 0
  halt
end
wecho Вырвав куст, Вы заметили тропку.
wdoor   74929 west room 74930
wdoor   74930 east room 74929
detach  74915 %self.id%
~
#74916
зашликзломупану~
0 r 100
*~
wait 2
say Чаго прыйшоу да мяне? Мабыць пазваць гайдукоу, каб табе бiзуноу усыпалi?
end
~
#74917
даемрогпану~
0 j 100
*~
switch %object.vnum%
  case 74902
    wait 1
    mpurge %object%
    wait 5
    say Што гэта? Рог?
    say I што мне будзе з гэтага рога?
    attach 74918 %self.id%
  done
~
#74918
гусягомнога~
0 c 100
усяго~
if !%arg.contains(многа)%
  return 1
  halt
end
mecho Откуда ни возьмись, появились семь богатырей, и давай пана плетями хлестать. 
mecho Так отхлестали, что все шмотки на лоскуты распустились, а рожа как слива стала. 
mecho А потом неожиданно исчезли все разом.
wait 5
mecho Пан охая заорал: "ХВАТИТ!"
wait 5
mecho  Пан не на шутку разъярился, и с диким воплем бросился на Вас.
mload  mob 74919
calcuid pan 74918 mob
mpurge %pan%
~
#74919
пансдох~
0 f 100
*~
if %world.curobjs(74903)% < 1
  mload obj 74903
end
~
#74920
карготасдохла~
0 f 100
*~
if %world.curobjs(74903)% < 1
  mload obj 74900
end
if (%world.curobjs(74909)% < 5) && (%random.1000% <= 150)
  mload obj 74909
end
~
#74921
убили молодую девушку~
0 f 100
*~
if (%world.curobjs(74904)% < 5) && (%random.1000% <= 150)
  mload obj 74904
end
if (%world.curobjs(74906)% < 5) && (%random.1000% <= 100)
  mload obj 74906
end
if (%world.curobjs(74908)% < 5) && (%random.1000% <= 100)
  mload obj 74908
end
~
#74922
вздох~
0 ab 50
*~
if %random.15%==1 then
  эм томно вздохнула.
end
~
#74923
превеед!~
0 ab 50
*~
if %random.5%==1 then
  say Дзень добры!
end
~
#74924
ребутзоны~
2 f 100
*~
wdoor   74930 east  purge
wdoor   74929 west  purge
calcuid qroom 74929 room
calcuid ded 74905 mob
calcuid jur 74900 mob
calcuid trav 74907 mob
calcuid les 74904 mob
calcuid pan 74918 mob
calcuid ved 74902 mob
global qroom
global ded
global jur
global trav
global les
global pan
global ved
attach 74900 %ded.id%
attach 74901 %ded.id%
attach 74920 %ved.id%
detach 74915 %qroom.id%
detach 74902 %ded.id%
detach 74903 %ded.id%
detach 74904 %ded.id%
detach 74905 %jur.id%
detach 74906 %jur.id%
detach 74907 %jur.id%
detach 74908 %trav.id%
detach 74909 %trav.id%.
detach 74910 %les.id%
detach 74914 %ded.id%
detach 74914 %jur.id%
detach 74914 %trav.id%
detach 74918 %pan.id%
~
#74925
убили охраника деревни~
0 f 100
*~
if (%world.curobjs(74917)% < 5) && (%random.1000% <= 150)
  mload obj 74917
end
if (%world.curobjs(74924)% < 5) && (%random.1000% <= 100)
  mload obj 74924
end
~
#74926
убили селянина~
0 f 100
*~
if (%world.curobjs(74905)% < 5) && (%random.1000% <= 150)
  mload obj 74905
end
if (%world.curobjs(74907)% < 5) && (%random.1000% <= 100)
  mload obj 74907
end
~
#74927
убили дух селянина~
0 f 100
*~
if (%world.curobjs(74910)% < 5) && (%random.1000% <= 150)
  mload obj 74910
end
~
#74928
убили журавля~
0 f 100
*~
if (%world.curobjs(74915)% < 5) && (%random.1000% <= 150)
  mload obj 74915
end
if (%world.curobjs(74916)% < 5) && (%random.1000% <= 150)
  mload obj 74916
end
~
#74929
убили лесомыку~
0 f 100
*~
if (%world.curobjs(74913)% < 5) && (%random.1000% <= 150)
  mload obj 74913
end
if (%world.curobjs(74914)% < 5) && (%random.1000% <= 150)
  mload obj 74914
end
~
#74930
убили карготу~
0 f 100
*~
if (%world.curobjs(74909)% < 5) && (%random.1000% <= 150)
  mload obj 74909
end
~
#74931
убили гайдука~
0 f 100
*~
if (%world.curobjs(74911)% < 3) && (%random.1000% <= 100)
  mload obj 74911
end
~
#74932
убили охраника поместья~
0 f 100
*~
if (%world.curobjs(74917)% < 5) && (%random.1000% <= 150)
  mload obj 74917
end
if (%world.curobjs(74924)% < 5) && (%random.1000% <= 100)
  mload obj 74924
end
~
#74933
убили казанову~
0 f 100
~
if (%world.curobjs(74925)% < 3) && (%random.1000% <= 100)
  mload obj 74925
end
~
#74934
убили пана~
0 f 100
*~
if (%world.curobjs(74920)% < 5) && (%random.1000% <= 150)
  mload obj 74920
end
if (%world.curobjs(74921)% < 3) && (%random.1000% <= 70)
  mload obj 74921
end
~
#74935
убили ашуканца~
0 f 100
~
if (%world.curobjs(74912)% < 3) && (%random.1000% <= 100)
  mload obj 74912
end
~
#74936
убили убили гостя~
0 f 100
*~
if (%world.curobjs(74918)% < 5) && (%random.1000% <= 150)
  mload obj 74918
end
if (%world.curobjs(74919)% < 5) && (%random.1000% <= 150)
  mload obj 74919
end
~
$~
