<%@ page import="jk.Map" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="">
        <g:set var="entityName" value="${message(code: 'map.label', default: 'Map')}" />
        <title>ランキング</title>
	</head>
	<body>
	<h1>${title}</h1>
	<g:link controller="login">戻る</g:link>
			<table>
				<td>
					<g:form action="ranking">
						<g:submitButton name="dflg" value="生存者勝利数" />
					</g:form>
				</td>
				<td>
					<g:form action="ranking">
						<g:submitButton name="dflg" value="生存者勝率" />
					</g:form>
				</td>
				<td>
					<g:form action="ranking">
						<g:submitButton name="dflg" value="歴代勝利数" />
					</g:form>
				</td>
				<td>
					<g:form action="ranking">
						<g:submitButton name="dflg" value="歴代勝率" />
					</g:form>
				</td>
			</table>
        <div class="body">
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table border="1">
                    <thead bgcolor="orange">
                        <tr>
                            <td>名前</td>
                            <td>動物種</td>
                            <td>勝利数</td>
                            <td>敗戦数</td>
                            <td>勝率</td>                        
                        </tr>
                    </thead>
					<tbody>
					<g:each in="${allInstance}" status="i" var="accountInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                            <td>${fieldValue(bean: accountInstance, field: "name")}</td>
                            <td>${fieldValue(bean: accountInstance, field: "animal.name")}</td>
                            <td>${fieldValue(bean: accountInstance, field: "won")}</td>
                            <td>${fieldValue(bean: accountInstance, field: "lost")}</td>
                            <td>${accountInstance.won / ((accountInstance.won + accountInstance.lost)?(accountInstance.won + accountInstance.lost):(1))}</td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
			</div>
			<div class="paginateButtons">
                <g:paginate total="${num}" />
            </div>
        </div>
    </body>
</html>
