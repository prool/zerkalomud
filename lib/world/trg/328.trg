* BRusMUD trigger file v1.0
#32800
лоад кольчуги~
0 f0 100
~
if (%random.1000% < 80) && (%world.curobjs(32801)% < 4)
    mload obj 32801
end

~
#32801
лоад шлема~
0 f0 100
~
if (%random.1000% < 80) && (%world.curobjs(32802)% < 4)
    mload obj 32802
end

~
#32802
лоад рукавиц~
0 f0 100
~
if (%random.1000% < 80) && (%world.curobjs(32803)% < 4)
    mload obj 32803
end

~
#32803
лоад онучей~
0 f0 100
~
if (%random.1000% < 60) && (%world.curobjs(32804)% < 4)
    mload obj 32804
end

~
#32804
лоад грамоты~
0 f0 100
~
if (%random.1000% < 180) && (%world.curobjs(32805)% < 4)
    mload obj 32805
end

~
#32805
лоад кинжала~
0 n0 100
~
if (%random.1000% < 180) && (%world.curobjs(32800)% < 4)
    mload obj 32800
воор кинж
end

~
$
$
