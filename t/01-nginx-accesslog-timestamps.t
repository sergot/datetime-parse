#! /usr/bin/env perl6

use v6.c;

use DateTime::Parse;
use Test;

my @timestamps = «
	"28/Mar/2018:10:20:01 +0000"
	"28/Mar/2018:10:20:04 +0000"
	"28/Mar/2018:10:20:07 +0000"
	"28/Mar/2018:10:20:09 +0000"
	"28/Mar/2018:10:20:51 +0000"
	"28/Mar/2018:10:21:15 +0200"
	"28/Mar/2018:10:21:17 +0030"
»;

plan @timestamps.elems + 1;

for @timestamps {
	lives-ok { DateTime::Parse.new($_); }, "$_ parses";
}

subtest "28/Mar/2018:10:21:17 +0000 parses correctly" => {
	my $dt = DateTime::Parse.new("28/Mar/2018:10:21:17 +0000");

	plan 7;

	isa-ok $dt, DateTime, "Returns a DateTime object";

	is $dt.year, 2018, "Year is correct";
	is $dt.month, 3, "Month is correct";
	is $dt.day, 28, "Day is correct";
	is $dt.hour, 10, "Hour is correct";
	is $dt.minute, 21, "Minute is correct";
	is $dt.second, 17, "Second is correct";
}

# vim: ft=perl6 noet
