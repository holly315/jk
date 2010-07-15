
<%@ page import="jk.Account" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'account.label', default: 'Account')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
<g:form action="encount" controller="map" method="post" >
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
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
                        
                            <g:sortableColumn property="pass" title="${message(code: 'account.pass.label', default: 'Pass')}" />
                        
                            <g:sortableColumn property="esa" title="${message(code: 'account.esa.label', default: 'Esa')}" />
                        
                            <g:sortableColumn property="hp" title="${message(code: 'account.hp.label', default: 'Hp')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${accountInstanceList}" status="i" var="accountInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${accountInstance.id}">${fieldValue(bean: accountInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: accountInstance, field: "name")}</td>
                        
                            <td>${fieldValue(bean: accountInstance, field: "email")}</td>
                        
                            <td>${fieldValue(bean: accountInstance, field: "pass")}</td>
                        
                            <td>${fieldValue(bean: accountInstance, field: "esa")}</td>
                        
                            <td>${fieldValue(bean: accountInstance, field: "hp")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
		<g:hiddenField name="myId" value="1"/>
		<g:hiddenField name="enemyId" value="2"/>
 <span class="button"><g:submitButton name="create" value="${message(code: 'default.button.battle.label', default: 'Encount')}" /></span>
</g:form>
            <div class="paginateButtons">
                <g:paginate total="${accountInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
