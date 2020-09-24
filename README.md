zerkalomud
==========

ВНИМАНИЕ: Эта версия кода Зеркала закрыта в мае 2019 года! Причина: это очень-очень-очень старый код (2012 года).
В том же мае 2019 вместо этого создано Новое Зеркало на базе свежего кода Былин (в виде форка Былин):

https://github.com/prool/mud

Сайт мада Новое Зеркало: http://zerkalo.kharkov.org

Адрес для мад-клиентов: zerkalo.kharkov.org 4000

---

Zerkalo MUD server (middle Bylins MUD fork)

**Command for /etc/rc.local file:**

su prool -c ~prool/ZERKALO/autorun.zerkalo & > /dev/null

(user prool - owner of all MUD files)

**Замечания по сборке**

Для сборки в 64 разрядной Ubuntu иногда нужно шаманство: например, инсталлировать свежий boost,
отключить zlib (в Makefile и conf.h), добавить флаг -m32, скопировать свежие версии pugixml из каталога
src/ubuntu64 в каталог src

Например на Debian 7/64 BOOST устанавливается командой

apt-get install libboost-all-dev

На 64-битных системах надо устанавливать gcc-multilib g++-multilib lib32z1-dev и обязательно флаг -m32 в двух местах
файла Makefile (см. примеры мейкфайлов в исходниках)

На 32 битных системах все проще, чем 64, в Centos, Debian собирается без проблем

Для сборки в среде Windows/cygwin есть отдельный Makefile

**Links**

Оригинальные Былины:

bylins.su 4000

Их сайт: http://bylins.su

Их код: https://github.com/bylins/mud

Домашняя страница Пруля http://prool.kharkov.org

Блог Пруля про мады http://blog.mud.kharkov.org
