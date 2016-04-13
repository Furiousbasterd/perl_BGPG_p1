#!/usr/bin/perl
use strict;use warnings;
use Switch;

#Declaration des variables et tableaux

my (@A,@B,@X,@M,@U,@L,@R,@D);
my ($a,$b, $x,$m,$u,$l,$r,$d)=0,0,0,0,0,0,0,0;
#my %table; #futur dico (si on veut toujours le faire)
my $rep = "/home/Laurent/Téléchargements";

opendir(REP,$rep) or die "E/S : $!\n";

while(defined(my $fic=readdir REP)){
  my $f="${rep}/$fic";
  if($fic=~/.*\.blt/){
	#~ print $fic; #ça donne tous les noms de fichiers .blt
	switch($fic) {
		case /EcolA_Ecol/		{
			my $i=0; 
			open FIC, "$fic" or warn "$f E/S: $!\n";
			while(<FIC>){
				$_ =~ /^(Ecol.*)\t*(Ecol.[^\t]*)\t[0-9]*\.*[0-9]*\t([0-9]*)\t/; #1er identifiant de gène, puis deuxième, puis score
				my $id1 = $1; my $id2 = $2; my $score = $3; 
				$A[$a][$i]="$id1\t$id2\t$score\n";
				$i+=1;}
			close FIC;
			$a=$a+1; 
		  }
		else {print ""}
	}
    #~ open FIC, "$f" or warn "$f E/S: $!\n";
    #~ while(<FIC>){}
    #~ $h{$f}=$.;
    #~ print $.;
    #~ close FIC;
  }
}


print $A[7][120];


#~ printf "%-35s - $h{$_} ligne(s)\n",$_ for sort keys %h;
__END__
