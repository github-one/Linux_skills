#!/usr/bin/perl

use strict;
use warnings;
use File::Basename;

my @file_names = qw(
                    /usr/local/perl.tar.gz
                    ../hello.c
                    ./he.cpp
                    /root/tom/temp/perl.gz
                    perl.6.7.pl
                    world.c.h.txt
                    );
my @file_exts = qw(
                    .c
                    .h
                    .txt
                    .pl
                    .cpp
                   );
my %hash_exts = map {$_ => 1} @file_exts;
my @target_files;

my $full_name = "/usr/local/perl.tar.gz";

my ($file, $dir, $ext) = fileparse( $full_name, qr/\.[^.]*/);
print "file=$file, dir=$dir, ext=$ext\n";


for my $f (@file_names) {
   #($file, $dir, $ext) = fileparse( $f, @file_exts );
   #($file, $dir, $ext) = fileparse( $f, @file_exts, qr/\.[^.]*/ );
   ($file, $dir, $ext) = fileparse( $f, qr/\.[^.]*/ );
   if (exists ($hash_exts{$ext})) {
        push @target_files, $f;
        print "Found: ";
   }
   print "input=$f, file=$file, dir=$dir, ext=$ext\n";
}

print "-" x 20, " Target Files ", scalar @target_files, " ",  "-" x 20, "\n";
print join "\n", @target_files;
print "\n", "-" x 20, " End ", "-" x 31, "\n";

