#10200
<102 Main robber killed>~
0 f 100
~
mload obj 10224
~
#10201
<Reset zone 102>~
2 f 100
~
wait 1
foreach vnumrobber 10205 10206 10208 10209 10211 10212 10214 10215
  if %exist.mob(%vnumrobber%)%
    calcuid robber %vnumrobber% mob
    wteleport %robber% 10243
    wait 1s
  end
done
~
$~
