
my class X::DateTime::CannotParse is Exception {
    has $.invalid-str;
    method message() { "Unable to parse {$!invalid-str}" }
}

use DateTime::Parse::Grammar;
use DateTime::Parse::Actions;

class DateTime::Parse is DateTime {
    multi method new(Str $format, :$timezone is copy = 0, :$rule = 'TOP') {
        DateTime::Parse::Grammar.parse($format, :$rule, :actions(DateTime::Parse::Actions))
            or X::DateTime::CannotParse.new( invalid-str => $format ).throw;
        $/.made
    }
}
