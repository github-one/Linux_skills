#!/usr/bin/perl

use strict;
use warnings;
use File::Find;

($#ARGV == 0 ) or die "Usage: $0 [directory]\n";
my @dirs = shift;
my $counter = 0;

find( { preprocess  => sub {    
                                my @dir = grep {-d} @_; 
                                @dir = grep { not $_ =~ /\.git/ } @dir;  
                                return sort @dir; 
                                },
                                
        wanted      => sub { $counter++; print "$counter: $File::Find::name\n"; },
      },
      @dirs );

print "Total number of directories is $counter.\n";


find( { preprocess  => sub {    
                                my @dir = grep { not $_ =~ /\.git/ } @_;  
                                return sort @dir; 
                                },
                                
        wanted      => sub { 
                                return if ( not -f );
                                $counter++; 
                                print "$counter: $File::Find::name\n"; 
                                },

      },
      @dirs );
print "Total number of files is $counter.\n";
