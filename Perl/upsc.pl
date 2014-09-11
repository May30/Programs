use strict;

use LWP::Simple;

my $url = 'http://upsc.gov.in/frmain.htm';

open OLD, "< /Users/gopi/upsc.html";
my $old_text = join("", (<OLD>));
close OLD;

my $new_text = get $url;

$new_text =~ s/\s//g;
exit if ($new_text =~ /airtel|Please\s*wait/i);

if ($old_text && $new_text) {
	if ($old_text ne $new_text) {
		my $message = q{osascript -e 'tell app "Finder" to display dialog "UPSC website updated!"'};
		system($message);
	}
}

if ($new_text && $old_text ne $new_text) {
	open NEW, "> /Users/gopi/upsc.html";
	print NEW $new_text;
	close NEW;
}

$new_text = qq{<frame> $new_text </frame><frame><html><body><p><a href="http://upsc.gov.in/exams/final-results/csm/2012/csmfr12_eng.pdf">Final Result CSM - 2012</a></p></body></html>};

open COPY, "> /Users/gopi/Upsc.htm";
print COPY $new_text;
close COPY;
