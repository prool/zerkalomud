#92700
автолечение мобов~
0 k 100
~
dg_cast 'крит исц' 
dg_cast 'крит исц'
dg_cast 'крит исц'
~
#92701
умер червь~
0 f 100
~
if %random.5%==1 &&  %world.curobjs(92703)% < 5
  mload obj 92703
elseif %random.6%==1 &&  %world.curobjs(92702)% < 5
  mload obj 92702
elseif %random.7%==1 &&  %world.curobjs(92701)% < 5
  mload obj 92701
elseif %random.8%==1 &&  %world.curobjs(92700)% < 5
  mload obj 92700  
else 
  mload obj 92711
end
~
#92702
умер ящер~
0 f 100
~
if %random.10%==1 &&  %world.curobjs(92706)% < 10
  mload obj 92706
end
~
#92703
умер элементаль~
0 f 100
~
if  %random.100% < 5 && %world.curobjs(92709)% < 3
  mload obj 92709
end
~
#92704
вывод - не  хватайте чужие  вещи   :)~
1 j 100
~
if %actor.vnum% != 92705    
  osend %actor% Вы с большим трудом подняли меч Святогора.
  oechoaround %actor% %actor.name% с большим трудом подня%actor.q% меч Святогора.
  osend %actor% Неожиданно меч дернулся, и вы не смогли его удержать.
  osend %actor% Огромное лезвие разрубило Вас пополам.
  oechoaround %actor% Меч Святогора вдруг резко дернулся и разрубил %actor.vname%.
  if %actor.affect(защита богов)%
    dg_affect %actor.name% тело защита_богов -1 0
  end
  %actor.wait(2)%
  return 0
  wait 1
  odamage %actor.name% 10000
end                                                   
~
#92705
святогор вооружается~
0 k 100
~
wait 3s
if  %random.2% == 1
  say Я то думал это мухи кусаются...
  wait 1s
  mecho __Святогор тряхнул головой прогоняя сон.
  wait 1s
  mecho __Святогор вытащил из ножен огромный двуручный меч!
  mload obj 92710  
  set pos 16
  while %pos% < 19
    if %self.eq(%pos%)%
      set wp %self.eq(%pos%)%
      убр %wp%
    end
    eval pos %pos%+1
  done
  сня все
  воо меч_92710
  wait 2s
  detach 92705 %self.id%
end
~
#92706
дали небесное молоко  Святогору~
0 j 100
~
if %object.vnum% == 92635
  wait 1
  mpurge %object%
  say Небесное молоко?
  wait 2s
  say Давненько я его не пробовал.
  осуш небес
  wait 1s    
  say Коли пришли Вы с благословлением Сварога, пропущу я Вас в царство подземное.
  mat 92700 Кто-то появился здесь в клубах сизого дыма.
  mteleport all 92700
end
~
#92707
взрыв шара (автолут-штука вредная)  или лоад  стаффа~
1 g 100
~
if %self.vnum% != 92711
  detach 92707 %self.id% 
  halt
end
eval num 92711+%random.3%
if %random.7% == 1 && %world.curobjs(%num%)% < 1             
  osend %actor% Огненный шар преобразился.                      
  otransform %num%
  halt
elseif %random.10% < 5
  oecho Огненный шар взорвался, залив все пламенем.
  eval dam 30+%actor.level%*%random.10%+%actor.level%*%random.15% 
  if %dam%>%actor.maxhitp%
    eval dam %actor.maxhitp%
  end
  odamage %actor% %dam%    
  foreach targ %actor.all%
    eval dam %dam%-30
    if %dam%<1
      halt
    end
    odamage %targ% %dam%
    osend %targ% Огненная волна накрыла Вас!
  done               
  wait 1
  opurge %self%
else  
  oecho Огненный шар потерял форму и погас.
  oecho В голове мелькнула мысль: "А если бы он взорвался ?"
  wait 1
  opurge %self%
end
~
#92708
взяли меч святогора~
1 g 100
~
osend %actor% Меч святогора дернулся  попытавшись разрубить Вас.
wait 1s
osend %actor% В голове у Вас появилась навязчивая мысль:
osend %actor% Лучше оставить это своевольное оружие в покое,
osend %actor% в следующий раз меч может оказаться удачливей...
~
#92709
сет  холодного огня  (14 -  нагрудник)~
1 b 100
~
wait 2s 
if %self.vnum% == 92718
  if !%self.worn_by%
    halt
  end
  set char %self.worn_by%
  set i 0  
  set num 0
  while %i% < 16
    eval i %i%+1
    set item %char.eq(%i%)%  
    if %item.vnum% > 92711  && %item.vnum% < 92729
      eval num %num%+1
    end
  done
  if %num%>13
    otransform 92719
  end
else
  if %self.worn_by%
    set char %self.worn_by%
    set i 0  
    set num 0
    while %i% < 16
      eval i %i%+1
      set item %char.eq(%i%)%  
      if %item.vnum% > 92711  && %item.vnum% < 92729
        eval num %num%+1
      end
    done
    if %num%>13
      halt
    end 
  end
  otransform 92718  
end
~
#92710
сет  холодного огня  (14 шмоток -  корона)~
1 b 100
~
wait 2s 
if %self.vnum% == 92726
  if !%self.worn_by%
    halt
  end
  set char %self.worn_by%
  set i 0  
  set num 0
  while %i% < 16
    eval i %i%+1
    set item %char.eq(%i%)%  
    if %item.vnum% > 92711  && %item.vnum% < 92729
      eval num %num%+1
    end
  done
  if %num%>13
    otransform 92727
  end
else
  if %self.worn_by%
    set char %self.worn_by%
    set i 0  
    set num 0
    while %i% < 16
      eval i %i%+1
      set item %char.eq(%i%)%  
      if %item.vnum% > 92711  && %item.vnum% < 92729
        eval num %num%+1
      end
    done
    if %num% > 13
      halt
    end  
  end
  otransform 92726  
end
~
$~
