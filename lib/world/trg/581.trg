#58101
эмо~
1 gijl 100
~
wait 1
if !%actor.anem% || %actor.vnum% != -1
  halt
end
oforce %actor% плак
~
#58102
зеркало~
1 c 1
блеснуть~
wait 1
if %arg%
  oecho &cБольшое пребольшое зеркало&n блеснуло в лучах солнца, %arg%.
else
  oecho &cБольшое пребольшое зеркало&n блеснуло в лучах солнца.
end
~
#58103
дебаг-моб триг~
0 c 100
дгтест~
wait 1
if !%actor.name% || %actor.iname% != Переплут && %actor.iname% != Херуба
  %echo% You're restricted to use me!
  halt
else
end
~
#58104
биться стена~
1 c 4
биться~
wait 1
%actor.wait(15s)%
osend %actor% Прицелившись, и разогнавшись Вы побежали к стене!
oechoaround %actor% Прицелившись, и разогнавшись %actor.name% побежал%actor.q% к стене!
wait 1s
osend %actor% &YИскры возникли в глазах. &RВы начинаете терять связь с этим миром!&n
oechoaround %actor% При столкновении %actor.rname% со стеной посыпались &Yискры&n, наверное &Rэто было действительно БОЛЬНО&n.
wait 1s
osend %actor% Вы без сознания и медленно умираете.
oechoaround %actor% %actor.name% без сознания и медленно умирает.
wait 3s
osend %actor% Вы без сознания и медленно умираете.
oechoaround %actor% %actor.name% без сознания и медленно умирает.
wait 10s
osend %actor% А, это Вам всего лишь показалось?
~
$~
