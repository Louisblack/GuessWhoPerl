use utf8;
package GuessWhoPerl::Schema::Result::GameFace;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

GuessWhoPerl::Schema::Result::GameFace

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<game_face>

=cut

__PACKAGE__->table("game_face");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 game_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 face_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "game_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "face_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 face

Type: belongs_to

Related object: L<GuessWhoPerl::Schema::Result::Face>

=cut

__PACKAGE__->belongs_to(
  "face",
  "GuessWhoPerl::Schema::Result::Face",
  { id => "face_id" },
  { is_deferrable => 1, on_delete => "NO ACTION", on_update => "NO ACTION" },
);

=head2 game

Type: belongs_to

Related object: L<GuessWhoPerl::Schema::Result::Game>

=cut

__PACKAGE__->belongs_to(
  "game",
  "GuessWhoPerl::Schema::Result::Game",
  { id => "game_id" },
  { is_deferrable => 1, on_delete => "NO ACTION", on_update => "NO ACTION" },
);


# Created by DBIx::Class::Schema::Loader v0.07036 @ 2013-10-10 19:43:40
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:RoUeyl9eYDPERxdojZCgvw


# You can replace this text with custom code or comments, and it will be preserved on regeneration


1;
