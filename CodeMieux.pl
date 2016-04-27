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


my $final;
open ($final, ">bilan.txt") || die ("Vous ne pouvez pas créer le fichier \"bilan.txt\"");

#écriture dans mon .gff de l'entête
print( $final "Résultats !\n\n" );



my $compteur=0;

for my $i (0..(my $val = @{$table[0][0]})-1) { #pour chacune des lignes de EcolA_EcolA
	my $indice=0; #pour savoir quand on en a 7
	my $res="\n"; #contient les bbh pour un même gène d'Ecola, mais ne s'affiche que si le compteur $indice est à 7
	my $doublon="";
	
	my $ligne1=$table[0][0][$i]; #lecture de la ligne d'EcolA_EcolA
	$ligne1 =~ /^(\w+\..*)\t(\w+\..*)\t(\d+)/; #stock d'infos
	my $ident1=$1; 
	my $scorebp1=$3;
	
	for my $j (1..7) { #pour chaque autre souche...
		for my $k (0..(my $vall = @{$table[0][$j]})) { #pour chaque ligne du fichier EcolA_Ecolj...
			my $ligne2=$table[0][$j][$k]; 
			if ($ligne2 =~ /$ident1/) { #si la ligne contient mon $ident1...
				$ligne2 =~ /^Ecol.*\t(Ecol.*)\t([0-9]*)/; #stock d'infos
				my $scorebh1=$2; 
				my $ident2=$1;
			
				if ($scorebh1>$scorebp1) {
					for my $l (0..(my $valll = @{$table[$j][1]})) { #pour chaque ligne du fichier Ecolj_EcolA...
						my $ligne3=$table[$j][0][$l];
						if ($ligne3 =~ /$ident2/) {
							$ligne3 =~ /(Ecol.*)\t(Ecol.*)\t([0-9]*)/; #stock d'infos
							my $scorebh2=$3;
							for my $m (0..(my $vallll = @{$table[$j][$j]})) { #pour chaque ligne du fichier Ecolj_Ecolj...
								my $ligne4=$table[$j][$j][$m];
								if ($ligne4 =~ /$ident2/) {
									$ligne4 =~ /(Ecol.*)\t(Ecol.*)\t([0-9]*)/; #stocks d'infos
									my $scorebp2=$3;
									if ($scorebh2>$scorebp2) {
										print ($final "$ident1\t$ident2\t$scorebp1\t$scorebh1\t$scorebp2\t$scorebh2\n");
										my $resultat=$ident1."___".$ident2;
										if ($resultat ne $doublon) {
											$indice+=1;
											$res=$res."\n".$resultat;
											if ($indice==6) {
												#~ print ($final "$res\n");
												$compteur+=1
												} 
											}
										$doublon=$ident1."___".$ident2;
										}
									}
								}
							}
						}
					}
				}
			}
		}
	}

#~ print $compteur/8; #environ 236 gènes dans le G_coeur
print "lol";


