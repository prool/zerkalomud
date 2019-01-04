#60400
приветствие гусляра~
0 r 100
~
эмоц задумчиво посмотрел на Днепр и стал перебирать струны
улыб
say Здраве буде, %actor.name%
wait 2
~
#60401
стрела из засады~
2 e 80
~
wait 1
eval dmg 100+%random.100%
set target %random.pc% 
wechoaround %target% Белооперенная стрела вонзилась в грудь %target.rname%.
wsend %target% Белооперенная стрела вонзилась в вашу грудь.
wdamage %target% %dmg%
wait 30s
halt
~
$~
