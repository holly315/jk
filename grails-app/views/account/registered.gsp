<head>
	<meta name="layout" content="main" />
	<title>登録完了</title>
</head>

<body>

	<div class="nav">
		<span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
	</div>

	<div class="body">
		<h1>登録完了しました</h1>
		<g:if test="${flash.message}">
		<div class="message">${flash.message}</div>
		</g:if>
		<div class="dialog">
			<table>
			<tbody>

				<tr class="prop">
                            <td valign="top" class="name"><g:message code="account.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: account, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="account.name.label" default="Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: account, field: "name")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="account.email.label" default="Email" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: account, field: "email")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="account.animal.label" default="Animal" /></td>
                            
                            <td valign="top" class="value"><g:link controller="animal" action="show" id="${account?.animal?.id}">${account?.animal?.id.encodeAsHTML()}</g:link></td>
                            
                        </tr>

			</tbody>
			</table>
		</div>

		<div class="buttons">
			<span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
		</div>

	</div>
</body>
