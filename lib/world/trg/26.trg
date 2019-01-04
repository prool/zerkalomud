* Сгенерировано BZEditor
* Количество триггеров : 8
* Сохранено 28.08.2011 12:20:57
#2600
боевые триги для комнат~
2 e 100
~
if (%actor.clan%==ДТ)
wecho Раздался не большой щелчок и нечего не произошло...
halt
end 
wait 1
%actor.wait(2)%
wecho Внезапно из замаскированных в стене бойниц вылетел рой дротиков.
wecho Уклоняться практически бесполезно, Вы истекаете кровью...
foreach victim %self.all%
  if (%victim.maxhitp% < %victim.hitp%)
    eval dam126 %victim.hitp%*17/20
  else
    eval dam126 %victim.maxhitp%*17/20
  end
  wdamage %victim% %dam126%
  done
~
#2601
тригер на лаг чара~
2 e 100
~
if (%actor.clan%==ДТ)
wecho Раздался не большой щелчок и нечего не произошло...
halt
end 
wait 1
%actor.wait(10)%
wecho Вам стало дурно... Вокруг Вас все замедлилось... Ваша голова закружилась...



~
#2602
телепорт чара~
2 c 0
рекол~
if (%actor.clan%!=ДТ)
halt
end 
wechoaround %actor% %actor.name% зачитал свиток возврата. 
wechoaround %actor% %actor.name% исчез%actor.q%.
wsend %actor.name% Вы зачитали свиток возврата.
wteleport %actor.name% 2617
~
#2603
обкаст чара~
0 d 0
обкаст~
if (%actor.clan%!=ДТ)
г ДА КАК ТЫ СМЕЕШЬ??
dg_cast 'гнев богов' %actor.name%
dg_cast 'гнев богов' %actor.name%
dg_cast 'гнев богов' %actor.name%
dg_cast 'гнев богов' %actor.name%
dg_cast 'гнев богов' %actor.name%
dg_cast 'гнев богов' %actor.name%
dg_cast 'гнев богов' %actor.name%
dg_cast 'гнев богов' %actor.name%
dg_cast 'гнев богов' %actor.name%
dg_cast 'гнев богов' %actor.name%
dg_cast 'гнев богов' %actor.name%
dg_cast 'гнев богов' %actor.name%
взят все
halt
end 
wait 1s
г щас все сделаем в лучем виде!
dg_cast 'исцеление' %actor.name%
dg_cast 'защ бог' %actor.name%
dg_cast 'выл слеп' %actor.name%
dg_cast 'сня прок' %actor.name%
dg_cast 'сня глу' %actor.name%
dg_cast 'у ж' %actor.name%
dg_cast 'у ж' %actor.name%
dg_cast 'у ж' %actor.name%
dg_cast 'у ж' %actor.name%
dg_cast 'у ж' %actor.name%
dg_cast 'у ж' %actor.name%
dg_cast 'у ж' %actor.name%
dg_cast 'у ж' %actor.name%
dg_cast 'у ж' %actor.name%
dg_cast 'у ж' %actor.name%
dg_cast 'у ж' %actor.name%
dg_cast 'у ж' %actor.name%
dg_cast 'защита' %actor.name%
dg_cast 'затуман' %actor.name%
dg_cast 'манти тене' %actor.name%
dg_cast 'насыщ' %actor.name%
~
#2604
хватаем вещи :)~
0 c 100
закупка~
mload obj 2600
mload obj 2601
mload obj 2602
mload obj 2603
mload obj 2604
mload obj 2605
mload obj 2606
mload obj 2607
mload obj 2608
mload obj 2608
mload obj 2609
mload obj 2609
mload obj 2610
mload obj 2610
mload obj 2611
дать все %actor.name%
~
#2605
сумон игроков~
0 c 100
сумон~
г призываем! 
dg_cast 'призв' %arg.words%
~
#2606
обкаст чара~
1 c 100
обкаст~
if (%actor.clan%!=ДТ)
halt
end 
dg_cast 'исцеление' %actor.name%
dg_cast 'защ бог' %actor.name%
dg_cast 'выл слеп' %actor.name%
dg_cast 'сня прок' %actor.name%
dg_cast 'сня глу' %actor.name%
dg_cast 'у ж' %actor.name%
dg_cast 'у ж' %actor.name%
dg_cast 'у ж' %actor.name%
dg_cast 'у ж' %actor.name%
dg_cast 'у ж' %actor.name%
dg_cast 'у ж' %actor.name%
dg_cast 'у ж' %actor.name%
dg_cast 'у ж' %actor.name%
dg_cast 'у ж' %actor.name%
dg_cast 'у ж' %actor.name%
dg_cast 'у ж' %actor.name%
dg_cast 'у ж' %actor.name%
dg_cast 'защита' %actor.name%
dg_cast 'затуман' %actor.name%
dg_cast 'манти тене' %actor.name%
dg_cast 'насыщ' %actor.name%
~
#2607
масс заклы~
1 c 100
массзакл~
if (%actor.clan%!=ДТ)
halt
end 
oecho &RВсе загорелось ярким пламенем! Сейчас Вы познаете всю силу могущественного волшебника.&n
dg_cast 'масс оц'
dg_cast 'масс слеп'
dg_cast 'масс прокл'
dg_cast 'масс молч'
dg_cast 'масс глух'
dg_cast 'масс медл'
~
$
$
