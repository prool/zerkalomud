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
2 c 0
биться~
wait 1
%actor.wait(8s)%
wsend %actor% Прицелившись, и разогнавшись Вы побежали к стене!
wechoaround %actor% Прицелившись, и разогнавшись %actor.name% побежал%actor.q% к стене!
wait 1s
wsend %actor% &YИскры возникли в глазах&n. &RВы начинаете терять связь с этим миром!&n
wechoaround %actor% При столкновении %actor.rname% со стеной посыпались &Yискры&n, наверное &Rэто было действительно БОЛЬНО&n.
wait 1s
wsend %actor% Вы без сознания и медленно умираете.
wechoaround %actor% %actor.name% без сознания и медленно умирает.
wait 3s
wsend %actor% Вы без сознания и медленно умираете.
wechoaround %actor% %actor.name% без сознания и медленно умирает.
wait 3s
wsend %actor% А, это Вам всего лишь показалось?
~
$~
