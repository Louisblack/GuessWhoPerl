use utf8;
package GuessWhoPerl::Schema::Result::Face;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

GuessWhoPerl::Schema::Result::Face

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

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


# Created by DBIx::Class::Schema::Loader v0.07036 @ 2013-10-10 19:43:40
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:enMv/m6E3u74tb7DtJCQUQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
