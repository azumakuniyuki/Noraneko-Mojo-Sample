package Noraneko::Web;
use Mojo::Base 'Mojolicious';
use Path::Class;
use Noraneko::Config;

sub startup {
    my $self = shift;
    my $home = new Path::Class::File(__FILE__);
    my $root = $home->dir->resolve->absolute->parent->parent();
    my $conf = {};
    my $fail = 0;

    for my $e ( 'neko', 'auth' ) {
        my $f = $root->stringify.'/etc/'.$e.'.json';

        eval {
            $conf->{ $e } = $self->plugin( 'JSONConfig', { 'file' => $f } );
        };
        $conf->{ $e } ||= Noraneko::Config->$e;
        $fail = 1 if $@;
        warn $@;
    }

    for my $e ( values %$conf ) {
        while( my( $k, $v ) = each %$e ) {
            $self->defaults->{'config'}->{ $k } = $v;
        }
    }
    $self->defaults->{'config'}->{'site'}->{'maintenance'} = $fail;

    my $r = $self->routes;

    my $ctrl = undef;
    my $lang = [ 'ja', 'en' ];

    if( $self->defaults->{'config'}->{'site'}->{'maintenance'} == 1 ) {
        $ctrl = 'admin-maintenance#index';
        $r->route( '/:lang/maintenance', 'lang' => $lang )->to( $ctrl );
        $r->route( '/:lang/:any', 'lang' => $lang, 'any' => qr/.*/ )->to( $ctrl );
        #for my $e ( 'admin', 'user', 'clinic', 'cat' ) {
        #$ctrl = $e'-maintenance#index';
        #$r->route( '/:lang/maintenance', 'lang' => $lang )->to( $ctrl );
        #$r->route( '/:lang/'.$e.'/:any', 'any' => qr/.*/ )->to( $ctrl );
        #}
    }

    $r->route( '/:lang/user/index', 'lang' => $lang )->to( 'user-root#index' );

    $ctrl = 'user-stray_cat';
    $r->route( '/:lang/user/straycat/found', 'lang' => $lang )->to( $ctrl.'#found' );
    $r->route( '/:lang/user/straycat/input', 'lang' => $lang )->to( $ctrl.'#input' );
    $r->route( '/:lang/user/straycat/thank', 'lang' => $lang )->to( $ctrl.'#thank' );

    $ctrl = 'admin-stray_cat';
    $r->route( '/:lang/admin/straycat/found', 'lang' => $lang )->to( $ctrl.'#found' );
    $r->route( '/:lang/admin/straycat/input', 'lang' => $lang )->to( $ctrl.'#input' );
    $r->route( '/:lang/admin/straycat/thank', 'lang' => $lang )->to( $ctrl.'#thank' );
}

1;
