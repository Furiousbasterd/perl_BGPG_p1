#!/usr/bin/perl
use strict; 
use warnings;
use Cwd;
###################################################
# ATTENTION: Code en chantier                     #
# J'étais très inspiré pour les noms de variables,#
# soyez indulgents, des bisous                    #
###################################################


#Declaration des variables et tableaux

my $A=1; my $B=2 ;my $X=8; my $M=5 ; my $U=7;my $L=4;my $R=6;my $D=3;
my $I;

my $rep = cwd();

my @table;
my @test;

#Ouverture des fichiers, définition du répertoire

opendir(REP,$rep) or die "E/S : $!\n";

while(defined(my $fic=readdir REP)){
	my $f="${rep}/$fic";
	if($fic=~/.*\.blt/){
		push(@test, $fic);
	}
}
my @pouet = sort @test;
my $lol=0;
my $source = $pouet[1];
my $indice2;
#~ foreach(@pouet){
	#~ $_=~/(.+)\_.*/;
	#~ print "$_\n";
	#~ if($1 eq $source){
		#~ $table[$lol][$indice2++] = $_;
	#~ }
	#~ else{
		#~ $indice2 = 0;
		#~ $table[$lol++][$indice2] = $_;}
	#~ $source = $1;
	#~ print $lol."\t".$indice2."\n";
#~ }


foreach(@pouet){
	$_=~/(.+)\_.*/;
	print"$1\n";
	if($source=~/$1/){
		$table[$lol][$indice2++] = $_;
	}
	else{
		$indice2 = 0;
		$table[$lol++][$indice2] = $_;
		$source = $1;
		}	
}

for my $row (@table){
	for my $ligne (@$row){
		print "$ligne\n";
	}
	print"\n";
}

#~ 
#~ for my $ligne (@pouet){
	#~ print "$ligne\n";
	#~ 
#~ }
