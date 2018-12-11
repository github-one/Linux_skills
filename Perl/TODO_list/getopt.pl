#!/usr/bin/perl
use strict;
use warnings;

use Getopt::Long;
use Pod::Usage;
use File::Find;
use File::Basename;

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

if ( scalar @ARGV ) {
    print "Unkwon input: @ARGV\n";
    pod2usage( -verbose => 1 );
}

# for debug only
print "dir is @opt_directory, type is @opt_filetype\n";

#TODO LIST: need to check the directories and filetypes.
if (! scalar( @opt_directory )) {
    @opt_directory = ('.');	 
}
if (! scalar( @opt_filetype )) {
    @opt_filetype = ('*');
}

my (%size, @sorted, $total_of_files);
my @suffixlist = (qr/\.[^.]*/);             # Must locate before the find function

#find( sub { -l && return; $size{$File::Find::name} = -s if -f; }, @opt_directory);
find( \&wanted, @opt_directory);


sub wanted {
    return if ( -l $_ );
    return unless ( -f $_ );

    my $input_file = $_;

    my ($name, $dir, $suffix) = fileparse($input_file, @suffixlist);
    printf "The filename is %s, dir is %s, the suffix is %s\n", $name, $dir, $suffix;

    if ( $suffix eq ".h" or $suffix eq ".c" ) {
        printf "This is c program file,name=$name, suffix=$suffix\n";
        open my $fh, "<", $_ or die "Could not open file: $!";
        my ($lines, $words, $chars);
        while (<$fh>) {
            $lines++;
            $chars += length($_);
            $words += scalar split(/s+/, $_);
        }
        print "lines= $lines, words= $words, chars= $chars\n";
    }

    $size{$File::Find::name} = -s $input_file;
}
    

@sorted = sort {$size{$b} <=> $size{$a}} keys %size;
$total_of_files = scalar @sorted; 


# the following for debugging
print '-' x 20, " Debug Information ", '-' x 20, "\n";

print "help, man = ", $opt_help, " ", $opt_man, "\n";
print "directories = ", join(", ", @opt_directory), "\n";
print "filetype = ", join(", ", @opt_filetype), "\n";
print "file max = ", $opt_max, "\n";

print '-' x 20, "    Debug End      ", '-' x 20, "\n";

foreach (@sorted) {
    printf "%11d %s\n", $size{$_}, $_;
}
printf "The total number of file(s) is %d.\n", $total_of_files;
# the end of debugging



__END__

=head1 NAME

A program which provides statistic of files for the specifi directories.

=head1 SYNOPSIS

A program which provides statistic of files for the specifi directories.

example:  filesreport  -d=./mydir -f=c -f=h

=head1 DESCRIPTION

todo for description

=head2 USAGES 

todo for how to use

=head1 CAVEATS

todo for caveats

=head1 AUTHOR

Created by xuzhongya

