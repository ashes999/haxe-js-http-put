package webclient;

import haxe.io.Bytes;
import thx.http.RequestInfo;
import thx.http.RequestType;
using thx.http.Request;
using thx.Arrays;
using thx.Strings;
#if thx_stream
using thx.stream.Stream;
#end

@:expose
@:keep
class Main
{
	public static function main()
	{
        trace("Hello!");
		/*var args = Sys.args();
		var method = args[0];
		var url = args[1];*/
        var method = "PUT";
        var url = "https://jsonplaceholder.typicode.com/posts/1";

		Main.httpRequest(method, url);
	}

    public static function httpRequest(method:String, url:String):Void
    {
        var body:String = "";

        if (method != "GET") {
            body = "{title: 'foo', body: 'bar', userId: 1}";
        }

        var info:RequestInfo;

        if (method == "GET") {
            info = new RequestInfo(Get, url, [
                "Agent" => "thx.http.Request"
            ]);
        } else {
            info = new RequestInfo(Put, url, Text(body));
        }

        Request.make(info, Json)
        .response
        .flatMap(function(r) {
            trace('${method} DONE (r=${r.statusCode}): ${r.body}');
            return r.body;
        })
        .success(function(r) trace("Request successful: " + r))
        .failure(function(e) trace("Request FAILED: " + e));
    }
}