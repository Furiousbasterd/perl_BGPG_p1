#!/usr/bin/perl
use strict; 
use warnings;
use Cwd;
#####################################################
# ATTENTION: Code en chantier                       #
# Les tableaux se remplissent dans l'ordre souhaité,#
# self vs self en position 0 pour chaque souche		#
# soyez indulgents, des bisous                      #
#####################################################


#Declaration des variables et tableaux
my $rep = cwd();

my @table;
my @test;

#Ouverture des fichiers, définition du répertoire (obtention du chemin avec cwd()

opendir(REP,$rep) or die "E/S : $!\n";

print "/!\\ Pour avoir des résultats correcte ";
print "les fichiers doivent suivre la même strucure\n";

while(defined(my $fic=readdir REP)){
	my $f="${rep}/$fic";
	if($fic=~/.*\.blt/){
		push(@test, $fic);
	}
}
my @pouet = sort @test;
my @test2;
my $indice = 0;


foreach(@pouet){
	$_=~/(.+)\_(.+)\..*/;
	if($1 eq $2){
		$table[$indice][0] = $_;
		$indice++;
	}		
}
my $indice_temp;
my @test3;

for(my $i=0;$i<$indice;$i++){
	$table[$i][0]=~/(.+)\_.*/;
	my $souche = $1;
	$indice_temp = 1;
	while(<@pouet>){
		$_=~/(.+)\_(.+)\..*/;
		if($1 eq $souche && $2 ne $souche){
			$table[$i][$indice_temp++] = $_;
		}	
	}	
}

for(my $i=0;$i<$indice;$i++)
{
	for(my $j=0;$j<$indice;$j++){
		my @temp_tab;
		my $file_path = $table[$i][$j];
		$indice_temp = 0;
		open FILE, "$file_path";
		my $garbage = <FILE>; #on se débarasse du header qui nous est inutile
		while(<FILE>){
			$temp_tab[$indice_temp] = $_;
			$indice_temp++;
		}
		close(FILE);
		$table[$i][$j] = [@temp_tab];
	}
}

for (my $i=0; $i<$indice;$i++){
	for(my $j=0;$j<$indice;$j++){
		print $table[$i][$j][0]."\n";
	}
}


