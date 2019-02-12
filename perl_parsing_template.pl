 #!/usr/bin/env perl
 #-----------------#
 # PROGRAM:
 # File Name    :
 # Created By   :
 # Created Date :
 # Description  :
 #-----------------#

 use strict;
 use warnings;
 use 5.010;

 # Default parameter
 my $line;

 # Additional parameter


 # (Input) File Handler
 open my $content, '<', $ARGV[0] or die "Could not open 'file': $! \n";

 # (Output) Storage File
 open my $load, '>', "output.txt" or die "Cannot open storage file: $!";
###############################
# CMD line
###############################
if(!$ARGV[0]) {
   print "## Please specify a file name!! ##\n";
   print "Usage: perl \n";
   exit;
}

###############################
# Parsing the input files
###############################
while ( $line = <$content> ) {
  chomp $line;

  # Condition (please modify this condition)
  if ($line =~ /(.*)(\(0x0.*\))(.*)/) {
      #print "$line";

  }

}

close $content or die "can't close file: $!";
close $load or die "can't close file: $!";

###############################
# Additional Subfunction
###############################
