package GuessWhoPerl;
use Dancer ':syntax';
use Dancer::Plugin::DBIC;

use GuessWhoPerl::Game;

my $game_service = GuessWhoPerl::Game->new();

our $VERSION = '0.1';

get '/' => sub {
	my $user = session('user');
	my $games = $game_service->get_games($user->{id});
    template 'index';
};

get '/newgame' => sub {
	
};

get '/login' => sub {
    template 'login', { path => vars->{requested_path} };
};

post '/login' => sub {
    if (params->{user} eq 'bob' && params->{password} eq 'letmein') {
    	my $user = schema->resultset('Player')->find({id => params->{user}});
    	if (!defined $user) {
    		$user = schema->resultset('Player')->create({
    			name     =>  params->{user},
    			fb_id    =>  23123
    		});
    	}
        session user => $user;
        session logged_in => 1;
        redirect '/';
    } else {
        redirect '/login';
    }
};

hook 'before' => sub {
    if (! session('logged_in') && request->path_info !~ m{^/login}) {
        var requested_path => request->path_info;
        request->path_info('/login');
    }
};

true;
