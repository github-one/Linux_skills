#!/usr/bin/perl

use strict;
use warnings;

($#ARGV == 0) or die "Usage: $0 [textfile]\n";

my $text_file = shift;
open my $fh, "<", $text_file or die "Could not open file: $!";

my ($lines, $words, $chars) = (0,0,0);
while (<$fh>) {
   $lines++;
   $chars += length($_);
   $words += scalar split(/s+/, $_);
}
print "lines=$lines, words=$words, chars=$chars\n";

my $file_size = -s $fh;
print "file size is $file_size.\n";

