<head>
	<meta name="layout" content="main" />
	<title>Edit Account</title>
</head>

<body>

	<div class="nav">
		<span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
		<span class="menuButton"><g:link class="list" action="list">Account List</g:link></span>
		<span class="menuButton"><g:link class="create" action="create">New Account</g:link></span>
	</div>

	<div class="body">
		<h1>Edit Account</h1>
		<g:if test="${flash.message}">
		<div class="message">${flash.message}</div>
		</g:if>
		<g:hasErrors bean="${account}">
		<div class="errors">
			<g:renderErrors bean="${account}" as="list" />
		</div>
		</g:hasErrors>

		<div class="prop">
			<span class="name">ID:</span>
			<span class="value">${account.id}</span>
		</div>

		<g:form>
			<input type="hidden" name="id" value="${account.id}" />
			<input type="hidden" name="version" value="${account.version}" />
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
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="esa"><g:message code="account.esa.label" default="Esa" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: account, field: 'esa', 'errors')}">
                                    <g:textField name="esa" value="${fieldValue(bean: account, field: 'esa')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="hp"><g:message code="account.hp.label" default="Hp" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: account, field: 'hp', 'errors')}">
                                    <g:textField name="hp" value="${fieldValue(bean: account, field: 'hp')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="won"><g:message code="account.won.label" default="Won" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: account, field: 'won', 'errors')}">
                                    <g:textField name="won" value="${fieldValue(bean: account, field: 'won')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="lost"><g:message code="account.lost.label" default="Lost" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: account, field: 'lost', 'errors')}">
                                    <g:textField name="lost" value="${fieldValue(bean: account, field: 'lost')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="log"><g:message code="account.log.label" default="Log" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: account, field: 'log', 'errors')}">
                                    <g:textField name="log" value="${account?.log}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="animal"><g:message code="account.animal.label" default="Animal" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: account, field: 'animal', 'errors')}">
                                    <g:select name="animal.id" from="${jk.Animal.list()}" optionKey="id" value="${account?.animal?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="deadflg"><g:message code="account.deadflg.label" default="Deadflg" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: account, field: 'deadflg', 'errors')}">
                                    <g:checkBox name="deadflg" value="${account?.deadflg}" />
                                </td>
                            </tr>

					<tr class="prop">
						<td valign="top" class="name"><label for="authorities">Roles:</label></td>
						<td valign="top" class="value ${hasErrors(bean:account,field:'authorities','errors')}">
							<ul>
							<g:each var="entry" in="${roleMap}">
								<li>${entry.key.authority.encodeAsHTML()}
									<g:checkBox name="${entry.key.authority}" value="${entry.value}"/>
								</li>
							</g:each>
							</ul>
						</td>
					</tr>

				</tbody>
				</table>
			</div>

			<div class="buttons">
				<span class="button"><g:actionSubmit class="save" value="Update" /></span>
				<span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
			</div>

		</g:form>

	</div>
</body>
