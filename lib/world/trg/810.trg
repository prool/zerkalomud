* BRusMUD trigger file v1.0
#81000
степняк-лучник осматривает игрока~
0 q0 10
~
wait 1
msend %actor% _Степняк презрительно посмотрел на Вас.

~
#81001
охотник приветствует игрока~
0 q0 100
~
wait 1
if !%exist.mob(81002)%
halt
end
wait 3
say Привет тебе %actor.iname%!
mecho _- Вижу ты решил%actor.g% пойти дальше, в степь.
mecho _- Не окажешь ли ты мне небольшую услугу?
mecho _- А я уж не постою за наградой.
вопрос %actor.iname% 

~
#81002
охотник дает квест игроку~
0 d0 1
да помогу хорошо~
wait 3
detach 81001 %self.id%
say Вот отлично!
mecho _- Это будет совсем легко.
wait 8
mecho _- Здесь, в округе обитает старый степной лис!
mecho _- Он очень опытный и даже сейчас, спустя столько лет
mecho _- Он не потерял своих навыков.
mecho _- Его вылазки на наши склады начинают раздражать воинов
mecho _- И они уже грозились поджечь степь в месте его обитания!
wait 4
say  Но если степь подожгут, погибнет много невинного зверья.
mecho _- А этого я не могу позволить.
wait 10
say _- Я слишком стар, чтобы гоняться за лисом.
mecho _- А вот тебе я думаю это вполне по силам!
mecho _- Если ты найдешь его и убьешь, принеси мне его труп
mecho _- И я вознагражу тебя.
улыб %actor.iname%
set quester %actor%
global quester
attach 81003 %self.id%
detach 81002 %self.id%

~
#81003
охотник принимает квест~
0 j0 100
~
wait 1
if %quester.id% == %actor.id%
if %object.iname% == труп.старого.степного.лиса
wait 1
mpurge %object%
wait 10 
say Вот молодец!
mecho _- Изловил%actor.g% этого хитрого зверя.
mecho _- Теперь то он уже ни кого не побеспокоит.
mecho _- Да и воины степь не пойдут поджигать!
wait 10
say _- Спасибо тебе.
mecho _- И вот, держи обещанную награду.
switch %random.3%
case 1
wait 10
msend %actor% _Старый охотник аккуратно обработал труп лиса, сняв с него шкуру.
mload obj 81010
дать шкур %actor.iname%
break
default
mecho _Старый охотник достал небольшую горстку кун из кожаного кошеля.
mechoaround %actor% _Старый охотник дал %actor.dname% небольшую груду кун.
msend %actor% _Старый охотник дал Вам небольшую груду кун.
msend %actor% _Это составило 100 кун.
%actor.gold(+100)%       
break
done
detach 81003 %self.id%
else              
wait 10
say _- Это не похоже на то, что мне надо.
mecho _- Так что забирай себе это обратно.
дать %object.name% %actor.name%
end
else
drop %object.name%
end 

~
#81004
РЕПОП~
2 f0 100
~
calcuid from 81009 mob
detach 81001 %from.id%
attach 81001 %from.id%
detach 81002 %from.id% 
detach 81003 %from.id%
attach 81003 %from.id%

~
#81005
зашли к старому лису~
0 q0 100
~
wait 1
msend %actor% _Старый лис громко зарычал и бросился на Вас!
mkill %actor%
wait 2
mechoaround %actor% _Старый лис громко зарычал и набросился на %actor.rname%!  

~
#81006
купец приветствует~
0 q0 15
~
wait 1
поклон %actor.iname%
msend %actor% _- Здравствуй %actor.iname%!
msend %actor% _- Проходи и выбирай все, что только пожелаешь!

~
#81007
седой аксакал приветствует~
0 r0 100
~
wait 1
кашлять
wait 10
say - Здравствуй путешественник!
mecho _- Я Ставрий - странствующий мудрец.
wait 5
mecho  _- Много лет я путешествую по миру и изучаю свойства
mecho  _- Разных магических ингредиентов.
wait 10
mecho  _- Я узнал, что многие из них очень полезны, 
mecho  _- И могут помочь любому, кто знает как их приготовить.
wait 10
mecho  _- Если ты найдешь какие-либо ингредиенты, принеси их мне.
mecho  _- Я с радостью сделаю тебе из них отвары.

~
#81008
седой аксакал делает отвары~
0 j0 100
~
wait 5
switch %object.vnum%
  case 700
    msend %actor% _- Вот держи. Этот отвар не даст тебе умереть от жажды и голода!
    mload obj 81014
    дать отвар %actor.iname%
    mpurge %object.iname%
  break  
 
  case 701
    msend %actor% _- Вот держи. Этот отвар затуманит твои очертания.!
    mload obj 81011
    дать отвар %actor.iname%
    mpurge %object.iname%
  break 
 
  case 705
    msend %actor% _- Вот держи. Этот отвар не даст тебе умереть от жажды и голода!
    mload obj 81014
    дать отвар %actor.iname%
    mpurge %object.iname%
  break 
  
  case 751
    msend %actor% _- Вот держи. Этот отвар вылечит тебя от немоты!
    mload obj 81012
    дать отвар %actor.iname%
    mpurge %object.iname%
  break 
  
  case 752
    msend %actor% _- Вот держи. Этот отвар вылечит тебя, если ты ослепнешь.
    mload obj 81013
    дать отвар %actor.iname%
    mpurge %object.iname%
  break 
         
  case 754
    msend %actor% _- Вот держи. Этот отвар освятит тебя.
    mload obj 81015
    дать отвар %actor.iname%
    mpurge %object.iname%
  break  
  
  case 755
    msend %actor% _- Вот держи. Этот отвар позволит тебе летать!
    mload obj 81016
    дать отвар %actor.iname%
    mpurge %object.iname%
  break  
  
  case 756
    msend %actor% _- Вот держи. Этот отвар защитит тебя в трудную минуту.
    mload obj 81017
    дать отвар %actor.iname%
    mpurge %object.iname%
  break   
  
  case 757
    msend %actor% _- Вот держи. Этот отвар позволит тебе исчезать из поля зрения врага!
    mload obj 81020
    дать отвар %actor.iname%
    mpurge %object.iname%
  break            
  
  case 758
    msend %actor% _- Вот держи. Этот отвар придаст тебе невиданную скорость.
    mload obj 81018
    дать отвар %actor.iname%
    mpurge %object.iname%
  break  
  
  case 721
    msend %actor% _- Вот держи. Этот отвар снимет с тебя нехорошую магию!
    mload obj 81019
    дать отвар %actor.iname%
    mpurge %object.iname%
  break 
  
  case 722
    msend %actor% _- Вот держи. Этот отвар вылечит тебя, если ты ослепнешь.
    mload obj 81013
    дать отвар %actor.iname%
    mpurge %object.iname%
  break   
  
  case 724
    msend %actor% _- Вот держи. Этот отвар вылечит тебя от молчания!
    mload obj 81012
    дать отвар %actor.iname%
    mpurge %object.iname%
  break
  
  default
    msend %actor% _- Зачем мне это?
    msend %actor% _- Из этого ничего не получится, так что забирай обратно.
    дать %object.name% %actor.name%
  break
done

~
#81009
в выгребной яме~
2 e0 25
~
wait 1
wecho _Внезапно на поверхности булькающей глади возник большой пузырь!
wecho _Он вот-вот лопнет!

~
#81010
к шаману зашел раненый игрок~
0 q0 100
~
wait 1
if (%actor.level% <8) && (%actor.hitp% < %actor.maxhitp%)
%actor.wait(1)%
say _- Вах! Кто ж тебя так?
mecho _- Подожди-ка, я тебе помогу.
mecho _Шаман отошел к своему столу и взял какой-то порошок.
mecho _После чего он подошел к Вам в с силой дунул на свою ладонь.
mecho _Под действием порошка у Вас помутило сознание.
mecho _Но когда вы пришли в себя, Вы не обрнаружили на себе 
mecho _ни единой царапины.
dg_cast 'исцеление' %actor.name%
end

~
#81011
лихой обозник приветствует~
0 q0 100
~
wait 5
msend %actor% _- Приет путешественник.
msend %actor% _- Я могу доставить тебя в другие места.
msend %actor% _- Там живут звери невиданные да люди интересные.
msend %actor% _- Если ты заинтересован%actor.g% то тебе это
msend %actor% _- обойдется всего в %actor.level% кун.
 

~
#81012
дали деньги лихому обохзнику~
0 m0 1
~
wait 2
if (%amount% == %actor.level%) || (%amount% > %actor.level%)
msend %actor% _- Ну давай. Залась в позозку.
msend %actor% _- С ветерком прокачу!
msend %actor% _Обозник лихо усадил Вас в повозку и вы тут же тронулсь в путь.   
mechoaround %actor% _Обозник лихо усадил в повозку %actor.dname% и унесся в даль
*Здесь ставим mteleport XXXX %actor.iname%
else
msend %actor% _- Маловато что-то.
msend %actor% _- За столько я тебя ни куда не повезу!
дать %amount% кун %actor.iname%
end

~
#81013
крики из шатра для отдыха~
2 e0 20
~
wait 1
switch %random.2%
case 1
wecho _Из шатра на востоке донеслись пьяные песни.
break
case 2
wecho _Из шатра на востоке донеслась грязная ругань и шум драки.
break
done

~
#81014
звуки молота у шатра оружейника~
2 e0 20
~
wait 1
wecho _Из шатра оружейника донеслись звонкие звуки.

~
#81015
восточный купец говорит~
0 g0 20
~
wait 1
msend %actor% _- Ай! Ай! Какой хороший человек ко мне приходить!
msend %actor% _- Заходи, выбирай, чего душе угодно.

~
#81016
конный лучник озирается~
0 q0t0 15
~
wait 1
msend %actor% _Конный лучник внимательно посмотрел на Вас.
msend %actor% _Похоже он не очень доволен тем, что Вы стоите на его тути.
say С дороги!

~
#81017
поскрыпывает вывеска у шатра купца~
2 e0 15
~
wait 1
msend %actor% _Вывеска, висящая на столбике у шатра жалобно заскрипела.

~
#81018
потрескивают факелы на столбе~
1 t0 10
~
wait 1
msend %actor% _Мягкий свет, исходящий от факелов разливается по дороге.

~
#81019
мальчишка просит 1 куну~
0 r0t0 20
~
wait 5
msend %actor% _- Дайде куну!
msend %actor% _- Ну дайте куну!
msend %actor% _- Ну вам что, жалко что ли ?!

~
#81020
дали мальчишку 1 куну~
0 m0 1
~
wait 1
msend %actor% _- Спасибо вам, добрый человек!

~
#81021
веселый гунн икает~
0 r0t0 15
~
wait 1
икать %actor.iname%
msend %actor% _- Эй ты! Приходи сегодня ко мне в гости. Выпьем за удачный набег!

~
#81022
трещат мостки на реке~
2 e0 20
~
wait 1
msend %actor% _Прямо у Вас под ногами мостки предательски заскрипели.

~
$
$
