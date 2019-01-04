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
if !(%object.vnum% == 65400)
say Да ты, что?! Издеваешься!?
emot грозно нахмурился
drop %object.name%
halt
end
wait 1
say О, вот это - да! Вот так выручил!
say Что ж, грех в долгу оставаться. 
mechoaround %actor% _Возчик стал усиленно благодарить %actor.rname%.
if (%actor.level% > 23) && (%actor.level% < 27)                         
msend %actor% _Возчик, так горячо стал Вас благодарить, что это добавило Вам 5000 очков опыта.
%actor.exp(+5000)%
else
msend %actor% Возчик стал Вас горячо благодарить, да только "спасибом" сыт не будешь! 
mload obj 65301
дать хлыст %actor.name%
end
mecho Возчик тот час принялся ремонтировать свою телегу.
mpurge %object.iname%     
mload mob 65302
mpurge %self%
~
$~
