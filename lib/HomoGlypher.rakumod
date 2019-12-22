unit class HomoGlypher;

has %.mappings;
has %.antimappings;

method add-mapping ( %mapping ) {
    
    # merge new mapping
    for %mapping.kv -> $from, @to {
        
        # always store replacements as an Array of unique values
        for @to -> $to {
            
            # for mappings
            my @map := %.mappings{ $from } //= [ ];
            @map.push( $to ) unless $to eq any @map;
            
            # and antimappings
            my @antimap := %.antimappings{ $to } //= [ ];
            @antimap.push( $from ) unless $from eq any @antimap;
        }
    }
    
}

method unwind ( Str:D $text! ) {
    
    my $unwind = sub  ( Str:D $done, Str:D $todo ) {
        
        # 'todo' pile is empty, 'done' pile contains result
        if $todo.chars == 0 {
            
            # take every result except original text
            take $done if $done ne $text;
            
            return;
        }
        
        # results should be produced in 'least to most mapped' order,
        # so before mappings are checked call recursively for next unmodified character
        # (first character is transfered from 'todo' pile to 'done' pile)
        samewith( $done ~ $todo.substr( 0, 1 ), $todo.substr( 1, * ) );
    
        # check which mapping matches next characters from 'todo' pile
        for %.mappings.sort -> $mapping {
            my $from := $mapping.key;
            my @to := $mapping.value;
            
            # this mapping does not match
            next unless $todo.starts-with( $from );
            
            # call recursively for every possible replacement in mapping
            # (matching part is taken from 'todo' pile, mapped and added to 'done' pile)
            for @to -> $to {
                samewith( $done ~ $to, $todo.substr( $from.chars, * ) );
            }
        }
        
    };
    
    return gather $unwind.( '', $text );
}

method collapse ( Str:D $text! ) {

    my $collapse = sub  ( Str:D $done, Str:D $todo ) {

        # 'todo' pile is empty, 'done' pile contains result
        if $todo.chars == 0 {
            
            # take every result except original text
            take $done if $done ne $text;
            
            return;
        }

        # check which antimapping matches next characters from 'todo' pile
        my $had-mapping = False;
        for %.antimappings.sort -> $mapping {
            my $from := $mapping.key;
            my @to := $mapping.value;
            
            # this mapping does not match
            next unless $todo.starts-with( $from );
            
            # call recursively for every possible replacement in mapping
            # (matching part is taken from 'todo' pile, mapped and added to 'done' pile)
            for @to -> $to {
                samewith( $done ~ $to, $todo.substr( $from.chars, * ) );
            }
            
            $had-mapping = True;
        }

        # result should contain as many antimapped pieces as possible,
        # so call recursively for next unmodified character
        # only if no antimapping took place
        # (first character is transfered from 'todo' pile to 'done' pile)
        samewith( $done ~ $todo.substr( 0, 1 ), $todo.substr( 1, * ) ) unless $had-mapping;
        
    };

    return gather $collapse.( '', $text );
}

method tokenize ( Str:D $text! ) { ... }

method randomize ( Str:D $text!, Int :$level = 50 ) { ... }
