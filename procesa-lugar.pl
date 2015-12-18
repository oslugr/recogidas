#!/usr/bin/env perl

use strict;
use warnings;

use v5.14;

use File::Slurp::Tiny qw(read_lines write_file);

my $file = shift || "lugares.csv";

my @recogidas = read_lines($file);

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

my $patterns =  { "(facu|escu|ets|e\.t\.s\.|e t s|f.psi|ffcc|trad|farmacia)" => "Facultad o Escuela",
		  "(centro|inst|csirc)"  => "Centro o Instituto",
		  "(biblio|bilio)" => "Biblioteca",
		  "(fund)" =>"Fundación"  };

my $sub_patterns = { "de ciencias\$" => "Ciencias",
		     "(etsiit|inform)" => "Informática",
		     "educa" => "Ciencias de la Educación",
		     "sociolog" => "Políticas y Sociologia"};

my %recogidas;
say "Año,Lugar,Recogidas";
for my $r (@recogidas) {
  my ($sin_comillas) = ($r =~ /\"(.*)\"/);
  my ($t,$lugar) = split(",", $sin_comillas);
  my ($year ) = ($t =~ /\w{3}\s+\d+\s+(\d{4})/ );
  if ( !$year ) {
    die "bad $t";
  }
  $recogidas{"$year"}{normaliza($lugar)}++;
  
}

for my $r ( sort { $a cmp  $b } keys %recogidas ) {
  for my $l ( keys %{$recogidas{$r}} ) {
    say "$r, $l, $recogidas{$r}{$l}";
  }
}

sub normaliza {
  my $sub = shift;
  $sub = lc $sub;

  my $res = "Servicios centrales";
  for my $p (keys %$patterns) {
    if ($sub =~ qr/$p/ ) {
      $res = $patterns->{$p};
    }
  }

  for my $p (keys %$sub_patterns) {
    if ($sub =~ qr/$p/ ) {
      $res = $sub_patterns->{$p};
    }
  }
#  say "$res=> $sub";
  return $res;
}
