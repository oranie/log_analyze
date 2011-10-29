#!/usr/bin/perl

package Output_Log;

use strict;
use warnings;
use HTTP::Date;
use Config::Simple;
use utf8;
use Encode;
use Email::MIME;
use Email::MIME::Creator;
use Email::Send;
use IO::All;

use lib '/opt/SYSTEM/perl/log_analyze/lib';
my $config_path = '/opt/SYSTEM/perl/log_analyze/lib/config.pm';

my $cfgObj = new Config::Simple;
$cfgObj->read("$config_path");
my $cfg = $cfgObj->vars();
my $log_file = $cfg->{'log_file.file'};
my $mail_send = $cfg->{'log_file.mail'};

sub init_logfile{
    open(OUT, ">$log_file");
    close(OUT);
}


sub error_log{
    my @log = @_;
    my $now_time = HTTP::Date::time2iso();
    open(OUT, ">>$log_file");
    print OUT "$now_time : @log\n";
    close(OUT);
    print "$now_time : @log\n";
}


sub mail_send{
    my $body = $_[0];
    my $file = $_[1];
    if ($file =~ m/on/){
        $file = io($log_file)->all;
    }

    my @parts = (
         Email::MIME->create(
            'attributes' => {
            'content_type' => 'text/plain',
            'charset'     => 'ISO-2022-JP',
            'encoding'    => '7bit',
            },
            'body' => Encode::encode( 'iso-2022-jp', $body ),
        ),
         Email::MIME->create(
            'attributes' => {
            'content_type' => 'text/plain',
            'charset'     => 'ISO-2022-JP',
            'encoding'    => '7bit',
            },
            'body' => Encode::encode( 'iso-2022-jp', $file ),
        )
    );

    my $mail = Email::MIME->create(
        header => [
            From    => 'root@example.com',
            To      => "$mail_send",
            Subject => Encode::encode('MIME-Header-ISO_2022_JP', 'バッチ処理速報'),
        ],
        parts => [@parts],
    );

    my $sender = Email::Send->new({mailer => 'Sendmail'});
    $sender->send($mail);

    return 0;
}


sub date_check{
    my $date = $_[0] or die print "please ARG YYYYMM example: hogehoge.pl 201106\n\n";
    if ($date !~ /^2[0-9]....$/i){
        die " $date  not YYYYMM format! error !\n";
    }else {
        print "$date OK?? Please Enter y/N\n";
        my $in;
        chomp($in = <STDIN>);
        if ($in == "y"){
            print "OK. execute $date\n";
        }else{
            die "script stop\n";
        }
    }
    return $date;
}

return 1 

