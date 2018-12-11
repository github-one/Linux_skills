#!/usr/bin/perl
use strict;
use warnings;

use Excel::Writer::XLSX;

my $workbook = Excel::Writer::XLSX->new( 'simple.xlsx' );
my $worksheet = $workbook->add_worksheet();

$worksheet->write( "A1", "Hi Excel!" );
$worksheet->write( "B3", "second row" );

my $error_format = $workbook->add_format( color => 'red', );
$worksheet->write( "B2", "This is red", $error_format );

my $format = $workbook->add_format();
$format->set_bold();
$format->set_color('red');
$format->set_align('center');

my ($row, $col) = (3,3);
$worksheet->write( $row, $col, "Hi, New Excel!", $format );
$worksheet->write( $row+1, $col, "Hi, plain Excel!" );

$worksheet->write( 5, 1, "233");
$worksheet->write( 6, 1, "13");
$worksheet->write( 7, 1, "55");
$worksheet->write( "B9", '=SUM(B6:B8)' );

$workbook->close;

