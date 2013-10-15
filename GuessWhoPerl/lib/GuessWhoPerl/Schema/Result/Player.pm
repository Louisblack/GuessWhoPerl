use utf8;
package GuessWhoPerl::Schema::Result::Player;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

GuessWhoPerl::Schema::Result::Player

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<player>

=cut

__PACKAGE__->table("player");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 name

  data_type: 'varchar'
  is_nullable: 1
  size: 100

=head2 fb_id

  data_type: 'integer'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "name",
  { data_type => "varchar", is_nullable => 1, size => 100 },
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

=head2 game_player1s

Type: has_many

Related object: L<GuessWhoPerl::Schema::Result::Game>

=cut

__PACKAGE__->has_many(
  "game_player1s",
  "GuessWhoPerl::Schema::Result::Game",
  { "foreign.player1" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 game_player2s

Type: has_many

Related object: L<GuessWhoPerl::Schema::Result::Game>

=cut

__PACKAGE__->has_many(
  "game_player2s",
  "GuessWhoPerl::Schema::Result::Game",
  { "foreign.player2" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 game_winners

Type: has_many

Related object: L<GuessWhoPerl::Schema::Result::Game>

=cut

__PACKAGE__->has_many(
  "game_winners",
  "GuessWhoPerl::Schema::Result::Game",
  { "foreign.winner" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07036 @ 2013-10-15 20:39:00
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:jf+6Hiv2eanwxd7KMG5h+Q


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
