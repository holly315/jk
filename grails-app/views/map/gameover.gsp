<%@ page import="jk.Map" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="top" />
        <g:set var="entityName" value="${message(code: 'map.label', default: 'Map')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
			<style TYPE="text/css">
			<!--

			div {
			width: 800px;
			height: 200px;
			}

			body{
			margin:0;
			padding:0;
					background-color:#000000;
					
			}

			#wrapper{
			width:100%;
			margin:0 auto 0 auto;
			padding:0;
			background-color:#000000;
			background-image: url("/jk/images/end.jpg"); /* 画像へのパス */
			background-repeat : no-repeat;
			background-attachment : fixed;
			background-position : 0% 0%;
			}

			#header{
			height:200px;
			margin:0;
			padding:0;
			background-color:#000;
			color:#fff;
			border:5px ridge #CCCCCC;
			text-align:center;
			position: relative;
			top:0px;
			left:220px;
			}

			#contents{
			width:100%;
			margin:0;
			padding:0;
			background-color:#000000;
				background-image: url("/jk/images/end.jpg"); /* 画像へのパス */
				background-repeat : no-repeat;
				background-attachment : fixed;
				background-position : 0% 0%;
			}

			#footer{
			height:100px;
			margin:0;
			padding:0;
			background-color:#000;
			border:10px ridge #CCCCCC;
			position: relative;
			text-align:center;
		    top:-200px;
		    left:220px;
			border:ridge 5px; 
			}

			#hidari{
				position: relative;
			    bottom:0px;
			    left:-300px;
				text-align:center;
			}
			#naka{
				position: relative;
			    bottom:200px;
			    left:200px;
				text-align:center;
			}

			#migi{
				position: relative;
			    bottom:400px;
			    left:700px;
				text-align:center;
			}

			#owari{
				position: relative;
				text-align:center;
		    	top:50px;
		    	left:0px;
			}

			p{
			margin:0;
			padding:10px;
			color:white;
			font-size:30px;
			}

			.moji{
				font-size:20;
				color:#fff;
			}

			.moji2{
				font-weight: bold;
				font-size:40;
				color:#fff;
			}

			h1 {
				color:fff;
				font-size:40;
			}

			input, select, textarea {
				background-color:#FCFCFC;
				border:5px ridge #CCCCCC;
				font:30px verdana,arial,helvetica,sans-serif;
				margin:2px 0;
				padding:2px 4px;
				background-color: #ffffff;         /* 背景色 */
			}


			-->
			</style>
</head>
<BODY leftmargin="0" topmargin="0">
<IMG src="/jk/images/end.jpg" width="100%" height="100%"
style="position:absolute; top:0px; left:0px; z-index:1">
<DIV style="position:absolute; top:10px; left:10px; z-index:2">

	<g:form action="index" controller="logout" method="post" >
	
				<p>あなたは力つきました。残念ですがここでゲーム終了です<br>お疲れさまでした。また遊んでね!!</p>
			 		<span class="button"><g:submitButton name="create" value="${message(code: 'default.button.dead.label', default: 'Create')}" /></span>
					</g:form>

	
</body>
</html>
