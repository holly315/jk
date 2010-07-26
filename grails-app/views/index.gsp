
<head>
<meta name='layout' content='top' />
<title>弱肉強食</title>
<style type='text/css' media='screen'>

		div {
			width: 1000px;
			height: 150px;
		}

        #superpanel{
        position: relative;
			top:-100px;
			left:0px;
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
			position: relative;
			top:-30px;
			left:-400px;
        }
        #login .inner .fheader {
        	padding:4px;margin:3px 0px 3px 0;color:#2e3741;font-size:14px;font-weight:bold;
			position: relative;
			top:0px;
			left:0px;
        }
        #login .inner .cssform p {
        	clear: left;
        	margin: 0;
        	padding: 5px 0 8px 0;
        	padding-left: 105px;
        	border-top: 1px dashed gray;
        	margin-bottom: 10px;
        	height: 1%;
			position: relative;
			top:-120px;
			left:0px;
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
			color:white;
        }
        #pageBody {
            margin-left:400px;
            margin-right:20px;
			position: relative;
			top:-300px;
			left:400px;
        }
        #pageBody .biginnerlist {
			font-size: 20pt;
			color:white;
			}

        
        #manager {
            margin-right:20px;
            margin-top:100px;
        	font-size: 8pt;
        	position: relative;
			top:-300px;
			left:0px;
        }

        a:link, a:visited, a:hover {
		    color: #fff;
		    font-weight: bold;
		    text-decoration: none;
		}
			.moji{
			font-size:20px;
			text-align:left;
			color:#fff;
		}
		.moji2{
			font-size:40px;
			text-align:left;
			color:red;
		}
		.moji3{
			font-size:100px;
			color:black;
			font-weight:bold;	
		}
		
			 .moji5{
		            font-size:15pt;
					color:white;
					position: relative;
					font-weight: bold;
					top:-200px;
					left:800px;
		        }
		        
			body { overflow-y: hidden; }
	
        </style>
    </head>
    
    <body leftmargin="0" topmargin="0">
    <IMG src="/jk/images/sabanna.gif" width="100%" height="100%"
	style="position:absolute; top:0px; left:0px; z-index:1">
	<DIV style="position:absolute; top:10px; left:10px; z-index:2">
	  <div id="spinner" class="spinner" style="display:none;">
            <img src="${resource(dir:'images',file:'spinner.gif')}" alt="${message(code:'spinner.alt',default:'Loading...')}" />
        </div>
        	<center><span class="moji3">弱肉強食</span></center>
			<div class="moji">
				<span class="moji2">注意</span><br>
				ゲームを始めるには右側の新規登録で<br>アカウントを作成してください
			</div>
				<span class="moji5">
				弱肉強食の世界へようこそ!!<br>すぐにアカウントを取得してゲームを始めよう!!<br>詳しい事は遊び方を見てください!!<br>
				</span>


    <div id="superpanel">
    <div id="nav">
		<iframe src="./login/auth" name="authFrom" frameborder="no" scrolling="no" width="260" >
			インラインフレームを使用しています。対応ブラウザを使ってください。</br>
			将来的にインラインフレームが廃止された場合は、今のアドレスの末尾に /login/auth をつけることで対処してください
		</iframe>
             </div>
 	
<script type='text/javascript'>
<!--
(function(){
	document.forms['loginForm'].elements['j_username'].focus();
})();
// -->
</script>
	</div>
	<div id="pageBody" style="border-style: solid;height: 200px;background-color:black;width:30%;" >
            <div id="controllerList" class="dialog"  style="width:250px;">
                <h2 style="text-align:center;"><めいんぺーじめにゅ〜></h2>
                <ul>
                    <li class="biginnerlist" style="text-align:center;"><a href="./account/create">新規登録</a></li>
                    <li class="biginnerlist" style="text-align:center;"><a href="./rule.gsp">遊び方</a></li>
 					<li class="biginnerlist" style="text-align:center;"><g:link controller="animal" action="ranking">ランキング</g:link></li>
                </ul>
            </div>
        </div>
        <div id="manager" style="width:20%;height:10%;">
        	<a href="./manager/manage.gsp">管理者用メニュー</a>
        </div>
      </div>
    </body>
