use strict;
use Data::Dumper;
use Modern::Perl;

a();

sub AUTOLOAD { our $AUTOLOAD;
no strict 'refs';
my $b = sub { say 'b'; };

*{ $AUTOLOAD } = $b;


*{'c'} = $b;
c();

}
