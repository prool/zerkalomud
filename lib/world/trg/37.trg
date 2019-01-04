#3700
Именной стафф - Ронари~
1 gjp 100
~
if (%actor.level% > 30 ) && (%actor.vnum% == -1 )
  halt
end
if ((%actor.name% != Ронари) && (%actor.name% != Бридт) && (%actor.name% != Хэйсар))
  osend %actor% _Рот выковырял &Kгрязь&n из &Wзуба&n и кинул ее в Вас! 
  return 0
  halt
else
  wait 1
  oecho _&rРот&n начал интенсивно работать.
end
~
#3701
Именной стафф - Коннор~
1 gjp 100
~
if (%actor.level% > 30 ) && (%actor.vnum% == -1 )
  halt
end
if %actor.name% != Коннор
  osend %actor%  _Изображенный на сумке сокол с клекотом клюнул Вас. 
  return 0
  halt
else
  wait 1
  oecho _Сокол расправил крылья и кинулся в атаку.
end
~
#3702
Именной стаф - Огнезара~
1 gjp 100
~
if (%actor.level% > 30 ) && (%actor.vnum% == -1 )
  halt
end
if %actor.name% != Огнезара
  osend %actor% _Сума опалила Ваши руки огнем и Вы не смогли удержать ее.
  return 0
  halt
else
  wait 1
end
~
#3703
Именной стаф - Васса~
1 gjp 100
~
if (%actor.level% > 30 ) && (%actor.vnum% == -1 )
  halt
end
if %actor.name% != Рудко
  osend %actor% &KСумка лекаря мертвых&n вспыхнула мрачным светом отказываясь даватся в руки кому-либо кроме хозяйки.
  return 0
  halt
else
  wait 1
  oecho Несколько полусгнивших рук выползли из &Kсумки лекаря мертвых&n и разбежались в разные стороны.
end
~
#3704
Именной шмот - Мортыфан (бывш. хоз. Еска)~
1 gjp 100
~
if ((%actor.level% > 30) && (%actor.level% == -1))
  halt
end
if %actor.name% != Мортыфан && %actor.name% != Шабу
  otransform 3704
  osend %actor% &RТ&Yо&Gр&Cб&Bа &Mд&Rл&Yя &Gп&Gл&Bю&Mш&Rе&Yк&n вырвалась из Ваших рук!
  return 0
  halt
else
  wait 1
  oecho Из &Rт&Yо&Gр&Cб&Bы &Mд&Rл&Yя &Gп&Gл&Bю&Mш&Rе&Yк&n послышался задорный смех!
end
~
#3705
Именной шмот - Эрфис~
1 gjp 100
~
if (%actor.level% > 30 ) && (%actor.vnum% == -1 )
  halt
end
if ((%actor.name% != Эрфис) && (%actor.name% != Сонгай))
  osend %actor% _Желудок малька проскользнул у вас между пальцев и упал на землю.
  return 0
  halt
end
set owner %self.worn_by%
if ((%owner.name% == Эрфис ) || (%owner.name% == Сонгай ))
  halt
end
osend %actor% Желудок малька начал насвистывать похоронный марш.
oechoaround %actor% Желудок малька начал насвистывать похоронный марш.
~
#3706
Именной шмот -- Ведрусса~
1 gjp 100
~
if ((%actor.level% > 30) && (%actor.vnum% == -1))
  halt
end
if ((%actor.name% != Ведрусса) && (%actor.name% != Руська) && (%actor.name% != Солейна))
  otransform 3706
  osend %actor%  Сумка из шкуры пантеры распахнула вдруг ярко-зеленые глаза и громко клацнула зубами.
  osend %actor%  Вы проворно отдернули руку.
  return 0
  halt
end
set char %self.worn_by%
if (%random.1000% <= 40 || (!%char% && %random.1000% <= 40))
  wait 1
  oecho _&WСумка из шкуры &Kчерной пантеры &nвнезапно шевельнулась, замурчала
  oecho ___открыла &Gзеленые&n глаза и попыталась достать вас своими острыми коготками.
end
~
#3707
Именной стафф - Ледогост~
1 gjp 100
~
if %actor.level% > 30 && %actor.vnum% == -1
  halt
end
if %actor.name% != Ледогост && %actor.name% != Касион && %actor.name% != Лирана
  otransform 3707
  osend %actor% _Торба Карманника ловко отскочила в сторону от ваших рук.
  return 0
  halt
end
set char %self.worn_by%
if (%random.1000% <= 40 || (!%char% && %random.1000% <= 40))
  wait 1
  oecho _Внезапно из Торбы Карманника вылезла рука и обчистила Ваши карманы.
end
~
#3708
Именной стаф - Херуба~
1 gjp 100
~
if ((%actor.level% > 30) && (%actor.vnum% == -1))
  halt
end
if %actor.name% != Херуба
  otransform 3708
  osend %actor% Поверхность &cзеркала&n затуманилась и в нем Вы увидели страшных чудовищ! В ужасе Вы отпрянули!
  return 0
  halt
else
  wait 1
  if %random.num(10)% > 8
    osend %actor% &cБольшое пребольшое зеркало&n блеснуло в лучах солнца.
    oechoaround %actor% Отражение %actor.rname% в большом пребольшом зеркале скорчило Вам гримасу.
  else
    set selfnum 0
    set num 0
    foreach i %self.pc%
      eval num %num%+1
    done
    set ranofself %random.num(%num%)%
    foreach n %self.pc%
      eval selfnum %selfnum%+1
      if %ranofself% == %selfnum%
        set char %n%
      break
    end
  done
  if %char.name% != %actor.name%
    oechoaround %char% %char.iname% ослеплен%char.g% отблеском солнца в &cбольшом пребольшом зеркале&n, которое зачем-то носит с собой %actor.name%.
    osend %char% Луч солнца, отраженный в &cбольшом пребольшом зеркале&n %actor.rname%, ослепил вас!
  else
    oechoaround %actor% %actor.iname% начал%actor.g% прихорашиваться перед &cбольшим пребольшим зеркалом&n.
    osend %actor% Вы начали прихорашиваться перед &cбольшим пребольшим зеркалом&n.
  end
end
end
~
#3709
Именной стафф - Кудряш~
1 gjp 100
~
if ((%actor.level% > 30) && (%actor.vnum% == -1))
  halt
end
if ( %actor.name% != Кудряш)
  otransform 3709
  osend %actor% _Шкура змея проскользнула у Вас между пальцев и упала на землю.
  return 0
  halt
end
~
#3710
Именной стаф - Иттарио~
1 gjp 100
~
if ((%actor.level% > 30) && (%actor.vnum% == -1))
  halt
end
if %actor.name% != Иттарио && %actor.name% != Густав && %actor.name% != Кельс
  otransform 3710
  osend %actor% Вы попытались взять &RКроваво&n-&Mмертвенную&n суму, Сума исторгла из себя сгусток &Rкрови&n и Вы тут же отдернули руку в испуге.
  oechoaround %actor% %actor.name% попытал%actor.u% взять &RКроваво&n-&Mбледную&n суму, сума изрыгая проклятия плюнула &Rкровью&n в сторону %actor.rname%.
  return 0
  halt
else 
  wait 1
  oecho &RКроваво&n-&Mмертвенная&n сума широко раскрыла свое нутро и обрадованно исторгла из себя звук напоминающий Вам слово : &YМама&n
~
#3711
Именной стафф - Ранерий~
1 gjp 100
~
if ((%actor.level% > 30) && (%actor.vnum% == -1))
  halt
end
if (( %actor.name% != Тилана ) && (%actor.clan% != вз ))
  otransform 3711
  osend %actor% _Ваша рука как сквозь воздух прошла сквозь сумку с эмблемой Златогривого Львенка.
  return 0
  halt
else
  *set char %self.worn_by%
  *if (%random.1000% <= 120 || (!%char% && %random.1000% <= 40))
  wait 1
  oecho &YЗлатогривый Львенок&n на сумке &Kгромко &Wзарычал&n.
end
~
#3712
Именной стафф  - Вултор~
1 gjp 100
~
if ((%actor.level% > 30) && (%actor.vnum% == -1))
  halt
end
if ( %actor.name% != Вултор)
  otransform 3712
  osend %actor% _Сума вывернулась из Ваших рук, плюнув в глаза кровью.
  return 0
  halt
end
set char %self.worn_by%
if ((%random.1000% <= 450) || (!%char% && %random.1000% <= 450))
  wait 1
  switch %random.7%
    case 1
      set word штаны
    break
    case 2
      set word плечи
    break
    case 3
      set word колено
    break
    case 4
      set word щеку
    break
    case 5
      set word голову
    break
    case 6
      set word перчатки
    break
    default
      set word пояс
    done
    oechoaround %actor% _Сума затрепыхалась и брызнула кровью Вултору на %word%.
    osend %actor% _Сума затрепыхалась и брызнула кровью Вам на %word%.
  end
~
#3713
Именной стафф - Татиана~
1 gjlp 100
~
if ((%actor.level% > 30) && (%actor.vnum% == -1))
  halt
end
if %actor% && ((%actor.name% != Татиана) && (%actor.name% != Ордан) && (%actor.name% != Ольша) && (%actor.name% != Фока))
  osend %actor%  __Взяв в руки &YЛукошко&n Вы заметили &Wбелый флажок&n с надписью: "Вернуть по
  osend %actor%  _адресу: МПМ Былины, замок ДСС, Татиана."
  oechoaround %actor%  Из &YЛукошка&n выпал &Wбелый флажок&n с надписью: 'Вернуть по адресу: МПМ Былины, замок ДСС, Татиана.'
  return 0
  halt
end
set master %self.worn_by%
wait 1
*срабатывает только при взятии сумки
if (%self.carried_by% && %actor% && !%master%)
  osend %actor% &YЛукошко&n распахнулось, слегка непонятное существо
  osend %actor% __(а это был местный &WСолнечный кролик&n) вцепилось Вам в шею.
  oechoaround %actor% &YЛукошко&n распахнулось, слегка непонятное существо
  oechoaround %actor%   (а это был местный &WСолнечный кролик&n) вцепилось в шею %actor.dname%.
  halt
end
*при снятии сумки
if (!%self.worn_by% && %actor% && %self.carried_by% && %master%)
  oecho _&YЛукошко&n недовольно фыркнуло.
  halt
end
*при надевании сумки и по тику
oecho _&WСолнечный кролик&n выглянул из &YЛукошка&n и весело захлопал стремными ушами!
~
#3714
Именной стафф - Эйнар~
1 gjp 100
~
if (%actor.level% > 30 ) && (%actor.vnum% == -1 )
  halt
end
if ((%actor.name% != Эйнар) && (%actor.name% != Абай) && (%actor.name% != Ерлан) && (%actor.name% != Зилд))
  osend %actor% Сумка протекла у вас между пальцами струйками дыма и улеглась на землю.
  return 0
  halt
else
  wait 1
end
~
#3715
Именной стафф -- Полосний~
1 gjp 100
~
if ((%actor.level% > 30) && (%actor.level% == -1))
  halt
end
if ( %actor.name% != Полосний)
  otransform 3715
  osend %actor% _Боты запрыгали, словно зайчики, и вырвались из Ваших рук.
  return 0
  halt
end
wait 1
set owner %self.worn_by%
if (%owner.name% == Полосний )
  halt
end
oecho Боты засветились таинственным светом и Вам стало теплее на душе.
~
#3716
Именной стафф - Альмир~
1 gjp 100
~
if ((%actor.level% > 30) && (%actor.vnum% == -1))
  halt
end
if ((%actor.name% != Альмир) && (%actor.name% != Ларустар) && (%actor.name% != Лоримак))
  otransform 3716
  osend %actor% Вы попытались взять булку, но она рассыпалась, превратившись в крошки, вот незадача.
  return 0
  halt
end
wait 1
set owner %self.worn_by%
if (%owner.name% == Полосний )
  halt
end
oecho Булка захрустела и начала крошиться.
~
#3717
Именной стаф - Козька~
1 gjp 100
~
if ((%actor.level% > 30) && (%actor.vnum% == -1))
  halt
end
if ( %actor.name% != Козька)
  otransform 3717
  osend %actor% _вы попытались взять халат но промахнулись.
  return 0
  halt
end
set char %self.carried_by%
wait 1
if (%char% && %self.worn_by%)
  oechoaround %actor%   %actor.name% медленно растаял%actor.g% в воздухе.
  osend %actor% Вы хорошо замаскировались...
end
~
#3718
Именной стафф - Тешигнев~
1 gjp 100
~
if ((%actor.level% > 30) && (%actor.vnum% == -1))
  halt
end
if ( %actor.name% != Тешигнев)
  otransform 3718
  osend %actor% _Вы хотели взять сумку мастера гильдии душегубов, но вовремя подумали,
  osend %actor% ___что сделает с Вами ее хозяин, и решили не трогать чужих вещей.
  oechoaround %actor% %actor.name% попытал%actor.u% обшарить сумку мастера гильдии, но вовремя передумал%actor.g%.
  return 0
  halt
end
~
#3719
Именной стаф - Витрир~
1 gjp 100
~
if ((%actor.level% > 30)  (%actor.vnum% == -1))
  halt
end
if %actor.name% != Витрир && %actor.name% != Волонд && %actor.name% != Ломко && %actor.name% != Дымко
  osend %actor% Элегантный кошель из меха хомячка грозно зарычал и вцепился Вам в руку.
  oechoaround %actor% Элегантный кошель из меха хомячка грозно зарычал на %actor.vname%.
  return 0
  halt
else
  wait 1
  oecho Элегантный кошель из меха хомячка осветился &Wтысячей бликов света&n.
end
~
#3720
Именной шмот -- Асгард~
1 gjp 100
~
if ((%actor.level% > 30) && (%actor.vnum% == -1))
  halt
end
if (%actor.name% != Асгард)
  if %actor.clan% != вд && %actor.clan% != нд && %actor.clan% != гд
    otransform 3720
    osend %actor% Из &Wтайника Асгарда&n повеяло ледяным могильным холодом, Вы с ужасом отшатнулись от него!
    oechoaround %actor% %actor.name% отшатнул%actor.u% от &WТайника Асгарда&n, наверное увидел%actor.g% что-то страшное.
    return 0
    halt
  end
else
  wait 1
  osend %actor% &WТайник асгарда&n обдал Вас холодным ветром.
  oechoaround %actor% &WТайник Асгарда &nобдал Вас ледяным холодом, Вам стало неуютно.
end
~
#3721
Именной стафф -- Кронгнир~
1 gjp 100
~
if ((%actor.level% > 30) && (%actor.vnum% == -1))
  halt
end
if ( %actor.name% != Кронгнир)
  otransform 3721
  osend %actor% _Вы попытались загрести котомку из листьев ясеня, но она рассыпалась у Вас в руках на мелкие листики.
  return 0
  halt
end
~
#3722
Именной стафф -- Хрон~
1 gjp 100
~
if ((%actor.level% > 30) && (%actor.vnum% == -1))
  halt
end
if ( %actor.name% != Хрон)
  otransform 3722
  osend %actor% _Из Футляра полилась Мрачная и Замогильно Ужасная музыка.
  osend %actor% __Вы поспешили отдернуть руку.
  return 0
  halt
end
~
#3723
Именной стафф  -- Алькира~
1 gjp 100
~
if ((%actor.level% > 30) && (%actor.vnum% == -1))
  halt
end
if ((%actor.name% != Савватий) && (%actor.name% != Алькира) && (%actor.name% != Тарик) && (%actor.clan% != рсп))
  otransform 3723
  osend %actor% _Ваша совесть не позволила вам взять сумку этого добрейшего человека.
  return 0
  halt
end
~
#3724
Именной стафф -- Воян~
1 gjp 100
~
if ((%actor.level% > 30) && (%actor.vnum% == -1))
  halt
end
if ( %actor.name% != Воян)
  otransform 3724
  osend %actor% _Приоткрыв аптечку, вы увидели полуразложившиеся человеческие органы.
  osend %actor% _Осторожно положив ее на землю, вы сделали несколько шагов в сторону.
  osend %actor% _Ну ее нафиг.
  return 0
  halt
end
set char %self.worn_by%
if (%random.1000% <= 40 || (!%char% && %random.1000% <= 40))
  wait 1
  oecho _Несколько капель крови упало Вам на ботинок из Кровавой аптечки.
end
~
#3725
Именной стафф -- Улук~
1 gjp 100
~
if ((%actor.level% > 30) && (%actor.vnum% == -1))
  halt
end
if ((%actor.name% != Улук) && (%actor.name% != Шахрух) && (%actor.clan% != дов))
  otransform 3725
  osend %actor% _Черный кошель БОЛЬНО укусил вас за палец.
  return 0
  halt
end
~
#3726
Именной стафф -- Эстери~
1 gjp 100
~
if %actor.level% > 30 && %actor.vnum% == -1
  halt
end
if %actor.name% != Эстери && %actor.name% != Мадрак && %actor.name% != Радош && %actor.name% != Акана && %actor.clan% != вз
  otransform 3726
  osend %actor% Вы попытались заглянуть в черную дыру, но у Вас закружилась голова и вы чуть не хлопнулись на пол.
  return 0
  halt
end
set char %self.worn_by%
if (%random.1000% <= 40 || (!%char% && %random.1000% <= 40))
  wait 1
  oecho %actor.name% занырнул%actor.g% в черную дыру, немного покопал%actor.u% там, и довольн%actor.w% вынырнул%actor.g% обратно.
end
~
#3727
Именной стафф -- Тикен~
1 gjp 100
~
if ((%actor.level% > 30) && (%actor.vnum% == -1))
  halt
end
if ((%actor.name% != Тикен) && (%actor.name% != Ролонд) && (%actor.name% != Воря) && (%actor.name% != Хадар) && (%actor.name% != Фарогор))
  otransform 3727
  osend %actor% &GЗеленый чертик&n выскочил из торбы, злобно обнюхал Вас и сказал: "Не твое, не трожь!"
  return 0
  halt
end
~
#3728
Именной стафф --  Сариус~
1 gjp 100
~
if ((%actor.level% > 30) && (%actor.vnum% == -1))
  halt
end
if (%actor.name% != Сариус)
  otransform 3728
  osend %actor% _Крокодил громко клацнул зубами чуть не откусив вам руку.
  return 0
  halt
end
~
#3729
Именной стафф -- Ромес~
1 gjp 100
~
if ((%actor.level% > 30) && (%actor.vnum% == -1))
  halt
end
if %actor.name% != Ромес && %actor.name% != Лодин && %actor.name% != Сальма && %actor.name% != Хьялти
  otransform 3729
  osend %actor% _Пумпон вывернулся наизнанку и укусил вас за руку.
  osend %actor% __Вы резко отбросили &Kмаз╦вую сумку с &Rпумпоном.&n
  return 0
  halt
end
set char %self.worn_by%
set char2 %self.carried_by%
if (%random.1000% <= 40 || (!%char% && %random.1000% <= 40) || (!%char% && !%char2%))
  wait 1
  oecho _Пумпон вывернулся наизнанку,злобно ухмыльнулся и спрятался.
end
~
#3730
Именной шмот - Ахмед~
1 gjp 100
~
if %actor.level% > 30 && %actor.vnum% == -1
  halt
end
if %actor.name% != Ахмед 
  otransform 3730
  osend %actor% Посмотрев на &Yог&yром&Yный &Yба&yул&n &bГе&Bро&cе&Cв В&cо&bст&Bока&n Вы поняли что поднять его Вы ни когда не сможете.
  oechoaround %actor% Посмотрев на &Yог&yром&Yный &Yба&yул&n &bГе&Bро&cе&Cв В&cо&bст&Bока&n %actor.iname% понял%actor.g% что поднять его не в состоянии.
  return 0
  halt
else
  wait 1
  oecho Арабская вязь на &Yог&yром&Yном &Yба&yуле&n &bГе&Bро&cе&Cв В&cо&bст&Bока&n вспыхнула ярким пламенем!
end
~
#3731
Именной шмот - Лобан~
1 jp 100
~
if %actor.level% > 30 && %actor.vnum% == -1
  halt
end
if %actor.name% != Лобан 
  otransform 3731
  oechoaround %actor% Большой деревянный улей загудел и рой сторожевых пчел таки покусал %actor.vname%.
  osend %actor% Большой деревянный улей загудел и рой сторожевых пчел таки покусал Вас.
  return 0
  halt
else
  wait 1
  osend %actor% Пчелы вылетели из улья, сделали круг вокруг Вас и влетели обратно.
  oechoaround %actor% Пчелы вылетели из улья, сделали круг вокруг %actor.rname% и влетели обратно.
end
~
#3732
Именной шмот - Лешко~
1 gjp 100
~
if %actor.level% > 30 && %actor.vnum% == -1
  halt
end
if %actor.name% != Лешко 
  otransform 3732
  oechoaround %actor% Авоска выскользнула из рук %actor.rname%.
  osend %actor% Авоська выскользнула у вас из рук.
  return 0
  halt
else
  wait 1
  osend %actor% Охотница с заостренными ушками багосклонно улыбнулась Вам. Вы почувствовали спокойствие.
  oechoaround %actor% Охотница с заостренными ушками, изображенная на авоське Лешко, ехидно улыбнулась Вам.
end
~
#3733
Именной шмот - Милина~
1 gjp 100
~
if %actor.level% > 30 && %actor.vnum% == -1
  halt
end
if %actor.name% != Ладимир && %actor.name% != Милина && %actor.name% != Илзе && %actor.name% != Гарханн
  otransform 3733
  oechoaround %actor% %actor.name% потянул%actor.g% руки к кровавой &Wк&nро&Kвав&rо&Rй с&rу&Kмоч&nк&Wе&n, но с &RУЖАСОМ &nотдернул%actor.g% их.
  osend %actor% Вы потянули руки к &Wк&nро&Kвав&rо&Rй с&rу&Kмоч&nк&Wе&n, но с УЖАСОМ отдернули их.
  return 0
  halt
else
  wait 1
  osend %actor% &WК&nро&Kвав&rа&Rя с&rу&Kмоч&nк&Wа&n прыгнула к Вам на руки.
  oechoaround %actor% Вы заметили, как пару капель крови капнуло из &Wк&nро&Kвав&rо&Rй с&rу&Kмоч&nк&Wи&n.
end
~
#3734
Именной шмот - Надир~
1 gjp 100
~
if ((%actor.level% > 30) && (%actor.vnum% == -1))
  halt
end
if %actor.name% != Ханок && %actor.name% != Гоша && %actor.name% != Улинна
  otransform 3734
  oechoaround %actor% Сума &YБродячего &KХулигана&n попыталась укусить %actor.rname% за горло!
  osend %actor% Сума &YБродячего &KХулигана&n попыталась укусить Вас за горло!
  return 0
  halt
else
  wait 1
  osend %actor% Сума &YБродячего &KХулигана&n загремела своим содержимым.
  oechoaround %actor% Сума &YБродячего &KХулигана&n заглянула в Ваш карман.
end
~
#3735
Именной шмот - Полиграф~
1 gjp 100
~
if %actor.level% > 30 && %actor.vnum% == -1
  halt
end
if %actor.name% != Полиграф && %actor.name% != Георгий && %actor.name% != Поляна && %actor.name% != Зурих
  otransform 3735
  oecho Вы не можете этого сделать.
  return 0
  halt
else
  wait 1
end
~
#3736
Именной шмот -- Севиль~
1 gjp 100
~
if ((%actor.level% > 30) && (%actor.vnum% == -1))
  halt
end
if ((%actor.name% != Сивиль) && (%actor.name% != Севиль))
  otransform 3736
  osend %actor% _Вы попытались взять &Wсумку &Wсо &Yсвя&Rщен&Yным&Rи п&Yись&Rмен&Yами&n, но чуть не обожгли руки.
  osend %actor% _При этом Вы заметили надпись &R"&YМоя хозяйка - Сивиль&R"&n
  return 0
  halt
end
osend %actor% В ваших руках на сумке загорелось ж╦лтым пламенем &Y"Привет! Сивилька!"&n
oechoaround %actor% Вы заметили, что в руках Сивиль &Wсумка &Wсо &Yсвя&Rщен&Yным&Rи п&Yись&Rмен&Yами&n засветилась т╦плым светом.
~
#3737
Именной шмот - Гиран~
1 gjp 100
~
if %actor.level% > 30 && %actor.vnum% == -1
  halt
end
if %actor.name% != Гиран && %actor.name% != Орник && %actor.name% != Кряж && %actor.name% != Гирас && %actor.name% != Гирак && %actor.name% != Гират
  otransform 3737
  oechoaround %actor% &WКрылатый сапожок внезапно ожил, &RСМЕРТЕЛЬНО пнув &Wосмелившегося поднять рюкзачок наглеца.&n
  osend %actor% &RКрылатый сапожок СМЕРТЕЛЬНО пнул Вас.&n
  return 0
  halt
else
  wait 1
  oecho &WКрылатый сапожок замахал крылышками, пытаясь оторваться от ткани и улететь!&n
end
~
#3738
Именной шмот - Лиана~
1 gjp 100
~
if %actor.level% > 30 && %actor.vnum% == -1
  halt
end
if %actor.name% != Лиана && %actor.name% != Ириний && %actor.name% != Надия
  otransform 3738
  oechoaround %actor% %actor.name% попытал%actor.u% дотронуться до &CЛедяной &MРозы&n но чуть сам%actor.g% не стал%actor.g% &Cльдом&n.
  osend %actor% &CХолод &nи &Mпечаль &nпроникли в ваше сердце, превратив его в &Cмаленький ледяной шарик&n...
  return 0
  halt
else
  wait 1
  oecho &CЛедяные лепестки &Mрозы&n тихо зашелестели и замерцали &Wтаинственным светом&n...
end
~
#3739
Именной шмот - Саний~
1 gjp 100
~
if ((%actor.level% > 30) && (%actor.vnum% == -1))
  halt
end
if (%actor.name% != Саний)
  otransform 3739
  osend %actor% Вы сунули руку в мясорубку, послышался хруст ломающихся костей. Как БОЛЬНО!
  oechoaround %actor% %actor.name% сунул%actor.g% руку в мясорубку, послышался хруст ломающихся костей.
  return 0
  halt
end
set char %self.worn_by%
set char2 %self.carried_by%
if (!%char% && !%char2%)
  wait 1
  oecho %actor.name% начал%actor.g% бешено вертеть ручку мясорубки, перемалывая ее содержимое.
end
~
#3740
Именной шмот - Рене~
1 gjp 100
~
if %actor.level% > 30 && %actor.vnum% == -1
  halt
end
if %actor.name% != Рене && %actor.name% != Данка && %actor.name% != Сидор && %actor.name% != Тенько
  otransform 3740
  oechoaround %actor% %actor.name% попытал%actor.u% взять %self.vname%, но чудом не сгорел%actor.g%!
  osend %actor% Здесь вроде только что лежала сумка? Нет, показалось...
  return 0
  halt
else
  wait 1
  eval 3740num %random.3%
  *oecho Случайное число равно: %3740num%
  if %3740num% == 1
    set 3740itemname &cкольцо с сапфиром&n
  elseif %3740num% == 2
    set 3740itemname &yожерелье из янтаря&n
  elseif %3740num% == 3
    set 3740itemname &Wбриллиантовое колье&n
  end
  osend %actor% Случайно из &Wсумы &yблагородного &Wвора &nвыпало %3740itemname%. Кажется, никто не заметил ворованной вещи.
  oechoaround %actor% Да ведь это Ваше %3740itemname%, что Вы потеряли на прошлой неделе, припрятано в &Wсуме &yблагородного &Wвора&n!
end
~
#3741
Именной стафф -- Вадиар~
1 gjp 100
~
if ((%actor.level% > 30) && (%actor.vnum% == -1))
  halt
end
if ((%actor.name% != Вадиар) && (%actor.name% != Аврима))
  otransform 3741
  osend %actor% _Вы больно укололись об наконечники стрел и выбросили колчан.
  return 0
  halt
end
wait 1
if !%self.worn_by%
  oecho _%actor.name% достал стрелу из колчана и приготовился к атаке.
end
~
#3742
Именной шмот - Йорико~
1 gjp 100
~
if %actor.level% > 30 && %actor.vnum% == -1
  halt
end
if %actor.name% != Наська && %actor.name% != Лукреция && %actor.name% != Кира && %actor.name% != Зазноба
  otransform 3742
  oechoaround %actor% %actor.name% попытал%actor.u% подобрать анимешный брелок, но тутже выронил его из рук.
  oforce %actor% say Ня!
  return 0
  halt
elseif %actor.name% == Кира
  wait 1
  oechoaround %actor% %actor.name% достал%actor.q% из-за пазухи какую-то &Kподозрительную тетрадку&n и начал%actor.q% что-то в ней записывать...
  osend %actor% &GБо&gльш&Gой &cпре&Cболь&cшой&K ан&Wиме&nшный б&Wрел&Kок&n сказал: 'на каждую Киру, найдется свой Л!'.
else
  wait 1
  oecho &GБо&gльш&Gой &cпре&Cболь&cшой &Kан&Wиме&nшный б&Wрел&Kок&n сказал "НЯ!".. или вам только показалось?..
end
~
#3743
Именной шмот - Скифша~
1 gjp 100
~
if %actor.level% > 30 && %actor.vnum% == -1
  halt
end
if %actor.name% != Скифша && %actor.name% != Семсер && %actor.name% != Яксарт 
  otransform 3743
  oechoaround %actor% %actor.name% захотел%actor.g% взять &Kсетку из оловянных лепестков&n, но затем передумал%actor.g%.
  osend %actor% Вы захотели взять &Kсетку из оловянных лепестков&n, но затем подумали, что брать чужие вещи - не хорошо!
  return 0
  halt
else
  wait 1
  osend %actor% &KСетка из оловянных лепестков&n печально звякнула Вам вслед.
  oechoaround %actor% &KСетка из оловянных лепестков&n протяжно звякнула, Вы ощутили необъяснимую печаль.
end
~
#3744
Именной стаф - Карл~
1 g 100
~
if %actor.level% > 30 && %actor.vnum% == -1
  halt
end
if %actor.name% != Гурьян && %actor.name% != Карл && %actor.name% != Ярмита && %actor.name% != Гиффор 
  otransform 3744
  oechoaround %actor% %actor.name% протянул%actor.g% руку к &Kсетке &nс &gпродуктами&n, но затем передумал%actor.g%.
  osend %actor% Вы протянули руку к &Kсетке &nс &gпродуктами&n, но совесть не позволила Вам взять чужое.
  return 0
  halt
else
  wait 1
  oecho &KСетка &nс &gпродуктами&n напомнила о себе благоуханием ароматов.
end
~
#3745
Именной шмот - Талгат~
1 g 100
~
if %actor.level% > 30 && %actor.vnum% == -1
  halt
end
if %actor.name% != Талгат  
  otransform 3745
  oechoaround %actor% %actor.name% попытал%actor.g% поднять Тулун, но не смог%actor.g%.
  osend %actor% Вы попытались поднять Тулун, но не смогли.
  return 0
  halt
else
  wait 1
  oecho &YЗолотые нити&n на тулуне зазвенели.
end
~
#3746
Именной шмот - Римелика~
1 gjp 100
~
if %actor.level% > 30 && %actor.vnum% == -1
  halt
end
if %actor.name% != Римелика && %actor.name% != Улар && %actor.name% != Агафья && %actor.name% != Милариса
  otransform 3746
  oecho Маленькая серая тучка угрожающе заискрила молниями.
  return 0
  halt
else
  wait 1
  oecho &KТучка&n нахмурилась, сжалась и с нее сорвались на землю несколько &cтяжелых дождинок&n.
end
~
#3747
Именной шмот - Чира~
1 gjp 100
~
if %actor.level% > 30 && %actor.vnum% == -1
  halt
end
if %actor.name% != Василиса && %actor.name% != Мируша && %actor.name% != Элиза && %actor.name% != Ярина && %actor.name% != Тхарна 
  otransform 3747
  oecho Лунные нити на сумке ослепили Вас своим сиянием.
  return 0
  halt
else
  wait 1
end
~
#3748
Именной шмот - Дельфа~
1 gjp 100
~
if %actor.level% > 30 && %actor.vnum% == -1
  halt
end
if %actor.name% != Дельфа && %actor.name% != Скаррон
  otransform 3748
  oecho _&KРидикюль старой &Wбабушки&n ждет своего владельца.
  return 0
  halt
else
  wait 1
end
~
#3749
Именной стаф - Сиррон~
1 gjp 100
~
if ((%actor.level% > 30) && (%actor.vnum% == -1))
  halt
end
if %actor.name% != Сиррон && %actor.clan% != нво
  otransform 3749
  osend %actor% Вы попытались поднять волшебную суму, но она отпрыгнула в сторону.
  return 0
  halt
end
wait 1
oecho &WВолшебная сума&n засияла.
end
~
#3750
Именной стаф - Вимор~
1 gjp 100
~
if (%actor.level% > 30 ) && (%actor.vnum% == -1 )
  halt
end
if %actor.name% != Вимор
  otransform 3750
  osend %actor% Сундук выскользнул из Ваших рук и изнутри раздался голос:"Руки прочь! Развратник! Я все про тебя знаю!"
  return 0
  halt
else
  wait 1
  osend %actor% &yСундук&n радостно хлопнул крышкой.
end
~
#3751
Именной шмот - Сивух~
1 gjp 100
~
if %actor.level% > 30 && %actor.vnum% == -1
  halt
end
if %actor.name% != Сивух && %actor.name% != Авдей && %actor.name% != Безобраз && %actor.name% != Сонмор 
  otransform 3751
  oechoaround %actor% Из &Yсумы &nгневно жужжа и немного покачиваясь вылетел &GЗеленый Фей&n и &Rбольно цапнул&n %actor.vname% за руку.
  osend %actor% Из &Yсумы &nгневно жужжа и немного покачиваясь вылетел &GЗеленый Фей&n и &Rбольно цапнул&n Вас за руку.
  return 0
  halt
else
  wait 1
  oecho Из &Yсумы&n, распространяя запах абсента, выглянул любопытный &GЗеленый Фей&n и тутже спрятался.
end
~
#3752
Именной стаф - Кьяра~
1 gjp 100
~
if (%actor.level% > 30 ) && (%actor.vnum% == -1 )
  halt
end
if ((%actor.name% != Кьяра) && (%actor.name% != Дэрсин) && (%actor.name% != Коруна) && (%actor.name% != Вистар))
  otransform 3752
  osend %actor% &mКарамельный &Mкармашек &nрастаял у Вас к руках.
  return 0
  halt
else
  wait 1
  switch %random.2%
    case 1
      oecho Из &WИрискиного &Mкармашка &Wповеяло &mванилью и &rкорицей&n.
    break
    case 2
      oecho Из &WИрискиного &Mкармашка &Wвдруг выпало &yкофейное &yзернышко&n.
    break
  done
end
~
#3753
Именной стаф - Сигвард~
1 gjp 100
~
if (%actor.level% > 30 ) && (%actor.vnum% == -1 )
  halt
end
if ((%actor.name% != Сигвард) && (%actor.name% != Загир) && (%actor.name% != Илледан))
  otransform 3753
  osend %actor% &KБездонная&n сумка &Wжадного волхва&n вырвалась из Ваших рук и с громким &Yбряканьем&n рухнула на землю.
  return 0
  halt
else
  wait 1
  oecho &WСумка&n откашлялась и нудным, скрипучим голосом начала &Kчитать&n Вам лекцию.
end
~
#3754
Именной стафф - Штайн~
1 gjp 100
~
if (%actor.level% > 30 ) && (%actor.vnum% == -1 )
  halt
end
if ((%actor.name% != Штайн) && (%actor.name% != Ховард) && (%actor.name% != Саббах) && (%actor.name% != Точень) && (%actor.name% != Сэмэн))
  otransform 3754
  osend %actor% Вы не можете поднять такую тяжесть.
  return 0
  halt
else
  wait 1
  oecho __В &Kгробу&n кто-то заворчал.
end
~
#3755
Именной стаф - Баюр~
1 gjp 100
~
if (%actor.level% > 30 ) && (%actor.vnum% == -1 )
  halt
end
if ((%actor.name% != Сновид) && (%actor.name% != Валхар) && (%actor.name% != Баюр))
  otransform 3755
  osend %actor% &WПояс &YВеликого Хана&n вырвался из Ваших рук и снова улегся на землю.
  return 0
  halt
else
  wait 1
end
~
#3756
Именной стаф - Гуслис~
1 gjp 100
~
if (%actor.level% > 30) && (%actor.vnum% == -1)
  halt
end
if ((%actor.name% != Олирия) && (%actor.name% != Гуслис))
  otransform 3756
  osend %actor% Из шкатулки вдруг послышались такие жуткие звуки, что Вы невольно отдернули руки.
  return 0
  halt
else
  wait 1
end
~
#3757
Именной стаф - Гразий~
1 gjp 100
~
if (%actor.level% > 30 ) && (%actor.vnum% == -1 )
  halt
end
if ((%actor.name% != Гразий) && (%actor.name% != Евпараския) && (%actor.name% != Хорыв) && (%actor.name% != Лескун) && (%actor.name% != Богун) && (%actor.name% != Горинка) && (%actor.name% != Посолонь))
  otransform 3757
  osend %actor% Вас &WОГЛУШИЛО&n Богатырским &CМолотом&n при попытке взять мешок.
  return 0
  halt
else
  wait 1
  oecho Вдруг у Вас в &Kмозгу&n мелькнула &RМысль&n: Только не в &yтерновый &Yкуст&n!
  oecho Вокруг &Gлистья&n да &yветки&n, &rтерни&n да &Yколючки&n.
  oecho Вас обвивают &Yострые &yветви&n и Вы начинаете &Wтихонько&n скулить и проситься к &RМАМЕ&n!
end
~
#3758
Именной стаф - Ясленик~
1 gjp 100
~
if (%actor.level% > 30 ) && (%actor.vnum% == -1 )
  halt
end
if ((%actor.name% != Ясленик) && (%actor.name% != Полюд) && (%actor.name% != Бразд) && (%actor.name% != Меламори) && (%actor.name% != Нежана) && (%actor.name% != Леонтий))
  osend %actor%   &YР&yу&gн&Gа&n, начертанная на &Kп&nи&Wт&nо&Kм&nз&Wе&n, вдруг &rзагорелась&n и &Kобожгла&n Вам руку.
  return 0
  halt
end
~
#3759
Именной стафф - Есень~
1 gjp 100
~
say My trigger commandlist is not complete!
~
#3760
Именной стаф - Есугей~
1 gjp 100
~

~
#3761
Именной стафф - Вяхорь~
1 gjp 100
~
if (%actor.level% > 30 ) && (%actor.vnum% == -1 )
  halt
end
if ((%actor.name% != Вяхорь) && (%actor.name% != Дивиш) && (%actor.name% != Витаслав))
  otransform 3761
  osend %actor% Вы попытались поднять &Kавоську&n, но случайно уронили ее, разбив все &gбутылки&n.
  return 0
  halt
end
~
#3762
Именной стафф - Алексей~
1 gjp 100
~
if %actor.level% > 30 && %actor.vnum% == -1
  halt
end
if ((%actor.name% != Алексей) && (%actor.name% != Борай) && (%actor.name% != Казбек) && (%actor.name% != Димитрий) && (%actor.name%!=Будивой) && (%actor.name%!=Внезд))
  otransform 3762
  osend %actor% В %self.dname% что-то &Rразбилось&n и Вы испуганно &Wотдернули руку&n.
  return 0
  halt
else
  wait 1
  oechoaround %actor% Из %self.rname% %actor.rname% послышался звук &rбьющихся &gбутылок&n.
  osend %actor% Вы сделали неловкое движение и из %self.rname% послышался звук бьющихся бутылок.
end
~
#3763
Именной стафф - Лорелея~
1 gjp 100
~
if (%actor.level% > 30 ) && (%actor.vnum% == -1 )
  halt
end
if %actor.name% != Лорелея && %actor.name% != Зоман && %actor.name% != Тайна && %actor.name% != Омагар
  osend %actor% &RРуки &Wубрал, &Kда&M!&C!&B!&n
  return 0
  halt
end
~
#3764
Именной стафф - Одерон~
1 gjp 100
~
if (%actor.level% > 30 ) && (%actor.vnum% == -1 )
  halt
end
if ((%actor.name% != Одерон) && (%actor.name% != Дерон) && (%actor.name% != Плесек) && (%actor.name% != Ядвига))
  otransform 3764
  osend %actor% &YСума &KПлесецкого &RПатруля&n выпала из Ваших рук.
  return 0
  halt
end
~
#3765
Именной шмот - Бойко~
1 gjp 100
~
if %actor.level% > 30 && %actor.vnum% == -1
  halt
end
if %actor.name% != Бойко && %actor.name% != Делвин && %actor.name% != Фарнт 
  otransform 3765
  oechoaround %actor% Глаза &Kчерепа сверкнули &Cмогильным &nсветом и в тот же миг %actor.vname% откинуло невиданой силой мертвых.
  osend %actor% Глаза &Kчерепа &nсверкнули &Cмогильным &nсветом и в тот же миг Вас откинуло невиданой силой мертвых.
  return 0
  halt
else
  wait 1
  oecho Пустые глазницы &Wогромного полого &Kчерепа &nблеснули &Cзамогильным&n светом.
end
~
#3766
Именной шмот - Лойнис~
1 gjp 100
~
if %actor.level% > 30 && %actor.vnum% == -1
  halt
end
if %actor.name% != Лойнис && %actor.name% != Луминар
  otransform 3766
  oechoaround %actor% %actor.name% попытал%actor.u% взять &WМетку &KТемного Двора&n, но та исчезла во тьме, а через несколько секунд вернулась на место.
  osend %actor% Вы попытались взять &WМетку &KТемного Двора&n, но она исчезла во тьме, а через несколько секунд вернулась на место.
  return 0
  halt
else
  wait 1
  switch %random.3%
    case 1
      osend %actor% Неожиданно &KМетка &nпревратилась в &Wбелку&n и уселась Вам на плечо, с азартом грызя &Yорехи&n.
      oechoaround %actor% Неожиданно &KМетка &nпревратилась в &Wбелку&n и уселась Лойнису на плечо, с азартом грызя &Yорехи&n.
    break
    case 2
      osend %actor% &YБелка&n из Вашей &Kметки&n стырила &yшишку&n у соседа и принялась выгрызать из нее &yорехи&n, сидя у Вас на плече.
      oechoaround %actor% Вы почувствовали как что-то дернуло Вас за &Bкарман&n и увидели &Yтолстую ухмылающуюся белку&n.
      oechoaround %actor% Она &Kукрала&n Вашу любимую &gкедровую шишку&n и нагло &Cсгрызает&n ее, сидя у &K%actor.rname%&n на плече.
    break
    case 3
      osend %actor% &KМетка&n в Ваших руках обернулась &Rколодой карт&n и радостно зашуршала.
      oechoaround %actor% &KТемная &Wметка&n %actor.rname% начала &Bменять очертания&n прямо у Вас на глазах. &RКарты&n с рубашкой в виде &Yбелки&n, &mв&Mе&Yс&Gе&Cл&Rо&n зашелестели в руках &Wвладельца&n.
      oechoaround %actor% Как странно... &Rчерви&n - &Kчерные&n, &Kпики&n - &Rкрасные&n. Удивительный &Kчеловек&n.
    break
  done
end
~
#3767
Именной стафф - Шелди~
1 gjp 100
~
if (%actor.level% > 30 ) && (%actor.vnum% == -1 )
  halt
end
if %actor.name% != Шелди && %actor.name% != Яремир && %actor.name% != Тритогор
  otransform 3767
  osend %actor% Вы попытались поднять котомку, но тутже порезали палец об острый камень.
  osend %actor% Вы отдернули руку... &RБольно&n же!
  return 0
  halt
else
  wait 1
  osend %actor% Случайно Вы уронили &yко&Yтом&yку&n на землю и из нее выпала &Wр&nо&Kс&nс&Wы&nп&Kь&n &Cдр&cаг&gоц&Gен&gны&cх к&Cам&Bен&bий&n.
  osend %actor% Вы кинулись собирать &Gизумруды&n, &Wалмазы&n, &rрубины&n и рассовывать их по карманам.
  oechoaround %actor% Шелди споткнулся и уронил свою котомку, осыпав землю &Gизумрудами&n, &Wалмазами&n, &rрубинами&n. Вы жадно наблюдаете, как он собирает &Cдр&cаг&gоц&Gен&gно&cст&Cи&n и рассовывает их по своим безразмерным карманам.
end
~
#3768
Именной шмот - Эйко~
1 gjp 100
~
if %actor.level% > 30 && %actor.vnum% == -1
  halt
end
if %actor.name% != Эйко && %actor.name% != Помир && %actor.name% != Лалена 
  otransform 3768
  oechoaround %actor% %actor.name% попытал%actor.u% завладеть &rЗамершим Пламенем&n, но чуть было не сгорел%actor.g%!
  osend %actor% Едва подумав об этом, Вы всем телом &Rощутили нестерпимый жар&n, исходящий от &rЗамершего Пламени&n. Пожалуй, этого делать не стоит.
  return 0
  halt
else
  wait 1
  oecho Взглянув на &rЗамершее Пламя &nВас обуяло чувство тревоги - кто-то следит за Вами, проникая в самую суть Ваших тайных помыслов!
end
~
#3769
Именной шмот - Жалын~
1 gjp 100
~
if %actor.level% > 30 && %actor.vnum% == -1
  halt
end
if %actor.name% != Жалын && %actor.name% != Доменик 
  otransform 3769
  oechoaround %actor% %actor.name% попытал%actor.u% войти в &cано&Cма&cлию&n, но &Rэнергия&n, вырвавшаяся из нее, лишила %actor.vname% мозга!
  osend %actor% &RЭнергия &rвырвавшаяся из &cано&Cма&cлии &rнакрыл Вас темной вуалью и медленно испепеляет Ваш мозг!&n
  return 0
  halt
else
  wait 1
  osend %actor% &KПотоки энергии вырвались из &cано&Cмал&cии&K, обволокли Ваше тело &Wсверкающим коконом&K.&n
  oechoaround %actor% &KПотоки энергии вырвались из &cано&Cмал&cии&K, обволокли тело Жалына &Wсверкающим коконом&K, глаза его &Yстранно засверкали&K.&n
end
~
#3770
Именной шмот - Пилатий~
1 gjp 100
~
if %actor.level% > 30 && %actor.vnum% == -1
  halt
end
if %actor.name% != Пилатий && %actor.name% != Витрус && %actor.name% != Елизавета && %actor.name% != Горпына && %actor.name% != Раодон && %actor.name% != Савриил 
  otransform 3770
  oechoaround %actor% %actor.name% попытал%actor.u% взять &cС&CИ&cН&CЕ&n-&yЖ&YЕ&yЛ&YТ&YЫ&yЙ&W флаг Украины&n но потерпел%actor.g% неудачу.
  osend %actor% &RСначало прими християнство католик некрещеный!!!&n
  return 0
  halt
else
  wait 1
  oecho Вдруг вся комната осветилась на мгновение &cС&CИ&cН&CЕ&n-&yЖ&YЕ&yЛ&YТ&YЫ&yМ&n цветом.
end
~
#3771
Именной стафф Рольт~
1 gjp 100
~
if (%actor.level% > 30 ) && (%actor.vnum% == -1 )
  halt
end
if ((%actor.name% != Элемир ) && (%actor.name% != Рольт ) && (%actor.name% != Шунька ) && (%actor.name% != Антонина ) && (%actor.name% != Злокраса ) && (%actor.name% != Лариса ))
  otransform 3771
  osend %actor% Протянув руку к суме с вышитым гербом Вольных стрелков, Вы ощутили насколько хорошо быть &RВольным&n. Но Вас это не касается.
  return 0
  halt
else
  wait 1
  oecho Внезапно из &Cсу&cмы &yс в&Yыш&yит&cым &Cге&cрб&yом &RВольных Стрелков&n вырвался &Kпорыв ветра&n и Вы, вдохнув его, о чем то задумались.
end
~
#3772
Именной шмот - Дагомир~
1 gjp 100
~
if %actor.level% > 30 && %actor.vnum% == -1
  halt
end
if %actor.name% != Дагомир && %actor.name% != Колисвет && %actor.name% != Ругий
  otransform 3772
  oechoaround %actor% &RКак только %actor.name% приоткрыл%actor.g% крышку ведерка, пары, вылетевшие из него, крепко ударили %actor.vname% в голову, икнув и крякнув, %actor.name% повалил%actor.u% с ног!&n
  osend %actor% &RКак только Вы приоткрыли крышку ведерка, пары, вылетевшие из него, крепко ударили Вам в голову, икнув и крякнув, Ваши ноги подкосились!&n
  return 0
  halt
else
  wait 1
  oecho &WДо блеска начищенное &Gведро с маленьким краником&n, &yна причудливых ножках &Rпыхтит и гонит первач&n.
end
~
#3773
Именной стафф - Бобр~
1 gjp 100
~
if %actor.level% > 30 && %actor.vnum% == -1
  halt
end
if %actor.name% != Бобрыня && %actor.name% != Ингельд
  otransform 3773
  osend %actor% &YХвост &yбобра&n больно ударил Вас по рукам.
  return 0
  halt
else
  wait 1
  oecho &YХвост &yбобра&n начал извиваться.
end
~
#3774
Именной стаф - Дрегвий~
1 gjp 100
~
if %actor.level% > 30 && %actor.vnum% == -1
  halt
end
if %actor.name% != Дрегвий && %actor.name% != Чернава && %actor.name% != Витовий
  otransform 3774
  osend %actor% Протянув руку к &rсуме&n, Вы тут же испачкали ее в &Rкрови&n. Нечего хватать что попало!
  return 0
  halt
else
  wait 1
  oecho Несколько &mкапель &rкрови&n упало на &Kземлю&n.
end
~
#3775
именной стафф - федяш~
1 gjp 100
~
if %actor.level% > 30 && %actor.vnum% == -1
  halt
end
if %actor.name% != Хникс && %actor.name% != Балаш && %actor.name% != Федяш
  otransform 3775
  osend %actor% Зачем берешь чужой &Wколчан&n? А ну положи на место!
  return 0
else
  wait 1
  oecho &WКолчан удалого стрельца&n озарился &Wбелым светом&n.
end
~
#3776
Именной стаф - Младин~
1 fgjlp 100
~
if ((%actor.level% > 30) && (%actor.vnum% == -1))
  halt
end
switch %random.8%
  case 1
    set word &GЗеленый&n
  break
  case 2
    set word &RКрасный&n
  break
  case 3
    set word &BСиний&n
  break
  case 4
    set word &WБелый&n
  break
  case 5
    set word &YЖелтый&n
  break
  case 6
    set word &CГолубой&n
  break
  case 7
    set word &KСерый&n
  break
  case 8
    set word &MПурпурный&n
  done
  if ((%actor.name% != Младин) && (%actor.name% != Алина) && (%actor.name% != Огонек) && (%actor.name% != Лавале) && (%actor.name% != Лакидар))
    otransform 3776
    osend %actor% &WИз &MС&Gу&Bм&Yк&Cи &Wс &Bвеселыми котятами &Wвыбрался &Bвесело хихикающий&n %word% котёнок.
    osend %actor% &Wобойдя Вас по кругу, котёнок &Mулыбнулся &Wи не прекращая &Bхихикать &Wзалез обратно в &MС&Gу&Bм&Yк&Cу&n.
    oechoaround %actor% &WИз &MС&Gу&Bм&Yк&Cи &Wс &Bвеселыми котятами &Wвыбрался &Bвесело хихикающий&n %word% котёнок.
    oechoaround %actor% &Wобойдя %actor.vname% по кругу, котёнок &Mулыбнулся &Wи не прекращая &Bхихикать залез обратно в &MС&Gу&Bм&Yк&Cу&n.
    return 0
    halt
  end
  set master %self.worn_by%
  wait 1
  *Взяли сумку
  if (%self.carried_by% && %actor% && !%master%)
    osend %actor% %word% котёнок &Wвысунул голову из &MС&Gу&Bм&Yк&Cи &Wи&n радостно замурлыкал увидев Вас.
    oechoaround %actor% %word% котёнок &Wвысунул голову из &MС&Gу&Bм&Yк&Cи &Wи&n радостно замурлыкал увидев %actor.vname%.
    halt
  end
  *Сняли сумку
  if (!%self.worn_by% && %actor% && %self.carried_by% && %master%)
    oecho &WИз &MС&Gу&Bм&Yк&Cи &Wс &Bвеселыми котятами &Wраздалось &Rжалобное мяуканье&n.
    halt
  end
  *Одели сумку-тик
  osend %actor% &WИз &MС&Gу&Bм&Yк&Cи &Wс &Bвеселыми котятами &Wвыглянул %word% котёнок&n &Wи, &Bвесело захихикав&n, &Wпощекотал Вам ухо языком&n.
  osend %actor% &WВы погладили котёнка и ласково затолкали его обратно&n.
  oechoaround %actor% &WИз &MС&Gу&Bм&Yк&Cи &Wс &Bвеселыми котятами &Wвыглянул %word% котёнок &Wи, &Bвесело захихикав&n, &Wпрошептал что-то на ухо %actor.dname%&n.
  oechoaround %actor% &W%actor.name% ласково погладил%actor.g% котёнка и затолкал%actor.g% его обратно&n.
~
#3777
Именной шмот - Линси (ранее Валор)~
1 gjp 100
~
if %actor.level% > 30 && %actor.vnum% == -1
  halt
end
*раньше принадлежала чарам: Иннер Иральда Лизария Далнур, сейчас передана: Линси Делика
if %actor.name% != Линси && %actor.name% != Делика && %actor.name% != Мельтина
  otransform 3777
  oechoaround %actor% %actor.name% попытал%actor.u% взять &yПо&Yяс &cНев&Cской &gохот&Gницы&n, но перетрусил%actor.g%.
  osend %actor% Вы попытались взять &yПо&Yяс &cНев&Cской &gохот&Gницы&n, но Ваши руки как сквозь воздух прошли.
  return 0
  halt
else
  wait 1
  oecho &WВнезапно Вам послышался звук &bмогу&Bчих &bво&Bлн&W, бьющихся о берег &cсвящ&Cенной &cре&Cки.&n
end
~
#3778
Именная сумка - Векомир~
1 gp 100
~
* сумка дана персонажу за помощь Бальдру (вместо славы)
if %actor.level% > 30 && %actor.vnum% == -1
  halt
end
if (%actor.name% != Векомир && %actor.name% != Верег && %actor.name% != Вечерица && %actor.name% != Годомысл && %actor.name% !=Ририк && %actor.name% != Углеша)
  otransform 3778
  oechoaround %actor% %actor.name% попытал%actor.u% поднять &Kнеумело скроенную сумку&n, но та начала разваливаться и он%actor.g%, неудержав, уронил%actor.g% ее.
  osend %actor% Вы попытались взять &Kнеумело скроенную сумку&n, но та начала разваливаться и Вам пришлось ее бросить.
  return 0
  halt
else
  wait 1
  %send% %actor% &KНеумело скроенная сумка&n затрещала по швам в Ваших руках.
  %echoaround% %actor% &KНеумело скроенная сумка&n затрещала по швам в руках %actor.rname%.
end
~
#3779
Именной шмот - Шышок~
1 gjp 100
~
if %actor.level% > 30 && %actor.vnum% == -1
  halt
end
if %actor.name% != Поморя && %actor.name% != Валява && %actor.name% != Токихаша && %actor.name% != Шышок && %actor.name% != Кабал && %actor.name% != Хаук && %actor.name% != Зульфия
  otransform 3779
  oecho &WВНЕЗАПНО! &nС&nт&cран&nна&Wя &nба&cнк&nа &Wначала поглощать все вокруг!&n 
  return 0
  halt
else
  wait 1 
  oecho &WВНЕЗАПНО! &nС&nт&cран&nна&Wя &nба&cнк&nа &Wначала поглощать все вокруг!&n 
end
~
#3780
Именная сумка - Мангас~
1 gjp 100
~
if ((%actor.level% > 30) && (%actor.vnum% == -1))
  halt
end
if ((%actor.name% != Мангас) && (%actor.name% != Венцеслава) && (%actor.name% != Князеслав) && (%actor.name% != Схимон) && (%actor.clan% != вз))
  otransform 3780
  osend %actor% &YМ&Wе&Yш&Wо&Yк &Wс &Yр&Wи&Yс&Wо&Yм&n оказался слишком тяжелым и Вы решили не надрываться.
  return 0
  halt
end
~
#3781
Именной стафф - Гранислав~
1 gjp 100
~
if %actor.level% > 30 && %actor.vnum% == -1
  halt
end
if %actor.name% != Гранислав && %actor.name% != Рауд && %actor.name% != Грида
  otransform 3781
  osend %actor% &RВолчонок&n на рюкзачке вдруг ожил, прекратил чесаться и чувствительно цапнул Вас за палец.
  %echoaround% %actor% &RВолчонок&n на рюкзачке вдруг ожил, прекратил чесаться и цапнул %actor.rname% за палец.
  return 0
  halt
else
  wait 1
  oecho &RВолчонок&n принюхался и одобрительно заворчал, предчувствуя добычу.
end
* Сумка создана за помощь в написании тригов. В случае вопросов обращаться к Бальдру.
~
#3782
Именной стафф - Сагудор~
1 gp 100
~
if ((%actor.level% > 30) && (%actor.vnum% == -1))
  halt
end
if %actor.name% != Сагудор
  otransform 3782
  osend %actor% &yБаул&n надулся, поднялся и попытался &Rцапнуть&n Вас за руку.
  return 0
  halt
else
  wait 1
  %echoaround% %actor% &yРыжий баул&n оказался в руках Сагудора, повинуясь его приказу.
  osend %actor% &yРыжий баул&n оказался в Ваших руках, повинуясь приказу.
  halt
end
~
#3783
Именной стаф -- Завлада~
1 gjpr 100
~
if ((%actor.level% > 30) && (%actor.vnum% == -1))
  halt
end
if ((%actor.name% != Завлада) && (%actor.name% != Смирн) && (%actor.name% != Резван) && (%actor.name% != Рикка) && (%actor.name% != Смирон))
  otransform 3783
  osend %actor% Из &Yяр&yко&gй с&Gум&Cы ф&cок&Bус&bни&Kка&n показался заяц и, цапнув Вас за палец, спрятался назад.
  return 0
  halt
end
~
#3784
Именной стафф -- Ольгерд~
1 gjpr 100
~
if (%actor.level% > 30 ) && (%actor.vnum% == -1 )
  halt
end
if ((%actor.name% != Веденей) && (%actor.name% != Искандер) && (%actor.name% != Родни) && (%actor.name% != Ольгерд) && (%actor.name% != Лисьяк))
  otransform 3784
  osend %actor% Как только Вы протянули руку к неприметному поясу, Вас охватила ужасная слабость, коленки подогнулись, а пояс окутался &Wдвумя струями пара&n с &Wв&Rк&Yр&Wа&Rп&Yл&Wе&Rн&Yи&Wе&Rм &rсгустков &Rп&Yл&Rа&Yм&Rе&Yн&Rи&n.
  return 0
  halt
else
  wait 1
  switch %random.5%
    case 1
      oecho Неприметный пояс зашелестел, как будто &cче&gшу&cя о&gгр&cом&gно&cй р&gеп&cтил&gии&n скользнула по гравию.
    break
    case 2
      oechoaround %actor% &GГ&Kла&Gз&n на поясе %actor.rname% беспокойно завращался, будто бы ища Вас взглядом.
      osend %actor% &GГ&Kла&Gз&n на Вашем поясе беспокойно завращался высматривая кого-то.
    break
    case 3
      oechoaround %actor% &GГ&Kла&Gз&n на неприметном поясе вдруг уставился на Вас, и вы почувствовали смутное беспокойство: а не пора ли тикать???
      osend %actor% &GГ&Kла&Gз&n на неприметном поясе устрашающе уставился на кого-то.
    break
  done
end
~
#3785
Именной стаф - омельян~
1 gjp 100
~
if ((%actor.level% > 30) && (%actor.vnum% == -1))
  halt
end
if ((%actor.name% != Гудеяр) && (%actor.name% != Амвросий) && (%actor.name% != Омина) && (%actor.name% != Омельян))
  otransform 3785
  osend %actor% Вы попытались поднять чужую &Wсуму&n, но из нее случайно выпала &Rотрубленная &Kлапа&n и Вы в ужасе отшатнулись.
  return 0
  halt
else
  switch %random.3%
    case 1
      oecho Несколько &rбагровых&n капель сорвалось с &Rокр&rов&Rавл&rен&Rной&n &Wсумы &Kживодера&n.
    break
    case 2
      oecho Из &Rокр&rов&Rавл&rен&Rной &Wсумы &Kживодера&n случайно вывалился &rобрубок&n лапы.
    break
    case 3
      oecho Из &Rокр&rов&Rавл&rен&Rной &Wсумы &Kживодера&n послышался едва слышный &Kстон&n.
    break
  done
end
~
#3786
именной стафф - Кайнур~
1 gjp 100
~
if ((%actor.level% > 30) && (%actor.vnum% == -1))
  halt
end
if ((%actor.name% != Кайнур) &&& (%actor.name% != Алатор) && (%actor.name% != Регат))
  otransform 3786
  osend %actor% &RКалита&n съежилась, скукожилась и закричала - " Не трожь меня, окаянный! Ато оторву окaянный отросток! "
  return 0
  halt
end
~
#3787
Именной стафф - Блажена~
1 gjp 100
~
if ((%actor.level% > 30) && (%actor.vnum% == -1))
  halt
end
if ((%actor.name% != Блажена) && (%actor.name% != Орвин) && (%actor.name% != Патап))
  otransform 3787
  osend %actor% На мгновение у Вас появилась &RСовесть&n, которая не позволила Вам взять чужую вещь.
  return 0
  halt
end
~
#3788
Именной стафф - Благомир~
1 gjp 100
~
if ((%actor.level% > 30) && (%actor.vnum% == -1))
  halt
end
if ((%actor.name% != Благомир) && (%actor.name% != Блажич) && (%actor.name% != Ветолик) && (%actor.name% != Эрих) && (%actor.name% != Миломир) && (%actor.name% != Целимир) && (%actor.name% != Левша))
  otransform 3788
  oecho Из кармана показалась рука, сложенная в фигу,  и тут же спряталась обратно.
  return 0
  halt
end
~
#3789
Именной стафф - Эстор~
1 gjp 100
~
if ((%actor.level% > 30) && (%actor.vnum% == -1))
  halt
end
if ((%actor.name% != Эстор) && (%actor.name% != Морхолт) && (%actor.name% != Антарис) && (%actor.name% != Малагант) && (%actor.name% != Бранген) && (%actor.name% != Глаймон) && (%actor.name% != Вячеслав))
  otransform 3789
  &WСфе&Kра И&Wсто&Kрии &cСоз&Cдан&cия М&Cира&n ослепила Вас своим сиянием и Вы отдернули руку.
  return 0
  halt
else
  switch %random.3%
    case 1
      oecho %actor.name% достал &WСферу&n и начал вертеть ее на ладонях, Вы почувствовали, как все вокруг меняется, пропадают Ваши силы, изчезают перевоплощения и Вы становитесь ребенком.
    break
    case 2
      oecho &WСфера&n &Rвспыхнула&n и перед Вами начался калейдоскоп картинок: вот строится Киев, вот Татарская орда умирает от стрел Росичей и Вы видите огромного Черного Змея что летит жечь воинов ратных.
    break
    case 3
      oecho Неожиданно &WСфера&n превратилась в огромный шар &CМира&n, на котором %actor.name% стал двигать континенты и моря, радостно хихикая от проделываемых им разрушений.
    break
  done
end
~
#3790
Именной стафф - дарсия~
1 gjp 100
~
if (%actor.level% > 30 ) && (%actor.vnum% == -1 )
  halt
end
if ((%actor.name% != Дарсий ) && (%actor.name% != Меля ) && (%actor.name% != Дарса ) && (%actor.name% != Мелес))
  otransform 3790
  osend %actor% Не &RВаш&n карман, не &RВам&n в него и &Yлезть&n!
  return 0
  halt
else
  wait 1
  oecho &cЧе&Cшуй&cки&n на кармане Дарсия пошли &Rпе&Yре&Mли&Rвч&Yат&Mой &Rво&Yлн&Mой&n, и в глубине протаяли &Gзеленые&n глаза &Rдракона&n.
end
~
#3791
Именной стаф Наська~
1 gj 100
~
wait 2s
oecho С &Kчерного &Kсер&rдца &RВа&rсил&Kисы&n скатилась &Rка&rпл&Rя к&rро&Rви&n - &cСл&Cез&cа В&Cеч&cно&Cст&cи.&n
~
#3792
Именной стаф - Азалия~
1 gjp 100
~
if (%actor.level% > 30 ) && (%actor.vnum% == -1 )
  halt
end
if ((%actor.name% != Азалия )
  otransform 3792
  osend %actor% &YЧемоданчик &Bиз тушки &Rконя&n отскочил в сторону.
  return 0
  halt
else
  wait 1
  oecho Из &Yчемоданчика &Bиз тушки &Rконя&n послышалось жалобное ржание.
end
~
#3793
Именной стаф - Неруб~
1 gjp 100
~
if (%actor.level% > 30 ) && (%actor.vnum% == -1 )
  halt
end
if ((%actor.name% != Окромий ) && (%actor.name% != Кудояр ) && (%actor.name% != Бурен ) && (%actor.name% != Неруб ))
  otransform 3793
  osend %actor% &KГроб&n приоткрылся, из него вылезла большая &RЛетучая мышь&n и тяпнула Вас за руку... "Лучше не совать руки в &Wподозрительные предметы&n" - отметили Вы.
  return 0
  halt
else
  wait 1
  oecho &RТаинственные знаки&n &Yвспыхнули&n и медленно погрузили комнату &Kво мрак&n.
end
~
#3794
именной стафф - Пулана~
1 gjp 100
~
if (%actor.level% > 30 ) && (%actor.vnum% == -1 )
  halt
end
if ((%actor.name% != Родобор ) && (%actor.name% != Пулана ) && (%actor.name% != Ксей ) && (%actor.name% != Вамор) && (%actor.name% != Лостра))
  otransform 3794
  osend %actor% &WЗа&nяч&Kьи &nла&Wпы&n, выросшие из &Rсумки&n, чуть было не сломали Вам &Gчелюсть&n, и Вы сразу бросили ее &Kназемь&n.
  return 0
  halt
end
~
#3795
Именной стафф - Мосяго~
1 gjp 100
~
if (%actor.level% > 30 ) && (%actor.vnum% == -1 )
  halt
end
if ((%actor.name% != Мосяга ) && (%actor.name% != Дурмана ))
  otransform 3795
  osend %actor% &rНе стоит брать чужое, вдруг там что-то запрещенное!&n
  return 0
  halt
else
  wait 1
  oecho Из &Gто&gрб&Gы д&gля &Gши&gш&Gек&n послышался &Kстранный смешок&n.
end
~
#3796
Именной стаф - Дэлмин~
1 gjp 100
~
if (%actor.level% > 30 ) && (%actor.vnum% == -1 )
  halt
end
if ((%actor.name% != Дэлмин ) && (%actor.name% != Храна ) && (%actor.name% != Златан ) && (%actor.name% != Даний ) && (%actor.name% != Ольран ) && (%actor.name% != Осока ) && (%actor.name% != Длеся ) && (%actor.name% != Геленд ))
  otransform 3796
  osend %actor% Вы попробовали поднять &bсине&K-&rгранатовую &bсумку&n, но это оказалось Вам не под силу.
  return 0
  halt
else
  wait 1
  osend %actor% Вы начали собирать все трофеи в &bсине&K-&rгранатовую &bсумку.&n.
  oechoaround %actor% %actor.iname% начал%actor.g% собирать все трофеи в &bсине&K-&rгранатовую &bсумку&n.
end
~
#3797
Форс-триггер #2~
1 b 5
~
*&RПРОСЬБА: копировать кейсы для других внумов с первого&n
eval objname %self.name%
eval owner %self.carried_by%
if !%owner%
  halt
end
switch %self.vnum%
  case 3739
    if (%owner.name% != Саний)
      wait 1
      oforce %owner% бросить %objname.car%.%objname.cdr%
      halt
    end
  break
  case 3741
    if ((%owner.name% != Вадиар) && (%owner.name% != Аврима))
      wait 1
      oforce %owner% бросить %objname.car%.%objname.cdr%
      halt
    end
  break
  case 3744
    if ((%owner.name% != Делт) && (%owner.name% != Карл) && (%owner.name% != Иван) && (%owner.name% != Гиффор))
      wait 1
      oforce %owner% бросить %objname.car%.%objname.cdr%
      halt
    end
  break
  case 3745
    if (%owner.name% != Талгат)
      wait 1
      oforce %owner% бросить %objname.car%.%objname.cdr%
      halt
    end
  break
  case 3746
    if ((%owner.name% != Римелика) && (%owner.name% != Агафья) && (%owner.name% != Улар) && (%owner.name% != Милариса))
      wait 1
      oforce %owner% бросить %objname.car%.%objname.cdr%
      halt
    end
  break
  case 3747
    if ((%owner.name% != Василиса) && ((%owner.name% != Элиза) && (%owner.name% != Мируша) && (%owner.name% != Ярина) && (%owner.name% != Тхарна))
      wait 1
      oforce %owner% бросить %objname.car%.%objname.cdr%
      halt
    end
  break
  case 3748
    if (%owner.name% != Дельфа) && (%owner.name% != Скаррон)
      wait 1
      oforce %owner% бросить %objname.car%.%objname.cdr%
      halt
    end
  break
  case 3749
    if ((%owner.name% != Сиррон) && (%owner.clan% != нво))
      wait 1
      oforce %owner% бросить %objname.car%.%objname.cdr%
      halt
    end
  break
  case 3750
    if (%owner.name% != Вимор)
      wait 1
      oforce %owner% бросить %objname.car%.%objname.cdr%
      halt
    end
  break
  case 3752
    if ((%owner.name% != Кьяра) && (%owner.name% != Дэрсин) && (%owner.name% != Коруна) && (%owner.name% != Вистар))
      wait 1
      oforce %owner% бросить %objname.car%.%objname.cdr%
      halt
    end
  break
  case 3753
    if ((%owner.name% != Сигвард) && (%owner.name% != Загир) && (%owner.name% != Илледан))
      oforce %owner% бросить %objname.car%.%objname.cdr%
      halt
    end
  break
  case 3754
    if ((%owner.name% != Штайн) && (%owner.name% != Ховард) && (%owner.name% != Саббах) && (%owner.name% != Точень) && (%owner.name% != Сэмэн))
      oforce %owner% бросить %objname.car%.%objname.cdr%
      halt
    end
  break
  case 3755
    if ((%owner.name% != Сновид) && (%owner.name% != Валхар) && (%owner.name% != Баюр))
      oforce %owner% бросить %objname.car%.%objname.cdr%
      halt
    end
  break
  case 3756
    if ((%owner.name% != Олирия) && (%owner.name% != Гуслис))
      oforce %owner% бросить %objname.car%.%objname.cdr%
      halt
    end
  break
  case 3757
    if ((%owner.name% != Гразий) && (%owner.name% != Хорыв) && (%owner.name% != Лескун) && (%owner.name% != Евпараския) && (%owner.name% != Богун) && (%owner.name% != Горинка) && (%owner.name% != Посолонь))
      oforce %owner% бросить %objname.car%.%objname.cdr%
      halt
    end
  break
  case 3758
    if ((%owner.name% != Ясленик) && (%owner.name% != Полюд) && (%owner.name% != Бразд) && (%owner.name% != Меламори) && (%owner.name% != Нежана) && (%owner.name% !
      oforce %owner% бросить %objname.car%.%objname.cdr%
      halt
    end
  break
  case 3763
    if %owner.name% != Лорелея && %owner.name% != Зоман && %owner.name% != Тайна && %owner.name% != Омагар
      oforce %owner% бросить %objname.car%.%objname.cdr%
      halt
    end
  break
  case 3764
    if ((%owner.name% != Одерон) && (%owner.name% != Дерон) && (%owner.name% != Плесек) && (%owner.name% != Ядвига))
      oforce %owner% бросить %objname.car%.%objname.cdr%
      halt
    end
  break
  case 3767
    if ((%owner.name% != Шелди && %owner.name% != Яремир && %owner.name% != Тритогор))
      oforce %owner% бросить %objname.car%.%objname.cdr%
      halt
    end
  break
  case 3774
    if ((%owner.name% != Чернава) && (%owner.name% != Витовий) && (%owner.name% != Дрегвий))
      oforce %owner% бросить %objname.car%.%objname.cdr%
      halt
    end
  break
  case 3780
    if ((%owner.name% != Мангас) && (%owner.name% != Венцеслава) && (%owner.name% != Схимон) && (%owner.name% != Князеслав) && (%owner.clan% != вз))
      oforce %owner% бросить %objname.car%.%objname.cdr%
      halt
    end
  break
done
~
#3798
Выдача именного шмота~
0 q 100
~
return 1
wait 1
if ((%actor.name% == Ронари) || (%actor.name% == Бридт))
  if (%world.curobjs(3700)% == 0)
    say Сгинь, сгинь, пропади!
    ужас
    mload obj 3700
    дать рот .%actor.name%
    брысь .Ронари
  end
elseif %actor.name% == Коннор
  if (%world.curobjs(3701)% == 0)
    say Ааа, %actor.name%! Вот ваша сума, не пропала.
    mload obj 3701
    дать сума .%actor.name%
  end
elseif %actor.name% == Огнезара
  if (%world.curobjs(3702)% == 0)
    say А, Огнезара... Вот твоя сума, забирай, а то брандмейтер пожарной команды протестует.
    mload obj 3702
    дать сума .%actor.name%
  end
elseif %actor.name% == Рудко
  if (%world.curobjs(3703)% == 0)
    emote крест
    say А это ты %actor.name%, вот держи свою сумку!
    mload obj 3703
    дать сумка .%actor.name%
  end
elseif %actor.name% == Еска
  if (%world.curobjs(3704)% == 0)
    виз
    mload obj 3704
    дать торба .%actor.name%
    пока .Клара
  end
elseif ((%actor.name% == Эрфис) || (%actor.name% == Сонгай))
  if (%world.curobjs(3705)% == 0)
    поклон .Эрфис
    emot достал мелкую рыбешку и начал ее потрошить
    mload obj 3705
    дать желудок .%actor.name%
  end
elseif ((%actor.name% == Ведрусса) || (%actor.name% == Руська))
  if (%world.curobjs(3706)% == 0)
    say А, %actor.name% припожаловала! Забирай свою торбу, она тут все полки когтями исцарапала и сметану клянчит.
    mload obj 3706
    дать сум .%actor.name%
  end
elseif %actor.name% == Ледогост
  if (%world.curobjs(3707)% == 0)
    ухм
    emot заговорщицки подмигнул Вам
    mload obj 3707
    дать торб .%actor.name%
  end
elseif %actor.name% == Херуба
  if (%world.curobjs(3708)% == 0)
    mload obj 3708
    дать зеркало .%actor.name%
  end
elseif %actor.name% == Кудряш
  if (%world.curobjs(3709)% == 0)
    mload obj 3709
    привет
    дать шку .%actor.name%
  end
elseif %actor.name% == Иттарио || %actor.name% == Густав || %actor.name% == Кельс
  if (%world.curobjs(3710)% == 0)
    mload obj 3710
    кивн
    дать сум .%actor.name%
  end
elseif %actor.name% == Тилана
  if (%world.curobjs(3711)% == 0)
    mload obj 3711
    дать сум .%actor.name%
  end
elseif %actor.name% == Вултор
  if (%world.curobjs(3712)% == 0)
    mload obj 3712
    дать сум .%actor.name%
    emot вытер руки тряпицей
  end
elseif ((%actor.name% == Татиана) || (%actor.name% == Ордан) || (%actor.name% == Ольша) || (%actor.name% == Фока))
  if (%world.curobjs(3713)% == 0)
    mload obj 3713
    дать лукош .%actor.name%
    миг .%actor.name%
  end
elseif %actor.name% == Эйнар
  if (%world.curobjs(3714)% == 0)
    mload obj 3714
    дать сум .%actor.name%
  end
elseif %actor.name% == Полосний
  if (%world.curobjs(3715)% == 0)
    mload obj 3715
    дать боты .%actor.name%
  end
elseif %actor.name% == Тешигнев
  if (%world.curobjs(3718)% == 0)
    mload obj 3718
    дать сум .%actor.name%
  end
elseif %actor.name% == Витрир || %actor.name% == Волонд || %actor.name% == Ломко
  if (%world.curobjs(3719)% == 0)
    mload obj 3719
    дать кошель .%actor.name%
  end
elseif %actor.name% == Асгард
  if (%world.curobjs(3720)% == 0)
    mload obj 3720
    дать тайник .%actor.name%
  end
elseif %actor.name% == Кронгнир
  if (%world.curobjs(3721)% == 0)
    mload obj 3721
    дать котом .%actor.name%
  end
elseif %actor.name% == Хрон
  if (%world.curobjs(3722)% == 0)
    mload obj 3722
    дать футляр .%actor.name%
  end
elseif %actor.name% == Савватий
  if (%world.curobjs(3723)% == 0)
    mload obj 3723
    дать ягдташ .%actor.name%
  end
elseif %actor.name% == Воян
  if (%world.curobjs(3724)% == 0)
    mload obj 3724
    дать аптеч .%actor.name%
  end
elseif ((%actor.name% == Улук) || (%actor.name% == Шахрух))
  if (%world.curobjs(3725)% == 0)
    mload obj 3725
    дать кошел .%actor.name%
  end
elseif %actor.name% == Эстери
  if (%world.curobjs(3726)% == 0)
    mload obj 3726
    дать дыра .%actor.name%
  end
elseif %actor.name% == Тикен
  if (%world.curobjs(3727)% == 0)
    mload obj 3727
    дать сум .%actor.name%
  end
elseif %actor.name% == Сариус
  if (%world.curobjs(3728)% == 0)
    mload obj 3728
    дать крок .%actor.name%
  end
elseif ((%actor.name% == Ромес) || (%actor.name% == Лодин) || (%actor.name% == Зрина))
  if (%world.curobjs(3729)% == 0)
    mload obj 3729
    дать сум .%actor.name%
    halt
  end
elseif %actor.name% == Ахмед
  if (%world.curobjs(3730)% == 0)
    mload obj 3730
    дать баул .%actor.name%
  end
elseif %actor.name% == Сивиль
  if (%world.curobjs(3736)% == 0)
    mload obj 3736
    дать сум .%actor.name%
  end
elseif %actor.name% == Саний
  if (%world.curobjs(3739)% == 0)
    mload obj 3739
    дать мясору .%actor.name%
  end
elseif ((%actor.name% == Иван) || (%actor.name% == Делт) || (%actor.name% == Карл) || (%actor.name% == Гиффор))
  if (%world.curobjs(3744)% == 0)
    mload obj 3744
    дать сетка .%actor.name%
    ухм .%actor.name%
  end
elseif %actor.name% == Вадиар
  if (%world.curobjs(3741)% == 0)
    mload obj 3741
    дать колча .%actor.name%
    halt
  end
elseif %actor.name% == Талгат
  if (%world.curobjs(3745)% == 0)
    mload obj 3745
    дать тулун .%actor.name%
    halt
  end
elseif ((%actor.name% == Римелика) || (%actor.name% == Улар) || (%actor.name% == Агафья) || (%actor.name% == Милариса))
  if (%world.curobjs(3746)% == 0)
    mload obj 3746
    дать тучка .%actor.name%
    halt
  end
elseif ((%actor.name% == Василиса) || (%actor.name% == Ярина) || (%actor.name% == Мируша) || (%actor.name% == Тхарна))
  if (%world.curobjs(3747)% == 0)
    mload obj 3747
    дать сумка .%actor.name%
    halt
  end
elseif %actor.name% == Дельфа && %actor.name% == Скаррон
  if (%world.curobjs(3748)% == 0)
    mload obj 3748
    дать ридикюль .%actor.name%
  end
elseif %actor.name% == Сиррон
  if (%world.curobjs(3749)% == 0)
    mload obj 3749
    дать сума .%actor.name%
  end
elseif %actor.name% == Вимор
  if (%world.curobjs(3750)% == 0)
    mload obj 3750
    дать сунду .%actor.name%
  end
elseif ((%actor.name% == Кьяра) || (%actor.name% == Дэрсин) || (%actor.name% == Коруна) || (%actor.name% == Вистар))
  if (%world.curobjs(3752)% == 0)
    say Ириска пришла.
    mload obj 3752
    дать кармаш .%actor.name%
  end
elseif ((%actor.name% == Сигвард) || (%actor.name% == Загир) || (%actor.name% == Илледан))
  if (%world.curobjs(3753)% == 0)
    ухм
    mload obj 3753
    дать сумка .%actor.name%
  end
end
~
#3799
Форс-триггер~
1 b 5
~
eval objname %self.name%
eval owner %self.carried_by%
if !%owner%
  halt
end
switch %self.vnum%
  case 3700
    if ((%owner.name% != Ронари) && (%owner.name% != Бридт) && (%owner.name% != Хэйсар))
      wait 1
      oforce %owner% бросить %objname.car%.%objname.cdr%
      halt
    end
  break
  case 3701
    if %owner.name% != Коннор
      wait 1
      oforce %owner% бросить %objname.car%.%objname.cdr%
      halt
    end
  break
  case 3702
    if %owner.name% != Огнезара
      wait 1
      oforce %owner% бросить %objname.car%.%objname.cdr%
      halt
    end
  break
  case 3703
    if %owner.name% != Рудко
      wait 1
      oforce %owner% бросить %objname.car%.%objname.cdr%
      halt
    end
  break
  case 3704
    ________if %owner.name% != Еска
    oforce %owner% бросить %objname.car%.%objname.cdr%
    halt
  end
break
case 3705
  if ((%owner.name% != Эрфис) && (%owner.name% != Сонгай))
    oforce %owner% бросить %objname.car%.%objname.cdr%
    halt
  end
break
case 3706
  if ((%owner.name% != Ведрусса) && (%owner.name% != Руська) && (%owner.name% != Солейна))
    oforce %owner% бросить %objname.car%.%objname.cdr%
    halt
  end
break
case 3707
  if %owner.name% != Ледогост
    oforce %owner% бросить %objname.car%.%objname.cdr%
    halt
  end
break
case 3708
  if %owner.name% != Херуба
    oforce %owner% бросить %objname.car%.%objname.cdr%
    halt
  end
break
case 3709
  if %owner.name% != Кудряш
    oforce %owner% бросить %objname.car%.%objname.cdr%
    halt
  end
break
case 3710
  if %owner.name% != Иттарио && %owner.name% != Густав && %owner.name% =! Кельс
    oforce %owner% бросить %objname.car%.%objname.cdr%
    halt
  end
break
case 3711
  if ((%owner.name% != Тилана) && (%actor.clan% != вз))
    oforce %owner% бросить %objname.car%.%objname.cdr%
    halt
  end
break
case 3712
  if %owner.name% != Вултор
    oforce %owner% бросить %objname.car%.%objname.cdr%
    halt
  end
break
case 3713
  if ((%owner.name% != Татиана) && (%owner.name% != Ордан) && (%owner.name% != Ольша) && (%owner.name% != Фока))
    oforce %owner% бросить %objname.car%.%objname.cdr%
    halt
  end
break
case 3714
  if ((%owner.name% != Эйнар) && (%owner.name% != Абай) && (%owner.name% != Ерлан) && (%owner.name% != Зилд))
    oforce %owner% бросить %objname.car%.%objname.cdr%
  end
  halt
break
case 3715
  if %owner.name% != Полосний
    oforce %owner% бросить %objname.car%.%objname.cdr%
  end
  halt
break
case 3716
  if ((%owner.name% != Альмир) && (%owner.name% != Лоримак) && (%owner.name% != Ларустар))
    oforce %owner% бросить %objname.car%.%objname.cdr%
  end
  halt
break
case 3717
  if %owner.name% != Козька
    oforce %owner% бросить %objname.car%.%objname.cdr%
  end
  halt
break
case 3718
  if %owner.name% != Тешигнев
    oforce %owner% бросить %objname.car%.%objname.cdr%
  end
  halt
break
case 3719
  if %owner.name% != Витрир && %owner.name% != Волонд && %owner.name% != Ломко
    oforce %owner% бросить %objname.car%.%objname.cdr%
  end
  halt
break
case 3720
  if ((%owner.name% != Асгард) && (%owner.clan% != нд) && (%owner.clan% != вд) && (%owner.clan% != гд))
    oforce %owner% бросить %objname.car%.%objname.cdr%
  end
  halt
break
case 3721
  if %owner.name% != Кронгнир
    oforce %owner% бросить %objname.car%.%objname.cdr%
  end
  halt
break
case 3722
  if %owner.name% != Хрон
    oforce %owner% бросить %objname.car%.%objname.cdr%
  end
  halt
break
case 3723
  if ((%owner.name% != Савватий) && (%owner.name% != Алькира) && (%owner.name% != Тарик) && (%owner.clan% != рсп))
    oforce %owner% бросить %objname.car%.%objname.cdr%
  end
  halt
break
case 3724
  if %owner.name% != Воян
    oforce %owner% бросить %objname.car%.%objname.cdr%
  end
  halt
break
case 3725
  if ((%owner.name% != Улук) && (%owner.name% != Шахрух) && (%actor.clan% != дов))
    oforce %owner% бросить %objname.car%.%objname.cdr%
  end
  halt
break
case 3726
  if ((%owner.name% != Мадрак) && (%owner.name% != Эстери) && (%actor.clan% != вз))
    wait 1
    oforce %owner% бросить %objname.car%.%objname.cdr%
  end
  halt
break
case 3727
  if (%owner.name% != Тикен) && (%owner.name% != Ролонд)
    oforce %owner% бросить %objname.car%.%objname.cdr%
  end
  halt
break
case 3728
  if (%owner.name% != Сариус)
    oforce %owner% бросить %objname.car%.%objname.cdr%
  end
  halt
break
case 3729
  if ((%owner.name% != Ромес) && (%owner.name% != Лодин) && (%owner.name% != Зрина))
    oforce %owner% бросить %objname.car%.%objname.cdr%
  end
  halt
break
case 3730
  if %owner.name% != Ахмед
    oforce %owner% бросить %objname.car%.%objname.cdr%
  end
  halt
break
case 3736
  if ((%owner.name% != Сивиль) && (%owner.name% != Севиль))
    oforce %owner% бросить %objname.car%.%objname.cdr%
    otransform 3736
  end
  halt
break
done
~
$~
