#10300
<103 Prelat killed>~
0 f 100
~
if %world.curobjs(3310)% < 1 && %world.curobjs(3311)% < 1 && %random.100% < 3
mload obj 3310
end
mload obj 10300
~
#10301
<103 Prelat loaded>~
0 n 100
~
if (%world.curobjs(10301)% < 10) && (%random.10% <= 4)
   mload obj 10301
   wear  ряса
end
if (%world.curobjs(10304)% < 10) && (%random.10% <= 4)
   mload obj 10304
   wield посох
end
if (%world.curobjs(10305)% < 5) && (%random.10% <= 4)
   mload obj 10305
   wear  ладан
end
~
#10302
<103 Abbat loaded>~
0 n 100
~
if (%world.curobjs(10307)% < 10) && (%random.10% <= 4)
   mload obj 10307
   wield ножницы
end
if (%world.curobjs(10308)% < 10) && (%random.10% <= 4)
   mload obj 10308
   wear  пояс
end
~
#10303
<103 Abbat killed>~
0 f 100
~
if %world.curobjs(10327)% < 1
   mload obj 10327
end
~
#10304
<103 Presviter killed>~
0 f 100
~
   mload obj 10327
~
#10305
<103 Prior loaded>~
0 n 100
~
if (%world.curobjs(10312)% < 10) && (%random.10% <= 4)
   mload obj 10312
   wear  шлем
end
if (%world.curobjs(10314)% < 10) && (%random.10% <= 4)
   mload obj 10314
   wear  латы
elseif (%world.curobjs(10315)% < 10) && (%random.10% <= 4)
   mload obj 10315
   wear  кольч
end
if (%world.curobjs(10313)% < 10) && (%random.10% <= 4)
   mload obj 10313
   wield меч
elseif (%world.curobjs(10317)% < 10) && (%random.10% <= 4)
   mload obj 10317
   wield копье
end 
~
#10306
<103 Knight loaded>~
0 n 100
~
if     (%world.curobjs(10315)% < 10) && (%random.10% <= 4)
   mload obj 10315
   wear  кольчуга
elseif (%world.curobjs(10318)% < 10) && (%random.10% <= 4)
   mload obj 10318
end
*if     (%world.curobjs(10325)% < 10) && (%random.100% <= 4)
*   mload obj 10325
*   wield меч
*   mload obj 10317
*   wield копье
end 
set weapon 0
global weapon
~
#10307
<103 Weaponary loaded>~
0 n 100
~
if     (%world.curobjs(10322)% < 20) && (%random.100% <= 4)
   mload obj 10322
   wield меч
end 
~
#10308
<103 Inquisitor loaded>~
0 n 100
~
if     (%world.curobjs(10323)% < 20) && (%random.10% <= 4)
   mload obj 10323
   wear  капюшон
end 
~
#10309
<103 Игрок зашел к Рыцарю>~
0 q 100
~
wait 1
if (%weapon% == 1 ) || (%world.curobjs(10317)% > 9 )
halt
end
say Оруженосец, готовься к бою!
remove all
set weapon 1
mload obj 10317
wield копье
одеть все
global weapon
~
#10310
<103 Смерть рыцаря>~
0 f 100
~
if  (%world.curobjs(10325)% < 10) && (%random.100% <= 4)
    mload obj 10325
elseif (%world.curobjs(10317)% < 10) && (%random.100% <= 4)
    mload obj 10317
end 
mload obj 10329
~
#10311
Knight loaded~
0 n 100
~
set weapon 0
global weapon
~
$~
