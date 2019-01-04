#70200
к старцу1~
0 r 100
*~
wait 5
say здраве путник!
~
#70201
г здраве~
0 d 1
здраве здравствуй~
wait 5
say Ты, видать, не здешний. 
wait 5
say Славены то все знают, что эти места были прокляты, и никто сюда не ходит. 
say Из деревни, что за курганом, еще никто не вернулся. 
wait 5
say Не страшно?
attach 70202 %self.id%
attach 70203 %self.id%
detach 70200 %self.id%
detach 70201 %self.id%
~
#70202
невзяли квест у старца~
0 r 100
*~
wait 5
вопр %actor.name%
~
#70203
г нет~
0 d 100
нет~
wait 5
say Тогда, может быть, ты поможешь нам избавиться от проклятья?
attach 70204 %self.id%
detach 70203 %self.id%
~
#70204
г помогу~
0 d 1
помогу хорошо~
wait 5
say Ну что ж, ты всегда можешь рассчитывать на мою помощь, но я в этих краях не так давно, 
say и мало что знаю о проклятии. 
wait 5
say Ступай на хутор, что западнее кургана, да порасспроси его хозяина. 
wait 5
say Авось чего путного да подскажет.
calcuid hutor 70217 mob
attach 70205 %hutor.id%
detach 70202 %self.id%
detach 70204 %self.id%
~
#70205
к хуторянину~
0 r 100
*~
wait 5
mecho Вы поприветствовали старика и сказали, что хотите помочь этому краю избавиться от проклятия. 
wait 5
mecho Хуторянин понимающе покивал, пригласил Вас к столу и поведал обо всем, что знал про ту битву.
wait 5
mecho Из беседы Вы уловили главное: пока дух жреца норманнов, похороненный в кургане, не 
mecho обретет вечного успокоения, с проклятием ничего не поделаешь. 
wait 10
mecho Но как убить то, что и так является мертвым? 
wait 5
mecho Надо бы зайти к лесному старцу за советом.
calcuid star 70207 mob
attach 70206 %star.id%
mdoor  70208 north room 70209
detach 70205 %self.id%
~
#70206
к старцу опять~
0 r 100
*~
wait 5
mecho Вы пересказали старику беседу с хуторянином. 
wait 5
Дум
wait 10
say И вправду не так то легко будет с духом жреца справиться. Но есть один способ. 
wait 5
say Коли ты окропишь свой меч кровью зверя лютого, даже духи содрогнутся в ужасе, и 
say сможешь ты жреца одарить вечным покоем. А там уже и с тварями в деревне наверняка 
say совладаешь, ежели лишаться они своего вызывателя.
wait 15
say Да вот еще задачка: коли в курган так попасть вздумаешь, ополчаться на тебя 
say погибшие на поле брани войны и словен и норманнов. 
say Дабы предупредить погибших сородичей, что ты покой умерших не корысти ради, а блага для 
say нарушаешь, разведи дымный костер из еловых иголок, осыпавшихся от звона мечей той 
say битвы, на самой вершине кургана. 
wait 5
Эм задумался
wait 5
say Только где ж найти зверя этого, да иголки нужные?
wait 10
Эм задумался
wait 15
say Вот что. Слыхал я, что хуторской мельник ранее охотником знатным был, и мало что от 
say него лес утаил. Наверняка чем-нибудь да поможет. Сходи к нему.
calcuid meln 70219 mob
attach 70207 %meln.id%
calcuid room07 70207 room
attach 70212 %room07.id%
detach 70206 %self.id%
~
#70207
у мельника~
0 r 100
*~
wait 5
mecho Выслушав Ваш рассказ, бывший охотник посоветовал сходить в западную часть леса.
wait 5
mecho По его словам там есть огромный муравейник, сложенный из лестных веток и иголок. 
mecho Наверняка там есть и те самые, осыпавшиеся при битве между словенами и норманнами.
wait 15
mecho А зверья в округе и так хватает. Да только вряд ли среди них можно найти подходящего. 
wait 5
mecho Но есть в лесу холм, у подножия которого вырыта яма. 
mecho Иногда оттуда раздаются душераздирающие завывания. 
wait 5
mecho Может быть, там найдется подходящий кандидат на роль страшно злобного монстра?
calcuid mura 70248 room
calcuid podz 70249 room
attach 70208 %mura.id%
attach 70209 %podz.id%
detach 70207 %self.id%
~
#70208
муравейник~
2 c 1
обобрать ~
wait 1
if !(%arg.contains(муравейник)%) 
  wsend %actor% И что Вы хотите обобрать?
  return 1
  halt
else
  wait 1
  wsend %actor% Вы разрушили муравейник, но нашли что искали.
  wechoaround %actor% %actor.name% разрушил%actor.g% весь муравейник, но наш%actor.y% что искал%actor.g%.  
  calcuid mur 70216 obj 
  wpurge %mur%
  wload mob 70220
  wload mob 70220
  wload mob 70220
  wload obj 70217
  wload obj 70218
  detach 70208 %self.id%
end
~
#70209
в окопы~
2 c 1
пробраться пролезть~
wait 1
if !(%arg.contains(нора)%) 
  wsend %actor% И куда Вы хотите пролезть?
  return 1
  halt
else
  wsend %actor% Вы пролезли в узкий лаз.
  wechoaround %actor% %actor.name% протиснул%actor.u% в узкий лаз.
  wteleport %actor.name% 70250
end
~
#70210
бросаем иголки~
2 h 100
*~
wait 1
if ((%object.vnum% == 70218) || (%object.vnum% == 70219))
  wait 5
  calcuid ig 70218 obj
  wpurge %ig%
  wload obj 70219
  attach 70211 %self.id%
end
~
#70211
расжигаем кастрик~
2 c 1
разжечь развести~
if !(%arg.contains(костер)%) 
  wsend %actor% Что Вы хотите распалить?
  return 1
  halt
else
  wait 1
  wsend %actor% Вы распалили яркий костер.
  wechoaround %actor% %actor.name% распалил%actor.g% костер.
  calcuid ig 70219 obj
  wpurge %ig%
  wload obj 70213
  detach 70212 %self.id%
  attach 70213 %self.id%
end
detach 70211 %self.id%
~
#70212
расширяем лаз1~
2 c 100
расширить~
if !(%arg.contains(нору)%) 
  wsend %actor% Что Вы хотите расширить?
  return 1
  halt
else
  wait 1
  wsend %actor% Вы расширили нору, и теперь в нее можно пролезть.
  wechoaround %actor.name% %actor.name% расширил нору, и теперь в нее можно пролезть.
  mecho Духи, покой которых Вы нарушили, не отпустят Вас просто так.
  wload mob 70209
  wload mob 70209
  wload mob 70209
  wload mob 70209
  wload mob 70210
  wload mob 70210
  wload mob 70210
  wdoor  70207 down room 70255
  detach 70212 %self.id%
end
~
#70213
расширяем лаз2~
2 c 100
расширить~
if !(%arg.contains(нору)%) 
  wsend %actor% Что Вы хотите расширить?
  return 1
  halt
else
  wait 1
  wsend %actor% Вы расширили нору, и теперь в нее можно пролезть.
  wechoaround %actor.name% %actor.name% расширил нору, и теперь в нее можно пролезть.
  wecho Духи, покой которых Вы нарушили, не отпустят Вас просто так.
  wload mob 70210
  wload mob 70210
  wload mob 70210
  wdoor  70207 down room 70255
  detach 70212 %self.id%
end
~
#70214
животина здохла~
0 f 100
*~
calcuid room57 70257 room
exec 70216 %room57.id%
if (%world.curobjs(70215)% < 3) && (%random.1000% <= 150)
  mload obj 70215
end
if (%world.curobjs(70234)% < 3) && (%random.1000% <= 150)
  mload obj 70234
end
~
#70215
ребут~
2 f 100
*~
wdoor 70207 down purge
wdoor 70208 north purge
~
#70216
заменяем духов~
2 z 100
*~
wait 1
calcuid jr 70211 mob
wpurge %jr%
wload mob 70221
~
#70217
жрец здох~
0 f 100
*~
calcuid roomX 70426 room
exec 70400 %roomX.id%
if (%world.curobjs(70209)% < 3) && (%random.1000% <= 150)
  mload obj 70209
end
if (%world.curobjs(70211)% < 3) && (%random.1000% <= 150)
  mload obj 70211
end
if (%world.curobjs(70212)% < 4) && (%random.1000% <= 150)
  mload obj 70212
end
~
#70218
медведь здох~
0 f 100
*~
if (%world.curobjs(70201)% < 5) && (%random.1000% <= 180)
  mload obj 70201
end
~
#70219
словянин родился~
0 n 100
*~
if (%world.curobjs(70202)% < 5) && (%random.1000% <= 80)
  mload obj 70202
end
if (%world.curobjs(70203)% < 5) && (%random.1000% <= 80)
  mload obj 70203
end
if (%world.curobjs(70204)% < 5) && (%random.1000% <= 80)
  mload obj 70204
end
if (%world.curobjs(70205)% < 5) && (%random.1000% <= 80)
  mload obj 70205
end
if (%world.curobjs(70206)% < 5) && (%random.1000% <= 80)
  mload obj 70206
end
~
#70220
старик родился~
0 n 100
*~
if (%world.curobjs(70207)% < 3) && (%random.1000% <= 130)
  mload obj 70207
end
~
#70221
дух викинга родился~
0 n 100
*~
if (%world.curobjs(70208)% < 3) && (%random.1000% <= 100)
  mload obj 70208
end
if (%world.curobjs(70210)% < 5) && (%random.1000% <= 140)
  mload obj 70210
end
~
#70222
тролль3 здох~
0 f 100
*~
if (%world.curobjs(70220)% < 6) && (%random.1000% <= 180)
  mload obj 70220
end
~
#70223
змея здох~
0 f 100
*~
if (%world.curobjs(70233)% < 6) && (%random.1000% <= 180)
  mload obj 70233
end
~
#70224
клест здох~
0 f 100
*~
if (%world.curobjs(70235)% < 6) && (%random.1000% <= 120)
  mload obj 70235
end
~
#70225
белка здох~
0 f 100
*~
if (%world.curobjs(70236)% < 6) && (%random.1000% <= 120)
  mload obj 70236
end
~
#70226
тролль2 здох~
0 f 100
*~
if (%world.curobjs(70238)% < 6) && (%random.1000% <= 100)
  mload obj 70238
end
~
#70227
дух словенина родился~
0 n 100
*~
if (%world.curobjs(70200)% < 6) && (%random.1000% <= 200)
  mload obj 70200
end
~
$~
