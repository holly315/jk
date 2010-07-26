<%@ page import="jk.Map" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" />
		<g:set var="entityName" value="${message(code: 'map.label', default: 'Map')}" />
		<style type="text/css">
		</style>
        <title>フィールド</title>
	</head>
	<body leftmargin="0" topmargin="0">
		<g:if test="${mypos == '山岳'}">
			<img src="/jk/images/sangaku.jpg" width="100%" height="100%" style="position:absolute; top:0px; left:0px; z-index:1">
			<div style="position:absolute; top:10px; left:10px; z-index:2; width:100%">
		</g:if>
		<g:if test="${mypos == '森林'}">
			<img src="/jk/images/mori.jpg" width="100%" height="100%" style="position:absolute; top:0px; left:0px; z-index:1">
			<div style="position:absolute; top:10px; left:10px; z-index:2; width:100%">
		</g:if>
		<g:if test="${mypos == '草原'}">
			<img src="/jk/images/sougen.png" width="100%" height="100%" style="position:absolute; top:0px; left:0px; z-index:1">
			<div style="position:absolute; top:10px; left:10px; z-index:2; width:100%">
		</g:if>
		<g:if test="${mypos == '川原'}">
			<img src="/jk/images/kawa.jpg" width="100%" height="100%" style="position:absolute; top:0px; left:0px; z-index:1">
			<div style="position:absolute; top:10px; left:10px; z-index:2; width:100%">
		</g:if>
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
				<table align="right" border="2" bordercolor="#400000" bgcolor="#800000" >
					<tr>
						<td><img src="/jk/images/sangaku.jpg" align="right" alt="animal" height="50" width="50" border="0" /></td>
						<td><img src="/jk/images/sangaku.jpg" align="right" alt="animal" height="50" width="50" border="0" /></td>
						<td><img src="/jk/images/sougen.png" align="right" alt="animal" height="50" width="50" border="0" /></td>
						<td><img src="/jk/images/sougen.png" align="right" alt="animal" height="50" width="50" border="0" /></td>
					</tr>
					<tr>
						<td><img src="/jk/images/sangaku.jpg" align="right" alt="animal" height="50" width="50" border="0" /></td>
						<td><img src="/jk/images/sangaku.jpg" align="right" alt="animal" height="50" width="50" border="0" /></td>
						<td><img src="/jk/images/sougen.png" align="right" alt="animal" height="50" width="50" border="0" /></td>
						<td><img src="/jk/images/sougen.png" align="right" alt="animal" height="50" width="50" border="0" /></td>
					</tr>
					<tr>
						<td><img src="/jk/images/mori.jpg" align="right" alt="animal" height="50" width="50" border="0" /></td>
						<td><img src="/jk/images/mori.jpg" align="right" alt="animal" height="50" width="50" border="0" /></td>
						<td><img src="/jk/images/kawa.jpg" align="right" alt="animal" height="50" width="50" border="0" /></td>
						<td><img src="/jk/images/kawa.jpg" align="right" alt="animal" height="50" width="50" border="0" /></td>
					</tr>
					<tr>
						<td><img src="/jk/images/mori.jpg" align="right" alt="animal" height="50" width="50" border="0" /></td>
						<td><img src="/jk/images/mori.jpg" align="right" alt="animal" height="50" width="50" border="0" /></td>
						<td><img src="/jk/images/kawa.jpg" align="right" alt="animal" height="50" width="50" border="0" /></td>
						<td><img src="/jk/images/kawa.jpg" align="right" alt="animal" height="50" width="50" border="0" /></td>
					</tr>
				</table>
		<g:if test="${mypos == '山岳'}">
			<table bgcolor="sandybrown" border="2">
		</g:if>
		<g:if test="${mypos == '森林'}">
			<table bgcolor="olivedrab" border="2">
		</g:if>
		<g:if test="${mypos == '草原'}">
			<table bgcolor="limegreen" border="2">
		</g:if>
		<g:if test="${mypos == '川原'}">
			<table bgcolor="lightskyblue" border="2">
		</g:if>
					<td>
						現在エリア　${mypos}<br>
						えさエリア　${esapos}<br>
						
						
						<g:link action="home" id="${accountInstance.id}"><font size="+1">巣へ戻る</font></g:link><br>
						
						<table>
							<tr>
								<td></td>
								<td>
									<g:form action="move">
									<g:hiddenField name="id" value="${accountInstance.id}" />
									<g:hiddenField name="log" value="北" />
									<g:hiddenField name="x" value="0" />
									<g:hiddenField name="y" value="3" />
									<g:submitButton name="北" value="北" />
									</g:form>
								</td>
								<td></td>
							</tr>
							<tr>
								<td>
									<g:form action="move">
									<g:hiddenField name="id" value="${accountInstance.id}" />
									<g:hiddenField name="log" value="西" />
									<g:hiddenField name="x" value="3" />
									<g:hiddenField name="y" value="0" />
									<g:submitButton name="西" value="西" />
									</g:form>
								</td>
								<td></td>
								<td>
								<g:form action="move">
								<g:hiddenField name="id" value="${accountInstance.id}" />
								<g:hiddenField name="log" value="東" />
								<g:hiddenField name="x" value="1" />
								<g:hiddenField name="y" value="0" />
								<g:submitButton name="東" value="東" />
								</g:form>
								</td>
							</tr><tr>
								<td></td>
								<td>
									<g:form action="move">
									<g:hiddenField name="id" value="${accountInstance.id}" />	
									<g:hiddenField name="log" value="南" />
									<g:hiddenField name="x" value="0" />
									<g:hiddenField name="y" value="1" />
									<g:submitButton name="南" value="南" />
									</g:form>
								</td>
								<td></td>
							</tr>
						</table>
					<g:link action="eat" id="${accountInstance.id}"><font size="+1">餌を食べる</font></g:link>
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
		</div>
    </body>
</html>
