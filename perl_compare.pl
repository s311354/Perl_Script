#!/usr/bin/env perl
#-----------------#
# PROGRAM: Parsing string
#-----------------#

use strict;
use warnings;
use 5.010;

# File Handles
open my $content, '<', $ARGV[0] or die "Could not open 'file': $! \n";
open my $datafile, '<', $ARGV[1] or die "Could not open 'file': $! \n";

# File Storage
open my $load, '>', "load.txt" or die "Cannot open output.txt: $!";

my @sim_result;
my @data;

my $line;
my $line_data;

###############################
# Parsing the input files
###############################
while ( $line = <$content> ) {
  chomp $line;

  # Read Simulation Result
  if ($line =~ s/IRAM(.*)/$1/) {
    if ($line =~ s/LoadWord = (\w+)    (\d+)/$1/) {
      $line =~ s/^\s+//;
      push @sim_result , $line;
      #print "$line";
    }
  }

}

while ( $line_data = <$datafile> ) {
  chomp $line_data;

  # Read Simulation Result
  if ($line_data =~ /@/) {
    }
  else {
    # Read_Date file
    push @data , $line_data;
    #print "$line_data";
  }

}

Compare(\@sim_result, \@data);

close $content or die "can't close file: $!";
close $datafile or die "can't close file: $!";
close $load or die "can't close file: $!";

###############################
# Compare the data
###############################
sub Compare {
  my ( $sim_result, $load_data) = @_;
  my @sim   = @{  $sim_result };
  my @data  = @{  $load_data };

  my $sim_count;
  my $data_count;
  $sim_count  = scalar(@sim);
  $data_count = scalar(@data);
  print "$sim_count, $data_count \n";

  # Loop over the array
  foreach (@sim)
  {
      print $load "$_"; # Print each entry in our array to the file
  }

  for (my $idx = 0; $idx < $sim_count ; $idx ++) {
    if ($sim[$idx] =~ $data[$idx]) {
    }
    else {
      print "sim_result = $sim[$idx] godlen_data = $data[$idx]";
    }
  }
}
