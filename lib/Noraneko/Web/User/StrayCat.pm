package Noraneko::Web::User::StrayCat;
use Mojo::Base 'Mojolicious::Controller';

sub found {
    my $self = shift;
    my $lang = $self->stash('lang');

    return $self->render( 'template' => $lang.'/user/straycat/found' );
}

sub input {
    my $self = shift;
    my $lang = $self->stash('lang');

    return $self->redirect_to( $lang.'/user/straycat/thank' );
}

sub thank {
    my $self = shift;
    my $lang = $self->stash('lang');

    return $self->render( 'template' => $lang.'/user/straycat/thank' );
}

1;
__END__
