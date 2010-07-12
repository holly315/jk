

<%@ page import="jk.Battle" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'battle.label', default: 'Battle')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${battleInstance}">
            <div class="errors">
                <g:renderErrors bean="${battleInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="animal"><g:message code="battle.animal.label" default="Animal" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: battleInstance, field: 'animal', 'errors')}">
                                    <g:select name="animal.id" from="${jk.Animal.list()}" optionKey="id" value="${battleInstance?.animal?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="revise"><g:message code="battle.revise.label" default="Revise" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: battleInstance, field: 'revise', 'errors')}">
                                    <g:textField name="revise" value="${fieldValue(bean: battleInstance, field: 'revise')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="toId"><g:message code="battle.toId.label" default="To Id" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: battleInstance, field: 'toId', 'errors')}">
                                    <g:textField name="toId" value="${fieldValue(bean: battleInstance, field: 'toId')}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
