#58000
стафф~
1 ghj 100
~
wait 1
if %actor.vnum% != -1
  halt
end
if %actor.clan% == рп
  halt
end
wait 1
osend %actor% %self.iname% рассыпал%self.u% в мелкую пыль, едва коснувшись ваших рук.
wait 1
%purge% %self%
~
#58001
обкаст за бабки~
0 m 0
~
wait 1
фиг %actor.name%
halt
switch %amount%
  case 20
    mecho Знахарь зачитал свиток.
    dg_cast 'критич исцеление' %actor.name%
  break
  case 30
    mecho Знахарь прочитал заклинание из книги.
    dg_cast 'доблесть' %actor.name%
  break
  case 40
    mecho Знахарь посмотрел в резы и что-то пробормотал.
    dg_cast 'невидимость' %actor.name%
  break
  case 50
    mecho Знахарь зачитал свиток.
    dg_cast 'защита' %actor.name%
  break
  case 60
    mecho Знахарь зачитал свиток.
    dg_cast 'затуманивание' %actor.name%
  break
  case 70
    mecho Знахарь скукожился аки гриб сухой.
    dg_cast 'сила' %actor.name%
  break
  case 80
    mecho Знахарь взмахнул руками.
    dg_cast 'полет' %actor.name%
    case 350
      mecho Знахарь начал в быстром ритме перебирать руками нашептывая себе под нос...
      dg_cast 'сила' .%actor.name%
      dg_cast 'доблесть' .%actor.name%
      dg_cast 'невидимость' .%actor.name%
      dg_cast 'защита' .%actor.name%
      dg_cast 'затуман' .%actor.name%
      dg_cast 'быстр восст' .%actor.name%
      dg_cast 'полет' .%actor.name%
    break
    default
      msend %actor% Извините, но я не знаю что Вы хотите от меня за эти деньги.
      msend %actor% Вот что я могу сделать для Вас:
      msend %actor% _за 20 кун - подлечу тебя чуток.
      msend %actor% _за 30 кун - Бог будет с тобой.
      msend %actor% _за 40 кун - невидимкою будешь.
      msend %actor% _за 50 кун - ты станешь более защищен.
      msend %actor% _за 60 кун - твое тело станет туманным.
      msend %actor% _за 70 кун - сильнее во стократ станешь.
      msend %actor% _за 80 кун - сможешь летать,аки сокол в небе.
      msend %actor.name% за 350 кун - получишь все и сразу...
    done
~
#58002
зашли к кастеру~
0 q 0
~
wait 1
тост
halt
msend %actor% Мне князь приказал помогать вам и вашим соратникам.
msend %actor% Вот что я могу сделать для Вас:
msend %actor% _за 20 кун - подлечу тебя чуток.
msend %actor% _за 30 кун - Бог будет с тобой.
msend %actor% _за 40 кун - невидимкою будешь.
msend %actor% _за 50 кун - ты станешь более защищен.
msend %actor% _за 60 кун - твое тело станет туманным.
msend %actor% _за 70 кун - сильнее во стократ станешь.
msend %actor% _за 80 кун - сможешь летать,аки сокол в небе.
~
#58003
прообраз жеребца~
1 c 2
тереть~
if %actor.clan% != рп
  osend %actor% %self.iname% рассыпал%self.u% в мелкую пыль, едва коснувшись ваших рук.
  wait 1
  opurge %self%
  halt
end
if %arg.contains(ленточка)%
  osend %actor% _Вы начали усиленно тереть пеструю ленточку...
  if %world.curmobs(58017)% < 50
    oechoaround %actor% _%actor.iname% начал%actor.g% усиленно тереть пеструю ленточку...
    oecho Раздался громкий топот копыт и перед Вами предстал прекрасный жеребец!
    oload mob 58017 
    oforce %actor% оседл жеребец
  else
    osend %actor% ...и ничего не произошло!
    halt
  end
  wait 1
  opurge %self%
end
~
#58004
отпустил жеребца~
0 c 1
отпу~
wait 1
msend %actor% _\&Y_Вы отправили жеребца обратно в его волшебные конюшни...&n
mpurge %self%
~
#58005
жеребец приветствует~
0 b 20
*~
эмоц \&Cприветствует всех своим ржанием.\&w
~
#58006
понукать жеребца~
0 c 1
понукать~
if %actor.clan%!= рп
  eval hitpmin %actor.hitp%*3/15
  mdamage %actor% %hitpmin% 
  msend %actor% _\&RЖеребец не захотел видеть Вас своим хозяином...&n
  msend %actor% _\&RНеистово перебирая копытами он умчался в небытие...&n
  wait 1
  mpurge %self%
else
  mechoaround %actor% _\&G%actor.iname% резко потянул поводья и жеребец весело заржал !!!\&n
  msend %actor% _\&WЖеребец весело заржал увидев Вас !!!\&n
  halt
end
~
#58007
команда жеребцу~
0 c 1
преклонить~
if %actor.clan%!= рп
  eval hitpmin %actor.hitp%*3/15
  mdamage %actor% %hitpmin% 
  msend %actor% _\&RЖеребец не захотел видеть Вас своим хозяином...
  msend %actor% _Неистово перебирая копытами он умчался в небытие...\&w
  wait 1
  mpurge %self%   
else
  mechoaround %actor% _\&B%actor.iname% погладил жеребца по холке и тот опустился на передние копыта !!!\&w
  msend %actor% _\&BЖеребец после вашей ласки решил показать как он выдрессирован!!!\&w
  rest
  wait 1s
  вст
end
~
#58008
бросаем монетку~
1 c 2
подбросить~
if %arg.contains(монетку)%
  eval orelresh %random.10%
  if %orelresh% < 5 
    osend %actor% _\&CВы подбросили старую монетку в воздух._\&n
    osend %actor% _\&CПеревернувшись несколько раз она упала на землю._\&n
    osend %actor% _\&GВыпала "решка". _\&n
    oechoaround %actor%  _\&C%actor.name% подбросил%actor.g% старую монетку в воздух._\&n
    oechoaround %actor%  _\&GМонетка упала на землю и выпала "решка"._\&n
    oechoaround %actor%  _\&Y%actor.name% судорожно начал%actor.g% искать на земле старую монетку._\&n
    wait 2s
  elseif %orelresh% > 5 
    osend %actor% _\&CВы подбросили старую монетку в воздух._\&n
    osend %actor% _\&CПеревернувшись несколько раз она упала на землю._\&n
    osend %actor% _\&GВыпал "орел"._\&n
    oechoaround %actor%  _\&C%actor.name% подбросил%actor.g% старую монетку в воздух._\&n
    oechoaround %actor%  _\&GМонетка упала на землю и выпал "орел"._\&n
    oechoaround %actor%  _\&Y%actor.name% судорожно начал%actor.g% искать на земле старую монетку._\&n
    wait 2s
  end
end    
~
#58009
команда жеребцу 1~
0 c 1
топнуть~
mload obj 58034
дать лент %actor.name%
wait 1
mpurge %self%
~
#58010
экипировка~
2 d 100
экипировка~
wait 1
wforce молодой.кузнец  say Привет РПшник
if (%actor.bank%<780)
  wforce молодой.кузнец say Дык ты без бабла совсем... и как я тебе экипировку дам?
  halt
end
wload obj 58010
wload obj 58011
wload obj 58012
wload obj 58013
wload obj 58016
wload obj 58017
wload obj 58018
wload obj 58019
wload obj 58020
wload obj 58021
wload obj 58022
wecho Кузнец бросил на пол вашу экипировку...
wforce %actor.name% взять штан
wforce %actor.name% взять курт
wforce %actor.name% взять сапог
wforce %actor.name% взять пояс
wforce %actor.name% взять перч
wforce %actor.name% взять плащ
wforce %actor.name% взять нару
wforce %actor.name% взять брасл
wforce %actor.name% взять шапка
wforce %actor.name% взять платок
wforce %actor.name% взять перст
wforce %actor.name% взять сумк
eval buf %actor.bank(-780)%
wforce %actor.name% одеть все
wforce %actor.name% одеть курт тело
~
#58011
сдаться~
2 c 1
сдаться~
wechoaround %actor% \&W%actor.name% поднял%actor.g% руки и исчез%actor.q%!\&w
wsend %actor.name% \&WВы решили закончить схватку! \&w
wteleport %actor% 58043
~
#58012
биться~
2 c 1
биться~
wait 1
if !%actor.rentable%
  wsend %actor.name% \&RПускай сначала кровь с тебя стечет, а потом входи сколько угодно.\&w
  halt
end
wechoaround %actor% \&W%actor.name% издал%actor.a% воинственный клич и исчез%actor.q%!\&w
wsend %actor.name% \&WВы решили начать схватку и вошли на арену! \&w
switch %random.4%
  case 1
    wteleport %actor% 58001
    wechoaround %actor% %actor.name% вош%actor.y% на арену.
  break
  case 2
    wteleport %actor% 58013
    wechoaround %actor% %actor.name% вош%actor.y% на арену.
  break
  case 3
    wteleport %actor% 58036
    wechoaround %actor% %actor.name% вош%actor.y% на арену.
  break
  case 4
    wteleport %actor% 58004
    wechoaround %actor% %actor.name% вош%actor.y% на арену.
  break
done
~
$~
