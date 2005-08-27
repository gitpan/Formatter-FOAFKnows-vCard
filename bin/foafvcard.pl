#!/usr/bin/perl

# A little perl script to produce foaf::Person from vCards.
#
# Written by Kjetil Kjernsmo, kjetilk@cpan.org, 2004-10-19
# License: Same terms as Perl itself. 

use Formatter::FOAFKnows::vCard;


my $file = shift;
open(VCF, "< ". $file) || die "Cannot open $file";
my @data = <VCF>;
close VCF;

my $formatter = Formatter::FOAFKnows::vCard->format(join('',@data), (uri => 'uri#me'));
print $formatter->document('UTF-8');
