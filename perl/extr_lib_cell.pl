#!/usr/local/bin/perl -w

# usage :
# echo single-line-of-text | perl -w -n script 

if( /lib(?:rary)?\s*:\s*(\S+)/i ) {
	$lib = $1;
	if( /cell\s*:\s*(\S+)/i ){
		print "$lib $1\n";
	}
} elsif ( m#/# ){
	while( m#(\S+)\s*/\s*(\S+)#g ){
		print "$1 $2 ";
	}
	print "\n";
}
	
	
	
# tests
# library : kansas whatever cell : city
# lib : texas whaterver cell : austin
# mass/boston new_york/rochester
