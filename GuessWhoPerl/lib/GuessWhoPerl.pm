package GuessWhoPerl;
use Dancer ':syntax';
use Dancer::Plugin::DBIC;

our $VERSION = '0.1';

get '/' => sub {
    template 'index';
};

true;