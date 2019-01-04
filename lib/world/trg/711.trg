#71100
АгрНДиДНЗ~
0 q 100
~
if (%actor.clan%==днз)
заколоть .%actor.name%
say УМРИ! УМРИ! УМРИ! Смерть тебе Наследник нечистывых знаний!
endif
if (%actor.clan%==нд)
заколоть .%actor.name%
say УМРИ! УМРИ! УМРИ! Смерть тебе Наемная тварь!
endif
~
#71101
автозагрузка-целого-указателя~
2 f 0
~
wload obj 71101
//дорожный указатель.
~
#71102
ломание-указателя~
2 c 0
сломать ломать разломать~
wait 1
if !%arg.contains(указатель)%
wsend %actor% Чего ломаем?
halt
end
eval fullstr %actor.str%+%actor.stradd%
if %fullstr% < 24
wsend %actor% Вам не хватит силенок сломать это мощное сооружение
halt
end
detach 71101 %self.id%
wait 1
wpurge arrow711
wsend %actor% Вы схватили указатель и начали упорно его корежить, пока тот с хрустом не обломился.
wechoaround %actor% %actor.name% ухватил%actor.g% указатель и резко дернув, сломал%actor.g% его.
eval fulldex %actor.dex%+%actor.dexadd%
if %fulldex% < 20
wsend %actor% ...но вы не успели увернуться и он рухнул прямо на вас!
wechoaround %actor% ...но вывернуться из-под падающего указателя %actor.name% не сумел%actor.g%.
wdamage %actor% 150
end
wload obj 71102
detach 71102 %self.id%
~
$~
