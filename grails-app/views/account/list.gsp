<head>
	<meta name="layout" content="main" />
	<title>Account List</title>
</head>

<body>

	<div class="nav">
		<span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
		<span class="menuButton"><g:link class="create" action="create">New Account</g:link></span>
	</div>

	<div class="body">
		<h1>Account List</h1>
		<g:if test="${flash.message}">
		<div class="message">${flash.message}</div>
		</g:if>
		<div class="list">
			<table>
			<thead>
				<tr>
					<g:sortableColumn property="id" title="${message(code: 'account.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="name" title="${message(code: 'account.name.label', default: 'Name')}" />
                        
                            <g:sortableColumn property="email" title="${message(code: 'account.email.label', default: 'Email')}" />
                        
                            <g:sortableColumn property="esa" title="${message(code: 'account.esa.label', default: 'Esa')}" />
                        
                            <g:sortableColumn property="hp" title="${message(code: 'account.hp.label', default: 'Hp')}" />
                            
                            <g:sortableColumn property="animal" title="${message(code: 'account.animal.label', default: 'AnimalID')}" />
					<th>&nbsp;</th>
				</tr>
			</thead>
			<tbody>
			<g:each in="${accountList}" status="i" var="account">
				<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
					<td><g:link action="show" id="${account.id}">${fieldValue(bean: account, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: account, field: "name")}</td>
                        
                            <td>${fieldValue(bean: account, field: "email")}</td>
                        
                            <td>${fieldValue(bean: account, field: "esa")}</td>
                        
                            <td>${fieldValue(bean: account, field: "hp")}</td>
                            
                            <td><g:link controller="animal" action="show" id="${account?.animal?.id}">${fieldValue(bean: account, field: "animal")}</g:link></td>
					<td class="actionButtons">
						<span class="actionButton">
							<g:link action="show" id="${account.id}">Show</g:link>
						</span>
					</td>
				</tr>
			</g:each>
			</tbody>
			</table>
		</div>

		<div class="paginateButtons">
			<g:paginate total="${jk.Account.count()}" />
		</div>

	</div>
</body>
