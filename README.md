# Homoglyph toolset for [Raku](https://www.raku.org) language

[Homoglyph](https://en.wikipedia.org/wiki/Homoglyph) is set of one or more graphemes that has identical or very similar look to some other set of graphemes.

For example:

 * `6` (DIGIT SIX) and `б` (CYRILLIC SMALL LETTER BE)
 * `w` (LATIN SMALL LETTER W) and `ω` (GREEK SMALL LETTER OMEGA)
 * `oo` (2 x LATIN SMALL LETTER O) and `က` (MYANMAR LETTER KA)
 * `E` (LATIN CAPITAL LETTER E) and `Ε` (GREEK CAPITAL LETTER EPSILON) and `Е` (CYRILLIC CAPITAL LETTER IE)
 * `V` (LATIN CAPITAL LETTER V) and `\/` (REVERSE SOLIDUS + SOLIDUS)

Homoglyphs are:

* Font dependent - two homoglyphs may be 100% identical in one font but have visual differences when rendered in other.
* Subjective - similarity level cannot be measured and there is no fixed point where two sets of graphemes stops being homoglyphs. Are `a` and `а` homoglyphs? Sure! How about `ź` and `ž`? Probably yes. What will you say about `R` and `Я`? Er.... You see the point?
* Funny - replace `;` (SEMICOLON) with `;` (GREEK QUESTION MARK) in someone's code and watch them trying to debug code that looks perfectly fine :)
* Dangerous - someone can register [IDN domain](https://en.wikipedia.org/wiki/Internationalized_domain_name) that looks very similar to your business domain to swindle money out of your clients.

# SYNOPSIS

```raku

use HomoGlypher;

my %cyrillic = (
    '6' => [ 'б' ],
    'a' => [ 'а' ],
    'b' => [ 'б', 'ь' ],
    'r' => [ 'г' ]
);

my %greek = (
    'a' => [ 'α' ],
    'o' => [ 'ο' ]
);

my %myanmar = (
    'oo' => [ 'က' ]
);

my $hg = HomoGlypher.new;

$hg.add-mapping( %cyrillic );
$hg.add-mapping( %greek );
$hg.add-mapping( %myanmar );

my @unwinded = $hg.unwind( 'foo' );    # [ 'foο', 'fοo', 'fοο', 'fက' ]

my @collapsed = $hg.collapse( 'бαг' ); # [ 'bar', '6ar' ]
```

# METHODS

## add-mapping

Merge given mapping (given as Hash of Arrays) with existed mappings.

Typically keys are composed from ASCII characters.
Duplicates are filtered out automatically.
Multi character glyphs can be used both in keys and values:

```raku
my %mapping = (
    'IO' => [ 'Ю' ],
    'P' => [ '|Ͻ']
);
```

You can inspect megred mappings under `$hg.mappings`, just ***do not modify it directly***.
If you want to fine tune it then fetch merged result, tweak it and add to new `HomoGlypher` object.

I won't tell you where to get perfect mappings. Homoglyphs are font-dependent and similarity is subjective. Good start point for creating your own mappings are *_alphabet ([Russian](https://en.wikipedia.org/wiki/Russian_alphabet), [Greek](https://en.wikipedia.org/wiki/Greek_alphabet), [Arabic](https://en.wikipedia.org/wiki/Arabic_alphabet)) and *_numerals ([Roman](https://en.wikipedia.org/wiki/Roman_numerals), [Counting Rods](https://en.wikipedia.org/wiki/Counting_Rod_Numerals_(Unicode_block))) pages on Wikipedia. Or you can borrow mappings from some other projects like [Codebox homoglyphs](https://github.com/codebox/homoglyph), [IronGeek Homoglyph Attack Generator](https://www.irongeek.com/homoglyph-attack-generator.php) and many others.

## unwind

Generates every possible mapping combination in your ASCII text.
Beware, ***this works only for short inputs*** and ***grows really, really fast***.

```raku
my %cyrillic = (
    '6' => [ 'б' ],
    'a' => [ 'а' ],
    'b' => [ 'б', 'ь' ],
    'e' => [ 'е', 'ё' ],
    'm' => [ 'м' ],
    'p' => [ 'р' ],
    'r' => [ 'г' ],
    'x' => [ 'х' ],
);

my $hg = HomoGlypher.new;
$hg.add-mapping( %cyrillic );

.print for $hg.unwind( 'example' );

=result

examplё examрle examрlе examрlё exaмple exaмplе exaмplё exaмрle exaмрlе exaмрlё exаmple
exаmplе exаmplё exаmрle exаmрlе exаmрlё exамple exамplе exамplё exамрle exамрlе exамрlё
eхample eхamplе eхamplё eхamрle eхamрlе eхamрlё eхaмple eхaмplе eхaмplё eхaмрle eхaмрlе
eхaмрlё eхаmple eхаmplе eхаmplё eхаmрle eхаmрlе eхаmрlё eхамple eхамplе eхамplё eхамрle
eхамрlе eхамрlё еxample...

total 143 combinations
```

Output list:

* Is lazy - so you can iterate over it without worrying about memory consumption.
* Has preserverd mappings order - so if you sort your mappings from most to less similar your result will have the same characteristics.


Main purpose of homoglyph unwinding is to check if someone is spoofing your domain or company name.

