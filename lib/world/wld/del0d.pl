#!/usr/bin/perl
$text = shift;
open      FILE,"$text";
sysread   FILE,$str,-s FILE;
close     FILE;
$str =~ s/\r//g;
open      FILE,">$text";
syswrite  FILE,$str,length $str;
close     FILE;