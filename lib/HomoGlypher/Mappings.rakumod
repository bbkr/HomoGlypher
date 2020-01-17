unit package HomoGlypher::Mappings;

=begin pod

Rules:

Keys should contain only ASCII characters.
For example we don't provide mapping from 'ż' to 'ź'.

Keys should be provided in "digts, lowercase letters, uppercase letters" order.

Values should be sorted in "from most to less similar" order.
Glyphs with accents are always considered less similar.

Cursive similarities are not included.
For example 'т' in cursive looks like 'm'.
Maybe such advanced mappings will be added in the future.

Vertical mirroring are included in regular and %flipped mappings.
For example 'R' and 'Я'.

90°, 180° and 270° flips are included only in %flipped mapping.
For example 'G' and '⅁'.

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
    'J' => [ 'Ꭻ', 'Ꮣ' ],
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
    'N' => [ 'И', 'и', 'Й', 'й' ],
    'O' => [ 'О' ],
    'P' => [ 'Р' ],
    'R' => [ 'Я', 'я' ],
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

our %math-symbols = (

    '0' => [ '∅' ],
    '3' => [ '϶' ],

    'c' => [ '⊂' ],
    'd' => [ '∂' ],
    'f' => [ '⨍' ],
    'n' => [ '⨅' ],
    'u' => [ '∪', '⋃' ],
    'v' => [ '⋁', '⋎' ],
    'x' => [ '⨉', '×' ],

    'C' => [ '∁' ],
    'D' => [ '⫐' ],
    'E' => [ '⋿', '∃', '∈', '∋', '∑', '⨊' ],
    'I' => [ '|', '⎮', '⎪' ],
    'L' => [ '∟', '⦜', '⦝' ],
    'T' => [ '⟙', '⊤', '⥾' ],
    'V' => [ '√' ],

);

# flipped mappings should have very high similarity and no accents
# it may contain flips of other ASCII characters than alphanumerics

our %flipped = (

    '&' => [ '⅋' ],

    '8' => [ '∞' ],

    'c' => [ '⊃' ],
    'v' => [ '⋀', '⋏' ],

    'A' => [ '∀' ],
    'D' => [ '⫏' ],
    'E' => [ '∃', '⧢' ],
    'G' => [ '⅁' ],
    'J' => [ 'Ꮣ' ],
    'N' => [ 'И', 'и' ],
    'R' => [ 'Я', 'я' ],
    'S' => [ 'Ƨ' ],
    'T' => [ '⟘', '⊥', '⟂',  '⊢', '⊣' ],
    'U' => [ '∩', '⋂' ],
    'Y' => [ '⅄' ],

);
