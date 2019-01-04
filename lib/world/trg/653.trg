#65300
возчикжалуется~
0 r 100
~
wait 1
груст
wait 1
say Здраве тебе, %actor.name%
say Вот досада у меня приключилась! Колесо в телеге сломалось.
руг  
end   
detach 65300 %self.id%
~
#65301
дали колесо возчику~
0 j 100
~
wait 1
if ( %object.vnum% != 65400 )
  say Да ты, что?! Издеваешься!?
  emot грозно нахмурился
  drop %object.name%
  halt
end
wait 1
mpurge %object%
wait 2s
say О, вот это - да! Вот так выручил!
say Что ж, грех в долгу оставаться. 
mechoaround %actor%  Возчик стал усиленно благодарить %actor.rname%.
if (%actor.level% > 23) & (%actor.level% < 27)                         
  msend %actor%  Возчик так горячо стал Вас благодарить, что это добавило Вам 5000 очков опыта.
  %actor.exp(+5000)%
else
  msend %actor% Возчик стал Вас горячо благодарить, да только "спасибом" сыт не будешь! 
  if %world.curobjs(65301)% < 12
    mload obj 65301
    дать хлыст %actor.name%
  end
end
wait 1
if %world.curobjs(3372)% < 1 & %random.10000% < 50
  mload obj 3372
  say Ой, это ж запасное колесо от моей телеги!
  say А я думал что его цыгане сперли...
  wait 10
  say Раз уж ты его у самих цыган увел, то вот...
  wait 10
  say Какой то расфуфыреный купец обронил на дороге, знатная вещица...
  дать все %actor.name%
end
mecho Возчик принялся ремонтировать свою телегу.
mload mob 65302
wait 1
mpurge %self%
~
$~
