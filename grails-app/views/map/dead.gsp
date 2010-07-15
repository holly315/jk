<%@ page import="jk.Map" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'map.label', default: 'Map')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
		<g:form action="index" controller="account" method="post" >
			<h1>（自分）${accountInstance.hp}対（相手）${accountInstance2.hp}</h1>
			<h1>あなたは力つきました</h1>
			
 <span class="button"><g:submitButton name="create" value="${message(code: 'default.button.dead.label', default: 'Create')}" /></span>
		</g:form>
    </body>
</html>
