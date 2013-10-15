  use DBIx::Class::Schema::Loader qw/ make_schema_at /;
  make_schema_at(
      'GuessWhoPerl::Schema',
      { debug => 1,
        dump_directory  => 'GuessWhoPerl/lib',
        use_moose       => 1,
      },
      [ 'dbi:mysql:dbname=guesswho', 'louis', 'pass'
      ],
  );