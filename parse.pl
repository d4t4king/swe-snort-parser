#!/usr/bin/perl -w

use strict;
use warnings;

use Data::Dumper;
use Term::ANSIColor;
use File::Slurp;

use lib '.';
use SnortAlert;

my $alert_file = '/var/log/snort/alert';

my $alert_text = read_file($alert_file);
my @raw_alerts = split(/\n\n/, $alert_text);

print "Got ".scalar(@raw_alerts)." alerts.\n";

my $sa = SnortAlert->parsealert($raw_alerts[0]);
print Dumper($sa);

