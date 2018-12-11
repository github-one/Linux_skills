#!/usr/bin/perl 

use strict;
use warnings;

use File::DirCompare;

($#ARGV >= 1) or die "Usage: $0 dir1 dir2 debug_flag\n";

my ($dir1, $dir2, $debug) = @ARGV;
print "dir1=$dir1, dir2=$dir2, deubg=$debug\n";

my (@list, @modified);

my $ref = sub { 
    my ($a, $b) = @_;
    if( ! $b ) {
        push @list, "D     $a";
    } elsif( ! $a )  {
        push @list, "A     $b";
    } else {
        if( -f $a && -f $b ) {
            push @list, "M     $b";
            push @modified, $b;
        } else {
            push @list, "D      $a";
            push @list, "A      $b";
        }
    }
};

File::DirCompare->compare( $dir1, $dir2, $ref );
if( $debug ) {
    print join "\n", @list, "\n";
    print join "\n", @modified, "\n";
}
print '-' x 80, "\n";
print "Total list:", scalar @list, " total modified:", scalar @modified, " \n";


use Directory::Diff 'directory_diff';

my ($diff_num, $old_num, $new_num) = (0,0,0);

open my $fh, '>', "output.txt" or die "Could not open file: $!";

directory_diff( $dir1, $dir2, { diff => \&diff, 
                                dir1_only => \&old_only, 
                                dir2_only => \&new_only
                              });

sub diff {
    my ($data, $dir1, $dir2, $file) = @_;
    $debug && print "Diff:  $dir1=> $file is different from $dir2.\n";
    $debug && print $fh "Diff:  $dir1=> $file is different from $dir2.\n";
    $diff_num++;
}

sub old_only {
    my ($data, $dir1, $file) = @_;
    $debug && print "Del:   $dir1=> $file is only in the old directory.\n";
    $debug && print $fh "Del:   $dir1=> $file is only in the old directory.\n";
    $old_num++;
}

sub new_only {
    my ($data, $dir2, $file) = @_;
    $debug && print "Add:   $dir2=> $file is only in the new directory.\n";
    $debug && print $fh "Add:   $dir2=> $file is only in the new directory.\n";
    $new_num++;
}

print '-' x 80, "\n";
print "Total diff=$diff_num, old=$old_num, new=$new_num \n";
print $fh "Total diff=$diff_num, old=$old_num, new=$new_num \n";
close $fh;


