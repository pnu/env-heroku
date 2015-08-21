use strict;
package Env::Heroku;
# ABSTRACT: set Heroku add-on specific environment variables

# VERSION

=head1 SYNOPSIS
    ## app.psgi
    use Env::Heroku::Pg;
    use Env::Heroku::Redis;

    ## catalyst app config
    'Model::DB' => {
        schema_class => 'WebApp::Schema',
        connect_info => [
            'dbi:Pg:',
            undef, undef, {
                pg_enable_utf8 => 1,
                auto_savepoint => 1,
            }
        ],
    }

=head1 DESCRIPTION
    Set Heroku add-on specific environment variables from Heroku
    config environment variables to the respective default variables.

    For example Env::Heroku::Pg will unpack the DATABASE_URL env
    postgres://user:password@hostname:port/database to env variables
    PGUSER, PGPASSWORD, PGHOST, PGPORT and PGDATABASE and respective DBI_*
    variables.

    This allows site configuration to NOT specify database connection info
    in configuration files that are under version control, but use the Heroku
    env/config pattern to manage such attached resources.

=head1 SEE ALSO
    http://12factor.net/

=cut
