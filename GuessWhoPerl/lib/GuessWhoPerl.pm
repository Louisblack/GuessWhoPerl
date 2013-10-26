package GuessWhoPerl;
use Dancer ':syntax';
use Dancer::Plugin::DBIC;
use Facebook::Graph;

our $VERSION = '0.1';

get '/' => sub {
	my $user = session('user');
	my @games = schema->resultset('Game')->find({player1 => $user, player2 => $user});
    template 'index', {
    	games => \@games
    };
};

get '/newgame' => sub {
	
};

get '/facebook/login' => sub {
    my $fb = Facebook::Graph->new( config->{facebook} );
    redirect $fb->authorize->uri_as_string;
};

get '/facebook/postback' => sub {
    my $authorization_code = params->{code};
    my $fb                 = Facebook::Graph->new( config->{facebook} );

    $fb->request_access_token($authorization_code);
    session access_token => $fb->access_token;
    redirect '/';
};

hook 'before' => sub {
    if (request->path_info !~ m{^/facebook}) {
        if (session->{access_token} eq '') {
            request->path_info('/facebook/login')
        }
    }
};

true;
