#61700
Стрелы из засады~
2 e 100
~
wait 1
set fchar %random.pc%
if %fchar.vnum% != 0
  wsend %fchar% Послышались крики и в небо устремились тучи стрел.
  wsend %fchar% Град стрел обрушился на Вас причиняя страшную боль.
  wechoaround %fchar% Град стрел обрушился вокруг Вас.
  wechoaround %fchar% Несколько из них попало в %fchar.vname%.
  eval dam %fchar.maxhitp% / 10
  wdamage %fchar% %dam%
end
~
$~
