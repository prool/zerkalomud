#76000
просителиругаются~
0 r 100
~
wait 10
switch %random.5%
  case 1
    mecho Внезапно проситель схватился за голову и вырвал клок волос.
  break
  case 2
    say Да как же это люди! Да что же это за гады!
  break
  case 3
    mecho Один из просителей смачно плюнул и что-то забормотал.
  break
  case 4
    say И никого не осталось, все ушли кто куда. Кинули, плюнули и разбежались.
  break
  default
    say Да скоро там очередь то? Эй! На острие! Двигай давай быстрей!
    mecho Проситель грозно зарычал.
  break
done
~
#76001
дали денежку разносчику~
0 m 1
~
wait 1
поклон .%actor.name%
switch %random.3%
  case 1
    mload obj 76016
    give all .%actor.name%
  break
  case 2
    mload obj 76046
    give all .%actor.name%
  break
  case 3
    mload obj 76047
    give all .%actor.name%
  break
done
~
#76002
Разносчик кричит~
0 b 12
~
switch %random.%
  case 1
    крича Свежие прирожки, булочки! налетай-раскупай!
  break
  case 1
    крича А вот кому хлеба белого с пылу с жару!
  break
  case 1
    крича Калачи, ватрушки, булочки сладкие! 
  break
  case 1
    крича Баранки, булочки - только из печи!
  break
done
~
#76003
Платные порталы~
0 m 1
~
wait 1
emot пересчитал%self.g% монеты
eval target 0
switch %amount%
  * Переяславль
  case 2800
    eval target 25007
  break
  * Русса (временно - ВН)
  case 4000
    eval target 60016
  break
  default
    дум
    say И чего же ты за эти деньги хочешь?
    give %amount% кун .%actor.name%
    halt
  done
  кив
  emot сделал%self.g% несколько странных жестов
  mechoaround %actor% %actor.name% исчез%actor.q% в клубах дыма.
  msend %actor% У вас закружилась голова, и на миг вы потеряли сознание...
  msend %actor% 
  mteleport %actor% %target% horse
  mechoaround %actor% %actor.name% появил%actor.u% здесь в клубах дыма.
~
#76004
одевает лук неловкий~
1 j 100
~
eval dex %actor.dex%+%actor.dexadd%
if %dex% < 30
  osend %actor% С Вашей ловкостью только топором махать! Какой Вам лук к лешему!
  if %self.worn_by%
    oforce %actor% remove SuperPuperBow760
  end
  return 0
  halt
end
~
$~
