grafor: grafor.c
	gcc -m32 -ggdb3 grafor.c -o grafor
#	gcc -ggdb3 grafor.c -lncurses -o script.cgi
map:	grafor
	cat ../../lib/world/wld/*.wld > rooms.lst
	./grafor 1 > 1.wld.html
	./grafor 40 > 40.wld.html
	cp	*.html /var/www/zerkalo.kharkov.org/map
clean:
	rm grafor
