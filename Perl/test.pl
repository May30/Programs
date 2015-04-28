use strict;
use Data::Dumper;

sub say { print "@_\n"; }

use LWP::Protocol::Net::Curl MAX_RECV_SPEED_LARGE => 250000;
use LWP::Simple;
use Time::HiRes qw(gettimeofday tv_interval);

my $start = [gettimeofday];
getstore 'http://r-stg.epocrates.com/dx/20140506164332/20140325153546/14/1/1/1.zip' => 'r_stg_dx.zip';

say tv_interval($start, [gettimeofday]);
