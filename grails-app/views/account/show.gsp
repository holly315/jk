
<%@ page import="jk.Account" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'account.label', default: 'Account')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="account.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: accountInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="account.name.label" default="Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: accountInstance, field: "name")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="account.email.label" default="Email" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: accountInstance, field: "email")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="account.pass.label" default="Pass" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: accountInstance, field: "pass")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="account.esa.label" default="Esa" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: accountInstance, field: "esa")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="account.hp.label" default="Hp" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: accountInstance, field: "hp")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="account.won.label" default="Won" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: accountInstance, field: "won")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="account.lost.label" default="Lost" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: accountInstance, field: "lost")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="account.animal.label" default="Animal" /></td>
                            
                            <td valign="top" class="value"><g:link controller="animal" action="show" id="${accountInstance?.animal?.id}">${accountInstance?.animal?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="account.deadflg.label" default="Deadflg" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${accountInstance?.deadflg}" /></td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${accountInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
