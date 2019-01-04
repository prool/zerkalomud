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
*set actor %random.pc% 
wechoaround %actor% Белооперенная стрела вонзилась в грудь %actor.rname%.
wsend %actor% Белооперенная стрела вонзилась в вашу грудь.
wdamage %actor% %dmg%
wait 2s
halt
~
$~
