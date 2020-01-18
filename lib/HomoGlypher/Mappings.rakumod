unit package HomoGlypher::Mappings;

=begin pod

Rules:

Keys should contain only ASCII characters.
For example we don't provide mapping from 'ż' to 'ź'.

Keys should be provided in "digts, lowercase letters, uppercase letters" order.

Values should be sorted in "from most to less similar" order.
Glyphs with accents are always considered less similar.

Size difference must be reasonable.
For example 'O' and '°' are not considered homoglyphs.

Cursive similarities are not included.
For example 'т' in cursive looks like 'm'.
Maybe such advanced mappings will be added in the future.

Vertical mirroring are not included in mappings.
For example 'R' and 'Я' does not qualify.

90°, 180° and 270° rotations with optional horizontal or vertical mirroring
are included only in special %flipped mapping.
For example 'G' and '⅁' or 'J' and '𐐓'.

Remember that mappings are font dependent and subjective.
There is no ultimate truth.

=end pod

our %armenian = (

    '2' => [ 'շ' ],
    '8' => [ 'Ց' ],

    'b' => [ 'Ե' ],
    'd' => [ 'Ժ', 'ժ' ],
    'g' => [ 'ց' ],
    'n' => [ 'ո', 'ռ' ],
    'o' => [ 'օ' ],
    'u' => [ 'ս' ],
    'w' => [ 'ա' ],

    'B' => [ 'Յ' ],
    'O' => [ 'Օ', 'Ծ' ],
    'S' => [ 'Տ' ],
    'U' => [ 'Ա', 'Մ', 'Ս' ],

);
    
our %cherokee = (

    '0' => [ 'Ꮻ', 'Ꮎ' ],
    '4' => [ 'Ꮞ' ],
    '6' => [ 'Ꮾ' ],
    '9' => [ 'Ꮽ' ],
    
    'b' => [ 'Ꮟ', 'Ꮾ' ],
    'd' => [ 'Ꮷ', 'Ꮄ' ],
    'f' => [ 'Ꮅ' ],
    'fi' => [ 'Ᏺ' ],
    'h' => [ 'Ꮒ', 'Ꮵ', 'Ᏺ' ],
    'i' => [ 'Ꭵ' ],
    'l' => [ 'Ꮣ' ],
    'r' => [ 'Ꮁ' ],
    'w' => [ 'Ꮗ', 'Ꮚ' ],
    'y' => [ 'Ꭹ', 'Ꮍ' ],
    
    'A' => [ 'Ꭺ', 'Ꭿ', 'Ꮑ' ],
    'B' => [ 'Ᏼ', 'Ᏸ' ],
    'C' => [ 'Ꮯ', 'Ꮳ', 'Ꮸ' ],
    'D' => [ 'Ꭰ' ],
    'E' => [ 'Ꭼ', 'Ꮛ' ],
    'G' => [ 'Ꮐ', 'Ꮹ', 'Ꮆ', 'Ᏻ' ],
    'H' => [ 'Ꮋ' ],
    'I' => [ 'Ꭸ', 'Ꮀ', 'Ꮠ' ],
    'J' => [ 'Ꭻ' ],
    'K' => [ 'Ꮶ' ],
    'L' => [ 'Ꮮ', 'Ꮭ' ],
    'M' => [ 'Ꮇ' ],
    'O' => [ 'Ꮎ', 'Ꮻ', 'Ꭴ', 'Ꮕ' ],
    'OI' => [ 'Ꮊ' ],
    'P' => [ 'Ꮲ', 'Ꭾ' ],
    'R' => [ 'Ꭱ', 'Ꮢ' ],
    'S' => [ 'Ꮪ', 'Ꮥ', 'Ꭶ' ],
    'T' => [ 'Ꭲ' ],
    'U' => [ 'Ꮜ' ],
    'V' => [ 'Ꮩ', 'Ꮴ', 'Ꮙ' ],
    'W' => [ 'Ꮃ', 'Ꮤ' ],
    'Z' => [ 'Ꮓ' ],

);

our %deseret = (

    '6' => [ '𐐞' ],

    'a' => [ '𐐀', '𐐀' ],
    'b' => [ '𐑇' ],
    'c' => [ '𐐽' ],
    'd' => [ '𐐼' ],
    'l' => [ '𐑊', '𐐢' ],
    'o' => [ '𐐬', '𐐫' ],
    'p' => [ '𐑁' ],
    's' => [ '𐑈' ],
    'v' => [ '𐐷' ],
    'w' => [ '𐐶' ],
    'y' => [ '𐑄' ],

    'B' => [ '𐐚' ],
    'C' => [ '𐐕' ],
    'D' => [ '𐐟' ],
    'E' => [ '𐐁' ],
    'J' => [ '𐐢' ],
    'L' => [ '𐐛', '𐑃' ],
    'O' => [ '𐐄', '𐐃' ],
    'P' => [ '𐐙' ],
    'S' => [ '𐐠' ],
    'V' => [ '𐐏' ],
    'W' => [ '𐐎' ],
    'Y' => [ '𐐜' ],

);

our %cyrillic = (

    '0' => [ 'О', 'Ф', 'ф' ],
    '3' => [ 'З', 'з' ],

    'a' => [ 'а' ],
    'b' => [ 'Ь', 'ь', 'б', 'Б', ],
    'c' => [ 'с' ],
    'e' => [ 'е' ],
    'i' => [ 'і' ],
    'io' => [ 'ю'],
    'n' => [ 'п' ],
    'o' => [ 'о' ],
    'p' => [ 'р'],
    'r' => [ 'г', 'Г' ],
    's' => [ 'ѕ' ],
    'u' => [ 'ц' ],
    'v' => [ 'ѵ' ],
    'w' => [ 'ш', 'щ', 'ѡ' ],
    'x' => [ 'х' ],
    'y' => [ 'у', 'У', 'ч', 'Ч' ],

    'A' => [ 'А' ],
    'B' => [ 'В', 'в' ],
    'C' => [ 'С' ],
    'E' => [ 'Е' ],
    'H' => [ 'Н', 'н' ],
    'I' => [ 'І' ],
    'IO' => [ 'Ю' ],
    'K' => [ 'К', 'к' ],
    'M' => [ 'М', 'м' ],
    'O' => [ 'О' ],
    'P' => [ 'Р' ],
    'S' => [ 'Ѕ' ],
    'T' => [ 'Т', 'т' ],
    'U' => [ 'Ц' ],
    'V' => [ 'Ѵ' ],
    'W' => [ 'Ш', 'Щ', 'Ѡ' ],
    'X' => [ 'Х' ],
    'Y' => [ 'У', 'Ч' ],

);

our %greek = (

    '0' => [ 'Θ', 'θ' ],

    'a' => [ 'α' ],
    'c' => [ 'ϲ', 'ς' ],
    'l' => [ 'ι' ],
    'n' => [ 'η', 'π' ],
    'o' => [ 'ο', 'σ' ],
    'p' => [ 'ρ' ],
    'r' => [ 'Γ' ],
    'u' => [ 'υ', 'μ' ],
    'v' => [ 'ν' ],
    'w' => [ 'ω', 'ψ' ],
    'y' => [ 'γ' ],

    'A' => [ 'Α' ],
    'B' => [ 'Β', 'β' ],
    'C' => [ 'Ϲ' ],
    'E' => [ 'Ε', 'Σ', 'ε', 'ξ' ],
    'H' => [ 'Η' ],
    'I' => [ 'Ι' ],
    'K' => [ 'Κ', 'κ' ],
    'M' => [ 'Μ' ],
    'N' => [ 'Ν' ],
    'O' => [ 'Ο', 'Θ', 'θ', 'Ω' ],
    'P' => [ 'Ρ' ],
    'T' => [ 'Τ', 'τ' ],
    'W' => [ 'Ψ' ],
    'X' => [ 'Χ', 'χ' ],
    'Y' => [ 'Υ', 'γ' ],
    'Z' => [ 'Ζ' ],

);

our %georgian = (

    '3' => [ 'ვ', 'კ', 'პ', 'ჳ', 'ჴ' ],

    'b' => [ 'Ⴆ', 'ხ', 'Ⴊ', 'ს', ],
    'd' => [ 'ძ', 'ქ' ],
    'h' => [ 'Ⴙ' ],
    'l' => [ 'Ⴑ', 'Ⴠ' ],
    'm' => [ 'ო' ],
    'o' => [ 'ი' ],
    'y' => [ 'Ⴘ', 'Ⴁ', 'Ⴏ', 'Ⴣ', 'Ⴗ', 'ყ' ],

    'C' => [ 'Ⴚ' ],
    'J' => [ 'Ⴐ' ],
    'O' => [ 'Ⴍ', 'Ⴍ', 'Ⴓ' ],
    'S' => [ 'Ⴝ' ],
    'U' => [ 'Ⴎ' ],
    'Y' => [ 'Ⴤ' ],

);

our %lisu = (

    'd' => [ 'ꓒ' ],

    'A' => [ 'ꓮ' ],
    'B' => [ 'ꓐ' ],
    'C' => [ 'ꓚ' ],
    'D' => [ 'ꓓ' ],
    'E' => [ 'ꓰ' ],
    'F' => [ 'ꓝ' ],
    'G' => [ 'ꓖ' ],
    'H' => [ 'ꓧ' ],
    'I' => [ 'ꓲ' ],
    'J' => [ 'ꓙ' ],
    'K' => [ 'ꓗ' ],
    'L' => [ 'ꓡ' ],
    'M' => [ 'ꓟ' ],
    'N' => [ 'ꓠ' ],
    'O' => [ 'ꓳ' ],
    'P' => [ 'ꓑ' ],
    'R' => [ 'ꓣ' ],
    'S' => [ 'ꓢ' ],
    'T' => [ 'ꓔ' ],
    'U' => [ 'ꓴ' ],
    'V' => [ 'ꓦ' ],
    'W' => [ 'ꓪ' ],
    'X' => [ 'ꓫ' ],
    'Y' => [ 'ꓬ' ],
    'Z' => [ 'ꓜ' ],

);

our %roman-numerals = (

    'c' => [ 'ⅽ' ],
    'd' => [ 'ⅾ' ],
    'i' => [ 'ⅰ' ],
    'ii' => [ 'ⅱ' ],
    'iii' => [ 'ⅲ' ],
    'iv' => [ 'ⅳ' ],
    'ix' => [ 'ⅸ' ],
    'l' => [ 'ⅼ' ],
    'm' => [ 'ⅿ' ],
    'v' => [ 'ⅴ' ],
    'vi' => [ 'ⅵ' ],
    'vii' => [ 'ⅶ' ],
    'viii' => [ 'ⅷ' ],
    'x' => [ 'ⅹ' ],
    'xi' => [ 'ⅺ' ],
    'xii' => [ 'ⅻ' ],

    'C' => [ 'Ⅽ', 'ↅ' ],
    'D' => [ 'Ⅾ' ],
    'I' => [ 'Ⅰ' ],
    'II' => [ 'Ⅱ' ],
    'III' => [ 'Ⅲ' ],
    'IV' => [ 'Ⅳ' ],
    'IX' => [ 'Ⅸ' ],
    'L' => [ 'Ⅼ' ],
    'M' => [ 'Ⅿ' ],
    'V' => [ 'Ⅴ' ],
    'VI' => [ 'Ⅵ' ],
    'VII' => [ 'Ⅶ' ],
    'VIII' => [ 'Ⅷ' ],
    'X' => [ 'Ⅹ' ],
    'XI' => [ 'Ⅺ' ],
    'XII' => [ 'Ⅻ' ],

);

our %runic = (

    '1' => [ 'ᛐ' ],

    'B' => [ 'ᛒ' ],
    'E' => [ 'ᛊ' ],
    'I' => [ 'ᛁ' ],
    'K' => [ 'ᛕ' ],
    'M' => [ 'ᛖ' ],
    'N' => [ 'ᚺ' ],
    'P' => [ 'ᚹ' ],
    'R' => [ 'ᚱ' ],
    'X' => [ 'ᚷ' ],

);

our %math-symbols = (

    '0' => [ '∅' ],
    '3' => [ '϶' ],

    'a' => [ '∂' ],
    'c' => [ '⊂' ],
    'f' => [ '⨍' ],
    'n' => [ '⨅' ],
    'u' => [ '∪', '⋃' ],
    'v' => [ '⋁', '⋎' ],
    'x' => [ '⨉', '×' ],

    'C' => [ '∁' ],
    'D' => [ '⫐' ],
    'E' => [ '⋿', '∈', '∑', '⨊' ],
    'I' => [ '|', '⎮', '⎪' ],
    'L' => [ '∟' ],
    'T' => [ '⟙', '⊤', '⥾' ],
    'V' => [ '√' ],

);

# set of all typical homoglyph mappings for easier loading
our @basic = ( %armenian, %cherokee, %cyrillic, %deseret, %greek, %georgian, %lisu, %roman-numerals, %runic, %math-symbols );

# special mappings section

# flipped mappings should have very high similarity and no accents
# it may contain flips of other ASCII characters than alphanumerics
our %flipped = (

    '&' => [ '⅋' ],

    '1' => [ 'ᛚ' ],
    '8' => [ '∞' ],

    'c' => [ '𐑋', '⊃' ],
    'v' => [ '⋀', '⋏' ],

    'A' => [ '∀', 'ꓯ' ],
    'B' => [ 'ꓭ' ],
    'C' => [ 'ꓛ' ],
    'D' => [ 'ꓷ', '⫏' ],
    'C' => [ '𐐣' ],
    'E' => [ '∃', 'ꓱ', '⧢' ],
    'F' => [ 'ꓞ' ],
    'G' => [ 'ꓨ', '⅁' ],
    'J' => [ 'Ꮣ', 'Ⴑ', '𐐓', 'ꓩ' ],
    'K' => [ 'ꓘ' ],
    'L' => [ 'Ⴈ', '𐐑', 'ꓶ' ],
    'N' => [ 'И', 'и', '𐐥', '𐑍' ],
    'P' => [ 'ꓒ' ],
    'R' => [ 'Я', 'ꓤ', 'я' ],
    'S' => [ 'Ƨ' ],
    'T' => [ '⟘', 'ꓕ', '⊥', '⟂',  '⊢', '⊣' ],
    'U' => [ 'ꓵ', '∩', '⋂' ],
    'V' => [ 'ꓥ' ],
    'Y' => [ '⅄' ],

);

# accented mappings contains ASCII letters with modifiers,
# this mapping is generated on the fly
our %accented = do {
    my %out;

    # basic multilingual plane
    for (1 .. 0xFFFF).map( *.chr ) -> $char {
        
        next unless $char.uniname ~~ /^ 'LATIN ' $<case>=[ 'SMALL' | 'CAPITAL' ] ' LETTER ' $<letter>=<[A..Z]> ' WITH ' $<mod>=[ .+ ] /;
    
        # filter out 'LETTER WITH LETTER' characters like 'ǅ'
        next if $/{ 'mod' }.contains( 'LETTER' );
    
        # use letter extracted from unicode name instead of relying on decomposed form
        # because some letters with modifiers do not decompose, for example 'Ł'
        %out{ $/{ 'case' } eq 'SMALL' ?? $/{ 'letter' }.lc !! $/{ 'letter' } }.push( $char );
    }
    
    %out;
};
