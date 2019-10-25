#!/usr/bin/perl

use warnings;
use strict;

use Data::Dumper;
use Time::HiRes qw(time);
use Text::CSV_XS "csv";

use Capture::Tiny ':all';

my @all_data = ();
my @headers = (
  'lang',
  'repo',
  'time',
  'compression',
  'size_before',
  'size_after',
);

push @all_data, [@headers];

opendir(TARS, 'tars/');
while(my $tar = readdir(TARS)){

  # Filter AND pull out names
  next unless $tar =~ /(.*)\_(.*)\.tar$/;
  my ($repo, $lang) = ($1, $2);

  my $data = {};

  $data->{lang} = $lang;
  $data->{repo} = $repo;

  my $start_time = time;
  my ($stdout, $stderr);
  ($stdout, $stderr) = capture {
    system("gzip -k -f -v -1 tars/$tar > /dev/null")
  };
  $data->{time} = time - $start_time;

  # Parse
  $stderr =~ /([0-9]{1,2}\.[0-9])%/;
  $data->{compression} = $1;

  # Get pre/post sizes
  `ls -l tars/$tar` =~ /^.*? .*? .*? .*? (.*?) /;
  $data->{size_before} = $1;

  `ls -l tars/$tar.gz` =~ /^.*? .*? .*? .*? (.*?) /;
  $data->{size_after} = $1;

  push @all_data, [map { $data->{$_} } @headers];
}

my $filename = "results_" . time . ".csv";
csv(in => \@all_data, out => $filename, sep_char => ',');
