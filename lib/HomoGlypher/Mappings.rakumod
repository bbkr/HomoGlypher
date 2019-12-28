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

Remember that mappings are font dependent and subjective.
There is no ultimate truth.

=end pod

our %cyrillic = (
    '0' => [ 'О', 'Ф', 'ф' ],
    '3' => [ 'З', 'з' ],
    'a' => [ 'а' ],
    'b' => [ 'Ь', 'ь', 'б', 'Б', ],
    'c' => [ 'с' ],
    'e' => [ 'е' ],
    'io' => [ 'ю'],
    'n' => [ 'п' ],
    'o' => [ 'о' ],
    'p' => [ 'р'],
    'r' => [ 'г', 'Г' ],
    'u' => [ 'ц' ],
    'w' => [ 'ш', 'щ' ],
    'x' => [ 'х' ],
    'y' => [ 'у', 'У', 'ч', 'Ч' ],
    'A' => [ 'А' ],
    'B' => [ 'В', 'в' ],
    'C' => [ 'С' ],
    'E' => [ 'Е' ],
    'H' => [ 'Н', 'н' ],
    'IO' => [ 'Ю' ],
    'K' => [ 'К', 'к' ],
    'M' => [ 'М', 'м' ],
    'N' => [ 'И', 'и', 'Й', 'й' ],
    'O' => [ 'О' ],
    'P' => [ 'Р' ],
    'R' => [ 'Я', 'я' ],
    'T' => [ 'Т', 'т' ],
    'U' => [ 'Ц' ],
    'W' => [ 'Ш', 'Щ' ],
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
);
