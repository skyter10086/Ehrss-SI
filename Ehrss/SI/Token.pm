package Ehrss::SI::Token;

use Moose;
use namespace::autoclean;
use utf8::all;

use strict;
use warnings;

has 'name' => (
  is => 'rw',
  isa => 'Str',
  required => 1,
);

has 'value' => (
  is => 'rw',
  isa => 'Str',
  required => 1,
);

has 'domain' => (
  is => 'rw',
  isa => 'Str',
  required => 1,
);

has 'path' => (
  is => 'rw',
  isa => 'Str',
  required => 1,
);


sub as_string {
  my $self = shift;
  my $cookie_array = ['name='. $self->name, 'value='.$self->value, 
                      'domain='.$self->domain, 'path='.$self->path];
  my $str = join "; " , @{$cookie_array};
  return $str;
}
  

1;
