#77500
Пурж клан стафа~
1 gijt 100
~
wait 1
if %actor.vnum% != -1
  halt
end
wait 1
if %actor.clan% == тз
  halt
endif
osend %actor% %self.name% сгорел%self.g% в ваших руках.в очертаниях огня вы увидели буквы ТЗ 
oechoaround %actor% в очертаниях огня, охватившего %self.name%, Вы лишь заметили кровавый знак ТЗ
wait 1
opurge %self%
~
$~
