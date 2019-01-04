#13600
лезем на сосну~
2 c 1
лезть взобраться карабкаться~
wait 1
if %arg.contains(сосн)%
  wsend %actor% Вы начали карабкаться по сосне.
  wechoaround %actor% ~~%actor.iname% начал~~%actor.q% карабкаться по сосне.
  detach 13600 %self%
else
  wsend %actor% Куда ползем?
end
~
#13601
ZoneReset~
2 f 100
~
attach 13600 %self%
~
$~
