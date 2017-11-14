#!/usr/bin/env perl
use warnings;
use strict;

my $on = `"pamixer" "--get-mute"`;
chomp $on;
if ($on eq "true") {
  print "0"."\n";
} else {
  system("pamixer", "--get-volume");
}

