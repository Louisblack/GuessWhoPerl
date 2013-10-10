  use DBIx::Class::Schema::Loader qw/ make_schema_at /;
  make_schema_at(
      'GuessWhoPerl::Schema',
      { debug => 1,
        dump_directory => 'GuessWhoPerl/lib',
      },
      [ 'dbi:mysql:dbname=guesswho', 'louis', 'pass'
      ],
  );