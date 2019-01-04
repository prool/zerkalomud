* BRusMUD trigger file v1.0
#13600
лезем на сосну~
2 c0 1
лезть взобраться карабкаться~
wait 1
if %arg.contains(сосн)%
  wsend %actor% Вы начали карабкаться по сосне.
  wechoaround %actor% ~~%actor.iname% начал~%actor.q% карабкаться по сосне.
  wteleport %actor% 13670 horse
  detach 13600 %self%
else
  wsend %actor% Куда ползем?
end





~
#13601
ZoneReset~
2 f0 100
~
attach 13600 %self%











~
$
$
