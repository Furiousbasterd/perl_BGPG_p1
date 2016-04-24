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
my $indice_temp=0;
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
for(my $i=0;$i<8;$i++)
{
	for(my $j=0;$j<8;$j++){
	print $table[$i][$j]."\n";
}
}





