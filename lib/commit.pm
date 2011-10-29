#!/usr/bin/perl

use strict;
use warnings;
use HTTP::Date;
use IO::File;
use DBD::mysql;
use DBI;
use Config::Simple;

package DB_Commit;

use lib '/opt/SYSTEM/perl/log_analyze/lib';
require "output_log.pm";
my $config_path = '/opt/SYSTEM/perl/log_analyze/lib/config.pm';

my $cfgObj = new Config::Simple;
$cfgObj->read($config_path);
my $cfg = $cfgObj->vars();
my $d = $cfg->{'database.db'};
my $u = $cfg->{'database.user'};
my $p = $cfg->{'database.password'};


sub db_commit{
    my $file = $_[0] or die "No File!! $!";

    Output_Log::error_log("DB execute start $file");
    file_commit_db($file) or die "$file is can't db execute!!";
    Output_Log::error_log("DB execute end $file");

    return $file;
}

sub file_commit_db{
    my $file = $_[0];

    my $dbh = DBI->connect($d, $u, $p)
        or die "DB Connect error $!";
    my $sth;
    my $fh;

    if ($file =~ /(.*gz$)|(.*zip$)/i ){
        open $fh, "zcat $file 2>/dev/null |"
            or die "Can't zcat '$file' for reading: $!";
    }else{
        open $fh, "<$file"
            or die "Can't read '$file' for reading: $!";
    }

    while ( my $line = <$fh> ) {
        if ($line !~ /(^$)|(^ +?$)/ ){
            $sth = $dbh->prepare($line) or die "sql execute error $! \n $line\n";
            $sth->execute  or die "sql execute error $! \n $line\n";
        }else{
            print "SKIP LINE\n";
       }

    }

    $sth->finish  or die "DB Connection Close error $!" ;
    $dbh->disconnect;
    close $fh or die "Can't close '$file' : $!";

}


