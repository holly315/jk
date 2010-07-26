<head>
	<title>登録完了</title>
	<style TYPE="text/css">
		<!--
			td, th {
					color: black;
					font-size: 200%;
 					font-family: "ＭＳ ゴシック";
 					border: 1px solid black;
				}
		
			div{
				width:300px;
				height:300px;
			}
			
			.nav{
				position: relative;
				top:-100px;
				left:70px;
				font-size:30px;
			}
			
			.body{
				position:relative;
				top:0px;
				left:500px;
			}
			
						
			.buttons{
				position:relative;
				top:300px;
				left:100px;
				height:30%;
			}
			
				input, select, textarea {
				background-color:#FCFCFC;
				border:5px ridge #CCCCCC;
				font:20px verdana,arial,helvetica,sans-serif;
				margin:2px 0;
				padding:2px 4px;
				background-color: #ffffff;         /* 背景色 */
			}

		-->
	</style>

</head>

	<body leftmargin="0" topmargin="0">
			<img src="/jk/images/sakura.gif" width="1520px" height="820px" style="position:absolute; top:0px; left:0px; z-index:1">
			<div style="position:absolute; top:10px; left:10px; z-index:2; width:100%">

	
	<div class="body">
		<h1>登録完了しました</h1>
		<g:if test="${flash.message}">
		<div class="message">${flash.message}</div>
		</g:if>
		<div class="dialog">
			<table>
			<tbody>

		                    
                        <tr class="prop">
                            <td nowrap valign="top" class="name" style="color:red;"><g:message code="account.name.label" default="Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: account, field: "name")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name" style="color:red;"><g:message code="account.email.label" default="Email" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: account, field: "email")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name" style="color:red;"><g:message code="account.animal.label" default="Animal" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: account, field: "animal.name")}</td>
                            
                        </tr>

			</tbody>
			</table>
		</div>
<div class="nav">
		<span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">メインページへ</a></span>
	</div>

	</div>
	</div>
</body>
