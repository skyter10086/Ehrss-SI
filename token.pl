use Ehrss::SI::Token;
use Ehrss::SI;
use Data::Printer;
use Mojo::Message::Request;
use Mojo::Headers;
use Modern::Perl;
use utf8::all;


my $xsrf = Ehrss::SI::Token->new(
         name   => 'XSRF-TOKEN',
         value  => 'b5658647-0ee9-4c4b-bed6-25ff5642ab0c',
         domain => '222.143.34.121',
         path   => '/'
         );
my $session = Ehrss::SI::Token->new(
         name   => 'SESSION',
         value  => 'de37a73d-ebb7-4ee8-a19b-7526635d669a',
         domain => '222.143.34.121',
         path   => '/'
         ); 

my $company_id = '419900800452';

my $si = Ehrss::SI->new(
           xsrf => $xsrf,
           session => $session,
           company_id => $company_id,
	     );

my $ua = $si->ua;
my $url = 'http://222.143.34.121/ehrss-si-enterprise/api/search/common/searchFor009';
my $res_json = $ua
                ->post($url => 
                  	         {Accept => '*/*'} => 
                  	         json => {
                  	         	       aac001=>'41990082132552',
                  	         	       aab001=>'419900800452',
                  	         	       orgNumber=>'1060131',
                  	         	       orgType=>'0',
                  	         	       pageNumber=>1,
                  	         	       pageSize=>10,
                  	         	       aae002=>200101,
                  	         	       aae002_end=>202004,


                  	         	   },
                  	     )->result->json;

p $res_json;
my $url_query = 'http://222.143.34.121/ehrss-si-enterprise/api/simis/person?aab001=419900800452&aac147=412929197606023007&findType=1';

my $tx = $ua->build_tx(GET => $url_query);


my $req_headers = $tx->req->headers;
$req_headers->accept('application/json', 'text/plain', '*/*');

$req_headers->accept_encoding('gzip','deflate');
$req_headers->accept_language('zh-CN,zh;q=0.9');
$req_headers->connection('keep-alive');
$req_headers->host('222.143.34.121');
$req_headers->referrer('http://222.143.34.121/ehrss/si/enterprise/ui/?code=YrtPlG&state=9527');
$req_headers->add('group' => '1060131')
            ->add('SID' => '')
            ->add('ssoSessionId'=>'c4a8dd8e-8aaf-42eb-8c52-7897aa4ebb6e')
            ->add('X-XSRF-TOKEN'=>'b5658647-0ee9-4c4b-bed6-25ff5642ab0c');
$req_headers->user_agent('Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.87 Safari/537.36');
$req_headers->cookie('XSRF-TOKEN=b5658647-0ee9-4c4b-bed6-25ff5642ab0c; SESSION=de37a73d-ebb7-4ee8-a19b-7526635d669a');

# say $req_headers->to_string;

my $res_tx = $ua->start($tx);
my $json =  $res_tx->res->json;


p $json;

__END__
 
GET /ehrss-si-enterprise/api/simis/person?aab001=419900800452&aac147=410105197611218240&findType=1 HTTP/1.1
Host: 222.143.34.121
Connection: keep-alive
Accept: application/json, text/plain, */*
SID: 
ssoSessionId: c4a8dd8e-8aaf-42eb-8c52-7897aa4ebb6e
X-XSRF-TOKEN: b5658647-0ee9-4c4b-bed6-25ff5642ab0c
group: 1060131
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.87 Safari/537.36
Referer: http://222.143.34.121/ehrss/si/enterprise/ui/?code=YrtPlG&state=9527
Accept-Encoding: gzip, deflate
Accept-Language: zh-CN,zh;q=0.9
Cookie: XSRF-TOKEN=b5658647-0ee9-4c4b-bed6-25ff5642ab0c; SESSION=de37a73d-ebb7-4ee8-a19b-7526635d669a