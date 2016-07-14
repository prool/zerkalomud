zerkalomud
==========

[Screenshots. Скриншоты](http://blog.mud.kharkov.org/screenshots#zerkalo)

Zerkalo MUD server code (middle Bylins MUD fork)

**Command for /etc/rc.local file:**

su prool -c ~prool/ZERKALO/autorun.zerkalo & > /dev/null

(prool - owner of all MUD files)

**Замечания по сборке**

Для сборки в 64 разрядной Ubuntu иногда нужно шаманство: например, инсталлировать свежий boost,
отключить zlib (в Makefile и conf.h), добавить флаг -m32
 
На 32 битных системах все проще, они как-то более стабильны, чем 64, в Centos, Debian собирается без проблем

Для сборки в среде Windows/cygwin есть отдельный Makefile
