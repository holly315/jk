<%@ page import="jk.Map" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="">
        <g:set var="entityName" value="${message(code: 'map.label', default: 'Map')}" />
        <title>ランキング</title>
	</head>
	<body leftmargin="0" topmargin="0">
		<img src="/jk/images/ranking.jpg" width="100%" height="100%" style="position:fixed; top:0px; left:0px; z-index:1">
		<div style="position:absolute; top:10px; left:10px; z-index:2; width:90%">
			<span style="background-color:#f8f8f8; font-size:24px; text-align:left; float:left; border: 2px solid #808000">
			${title}
			</span>
			<br><br>
			<form method="post" action="../">
			<g:submitButton name="ret" value="　戻る　" />
			</form>
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
                <table border="1" bgcolor="white">
                    <thead bgcolor="orange">
                        <tr>
                            <td>順位</td>
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
            <g:if test="${i < 3}">
                  <td><font size="5">${i+1}</font></td>
            </g:if>
            <g:if test="${i >= 3}">
                  <td>${i+1}</td>
            </g:if>
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
        </div>
    </body>
</html>
