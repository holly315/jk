
<head>
<meta name='layout' content='top' />
<title>弱肉強食</title>
<style type='text/css' media='screen'>
        #superpanel{
        	margin-left:60px;
        }
        
        #nav {
            width:400px;
            float:left;
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
        #pageBody .biginnerlist {font-size: 13pt}
        
        #manager {
        	margin-left:30px;
            margin-right:20px;
            margin-top:100px;
        	font-size: 8pt;
        }
        
        </style>
    </head>
    
    <body>
    <div id="superpanel">
    <div id="nav">
		<iframe src="./login/auth" name="authFrom" frameborder="no" scrolling="no" width="400" >
			インラインフレームを使用しています。対応ブラウザを使ってください。</br>
			将来的にインラインフレームが廃止された場合は、今のアドレスの末尾に /login/auth をつけることで対処してください
		</iframe>
	</div>
	<div id="pageBody">
            <div id="controllerList" class="dialog">
                <h2>ゲームをはじめる:</h2>
                <ul>
                    <li class="biginnerlist"><a href="./account/create">新規登録</a></li>
                    <li class="biginnerlist"><a href="./rule.gsp">遊び方</a></li>
                </ul>
                <h2><g:link controller="map" action="ranking">ランキング</g:link></h2>
            </div>
        </div>
    </div>
    <div id="manager">
       	<a href="./manager/manage.gsp">管理者用メニュー</a>
    </div>
</body>
