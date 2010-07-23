<html>
    <head>
        <title>Welcome to Grails</title>
        <meta name="layout" content="top" />
        <style type="text/css" media="screen">
        #superpanel{
        	margin-left:30px;
        }
        
        h2 {
            margin-top:15px;
            margin-bottom:15px;
            font-size:15pt;
        }
        #pageBody {
            margin-left:400px;
            margin-right:20px;
        }
        #pageBody .biginnerlist {font-size: 10pt}
        
        </style>
    </head>
    
    <body>
    <div id="superpanel">
        <div id="pageBody">
            <div id="controllerList" class="dialog">
                
                <h2>管理者用メニュー:</h2>
                <ul>
                    <g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
                        <li class="controller"><g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link></li>
                    </g:each>
                </ul>
            </div>
        </div>
    </div>
    </body>
</html>
