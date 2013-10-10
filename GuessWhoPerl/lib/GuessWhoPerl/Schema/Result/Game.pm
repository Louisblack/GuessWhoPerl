use utf8;
package GuessWhoPerl::Schema::Result::Game;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

GuessWhoPerl::Schema::Result::Game

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

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


# Created by DBIx::Class::Schema::Loader v0.07036 @ 2013-10-10 19:43:40
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:wu2QzuUNx2ID9/Dyupipjg

__PACKAGE__->many_to_many('faces' => 'game_faces', 'face_id');
1;
