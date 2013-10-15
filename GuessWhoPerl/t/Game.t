use Test::More tests => 7;
use strict;
use warnings;

use_ok 'GuessWhoPerl::Schema::Result::Game';
use_ok 'GuessWhoPerl::Schema::Result::Face';
use_ok 'GuessWhoPerl::Schema::Result::Player';

my $player1_id = 1;
my $player2_id = 2;
my $player1_face_id = 3;
my $player2_face_id = 4;
my $a_different_face_id = 5;

my $game    = new GuessWhoPerl::Schema::Result::Game->new();
my $player1 = new GuessWhoPerl::Schema::Result::Player->new();
my $player2 = new GuessWhoPerl::Schema::Result::Player->new();
my $player1_face = new GuessWhoPerl::Schema::Result::Face->new();
my $player2_face = new GuessWhoPerl::Schema::Result::Face->new();
$player1->id($player1_id);
$player2->id($player2_id);
$player1_face->id($player1_face_id);
$player2_face->id($player2_face_id);
$game->player1($player1);
$game->player2($player2);
$game->player1_face($player1_face);
$game->player2_face($player2_face);
    
ok($game->guess($player2_face_id, $player1_id) == 1, 'Player 1 guesses player 2 correctly');
ok($game->guess($player1_face_id, $player2_id) == 1, 'Player 2 guesses player 1 correctly');
ok($game->guess($a_different_face_id, $player1_id) == 0, 'Player 1 guesses incorrectly');

$game->set_winner($player1);

is($game->winner, $player1, 'The winner was set properly');

