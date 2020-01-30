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
    'io' => [ 'ю' ],
    'n' => [ 'п' ],
    'o' => [ 'о' ],
    'p' => [ 'р' ],
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

our %latin = (

    '0' => [ 'ʘ' ],
    '3' => [ 'Ʒ', 'Ȝ', 'ȝ', 'ɜ', 'ʒ', 'ᴈ', 'ᴣ', 'Ꝫ', 'ꝫ',  ],
    '5' => [ 'Ƽ', 'ƽ' ],
    '6' => [ 'Ỽ' ],
    '8' => [ 'ꝸ' ],
    '9' => [ 'Ꝯ' ],

    'aa' => [ 'ꜳ' ],
    'ae' => [ 'æ' ],
    'ao' => [ 'ꜵ' ],
    'au' => [ 'ꜷ' ],
    'av' => [ 'ꜹ' ],
    'b' => [ 'Ƅ', 'ƅ' ],
    'd' => [ 'ꝱ' ],
    'dz' => [ 'ǳ', 'ʣ' ],
    'f' => [ 'ſ', 'ẜ', 'ẝ' ],
    'ff' => [ 'ﬀ' ],
    'ffi' => [ 'ﬃ' ],
    'ffl' => [ 'ﬄ' ],
    'fi' => [ 'ﬁ' ],
    'fl' => [ 'ﬂ' ],
    'fn' => [ 'ʩ' ],
    'g' => [ 'ɡ', 'ꝯ' ],
    'h' => [ 'ꜧ' ],
    'hv' => [ 'ƕ' ],
    'ij' => [ 'ĳ' ],
    'j' => [ 'ȷ' ],
    'l' => [ 'ɩ', 'Ɩ', 'ꝲ' ],
    'lj' => [ 'ǈ', 'ǉ' ],
    'ls' => [ 'ʪ' ],
    'lz' => [ 'ʫ' ],
    'm' => [ 'ꝳ' ],
    'n' => [ 'ꝴ' ],
    'nj' => [ 'ǌ' ],
    'o' => [ 'ᴏ' ],
    'oe' => [ 'œ' ],
    'oi' => [ 'ƣ' ],
    'oo' => [ 'ꝏ' ],
    'p' => [ 'ƿ', 'þ' ],
    'r' => [ 'ꝵ', 'ꞅ' ],
    'st' => [ 'ﬆ' ],
    't' => [ '✝' ],
    'tf' => [ 'ʧ' ],
    'ts' => [ 'ʦ' ],
    'u' => [ 'ᴜ' ],
    'v' => [ 'ᴠ' ],
    'vy' => [ 'ꝡ' ],
    'w' => [ 'ᴡ' ],
    'z' => [ 'ᴢ' ],

    'A' => [ 'ᴀ' ],
    'AA' => [ 'Ꜳ' ],
    'AE' => [ 'Æ', 'ᴁ' ],
    'AJ' => [ 'Ꜷ' ],
    'AO' => [ 'Ꜵ' ],
    'AV' => [ 'Ꜹ' ],
    'AY' => [ 'Ꜽ' ],
    'B' => [ 'ʙ', 'ß' ],
    'C' => [ 'ᴄ', 'ʗ' ],
    'D' => [ 'ᴅ', 'Ð', 'Ɖ' ],
    'Dz' => [ 'ǲ' ],
    'DZ' => [ 'Ǳ' ],
    'E' => [ 'ᴇ', 'Ɛ', 'Ʃ', 'ɛ', 'Ꜫ', 'ꜫ' ],
    'F' => [ 'ꜰ', 'ꝼ' ],
    'G' => [ 'ɢ' ],
    'H' => [ 'ʜ', 'Ꜧ' ],
    'Hi' => [ 'Ƕ' ],
    'I' => [ 'ǀ', 'ɪ' ],
    'II' => [ 'ǁ' ],
    'IJ' => [ 'Ĳ' ],
    'J' => [ 'ᴊ' ],
    'K' => [ 'ᴋ', 'ĸ' ],
    'L' => [ 'ʟ' ],
    'LJ' => [ 'Ǉ' ],
    'M' => [ 'ᴍ' ],
    'N' => [ 'ɴ' ],
    'Nj' => [ 'ǋ', 'Ǌ' ],
    'O' => [ 'ᴏ', 'Ꝺ' ],
    'OE' => [ 'Œ' ],
    'OI' => [ 'Ƣ' ],
    'OO' => [ 'Ꝏ' ],
    'P' => [ 'ᴘ', 'Ƿ' ],
    'R' => [ 'ʀ', 'Ʀ', 'ꝶ' ],
    'S' => [ 'ꜱ' ],
    'T' => [ 'ᴛ' ],
    'U' => [ 'ᴜ', 'Ʊ' ],
    'V' => [ 'ᴠ' ],
    'VY' => [ 'Ꝡ' ],
    'W' => [ 'ᴡ', 'ꟿ' ],
    'Y' => [ 'ʏ', 'Ɣ' ],
    'Z' => [ 'ᴢ' ],

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

our %myanmar = (

    '3' => [ 'ဒ' ],

    'c' => [ 'င' ],
    'm' => [ 'က' ],
    'o' => [ 'ဝ', ],
    'oo' => [ 'ထ' ],
    'w' => [ 'ယ' ],

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
our @basic = ( %armenian, %cherokee, %cyrillic, %deseret, %greek, %georgian, %latin, %lisu, %myanmar, %roman-numerals, %runic, %math-symbols );

our %accented = (

    'a' => [ 'à', 'á', 'â', 'ã', 'ä', 'å', 'ā', 'ă', 'ą', 'ǎ', 'ǟ', 'ǡ', 'ǻ', 'ȁ', 'ȃ', 'ȧ', 'ᶏ', 'ḁ', 'ẚ', 'ạ', 'ả', 'ấ', 'ầ', 'ẩ', 'ẫ', 'ậ', 'ắ', 'ằ', 'ẳ', 'ẵ', 'ặ', 'ⱥ'],
    'b' => [ 'ƀ', 'ƃ', 'ɓ', 'ᵬ', 'ᶀ', 'ḃ', 'ḅ', 'ḇ', 'ꞗ'],
    'c' => [ 'ç', 'ć', 'ĉ', 'ċ', 'č', 'ƈ', 'ȼ', 'ɕ', 'ḉ', 'ꞓ', 'ꞔ'],
    'd' => [ 'ď', 'đ', 'ƌ', 'ȡ', 'ɖ', 'ɗ', 'ᵭ', 'ᶁ', 'ᶑ', 'ḋ', 'ḍ', 'ḏ', 'ḑ', 'ḓ'],
    'e' => [ 'è', 'é', 'ê', 'ë', 'ē', 'ĕ', 'ė', 'ę', 'ě', 'ȅ', 'ȇ', 'ȩ', 'ɇ', 'ᶒ', 'ḕ', 'ḗ', 'ḙ', 'ḛ', 'ḝ', 'ẹ', 'ẻ', 'ẽ', 'ế', 'ề', 'ể', 'ễ', 'ệ', 'ⱸ', 'ꬴ'],
    'f' => [ 'ƒ', 'ᵮ', 'ᶂ', 'ḟ', 'ꞙ'],
    'g' => [ 'ĝ', 'ğ', 'ġ', 'ģ', 'ǥ', 'ǧ', 'ǵ', 'ɠ', 'ᶃ', 'ḡ', 'ꞡ'],
    'h' => [ 'ĥ', 'ħ', 'ȟ', 'ɦ', 'ḣ', 'ḥ', 'ḧ', 'ḩ', 'ḫ', 'ẖ', 'ⱨ', 'ꞕ'],
    'i' => [ 'ì', 'í', 'î', 'ï', 'ĩ', 'ī', 'ĭ', 'į', 'ǐ', 'ȉ', 'ȋ', 'ɨ', 'ᶖ', 'ḭ', 'ḯ', 'ỉ', 'ị'],
    'j' => [ 'ĵ', 'ǰ', 'ɉ', 'ʝ'],
    'k' => [ 'ķ', 'ƙ', 'ǩ', 'ᶄ', 'ḱ', 'ḳ', 'ḵ', 'ⱪ', 'ꝁ', 'ꝃ', 'ꝅ', 'ꞣ'],
    'l' => [ 'ĺ', 'ļ', 'ľ', 'ŀ', 'ł', 'ƚ', 'ȴ', 'ɫ', 'ɬ', 'ɭ', 'ᶅ', 'ḷ', 'ḹ', 'ḻ', 'ḽ', 'ⱡ', 'ꝉ', 'ꞎ', 'ꬷ', 'ꬸ', 'ꬹ'],
    'm' => [ 'ɱ', 'ᵯ', 'ᶆ', 'ḿ', 'ṁ', 'ṃ', 'ꬺ'],
    'n' => [ 'ñ', 'ń', 'ņ', 'ň', 'ƞ', 'ǹ', 'ȵ', 'ɲ', 'ɳ', 'ᵰ', 'ᶇ', 'ṅ', 'ṇ', 'ṉ', 'ṋ', 'ꞑ', 'ꞥ', 'ꬻ'],
    'o' => [ 'ò', 'ó', 'ô', 'õ', 'ö', 'ø', 'ō', 'ŏ', 'ő', 'ơ', 'ǒ', 'ǫ', 'ǭ', 'ǿ', 'ȍ', 'ȏ', 'ȫ', 'ȭ', 'ȯ', 'ȱ', 'ṍ', 'ṏ', 'ṑ', 'ṓ', 'ọ', 'ỏ', 'ố', 'ồ', 'ổ', 'ỗ', 'ộ', 'ớ', 'ờ', 'ở', 'ỡ', 'ợ', 'ⱺ', 'ꝋ', 'ꝍ'],
    'p' => [ 'ƥ', 'ᵱ', 'ᵽ', 'ᶈ', 'ṕ', 'ṗ', 'ꝑ', 'ꝓ', 'ꝕ'],
    'q' => [ 'ɋ', 'ʠ', 'ꝗ', 'ꝙ'],
    'r' => [ 'ŕ', 'ŗ', 'ř', 'ȑ', 'ȓ', 'ɍ', 'ɼ', 'ɽ', 'ɾ', 'ᵲ', 'ᵳ', 'ᶉ', 'ṙ', 'ṛ', 'ṝ', 'ṟ', 'ꞧ', 'ꭉ'],
    's' => [ 'ś', 'ŝ', 'ş', 'š', 'ș', 'ȿ', 'ʂ', 'ᵴ', 'ᶊ', 'ṡ', 'ṣ', 'ṥ', 'ṧ', 'ṩ', 'ꞩ'],
    't' => [ 'ţ', 'ť', 'ŧ', 'ƫ', 'ƭ', 'ț', 'ȶ', 'ʈ', 'ᵵ', 'ṫ', 'ṭ', 'ṯ', 'ṱ', 'ẗ', 'ⱦ'],
    'u' => [ 'ù', 'ú', 'û', 'ü', 'ũ', 'ū', 'ŭ', 'ů', 'ű', 'ų', 'ư', 'ǔ', 'ǖ', 'ǘ', 'ǚ', 'ǜ', 'ȕ', 'ȗ', 'ᶙ', 'ṳ', 'ṵ', 'ṷ', 'ṹ', 'ṻ', 'ụ', 'ủ', 'ứ', 'ừ', 'ử', 'ữ', 'ự', 'ꞹ', 'ꭎ', 'ꭒ'],
    'v' => [ 'ʋ', 'ᶌ', 'ṽ', 'ṿ', 'ⱱ', 'ⱴ', 'ꝟ'],
    'w' => [ 'ŵ', 'ẁ', 'ẃ', 'ẅ', 'ẇ', 'ẉ', 'ẘ', 'ⱳ'],
    'x' => [ 'ᶍ', 'ẋ', 'ẍ', 'ꭖ', 'ꭗ', 'ꭘ', 'ꭙ'],
    'y' => [ 'ý', 'ÿ', 'ŷ', 'ƴ', 'ȳ', 'ɏ', 'ẏ', 'ẙ', 'ỳ', 'ỵ', 'ỷ', 'ỹ', 'ỿ', 'ꭚ'],
    'z' => [ 'ź', 'ż', 'ž', 'ƶ', 'ȥ', 'ɀ', 'ʐ', 'ʑ', 'ᵶ', 'ᶎ', 'ẑ', 'ẓ', 'ẕ', 'ⱬ'],

    'A' => [ 'À', 'Á', 'Â', 'Ã', 'Ä', 'Å', 'Ā', 'Ă', 'Ą', 'Ǎ', 'Ǟ', 'Ǡ', 'Ǻ', 'Ȁ', 'Ȃ', 'Ȧ', 'Ⱥ', 'Ḁ', 'Ạ', 'Ả', 'Ấ', 'Ầ', 'Ẩ', 'Ẫ', 'Ậ', 'Ắ', 'Ằ', 'Ẳ', 'Ẵ', 'Ặ'],
    'B' => [ 'Ɓ', 'Ƃ', 'Ƀ', 'Ḃ', 'Ḅ', 'Ḇ', 'Ꞗ'],
    'C' => [ 'Ç', 'Ć', 'Ĉ', 'Ċ', 'Č', 'Ƈ', 'Ȼ', 'Ḉ', 'Ꞓ', 'Ꞔ'],
    'D' => [ 'Ď', 'Đ', 'Ɗ', 'Ƌ', 'Ḋ', 'Ḍ', 'Ḏ', 'Ḑ', 'Ḓ'],
    'E' => [ 'È', 'É', 'Ê', 'Ë', 'Ē', 'Ĕ', 'Ė', 'Ę', 'Ě', 'Ȅ', 'Ȇ', 'Ȩ', 'Ɇ', 'Ḕ', 'Ḗ', 'Ḙ', 'Ḛ', 'Ḝ', 'Ẹ', 'Ẻ', 'Ẽ', 'Ế', 'Ề', 'Ể', 'Ễ', 'Ệ'],
    'F' => [ 'Ƒ', 'Ḟ', 'Ꞙ'],
    'G' => [ 'Ĝ', 'Ğ', 'Ġ', 'Ģ', 'Ɠ', 'Ǥ', 'Ǧ', 'Ǵ', 'Ḡ', 'Ꞡ'],
    'H' => [ 'Ĥ', 'Ħ', 'Ȟ', 'Ḣ', 'Ḥ', 'Ḧ', 'Ḩ', 'Ḫ', 'Ⱨ', 'Ɦ'],
    'I' => [ 'Ì', 'Í', 'Î', 'Ï', 'Ĩ', 'Ī', 'Ĭ', 'Į', 'İ', 'Ɨ', 'Ǐ', 'Ȉ', 'Ȋ', 'Ḭ', 'Ḯ', 'Ỉ', 'Ị'],
    'J' => [ 'Ĵ', 'Ɉ', 'Ʝ'],
    'K' => [ 'Ķ', 'Ƙ', 'Ǩ', 'Ḱ', 'Ḳ', 'Ḵ', 'Ⱪ', 'Ꝁ', 'Ꝃ', 'Ꝅ', 'Ꞣ'],
    'L' => [ 'Ĺ', 'Ļ', 'Ľ', 'Ŀ', 'Ł', 'Ƚ', 'Ḷ', 'Ḹ', 'Ḻ', 'Ḽ', 'Ⱡ', 'Ɫ', 'Ꝉ', 'Ɬ'],
    'M' => [ 'Ḿ', 'Ṁ', 'Ṃ', 'Ɱ'],
    'N' => [ 'Ñ', 'Ń', 'Ņ', 'Ň', 'Ɲ', 'Ǹ', 'Ƞ', 'Ṅ', 'Ṇ', 'Ṉ', 'Ṋ', 'Ꞑ', 'Ꞥ'],
    'O' => [ 'Ò', 'Ó', 'Ô', 'Õ', 'Ö', 'Ø', 'Ō', 'Ŏ', 'Ő', 'Ɵ', 'Ơ', 'Ǒ', 'Ǫ', 'Ǭ', 'Ǿ', 'Ȍ', 'Ȏ', 'Ȫ', 'Ȭ', 'Ȯ', 'Ȱ', 'Ṍ', 'Ṏ', 'Ṑ', 'Ṓ', 'Ọ', 'Ỏ', 'Ố', 'Ồ', 'Ổ', 'Ỗ', 'Ộ', 'Ớ', 'Ờ', 'Ở', 'Ỡ', 'Ợ', 'Ꝋ', 'Ꝍ'],
    'P' => [ 'Ƥ', 'Ṕ', 'Ṗ', 'Ᵽ', 'Ꝑ', 'Ꝓ', 'Ꝕ'],
    'Q' => [ 'Ꝗ', 'Ꝙ'],
    'R' => [ 'Ŕ', 'Ŗ', 'Ř', 'Ȑ', 'Ȓ', 'Ɍ', 'Ṙ', 'Ṛ', 'Ṝ', 'Ṟ', 'Ɽ', 'Ꞧ'],
    'S' => [ 'Ś', 'Ŝ', 'Ş', 'Š', 'Ș', 'Ṡ', 'Ṣ', 'Ṥ', 'Ṧ', 'Ṩ', 'Ȿ', 'Ꞩ', 'Ʂ'],
    'T' => [ 'Ţ', 'Ť', 'Ŧ', 'Ƭ', 'Ʈ', 'Ț', 'Ⱦ', 'Ṫ', 'Ṭ', 'Ṯ', 'Ṱ'],
    'U' => [ 'Ù', 'Ú', 'Û', 'Ü', 'Ũ', 'Ū', 'Ŭ', 'Ů', 'Ű', 'Ų', 'Ư', 'Ǔ', 'Ǖ', 'Ǘ', 'Ǚ', 'Ǜ', 'Ȕ', 'Ȗ', 'Ṳ', 'Ṵ', 'Ṷ', 'Ṹ', 'Ṻ', 'Ụ', 'Ủ', 'Ứ', 'Ừ', 'Ử', 'Ữ', 'Ự', 'Ꞹ'],
    'V' => [ 'Ʋ', 'Ṽ', 'Ṿ', 'Ꝟ'],
    'W' => [ 'Ŵ', 'Ẁ', 'Ẃ', 'Ẅ', 'Ẇ', 'Ẉ', 'Ⱳ'],
    'X' => [ 'Ẋ', 'Ẍ'],
    'Y' => [ 'Ý', 'Ŷ', 'Ÿ', 'Ƴ', 'Ȳ', 'Ɏ', 'Ẏ', 'Ỳ', 'Ỵ', 'Ỷ', 'Ỹ', 'Ỿ'],
    'Z' => [ 'Ź', 'Ż', 'Ž', 'Ƶ', 'Ȥ', 'Ẑ', 'Ẓ', 'Ẕ', 'Ⱬ', 'Ɀ', 'Ᶎ'],

);

# special mappings section

# flipped mappings should have very high similarity and no accents
# it may contain flips of other ASCII characters than alphanumerics
our %flipped = (

    '&' => [ '⅋' ],

    '1' => [ 'ᛚ' ],
    '3' => [ 'Ƹ' ],
    '5' => [ 'ဥ' ],
    '8' => [ '∞', 'ထ' ],

    'a' => [ 'ɐ' ],
    'c' => [ 'ɔ', 'ↄ', '𐑋', '⊃', 'ᴐ', 'ᴒ' ],
    'e' => [ 'ǝ', 'ɘ', 'ə' ],
    'g' => [ 'ᵷ' ],
    'h' => [ 'ɥ' ],
    'i' => [ 'ǃ' ],
    'k' => [ 'ʞ' ],
    'l' => [ 'ꞁ' ],
    'm' => [ 'ɯ', 'ᴟ' ],
    'o' => [ 'ᴑ' ],
    'r' => [ 'ɹ' ],
    's' => [ 'ƨ' ],
    't' => [ 'ʇ' ],
    'u' => [ 'ᴝ' ],
    'v' => [ 'ʌ', '⋀', '⋏' ],
    'w' => [ 'ʍ' ],
    'y' => [ 'ʎ' ],

    'A' => [ 'Ɐ', '∀', 'ꓯ' ],
    'B' => [ 'ꓭ' ],
    'C' => [ 'ꓛ', 'Ɔ', '𐐣' ],
    'D' => [ 'ꓷ', '⫏' ],
    'E' => [ '∃', 'ꓱ', '⧢' ],
    'F' => [ 'ꓞ' ],
    'G' => [ 'ꓨ', '⅁' ],
    'J' => [ 'Ꮣ', 'Ⴑ', '𐐓', 'ꓩ' ],
    'K' => [ 'ꓘ' ],
    'L' => [ 'Ꞁ', 'Ⴈ', '𐐑', 'ꓶ', 'Г' ],
    'N' => [ 'И', 'и', '𐐥', '𐑍' ],
    'P' => [ 'ꓒ' ],
    'Q' => [ 'Ꝺ' ],
    'R' => [ 'ᴚ', 'Я', 'ꓤ', 'я' ],
    'S' => [ 'Ƨ', 'Ƨ', 'လ' ],
    'T' => [ '⟘', 'ꓕ', '⊥', '⟂',  '⊢', '⊣' ],
    'U' => [ 'ꓵ', '∩', '⋂' ],
    'V' => [ 'Ʌ', 'ꓥ' ],
    'Y' => [ '⅄' ],

);
