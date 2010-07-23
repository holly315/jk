<head>
	<meta name="layout" content="main" />
	<title>新規登録</title>
</head>

<body>

	<div class="nav">
		<span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
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
				<table>
				<tbody>

							<tr class="prop">
                                <td valign="top" class="name">
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
                                    <g:select name="animal.id" from="${jk.Animal.list()}" optionKey="id" value="${account?.animal?.id}"  />
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
</body>