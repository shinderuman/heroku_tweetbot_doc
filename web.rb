# encoding: utf-8
require 'sinatra'
require 'cgi'

get '/:name' do
  name = params[:name]
  map = {"sagabot" => "サガ スクウェア",
         "dorohedoro_bot" => "ドロヘドロ IKKI 小学館",
         "seiken3_bot" => "聖剣伝説 スクウェア",
         "eggmonster_bot" => "半熟英雄 スクウェア"}
  str = CGI.escape(map[name])
  <<"EOS"
    <!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
    <html xml:lang="en" xmlns="http://www.w3.org/1999/xhtml" lang="en"><head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="robots" content="noindex">
        <link rel="stylesheet" media="screen" type="text/css" href="static/css/spacegallery.css" />
        <script type="text/javascript" src="static/js/jquery.js"></script>
        <script type="text/javascript" src="static/js/eye.js"></script>
        <script type="text/javascript" src="static/js/utils.js"></script>
        <script type="text/javascript" src="static/js/spacegallery.js"></script>
        <script type="text/javascript" src="static/js/pretty.js"></script>
          <style type="text/css">
            body {background-color: #1c1c1c;color: #444;font-family: serif;text-align:center;align:center;}
            h1 {top: 100px;font-size: 34px;color: #ffffff;}
            div#container {color: #d5d5d5;width: 700;height: 500px;top: 0px;font-size: 20px;text-shadow: #000 1px 1px 2px;}
            div.card {width:640px;height:480px;position:absolute;background-color:#1c1c1c;}
          </style>
        <title>Bot Project</title>
        </head><body>
          <div style="text-align:center">
            <div id="container" class="spacegallery">

            </div>
            <div style="width:100%" align="center">
              <span id="created_at"></span>
            </div>
          </div>
          <script type="text/javascript">
          function onTwitter(data){
            $('#created_at').empty().append(prettyDate(data[0].created_at));
            data.reverse();
            $(document).ready(function() {
              $.each(data,function(n){
                $('#container').append("<div class='card' created_at='"+data[n].created_at+"'style='text-align:center'><h1>"+data[n].text+"</h1></div>");
              });
              $('#container').spacegallery({loadingClass: 'loading'});
            });
          }
          </script>
          <script type="text/javascript" src="http://twitter.com/status/user_timeline/#{name}.json?count=8&callback=onTwitter"></script>
          <div style="display:block;margin-top:50px;">
            <iframe src="http://rcm-jp.amazon.co.jp/e/cm?t=sagabot-22&o=9&p=48&l=st1&mode=music-jp&search=#{str}&fc1=FFFFFF&lt1=_blank&lc1=3366FF&bg1=1C1C1C&f=ifr" marginwidth="0" marginheight="0" width="728" height="90" border="0" frameborder="0" style="border:none;" scrolling="no"></iframe>
          </div>
        </body>
    </html>
EOS
end
