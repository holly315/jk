<%@ page import="jk.Map" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'map.label', default: 'Map')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
		<style type="text/css" media="screen">
		input, select, textarea {
		background-color:#FCFCFC;
		border:1px solid #CCCCCC;
		font:200px verdana,arial,helvetica,sans-serif;
		margin:2px 0;
		padding:2px 4px;
		}
		</style>
    </head>
    <body>
    <g:form action="kekka" method="post" >

	<%
		String animal1 = accountInstance.animal.name
		String animal2 = accountInstance2.animal.name
		int hande = 0
			
			switch(animal1){
				case("鹿"):
					switch(animal2){
						case("熊"):	
							hande +=5
							break
						case("虎"):	
							hande -=5
							break
						default:
						 	break
					}
					break
				case("兎"):
					switch(animal2){
						case("虎"):	
							hande +=5
							break
						case("熊"):
							hande +=10
							break
						case("猫"):
							hande -=25
							break
						default:
						 	break
					}
					break
				case("虎"):
					switch(animal2){
						case("鹿"):	
							hande +=5
							break
						case("兎"):	
							hande -=5
							break
						case("熊"):
							hande -=5
							break
						case("猫"):
							hande +=10
							break
						default:
							break
					}
					break	
				case("熊"):
					switch(animal2){
						case("鹿"):	
							hande -=5
							break
						case("兎"):	
							hande -=10
							break
						case("虎"):	
							hande +=5
							break
						case("猫"):
							hande +=10
							break
						default:
						 	break
					}
					break
				case("猫"):
					switch(animal2){
						case("兎"):	
							hande +=25
							break
						case("虎"):	
							hande -=10
							break
						case("熊"):
							hande -=10
							break
						default:
						 	break
					}
					break
			}
	%>
	<g:hiddenField name="myId" value="${accountInstance.id}"/>
	<g:hiddenField name="enemyId" value="${accountInstance2.id}"/>
	<g:hiddenField name="hande" value="${hande}" />
	


<h1 style="font-size:150;color:black;">${accountInstance2.name}(${accountInstance2.animal.name})と遭遇しました</h1>
 <span class="button"><g:submitButton name="create" value="${message(code: 'default.button.battle.label', default: 'Create')}" /></span>
</g:form>
    </body>
</html>
