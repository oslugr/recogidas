#!/usr/bin/env perl

use strict;
use warnings;

use v5.14;

use File::Slurp::Tiny qw(read_lines write_file);

my $mons =  { 'Jan' => 1,
	      'Feb' => 2,
	      'Mar' => 3,
	      'Apr' => 4,
	      'May' => 5,
	      'Jun' => 6,
	      'Jul' => 7,
	      'Aug' => 8,
	      'Sep' => 9,
	      'Oct' => 10,
	      'Nov' => 11,
	      'Dec' => 12 };

my $file = shift || "recogidas.dat";

my @times = read_lines($file);

@times || die "No times";

my %recogidas;
say "Año,Mes,Recogidas";
for my $t (@times) {
    my ($mon, $year ) = ($t =~ /(\w{3})\s+\d+\s+(\d{4})/ );
    say $t;
    if ( $mon && $year ) {
      my $month = sprintf( "%02d", $mons->{$mon} );
      say "$year,$month";
      $recogidas{"$year,$month"}++;
    } else {
      die "bad $t";
    }
  }

for my $r ( sort { $a cmp  $b } keys %recogidas ) {
  say "$r, $recogidas{$r}";
}
