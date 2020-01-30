use HomoGlypher;
use HomoGlypher::Mappings;
use IDNA::Punycode;
use Net::DNS;

my $domain = 'example';
my $tld = 'com';
my $dns = '1.1.1.1';

my $hg = HomoGlypher.new;
$hg.add-mapping( $_ ) for @HomoGlypher::Mappings::basic;

for $hg.unwind( $domain ) -> $homoglyphed-domain {
    my $punycoded-domain = encode_punycode( $homoglyphed-domain );
    
    printf 'Testing %s (%s): ', $homoglyphed-domain, $punycoded-domain;
    
    state $dns-resolver = Net::DNS.new( $dns );
    
    my @resolved-domains = $dns-resolver.lookup-ips(  $punycoded-domain );
    
    if @resolved-domains {
        say 'FOUND AT ' ~ @resolved-domains ~ ' !!! ';
    }
    else {
        say 'nope';
    }
}