# Homoglyph toolset for [Raku](https://www.raku.org) language

[![Build Status](https://travis-ci.org/bbkr/HomoGlypher.svg?branch=master)](https://travis-ci.org/bbkr/HomoGlypher)

[Homoglyph](https://en.wikipedia.org/wiki/Homoglyph) is set of one or more graphemes that has identical or very similar look to some other set of graphemes.

For example:

 * `6` (DIGIT SIX) and `б` (CYRILLIC SMALL LETTER BE)
 * `w` (LATIN SMALL LETTER W) and `ω` (GREEK SMALL LETTER OMEGA)
 * `oo` (2 x LATIN SMALL LETTER O) and `က` (MYANMAR LETTER KA)
 * `E` (LATIN CAPITAL LETTER E) and `Ε` (GREEK CAPITAL LETTER EPSILON) and `Е` (CYRILLIC CAPITAL LETTER IE)
 * `V` (LATIN CAPITAL LETTER V) and `\/` (REVERSE SOLIDUS + SOLIDUS)

Homoglyphs are:

* Font dependent - two homoglyphs may be 100% identical in one font but have visual differences when rendered in other. Even cursive matters, for example `т` in cursive in some fonts looks like `m`.
* Subjective - similarity level cannot be measured and there is no fixed point where two sets of graphemes stops being homoglyphs. Are `a` and `а` homoglyphs? Sure! How about `ź` and `ž`? Probably yes. What will you say about `R` and `Я`? Er.... You see the point?
* Funny - replace `;` (SEMICOLON) with `;` (GREEK QUESTION MARK) in someone's code and watch them trying to debug code that looks perfectly fine :)
* Dangerous - someone can register [IDN domain](https://en.wikipedia.org/wiki/Internationalized_domain_name) that looks very similar to your business domain to swindle money out of your clients.

# TABLE OF CONTENTS

* [SYNOPSIS](#synopsis)
* [HINT](#hint)
* [METHODS](#methods)
  * [add-mapping](#add-mapping)
  * [unwind](#unwind)
  * [collapse](#collapse)
  * [tokenize](#tokenize)
  * [randomize](#randomize)
* [CONTACT](#contact) 

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

# HINT

When dealing with homoglyphs the easiest method to debug them is to use uniname(s) method:

```
$ raku -e '.say for "fοο".uninames'

LATIN SMALL LETTER F
GREEK SMALL LETTER OMICRON
GREEK SMALL LETTER OMICRON
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

Few ready to use mappings are provided in [HomoGlypher::Mappings](https://github.com/bbkr/HomoGlypher/blob/master/lib/HomoGlypher/Mappings.rakumod):

```
use HomoGlypher;
use HomoGlypher::Mappings;

my $hg = HomoGlypher.new;

$hg.add-mapping( %HomoGlypher::Mappings::cyrillic );
$hg.add-mapping( %HomoGlypher::Mappings::greek );
...
```

I won't tell you where to get perfect, complete, ultimate mapping because homoglyphs are font-dependent and similarity is subjective. Good start point for creating your own mappings are *_alphabet ([Russian](https://en.wikipedia.org/wiki/Russian_alphabet), [Greek](https://en.wikipedia.org/wiki/Greek_alphabet), [Arabic](https://en.wikipedia.org/wiki/Arabic_alphabet), ...) and *_numerals ([Roman](https://en.wikipedia.org/wiki/Roman_numerals), [Counting Rods](https://en.wikipedia.org/wiki/Counting_Rod_Numerals_(Unicode_block)), ...) pages on Wikipedia. Or you can borrow mappings from some other projects like [Codebox homoglyphs](https://github.com/codebox/homoglyph), [IronGeek Homoglyph Attack Generator](https://www.irongeek.com/homoglyph-attack-generator.php) and many others.

## unwind

Generates every possible mapping combination for your ASCII text.
Beware, ***this works only for short inputs*** and ***list grows really, really fast***.

```raku
my %cyrillic = (
    '6' => [ 'б' ],
    'a' => [ 'а' ],
    'b' => [ 'б', 'ь' ],
    'e' => [ 'е', 'ё' ],
    'm' => [ 'м' ],
    'p' => [ 'р' ],
    'r' => [ 'г' ],
    'x' => [ 'х' ]
);

my $hg = HomoGlypher.new;
$hg.add-mapping( %cyrillic );

.say for $hg.unwind( 'example' );
```

```
examplё
examрle
examрlе
examрlё
exaмple
exaмplе
exaмplё
exaмрle
...
```
(total 143 combinations)

Output list:

* Is lazy - so you can iterate over it without worrying about memory consumption.
* Has preserverd mappings order - so if you sort your mappings from most to less similar your result will have the same characteristics.

Main purpose of homoglyph unwinding is to check if someone is spoofing your domain.
See ready to use [IDN Checker](https://github.com/bbkr/HomoGlypher/blob/master/example/IDN-checker.raku) script.

## collapse

Opposite of [unwind](#unwind).
If you have suspicious, homoglyphed text you can check which ASCII texts it might be derived from.
Beware, ***this works only for short inputs***.


```raku
my %ascii-art = (
    'O' => [ '()' ],
    'V' => [ '\/' ],
    'W' => [ '\/\/' ]
);

my $hg = HomoGlypher.new;
$hg.add-mapping( %ascii-art );

.print for $hg.collapse( '\/()\/\/EL' );
```

```
VOVVEL
VOWEL
```
(as you can see sometimes it may return more than one possible ASCII text)

Main purpose of homoglyph collapsing is to check if someone is using your forums, hostings, or other services for phishing or false advertising.
Check also [tokenize](#tokenize) method.

## tokenize

TODO

## randomize

TODO

## CONTACT

You can find me on irc.freenode.net #raku channel as **bbkr**.
