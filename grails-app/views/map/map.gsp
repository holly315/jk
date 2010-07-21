<%@ page import="jk.Map" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" />
        <g:set var="entityName" value="${message(code: 'map.label', default: 'Map')}" />
        <title>フィールド</title>
    </head>
	<body>
        <div class="body">
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${accountInstance}">
            <div class="errors">
                <g:renderErrors bean="${accountInstance}" as="index" />
            </div>
            </g:hasErrors>
            <g:hasErrors bean="${mapInstance}">
            <div class="errors">
                <g:renderErrors bean="${mapInstance}" as="index" />
            </div>
            </g:hasErrors>
			
			
			<!--
			<br><br>
			デバッグ用　現在地<br>
			x = ${mapInstance.x}<br>
			y = ${mapInstance.y}<br>
			-->
			<img src="/jk/images/jk/chikeizu.png" align="right" alt="animal" height="200" width="200" border="0" />
			
			現在エリア　${mypos}<br>
			えさエリア　${esapos}<br>
			
			
			<g:link action="home" id="${accountInstance.id}"><font size="+1">巣へ戻る</font></g:link><br>
			<table>
			<td>
			<g:form action="move">
			<g:hiddenField name="id" value="${accountInstance.id}" />
			<g:hiddenField name="log" value="北" />
			<g:hiddenField name="x" value="0" />
			<g:hiddenField name="y" value="3" />
			<g:submitButton name="北" value="北" />
			</g:form>
			</td>
			<td>
			
			<g:form action="move">
			<g:hiddenField name="id" value="${accountInstance.id}" />
			<g:hiddenField name="log" value="南" />
			<g:hiddenField name="x" value="0" />
			<g:hiddenField name="y" value="1" />
			<g:submitButton name="南" value="南" />
			</g:form>
			</td>
			<td>
			
			<g:form action="move">
			<g:hiddenField name="id" value="${accountInstance.id}" />
			<g:hiddenField name="log" value="東" />
			<g:hiddenField name="x" value="1" />
			<g:hiddenField name="y" value="0" />
			<g:submitButton name="東" value="東" />
			</g:form>
			</td>
			<td>
			
			<g:form action="move">
			<g:hiddenField name="id" value="${accountInstance.id}" />
			<g:hiddenField name="log" value="西" />
			<g:hiddenField name="x" value="3" />
			<g:hiddenField name="y" value="0" />
			<g:submitButton name="西" value="西" />
			</g:form>
			</td>
			</table>
			<g:link action="eat" id="${accountInstance.id}"><font size="+1">餌を食べる</font></g:link>
			
			<img src="/jk/images/jk/${accountInstance.animal.img}" alt="animal" height="240" width="240" border="0" />
			
			<p>体力　${accountInstance.hp} ％</p>
			<g:if test="${accountInstance.hp >= 50}">
			<hr align="left" size="10" width="${accountInstance.hp * 5}" color="#37c832">
			</g:if>
			<g:if test="${accountInstance.hp < 50 && accountInstance.hp >= 20}">
			<hr align="left" size="10" width="${accountInstance.hp * 5}" color="#ffff00">
			</g:if>
			<g:if test="${accountInstance.hp < 20}">
			<hr align="left" size="10" width="${accountInstance.hp * 5}" color="#ff0000">
			</g:if>
			<p>えさ　
				<g:repeat times="${accountInstance.esa}">
				<img src="/jk/images/jk/esa.jpg" alt="animal" height="40" width="60" border="0" />
				</g:repeat>
			</p>
			
			<div  align="right">
			<br>ログ<br>
			<font face="monospace" size="-1" color="#999999">${accountInstance.log}</font>
			</div>
			
			
        </div>
    </body>
</html>
