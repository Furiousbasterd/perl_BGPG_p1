#!/usr/bin/perl
use strict; #use warnings;
use Switch;

#Declaration des variables et tableaux

my $A=1; my $B=2 ;my $X=8; my $M=5 ; my $U=7;my $L=4;my $R=6;my $D=3;
my $I;


#my %table; #futur dico (si on veut toujours le faire)
my $rep = "/home/Laurent/Téléchargements";
my @table;

opendir(REP,$rep) or die "E/S : $!\n";

while(defined(my $fic=readdir REP)){
	my $f="${rep}/$fic";
	if($fic=~/.*\.blt/){
	#~ print $fic; #ça donne tous les noms de fichiers .blt
	switch($fic) {

#Remplissage des premières colonnes => les BP

		  
		  case /EcolA_Ecol/		{
			my $i=0;
			
			if($fic=~/EcolA_EcolA/) {$I=1;}
			if($fic=~/EcolA_EcolB/) {$I=2;}
			if($fic=~/EcolA_EcolD/) {$I=3;}
			if($fic=~/EcolA_EcolL/) {$I=4;}
			if($fic=~/EcolA_EcolM/) {$I=5;}
			if($fic=~/EcolA_EcolR/) {$I=6;}
			if($fic=~/EcolA_EcolU/) {$I=7;}
			if($fic=~/EcolA_EcolX/) {$I=8;}
			
			open FIC, "$fic" or warn "$f E/S: $!\n";
			my $id2=""; #connaître l'ordre des fichiers
			while(<FIC>){
				$_ =~ /^(Ecol.*)\t*(Ecol.[^\t]*)\t[0-9]*\.*[0-9]*\t([0-9]*)\t/; #1er identifiant de gène, puis deuxième, puis score
				my $id1 = $1; $id2 = $2; my $score = $3; 
				$table[$A][$I][$i]=$id1."\t".$id2."\t".$score."\n";
				$i+=1;}
			close FIC; 
		  }
		  
		  case /EcolB_Ecol/		{
			my $i=0;
			
			if($fic=~/EcolB_EcolA/) {$I=1;}
			if($fic=~/EcolB_EcolB/) {$I=2;}
			if($fic=~/EcolB_EcolD/) {$I=3;}
			if($fic=~/EcolB_EcolL/) {$I=4;}
			if($fic=~/EcolB_EcolM/) {$I=5;}
			if($fic=~/EcolB_EcolR/) {$I=6;}
			if($fic=~/EcolB_EcolU/) {$I=7;}
			if($fic=~/EcolB_EcolX/) {$I=8;}
			 
			open FIC, "$fic" or warn "$f E/S: $!\n";
			my $id2=""; #connaître l'ordre des fichiers
			while(<FIC>){
				$_ =~ /^(Ecol.*)\t*(Ecol.[^\t]*)\t[0-9]*\.*[0-9]*\t([0-9]*)\t/; #1er identifiant de gène, puis deuxième, puis score
				my $id1 = $1; $id2 = $2; my $score = $3; 
				$table[$B][$I][$i]=$id1."\t".$id2."\t".$score."\n";
				$i+=1;}
			close FIC; 
		  }
		  
		  case /EcolD_Ecol/		{
			my $i=0;
			
			if($fic=~/EcolD_EcolA/) {$I=1;}
			if($fic=~/EcolD_EcolB/) {$I=2;}
			if($fic=~/EcolD_EcolD/) {$I=3;}
			if($fic=~/EcolD_EcolL/) {$I=4;}
			if($fic=~/EcolD_EcolM/) {$I=5;}
			if($fic=~/EcolD_EcolR/) {$I=6;}
			if($fic=~/EcolD_EcolU/) {$I=7;}
			if($fic=~/EcolD_EcolX/) {$I=8;}
			
			open FIC, "$fic" or warn "$f E/S: $!\n";
			my $id2=""; #connaître l'ordre des fichiers
			while(<FIC>){
				$_ =~ /^(Ecol.*)\t*(Ecol.[^\t]*)\t[0-9]*\.*[0-9]*\t([0-9]*)\t/; #1er identifiant de gène, puis deuxième, puis score
				my $id1 = $1; $id2 = $2; my $score = $3;
				$table[$D][$I][$i]=$id1."\t".$id2."\t".$score."\n";
				$i+=1;}
			close FIC;
		  }
		  
		  case /EcolL_Ecol/		{
			my $i=0;
			
			if($fic=~/EcolL_EcolA/) {$I=1;}
			if($fic=~/EcolL_EcolB/) {$I=2;}
			if($fic=~/EcolL_EcolD/) {$I=3;}
			if($fic=~/EcolL_EcolL/) {$I=4;}
			if($fic=~/EcolL_EcolM/) {$I=5;}
			if($fic=~/EcolL_EcolR/) {$I=6;}
			if($fic=~/EcolL_EcolU/) {$I=7;}
			if($fic=~/EcolL_EcolX/) {$I=8;}
			 
			open FIC, "$fic" or warn "$f E/S: $!\n";
			my $id2=""; #connaître l'ordre des fichiers
			while(<FIC>){
				$_ =~ /^(Ecol.*)\t*(Ecol.[^\t]*)\t[0-9]*\.*[0-9]*\t([0-9]*)\t/; #1er identifiant de gène, puis deuxième, puis score
				my $id1 = $1; $id2 = $2; my $score = $3;
				$table[$L][$I][$i]=$id1."\t".$id2."\t".$score."\n";
				$i+=1;}
			close FIC;
		  }
		  
		  case /EcolM_Ecol/		{
			my $i=0;
			
			if($fic=~/EcolM_EcolA/) {$I=1;}
			if($fic=~/EcolM_EcolB/) {$I=2;}
			if($fic=~/EcolM_EcolD/) {$I=3;}
			if($fic=~/EcolM_EcolL/) {$I=4;}
			if($fic=~/EcolM_EcolM/) {$I=5;}
			if($fic=~/EcolM_EcolR/) {$I=6;}
			if($fic=~/EcolM_EcolU/) {$I=7;}
			if($fic=~/EcolM_EcolX/) {$I=8;}
			
			open FIC, "$fic" or warn "$f E/S: $!\n";
			my $id2=""; #connaître l'ordre des fichiers
			while(<FIC>){
				$_ =~ /^(Ecol.*)\t*(Ecol.[^\t]*)\t[0-9]*\.*[0-9]*\t([0-9]*)\t/; #1er identifiant de gène, puis deuxième, puis score
				my $id1 = $1; $id2 = $2; my $score = $3;
				$table[$M][$I][$i]=$id1."\t".$id2."\t".$score."\n";
				$i+=1;}
			close FIC;
		  }
		  
		  case /EcolR_Ecol/		{
			my $i=0; 
			
			if($fic=~/EcolR_EcolA/) {$I=1;}
			if($fic=~/EcolR_EcolB/) {$I=2;}
			if($fic=~/EcolR_EcolD/) {$I=3;}
			if($fic=~/EcolR_EcolL/) {$I=4;}
			if($fic=~/EcolR_EcolM/) {$I=5;}
			if($fic=~/EcolR_EcolR/) {$I=6;}
			if($fic=~/EcolR_EcolU/) {$I=7;}
			if($fic=~/EcolR_EcolX/) {$I=8;}
			
			open FIC, "$fic" or warn "$f E/S: $!\n";
			my $id2=""; #connaître l'ordre des fichiers
			while(<FIC>){
				$_ =~ /^(Ecol.*)\t*(Ecol.[^\t]*)\t[0-9]*\.*[0-9]*\t([0-9]*)\t/; #1er identifiant de gène, puis deuxième, puis score
				my $id1 = $1; $id2 = $2; my $score = $3;
				$table[$R][$I][$i]=$id1."\t".$id2."\t".$score."\n";
				$i+=1;}
			close FIC;
		  }
		  
		  case /EcolU_Ecol/		{
			my $i=0;
			
			if($fic=~/EcolU_EcolA/) {$I=1;}
			if($fic=~/EcolU_EcolB/) {$I=2;}
			if($fic=~/EcolU_EcolD/) {$I=3;}
			if($fic=~/EcolU_EcolL/) {$I=4;}
			if($fic=~/EcolU_EcolM/) {$I=5;}
			if($fic=~/EcolU_EcolR/) {$I=6;}
			if($fic=~/EcolU_EcolU/) {$I=7;}
			if($fic=~/EcolU_EcolX/) {$I=8;}
			
			open FIC, "$fic" or warn "$f E/S: $!\n";
			my $id2=""; #connaître l'ordre des fichiers
			while(<FIC>){
				$_ =~ /^(Ecol.*)\t*(Ecol.[^\t]*)\t[0-9]*\.*[0-9]*\t([0-9]*)\t/; #1er identifiant de gène, puis deuxième, puis score
				my $id1 = $1; $id2 = $2; my $score = $3;
				$table[$U][$I][$i]=$id1."\t".$id2."\t".$score."\n";
				$i+=1;}
			close FIC;
		  }
		  
		  case /EcolX_Ecol/		{
			my $i=0; 
			
			if($fic=~/EcolX_EcolA/) {$I=1;}
			if($fic=~/EcolX_EcolB/) {$I=2;}
			if($fic=~/EcolX_EcolD/) {$I=3;}
			if($fic=~/EcolX_EcolL/) {$I=4;}
			if($fic=~/EcolX_EcolM/) {$I=5;}
			if($fic=~/EcolX_EcolR/) {$I=6;}
			if($fic=~/EcolX_EcolU/) {$I=7;}
			if($fic=~/EcolX_EcolX/) {$I=8;}
			
			open FIC, "$fic" or warn "$f E/S: $!\n";
			my $id2=""; #connaître l'ordre des fichiers
			while(<FIC>){
				$_ =~ /^(Ecol.*)\t*(Ecol.[^\t]*)\t[0-9]*\.*[0-9]*\t([0-9]*)\t/; #1er identifiant de gène, puis deuxième, puis score
				my $id1 = $1; $id2 = $2; my $score = $3;
				$table[$X][$I][$i]=$id1."\t".$id2."\t".$score."\n";
				$i+=1;}
			close FIC;
		  }
		  
		else {print ""}
	}
  }
}

	
#~ print scalar(@table);
#~ my $taille;
#~ $taille=0;
#~ foreach $i ($table[1][1]){
	#~ $taille++;
#~ }
#~ print $size;

my $double;


for(my $i=1 ; $i<500 ;$i+=1) {my $ligne1=$table[$A][1][$i];
	my $indice=0;
	$ligne1 =~ /(Ecol.*)\t(Ecol.*)\t([0-9]*)/;
	my $ident1=$1; my $scorebp1=$3;
	for my $j (2..8) {
		for(my $k=1 ; $k<500 ;$k+=1) {my $ligne2=$table[$A][$j][$k];
		if ($ligne2 =~ /$ident1/) {
			$ligne2 =~ /(Ecol.*)\t(Ecol.*)\t([0-9]*)/; my $scorebh1=$3; my $ident2=$2;
			if ($scorebh1>$scorebp1) {
				for(my $l=1 ; $l<500 ;$l+=1){
				my $ligne3=$table[$j][1][$l];
				if ($ligne3 =~ /$ident2/) {
				$ligne3 =~ /(Ecol.*)\t(Ecol.*)\t([0-9]*)/;
				my $scorebh2=$3;
				for(my $m=1 ; $m<500 ;$m+=1){
				my $ligne4=$table[$j][$j][$m];
				if ($ligne4 =~ /$ident2/) {
					$ligne4 =~ /(Ecol.*)\t(Ecol.*)\t([0-9]*)/;
					my $scorebp2=$3;
					if ($scorebh2>$scorebp2) {
						$double="id :".$ident1.",".$scorebp1."; id :".$ident2.",".$scorebp2."; scores :".$scorebh1.",".$scorebh2."\n";
						
				}}}}}}}}}}














__END__
