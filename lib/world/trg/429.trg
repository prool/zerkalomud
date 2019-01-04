* BRusMUD trigger file v1.0
#42900
помер медведь~
0 f0 100
~
if (%world.curobjs(42900)% < 2) && (%random.4% == 1)
mload obj 42900
end








~
#42901
вооружаемся костями~
1 j0 100
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
0 k0 30
~
wait 1
бежать
бежать
wait 1s
огл




~
#42903
заходиш к смерду~
0 q0 70
~
wait 1s
ул
покл





~
#42904
заходиш к купцу~
0 q0 40
~
wait 1s
хмур



~
$
$
