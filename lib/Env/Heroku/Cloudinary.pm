use strict;
package Env::Heroku::Cloudinary;
# ABSTRACT: env for cloudinary

use warnings;
use URI;

# VERSION

sub import {
    my ($self) = @_;

    my $cloudinaryurl = $ENV{CLOUDINARY_URL};
    if ( $cloudinaryurl and $cloudinaryurl =~ s/^cloudinary:// ) {
        my $url = URI->new( $cloudinaryurl, 'http' );
        $ENV{CLOUDINARY_CLOUD} = $url->host;
        ($ENV{CLOUDINARY_API_KEY},$ENV{CLOUDINARY_API_SECRET}) = split ':', $url->userinfo
            if $url->userinfo;
    }

    return 1;
}

1;
