#12000
Убили обманутую жену~
0 f 100
~
if (%random.5%==1)
  mload obj 12018
end
~
#12001
Дали череп мужу~
0 j 100
~
wait 1
if %object.vnum% != 12018
  wait 10
  сплюн
  снят все
  брос все
  halt
end
mpurge череп
эмоц взял череп в левую руку и задумчиво уставился ему в глаза.
wait 10
say О, бедная жена!
say Я знал ее.
say Играл на ее коленях.
wait 5
say А теперь твоя голова еще более пуста, чем при жизни.
эмоц задумчиво достал из-за пояса тесак и принялся строгать череп.
wait 30
mecho и через 5 минут произведение исскуства было готово.
if %random.2%==1
  mload obj 12019
else
  mload obj 12020
end
дать все %actor.name%
~
#12002
Волк ловит рыбу~
0 ab 100
~
if %self.fighting%
  halt
end
say Ловись рыбка
wait 5
if %random.2%==1
  mecho Вроде что-то начало клевать. Волк подсек, но сорвалось.
  if %random.2%==2
    mecho "У меня бы получилось" - подумали Вы - "но волк мешает".
  end
  wait 2
  взд
end
~
#12003
позвали щуку~
2 d 1
ловись рыбка~
eval volk %actor.people%
while %volk%
  if %volk.vnum%==12029
    halt
  end
  eval volk %volk.next_in_room%
done
if %random.5%>1
  wecho Из воды показалась хитрая рыбья морда, и снова исчезла.
  halt 
end
wecho Вода внезапно расступилась и из нее медленно вылетела, помахивая
wecho плавниками как  крыльями огромная рыбина с острыми зубами 
wecho и хищным блеском в глазах.
wait 10
if %random.3%==2
  wecho &YЩука закричала "За золотую рыбку! Попишу!"&n
end
wait 1
wload mob 12010
calcuid room 12016 room
detach 12003 %room.id%
~
#12004
Убили щуку~
0 f 100
~
mecho В воздухе запахло жаренной осетриной
calcuid emel 12019 mob
detach 12005 %emel.id%
~
#12005
емеля кастует~
0 p 100
~
mecho Емеля прикрыл глаза и прошептал : "по моему хотению".
eval emela %self.people%
while %emela%
  if %emela.sex%==2
    щуп %emela.name%
  end
  eval emela %emela.next_in_room%
done
mecho Емеля теперь выглядит гораздо лучше.
mecho Емеля зыркнул на Вас и проревел : "по щучьему велению".
mecho В воздухе запахло жареным. "Рыба" - подумали Вы.
eval emela %self.people%
while %emela%
  %emela.hitp(-15)%
  eval emela %emela.next_in_room%
done
%self.hitp(%self.maxhitp%)%
wait 1
eval killer %self.people%
while %killer%
  eval killer %killer.next_in_room%
  if %killer.vnum% == -1
    уб %killer.name%
    halt
  end
done
~
#12006
убийство спящего~
0 p 100
~
return 0
mecho Хрустальный гроб принял удар на себя.
%self.hitp(%self.maxhitp%)%
if %actor.vnum% == -1
  mdamage .%actor.name% 30
  mdamage %actor% 30
  mdamage %actor% 80
end
~
#12007
изнасиловали царевну~
0 c 100
целовать~
msend %actor% Вы полезли в гроб и начали осыпать поцелуями тело мертвой царевны.
mechoaround %actor% %actor.name% полез%actor.q% в гроб и занял%actor.u% непотребством с мертвым телом.
mechoaround %actor% Какой ужас! Вы и не подозревали таких наклонностях своего товарища!
wait 30
mecho Внезапно гроб со звоном разлетелся на мелкие осколки.
mecho Не в силах вынести такого позора труп встал на ноги.
wait 10
г Кто это меня всю обслюнявил?
wait 10
mload mob 12030
wait 1
mpurge %self%
~
#12008
убили бесенка~
0 f 100
~
if (%world.curobjs(10210)%) < 10 && (%random.5%==2)
  mload obj 12010
end
~
#12009
Убили чертенка~
0 f 100
~
if (%world.curobjs(10209)%) < 10 && (%random.5%==2)
  mload obj 12009
end
~
#12010
Дали мельнику трупы~
0 j 100
~
wait 2
switch %object.name% 
  case труп чертенка
    say  Какой подарок! Знали бы вы как меня эта тварь достала! Вот Вам за труды!
    %self.gold(+100)%
    дать 100 кун %actor.name%
    mpurge труп 
  break
  case труп бесенка
    say    О! И на эту мразь управа нашлась! Молодцы! Заслужили награду! 
    %self.gold(+110)%
    дать   110 кун %actor.name%
    mpurge труп 
  break
  default
    say  Что это Вы обо мне возомнили? А ну кыш отсюда... ходят тут, понимаешь ли!
    eval getobject %object.name%
    if  %getobject.car% == труп
      mpurge труп
    else
      броси %getobject.car%.%getobject.cdr%
    end
  break
done 
~
#12011
убили снеговика~
0 f 100
~
if (%world.curobjs(12002)%) < 10 && (%random.5%==3)
  mload obj 12002
end
~
#12012
убили снежную бабу~
0 f 100
~
if (%random.1000% < 80) && (%world.curobjs(12000)% < 6)
  mload obj 12000
end 
~
#12013
убили белку~
0 f 100
~
if (%random.1000% < 100) && (%world.curobjs(12021)% < 6)
  mload obj 12021
end 
if (%random.1000% < 75) && (%world.curobjs(12022)% < 6)
  mload obj 12022
end 
~
#12014
убили старшую сестру~
0 f 100
~
if (%random.1000% < 100) && (%world.curobjs(12013)% < 6)
  mload obj 12013
end 
if (%random.1000% < 75) && (%world.curobjs(12024)% < 6)
  mload obj 12024
end 
~
#12015
убили среднюю сестру~
0 f 100
~
if (%random.1000% < 100) && (%world.curobjs(12012)% < 6)
  mload obj 12012
end 
if (%random.1000% < 75) && (%world.curobjs(12026)% < 6)
  mload obj 12026
end 
~
#12016
убили хозяина~
0 f 100
~
if (%random.1000% < 100) && (%world.curobjs(12025)% < 6)
  mload obj 12025
end 
~
#12017
убили младшую~
0 f 100
~
if (%random.1000% < 100) && (%world.curobjs(12027)% < 6)
  mload obj 12027
end 
~
#12018
убили шарика~
0 f 100
~
if (%random.1000% < 50) && (%world.curobjs(12028)% < 6)
  mload obj 12028
end 
~
#12019
убили червяка~
0 f 100
~
if (%random.1000% < 50) && (%world.curobjs(12029)% < 6)
  mload obj 12029
end 
~
#12020
убили МЕЛЬНИКА~
0 f 100
~
if (%random.1000% < 80) && (%world.curobjs(12014)% < 6)
  mload obj 12014
end 
if (%random.1000% < 120) && (%world.curobjs(12030)% < 9)
  mload obj 12030
end 
~
#12021
убили Емелю~
0 f 100
~
if (%random.1000% < 80) && (%world.curobjs(12008)% < 6)
  mload obj 12008
end 
~
#12022
убили дядьку~
0 f 100
~
if (%random.1000% < 80) && (%world.curobjs(12015)% < 6)
  mload obj 12015
end 
~
#12023
убили ягу~
0 f 100
~
if (%random.1000% < 80) && (%world.curobjs(12017)% < 6)
  mload obj 12017
end 
~
#12024
убили деда мороза~
0 f 100
*~
if (%random.1000% < 80) && (%world.curobjs(12001)% < 6)
  mload obj 12001
end 
if (%random.1000% < 80) && (%world.curobjs(12003)% < 6)
  mload obj 12003
end 
if (%random.1000% < 80) && (%world.curobjs(12006)% < 6)
  mload obj 12006
end 
if (%random.1000% < 80) && (%world.curobjs(12005)% < 2)
  mload obj 12005
end 
~
#12025
убили снегурочку~
0 f 100
~
if (%random.1000% < 50) && (%world.curobjs(12004)% < 4)
  mload obj 12004
end 
~
$~
