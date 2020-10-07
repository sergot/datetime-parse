use v6;
use Test;
use DateTime::Parse;

plan *;

my $rfc1123   = 'Sun, 06 Nov 1994 08:49:37 GMT';
my $rfc2822   = 'Sun, 06 Nov 1994 08:49:37 -0800';
my $bad       = 'Bad, 06 Nov 1994 08:49:37 GMT';
my $rfc850    = 'Sunday, 06-Nov-94 08:49:37 GMT';
my $rfc850v   = 'Sun 06-Nov-1994 08:49:37 GMT';
my $rfc850vb  = 'Sun 06-Nov-94 08:49:37 GMT';
my $rfc3339_1 = '1985-04-12T23:20:50.52Z';
my $rfc3339_2 = '1996-12-19T16:39:57-08:00';

is DateTime::Parse.new('Sun', :rule<wkday>), 6, "'Sun' is day 6 in rule wkday";
is DateTime::Parse.new('06 Nov 1994', :rule<date1>).sort,
   {"day" => 6, "month" => 11, "year" => 1994}.sort, "we parse '06 Nov 1994' as rule date1";
is DateTime::Parse.new('08:49:37', :rule<time>).sort,
   {"hour" => 8, "minute" => 49, "second" => 37}.sort, "we parse '08:49:37' as rule time";
is DateTime::Parse.new($rfc1123),
   DateTime.new(:year(1994), :month(11), :day(6), :hour(8), :minute(49), :second(37)),
   'parse string gives correct DateTime object';
is DateTime::Parse.new($rfc2822),
   DateTime.new(:year(1994), :month(11), :day(6), :hour(8), :minute(49), :second(37), :timezone(-28800)),
   'parse string gives correct DateTime object';
ok DateTime::Parse::Grammar.parse($rfc1123)<rfc1123-date>, "'Sun, 06 Nov 1994 08:49:37 GMT' is recognized as rfc1123-date";
ok DateTime::Parse::Grammar.parse($rfc2822)<rfc2822-date>, "'$rfc2822' is recognized as rfc2822-date";
throws-like qq[ DateTime::Parse.new('$bad') ], X::DateTime::CannotParse, invalid-str => $bad;
ok DateTime::Parse::Grammar.parse($rfc850)<rfc850-date>, "'$rfc850' is recognized as rfc850-date";
nok DateTime::Parse::Grammar.parse($rfc850v)<rfc850-date>, "'$rfc850v' is NOT recognized as rfc850-date";
nok DateTime::Parse::Grammar.parse($rfc850vb)<rfc850-date>, "'$rfc850vb' is NOT recognized as rfc850-date";
nok DateTime::Parse::Grammar.parse($rfc850)<rfc850-var-date>, "'$rfc850' is NOT recognized as rfc850-var-date";
ok DateTime::Parse::Grammar.parse($rfc850v)<rfc850-var-date>, "'$rfc850v' is recognized as rfc850-var-date";
nok DateTime::Parse::Grammar.parse($rfc850vb)<rfc850-var-date>, "'$rfc850vb' is NOT recognized as rfc850-var-date";
nok DateTime::Parse::Grammar.parse($rfc850)<rfc850-var-date-two>, "'$rfc850' is NOT recognized as rfc850-var-date-two";
nok DateTime::Parse::Grammar.parse($rfc850v)<rfc850-var-date-two>, "'$rfc850v' is NOT recognized as rfc850-var-date-two";
ok DateTime::Parse::Grammar.parse($rfc850vb)<rfc850-var-date-two>, "'$rfc850vb' is recognized as rfc850-var-date-two";
ok DateTime::Parse::Grammar.parse($rfc3339_1)<rfc3339-date>, "'$rfc3339_1' is recognized as rfc3339-date";
ok DateTime::Parse::Grammar.parse($rfc3339_2)<rfc3339-date>, "'$rfc3339_2' is recognized as rfc3339-date";

# RFC 3339 additional tests
subtest {
    ok DateTime::Parse::Grammar.parse("1994-11-06 08:49:37Z")<rfc3339-date>;
    ok DateTime::Parse::Grammar.parse("1994-11-06T08:49:37Z")<rfc3339-date>;
    ok DateTime::Parse::Grammar.parse("1994-11-06t08:49:37Z")<rfc3339-date>;
    ok DateTime::Parse::Grammar.parse("1994-11-06 08:49:37z")<rfc3339-date>;
    ok DateTime::Parse::Grammar.parse("1994-11-06T08:49:37z")<rfc3339-date>;
    ok DateTime::Parse::Grammar.parse("1994-11-06t08:49:37z")<rfc3339-date>;
}, 'RFC 3339 formatted time is case-insensitive';

done-testing;
