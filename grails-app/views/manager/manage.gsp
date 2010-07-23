<html>
    <head>
        <title>Welcome to Grails</title>
        <meta name="layout" content="top" />
        <style type="text/css" media="screen">
        #superpanel{
        	margin-left:30px;
        }
        
        h2 {
            margin-top:15px;
            margin-bottom:15px;
            font-size:15pt;
        }
        #pageBody {
            margin-left:400px;
            margin-right:20px;
        }
        #pageBody .biginnerlist {font-size: 10pt}
        
        </style>
    </head>
    
    <body>
    <div id="superpanel">
        <div id="pageBody">
            <div id="controllerList" class="dialog">
                
                <h2>管理者用メニュー:</h2>
                <ul>
                    
                        <li class="controller"><a href="/jk/account/index">アカウント管理</a></li>
                    
                        <li class="controller"><a href="/jk/animal/index">動物管理</a></li>
                    
                        <li class="controller"><a href="/jk/battle/index">戦闘管理</a></li>
                    
                        <li class="controller"><a href="/jk/map/index">マップ管理</a></li>
                        
                        <li class="controller"><a href="/jk/authority/index">権限管理</a></li>
                    
                        <li class="controller"><a href="/jk/requestmap/index">権限による閲覧制限管理</a></li>
                        
                        <li class="controller"><a href="/jk/logout/index">ログアウト</a></li>


                </ul>
            </div>
        </div>
    </div>
    </body>
</html>
