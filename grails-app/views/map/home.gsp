<%@ page import="jk.Map" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<meta name="layout" />
        <g:set var="entityName" value="${message(code: 'map.label', default: 'Map')}" />
        <title>${accountInstance.name}の巣</title>
    </head>
	<body leftmargin="0" topmargin="0">
		<img src="/jk/images/su.jpg" width="100%" height="100%" style="position:absolute; top:0px; left:0px; z-index:1">
		<div style="position:absolute; top:10px; left:10px; z-index:2; width:100%">
	<body bgcolor="saddlebrown">
	<table bgcolor="saddlebrown" border="2">
		<td>
		<div class="body">
			<h2>${accountInstance.name}の巣</h2>
			<g:if test="${flash.message}">
			<div class="message">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${accountInstance}">
			<div class="errors">
				<g:renderErrors bean="${accountInstance}" as="index" />
			</div>
			</g:hasErrors>
			通算 ${accountInstance.won}勝${accountInstance.lost}敗
			<br>
			<g:link action="map" id="${accountInstance.id}"><font size="+1">外へ出る</font></g:link>
			<br>
			<g:link controller="logout">ログアウト</g:link>
			<br>
			</td>
			<td>
			<img src="/jk/images/${accountInstance.animal.img}" alt="animal" height="240" width="240" border="3" />
			</td>
			</table>
			
				<span style="background-color:#f8f8f8; width:500px; text-align:left; float:left; border: 2px solid #808000">
				<font size="+1">体力　${accountInstance.hp} ％</font>
				<br>
				<g:if test="${accountInstance.hp >= 50}">
				<hr align="left" size="10" width="${accountInstance.hp * 5}" color="#37c832">
				</g:if>
				<g:if test="${accountInstance.hp < 50 && accountInstance.hp >= 20}">
				<hr align="left" size="10" width="${accountInstance.hp * 5}" color="#dddd00">
				</g:if>
				<g:if test="${accountInstance.hp < 20}">
				<hr align="left" size="10" width="${accountInstance.hp * 5}" color="#ff0000">
				</g:if>
				　えさ　<br>
					<g:repeat times="${accountInstance.esa}">
						<img src="/jk/images/esa.jpg" alt="animal" height="40" width="60" border="2" />
					</g:repeat>
				
				</span>
			
			<span style="font-weight:bold; color:#777777;background-color:#111111; width:550px; text-align:left; float:right; border: 2px solid #808000">
				${accountInstance.log}
			</span>
			
        </div>
    </body>
</html>
