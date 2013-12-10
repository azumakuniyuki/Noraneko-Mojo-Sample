package Noraneko::Web;
use Mojo::Base 'Mojolicious';
use Path::Class;

sub startup {
    my $self = shift;
    my $home = new Path::Class::File(__FILE__);
    my $root = $home->dir->resolve->absolute->parent->parent();

    for my $e ( 'neko', 'auth' ) {
        my $f = $root->stringify.'/etc/'.$e.'.conf';
        $self->plugin( 'Config', { 'file' => $f } );
    }

    my $r = $self->routes;

    my $ctrl = undef;
    my $lang = [ 'ja', 'en' ];

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
