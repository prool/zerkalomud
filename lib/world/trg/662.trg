* BRusMUD trigger file v1.0
#66200
Приветствие старосты~
0 q0 100
~
wait 1s
г Здравствуй путник!
г Присаживайтся, отдохни с дороги.
wait 1s
осм %actor.iname%
wait 1s
г Вижу, не простой ты человек, наделен силою особой.
г Беда стряслась с нашей деревней, не согласишься ли помочь?
attach 66209 %self.id%


~
#66201
Приветствие пастуха~
0 j0 100
~
if %object.vnum% != 66270
    halt
end
return 0
wait 1s
mecho Ты пришел от старосты узнать, почему я не в поле? - поднял голову пастух.
mecho А ты сам попробуй туда сходить. Мало того, что полевик чинит постоянные шутки,
mecho он еще и украл мой счастливый посох! Я с трудом собрал свое стадо.
рыдать
attach 66208 %self.id%
detach 66201 %self.id%
























~
#66202
Староста дает квест на пастуха~
0 j0 100
~
if %object.vnum% != 66206
    halt
end

wait 2s
взд
г Пастух в поле с опаской ходит, пока все уговариваем как-то.
г Устали наши мужики всем о бедах рассказывать, но дам я тебе записку.
г Покажи ее, да скажи, что от меня.
wait 1s
эм начал писать записку на клочке бересты
wait 1s
mload obj 66270
дать все %actor.name%





~
#66203
Награда краснодеревщика~
0 j0 100
~
if %object.vnum% != 66206
    halt
end
wait 1s
эм оснотрел ствол, пощупал его руками
wait 1s
г Хорошее деревце, надолго хватит для работы.
пожать %actor.name%
г погоди, сделаю тебе чего-нибудь, даже денег брать не стану.
wait 5s
eval rnd %random.100%
if      %rnd% < 10
   if %world.curobjs(66211)% < 3
      mload obj 66211
      дать колечко %actor.name%
   else
      mload obj 66219
      дать безделушка %actor.name%
   end
elseif  %rnd% < 20
   if %world.curobjs(66212)% < 3
      mload obj 66212
      дать браслет %actor.name%
   else
      mload obj 66219
      дать безделушка %actor.name%
   end
elseif  %rnd% < 30
   if %world.curobjs(66213)% < 3
      mload obj 66213
      дать ожерелье %actor.name%
   else
      mload obj 66219
      дать безделушка %actor.name%
   end
elseif  %rnd% < 40
   if %world.curobjs(66214)% < 3
      mload obj 66214
      дать посох %actor.name%
   else
      mload obj 66219
      дать безделушка %actor.name%
   end
elseif  %rnd% < 50
   if %world.curobjs(66215)% < 3
      mload obj 66215
      дать лук %actor.name%
   else
      mload obj 66219
      дать безделушка %actor.name%
   end
elseif  %rnd% < 60
   if %world.curobjs(66216)% < 3
      mload obj 66216
      дать амулет %actor.name%
   else
      mload obj 66219
      дать безделушка %actor.name%
   end
elseif  %rnd% < 70
   if %world.curobjs(66217)% < 3
      mload obj 66217
      дать щит %actor.name%
   else
      mload obj 66219
      дать безделушка %actor.name%
   end
elseif  %rnd% < 80
   if %world.curobjs(66218)% < 3
      mload obj 66218
      дать кинжал %actor.name%
   else
      mload obj 66219
      дать безделушка %actor.name%
   end
else
   mload obj 66219
   дать безделушка %actor.name%
end
detach 66203 %self.id%






~
#66204
Краснодеревщик дает квест~
0 d0 100
помогу~
say Что пожаловал? Неужто купить что-то хочешь?
say Так знай, что я теперь не у дел, леший не дает мне деревья рубить
груст
wait 1
say Принеси материал - сделаю что тебе надо.
calcuid berezka 66207 obj
attach  66205 %berezka.id%


~
#66205
Срубить березу~
1 c0 100
срубить~
eval prime %actor.eq(16)%
oecho %prime.val0%
oecho %actor.eq(16).val3%
*if (%actor.eq(16).val0% != 0 && %actor.eq(16).val3 != 3) || (%actor.eq(17).val0% != 5 && %actor.eq(17).val3% != 3) || (%actor.eq(18).val0% != 5 && %actor.eq(18).val3% != 3)
*    osend %actor% А рубить чем? Руками голыми?!
*    oechoaround %actor%  %actor.iname% ударил березу рукой и завопил от боли.
*    halt
*end
*wait 3
osend %actor% Вы замахнулись топором на карельскую березу 
oechoaround %actor%  %actor.iname% замахнулся топором на карельскую березу.
oload mob 66209
opurge %self%

















~
#66206
Загрузка Лешего~
0 n0 100
~
mecho Раздался громкий крик "Опять браконьер!! Сказано же в Красной книге Лесов береза!"


































~
#66207
Рип Лешего~
0 f0 100
~
mecho Умирающий леший выронил ствол березки из рук.
mload obj 66206


































~
#66208
Награда пастуха~
0 j0 100
~
if %object.vnum% != 66201
    halt
end
wait 1s
эм начал рассматривать посох
wait 1s
рад
г - Да это он!
г Спасибо тебе, проучил полевика. Теперь я спокойно выйду в поле и староста будет доволен.










~
#66209
Староста дает квест на черный камень~
0 d0 100
помогу~
wait 2s
г Для начала сходи и принеси мне причину наших бед
г старый колдун, что живет на северо-востоке деревни
г сходи, поищи у него в доме какой-нибудь черномажеский предмет
wait 1s
г найдешь - принеси мне, попробуем уничтожить его
attach 66210 %self.id%





~
$
$
