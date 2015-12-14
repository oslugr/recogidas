#!/usr/bin/env perl

use strict;
use warnings;

use v5.14;

use Date::Parse;
use File::Slurp::Tiny qw(read_lines write_file);

my $file = shift || "recogidas.dat";

my @times = read_lines($file);

@times || die "No times";

my %recogidas;
say "Año,Mes,Recogidas";
for my $t (@times) {
  if ($t =~ /\w+ (.+) GMT/ ) {
    my ($stripped_time ) = $1;
    my @this_time = strptime( $stripped_time );
    if ( $this_time[5] && $this_time[4] ) {
      my $month = sprintf( "%02d", $this_time[4]+1 );
      my $year = $this_time[5]+1900;
      $recogidas{"$year,$month"}++;
    }
  }
}

for my $r ( sort { $a cmp  $b } keys %recogidas ) {
  say "$r, $recogidas{$r}";
}
