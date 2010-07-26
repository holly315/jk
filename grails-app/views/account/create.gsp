<head>
	<title>新規登録</title>
	<style TYPE="text/css">
		<!--
			td, th {
				color: red;
				font-size: 200%;
 				font-family: "ＭＳ ゴシック";
 				border: 1px solid gray;
			}
		
			div{
				width:300px;
				height:300px;
			}
			
			.nav{
				position: relative;
				top:0px;
				left:500px;
				font-size:30px;
			}
			
			.body{
				position:relative;
				top:-280px;
				left:500px;
			}
			
						
			.buttons{
				position:relative;
				top:-50px;
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

	<div class="nav">
		<span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">メインページへ戻る</a></span>
	</div> 

	<div class="body">
		<h1>新規登録</h1>
		<g:if test="${flash.message}">
		<div class="message">${flash.message}</div>
		</g:if>
		<g:hasErrors bean="${account}">
		<div class="errors">
			<g:renderErrors bean="${account}" as="list" />
		</div>
		</g:hasErrors>
		<g:form action="save">
			<div class="dialog">
				<table >
				<tbody>

							<tr class="prop">
                                <td nowrap valign="top" class="name">
                                    <label for="name"><g:message code="account.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: account, field: 'name', 'errors')}">
                                    <g:textField name="name" maxlength="40" value="${account?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="email"><g:message code="account.email.label" default="Email" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: account, field: 'email', 'errors')}">
                                    <g:textField name="email" value="${account?.email}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="passwd"><g:message code="account.passwd.label" default="Passwd" /></label>
                                </td>

                                <td valign="top" class="value ${hasErrors(bean: account, field: 'passwd', 'errors')}">
                                    <g:passwordField name="passwd" maxlength="40" value="${account?.passwd}" />
                                </td>
                            </tr>
                        
                            <% int esa = 3 %>
                        	<g:hiddenField name="esa" value="${esa}" />
                        	
                        	<% int hp = 100 %>
                        	<g:hiddenField name="hp" value="${hp}" />
                        	
                            <% int won = 0 %>
                        	<g:hiddenField name="won" value="${won}" />
                        
                            <% int lost = 0 %>
                        	<g:hiddenField name="lost" value="${lost}" />
                        
                            <g:hiddenField name="log" value=" " />
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="animal"><g:message code="account.animal.label" default="Animal" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: account, field: 'animal', 'errors')}">
                                    <g:select name="animal.id" from="${jk.Animal.list()}" optionValue="name" optionKey="id" value="${account?.animal?.id}" noSelection="[' ':'選択してください']"  />
                                </td>
                            </tr>
                        
                            <g:hiddenField name="deadflg" value="true" />
							
							<tr>
								<td style="visibility:hidden;"><input type="hidden" name="_ROLE_USER" />
								<input type="checkbox" name="ROLE_USER" checked="checked" id="ROLE_USER"  /></td>
							</tr>


				</tbody>
				</table>
			</div>

			<div class="buttons">
				<span class="button"><input class="save" type="submit" value="登録" /></span>
			</div>

		</g:form>
</div>
	</div>
</body>