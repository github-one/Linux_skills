#!/usr/bin/perl

use strict;
use warnings;

use Text::Diff;

($#ARGV >= 1) or die "Usage: $0 file1 file2.\n";
my $file1 = shift;
my $file2 = shift;

my $file_diff = diff $file1, $file2, { STYLE => "OldStyle" };
my $debug = shift;
if( defined $debug ) {
    print $file_diff;
}

my @change_outputs = 
$file_diff =~ m/^\d+(?:,\d+)?[acd]\d+(?:,\d+)?/mg;
#$file_diff =~ m/\d+(,\d+)?[acd]\d+(,\d+)?/mg;  # This is wrong!!! must use ?:

my $output_numbers = scalar @change_outputs;
print "output numbers = $output_numbers\n";
print "output changes = @change_outputs\n";

my ($total_add, $total_del, $total_chg) = (0,0,0);
foreach my $item ( @change_outputs ) {
    my ($a, $b, $op, $c, $d) = ( $item =~ /(\d+)(?:,(\d+))?([acd])(\d+)(?:,(\d+))?/ );

    $b //= $a;
    $d //= $c;

   print "a,b,op,c,d =  $a, $b, $op, $c, $d \n";
    if( $op eq 'a' ) {
        $total_add  += $d - $c +1;
    }
    if( $op eq 'd' ) {
        $total_del += $b - $a +1;
    }
    if( $op eq 'c' ) {
        if( ($b - $a) > ($d - $c) ) {
            $total_del += ($b - $a) - ($d -$c);
            $total_chg += $d - $c +1;
        } else {
            $total_add += ($d - $c) - ($b -$a);
            $total_chg += $b - $a +1;
        }
    }
}
print "total add=$total_add, del=$total_del, change=$total_chg\n";

=begin comment

foreach my $item ( @change_outputs ) {
    my ($a, $b, $op, $c, $d) = ( $item =~ /(\d+)(,\d+)?([acd])(\d+)(,\d+)?/ );
    if( defined $b ) {
        $b =~ s/,//;
    } else {
        $b = $a;
    }

    if( defined $d ) {
        $d =~ s/,//;
    } else {
        $d = $c;
    }
    print "a,b,op,c,d =  $a, $b, $op, $c, $d \n";
    if( $op eq 'a' ) {
        $total_add  += $d - $c +1;
    }
    if( $op eq 'd' ) {
        $total_del += $b - $a +1;
    }
    if( $op eq 'c' ) {
        if( ($b - $a) > ($d - $c) ) {
            $total_del += ($b - $a) - ($d -$c);
            $total_chg += $d - $c +1;
        } else {
            $total_add += ($d - $c) - ($b -$a);
            $total_chg += $b - $a +1;
        }
    }
}

=end comment

=cut

