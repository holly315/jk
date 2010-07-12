
<%@ page import="jk.Battle" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'battle.label', default: 'Battle')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'battle.id.label', default: 'Id')}" />
                        
                            <th><g:message code="battle.animal.label" default="Animal" /></th>
                        
                            <g:sortableColumn property="revise" title="${message(code: 'battle.revise.label', default: 'Revise')}" />
                        
                            <g:sortableColumn property="toId" title="${message(code: 'battle.toId.label', default: 'To Id')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${battleInstanceList}" status="i" var="battleInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${battleInstance.id}">${fieldValue(bean: battleInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: battleInstance, field: "animal")}</td>
                        
                            <td>${fieldValue(bean: battleInstance, field: "revise")}</td>
                        
                            <td>${fieldValue(bean: battleInstance, field: "toId")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${battleInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
