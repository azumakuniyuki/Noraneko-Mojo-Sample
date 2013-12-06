package Noraneko::Web::User::Root;
use Mojo::Base 'Mojolicious::Controller';
use Noraneko::Util::Device;

sub index {
    my $self = shift;
    my $lang = $self->stash('lang');

    return $self->render( 'template' => $lang.'/user/root/index' );
}

1;
__END__
