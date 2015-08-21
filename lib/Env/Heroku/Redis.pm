use strict;
package Env::Heroku::Redis;
# ABSTRACT: env for heroku-redis

use warnings;
use URI;

# VERSION

sub import {
    my ($self) = @_;

    my $redisurl = $ENV{REDIS_URL} || 'redis://localhost:6379/';
    if ( $redisurl and $redisurl =~ s/^redis:// ) {
        my $url = URI->new( $redisurl, 'http' );
        $ENV{REDISHOST} = $url->host;
        $ENV{REDISPORT} = $url->port;
        (undef,$ENV{REDISPASSWORD}) = split ':', $url->userinfo
            if $url->userinfo;
    }

    return 1;
}

1;
