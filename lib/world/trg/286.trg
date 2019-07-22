* Сгенерировано BZEditor
* Количество триггеров : 1
* Сохранено 15.05.2019 17:39:10
#28600
открыть проход~
2 c 100
раздвинуть~
if !(%arg.contains(камыш)%)
	msend %actor% Что Вы собираетесь раздвинуть ?
	return 0
	halt
end
wdoor 28629 s room 28628
wait 2s
wdoor 28629 south purge
wecho Камышь снова скрыл проход.
~
$
$
