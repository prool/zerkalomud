#42900
помер медведь~
0 f 100
~
if (%world.curobjs(42900)% < 2) && (%random.4% == 1)
  mload obj 42900
end
~
#42901
вооружаемся костями~
1 j 100
~
if %world.curobjs(42901)% < 1
  if (%actor.class% == 2) ||  (%actor.class% == 3) ||  (%actor.class% == 4) ||  (%actor.class% == 5) ||  (%actor.class% == 9)
    osend  %actor% _Кости вздрогнули от прикосновения и задрожали.
    osend  %actor% _Внезапно они стали собираться в кучку, раскладываться по порядку.
    osend  %actor% _Кости медведя превратились в священный амулет!
    otransform 42901
    calcuid r4low 42900 obj
    detach 42901 %r4low.id%
  end
end
~
#42902
убегаем в бою~
0 k 30
~
wait 1
бежать
бежать
wait 1s
огл
~
#42903
заходиш к смерду~
0 q 70
~
wait 1s
ул
покл
~
#42904
заходиш к купцу~
0 q 40
~
wait 1s
хмур
~
#42905
умер купец - лоад сетшмотки~
0 f 100
~
if %random.10000% < 50 && %world.curobjs(3373)% < 1 && %world.curobjs(3374)% < 1 
  mload obj 3373
end
~
$~
