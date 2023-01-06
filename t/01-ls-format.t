#! /usr/bin/env raku

use v6.c;

use DateTime::Parse;
use Test;

my @timestamps = «
	"Jan  12  2022"
	"Oct  8  10:37"
	"Nov  18  00:41"
	"Apr  19  2022"
	"Jan  2  22:57"
»;

my $today = Date.today;

plan @timestamps.elems + 4;

for @timestamps {
	lives-ok { DateTime::Parse.new($_); }, "$_ parses";
}

subtest "Jan  12  2022 parses correctly" => {
	my $dt = DateTime::Parse.new("Jan  12  2022");

	plan 7;

	isa-ok $dt, DateTime, "Returns a DateTime object";

	is $dt.year, 2022, "Year is correct";
	is $dt.month, 1, "Month is correct";
	is $dt.day, 12, "Day is correct";
	is $dt.hour, 0, "Hour is correct";
	is $dt.minute, 0, "Minute is correct";
	is $dt.second, 0, "Second is correct";
}

subtest "Apr  19  2022 parses correctly" => {
	my $dt = DateTime::Parse.new("Apr  19  2022");

	plan 7;

	isa-ok $dt, DateTime, "Returns a DateTime object";

	is $dt.year, 2022, "Year is correct";
	is $dt.month, 4, "Month is correct";
	is $dt.day, 19, "Day is correct";
	is $dt.hour, 0, "Hour is correct";
	is $dt.minute, 0, "Minute is correct";
	is $dt.second, 0, "Second is correct";
}

subtest "Jan  2  22:57 parses correctly" => {
	my $dt = DateTime::Parse.new("Jan  2  22:57");

	plan 7;

	isa-ok $dt, DateTime, "Returns a DateTime object";

	is $dt.year, $today.year, "Year is correct";
	is $dt.month, 1, "Month is correct";
	is $dt.day, 2, "Day is correct";
	is $dt.hour, 22, "Hour is correct";
	is $dt.minute, 57, "Minute is correct";
	is $dt.second, 0, "Second is correct";
} if $today.month > 1 || $today.day > 2;


subtest "Dec  18  00:41 parses correctly" => {
	my $dt = DateTime::Parse.new("Dec  18  00:41");

	plan 7;

	isa-ok $dt, DateTime, "Returns a DateTime object";

	is $dt.year, $today.year - 1, "Year is correct";
	is $dt.month, 12, "Month is correct";
	is $dt.day, 18, "Day is correct";
	is $dt.hour, 0, "Hour is correct";
	is $dt.minute, 41, "Minute is correct";
	is $dt.second, 0, "Second is correct";
} if $today.month < 12 || $today.day < 18; 

# vim: ft=perl6 noet
