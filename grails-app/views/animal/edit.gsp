

<%@ page import="jk.Animal" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'animal.label', default: 'Animal')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${animalInstance}">
            <div class="errors">
                <g:renderErrors bean="${animalInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${animalInstance?.id}" />
                <g:hiddenField name="version" value="${animalInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="account"><g:message code="animal.account.label" default="Account" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: animalInstance, field: 'account', 'errors')}">
                                    
<ul>
<g:each in="${animalInstance?.account?}" var="a">
    <li><g:link controller="account" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="account" action="create" params="['animal.id': animalInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'account.label', default: 'Account')])}</g:link>

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="battle"><g:message code="animal.battle.label" default="Battle" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: animalInstance, field: 'battle', 'errors')}">
                                    
<ul>
<g:each in="${animalInstance?.battle?}" var="b">
    <li><g:link controller="battle" action="show" id="${b.id}">${b?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="battle" action="create" params="['animal.id': animalInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'battle.label', default: 'Battle')])}</g:link>

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="img"><g:message code="animal.img.label" default="Img" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: animalInstance, field: 'img', 'errors')}">
                                    <g:textField name="img" value="${animalInstance?.img}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="name"><g:message code="animal.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: animalInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${animalInstance?.name}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
