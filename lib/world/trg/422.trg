#42200
подошел к берегине~
0 q 100
~
wait 3s
say _Доброго тебе здравия!
if (%actor.level% =< 24)
  mecho _Берегиня нежно улыбнулась и предложила тебе отдохновение или пищу.
  calcuid beregina 42207 mob
  attach 42201 %beregina.id%
  calcuid beregina 42207 mob
  attach 42202 %beregina.id%
  calcuid beregina 42207 mob
  detach 42200 %beregina.id%
end
~
#42201
сказал !еда! у берегини~
0 d 0
есть жрать хавать пища еда~
wait 2s
if %actor.level% <= 24 
  mecho _Берегиня взмахнула рукой, повела головой.....
  DG_CAST 'насыщение' %actor.name%
  calcuid beregina 42207 mob
  attach 42203 %beregina.id%
  calcuid beregina 42207 mob
  detach 42201 %beregina.id%
end
~
#42202
сказал !отдых! у берегини~
0 d 0
отдых отдохновение восстановление~
wait 2s
if %actor.level% <= 24 
  mecho  Берегиня погладила Вас по головушке, шепнула что-то.....
  DG_CAST 'восстановление' %actor.name%
  calcuid beregina 42207 mob
  attach 42203 %beregina.id%
  calcuid beregina 42207 mob
  detach 42202 %beregina.id%
end
~
#42203
сказал !спасибо! у берегини~
0 d 0
благодарствую спасибо сенкс аригато~
wait 2s
say Спасибо за слово доброе! Но им жив не будешь...
плакать
wait 2s
say _Моя белочка погибает от хвори неведомой... Я не в силах сама исцелить ее...
wait 2s
плакать
say_Знаю, есть одно верное средство - зри-трава...
say _Но не могу я отлучиться, оставить свой лесок без присмотра...
вздо
wait 2s
say_Окажи мне услугу, добудь травушку целебную.
calcuid beregina 42207 mob
attach 42204 %beregina.id%
calcuid beregina 42207 mob
detach 42203 %beregina.id%
~
#42204
сказал !помогу! у берегини~
0 d 0
помогу готов~
wait 2s
say _Чудненько. Подожду...
if %actor.level% <= 14
  say _Возьми поясок на дорогу... 
  mload obj 42202
  дать пояс %actor.name%
end
wait 2s
say _А я пока отдохну от трудов праведных.
calcuid beregina 42207 mob
attach 42205 %beregina.id%
calcuid polewik 42209 mob
attach 42207 %polewik.id%
сест
отд
mecho _Берегиня сомкнула очи и погрузилась в легкий сон.
calcuid beregina 42207 mob
detach 42204 %beregina.id%
end
~
#42205
сказал !проснись! у берегини~
0 d 0
проснись вставай хватит подымайся~
wait 2s
mecho _Берегиня сладко потянулась, разминая косточки... 
вст
say _Ну что?
calcuid beregina 42207 mob
attach 42206 %beregina.id%
calcuid beregina 42207 mob
detach 42205 %beregina.id%
~
#42206
дал берегине траву~
0 j 100
~
wait 1
if %object.vnum% != 42203
  wait 1s
  дум
  say Благодарю, но зачем мне это?
  drop all
  halt
end
вст
mpurge %object%
wait 2s
say Спасибо....! Вот теперь я не токмо белочку, но всех путников буду лечить...
if %world.curobjs(42207)% < 30
  mload obj 42207
  wait 2s
  say Носи на здоровье...
  дат колечко %actor.name%
else
  say Прощай...
  поклон
end
~
#42207
подошел к полевику~
0 q 100
~
wait 3s
if %exist.mob(42213)%
  mecho _Старик приветствующе взмахнул рукой.
  say Ты, наверно, травки зри-травки хочешь....
  mecho _Старик закряхтел довольно.
  say  Не спрашивай откуда я знаю! Я все знаю...
  взд
  wait 2 s
  дума
  wait 1s
  say _Получку отслужить надобно! Убей мерзкого хомяка, сына козы и шайтана!
  say  _Все мои запасы поедает, ворог.
  mecho _Полевик начал поносить хомяка на чем свет стоит.
  calcuid homiak 42213 mob
  attach 42208 %homiak.id%
end
~
#42208
помер хомяк~
0 f 100
~
calcuid polewik 42209 mob
attach 42209 %polewik.id%
calcuid polewik 42209 mob
detach 42207 %polewik.id%
~
#42209
подошел к полевику после рипа хомяка~
0 q 100
~
wait 1
if %direction% != down
  halt
end
wait 1s
mecho _Старик вполне доволен.
say Вот и ладненько.... Вот и хорошо...
mecho _Старик закряхтел довольно.
wait 2 s
mload obj 42203
дать трав .%actor.name%
say _Вот твоя получка, как обещал. Но поспешай, нето травка потеряет силу свою.
calcuid polewik 42209 mob
detach 42209 %polewik.id%
~
#42210
померла лисица черно-бурая~
0 f 100
~
if (%world.curobjs(42219)% < 15) && (%random.8% == 1)
  mload obj 42219
end
~
#42211
померла белка~
0 f 100
~
if (%world.curobjs(42205)% < 15) && (%random.4% == 1)
  mload obj 42205
end
~
#42212
помер черный конь~
0 f 100
~
if (%world.curobjs(42204)% < 15) && (%random.15% == 1)
  mload obj 42204
end
~
#42213
репоп квеста~
2 f 100
~
calcuid polewik 42209 mob
detach 42207 %polewik.id%
calcuid homiak 42213 mob
detach 42208 %homiak.id%
~
$~
