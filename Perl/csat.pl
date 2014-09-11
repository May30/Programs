use strict;

my $TOTAL_QUESTIONS = 80;

my ($wrong, $noattempt) = (0, 0);

$wrong = $ARGV[0] if ($ARGV[0]);
$noattempt = $ARGV[1] if ($ARGV[1]);

chomp($wrong);
chomp($noattempt);
if ($wrong =~ /^\d{1,2}$/i && $noattempt =~ /^\d{1,2}$/i) {
	print "\nYour score: " . ( ($TOTAL_QUESTIONS - $noattempt - $wrong) * 2.5 - $wrong * 2.5/3 ) . "\n";
}
