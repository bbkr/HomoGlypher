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