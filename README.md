Zerkalo MUD server (Bylins MUD derivarive)
==========================================

ВНИМАНИЕ: Эта версия кода Зеркала закрыта и заморожена в мае 2019 года.
Причина: это очень-очень-очень старый код (основанный на кодовой базе Былин от 2012 года).
В том же мае 2019 вместо этого создана более новая версия на базе более свежего кода Былин (в виде форка Былин).
Вот она https://github.com/prool/mud

Сайт мада Зеркало: http://zerkalo.virtustan.net или http://zerkalo.kharkov.org

Адрес для мад-клиентов: zerkalo.virtustan.net 4000 или zerkalo.kharkov.org 4000

---

**Command for /etc/rc.local file:**

For example

su prool -c ~prool/ZERKALO/autorun.zerkalo & > /dev/null

(user prool - owner of all MUD files)

**Замечания по сборке**

Для сборки в 64 разрядной Ubuntu/Debian иногда нужно шаманство: например, инсталлировать свежий boost,
отключить zlib (в Makefile и conf.h), добавить флаг -m32, скопировать свежие версии pugixml из каталога
src/ubuntu64 в каталог src. Копирование новых pugixml требуется также для сборки в macOS Catalina.

Например на Debian 7/64 BOOST устанавливается командой

apt-get install libboost-all-dev

На 64-битных системах надо устанавливать gcc-multilib g++-multilib lib32z1-dev и обязательно флаг -m32 в двух местах
файла Makefile (см. примеры мейкфайлов в исходниках). Также порой нужно libcrypt-dev:i386 и иногда нужно вместо
-lcrypt указывать полный путь к 32-разрядной libcrypt (на Ubuntu 22, Debian 11).

libcrypt:i386 устанавливается так:

sudo dpkg --add-architecture i386
sudo apt update
sudo apt install libcrypt1:i386

На 32 битных системах (ими еще кто-то пользуется?) все проще, чем 64, в Centos, Debian собирается без проблем

Для сборки в среде Windows/cygwin есть отдельный Makefile

**Links**

Оригинальные Былины:

bylins.su 4000

Их сайт: http://bylins.su

Их код: https://github.com/bylins/mud

Домашняя страница Пруля http://prool.virtustan.net

Serhii "Prool" Pustovoitov, Duisburg, Germany
proolix@gmail.com
2013-2025
