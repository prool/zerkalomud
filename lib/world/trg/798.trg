#79800
reset~
2 f 100
~
wdoor 79807 east purge room 79806
wdoor 79806 west purge room 79807
rdelete klok798 79839
rdelete nogti798 79839
rdelete zybu798 79839
~
#79801
триг следопыта~
0 r 100
~
wait 1s
г Кто здесь? Свой или чужой?
detach 79801 %self.id%
~
#79802
свой~
0 d 100
свой~
wait 1s
say А, ну хорошо, если свой!
wait 1s
say А то тут чужаков тут пруд пруди, уж не знаю долго ли я еще продержусь.
wait 1
say Я тут сделал небольшую лазейку под их частоколом, думаю, ты сможешь пролезть.
wait 1s
say Я кустарником отверстие подпираю, что б никто не заметил.
say Я помогу тебе обойти пост дозора, и ты сможешь попасть в лагерь через эту дыру.
wait 1s
say Но если тебя поймают! Не выдавай меня!
wait 1s
say Готов? Сейчас открою тебе проход на несколько секунд, не медли!
wait 2s
say Ну все! Ступай! Да будь осторожен.
say Ах да! еще одно! если захочешь вернуться с лагеря, постучи по частоколу.
mdoor 79806 west room 79807
mecho Следопыт отодвинул кусты и перед Вами возникло небольшое отверстие в частоколе, ведущее в лагерь.
wait 5s 
mdoor 79806 west purge room 79807
mecho Следопыт закрыл отверстие густым кустом и спрятался в нем.
~
#79803
лоад топора с гербом~
0 n 100
~
if (%world.curobjs(79809)% < 3) && (%random.100% <= 10)
  mload obj 79809
end
~
#79804
стучать частокол~
2 c 100
стучать~
wecho Вы постучали по частоколу.
wait 2s
wecho Вдруг Вы услышали шелест и шорох.
wait 1s
wecho Следопыт убрал преграду, и теперь Вы можете пролезть обратно.
wait 10
wecho Вы услышали тихий шепот с другой стороны частокола "Лезь, давай!"
wdoor 79807 east room 79806
wait 5s
wecho Следопыт закрыл проход.
wdoor 79807 east purge room 79806
~
#79805
Факелы~
2 f 100
~
wload obj 79800
~
#79806
лоад головы~
0 f 100
~
mload obj 79728
~
#79807
лоад стафа мехового~
0 n 100
~
if (%world.curobjs(79801)% < 3) && (%random.100% <= 3)
  mload obj 79801
end
if (%world.curobjs(79802)% < 3) && (%random.100% <= 3)
  mload obj 79802
end
if (%world.curobjs(79803)% < 3) && (%random.100% <= 3)
  mload obj 79803
end
if (%world.curobjs(79804)% < 3) && (%random.100% <= 3)
  mload obj 79804
end
if (%world.curobjs(79805)% < 3) && (%random.100% <= 3)
  mload obj 79805
end
if (%world.curobjs(79806)% < 3) && (%random.100% <= 3)
  mload obj 79806
end
if (%world.curobjs(79807)% < 3) && (%random.100% <= 3)
  mload obj 79807
end
if (%world.curobjs(79808)% < 3) && (%random.100% <= 3)
  mload obj 79808
end
~
#79808
лоад копья с гербом~
0 n 100
~
if (%world.curobjs(79810)% < 3) && (%random.100% <= 10)
  mload obj 79810
end
~
#79809
лоад меча с гербом~
0 n 100
~
if (%world.curobjs(79811)% < 3) && (%random.100% <= 10)
  mload obj 79811
end
~
#79810
лоад клинка с гербом~
0 n 100
~
if (%world.curobjs(79812)% < 3) && (%random.100% <= 10)
  mload obj 79812
end
~
#79811
лоад самострела с гербом~
0 n 100
~
if (%world.curobjs(79813)% < 3) && (%random.100% <= 10)
  mload obj 79813
end
~
#79812
лоад молота с гербом~
0 n 100
~
if (%world.curobjs(79814)% < 3) && (%random.100% <= 10)
  mload obj 79814
end
~
#79813
лоад сабли с гербом~
0 n 100
~
if (%world.curobjs(79815)% < 3) && (%random.100% <= 10)
  mload obj 79815
end
~
#79814
лоад посоха с гербом~
0 n 100
~
if (%world.curobjs(79816)% < 3) && (%random.100% <= 10)
  mload obj 79816
end
~
#79815
лоад лат с гербом~
0 n 100
~
if (%world.curobjs(79818)% < 3) && (%random.100% <= 10)
  mload obj 79818
end
~
#79816
лоад щита с гербом~
0 n 100
~
if (%world.curobjs(79817)% < 3) && (%random.100% <= 10)
  mload obj 79817
end
~
#79817
лоада стафа охраны~
0 n 100
~
if (%world.curobjs(79819)% < 3) && (%random.100% <= 5)
  mload obj 79819
end
if (%world.curobjs(79820)% < 3) && (%random.100% <= 5)
  mload obj 79820
end
if (%world.curobjs(79821)% < 3) && (%random.100% <= 5)
  mload obj 79821
end
if (%world.curobjs(79822)% < 3) && (%random.100% <= 5)
  mload obj 79822
end
~
#79818
лоад рукавиц с гербом~
0 n 100
~
if (%world.curobjs(79823)% < 3) && (%random.100% <= 10)
  mload obj 79823
end
~
#79819
Приветствие Баатура~
0 r 100
~
wait 10
say Здравствуй %actor.name%!
wait 1
switch %actor.class%
  case 0
    say Вы только посмотрите! Разве это лекарь?
  break
  case 1
    say Вы только посмотрите! Разве это колдун?
  break
  case 2
    say Вы только посмотрите! Разве это тать?
  break
  case 3
    say Вы только посмотрите! Разве это богатырь?
  break
  case 4
    say Вы только посмотрите! Разве это наемник?
  break
  case 5
    say Вы только посмотрите! Разве это дружинник?
  break
  case 6
    say Вы только посмотрите! Разве это кудесник?
  break
  case 7
    say Вы только посмотрите! Разве это волшебник?
  break
  case 8
    Вы только посмотрите! Разве это чернокнижник?
  break
  case 9
    say Вы только посмотрите! Разве это витязь?
  break
  case 10
    say Вы только посмотрите! Разве это охотник?
  break
  case 11
    say Вы только посмотрите! Разве это кузнец?
  break
  case 12
    say Вы только посмотрите! Разве это купец?
  break
  case 13
    say Вы только посмотрите! Разве это волхв?
  break
  default
    дум
  break
done
Say За головой моею приперся?
дум
wait 1s
say Храбрец!
wait 1s
if (%world.curmobs(79821)% > 0)
  calcuid helper 79821 mob
  mteleport %helper% %self.realroom%
  mecho _Субеетай-Баатур крикнул "Главу караула ко мне!"
  wait 10
  mecho Глава караула прибежал с востока на зов Субеетай-Баатура.
  wait 1s
  say Ты до сих пор думаешь что сможешь одолеть меня?
  ухм
end
detach 79819 %self.id%
~
#79820
ответ баатуру нет~
0 d 100
нет~
Say Ха-ха! я так и думал!
say Ну теперь у тебя только два варианта.
дум
wait 1s
say Умереть от моей руки или же помочь мне...
wait 10
say Выбирай!
ждат
detach 79820 %self.id%
~
#79821
помощь баатуру~
0 d 100
помогу~
say Значит так!
wait 1s
say Зелье мне нужно!
wait 10
say Заболел я, а присмотреть за мной некому.
say Мое войско только бошки рубить и умеет.
say Толку их просить о таких вещах, один вред да и только.
дум
wait 1s
say Сходи к Бортэ и попроси ее сварить зелье для меня.
wait 5
say Свободен!
mecho _Субеетай-баатур указал Вам пальцем на выход.
detach 79821 %self.id%
~
#79822
Приветствие Бортэ~
0 r 100
~
wait 1
Say Ты только посмотри! Чужак, да еще и целый да невредимый.
say Расслабилась охрана видимо!
wait 5
say Чего тебе?
detach 79822 %self.id%
~
#79823
квест бортэ~
0 d 100
зелье~
say Зелье?
дум
wait 1s
say Для Субеетая чтоле? слыхала я о недуге его, да вот только не знаю я рецепта такого...
say Впрочем ты можешь сходить к Азь-таукэ, взять у него для меня свиток с рецептом.
say Он знает все! да только он не даст тебе ничего просто так!
wait 1s
say Поможет он тебе только в обмен на услугу, а какую именно пойди и сам узнай.
detach 79823 %self.id%
attach 79829 %self.id%
~
#79824
приветствие азь~
0 r 100
~
mecho _Услышав Ваши шаги, Азь-таукэ отвлекся от свитков и сказал:
say Чего тебе надобно?
detach 79824 %self.id%
~
#79825
квест азь~
0 d 100
свиток~
say Свиток?
say Бортэ послала?
say Давно у меня выудить свиток пытается.
say Ну что же, принеси ка ты мне...
дум
wait 2s
say А принеси ка ты мне хвост собачий!
ухм
say Я найду ему применение.
say Cтупай
mecho Азь-Таукэ принялся дальше изучать свитки.
detach 79825 %self.id%
~
#79826
лоад хвоста~
0 f 100
~
eval taildrop %world.curmobs(79822)%
if (%taildrop% < 2)
  mload obj 79824
end
~
#79827
хвост азю~
0 j 100
~
if %object.vnum%==79824
  wait 1
  mpurge %object%
  say Ты погляди! хвост притащил.
  say Я вижу серьезные у тебя намерения.
  say Так и быть!
  say Держи свиток.
  mecho Азь-таукэ достал свиток с торбы.
  mload obj 79825
  дать все %actor.iname%
end
хму
брос все
~
#79828
свиток бортэ~
0 j 100
~
if %object.vnum%==79825
  wait 5
  mecho Бортэ осмотрела свиток и внимательного его изучила.
  mpurge %object%
  wait 1s
  say Да! это именно тот рецепт.
  wait 10
  mecho Бортэ еще раз взглянула на свиток и сказала:
  say Принеси-ка ты мне ногти и зубы солдатские, а еще нужен клок шерсти зверя диковинного.
  say Все остальное я у себя найду!
  wait 1s
  say Если достанеш все составляющие, дай их моей ученице Кукуджу, она очень талантливая, любое сотворить может.
  say Ну все, ступай.
end
~
#79829
Приветствие Касима~
0 qz 100
~
wait 10
mecho Увидев Вас, Касим отложил нож в сторону и спросил:
say Чего тебе чужак?
detach 79829 %self.id%
attach 79830
~
#79830
Квест Касима~
0 dz 100
клок шерсти~
say Ну что же, есть у меня клок шерсти зверя диковинного.
say Вот только назови мне хоть одну причину по которой я должен тебе его дать.
wait 1s
say Видишь! нечего ответить!
wait 1s
say Но я могу пойти тебе на встречу...
wait 10
say Если ты принесешь мне водки!
wait 10
say Свободен.
detach 79830 %self.id%
~
#79831
лоад зубов~
0 f 100
~
eval toothdrop %world.curmobs(79818)%
if (%toothdrop% < 2)
  mload obj 79827
end
~
#79832
лоад ногтей~
0 f 100
~
eval naildrop %world.curmobs(79801)%
if (%naildrop% < 2)
  mload obj 79826
end
~
#79833
лоад водки~
0 f 100
~
mload obj 79829
~
#79834
водка Касиму~
0 j 100
~
if %object.vnum%==79829
  wait 1
  mpurge %object%
  mecho Касим открыл бутыль, налил себе в кружку и выпил одним махом.
  wait 1s
  say Хороша водка!
  wait 1s
  say Ну что же, ты выполнил обещание свои, и я выполню свое.
  say Вот, держи!
  mload obj 79828
  дать клок %actor.iname%
end
~
#79835
итемы Кукуджу~
0 j 100
~
if (%object.vnum% == 79826)
  wait 1
  mpurge %object%
  set nogti798 1
  global nogti798
  mecho Кукуджу стала пристально изучать ногти.
  wait 1s
  say Эти ногти подойдут!
end
if (%object.vnum% == 79827)
  wait 1
  mpurge %object%
  set zybu798 1
  global zybu798
  mecho Кукуджу стала пристально изучать зубы.
  wait 1s
  say Такие зубы сгодятся!
end
if (%object.vnum% == 79828)
  wait 1
  mpurge %object%
  set klok798 1
  global klok798
  mecho Кукуджу стала пристально изучать клок шерсти.
  wait 1s
  say Лучше этой шерсти не найдешь!
end
if ((%nogti798% == 1) && (%zybu798% == 1) && (%klok798% == 1))
  wait 2s
  mecho Кукуджу бросила все ингредиенты в котел и начала варить приговаривая:
  wait 3
  mecho _"Не в море-океане, не в реке, не в озерце, не в пруде, не в протоке, не в омуте,
  mecho _не в болоте стоит кость - незваный гость. Иди стрелой, уйди долой из теплого тела, от моего дела".
  wait 1s
  mecho Варево внутри котла закипело, забурлило, засияло...
  wait 1s
  ул
  say Вот и зелье приготовилось...
  wait 10
  mecho Кукуджу набрала зелья из котла.
  mload obj 79830
  дать зелье %actor.name%
end
~
#79836
Зелье Баатуру~
0 j 100
~
if (%object.vnum% != 79830)
  %send% %actor% Ему это не нужно!
  return 0
  halt
end
wait 2
mpurge %object%
mecho %self.iname% принялся осушать сосуд с зельем.
wait 1s
сия
say Как рукой сняло!
wait 1s
say Заслужил%actor.g% ты похвалу! Получай!
if (%actor.quested(79836)%)
  eval %actor.gold(+5000)%
  %send%       %actor% %self.iname% протянул Вам пухлую калиту.
  %echoaround% %actor% %self.iname% протянул %actor.dname% пухлую калиту.
else
  eval temp %actor.setquest(79836 Субеетай)%
  switch %actor.class%
    case 0
      *=====лекарь=====*
      %load% obj 532
      %echo% %self.iname% достал из под кресла книгу.
    break
    case 1
      *=====колдун=====*
      %load% obj 571
      %echo% %self.iname% достал что-то из под кресла.
    break
    case 2
      *======тать======*
      %send%       %actor% %self.iname% научил Вас колоть еще коварнее.
      %echoaround% %actor% %self.iname% научил %actor.vname% колоть еще коварнее.
      mskillturn %actor% заколоть set
      mskilladd %actor% заколоть 10
    break
    case 3
      *=====батыр!=====*
      %send%       %actor% %self.iname% показал Вам как правильнее размахиваться для удара.
      %echoaround% %actor% %self.iname% показал %actor.dname% как правильнее размахиваться для удара.
      mskillturn %actor% богатырский.молот set
      mskilladd %actor% богатырский.молот 10
    break
    case 4
      *======наем======*
      %send%       %actor% %self.iname% научил Вас колоть еще коварнее.
      %echoaround% %actor% %self.iname% научил %actor.vname% колоть еще коварнее.
      mskillturn %actor% заколоть set
      mskilladd %actor% заколоть 10
    break
    case 5
      *======друж======*
      %send%       %actor% %self.iname% показал брешь в Вашей защите.
      %echoaround% %actor% %self.iname% показал %actor.dname% брешь в %actor.s% защите.
      mskillturn %actor% осторожный.стиль set
      mskilladd %actor% осторожный.стиль 10
    break
    case 6
      *=====кудес!=====*
      %load% obj 587
      %echo% %self.iname% достал из под кресла книгу.
    break
    case 7
      *======волш======*
      %load% obj 578
      %echo% %self.iname% достал из под кресла книгу.
    break
    case 8
      *=====чернок=====*
      %load% obj 534
      %echo% %self.iname% достал из под кресла книгу.
    break
    case 9
      *=====витязь=====*
      %load% obj 566
      %echo% %self.iname% достал из под кресла книгу.
    break
    case 10
      *======охот======*
      %send%       %actor% %self.iname% подсказал Вам как быстрее выхватывать стрелы.
      %echoaround% %actor% %self.iname% подсказал %actor.dname% как быстрее выхватывать стрелы.
      mskillturn %actor% дополнительный.выстрел set
      mskilladd %actor% дополнительный.выстрел 10
    break
    case 11
      *======кузя======*
      %send%       %actor% %self.iname% показал Вам как правильнее размахиваться для удара.
      %echoaround% %actor% %self.iname% показал %actor.dname% как правильнее размахиваться для удара.
      mskillturn %actor% оглушить set
      mskilladd %actor% оглушить 10
    break
    case 12
      *======купа======*
      if !%actor.skill(осторожный стиль)%
        %send% %actor% %self.iname% тайком протянул Вам мешочек с кунами.
        миг .%actor.name%
        eval %actor.gold(+5000)%
      else
        %send%       %actor% %self.iname% показал брешь в Вашей защите.
        %echoaround% %actor% %self.iname% показал %actor.dname% брешь в %actor.s% защите.
        mskillturn %actor% осторожный.стиль set
        mskilladd %actor% осторожный.стиль 10
      end
    break
    case 13
      *=====волхв!=====*
      %send%       %actor% %self.iname% подсказал Вам на что следует обращать внимание при опознании.
      %echoaround% %actor% %self.iname% показал %actor.dname% на что следует обращать внимание при опознании.
      mskillturn %actor% опознание set
      mskilladd %actor% опознание 20
    break
    default
    break
  done
end
give all .%actor.name%
drop all
wait 1s
say Теперь и в городище можно наведаться!
кричать Войско! Приготовиться к наступлению!
wait 1s
%send%       %actor% %self.iname% оглядел Вас с головы до пят.
%echoaround% %actor% %self.iname% посмотрел на %actor.vname%.
wait 10
дум
wait 10
say А ты чего встал%actor.g%? Вали отсюда, пока цел%actor.g%!
if (%world.curmobs(79821)% > 0)
  wait 1s
  mecho Субеетай-Баатур посмотрел в сторону Главы караула.
  wait 10
  say Свободен!
  wait 10
  mecho Глава караула ушел на восток.
  calcuid helper 79821 mob
  mteleport %helper% 79848
end
~
#79837
самон воителя~
0 k 100
~
if ((%world.curmobs(79824)% == 0) || (%random.100% > 20))
  detach 79837 %self.id%
  halt
end
calcuid warrior 79824 mob
if (!%warrior.fighting%)
  shout Ко мне! На помощь! 
  mteleport %warrior% %self.realroom%
end
detach 79837 %self.id%
~
#79838
агрфлаг баатура~
0 r 100
~
set moblist 79800 79802 79803 79805 79806 79807 79808 79809 79810 79811 79812 79813 79814 79815 79816 79817 79823 79825 79826 79828 79829 79830 79831 79832 79833 79834 79835 79836 79837 79838 79839
set num 0
foreach mobnum %moblist%
  eval num %num%+%world.curmobs(%mobnum%)%
done
if (%num% > 0 )
  хму
  %self.action(+!сражается)%
  halt
end
if (%num% < 1 )
  %self.action(-!сражается)%
  say А куда делось мое войско?
  дум
  say Я ведь остался совсем без войска...
  wait 1s
  say Всеравно! Я тебе не по силам!
end
~
#79839
лоад кола~
2 z 100
~
wecho Вы отрубили голову мертвого монгола и нанизали ее на кол.
wecho Теперь она будет свидетельствовать о серьезности Ваших намерений.
wload obj 79832
detach 79840 %self.id%
~
#79840
смерть монгола~
0 f 100
~
calcuid droom %self.realroom% room
attach 79839 %droom.id%
exec 79839 %droom.id%
~
#79841
речь Шигая~
0 r 100
~
wait 5
mecho Шигай взглянул на Вас своим безумным взглядом, и продолжил шептать что-то неразборчивое.
wait 10
mecho Вы прислушались к шепоту и начали понимать некоторые слова:
wait 1
mecho ...украли, украли, они украли, точно они!
mecho ...братья, точно они, украли!
detach 79841 %self.id%
~
#79842
награда Шигая~
0 j 100
~
if %object.vnum%==79833
  wait 1
  mpurge %object%
  wait 1s
  mecho Шигай взглянул на кинжал.
  wait 2s
  mecho Разум Шигая посветлел и он сказал:
  wait 10
  say Я уже думал никогда кинжал не верну и не смогу прийти в себя.
  switch %random.2%
    case 1
      mload obj 79834
      case 2
        mload obj 813
        say Спасибо Вам.
        дать все %actor.name%
      done
      detach 79842 %self.id%
    end
~
#79843
макс кинжалов~
1 n 100
~
if (%world.curobjs(79834)% > %world.maxobj(79834)%)
  opurge %self%
end
~
#79844
дамаг стрел толуя~
0 k 100
~
if %world.curmobs(79813)% == 1
  if %random.10% < 3
    set victim %random.pc%
    if %victim%
      mdamage %victim% 80
      mechoaround %victim% Острая стрела вонзилась в спину %victim.vname%.
      msend %victim% Острая стрела вонзилась в Вашу спину.
      mecho Это меткий стрелок Толуй из своего шалаша сделал выстрел.
    end
  end
end
~
#79845
Приветствие жоши~
0 r 100
~
wait 1s
г Здравствуй!
г Хочешь подзаработать?
detach 79845 %self.id%
~
#79846
Квест жоши~
0 d 100
хочу~
wait 1s
г Спор у меня был с Кюльханом,
г говорит что я его не смогу победить нашего Джэлмэ.
wait 1s
г И правда, не смог.
взд
wait 1s
г А вот ты пойди и убей его, вместо меня!
г В свою очередь я, тебе награду дам.
~
#79847
Триг Джэлмэ~
0 r 100
~
wait 10
г Как сражаться будем?
wait 5
г Силой или магией?
~
#79848
атака джэлмэ~
0 d 1
силой магией~
*перенес агр сюда из 79849 чтобы работало %actor% (купала)
switch %speech%
  case силой
    set vnum 79842
  break
  case магией
    set vnum 79841
  break
done
%load% mob %vnum%
wait 1
calcuid jelme %vnum% mob
%force% %jelme% mkill %actor%
%purge% %self.id%
~
#79849
агр джэлмэ~
0 n 100
~
г Умри!
*mkill %actor% - перенес в 79848, т.к. тут нет %actor%-а (купала)
~
#79850
смерть джэлмэ~
0 f 100
~
calcuid droom %self.realroom% room
attach 79839 %droom.id%
exec 79839 %droom.id%
if (%exist.mob(79832)%)
  calcuid zhoshi 79832 mob
  attach 79851 %zhoshi.id%
end
~
#79851
награда Жоши~
0 r 100
~
wait 1s
г Спасибо тебе!
if (%world.curobjs(79835)% < %world.maxobj(79835)%)
  mload obj 79835
  wait 1
  дать все .%actor.name%
end
wait 1s
г Удачи! И прощай!
detach 79851 %self.id%
~
$~
