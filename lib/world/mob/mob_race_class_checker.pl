#!/usr/bin/perl

# (C) Pereplut 2009.
# (скрипт работает с файлами *.mob каталога, откуда он запущен)

## 1. Проверка на отнесение моба к определенному классу (делается на основе небольшой БД по ключевым словам)
## 2. Также конвертирует значение устаревшего поля "Class:" в новое поле: "Race:"
#
# Схема конвертации Class: в Race:
# Class: -> Race:
#  100 -> 100 - обычный моб
#  101 -> 110 - нежить (живой труп)
#  102 -> 101 - человек
#  103 -> 104 - животное
#

## По удачному и полному завершению работы скрипта генерится файл done_class_check.txt

use locale;
use POSIX qw (locale_h);
setlocale(LC_CTYPE, 'ru_RU.KOI8-R');

$file_name=undef;
@files=();

$mob_count      = 0; # счетчик сколько мобов в маде в подключенных зонах
$class_detects  = 0; # счетчик сколько классов удалось задетектить по имени
$class_transfer = 0; # счетчик сколько классов было перенесено из поля Class: в Race:
$words_in_base  = 0; # счетчик сколько слов у нас в нашей "базе слов"

## Типы классов:
# 1) Человек
@class_chelovek = qw(абориген агафон амал андора аргун архат архидьякон архиерей асигару атаман атли-конунг ахмет ашуканец баатур бабка бабы багадур багатур балалаечник бандит бандюга банкир банщик барин барон баскак басурманин батрак батыр батюшка башо бдигост бедвар-ярл беженец беженка беломор белян-подмастерье беовульф берендей берсерк библиотекарь библиотекаря библиотеки биглон биргитта благояр бобыль богдан богдан боголюб боец больма-мельник бонд бортник бранд девка девки девочка девушка девчонка девчушка дед дежурный деметра демидов демьян десятник детвора детина детка джузеппе димитрий дите дитя добрыня дозорный дочка дочь древлян дровосек дружинник дружинный дружины дубыни дубыня дурачок дуремар дурень дьяк дьячок дядечка дяди дядька евдокия евпатор еврей евсей егерь ельников емельян емеля епископ ерема еремий ефимий ефраим ефремий ехидный ждан-коваль жена жених женщина жены жердяй жеребенок жеребец жестокий живодер жилистый жинка жлоб жнец звездочет зверовод зверолов землемер землепашец зипунник злодей злыдень знаменосец знахарка знахарь зодчий зурхачи-гадальщик лавочник лада лазутчик ландмейстер лапландка лателле легат лежебока лекарь леля лемша лендерманн лентяй лесник лесничий лесомыка лесоруб лесунька летописец леха лианор ливонец лидий лиля литописец ловкач лодочник лоточник лошадник лубитчен людин-стражник лях мавр мальвина мальчик мальчиш мальчишка-разносчик мальчонка-подручный мальчуган мальяна манила марика маркус мародер маруся марфа маршал марья матрос матюша-богатырь мельник меняла микита микула микулична мирт миряк мити мифодий миямото молодец молодка монах монашек монголка мореход мостник мудрец муж музыкант муиртайг мукомол мытарь мэр мэцукэ мюрат мясник мятежник мятельник небокоптитель невеста негодяй незнакомец некрас несмеяна нехристь-лиходей новгородец новичок новобранец норвежец-берсерк норманн носильщик нукер нукур нянька палач паломник пан паренек парень парнишка паромщик пастух пастушок патрульный пахарь пацаненок паша певец пекарь пераскея перевозчик перегуд перекраса переписчик пересвет перехожий переяславльская переяславльский переяславский петр пехлеван пехотинец печенег печенежка пивовар пират писарь плотник прачка прелат продавец проповедник путник пьяница раввин разбойник разбойница разбойничек разведчик распоп расстрига ребенок ребятенок резник резчик ремесленник ризничий родянин-душегуб рольт романиус ромей ромес ронин росич ростовщик рудокоп рулевой русич рута рыдож рында рыцарь табити такурусаву тамплиер танзаган татарин тать творец телохранитель темник тенгиз тестер тешата теща тинвэй тирах тиркуша ткач толмач трактирщик трубочист трюгвес тукэ-красный тушимэл тысяцкий тысячник тэйсацу тэрсайд тюремщик убби удалой узкоглазый узник улан улем ульф умелец управляющий управник урманин урядник усмарь устин утитонин ученик ученица ушкуйник ушмян фадей федот-стрелец федул федя феклий феклудий фемистоклис фенриса филат фима фимор финн фогт фокусник фома фрося хазарин халдей халльвард хальвдан хальфдан хамар-хар хам-оол хан хаорн хатамото хевдинг хегни хель херлауг херсир хирдманн хлебороб хлевник хмар хмырь хозяин хозяйка хозяюшка холоп храмовник хрейдар хродгар хроллауг хунхуз хуторянин хуторянка хэшан цао цареградец царица цеджи целитель цыган чабан чадо чародей чароплет часовой человек чельчи чердачник чернавка чернокнижник чернокнижница чернокожий черномазый черномор чернявенький чернявка чудесник чумазый чухонец шаман швед швея-мастерица шкипер шляхтич шпиен шпион шрамолицый шулер шуликун шут шушара щитник щитоносец эйнар эйольф экзарх эконом эммили эрих эскимос юноша юрий юродивая юродивый юртаджи язычник ямабуси ямщик ярл ярослав ярпен ясна);
# 2) Человеко-зверь
@class_chelovekozver = qw(ангрбоды ерестун-оборотень йети лярва минотавр оборотень русалка таласым-оборотень чубака);
# 3) Птица
@class_ptitcha = qw(авдотка аист балобан бекас белокрылый беркут дрозд дрофа дупель дятел дятла дятлов жаворонок журавль зяблик ласточка лебедь лунь малиновка неясыть нетопырь павлин пеночка перепел петух петушок птах птенец птица птичка пустельга рарог рябчик тетерев утенок утица утка фазан филин финист цапля цыпленок чайка чибис чирок-свистунок чомга юстрица ястреб);
# 4) Животное
@class_jivotnoe = qw(антилопа баран барс бегемот белка белогривый белочка беляк бирюк бобер боров детеныш дикобраз доберман еж енот животное землеройка зверек зверь зверюга зебра зубр лань ласка лев летяга лис лосенок лось лошадка лошадь львица медведей медведица медведь медведя медвежонок мерин мораны морж мышка мышовка мышь нерпа норка патрикеевна пиявка пса псина рак росомаха рысь тарбаган тарпан теленок тигр тушканчик тюлень тяжеловоз фокстерьер хомяк хомячек хомячок хорек хряк шавка шакал ягненок ядозуб як);


# 5) Пресмыкающееся
@class_presmikayusheesya = qw(жаба жабоглот желтобрюхий желтопуз змея лягуха лягушка медуза медянка молюсск удав уж цокор черби червь червяк ящер ящурка);
# 6) Рыба
@class_riba = qw(акула елец ерш жерех лещ малек мальков мурена рыба рыбешка рыбка таранька уклейка чебак щука);
# 7) Насекомое
@class_nasekomoe = qw(бабочка блоха жужелица жук лимонница мизгирь мокрица моль москит мотылек муравей муравьиха муравьишка муха мушка паук паучиха паучок пчел рой таракан таракашка тарантул тинник тля улитка цикада шершень шмель);
# 8) Растение
@class_rastenie = qw(дерево деревцо деревьев дуб-стражник мак малины перекати-поле плесень яблонька);
# 9) Предмет
@class_predmet = qw(жилы зеркало ладья лапоть лилия льдина манекен маникен мерседес мухло памятник пень перья прах пугало т-100 терминатор топор угорь указатель упряжка финка фонтанчик хабуту чучело шар);
#10) Живой труп
@class_jivoitrup = qw(зомби мертвец мертвечины мертвого мертвый мертвяк нежить павший падший умертвие умрун утопленник утопший череп);
#11) Призрак
@class_prizrak = qw(дух);
#12) Нечисть
@class_nechist = qw(анчутка багник демон дракула дьявола дьявол-искуситель змеевич змеевка змеенышзмеище змеюка змеюкович змий знобея зыбочник йормунганд йотун лаюн лембой лешак лешачиха леший лешка медвежуть мразь мымра нелюд нечисть пата-кабуся пекленец родительница упыренок упырь усыня файар фроствирм хаус хлесей хлюпало цагхада черт шелоб);
#13) Нематериальный дух
@class_nematerialniiduh = qw(ангел аука баенник беблобога белун берегиня блазни-мороки богиня божество божья боли-бошка босоркун ледяница мороз морок перун тень холод цветич эхо ягодинич);
#14) Магическое создание
@class_magicheskoesozdanie = qw(амфисбена анцибал аранзал джинн домовенок домовой дракон единорог жар-птица львюка мантикора марбендилл марбендилл мефит морена моховик плутовка-водяница ураган фея хавун хатун цербер цымбала чудище шторм элементаль яга);

# сколько слов в базе
$words_in_base += $#class_chelovek + 1;
$words_in_base += $#class_chelovekozver + 1;
$words_in_base += $#class_ptitcha + 1;
$words_in_base += $#class_jivotnoe + 1;
$words_in_base += $#class_presmikayusheesya + 1;
$words_in_base += $#class_riba + 1;
$words_in_base += $#class_nasekomoe + 1;
$words_in_base += $#class_rastenie + 1;
$words_in_base += $#class_predmet + 1;
$words_in_base += $#class_jivoitrup + 1;
$words_in_base += $#class_prizrak + 1;
$words_in_base += $#class_nechist + 1;
$words_in_base += $#class_nematerialniiduh + 1;
$words_in_base += $#class_magicheskoesozdanie + 1;

# получить название класса по его номеру
%type_name_by_number = (0 => "UNDEF",
		       1 => "Человек",
		       2 => "Человеко-зверь",
		       3 => "Птица",
		       4 => "Животное",
		       5 => "Пресмыкающееся",
		       6 => "Рыба",
		       7 => "Насекомое",
		       8 => "Растение",
		       9 => "Предмет",
		       10 => "Живой труп",
		       11 => "Призрак",
		       12 => "Нечисть",
		       13 => "Нематериальный дух",
		       14 => "Магическое создание");

# конвертировать класс в рассу
%convert_class_to_race = (100 => 100, 101 => 110, 102 => 101, 103 => 104);

# процедура, определяющая класс моба
sub detect_mob_class {
	# получаем слова в названии моба
	my @args = split(/\s/, shift);
	my $detected_type = 0;
	my $now_num = -1;

	foreach $keyword (@args) {
		$now_num = 1;
		foreach $classmember (@class_chelovek) {
			if (length($keyword) > 0 && length($classmember) > 0 && index($keyword, $classmember) == 0) {
				print "CONFLICT types: [".$type_name_by_number{$detected_type}.",".$type_name_by_number{$now_num}."] ".$mob_vnum." ".$mob_name if ($detected_type != 0 && $detected_type != $now_num);
				$addedclass_chelovek{$mob_name." [".$mob_vnum."]"}++;
				$detected_type = $now_num;
				return $detected_type;
			}
		}
		$now_num = 2;
		foreach $classmember (@class_chelovekozver) {
			if (length($keyword) > 0 && length($classmember) > 0 && index($keyword, $classmember) == 0) {
				print "CONFLICT types: [".$type_name_by_number{$detected_type}.",".$type_name_by_number{$now_num}."] ".$mob_vnum." ".$mob_name if ($detected_type != 0 && $detected_type != $now_num);
				$addedclass_chelovekozver{$mob_name." [".$mob_vnum."]"}++;
				$detected_type = $now_num;
				return $detected_type;
			}
		}
		$now_num = 3;
		foreach $classmember (@class_ptitcha) {
			if (length($keyword) > 0 && length($classmember) > 0 && index($keyword, $classmember) == 0) {
				print "CONFLICT types: [".$type_name_by_number{$detected_type}.",".$type_name_by_number{$now_num}."] ".$mob_vnum." ".$mob_name if ($detected_type != 0 && $detected_type != $now_num);
				$addedclass_ptitcha{$mob_name." [".$mob_vnum."]"}++;
				$detected_type = $now_num;
				return $detected_type;
			}
		}
		$now_num = 4;
		foreach $classmember (@class_jivotnoe) {
			if (length($keyword) > 0 && length($classmember) > 0 && index($keyword, $classmember) == 0) {
				print "CONFLICT types: [".$type_name_by_number{$detected_type}.",".$type_name_by_number{$now_num}."] ".$mob_vnum." ".$mob_name if ($detected_type != 0 && $detected_type != $now_num);
				$addedclass_jivotnoe{$mob_name." [".$mob_vnum."]"}++;
				$detected_type = $now_num;
				return $detected_type;
			}
		}
		$now_num = 5;
		foreach $classmember (@class_presmikayusheesya) {
			if (length($keyword) > 0 && length($classmember) > 0 && index($keyword, $classmember) == 0) {
				print "CONFLICT types: [".$type_name_by_number{$detected_type}.",".$type_name_by_number{$now_num}."] ".$mob_vnum." ".$mob_name if ($detected_type != 0 && $detected_type != $now_num);
				$addedclass_presmikayusheesya{$mob_name." [".$mob_vnum."]"}++;
				$detected_type = $now_num;
				return $detected_type;
			}
		}
		$now_num = 6;
		foreach $classmember (@class_riba) {
			if (length($keyword) > 0 && length($classmember) > 0 && index($keyword, $classmember) == 0) {
				print "CONFLICT types: [".$type_name_by_number{$detected_type}.",".$type_name_by_number{$now_num}."] ".$mob_vnum." ".$mob_name if ($detected_type != 0 && $detected_type != $now_num);
				$addedclass_riba{$mob_name." [".$mob_vnum."]"}++;
				$detected_type = $now_num;
				return $detected_type;
			}
		}
		$now_num = 7;
		foreach $classmember (@class_nasekomoe) {
			if (length($keyword) > 0 && length($classmember) > 0 && index($keyword, $classmember) == 0) {
				print "CONFLICT types: [".$type_name_by_number{$detected_type}.",".$type_name_by_number{$now_num}."] ".$mob_vnum." ".$mob_name if ($detected_type != 0 && $detected_type != $now_num);
				$addedclass_nasekomoe{$mob_name." [".$mob_vnum."]"}++;
				$detected_type = $now_num;
				return $detected_type;
			}
		}
		$now_num = 8;
		foreach $classmember (@class_rastenie) {
			if (length($keyword) > 0 && length($classmember) > 0 && index($keyword, $classmember) == 0) {
				print "CONFLICT types: [".$type_name_by_number{$detected_type}.",".$type_name_by_number{$now_num}."] ".$mob_vnum." ".$mob_name if ($detected_type != 0 && $detected_type != $now_num);
				$addedclass_rastenie{$mob_name." [".$mob_vnum."]"}++;
				$detected_type = $now_num;
				return $detected_type;
			}
		}
		$now_num = 9;
		foreach $classmember (@class_predmet) {
			if (length($keyword) > 0 && length($classmember) > 0 && index($keyword, $classmember) == 0) {
				print "CONFLICT types: [".$type_name_by_number{$detected_type}.",".$type_name_by_number{$now_num}."] ".$mob_vnum." ".$mob_name if ($detected_type != 0 && $detected_type != $now_num);
				$addedclass_predmet{$mob_name." [".$mob_vnum."]"}++;
				$detected_type = $now_num;
				return $detected_type;
			}
		}
		$now_num = 10;
		foreach $classmember (@class_jivoitrup) {
			if (length($keyword) > 0 && length($classmember) > 0 && index($keyword, $classmember) == 0) {
				print "CONFLICT types: [".$type_name_by_number{$detected_type}.",".$type_name_by_number{$now_num}."] ".$mob_vnum." ".$mob_name if ($detected_type != 0 && $detected_type != $now_num);
				$addedclass_jivoitrup{$mob_name." [".$mob_vnum."]"}++;
				$detected_type = $now_num;
				return $detected_type;
			}
		}
		$now_num = 11;
		foreach $classmember (@class_prizrak) {
			if (length($keyword) > 0 && length($classmember) > 0 && index($keyword, $classmember) == 0) {
				print "CONFLICT types: [".$type_name_by_number{$detected_type}.",".$type_name_by_number{$now_num}."] ".$mob_vnum." ".$mob_name if ($detected_type != 0 && $detected_type != $now_num);
				$addedclass_prizrak{$mob_name." [".$mob_vnum."]"}++;
				$detected_type = $now_num;
				return $detected_type;
			}
		}
		$now_num = 12;
		foreach $classmember (@class_nechist) {
			if (length($keyword) > 0 && length($classmember) > 0 && index($keyword, $classmember) == 0) {
				print "CONFLICT types: [".$type_name_by_number{$detected_type}.",".$type_name_by_number{$now_num}."] ".$mob_vnum." ".$mob_name if ($detected_type != 0 && $detected_type != $now_num);
				$addedclass_nechist{$mob_name." [".$mob_vnum."]"}++;
				$detected_type = $now_num;
				return $detected_type;
			}
		}
		$now_num = 13;
		foreach $classmember (@class_nematerialniiduh) {
			if (length($keyword) > 0 && length($classmember) > 0 && index($keyword, $classmember) == 0) {
				print "CONFLICT types: [".$type_name_by_number{$detected_type}.",".$type_name_by_number{$now_num}."] ".$mob_vnum." ".$mob_name if ($detected_type != 0 && $detected_type != $now_num);
				$addedclass_nematerialniiduh{$mob_name." [".$mob_vnum."]"}++;
				$detected_type = $now_num;
				return $detected_type;
			}
		}
		$now_num = 14;
		foreach $classmember (@class_magicheskoesozdanie) {
			if (length($keyword) > 0 && length($classmember) > 0 && index($keyword, $classmember) == 0) {
				print "CONFLICT types: [".$type_name_by_number{$detected_type}.",".$type_name_by_number{$now_num}."] ".$mob_vnum." ".$mob_name if ($detected_type != 0 && $detected_type != $now_num);
				$addedclass_magicheskoesozdanie{$mob_name." [".$mob_vnum."]"}++;
				$detected_type = $now_num;
				return $detected_type;
			}
		}
	}
#DEBUG	print "TYPE '$type_name_by_number{$detected_type}' ADDED $mob_name" if $detected_type != 0;
	
	return $detected_type;
}

open INDEX, "index";
	$\ = "\n";
	$/ = "\n";
	@index_data = <INDEX>;
close INDEX;


if (@index_data) {
	#initialize
	$heroes_count = 0;
	$null_levels_mobs = 0;

	foreach $file_name (@index_data) {
		chomp $file_name;
		if ($file_name =~ m/^\d{1,4}\.mob$/) { # WORK MODE
#		if ($file_name =~ m/^\d{1}\.mob$/) { # DEBUG MODE

#			rename $file_name.".old_m", $file_name if (-e "$file_name.old_m"); #DEBUG

			open SOURCE, "$file_name";
#READONLY			open OUTPUT, ">$file_name.new";
#			print $file_name; #DEBUG

			
			while ($line=<SOURCE>) {
				chop $line;
				
				# Определяем внум
				if ($line =~ m/^\#(\d+?)$/) {
					$mob_vnum = $1;

					#initialize
					$mob_count ++;
					$mob_name  = "";
					$mob_race  = -1;
					$mob_class = -1;
					$mob_detected_class = -1;

					# Определяем имя моба (именительный падеж)
#READONLY					print OUTPUT $line;
					foreach(1..2) {
						$line=<SOURCE>;
						chop $line;
#READONLY						print OUTPUT $line;
					}
					chop $line;
					$mob_name = $line;
					$mob_detected_class = detect_mob_class(lc($mob_name));
					#print "$mob_vnum = $mob_name";
				} else {

					# Определяем класс моба если есть и тутже проставляем ему рассу
					if ($line =~ m/^Class\: (\d+)$/) {
						$mob_class = $1;
#READONLY						print OUTPUT "Class: $mob_class";
						if ($mob_detected_class > 0) {
							$class_detects++;
#READONLY						print OUTPUT "Race: ".(100 + $mob_detected_class);
						} else {
							$class_transfer++;
#READONLY						print OUTPUT "Race: ".$convert_class_to_race{$mob_class};
						}
					}
				
#READONLY					print OUTPUT $line if ($line !~ m/^(Class|Race)\:.+?/)
				}
			}
			close SOURCE;
#READONLY			close OUTPUT;
#			rename "$file_name", $file_name.".old_m" if (-e "$file_name"); # DEBUG MODE
#			rename "$file_name", $file_name.".cl_backup" if (-e "$file_name"); # DEBUG MODE
#READONLY			rename $file_name.".new", $file_name if (-e "$file_name.new") # WORKMODE
			
		}
	}

}

## генерим статистику
open STATISTIK, ">race_class_checker_stat.txt";
print STATISTIK "Generated by $0 at ".localtime(time)."\n";

print STATISTIK "Words in base: $words_in_base\nMobs in MUD: $mob_count\nAuto detects: $class_detects\nTransfers: $class_transfer";

@stat_ar = sort keys(%addedclass_chelovek);
print STATISTIK "\n== ".$type_name_by_number{1}." [".($#stat_ar + 1)."] ==";
print STATISTIK $_ foreach @stat_ar;
@stat_ar = sort keys(%addedclass_chelovekozver);
print STATISTIK "\n== ".$type_name_by_number{2}." [".($#stat_ar + 1)."] ==";
print STATISTIK $_ foreach @stat_ar;
@stat_ar = sort keys(%addedclass_ptitcha);
print STATISTIK "\n== ".$type_name_by_number{3}." [".($#stat_ar + 1)."] ==";
print STATISTIK $_ foreach @stat_ar;
@stat_ar = sort keys(%addedclass_jivotnoe);
print STATISTIK "\n== ".$type_name_by_number{4}." [".($#stat_ar + 1)."] ==";
print STATISTIK $_ foreach @stat_ar;
@stat_ar = sort keys(%addedclass_presmikayusheesya);
print STATISTIK "\n== ".$type_name_by_number{5}." [".($#stat_ar + 1)."] ==";
print STATISTIK $_ foreach @stat_ar;
@stat_ar = sort keys(%addedclass_riba);
print STATISTIK "\n== ".$type_name_by_number{6}." [".($#stat_ar + 1)."] ==";
print STATISTIK $_ foreach @stat_ar;
@stat_ar = sort keys(%addedclass_nasekomoe);
print STATISTIK "\n== ".$type_name_by_number{7}." [".($#stat_ar + 1)."] ==";
print STATISTIK $_ foreach @stat_ar;
@stat_ar = sort keys(%addedclass_rastenie);
print STATISTIK "\n== ".$type_name_by_number{8}." [".($#stat_ar + 1)."] ==";
print STATISTIK $_ foreach @stat_ar;
@stat_ar = sort keys(%addedclass_predmet);
print STATISTIK "\n== ".$type_name_by_number{9}." [".($#stat_ar + 1)."] ==";
print STATISTIK $_ foreach @stat_ar;
@stat_ar = sort keys(%addedclass_jivoitrup);
print STATISTIK "\n== ".$type_name_by_number{10}." [".($#stat_ar + 1)."] ==";
print STATISTIK $_ foreach @stat_ar;
@stat_ar = sort keys(%addedclass_prizrak);
print STATISTIK "\n== ".$type_name_by_number{11}." [".($#stat_ar + 1)."] ==";
print STATISTIK $_ foreach @stat_ar;
@stat_ar = sort keys(%addedclass_nechist);
print STATISTIK "\n== ".$type_name_by_number{12}." [".($#stat_ar + 1)."] ==";
print STATISTIK $_ foreach @stat_ar;
@stat_ar = sort keys(%addedclass_nematerialniiduh);
print STATISTIK "\n== ".$type_name_by_number{13}." [".($#stat_ar + 1)."] ==";
print STATISTIK $_ foreach @stat_ar;
@stat_ar = sort keys(%addedclass_magicheskoesozdanie);
print STATISTIK "\n== ".$type_name_by_number{14}." [".($#stat_ar + 1)."] ==";
print STATISTIK $_ foreach @stat_ar;

close STATISTIK;

print "\nDone mob files convertation. (words in base: $words_in_base mobs: $mob_count class detects: $class_detects transfers: $class_transfer)\n";

