
<head>
<title>管理者用ログインフォーム</title>
<link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
        <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
<style type='text/css' media='screen'>
        #superpanel{
        	margin-left:30px;
        }
        
        #nav {
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
        #backlink {
        	margin-left:30px;
            margin-right:20px;
            margin-top:100px;
        	font-size: 8pt;
        }
        #pageBody .biginnerlist {font-size: 13pt}
        
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
			<form action='${postUrl}' method='POST' id='loginForm' class='cssform' autocomplete='off' target="_top">
				<p>
					<label for='j_username'>なまえ</label>
					<input type='text' class='text_' name='j_username' id='j_username' value='${request.remoteUser}' />
				</p>
				<p>
					<label for='j_password'>パスワード</label>
					<input type='password' class='text_' name='j_password' id='j_password' />
				</p>
				<p>
					<input type='submit' value='ログイン' />
				</p>
			</form>
		</div>
		</div>
<script type='text/javascript'>
(function(){
	document.forms['loginForm'].elements['j_username'].focus();
})();
</script>
	</div>
	<div id='backlink'>
		<a href="/jk/logout/index"  target="_top>戻る</a>
	</div>
    </div>
</body>
