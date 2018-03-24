#! /usr/bin/env perl6

use v6.c;

use DateTime::Parse;
use Test;


plan 1;

subtest "date(1) strings" => {
	my @asctimes = (
		"Fri Mar 23 13:20:46 2018",
		"Thu Mar  3 23:05:25 2005",
	);

	plan @asctimes.elems + 1;

	for @asctimes {
		lives-ok { DateTime::Parse.new($_); }, "$_ parses";
	}

	subtest "Thu Mar  3 23:05:25 2005 parses correctly" => {
		my $dt = DateTime::Parse.new("Thu Mar  3 23:05:25 2005");

		plan 7;

		isa-ok $dt, DateTime, "Returns a DateTime object";

		is $dt.year, 2005, "Year is correct";
		is $dt.month, 3, "Month is correct";
		is $dt.day, 3, "Day is correct";
		is $dt.hour, 23, "Hour is correct";
		is $dt.minute, 5, "Minute is correct";
		is $dt.second, 25, "Second is correct";
	}
}

# vim: ft=perl6 noet
