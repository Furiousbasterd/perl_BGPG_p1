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
my @temp;

#Ouverture des fichiers, définition du répertoire (obtention du chemin avec cwd()

opendir(REP,$rep) or die "E/S : $!\n";

print "/!\\ Pour avoir des résultats correcte ";
print "les fichiers doivent suivre la même strucure\n";

while(defined(my $fic=readdir REP)){
	my $f="${rep}/$fic";
	if($fic=~/.*\.blt/){
		push(@temp, $fic);
	}
}
#tri alphabétique de la liste de fichier.
my @temp_sorted = sort @temp;
my $indice = 0;
my $indice_temp;
#on veut libérer le maximum de mémoire utilisé par le tableau
#qui devient inutile au delà de ce point. C'est une précaution.
undef(@temp);

foreach(@temp_sorted){
	#Première boucle pour garder le nom de chaque souche
	$_=~/(.+)\_(.+)\..*/;
	if($1 eq $2){
		$table[$indice][0] = $_;
		$indice++;
	}
}

for(my $i=0;$i<$indice;$i++){
	#Deuxième boucle pour structurer ce qui deviendra notre futur tableau
	#de données. Chaque souche et les chemins des fichiers correspondant
	#sont stocké dans leurs emplacements respectifs
	$table[$i][0]=~/(.+)\_.*/;
	my $souche = $1;
	$indice_temp = 1;
	#lecture du chemin des autre fichier, stockage dans le tableau
	while(<@temp_sorted>){
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
		#extraction du chemin stocké préalablement
		my $file_path = $table[$i][$j];
		$indice_temp = 0;
		open FILE, "$file_path";
		#on se débarasse du header qui nous est inutile
		my $garbage = <FILE>;
		#Lecture de chaque fichier, stockage du tableau à la place du chemin associé.
		while(<FILE>){
			$_ =~/^(\w+\..*)\t(\w+\..*)\t\d+\.\d+\t\d+\t(\d+)/;
			#La regex permet d'extraire l'id de la sequence requete,
			#l'id de la sequence opposée, et enfin le score d'alignement
			$temp_tab[$indice_temp] = $1."\t".$2."\t".$3;
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
	print "\n";
}


