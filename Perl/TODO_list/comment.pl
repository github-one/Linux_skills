#!/usr/bin/perl

use strict;
use warnings;

($#ARGV >= 0) or die "Usge: $0 [c_filename] [anykey for debug].\n";

my $file_name = shift;
open my $fh, "<", $file_name or die "Could not open file: $!\n";

my ($file_size, $lines, $words, $chars, $NBNC_lines, $NBNC_words, $NBNC_chars);

$file_size = -s $file_name;
    print "file_size=$file_size\n";

my $file_str = do { local $/; <$fh> };

$lines  = () = ( $file_str =~ m/^.*?$/mg );
$words  = () = ( $file_str =~ m/\w+/g );
$chars  = length $file_str;

#my @d_words = $file_str =~ m/\w+/g;
#print join "| ", @d_words, "\n";

print '-' x 75, "\n";
print "Raw file: lines=$lines, words=$words, chars=$chars\n";

# for Perl Comments
#$file_str =~ s/^#.*?$//mg;

# for c&c++ comments
my ($match_numbers, $blank_lines);
$match_numbers = 
$file_str =~ s{   /\*  [^*]*\*+  ([^/*][^*]* \*+)* /   ## match most cases /*...*/
               |  // ( [^\\] | [^\n][\n]? )*? \n       ## match most cases //    
               |  (  "( \\. | [^"\\] )*" 
                  |  '( \\. | [^'\\] )*'
                  |  .[^/"'\\]*
                  )
              } 
              { defined $3 ? $3 : "" }gxse;

$blank_lines =
$file_str =~ s/^\s*\n//mg;

print '-' x 75, "\n";
print "match numbers=$match_numbers, blank lines=$blank_lines\n";

my $debug=shift && print $file_str;

$lines  = () = ( $file_str =~ m/^.*?$/mg );
$words  = () = ( $file_str =~ m/\w+/g );
$chars  = length $file_str;
print '-' x 75, "\n";
print "NBNC file: lines=$lines, words=$words, chars=$chars\n";

