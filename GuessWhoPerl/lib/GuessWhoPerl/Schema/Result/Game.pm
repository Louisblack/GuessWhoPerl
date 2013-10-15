use utf8;
package GuessWhoPerl::Schema::Result::Game;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

GuessWhoPerl::Schema::Result::Game

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<game>

=cut

__PACKAGE__->table("game");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 player1

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 player2

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 player1_face

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 player2_face

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 winner

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 fb_id

  data_type: 'integer'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "player1",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "player2",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "player1_face",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "player2_face",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "winner",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "fb_id",
  { data_type => "integer", is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 game_faces

Type: has_many

Related object: L<GuessWhoPerl::Schema::Result::GameFace>

=cut

__PACKAGE__->has_many(
  "game_faces",
  "GuessWhoPerl::Schema::Result::GameFace",
  { "foreign.game_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 player1

Type: belongs_to

Related object: L<GuessWhoPerl::Schema::Result::Player>

=cut

__PACKAGE__->belongs_to(
  "player1",
  "GuessWhoPerl::Schema::Result::Player",
  { id => "player1" },
  { is_deferrable => 1, on_delete => "NO ACTION", on_update => "NO ACTION" },
);

=head2 player1_face

Type: belongs_to

Related object: L<GuessWhoPerl::Schema::Result::Face>

=cut

__PACKAGE__->belongs_to(
  "player1_face",
  "GuessWhoPerl::Schema::Result::Face",
  { id => "player1_face" },
  { is_deferrable => 1, on_delete => "NO ACTION", on_update => "NO ACTION" },
);

=head2 player2

Type: belongs_to

Related object: L<GuessWhoPerl::Schema::Result::Player>

=cut

__PACKAGE__->belongs_to(
  "player2",
  "GuessWhoPerl::Schema::Result::Player",
  { id => "player2" },
  { is_deferrable => 1, on_delete => "NO ACTION", on_update => "NO ACTION" },
);

=head2 player2_face

Type: belongs_to

Related object: L<GuessWhoPerl::Schema::Result::Face>

=cut

__PACKAGE__->belongs_to(
  "player2_face",
  "GuessWhoPerl::Schema::Result::Face",
  { id => "player2_face" },
  { is_deferrable => 1, on_delete => "NO ACTION", on_update => "NO ACTION" },
);

=head2 winner

Type: belongs_to

Related object: L<GuessWhoPerl::Schema::Result::Player>

=cut

__PACKAGE__->belongs_to(
  "winner",
  "GuessWhoPerl::Schema::Result::Player",
  { id => "winner" },
  { is_deferrable => 1, on_delete => "NO ACTION", on_update => "NO ACTION" },
);


# Created by DBIx::Class::Schema::Loader v0.07036 @ 2013-10-15 20:39:00
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:kVmXMbiVpDPmFIwz+e5vAQ



# You can replace this text with custom code or comments, and it will be preserved on regeneration

__PACKAGE__->many_to_many('faces' => 'game_face', 'face_id');
__PACKAGE__->meta->make_immutable;

sub guess {
	my ($self, $face_id, $player_id) = @_;
	
	if ($player_id == $self->player1->id) {
		$self->_guess($face_id, $self->player2_face->id);
	}
	else {
		$self->_guess($face_id, $self->player1_face->id);
	}
}

sub _guess {
	my ($self, $face_id, $player_id) = @_;
	$face_id == $player_id; 
}

sub set_winner {
	my ($self, $player) = @_;
	$self->winner($player);
}

1;
