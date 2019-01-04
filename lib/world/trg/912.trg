#91200
<912 Enter command>~
2 c 0
лезть залезть влезть~
if (%actor.vnum% != -1)
   halt
end
if !%arg.contains(лаз)%
   return 0
   halt
end
wait 1
wsend %actor%       Встав на корточки, Вы протиснулись в лаз...
wechoaround %actor% %actor.name% встал%actor.g% на четвереньки и полез в лаз...
wteleport %actor% 91200
calcuid   trgroom 91200 room
attach    91201 %trgroom.id%
run       91201 %trgroom.id%
~
#91201
<912 Send enter message>~
2 z 100
~
return 0
wechoaround %actor% %actor.name% приполз%actor.q% с юга...
~
#91202
<912 Enter command>~
2 c 0
лезть залезть влезть~
if (%actor.vnum% != -1)
   halt
end
if !%arg.contains(лаз)%
   return 0
   halt
end
wait 1
wsend %actor%       Встав на корточки, Вы протиснулись в лаз...
wechoaround %actor% %actor.name% встал%actor.g% на четвереньки и полез%actor.q% в лаз...
wteleport %actor% 91204
calcuid   trgroom 91204 room
attach    91203 %trgroom.id%
run       91203 %trgroom.id%
~
#91203
<912 Send enter message>~
2 z 100
~
return 0
wechoaround %actor% %actor.name% приполз%actor.q% с запада...
~
#91204
<912 Load Gorinya>~
0 n 100
~
if (%world.curobjs(91207)% < 4) && (%random.50% <= 12)
   mload obj 91207
elseif (%world.curobjs(91208)% < 4) && (%random.50% <= 12)
   mload obj 91208
elseif (%world.curobjs(91213)% < 4) && (%random.50% <= 12)
   mload obj 91213
end
wear дымч
~
#91205
<912 Gorinya killed>~
0 f 100
~
if (%world.curobjs(91217)% < 7) && (%random.100% <= 10)
   mload obj 91217
elseif (%world.curobjs(91219)% < 7) && (%random.100% <= 10)
   mload obj 91219
end
calcuid questroom 91241 room
attach  91212 %questroom.id%
run     91212 %questroom.id%
~
#91206
<912 Gorinya keeper killed>~
0 f 100
~
if (%world.curobjs(91218)% < 4) && (%random.3% == 1)
   mload obj 91218
end
if (%world.curobjs(91220)% < 4) && (%random.3% == 1)
     mload obj 91220
end
~
#91207
<912 Three headed zmey killed>~
0 f 100
~
if (%world.curobjs(91221)% < 4) && (%random.33% <= 2)
   mload obj 91221
elseif (%world.curobjs(91222)% < 4) && (%random.33% <= 2)
   mload obj 91222
end
~
#91208
<912 Sirin killed>~
0 f 100
~
if (%world.curobjs(91223)% < 4) && (%random.100% < 20)
   mload obj 91223
end
~
#91209
<912 Gryphon killed>~
0 f 100
~
if (%world.curobjs(91214)% < 10) && (%random.20% <= 4)
   mload obj 91214
end
~
#91210
<912 Zone reset>~
2 f 100
~
calcuid questroom 91241 room
attach  91211 %questroom.id%
detach  91213 %questroom.id%
detach  91214 %questroom.id%
detach  91215 %questroom.id%
run     91211 %questroom.id%
~
#91211
<912 Zreset quest room>~
2 z 100
~
wpurge
detach 91216 %self.id%
return  0
~
#91212
<912 Load valun>~
2 z 100
~
wload   obj 91200
calcuid questroom 91241 room
attach  91213 %questroom.id%
~
#91213
<912 Command PUSH VALUN>~
2 c 0
двинуть двигать толкнуть толкать~
if %actor.vnum% != -1
   halt
end
if !%arg.contains(валун)%
   return 1
   halt
end
wait 1
if %actor.str% < 25
   wsend %actor% Слишком тяжелый...
   wechoaround %actor% %actor.name% попытал%actor.u% сдвинуть валун...
   halt
end
wsend %actor%       Вы поднатужились и столкнули огромный валун...
wechoaround %actor% %actor.name% поднатужил%actor.u% и столкнул%actor.g% огромный валун с места...
wecho               Вашему взору открылось исполинское тело в богатырских доспехах...
wpurge   валун
wload    obj 91201
attach   91214 %self.id%
detach   91213 %self.id%
~
#91214
<912 Use DEAD water>~
2 c 0
лить смочить окропить~
if %actor.vnum% != -1
   halt
end
if !%arg.contains(мертвой)% && !%arg.contains(мертвую)%
   return 1
   halt
end
wait 1
if !%actor.haveobj(91000)%
   wsend %actor% У Вас этого нет !
   halt
end
wsend %actor% Вы окропили тело Перуна мертвой водой...
wechoaround   %actor% %actor.name% окропил%actor.g% тело Перуна мертвой водой...
wpurge  чаш.мертв.вод
attach  91215 %self.id%
detach  91214 %self.id%
~
#91215
<912 Use LIVE water>~
2 c 0
лить смочить окропить~
if %actor.vnum% != -1
   halt
end
if !%arg.contains(живой)% && !%arg.contains(живую)%
   return 0
   halt
end
wait 1
if !%actor.haveobj(91100)%
   wsend %actor% У Вас этого нет !
   halt
end
wsend %actor%       Вы окропили тело Перуна живой водой...
wechoaround %actor% %actor.name% окропил%actor.g% тело Перуна живой водой...
wpurge  чаш.жив.вод
wpurge  великий.Перун
wload   mob 91211
wecho   Древний Бог встал и потянулся, разминая затекшие от долгого сна мышцы.
wecho   - Спасибо тебе, %actor.name%, что разбудил%actor.g% меня от вечного сна.
eval  AddExp 0
if %actor.level% < 28
   wecho   - Hо ты слишком мал%actor.a%, чтоб я чему-то научил тебя, приходи как станешь опытнее.
   set     AddExp 500000
   set AddExp  %actor.exp(+%AddExp%)%
   %actor.setquest(912)%
   wpurge великий.Перун
   detach 91215 %self.id%
   halt
end
switch %random.5%
  case 1
        if %world.curobjs(91202)% < 2
  	  wload   obj 91202
          wforce великий.Перун взять масс.меч
          wforce великий.Перун дать  масс.меч %actor.name%
 	else
          eval AddExp 1000000
        end
        break
  case 2
        if %world.curobjs(91203)% < 2
 	   wload   obj 91203
           wforce великий.Перун взять плат.доспех
           wforce великий.Перун дать  плат.доспех %actor.name%
 	else
          eval AddExp 1000000
        end
        break
  case 3
        if %world.curobjs(91204)% < 2
	   wload   obj 91204
           wforce великий.Перун взять ладанка.горсть
           wforce великий.Перун дать  ладанка.горсть %actor.name%
 	else
          eval AddExp 1000000
        end
        break
  case 4
        if %world.curobjs(91205)% < 2 
	   wload   obj 91205
           wforce великий.Перун взять пояс.платин
           wforce великий.Перун дать  пояс.плат %actor.name%
 	else
          eval AddExp 1000000
        end
        break
  case 5
        if %world.curobjs(91206)% < 2
	   wload   obj 91206
           wforce великий.Перун взять кинж.платин
           wforce великий.Перун дать  кинж.платин %actor.name%
 	else
          eval AddExp 1000000
	end
        break
  default
  break
done
*лекарь
 switch %actor.class%
      case 0
        if (%actor.spelltype(защита богов)%)
	    eval AddExp 1000000
        else
  	   if  (%random.100% < 12)
              wspellturn %actor.name% защита.богов set
	   end
        end
	break
 *боевой маг
      case 1
if (!(%actor.spelltype(заколдовать оружие)%) && (%random.100% < 12))
            wspellturn %actor.name% заколдовать.оружие set
elseif (!(%actor.spelltype(суд богов)%) && (%random.100% < 12))
            wspellturn %actor.name% суд.богов set
  	 else
            eval AddExp 1000000
         end
	break
 *вор
       case 2
         if     !%actor.skill(заколоть)%
            wskillturn %actor.name% заколоть set
         elseif %actor.skill(заколоть)% < 140
            wskilladd %actor.name% заколоть 5
         else
            eval  AddExp 1000000
         end
	break
 *богатырь
        case 3
          if    !%actor.skill(богатырский молот)%
             wskillturn %actor.name% богатырский.молот set
          elseif %actor.skill(богатырский молот)% < 100
             wskilladd  %actor.name% богатырский.молот 5
          elseif !%actor.skill(оглушить)%
             wskillturn %actor.name% оглушить set
          elseif %actor.skill(оглушить)% < 100
             wskilladd  %actor.name% оглушить 5
          else
             eval  AddExp 1000000
          end
	break
 *наемник
        case 4
           if    !%actor.skill(отравить)%
              wskillturn %actor.name% отравить set
           elseif %actor.skill(отравить)% < 100
              wskilladd  %actor.name% отравить 5
           elseif %actor.skill(подножка)% < 100
              wskilladd  %actor.name% подножка 5
           else
              eval  AddExp 1000000
           end
	break
 *дружинник
         case 5
                 if    !%actor.skill(веерная защита)%
                    wskillturn %actor% веерная.защита set
                 elseif %actor.skill(веерная защита)% < 140
                    wskilladd  %actor% веерная.защита 5
                 elseif %actor.skill(обезоружить)% < 100
                    wskilladd  %actor% обезоружить 5
                 else
                     eval  AddExp 1000000
                 end
	break
 *маг-кудесник
	case 6
                if (%actor.spelltype(магическое зеркало)% )
                   eval AddExp 1000000
                else
		   if  (%random.100% < 15)
                      wspellturn %actor.name% магическое.зеркало set
		   end
                end
	break
 *маг-волшебник
	case 7
                if (%actor.spelltype(массовое оцепенение)%)
                   eval AddExp 1000000
                else
  		  if  (%random.100% < 15)
                   wspellturn %actor.name% массовое.оцепенение set
		  end
                end
	break
 *маг-некромант
	case 8
                if (%actor.spelltype(силы зла)%) 
                   eval AddExp 1000000
                else
  		 if  (%random.100% < 15)
		   wecho Даю я тебе возможность использовать заклинание "Силы Зла"	
                   wspellturn %actor.name% силы.зла set
		 end
                end
	break
 *витязь
	case 9
                 if !(%actor.spelltype(массовое молчание)%)
                    wspellturn %actor.name% массовое.молчание set
                 elseif    !%actor.skill(двуручники)%
                    wskillturn %actor.name% двуручники set
                 elseif %actor.skill(двуручники)% < 120
                    wskilladd  %actor.name% двуручники 5
                 else
                    eval  AddExp 1000000
                 end
	break
 *охотник
	case 10
                 if    !%actor.skill(доп выстрел)%
                    wskillturn %actor.name% доп.выстрел set
                 elseif %actor.skill(доп выстрел)% < 100
                    wskilladd  %actor.name% доп.выстрел 5
                 elseif %actor.skill(маскировка)%
                    if %actor.skill(маскировка)% < 100
                    wskilladd  %actor.name% маскировка 5
                 else
                    eval  AddExp 1000000
                 end
	break
 *кузнец
	case 11
                 if    !%actor.skill(ярость)%
                    wskillturn %actor.name% ярость set
                 elseif %actor.skill(перековать)% < 140
                    wskilladd  %actor.name% перековать 5
                 else
                    eval  AddExp 1000000
                 end
	break
 *купец
	case 12
                 if    !%actor.skill(осторо стиль)%
		    wskillturn %actor.name% осторожный.стиль set
                 elseif %actor.skill(осторожный.стиль)% < 100
                    wskilladd  %actor.name% осторожный.стиль 5
                 else
                    eval  AddExp 1000000
                 end
	break
*волхв
	case 13
	    eval AddExp 1000000
	break
	default 
	break
done
wsend %actor% Вы получили %addexp% очков опыта.
%actor.exp(+%AddExp%)%
%actor.setquest(912)%
wpurge великий.Перун
attach 91216 %self.id%
exec 91216 %self.id%
detach 91215 %self.id%
~
#91216
Открываем портал после квеста~
2 e 100
~
%portal% 80001 1
~
$~
