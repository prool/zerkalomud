#6500
дать20старому~
0 m 1
~
if %actor.vnum% != -1
 halt
end
eval needgold %actor.level%
if %amount% < %needgold%
дать %amount% кун %actor.name%
tell %actor.name% Мало, договор превыше всего!
else
mecho Следопыт коротко крякнул как утка.
msend %actor.name% Из-за кустов вылез еще один следопыт и махнул рукой чтобы следовали за ним.
 if %actor.sex%==1
mechoaround %actor% Из-за кустов вылез еще один следопыт и махнул рукой для %actor.name% чтобы следовал за ним.
mechoaround %actor% %actor.name% исчез в кустах вместе с проводником.
 else
mechoaround %actor% Из-за кустов вылез еще один следопыт и махнул рукой для %actor.name% чтобы следовала за ним.
mechoaround %actor% %actor.name% исчезла в кустах вместе с проводником.
 endif
mteleport %actor.name% 6500 horse
msend %actor% Ваше путешествие окончилось.
* if %actor.sex%==1
*  mat 6500 mechoaround %actor% %actor.name% появился с проводником.
* else
*  mat 6500 mechoaround %actor% %actor.name% появилась с проводником.
* end
*  mat 6500 mecho Проводник скрылся под навесом.
*end
end
~
#6501
дать20молодому~
0 m 1
~
if %actor.vnum% != -1
halt
end
eval needgold %actor.level%
if %amount% < %needgold%
дать %amount% кун %actor.name%
tell %actor.name% Нехорошо обманывать!
плюн
else
mecho Следопыт быстро заглянул под навес, кому-то что-то сказал на неизвестном языке.
msend %actor%  Из под навеса вышел совсем молодой следопыт, почти мальчишка и повел Вас за собой.
mechoaround %actor% Из под навеса вышел совсем молодой следопыт, почти мальчишка и повел %actor.name% за собой.
mechoaround %actor% %actor.name% уш%actor.y% вместе с проводником.
mteleport %actor% 6501 horse
msend %actor% Ваше путешествие окончилось.
mechoaround %actor% %actor.name% появил%actor.u% с проводником.
end
~
#6502
встречамолодой~
0 r 100
~
tell %actor.name% Если хочешь выбраться отсюда, могу помочь!
tell %actor.name% Знаю о таких дорогах, что пройдем, никто и не заметит!
tell %actor.name% Выведу к одной из деревень далеко на севере, у реки!
eval needgold %actor.level%
tell %actor.name% Всего за %needgold% кун!
~
#6503
встречастарый~
0 r 100
~
tell %actor.name% Могу провести неизвестными никому дорогами до степной деревни!
eval needgold %actor.level%
tell %actor.name% Всего за %needgold% кун!
~
$~
