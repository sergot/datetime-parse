use Test;

use DateTime::Parse;

# RFC1123
my $rfc1123 = 'Sun, 06 Nov 1994 08:49:37 GMT';

my $dtp = DateTime::Parse.parse($rfc1123, :rfc1123-date);

ok $dtp, 'parse 1/4';

my $rfc = $dtp<rfc1123-date>;
is $rfc, $rfc1123, 'parse 2/?';
is $rfc<wkday>, 'Sun', 'parse 3/?';
is $rfc<date1>, '06 Nov 1994', 'parse 4/?';
is $rfc<time>, '08:49:37', 'parse 5/?';

# RFC850
my $rfc850 = 'Sunday, 06-Nov-94 08:49:37 GMT';

$dtp = DateTime::Parse.parse($rfc850, :rfc850-date);

ok $dtp, 'parse 6/?';

$rfc = $dtp<rfc850-date>;
is $rfc, $rfc850, 'parse 7/?';
is $rfc<weekday>, 'Sunday', 'parse 8/?';
is $rfc<date2>, '06-Nov-94', 'parse 9/?';
is $rfc<time>, '08:49:37', 'parse 10/?';
