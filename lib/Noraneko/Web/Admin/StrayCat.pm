package Noraneko::Web::Admin::StrayCat;
use Mojo::Base 'Mojolicious::Controller';

sub found {
    my $self = shift;
    my $lang = $self->stash('lang');

    return $self->render( 'template' => $lang.'/admin/straycat/found' );
}

sub input {
    my $self = shift;
    my $lang = $self->stash('lang');

    return $self->redirect_to( $lang.'/admin/straycat/thank' );
}

sub thank {
    my $self = shift;
    my $lang = $self->stash('lang');

    return $self->render( 'template' => $lang.'/admin/straycat/thank' );
}

1;
__END__
