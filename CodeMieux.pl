#!/usr/bin/perl
use strict; 
#~ use warnings;
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

print "/!\\ Pour avoir des résultats corrects ";
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
	$indice_temp = 0;
	#lecture du chemin des autre fichier, stockage dans le tableau
	while(<@temp_sorted>){
		$_=~/(.+)\_(.+)\..*/;
		if($1 eq $souche){
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
			$_ =~/^(Ecol.*)\t(Ecol.*)\t[0-9]*\.*[0-9]*\t([0-9]*)\t[0-9]*\t[0-9]*\t[0-9]*\t[0-9]*\t[0-9]*\t[0-9]*\t.*\t.*\n/;
			#La regex permet d'extraire l'id de la sequence requete,
			#l'id de la sequence opposée, et enfin le score d'alignement
			$temp_tab[$indice_temp] = $1."\t".$2."\t".$3;
			$indice_temp++;
		}
		close(FILE);
		$table[$i][$j] = [@temp_tab];
	}
}





#Recherche des BBH : 

my $final;
open ($final, ">bilan.txt") || die ("Vous ne pouvez pas créer le fichier \"bilan.txt\"");

#écriture dans mon .gff de l'entête
print( $final "Le core genome d'Escherichia coli à partir de nos 8 souches de départ est constitué de :\n\nNB: le nombre de gènes le constituant est renseigné en fin de fichier\n\n" );


my $compteur=0;

for my $i (0..(my $val = @{$table[0][0]})) {  #EcolA_EcolA a 3203 lignes (selon gedit) mais le dernier gène du génome coeur est ligne 351, donc pendant qu'on code, pour pas faire trop de tour, on met 351
	my $indice=0; #pour savoir quand on en a 7
	my $res=""; #contient les bbh pour un même gène d'Ecola, mais ne s'affiche que si le compteur $indice est à 7
	my $doublon="";
	
	my $ligne1=$table[0][0][$i];
	$ligne1 =~ /^(Ecol.*)\t(Ecol.*)\t([0-9]*)/;
	my $ident1=$1; 
	my $scorebp1=$3;
	print ($final "$ligne1\n");
	if ($ident1 ne ""){
	
	for my $j (1..7) { #pour chaque autre souche...
		for my $k (0..(my $vall = @{$table[0][$j]})) {my $ligne2=$table[0][$j][$k]; #pour chaque ligne du fichier...
			if ($ligne2 =~ /$ident1/) { #si la ligne contient mon $ident1...
				$ligne2 =~ /(Ecol.*)\t(Ecol.*)\t([0-9]*)/;
				my $scorebh1=$3; 
				my $ident2=$2;
			
				if ($scorebh1>$scorebp1) {
					for my $l (0..(my $valll = @{$table[$j][0]})) { #pour chaque ligne du fichier...
						my $ligne3=$table[$j][0][$l];
						if ($ligne3 =~ /$ident2/) {
							$ligne3 =~ /(Ecol.*)\t(Ecol.*)\t([0-9]*)/;
							my $scorebh2=$3;
							for my $m (0..(my $vallll = @{$table[$j][$j]})) { #pour chaque ligne du fichier...
								my $ligne4=$table[$j][$j][$m];
								if ($ligne4 =~ /$ident2/) {
									$ligne4 =~ /(Ecol.*)\t(Ecol.*)\t([0-9]*)/;
									my $scorebp2=$3;
									if ($scorebh2>$scorebp2) {
										my $resultat=$ident2;
										if ($resultat ne $doublon) {
											$indice+=1;
											$res=$res."\n".$resultat;
											if ($indice==7) {
												print ($final "$ident1$res\n\n");
												$compteur+=1
												} 
											}
										$doublon=$ident2;
										}
									}
								}
							}
						}
					}
				}
			}
		}
	}}

print $compteur;
print ($final "Le core génome est constitué de $compteur gènes.");

