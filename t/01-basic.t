use Test;

use DateTime::Parse;

my $rfc1123 = 'Sun, 06 Nov 1994 08:49:37 GMT';

my $dtp = DateTime::Parse.parse($rfc1123, :rfc1123-date);

say $dtp.perl;
