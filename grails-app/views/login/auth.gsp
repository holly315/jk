
<head>
<meta name='layout' content='top' />
<title>弱肉強食</title>
<style type='text/css' media='screen'>
        #superpanel{
        	margin-left:30px;
        }
        
        #nav {
            margin-left:30px;
            width:228px;
            float:left;
        }

        #login {
        	margin:0px 0px; padding:0px;
        	text-align:center;
        }
        #login .inner {
        	width:260px;
        	margin:0px auto;
        	text-align:left;
        	padding:10px;
        	border-top:1px dashed #499ede;
        	border-bottom:1px dashed #499ede;
        	background-color:#EEF;
        }
        #login .inner .fheader {
        	padding:4px;margin:3px 0px 3px 0;color:#2e3741;font-size:14px;font-weight:bold;
        }
        #login .inner .cssform p {
        	clear: left;
        	margin: 0;
        	padding: 5px 0 8px 0;
        	padding-left: 105px;
        	border-top: 1px dashed gray;
        	margin-bottom: 10px;
        	height: 1%;
        }
        #login .inner .cssform input[type='text'] {
        	width: 120px;
        }
        #login .inner .cssform label {
        	font-weight: bold;
        	float: left;
        	margin-left: -105px;
        	width: 100px;
        }
        #login .inner .login_message {color:red;}
        #login .inner .text_ {width:120px;}
        #login .inner .chk {height:12px;}
        
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
            margin-right:20px;
            margin-top:100px;
        	font-size: 8pt;
        }
        
        </style>
    </head>
    
    <body>
    <div id="superpanel">
    <div id="nav">
        <div id='login'>
		<div class='inner'>
			<g:if test='${flash.message}'>
			<div class='login_message'>${flash.message}</div>
			</g:if>
			<div class='fheader'>ログインフォーム</div>
			<form action='${postUrl}' method='POST' id='loginForm' class='cssform' autocomplete='off'>
				<p>
					<label for='j_username'>なまえ</label>
					<input type='text' class='text_' name='j_username' id='j_username' value='${request.remoteUser}' />
				</p>
				<p>
					<label for='j_password'>パスワード</label>
					<input type='password' class='text_' name='j_password' id='j_password' />
				</p>
				<p>
					<label for='remember_me'>記憶させる</label>
					<input type='checkbox' class='chk' name='_spring_security_remember_me' id='remember_me'
					<g:if test='${hasCookie}'>checked='checked'</g:if> />
				</p>
				<p>
					<input type='submit' value='ログイン' />
				</p>
			</form>
		</div>
		</div>
<script type='text/javascript'>
<!--
(function(){
	document.forms['loginForm'].elements['j_username'].focus();
})();
// -->
</script>
	</div>
	<div id="pageBody">
            <div id="controllerList" class="dialog">
                <h2>ゲームをはじめる:</h2>
                <ul>
                    <li class="biginnerlist"><a href="../account/create">新規登録</a></li>
                    <li class="biginnerlist"><a href="../rule.gsp">遊び方</a></li>
                </ul>
                <h2><g:link controller="map" action="ranking">ランキング</g:link></h2>
            </div>
        </div>
        <div id="manager">
        	<a href="../manager/manage.gsp">管理者用メニュー</a>
        </div>
    </div>
</body>
