#7100
у старого разбойничка~
0 q 100
~
say  А ты хто такоф будешь? 
say А ну плати мине 5 кун, а не то никуды не пущу!
emot гнусно ощерился глядя на Вас
wait 1
~
#7102
дали 5 кун разбойничку~
0 m 1
~
if (%amount% < 5)
  say Сказано же, ПЯТЬ кун надоть!
  say Забери обратно, мне чужого не надобно.
  хих
  дать %amount% кун %actor.name%
  halt
end
say Ну ладно, проходи, что ли...
run 7103 %self.id%
~
#7103
задремал разбойничек ~
0 b 5
~
вздох
mecho _Старый разбойничек начал клевать носом.
спать
%self.wait(70)%
wait 7s
просн
встать
~
#7104
входим к медвежонку~
0 q 40
~
msend %actor% _Медвежонок заметил Вас и решил с вами поиграть.
mechoaround %actor% _Медвежонок заметил %actor.vname% и решил с ним поиграть.
mkill %actor%
~
#7105
входим к охотнику~
0 q 70
~
say А ты почто тут ходишь? 
say Всю дичь мне распугал, базыка непутевый!
рыч
~
#7106
у кукушки~
0 b 4
~
крича ку-ку
wait 2
крича ку-ку
~
#7107
триггер коробейника (идем по дороге)~
0 n 100
~
wait 9s
ю
wait 10s
в 
wait 9s
в 
wait 6s
ю
wait 11s
ю
wait 6s
з
wait 12s
ю
wait 8s
з
wait 7s
з
wait 14s
з
wait 9s
с
wait 7s
с
wait 12s
з
wait 6s
з
wait 8s
ю
wait 12s
ю
wait 6s
ю
wait 8s
ю
wait 11s
в
wait 8s
в
wait 9s
ю
wait 10s
ю
wait 6s
в
wait 9s
в
wait 11s
ю
wait 8s
ю
wait 5s
з
wait 6s
запад
attach 7109 %self.id%
detach 7107 %self.id%
~
#7108
напали на коробейника~
0 l 100
~
крича Караул! Убивают!!!
attach 7109 %self.id%
detach 7107 %self.id%
detach 7108 %self.id%
~
#7109
коробейник бродит по лесу~
0 b 100
~
eval direction %random.4%
if (%direction% == 1)
  north
elseif (%direction% == 2)
  east
elseif (%direction% == 3)
  south
elseif (%direction% == 4)
  west
end
~
$~
