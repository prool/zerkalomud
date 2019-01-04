#!/usr/bin/perl

# (C) Pereplut 2005.
# Проверка на простановку скиллов и фитов у мобов  - парсит все *.mob из каталога откуда он 
# запущен и редактирует файлы.

# По удачному и полному завершению работы скрипта генерится файл done_convert.txt

$file_name=undef;
@files=();

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
		if ($file_name =~ m/^\d{1,4}\.mob$/) {
#		if ($file_name =~ m/^\d{1}\.mob$/) {

			rename $file_name.".old_m", $file_name if (-e "$file_name.old_m");

			open SOURCE, "$file_name";
			open OUTPUT, ">$file_name.new";
#			print $file_name; #DEBUG

			#initialize
			$mob_vnum = 0;
			$mob_level = 0;
			$mob_need_master_feats = 0;
			
			$now_parse_skills_feats_spells = 0;
			@skills_feats_spells_data = ();

			while ($line=<SOURCE>) {
				chop $line;
				
				# Определяем
				if ($line =~ m/^\#(\d+?)$/) {
					$mob_vnum = $1;
					
					# re initialize
					$mob_level = 0;
					$mob_need_master_feats = 0;
					$now_parse_skills_feats_spells = 0;
					@skills_feats_spells_data = ();
				}
				
				# Определяем уровень моба если есть
				if ($line =~ m/^(\d+?) \-?\d+? \-?\d+? \-?\d+?d\-?\d+?\+\-?\d+? \-?\d+?d\-?\d+?\+\-?\d+?$/) {
					$mob_level = $1;
#					print "$mob_vnum = $mob_level"; #DEBUG
					if ($mob_level == 0) {
#						print "\003J$mob_vnum -- нулевой лев."; #DEBUG
						$null_levels_mobs ++;
					}
				}
				
				# Определяем класс моба если есть
				if ($line =~ m/^Class\: 104$/) {
#					print "\003OГерой-воин ($mob_vnum [$mob_level])."; #DEBUG
					$mob_need_master_feats = 1;
					$heroes_count ++;
				}
				
				if ($mob_level != 0) {
					# Если строка -- скилл фит умение -- не записываем в аутпутфайл а готовимся обработать
					if ($line =~ m/^(Feat|Skill|Spell)\:.+?/) {
						$now_parse_skills_feats_spells = 1;
						push @skills_feats_spells_data, $line;
					} elsif ($line =~ m/^E$/) {
						$now_parse_skills_feats_spells = 1;
					}
					
					if ($line !~ m/^(Feat|Skill|Spell)\:.+?/) {
						if ($now_parse_skills_feats_spells) {
							$now_parse_skills_feats_spells = 0;
							
							# Анализируем текущие скиллы и фиты
							$have_feat_29 = 0; # наличие мастер-фитов
							$have_feat_30 = 0;
							$have_feat_31 = 0;
							$have_feat_32 = 0;
							$have_feat_33 = 0;
							$have_feat_34 = 0;
							$have_feat_35 = 0;
							$have_feat_36 = 0;
							$have_feat_37 = 0;
							$have_feat_38 = 0;
							$have_skill_136 = 0; # наличие кулачного боя
							foreach $sfs_line (@skills_feats_spells_data) {
								if ($sfs_line =~ m/^Skill\: 136\s.+/) {
									$have_skill_136 = 1;
#									print "mob $mob_vnum с кулачным"; #DEBUG
								}
								if ($sfs_line =~ m/^Feat: 29/) {
									$have_feat_29 = 1;
								}
								if ($sfs_line =~ m/^Feat: 30/) {
									$have_feat_30 = 1;
								}
								if ($sfs_line =~ m/^Feat: 31/) {
									$have_feat_31 = 1;
								}
								if ($sfs_line =~ m/^Feat: 32/) {
									$have_feat_32 = 1;
								}
								if ($sfs_line =~ m/^Feat: 33/) {
									$have_feat_33 = 1;
								}
								if ($sfs_line =~ m/^Feat: 34/) {
									$have_feat_34 = 1;
								}
								if ($sfs_line =~ m/^Feat: 35/) {
									$have_feat_35 = 1;
								}
								if ($sfs_line =~ m/^Feat: 36/) {
									$have_feat_36 = 1;
								}
								if ($sfs_line =~ m/^Feat: 37/) {
									$have_feat_37 = 1;
								}
								if ($sfs_line =~ m/^Feat: 38/) {
									$have_feat_38 = 1;
								}
							}
							if ($have_skill_136 == 0) {
								push @skills_feats_spells_data, "Skill: 136 ".($mob_level * 3);
								$have_skill_136 = 1;
#								print "\003Pmob $mob_vnum + кулачный = ".($mob_level * 3); #DEBUG
							}
							
							if ($mob_need_master_feats) {
								$mob_need_master_feats = 0;
#								print "\003Nmob $mob_vnum [$mob_level] + master-feats"; #DEBUG
								if (!$have_feat_29) {
									push @skills_feats_spells_data, "Feat: 29";
									$have_feat_29 = 1;
								}
								if (!$have_feat_30) {
									push @skills_feats_spells_data, "Feat: 30";
									$have_feat_30 = 1;
								}
								if (!$have_feat_31) {
									push @skills_feats_spells_data, "Feat: 31";
									$have_feat_31 = 1;
								}
								if (!$have_feat_32) {
									push @skills_feats_spells_data, "Feat: 32";
									$have_feat_32 = 1;
								}
								if (!$have_feat_33) {
									push @skills_feats_spells_data, "Feat: 33";
									$have_feat_33 = 1;
								}
								if (!$have_feat_34) {
									push @skills_feats_spells_data, "Feat: 34";
									$have_feat_34 = 1;
								}
								if (!$have_feat_35) {
									push @skills_feats_spells_data, "Feat: 35";
									$have_feat_35 = 1;
								}
								if (!$have_feat_36) {
									push @skills_feats_spells_data, "Feat: 36";
									$have_feat_36 = 1;
								}
								if (!$have_feat_37) {
									push @skills_feats_spells_data, "Feat: 37";
									$have_feat_37 = 1;
								}
								if (!$have_feat_38) {
									push @skills_feats_spells_data, "Feat: 38";
									$have_feat_38 = 1;
								}
							}
							
							foreach $sort_line (@skills_feats_spells_data) {
								while ($sort_line =~ s/^(Skill: )([\d]{1,2} \d+?)$/${1}0${2}/g) {};
								while ($sort_line =~ s/^(Spell: )([\d]{1,2})$/${1}0${2}/g) {};
								while ($sort_line =~ s/^(Feat: )([\d]{1,2})$/${1}0${2}/g) {};
							}
							@skills_feats_spells_data = sort {$a cmp $b} @skills_feats_spells_data;
							foreach $sort_line (@skills_feats_spells_data) {
								while ($sort_line =~ s/^(Skill: )0([\d]{1,2} \d+?)$/$1$2/g) {};
								while ($sort_line =~ s/^(Spell: )0([\d]{1,2})$/$1$2/g) {};
								while ($sort_line =~ s/^(Feat: )0([\d]{1,2})$/$1$2/g) {};
							}
						
							foreach (@skills_feats_spells_data) {
								print OUTPUT $_;
							}
							@skills_feats_spells_data = ();
						}
					}
				}

				print OUTPUT $line if ($line !~ m/^(Feat|Skill|Spell)\:.+?/)

			}
			close SOURCE;
			close OUTPUT;
#			rename "$file_name", $file_name.".old_m" if (-e "$file_name");
			rename $file_name.".new", $file_name if (-e "$file_name.new")
			
		}
	}
#	print "";print "\003KГероев воинов: $heroes_count"; #DEBUG
#	print "\003KМобов с 0 левом: $null_levels_mobs"; #DEBUG
}
open DONE, ">done_convert.txt";
print DONE "$0 done mob files convertation.";
close DONE;
