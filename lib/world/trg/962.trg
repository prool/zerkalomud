#96201
Жар-Птица тригдамажит~
0 b 100
~
mecho &RИсходящая от Жар-Птицы волна жара опалила Вас!&n
foreach victim %self.char%
  mdamage %victim% 100 
done
~
#96202
Медная птица метает~
0 k 100
~
if !%self.haveobj(96200)%
  %load% obj 96200
  воор перо
end
~
#96203
Гарцук-птица машет крыльями~
0 k 20
~
set char %random.pc%
msend %char% Взмахом своего крыла гарцук-птица породила волну, которая сбила Вас с ног!
%char.position(6)%
%char.wait(6)%
mechoaround %char% Взмахом своего крыла гарцук-птица породила волну, которая сбила %char.rname% с ног!
~
#96204
Гарцук трансформится в птицу~
0 k 100
~
if %self.hitp% < 3000
  %echo% Разъяренно крикнув, гарцуц обратился в птицу.
  mtransform 96205
  detach 96204 %self.id%
end
~
#96205
Смерть Жар-птицы~
0 f 100
~
%load% obj 96201
if (%random.100% <= 30) && (%world.curobjs(96207)% < %world.maxobj(96207)%)
  mload obj 96207
end
if (%random.100% <= 30) && (%world.curobjs(96208)% < %world.maxobj(96208)%)
  mload obj 96208
end
~
#96206
Медная птица агрит ватку~
0 q 100
~
wait 1
if !%self.haveobj(96200)%
  %load% obj 96200
  воор перо
end
if (%actor.class% == 0) || (%actor.class% == 1) || (%actor.class% == 6) || (%actor.class% == 7) || (%actor.class% == 13)
  mkill .%actor.name%
end
~
#96207
Смерть златых~
0 f 100
~
if (%random.100% <= 10) && (%world.curobjs(96202)% < %world.maxobj(96202)%)
  mload obj 96202
end
~
#96208
Смерть сребряных~
0 f 1000
~
if (%random.100% <= 10) && (%world.curobjs(96203)% < %world.maxobj(96203)%)
  mload obj 96203
end
~
#96209
Смерть Карса~
0 f 100
~
if (%random.100% <= 30) && (%world.curobjs(96205)% < %world.maxobj(96205)%)
  mload obj 96205
end
~
#96210
Трансформ когтя в кинжал~
1 c 2
прикрепить~
if (%arg.words(1)% == шкура && %arg.words(2)% == коготь)
  if (%actor.haveobj(96206)% )
    foreach obj %actor.objs%
      if (%obj.vnum% == 96206)
        %purge% %obj.id%
      break
    end
  done
  if  (%world.curobjs(96204)% < %world.maxobj(96204)%)
    otransform 96204
    %send% %actor.name% Вы обмотали и хорошенько закрепили шкуру Аспида к когтю Карса.
    %send% %actor.name% Вот теперь это гораздо более удобное оружие!
    detach 96210 %self%
  else
    %send% %actor.name% Вы старались-старались, но ничего толкового из этого у вас не вышло.
  end
else
  %send% %actor.name%  Мне кажется, чего-то вам все-таки не хватает.
end
else
%send% %actor.name% Прикрепить ЧТО и К ЧЕМУ?
end
~
#96211
Смерть Аспида~
0 f 100
~
if (%random.100% <= 30) && (%world.curobjs(96206)% < %world.maxobj(96206)%)
  mload obj 96206
end
~
#96212
Фаером в Жар-Птицу~
0 w 100
~
if %castnum% == 26
  %self.hitp(%self.maxhitp%)%
  %echo% Огненный шар полетевший в Жар-Птицу кажется прибавил ей жизненных сил!
end
~
#96213
златые птицы трансформятся~
0 k 100
~
wait 2s
if %self.vnum% == 96207
  mtransform 96209
else
  mtransform 96207
end
~
$~
