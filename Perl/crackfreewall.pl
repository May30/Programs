use strict;
my ($X, $Y, $m, $n, $w) = @ARGV;

$X ||= 32;
$Y ||= 10;
$m ||= 2;
$n ||= 3;
$w ||= 1;

my $rows = $Y/$w;
my $combshash = {};
my $rowcount = 0;
my $result = {};

my $combs = GetCombinations($X, $m, $n);

foreach my $row (@$combs) {
	$result->{$rowcount, 1} = 1;
	$combshash->{$rowcount++} = $row;
	my $count = $row->[0];
	my $rowlength = (scalar @$row)-1;
	for(my $i = 1; $i <= $rowlength; $i++) {
		$count += $row->[$i];
		$row->[$i] = $count;
	}
}

$rowcount--;
undef $combs;

my $nocrackcombs = NoCrackCombPairs($combshash);

undef $combshash;
my $ways;

for (my $i = 2; $i <= $rows; $i++) {
	for (my $key = 0; $key <= $rowcount; $key++) {
		foreach my $j (@{$nocrackcombs->{$key}}) {
			$result->{$key, $i} += $result->{$j, $i-1};
		}
		$ways += $result->{$key, $i} if ($i == $rows);
		delete $result->{$key, $i-2} if ($i >= 3);
	}
}

print $ways;

sub GetCombinations() {
	my ($rowlength, @bricks) = @_;
	my @combinations;

	if ($rowlength < 1) {
		my @temp = ();
		push @combinations, \@temp;
		return \@combinations;
	}

	foreach my $brick (@bricks) {
		next if ($rowlength < $brick);
		my $temp = GetCombinations($rowlength-$brick, @bricks);
		unshift (@$_, $brick) for @$temp;
		push @combinations, @$temp;
	}

	return \@combinations;
}

sub NoCrackCombPairs {
	my $combshash = shift;
	my $nocrackcombs = {};
	for (my $i = 0; $i < $rowcount; $i++) {
		for (my $j = $i+1; $j < $rowcount+1; $j++) {
			my $check = 1;
			foreach my $x (@{$combshash->{$i}}) {
				last if ($x == $X);
				foreach my $y (@{$combshash->{$j}}) {
					last if ($y == $X);
					if ($x == $y) {
						$check = 0;
						last;
					}
				}
				last if (!$check);
			}
			if ($check) {
				push @{$nocrackcombs->{$i}}, $j;
				push @{$nocrackcombs->{$j}}, $i;
			}
		}
	}
	return $nocrackcombs;
}

