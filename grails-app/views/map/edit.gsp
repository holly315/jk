

<%@ page import="jk.Map" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'map.label', default: 'Map')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="../manager/manage.gsp">back</a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${mapInstance}">
            <div class="errors">
                <g:renderErrors bean="${mapInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${mapInstance?.id}" />
                <g:hiddenField name="version" value="${mapInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="x"><g:message code="map.x.label" default="X" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: mapInstance, field: 'x', 'errors')}">
                                    <g:select name="x" from="${1..5}" value="${fieldValue(bean: mapInstance, field: 'x')}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="y"><g:message code="map.y.label" default="Y" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: mapInstance, field: 'y', 'errors')}">
                                    <g:select name="y" from="${1..5}" value="${fieldValue(bean: mapInstance, field: 'y')}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="object"><g:message code="map.object.label" default="Object" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: mapInstance, field: 'object', 'errors')}">
                                    <g:textField name="object" value="${mapInstance?.object}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="objectId"><g:message code="map.objectId.label" default="Object Id" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: mapInstance, field: 'objectId', 'errors')}">
                                    <g:textField name="objectId" value="${fieldValue(bean: mapInstance, field: 'objectId')}" />
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
