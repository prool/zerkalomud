#8000
Старикашка ворчит~
0 q 100
~
wait 1
if (%actor.level% > 5)
  halt
end
: кряхтя распрямился и посмотрел на вас
say Эй, как тебя там!
взд
say Крыс тут развелось немеряно, вот ведь пакость...
mecho _- Надо бы переловить, да норы заткнуть
mecho _- Коли поймаешь тварь, пришиби и хвост мне тащи - отблагодарю как смогу.
взд
wait 1
say Спину ломит - первое средство - настой на крысиных хвостах!
~
#8001
Крыса рип~
0 f 100
~
if %actor.vnum% != -1 
  set killer %actor.leader%
  if %killer.vnum% != -1
    halt
  end
end
mload obj 8004
~
#8002
Старикашка скупает крысхвосты~
0 j 100
~
wait 1
if %object.vnum% != 8004
  ворч
  плюв
  drop %object.name%
  halt
end
wait 1
mpurge %object%
eval gold %random.3%+1
if (%actor.level% <= 5)
  say О! Вот услужил%actor.a%!
  mecho _- Вот, прими за беспокойство.
else
  say Вроде и не дитятко уже, а все за крысами бегаешь...
  взд
  wait 1s
  say Ладно уж, держи.
end
give %gold% кун .%actor.name%
%self.gold(+%gold%)%
~
#8003
Доска на чердаке~
2 c 1
дернуть потянуть тянуть дергать оторвать~
wait 1
if !%arg.contains(доск)%
  wsend %actor% Тянем-потянем, вытянуть не можем...
  wsend %actor% Да оно и немудрено, коли сами не знаем чего тянем.
  halt
end
wsend %actor% Вы с силой потянули доску на себя и она отошла от стены.
wechoaround %actor% ~~%actor.name% с силой потянул%actor.a% на себя одну из досок.
wait 2
attach 8009 %self.id%
if ((%actor.level% > 5) || (%random.1000% <= 500))
  wsend %actor% Доска вырвалась из ваших рук и едва не прищемила вам пальцы!
  detach 8003 %self.id%
  halt
end
wecho Небольшой кожаный мешочек выскользнул из-за доски и, звякнув, упал на пол.
wload obj 8005
if %random.1000% <= 200
  %echo% В придачу к мешочку, на пол выпала какая-то книжка!
  %load% obj 1730
end
detach 8003 %self.id%
~
#8004
Репоп зоны "Беличья падь"~
2 f 100
~
calcuid cherdak 8084 room
attach 8003 %cherdak.id%
detach 8009 %cherdak.id%
~
#8005
Котяра агрит крыс~
0 s 80
~
wait 1
foreach victim %self.npc%
  if %victim.vnum% == 8000
    mkill %victim%
    halt
  end
done
~
#8006
Котяра агрит крыс - 2~
0 g 80
~
wait 1
if %actor.vnum% == 8000
  kill %actor.name%
end
~
#8007
Стражник встертил агрессора~
0 q 80
~
wait 1
if %actor.clan% != null
  halt
end
if !%actor.agressor%
  halt
end
if ((%actor.agressor% > 7000) && (%actor.agressor% < 9999))
  set agr 1
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
#8008
Стражник вошел к агрессору~
0 t 80
~
wait 1
if %actor.clan% != null
  halt
end
foreach char %self.pc%
  if ((%actor.agressor% > 7000) && (%actor.agressor% < 9999))
    set target %char%
  break
end
done
if !%target%
  halt
end
if %actor.sex% == 1
  крича %target.name%, - вот он, убивец, хватай его! Вяжи его!
else
  крича %target.name%, мерзавка, хватай ее! Вяжи ее!
end
Крича %target.name% - вот он%target.g% где, хватай, ребяты!
появ
mforce %target.name% трепет
mkill %target% 
~
#8009
Фейл доски~
2 c 1
дернуть потянуть тянуть дергать оторвать~
wait 1
if !%arg.contains(доск)%
  wsend %actor% Тянем-потянем, вытянуть не можем...
  wsend %actor% Да оно и немудрено, коли сами не знаем чего тянем.
  halt
end
wsend %actor% Доску плотно зажало бревно, и вы не смогли ее пошевелить.
wsend %actor% Видать каши мало ели...
~
#8010
Муха заходит к пауку~
0 hi 100
~
wait 1s 
if (%actor.vnum% == 8042)
  %echo% По собственной неосторожности муха попалась в паутину. Бедняжка!
  dg_cast 'оцепенен' муха
endif
~
#8011
Крысы пищат~
0 b 15
~
пищать
~
$~
