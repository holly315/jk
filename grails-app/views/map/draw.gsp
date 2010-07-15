<%@ page import="jk.Map" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'map.label', default: 'Map')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
	<%
	if(params.int('hande') >= 0){
										accountInstance.hp = accountInstance.hp + params.int('hande')
									}else{
										accountInstance2.hp = accountInstance2.hp- params.int('hande')		
										}
	%>
	<g:form action="heal" controller="map" method="post">
	<h1>（自分）${accountInstance.name}(${accountInstance.animal.name})対（相手）${accountInstance2.name}(${accountInstance2.animal.name})</h1>
	<h1>（自分）${accountInstance.hp}対（相手）${accountInstance2.hp}</h1>
	<h1>引き分けました,お互い肉を失います</h1>
	
	<g:hiddenField name="myId" value="${accountInstance.id}"/>
	<g:hiddenField name="enemyId" value="${accountInstance2.id}"/>
	<g:hiddenField name="hande" value="${params.hande}" />

<span class="button"><g:submitButton name="home" value="${message(code: 'default.button.home.label', default: 'Create')}" /></span>
</g:form>
    </body>
</html>
