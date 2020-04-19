package Ehrss::SI;

use utf8::all;
use Moose;
use Mojo::UserAgent;
use Mojo::Cookie::Response;
use JSON;
#use Config::Any;


use namespace::autoclean;

use strict;
use warnings;

use Ehrss::SI::Token;


has 'session' => (
  is => 'ro',
  isa => 'Ehrss::SI::Token',
  required => 1,
);

has 'xsrf' => (
  is => 'ro',
  isa => 'Ehrss::SI::Token',
  required => 1,
);

has 'company_id' => (
  is => 'ro',
  isa => 'Str',
  required => 1,
);

has 'ua' => (
  is => 'rw',
  isa => 'Mojo::UserAgent',
  default => sub {
    my $ua = Mojo::UserAgent->new;
  },
);



sub BUILD {
  my $self = shift;

  unless ($self->xsrf->name eq 'XSRF-TOKEN') {
    die "xsrf's name should be 'XSRF-TOKEN'";
  }

  die "session's name should be 'SESSION'"  
    unless $self->session->name eq 'SESSION';
  
  $self->add_cookie($self->session);
  $self->add_cookie($self->xsrf);

}

sub add_cookie {
  my $self = shift;
  #my $prefix = shift;
  my $cookie = shift;
  my $ua = $self->ua;
  $ua->cookie_jar->add(
  	Mojo::Cookie::Response->new(
    name   => $cookie->name,
    value  => $cookie->value,
    domain => $cookie->domain,
    path   => $cookie->path,)
    )
    or die "Adding cookie failed!";
  return 1;
}


sub get_company_info {
  my $self = shift;
  my $company;
  return $company;
}

sub get_person_info {
  my $self = shift;
  my $person_id = shift;
  my $person;
  return $person;
}

sub is_retired {
  my $self = shift;
  my $person_id = shift;
  return;
}

sub is_insuring {
  my $self = shift;
  my $person_id = shift;
  return ;
}

sub insure_info {
  ...
}

sub retire_info {
  ...
}

sub insure_account {
  ...
}

sub pension_account {
  ...
}

sub save_insure_prove {
  ...
}

sub save_pension_prove {
  ...
}

sub save_si_info {
  ...
}

1;
