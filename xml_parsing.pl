#!/depot/qsc/QSCQ/bin/perl
use XML::Simple;
use Data::Dumper;

# Initialize the object
my $simple = XML::Simple->new();

# Read xml file 
$xml = $simple->XMLin('./sample.xml');

print Dumper($xml), "\n" ;
print "<text>: ", $xml->{text}, "\n";

# Reference:
# https://docstore.mik.ua/orelly/xml/pxml/ch06_02.htm
