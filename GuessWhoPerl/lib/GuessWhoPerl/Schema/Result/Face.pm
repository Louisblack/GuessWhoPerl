use utf8;
package GuessWhoPerl::Schema::Result::Face;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

GuessWhoPerl::Schema::Result::Face

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<face>

=cut

__PACKAGE__->table("face");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 name

  data_type: 'varchar'
  is_nullable: 1
  size: 100

=head2 big_url

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 small_url

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "name",
  { data_type => "varchar", is_nullable => 1, size => 100 },
  "big_url",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "small_url",
  { data_type => "varchar", is_nullable => 0, size => 255 },
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
  { "foreign.face_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 game_player1_faces

Type: has_many

Related object: L<GuessWhoPerl::Schema::Result::Game>

=cut

__PACKAGE__->has_many(
  "game_player1_faces",
  "GuessWhoPerl::Schema::Result::Game",
  { "foreign.player1_face" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 game_player2_faces

Type: has_many

Related object: L<GuessWhoPerl::Schema::Result::Game>

=cut

__PACKAGE__->has_many(
  "game_player2_faces",
  "GuessWhoPerl::Schema::Result::Game",
  { "foreign.player2_face" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07036 @ 2013-10-15 20:14:34
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Cs3bku7n83pobqmDeJ/dzQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
