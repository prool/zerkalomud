#5300
умерпаук~
0 f 100
~
switch %random.10%
  case 1
    if %world.curobjs(518)%==0
      mload obj 518
    end
  break
  case 2
    if %world.curobjs(574)%==0
      mload obj 574
    end
  break
  default
  break
done
~
#5301
умершатун~
0 f 100
~
switch %random.10%
  case 1
    if %world.curobjs(518)%==0
      mload obj 518
    end
  break
  case 2
    if %world.curobjs(574)%==0
      mload obj 574
    end
  break
  default
  break
done
~
#5302
умер муравей~
0 f 90
~
if %random.100% > 40
  mechoaround self Из норки вылез муравей.
  mload mob 5300
end
~
$~
