<head>
	<meta name="layout" content="main" />
	<title>Show Account</title>
</head>

<body>

	<div class="nav">
		<span class="menuButton"><a class="home" href="../manager/manage.gsp">back</a></span>
		<span class="menuButton"><g:link class="list" action="list">Account List</g:link></span>
		<span class="menuButton"><g:link class="create" action="create">New Account</g:link></span>
	</div>

	<div class="body">
		<h1>Show Account</h1>
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
                            <td valign="top" class="name"><g:message code="account.esa.label" default="Esa" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: account, field: "esa")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="account.hp.label" default="Hp" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: account, field: "hp")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="account.won.label" default="Won" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: account, field: "won")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="account.lost.label" default="Lost" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: account, field: "lost")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="account.log.label" default="Log" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: account, field: "log")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="account.animal.label" default="Animal" /></td>
                            
                            <td valign="top" class="value"><g:link controller="animal" action="show" id="${account?.animal?.id}">${account?.animal?.id.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="account.deadflg.label" default="Deadflg" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${account?.deadflg}" /></td>
                            
                        </tr>

				<tr class="prop">
					<td valign="top" class="name">Roles:</td>
					<td valign="top" class="value">
						<ul>
						<g:each in="${roleNames}" var='name'>
							<li>${name}</li>
						</g:each>
						</ul>
					</td>
				</tr>

			</tbody>
			</table>
		</div>

		<div class="buttons">
			<g:form>
				<input type="hidden" name="id" value="${account.id}" />
				<span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
				<span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
			</g:form>
		</div>

	</div>
</body>
