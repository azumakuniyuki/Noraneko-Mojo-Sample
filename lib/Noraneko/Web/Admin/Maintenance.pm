package Noraneko::Web::Admin::Maintenance;
use Mojo::Base 'Mojolicious::Controller';
use strict;
use warnings;

sub index {
    my $self = shift;
    my $lang = $self->stash('lang');

    $self->stash( 'v' => $self->app->config->{'site'}->{ $lang } );
    return $self->render( 'template' => $lang.'/admin/maintenance/index' );
}
1;
