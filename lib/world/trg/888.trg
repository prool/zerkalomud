#88800
столб сдох~
0 f 100
~
mecho _Пыль разлетелась по дальним углам.
if ((%world.curobjs(88822)% < 1) && (%random.100% < 5))
  mload obj 88822
end
~
#88801
сгусток сдох~
0 f 100
~
if ((%world.curobjs(88823)% < 1) && (%random.100% < 6))
  mload obj 88823
end
~
#88802
мелкий камнеед сдох~
0 f 100
~
return 0
mecho _Камнеед в последний раз щелкнул зубами и затих.
if ((%world.curobjs(88824)% < 3) && (%random.100% < 14))
  mload obj 88824
end
~
#88803
крупный камнеед сдох~
0 f 100
~
if ((%world.curobjs(88825)% < 3) && (%random.100% < 14))
  mload obj 88825
end
~
#88804
цепи сдохли~
0 f 100
~
if ((%world.curobjs(88826)% < 4) && (%random.100% < 15))
  mload obj 88826
end
~
#88805
гриб сдох~
0 f 100
~
mecho _Гриб лопнул, разбросав обрывки кожицы, туча &yспор&n поднялась в воздух.
foreach pokomu %self.pc%
  eval damag %pokomu.hitp%/5 + 50
  msend %pokomu% _&yСпоры&n попали вам в нос и осели на коже.&n
  mdamage %pokomu% %damag%
  if (%random.100% < 34)
    msend %pokomu% _&rВы чувствуете, как грибной яд проникает в ваше тело.&n
    mechoaround %pokomu% _%pokomu.name% отравлен%pokomu.a% грибным ядом !
    dg_affect %pokomu.name% сила яд -5 800
    dg_affect %pokomu.name% яд яд 30 800
  end
done
if ((%world.curobjs(88827)% < 1) && (%random.100% < 11))
  mload obj 88827
end
~
#88806
цвиль сдохла~
0 f 100
~
if ((%world.curobjs(88828)% < 2) && (%random.100% < 11))
  mload obj 88828
end
~
#88807
рабы швыряются камнями~
0 k 50
~
wait 5s 
set vkogo %random.pc% 
if ((%vkogo%) && (%self.position% >= 7))
  eval damag %vkogo.hitp%/3 + 150
  msend %vkogo% _&RРаб схватил огромный камень и швырнул его в вас !&n
  mechoaround %vkogo% _Раб схватил огромный камень и швырнул его в %vkogo.vname% !
  mdamage %vkogo% %damag%
end
return 1
~
#88808
лоад стаи жирных крыс~
2 h 100
~
if (%object.type% != 19) 
  halt
end
wait 1
if (%random.100% <= 51)
  wecho _Запах еды разнесся по подземелью...
  foreach yemob %self.npc%
    if (%yemob.vnum% == 88820)
      wecho _Черная крыса мгновенно сожрала %object.vname%.
      wpurge %object%       
      halt
    end
  done
  wait 1s
  wecho _...но рядом не оказалось живности, которая бы могла им заинтересоваться.
else 
  wait 1s
  wecho _Целая стая крыс, привлеченных запахом еды, выскочила из-за угла !
  eval gryzt %random.pc% 
  wload mob 88826
  calcuid rats 88826 mob
  wforce %rats% mkill %gryzt%
  detach 88808 %self.id%
end
~
#88809
лоад призраков~
2 e 100
~
wait 1
wait %random.5%s
switch %random.2%
  case 1
    if (%world.curmobs(88829)% < 12)
      wecho _Тьма за Вашей спиной сгустилась в черного призрака.
      wload mob 88829
    end
  break
  case 2
    if (%world.curmobs(88828)% < 12)
      wecho _Клочья невесть откуда взявшегося тумана превратились в белесого призрака.
      wload mob 88828
    end
  break
done
detach 88809 %self.id%
~
#88810
выключение лоада призраков~
2 c 1
разнести разбить расколотить~
wait 1
if !%exist.obj(88832)%
  detach 88810 %self.id%
  halt
end
if (!%arg.contains(горку)% && !%arg.contains(горка)%)
  wsend %actor% _Что крушить-то будем?
  return 0
  halt
end
wsend %actor% _Вы что есть силы грохнули по костям и разбили их на мелкие осколки.
wechoaround %actor% _%actor.name% что есть силы грохнул%actor.g% по костям и разбил%actor.g% их на мелкие осколки.
calcuid gorkakostey 88832 obj
wpurge %gorkakostey.id%
wait 1
wecho _В наступившей затем тишине вам послышался вздох облегчения.
calcuid prizraki55 88855 room
detach 88809 %prizraki55.id%
calcuid prizraki56 88856 room
detach 88809 %prizraki56.id%
wait 1
calcuid prizraki57 88857 room
detach 88809 %prizraki57.id%
calcuid prizraki58 88858 room
detach 88809 %prizraki58.id%
detach 88810 %self.id%
~
#88811
репоп зоны~
2 f 100
~
calcuid prizr55 88855 room
attach 88809 %prizr55.id%
calcuid prizr56 88856 room
attach 88809 %prizr56.id%
calcuid prizr57 88857 room
attach 88809 %prizr57.id%
wait 2
calcuid prizr58 88858 room
attach 88809 %prizr58.id%
calcuid gorka 88860 room
attach 88810 %gorka.id%
calcuid staya91 88891 room
attach 88808 %staya91.id%
wait 2
calcuid staya23 88823 room
attach 88808 %staya23.id%
calcuid staya29 88829 room
attach 88808 %staya29.id%
calcuid staya37 88837 room
attach 88808 %staya37.id%
wait 2
calcuid staya45 88845 room
attach 88808 %staya45.id%
calcuid staya48 88848 room
attach 88808 %staya48.id%
calcuid staya51 88851 room
attach 88808 %staya51.id%
wait 2
calcuid staya53 88853 room
attach 88808 %staya53.id%
wait 2
calcuid osyp 88893 room
attach 88813 %osyp.id%
~
#88812
лоад оживших цепей~
1 at 100
~
wait 1
%echo% _Цепи зашевелились и поднялись с пола.
%load% mob 88835
wait 1
%purge% %self%
~
#88813
у осыпи~
2 e 100
~
wait 1
wecho _Несколько камней сорвалось с верха осыпи и полетело вниз !
wait 2
foreach kpokomu %self.all%
  eval kdamag %kpokomu.hitp%/2 + 300
  wsend %kpokomu% _&RКамни БОЛЬНО ударили вас.&n
  wechoaround %kpokomu% _Камни БОЛЬНО ударили %kpokomu.vname%.
  wdamage %kpokomu% %kdamag%
done
wait 3s
if ((%random.100% < 34) && (%world.curobjs(88833)% < 1))
  wecho _Прямо перед вами что-то &Mблеснуло&n.
  wload obj 88833
else
  wecho _Прямо перед вами что-то &Yблеснуло&n.
  wload obj 88834
end
detach 88813 %self.id%
~
#88814
зашли к Редешану~
0 r 100
~
wait 1
switch %random.5%
  case 1
    г Гнида столичная, падаль ходячая!
    г Клещ, кровью насосанный, опарыш в гноящихся ранах страны!
    г Придёт и наш черед кончать всю эту мразоту!
    рыч
  break
  case 2
    г Да, главная сила в мире любовь.
    г Но ведь презрение и ненависть к смрадной нечисти лишь вариант любви к ним.
    эм наставительно поднял палец
  break
  case 3
    г Мы так за век ощерились, что нас только дурак тронет.
    г Наш ответ все знают: полное уничтожение врага.
    г А вот инородцам следует побеспокоиться.
    ухм
  break
  case 4
    г Нынешние женщины рассматривают себя как товар.
    г Ну и подчиняются всем законам продаж.
    г А какие продажи при близости, тайности, сердечности, душевности?
    взд
  break
  case 5
    г Решил вот начать сбор денег на похороны.
    г Если вы не мразь и не подонок, то давайте.
    г Вам пустяк, а мне приятно.
    жда
  break
done
~
#88815
зашли к Мицагулу~
0 r 100
~
wait 1
switch %random.5%
  case 1
    г Надобно беспременно иметь лук и стрелять:
    г главное здоровье сберечь при непосредственной угрозе.
    г Вооружайтеся, покуда дозволяет закон.
    настор
  break
  case 2
    г Не понимаю, как может кто-то уделять внимание, например, пиву,
    г когда на свете существует квас.
    г Может это и к лучшему, что не понимаю. И слава Богу.
    эм выглядит вполне довольным
  break
  case 3
    г Единственным выходом мне видится жёсткое самовоспитание - в самом себе -
    г спасительного безразличия решительно ко всему тому, без созерцания чего
    г можно вполне обойтись и жить погружённым в обстоятельства более интересные.
    г Но одновременно избегать чёрствости.
    улы
  break
  case 4
    г А куда вы, мужики,
    г сучьи дети?!
    г Аль прискучило с тоски
    г жить на свете?
    г Аль вам хата словно скит -
    г жить на свете?
    укор
  break
  case 5
    г Сильных землетрясений у нас не бывает.
    г Так, помаленьку потряхивает изредка.
    эм попытался успокоить вас
  break
done
~
#88817
каторжник~
0 q 100
~
wait 1
mecho _Каторжник загремел цепью
mkill %actor%
~
#88818
пока покрытый язвами раб жив~
2 e 100
~
switch %actor.class%
  case 2
    case 3
      case 5
        case 9
          case 10
            case 11
              halt
            break
            default
              if %exist.mob(88815)%
                wait 3s
                wecho _Прямо перед вами возникло ужасное видение - раб, покрытый кровоточащими язвами.
                wecho _Призрачный раб с ненавистью взглянул на вас и сказал :
                wecho _- Мы умрем здесь, но и вам не выйти отсюда! Погибайте в мучениях!
                wload mob 88840
                *Тут стояло некое "пурж мнимыймоб" - и что бы это значило?
                *Плюс за пуржи по имени вообще надо холокостировать.
                calcuid rab 88815 mob
                wpurge %rab%
              end
            break
          done
~
#88819
покрытый язвами раб сдох~
0 f 100
~
return 0
mecho _После смерти обезображенное лицо раба разгладилось и на нем появилась улыбка.
mecho _Похоже, в ином мире ему стало лучше, чем было в этом.
~
#88820
призрак раба кастит~
0 n 100
~
eval pokomu %random.pc%
if !%pokomu%
  halt
end 
switch %random.5%
  case 1
    msend %pokomu% _&RРаб наслал на вас круг пустоты !&n
    mechoaround %pokomu% _Раб наслал на %pokomu.vname% круг пустоты !
    dg_cast 'круг пустоты' %pokomu.name%
  break
  case 2
    msend %pokomu% _&RРаб наслал на вас оцепенение !&n
    mechoaround %pokomu% _Раб наслал на %pokomu.vname% оцепенение !
    dg_cast 'оцепенение' %pokomu.name%
  break
  case 3
    msend %pokomu% _&RРаб наслал на вас шок !&n
    mechoaround %pokomu% _Раб наслал на %pokomu.vname% шок !
    dg_cast 'шок' %pokomu.name%
  break
  case 4
    msend %pokomu% _&RРаб наслал на вас суд богов !&n
    mechoaround %pokomu% _Раб наслал на %pokomu.vname% суд богов !
    dg_cast 'суд богов' %pokomu.name%
  break
  case 5
    msend %pokomu% _&RРаб наслал на вас гнев богов !&n
    mechoaround %pokomu% _Раб наслал на %pokomu.vname% гнев богов !
    dg_cast 'гнев богов' %pokomu.name%
  break
done
~
#88821
рогулька~
1 b 1
~
eval ukogo %self.worn_by%
if !%ukogo%
  halt
end
switch %random.6%
  case 1
    set kuda на_север
  break
  case 2
    set kuda на_восток
  break
  case 3
    set kuda на_юг
  break
  case 4
    set kuda на_запад
  break
  case 5
    set kuda вниз
  break
  case 6
    switch %random.6%
      case 1
        set kuda в_сторону_моста_через_реку_Смородину
      break
      case 2
        set kuda в_сторону_башни_замка_Огненного_Змея
      break
      case 3
        set kuda в_сторону_высокого_кургана_у_словенской_деревни
      break
      case 4
        set kuda в_сторону_входа_в_Замок_нежити
      break
      case 5
        set kuda в_сторону_маленького_островка,_где_засело_Лихо_Одноглазое
      break
      case 6
        set kuda в_сторону_дороги_в_Царьград
      break
    done
  break
done
osend %ukogo% _Рогулька вдруг повернулась в ваших руках и указала %kuda%.
oechoaround %ukogo% _Рогулька в руках %ukogo.rname% вдруг повернулась и указала %kuda%.
~
#88822
зубы~
1 j 100
~
wait 1
oecho _Жуткие зубы камнееда громко клацнули.
return 1
~
#88823
грудка гранок~
1 b 5
~
wait 1
switch %random.4%
  case 1
    oecho _Гранки засветились &Mрозовым&n сиянием.
  break
  case 2
    oecho _Гранки зажглись &Wбелым&n огнем !
  break
  case 3
    oecho _Гранки засверкали всеми оттенками &Gзеленого&n.
  break
  case 4
    oecho _Гранки стали переливаться цветами от &Cголубого&n до &mфиолетового&n.
  break
done
~
#88824
цепи холдят~
0 n 100
~
eval kogo %random.pc%
if %kogo.name%
  msend %kogo% _&yЦепи плотно обвили вас !&n
  mechoaround %kogo% _Цепи плотно обвили %kogo.vname% !
  dg_cast 'оцеп' %kogo%
end
~
#88825
падает истовик~
0 f 100
~
mecho Из складок одежды рудознатца выкатился какой-то камень.
mload obj 73206
end
~
$~
