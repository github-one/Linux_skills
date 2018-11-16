#!/usr/bin/perl
use strict;
use warnings;

use Getopt::Long;
use Pod::Usage;
use File::Find;

my ( $opt_help, $opt_man, @opt_directory, @opt_filetype, $opt_max );

$opt_help   = 0;
$opt_man    = 0;
$opt_max    = 10;

GetOptions(
    'help|h|?'          => \$opt_help,
    'man'               => \$opt_man,
    'directory|d=s'     => \@opt_directory,
    'filetype|f=s'      => \@opt_filetype,
    'max|m=i'           => \$opt_max,
)
    or pod2usage( "Try '$0 --man' for more information." );

if ( $opt_help || $opt_man ) {
    pod2usage( -verbose => 2 ) if $opt_man;
    pod2usage( -verbose => 1 ) if $opt_help;
}



if (! scalar( @opt_directory )) {
    @opt_directory = ('.');	 
}
if (! scalar( @opt_filetype )) {
    @opt_filetype = ('*');
}

my (%size, @sorted);
find( sub { -l && return; $size{$File::Find::name} = -s if -f; }, @opt_directory);
@sorted = sort {$size{$b} <=> $size{$a}} keys %size;
 


# the following for debugging

print "help, man = ", $opt_help, " ", $opt_man, "\n";

print join ", ", @opt_directory, "\n";
print join ", ", @opt_filetype, "\n";
print $opt_max, "\n";

foreach (@sorted) {
    printf "%1d %s\n", $size{$_}, $_;
}

# the end of debugging



__END__

=head1 NAME

A program which provides statistic of files for the specifi directories.

=head1 SYNOPSIS

A program which provides statistic of files for the specifi directories.

example:  filesreport  -d=./dir -f=c -f=h

=head1 DESCRIPTION

todo for description

=head2 USAGES 

todo for how to use

=head1 CAVEATS

todo for caveats

=head1 AUTHOR

Created by xuzhongya

