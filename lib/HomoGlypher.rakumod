unit class HomoGlypher:auth<bbkr>:ver<1.2.1>;

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
    
    my $unwind = sub ( Str:D $done, Str:D $todo ) {
        
        # 'todo' pile is empty, 'done' pile contains result
        if $todo.chars == 0 {
            
            # take every result except original text
            take $done if $done ne $text;
            
            return;
        }
        
        # results should be produced in 'least to most mapped' order,
        # so before mappings are checked call recursively for next unmodified character
        # (first character is transferred from 'todo' pile to 'done' pile)
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

    my $collapse = sub ( Str:D $done, Str:D $todo ) {

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
        # (first character is transferred from 'todo' pile to 'done' pile)
        samewith( $done ~ $todo.substr( 0, 1 ), $todo.substr( 1, * ) ) unless $had-mapping;
        
    };

    return gather $collapse.( '', $text );
}

method tokenize ( ) {
    
    my $match = sub ( Str:D $paragraph, Int:D $position, Str:D $done, Str:D $todo ) {

        # 'todo' pile is empty, 'done' pile contains result
        return $done if $todo.chars == 0;

        # check which antimappings match next characters in analyzed paragraph
        for %.antimappings -> $mapping {
            my $from := $mapping.key;
            my @to := $mapping.value;
            
            # this antimapping does not match
            next unless $paragraph.substr-eq( $from, $position );
            
            # check which antimapping replacements matches next characters from 'todo' pile
            for @to -> $to {
                
                # this replacement cannot produce text that is searched
                next unless $todo.starts-with( $to );
                
                # call recursively and propagate up any found results
                # (matching part is taken from 'todo' pile, antimapped and added to 'done' pile)
                return $_ with samewith(
                    $paragraph, $position + $from.chars,
                    $done ~ $from, $todo.substr( $to.chars, * )
                );
            }
        }

        # if Depth First Search failed for antimappings
        # next unmodified character should be taken if it matches analyzed paragraph
        return unless $paragraph.substr-eq( $todo.substr( 0, 1 ), $position );
        
        # (first character is transferred from 'todo' pile to 'done' pile)
        return samewith( $paragraph, $position + 1, $done ~ $todo.substr( 0, 1 ), $todo.substr( 1, * ) );
        
    };

    return token ( Str:D $text! where { $text.chars > 0 } ) {
        
        # do not match original text
        <!before $text>
        
        # locate homoglyphed text corresponding with original lookup text
        :my $found;
        <?{ so $found = $match( $/.orig, $/.pos, '', $text ) }>
        
        # consume matched part of paragraph
        $found
    };
}

method randomize ( Str:D $text!, Int:D :$level where { 1 <= $level <= 100 } = 50 ) {

    my $todo = $text;
    my $done = '';
    
    while $todo.chars {
        
        # check which mappings matches next characters from 'todo' pile
        my @from = %.mappings.keys.grep( { $todo.starts-with( $_ ) } );
    
        # when mapping is found it will be only applied with given probability
        if @from and ( 1..100 ).pick <= $level {
        
            # pick which unmodified characters will be replaced
            my $from = @from.pick;
        
            # take unmodified characters from 'todo' pile
            # and append random replacement from mapping to 'done' pile
            $todo .= substr( $from.chars );
            $done ~= %.mappings{ $from }.pick
        }
        # when no mapping was found move one character from 'todo' pile to 'done' pile
        else {
        
            my $char = $todo.substr( 0, 1 );
            $todo .= substr( 1 );
            $done ~= $char;
        }
    }

    return $done;
}
