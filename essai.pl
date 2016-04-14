#!/usr/bin/perl
use strict;#use warnings;
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

		case /EcolA_EcolA/		{
			my $i=0; 
			open FIC, "$fic" or warn "$f E/S: $!\n";
			my $id2=""; #connaître l'ordre des fichiers
			while(<FIC>){
				$_ =~ /^(Ecol.*)\t*(Ecol.[^\t]*)\t[0-9]*\.*[0-9]*\t([0-9]*)\t/; #1er identifiant de gène, puis deuxième, puis score
				my $id1 = $1; $id2 = $2; my $score = $3;
				$table[$A][0][$i]="$id1\t$id2\t$score\n";
				$i+=1;}
			close FIC;
		  }	

		case /EcolB_EcolB/		{
			my $i=0; 
			open FIC, "$fic" or warn "$f E/S: $!\n";
			my $id2=""; #connaître l'ordre des fichiers
			while(<FIC>){
				$_ =~ /^(Ecol.*)\t*(Ecol.[^\t]*)\t[0-9]*\.*[0-9]*\t([0-9]*)\t/; #1er identifiant de gène, puis deuxième, puis score
				my $id1 = $1; $id2 = $2; my $score = $3; 
				$table[$B][0][$i]="$id1\t$id2\t$score\n";
				$i+=1;}
			close FIC;
		  }
		  
		case /EcolD_EcolD/		{
			my $i=0; 
			open FIC, "$fic" or warn "$f E/S: $!\n";
			my $id2=""; #connaître l'ordre des fichiers
			while(<FIC>){
				$_ =~ /^(Ecol.*)\t*(Ecol.[^\t]*)\t[0-9]*\.*[0-9]*\t([0-9]*)\t/; #1er identifiant de gène, puis deuxième, puis score
				my $id1 = $1; $id2 = $2; my $score = $3; 
				$table[$D][0][$i]="$id1\t$id2\t$score\n";
				$i+=1;}
			close FIC;
		  }	
		
		
		case /EcolL_EcolL/		{
			my $i=0; 
			open FIC, "$fic" or warn "$f E/S: $!\n";
			my $id2=""; #connaître l'ordre des fichiers
			while(<FIC>){
				$_ =~ /^(Ecol.*)\t*(Ecol.[^\t]*)\t[0-9]*\.*[0-9]*\t([0-9]*)\t/; #1er identifiant de gène, puis deuxième, puis score
				my $id1 = $1; $id2 = $2; my $score = $3; 
				$table[$L][0][$i]="$id1\t$id2\t$score\n";
				$i+=1;}
			close FIC;
		  }
		  
		  case /EcolM_EcolM/		{
			my $i=0; 
			open FIC, "$fic" or warn "$f E/S: $!\n";
			my $id2=""; #connaître l'ordre des fichiers
			while(<FIC>){
				$_ =~ /^(Ecol.*)\t*(Ecol.[^\t]*)\t[0-9]*\.*[0-9]*\t([0-9]*)\t/; #1er identifiant de gène, puis deuxième, puis score
				my $id1 = $1; $id2 = $2; my $score = $3; 
				$table[$M][0][$i]="$id1\t$id2\t$score\n";
				$i+=1;}
			close FIC;
		  }
		  
		  case /EcolR_EcolR/		{
			my $i=0; 
			open FIC, "$fic" or warn "$f E/S: $!\n";
			my $id2=""; #connaître l'ordre des fichiers
			while(<FIC>){
				$_ =~ /^(Ecol.*)\t*(Ecol.[^\t]*)\t[0-9]*\.*[0-9]*\t([0-9]*)\t/; #1er identifiant de gène, puis deuxième, puis score
				my $id1 = $1; $id2 = $2; my $score = $3; 
				$table[$R][0][$i]="$id1\t$id2\t$score\n";
				$i+=1;}
			close FIC;
		  }
		  
		  case /EcolU_EcolU/		{
			my $i=0; 
			open FIC, "$fic" or warn "$f E/S: $!\n";
			my $id2=""; #connaître l'ordre des fichiers
			while(<FIC>){
				$_ =~ /^(Ecol.*)\t*(Ecol.[^\t]*)\t[0-9]*\.*[0-9]*\t([0-9]*)\t/; #1er identifiant de gène, puis deuxième, puis score
				my $id1 = $1; $id2 = $2; my $score = $3; 
				$table[$U][0][$i]="$id1\t$id2\t$score\n";
				$i+=1;}
			close FIC;
		  }
		  
		  case /EcolX_EcolX/		{
			my $i=0; 
			open FIC, "$fic" or warn "$f E/S: $!\n";
			my $id2=""; #connaître l'ordre des fichiers
			while(<FIC>){
				$_ =~ /^(Ecol.*)\t*(Ecol.[^\t]*)\t[0-9]*\.*[0-9]*\t([0-9]*)\t/; #1er identifiant de gène, puis deuxième, puis score
				my $id1 = $1; $id2 = $2; my $score = $3; 
				$table[$X][0][$i]="$id1\t$id2\t$score\n";
				$i+=1;}
			close FIC;
		  }
		  
		  case /EcolA_Ecol[^A]/		{
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
				$table[$A][$I][$i]="$id1\t$id2\t$score\n";
				$i+=1;}
			close FIC; 
		  }
		  
		  case /EcolB_Ecol[^B]/		{
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
				$table[$B][$I][$i]="$id1\t$id2\t$score\n";
				$i+=1;}
			close FIC; 
		  }
		  
		  case /EcolD_Ecol[^D]/		{
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
				$table[$D][$I][$i]="$id1\t$id2\t$score\n";
				$i+=1;}
			close FIC;
		  }
		  
		  case /EcolL_Ecol[^L]/		{
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
				$table[$L][$I][$i]="$id1\t$id2\t$score\n";
				$i+=1;}
			close FIC;
		  }
		  
		  case /EcolM_Ecol[^M]/		{
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
				$table[$M][$I][$i]="$id1\t$id2\t$score\n";
				$i+=1;}
			close FIC;
		  }
		  
		  case /EcolR_Ecol[^R]/		{
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
				$table[$R][$I][$i]="$id1\t$id2\t$score\n";
				$i+=1;}
			close FIC;
		  }
		  
		  case /EcolU_Ecol[^U]/		{
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
				$table[$U][$I][$i]="$id1\t$id2\t$score\n";
				$i+=1;}
			close FIC;
		  }
		  
		  case /EcolX_Ecol[^X]/		{
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
				$table[$X][$I][$i]="$id1\t$id2\t$score\n";
				$i+=1;}
			close FIC;
		  }
		  
		else {print ""}
	}
  }
}

		

















__END__
