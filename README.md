# Homoglyph toolset for [Raku](https://www.raku.org) language

[![.github/workflows/test.yml](https://github.com/bbkr/HomoGlypher/actions/workflows/test.yml/badge.svg)](https://github.com/bbkr/HomoGlypher/actions/workflows/test.yml)

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

my $randomized = $hg.randomize( 'bar', level => 80 ); # for example 'bαr'

my &tokenized = $hg.tokenize( );
say so 'bαг' ~~ / <&tokenized: 'bar'> /; # True

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

* `@basic` - ASCII letters and digits that are faked by completely different characters: `ΤꜦꜪ QՍΙᴄк вᚱՕꓪɴ ꓝᏅХ` `jսოр𐑈 օ𐐷еᎱ tᏥе ιαzႸ Ժօց` `ОᛐշʒᏎƼỼ7ꝸᏭ`. Consists of:
    * `%armenian`
    * `%cherokee`
    * `%cyrillic`
    * `%deseret`
    * `%greek`
    * `%greek-mathematical-typeface`
    * `%georgian`
    * `%latin`
    * `%lisu`
    * `%myanmar`
    * `%roman-numerals`
    * `%runic`
    * `%math-symbols`
* `@typeface` - ASCII letters and digits that have typeface styles applied, base characters are not changed: `𝗧𝕳𝓔 𝒬𝕌𝕀𝙲𝔎 𝔹𝗥ＯＷ𝓝 𝘍𝕆𝗫` `𝒿𝓾𝗺𝚙𝕤 𝔬𝘃𝘦𝓇 𝔱𝘩𝘦 𝖑𝖆𝕫𝔂 𝗱𝓸𝔤` `𝟘𝟙２𝟹４𝟻𝟼𝟽𝟠𝟡`. Consists of:
    * `%full-width`
    * `%monospace`
    * `%bold`
    * `%italic`
    * `%fraktur`
    * `%bold-fraktur`
    * `%script`
    * `%bold-script`
    * `%doublestruck`
* `@mathematical-typeface` - ASCII letters and digits that have mathematical typeface styles applied, base characters are not changed: `𝐓𝙃𝖤 𝔔𝑈𝕴𝐶𝒦 𝐁𝕽𝑶𝑾𝙉 𝐅𝘖𝑿 𝙟𝗎𝒎𝖕𝑠 𝓸𝐯𝘦𝙧 𝑡𝒽𝙚 𝖑𝗮𝑧𝔂 𝘥𝔬𝒈 𝟘𝟣𝟸𝟛𝟜𝟻𝟼𝟕𝟖𝟗`. Consists of:
    * `%mathematical-bold`
    * `%mathematical-italic`
    * `%mathematical-bold-italic`
    * `%mathematical-script`
    * `%mathematical-bold-script`
    * `%mathematical-fraktur`
    * `%mathematical-doublestruck`
    * `%mathematical-bold-fraktur`
    * `%mathematical-sansserif`
    * `%mathematical-sansserif-bold`
    * `%mathematical-sansserif-italic`
    * `%mathematical-sansserif-bold-italic`
    * `%mathematical-monospace`
* `%accented` - ASCII letters that have accents applied, base characters are not changed: `ȚȞȆ ꝖṲÏÇꝂ ḂŔǾⱲṆ ḞṌẌ` `ĵữṁꝕṩ ǭⱱëȑ ʈẖḕ ļǟʐȳ ɗȫǵ`. Try to read it loud... Correctly :)
* `%control` - ASCII printable representations of non printable characters: `P␆ ␎ME ␖THE␏SE␞`. Have perfect similarity but letters are very crammed and those acronyms are unlikely to be found in regular language.
* `%flipped` - ASCII letters, digits and symbols that are faked by some completely different characters in various rotations and mirroring: `ꓕH⧢ Ꝺ⋂I𐐣ꓘ ꓭꓤOW𐐥 ꓞOX` `jᴝᴟpƨ ᴑ⋏ǝɹ ʇɥɘ ꞁɐzʎ dᴑᵷ` `0ᛚ2Ƹ4567∞9`

```
use HomoGlypher;
use HomoGlypher::Mappings;

my $hg = HomoGlypher.new;

$hg.add-mapping( $_ ) for @HomoGlypher::Mappings::basic;    # load all basic mappings
$hg.add-mapping( %HomoGlypher::Mappings::accented );        # load single, specific mapping
```

I won't tell you where to get perfect, complete, ultimate mapping because homoglyphs are font-dependent and similarity is subjective. Good start point for creating your own mappings are [*_alphabet](https://en.wikipedia.org/wiki/List_of_writing_systems) and [*_numeral](https://en.wikipedia.org/wiki/List_of_numeral_systems) pages on Wikipedia. Or you can borrow mappings from some other projects like [Codebox homoglyphs](https://github.com/codebox/homoglyph), [IronGeek Homoglyph Attack Generator](https://www.irongeek.com/homoglyph-attack-generator.php) and many others.

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

[Unicode::Security](https://github.com/JJ/perl6-unicode-security) module does similar thing.

## tokenize

Construct token that can be used to match homoglyphed text in grammars.

```raku
my %greek = (
    'a' => [ 'α' ],
    'r' => [ 'Γ' ],
);

my $hg = HomoGlypher.new;
$hg.add-mapping( %greek );

my &homoglyphy = $hg.tokenize( );

'foobαΓbaz' ~~ / $<result>=<&homoglyphy: 'bar'> /;
say $/{ 'result' };

```

```
｢bαΓ｣
```

Beware, ***token uses mappings present at match time***.
You can create token without any mappings added, define grammar that uses this token and then add mappings before text is actually matched against grammar.
If you need tokens with different set of mapping in one grammar you can create and tokenize many `HomoGlypher` instances.

[Regex::FuzzyToken](https://github.com/alabamenhu/RegexFuzzyToken) module can be used to catch misspelled phrases. Homoglypher and FuzzyToken can coexist in single grammar:

```raku
say 'Suspicious!' if $email-text ~~ / [ <fuzzy: 'paypal'> | <&homoglyphy: 'paypal'> ] /;
```

Will catch both `papyal` (misspelled) and `pαypαl` (homoglyphed). And yes, you can throw nuke on phishers and catch misspells and homoglyphs at the same time:

```raku
say 'Suspicious!' if $email-text ~~ / <fuzzy: $hg.unwind('paypal')> /;
```

Will catch such sneaky phrases as `pαpyαl`.

## randomize

Replace characters in text with homoglyphs with given probability.

```
my $hg = HomoGlypher.new;
$hg.add-mapping( %HomoGlypher::Mappings::flipped );

say $hg.randomize( 'DIRECTIONS & CAKE ARE A LIE', level => 100 );
```

```
⫏Iя∃C⟘IOИƧ ⅋ C∀K⧢ ∀Я∃ ∀ LI∃
```

Level can be given as percentage value from 1 to 100 (default 50). It decides if ***possible*** mapping should be used at given position. Do not confuse that with amount of replaced characters. For example you have mapping `'a' => [ 'α' ]` and level set to 50%. Transforming `barrrr` will result with unmodified `barrrr` with 50% probability (at second position transformation was possible but not used) and modified `bαrrrr` with 50% probability (at second position transformation was possible and used). Each position is rolled individually against level. Each possible replacement glyph has equal chance to be picked.

[Text::Homoglyph](https://github.com/MattOates/Text--Homoglyph) module does similar thing.
