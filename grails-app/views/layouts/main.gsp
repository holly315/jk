<html>
    <head>
        <title><g:layoutTitle default="Grails" /></title>
        <link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
        <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
        <g:layoutHead />
        <g:javascript library="application" />
        <style type='text/css' media='screen'>
        h1 {
        	font-size:100px;
			color:red;
			text-align:center;
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
        <g:layoutBody />
		</div>
    </body>
</html>