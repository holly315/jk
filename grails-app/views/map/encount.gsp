<%@ page import="jk.Map" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'map.label', default: 'Map')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
			<style TYPE="text/css">
			<!--
			div {
			width: 800px;
			height: 200px;
			}
			<%
				switch(accountInstance2.animal.name){
					case("鹿"):
							%>
								body{
								margin:0;
								padding:0;
								background-color:#dcdcdc;
								background-image: url("/jk/images/sika2.jpg"); /* 画像へのパス */
								background-repeat : no-repeat;
								background-attachment : fixed;
								background-position : 0% 50%;

								}
							<%
						break
					case("兎"):
						%>
							body{
							margin:0;
							padding:0;
							background-color:#dcdcdc;
							background-image: url("/jk/images/usagi2.jpg"); /* 画像へのパス */
							background-repeat : no-repeat;
							background-attachment : fixed;
							background-position : 0% 50%;

							}
						<%
						break
					case("虎"):
						%>
							body{
							margin:0;
							padding:0;
							background-color:#dcdcdc;
							background-image: url("/jk/images/tora2.jpg"); /* 画像へのパス */
							background-repeat : no-repeat;
							background-attachment : fixed;
							background-position : 0% 50%;

							}
						<%
						break	
					case("熊"):
						%>
							body{
							margin:0;
							padding:0;
							background-color:#dcdcdc;
							background-image: url("/jk/images/kuma2.jpg"); /* 画像へのパス */
							background-repeat : no-repeat;
							background-attachment : fixed;
							background-position : 0% 50%;

							}
						<%
						break
					case("猫"):
					%>
						body{
						margin:0;
						padding:0;
						background-color:#dcdcdc;
						background-image: url("/jk/images/neko2.jpg"); /* 画像へのパス */
						background-repeat : no-repeat;
						background-attachment : fixed;
						background-position : 0% 50%;

						}
					<%
						break
					default:
						break

				}
			%>

			#wrapper{
			width:100%;
			margin:0 auto 0 auto;
			padding:0;
			background-color:#ffffff;
		
			}

			#header{
			height:150px;
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
			background-color:#f0f8ff;
		
			}

			#footer{
			height:100px;
			margin:0;
			padding:0;
			background-color:#000;
			border:10px ridge #CCCCCC;
			position: relative;
			text-align:center;
		    top:50px;
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
		    	top:100px;
		    	left:500px;
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
				color:red;
			}

			h1 {
				color:fff;
				font-size:40;
			}

			input, select, textarea {
				background-color:#FCFCFC;
				border:5px ridge #CCCCCC;
				font:200px verdana,arial,helvetica,sans-serif;
				margin:2px 0;
				padding:2px 4px;
				background-color: #ffffff;         /* 背景色 */
			}


			-->
			</style>
    </head>
<body>

	
    <g:form action="kekka" method="post" >
	<span class="moji2">${accountInstance2.name}(${accountInstance2.animal.name})と遭遇しました</span>



		<g:hiddenField name="myId" value="${accountInstance.id}"/>
		<g:hiddenField name="enemyId" value="${accountInstance2.id}"/>
		<g:hiddenField name="hako" value="${hako}"/>
		<g:hiddenField name="hande" value="${hande}"/>
		<g:hiddenField name="hantei1" value="${hantei1}"/>
		<g:hiddenField name="hantei2" value="${hantei2}"/>
<div id="owari">
		<span class="button"><g:submitButton name="create" value="${message(code: 'default.button.battle.label', default: 'Create')}" /></span>
</div>
	

</g:form>
    </body>
</html>
