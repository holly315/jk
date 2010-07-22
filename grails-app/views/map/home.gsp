<%@ page import="jk.Map" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" />
        <g:set var="entityName" value="${message(code: 'map.label', default: 'Map')}" />
        <title>${accountInstance.name}の巣</title>
    </head>
	<body>
        <div class="body">
			<h1>${accountInstance.name}の巣</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${accountInstance}">
            <div class="errors">
                <g:renderErrors bean="${accountInstance}" as="index" />
            </div>
            </g:hasErrors>
			
			ログアウト<br>
			
			<g:link action="map" id="${accountInstance.id}"><font size="+1">外へ出る</font></g:link>
			
			<img src="/jk/images/${accountInstance.animal.img}" alt="animal" height="240" width="240" border="0" />

			
			
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
				<img src="/jk/images/esa.jpg" alt="animal" height="40" width="60" border="0" />
				</g:repeat>
			</p>
			
			<div  align="right">
			<br>ログ<br>
			<font face="平成角ゴシック, ＭＳ ゴシック, monospace" size="-1" color="#999999">${accountInstance.log}</font>
			</div>
			
        </div>
    </body>
</html>
