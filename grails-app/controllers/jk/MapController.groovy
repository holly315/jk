package jk

class MapController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	
    def home = {
        def accountInstance = Account.get(params.id)
        if (!accountInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'account.label', default: 'Account'), params.id])}"
            redirect(action: "index")
        }
        else { 
            // 現在地を[0,0]にする
            def mapInstance = Map.findByObjectId(params.id)
            mapInstance.x = 0
            mapInstance.y = 0
            mapInstance.save(flush: true)
            
            //古いログの削除
            def rows = accountInstance.log.count("<br>")
            def index = 0
            if(rows > 5) {
                for(def i = 5; i < rows; i++){
                    index = accountInstance.log.indexOf("<br>",++index)
                }
                index += 4
            }
			if(accountInstance.log) {
	            accountInstance.log = accountInstance.log.getAt(index..-1)
			}
            [accountInstance: accountInstance]
        }
    }
    
    def map = {
        def accountInstance = Account.get(params.id)
        if (!accountInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'account.label', default: 'Account'), params.id])}"
            redirect(action: "index")
        }
        else {
            //古いログの削除
            def rows = accountInstance.log.count("<br>")
            def index = 0
            if(rows > 5) {
                for(def i = 5; i < rows; i++){
                    index = accountInstance.log.indexOf("<br>",++index)
                }
                index += 4
            }
			if(accountInstance.log) {
	            accountInstance.log = accountInstance.log.getAt(index..-1)
			}
            //餌がなくなっていた場合に餌を追加
            def mapInstance = Map.findByObject("esa")
            if (!mapInstance) {
                mapInstance = new Map()
                mapInstance.x = Math.floor(Math.random()*4).toInteger() + 1
                mapInstance.y = Math.floor(Math.random()*4).toInteger() + 1
                mapInstance.object = "esa"
                mapInstance.objectId = 0
                mapInstance.save(flush: true)

            }

            
            def esapos
            if(mapInstance.x < 3) {
                if(mapInstance.y < 3) {
                    esapos = "山"
                } else {
                    esapos = "川"
                }
            } else {
                if(mapInstance.y < 3) {
                    esapos = "森"
                } else {
                    esapos = "草原"
                }
            }
            

            //プレイヤーの現在地を取得する
            def mapInstance2 = Map.findByObjectId(params.id)
            if (!mapInstance2) {
                flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'account.label', default: 'Map'), params.id])}"
                redirect(action: "home")
            }
            //巣から出てきたとき
            if(mapInstance2.x==0 || mapInstance2.y==0) {
                mapInstance2.x = Math.floor(Math.random()*4).toInteger() + 1
                mapInstance2.y = Math.floor(Math.random()*4).toInteger() + 1
                accountInstance.hp -= 5
            }

            def mypos
            if(mapInstance2.x < 3) {
                if(mapInstance2.y < 3) {
                    mypos = "山"
                } else {
                    mypos = "川"
                }
            } else {
                if(mapInstance2.y < 3) {
                    mypos = "森"
                } else {
                    mypos = "草原"
                }
            }
            accountInstance.save(flush: true)
            mapInstance.save(flush: true)
            mapInstance2.save(flush: true)

            [accountInstance:accountInstance, mapInstance:mapInstance2, mypos:mypos, esapos:esapos]
        }
    }
    def move = {
        def accountInstance = Account.get(params.id)
        if (!accountInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'account.label', default: 'Map'), params.id])}"
            redirect(action: "home")
        }

        def mapInstance = Map.findByObjectId(params.id)
        if (!mapInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'account.label', default: 'Map'), params.id])}"
            redirect(action: "home")
        }


        def date = new Date().toString()
        
        mapInstance.x = (mapInstance.x - 1 + params.x.toInteger()) % 4 + 1
        mapInstance.y = (mapInstance.y - 1 + params.y.toInteger()) % 4 + 1
        
        def mapInstance2 = Map.find("from Map as a where a.x='${mapInstance.x}' and a.y='${mapInstance.y}'")
        if (mapInstance2) {
            mapInstance.save(flush: true)
            if(mapInstance2.object == "Account" && mapInstance2.x != 0 && mapInstance2.y != 0) {
                accountInstance.save(flush: true)
				redirect(action:"encount",params:[myId:mapInstance.objectId, enemyId:mapInstance2.objectId])
            } else if (mapInstance2.object == "esa") {
                accountInstance.esa = (accountInstance.esa == 3)?(3):(accountInstance.esa + 1)
                accountInstance.log += date + "|えさを発見しました！<br>"
                mapInstance2.delete()
                accountInstance.save(flush: true)
                redirect(action: "map", id: params.id)
            }
        } else {
            accountInstance.hp -= 2
            accountInstance.log += date + "|" + params.log + "へ移動しました。<br>"
            
            if(0 == Math.floor(Math.random()*20).toInteger()) {
                accountInstance.hp -= 25
                accountInstance.log += date + "|罠にかかった！<br>"
            }
            accountInstance.hp = (accountInstance.hp < 0)?(0):(accountInstance.hp)

            mapInstance.save(flush: true)
            accountInstance.save(flush: true)
            redirect(action: "map", id: params.id)
        }
    }

    def eat = {
        def accountInstance = Account.get(params.id)
        if (!accountInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'account.label', default: 'Map'), params.id])}"
            redirect(action: "home")
        }
        def date = new Date().toString()
        if(accountInstance.esa >= 1) {
            accountInstance.esa -= 1
            accountInstance.hp = 100
            accountInstance.log += date + "|えさを使いました<br>"
        } else {
            accountInstance.log += date + "|えさが足りない！<br>"
        }
        accountInstance.save(flush: true)
        redirect(action: "map", id: params.id)
    }

	def kekka = {
			def date = new Date().toString()
			def accountInstance = Account.get(params.myId)
			def accountInstance2 = Account.get(params.enemyId)
			int hako
			if (!accountInstance && accountInstance2) {
							flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'map.label', default: 'Map'), params.id])}"
					            redirect(action: "list")
					        }
						else {
						[accountInstance: accountInstance,accountInstance2:accountInstance2]
					        }

							hako = accountInstance.hp + params.int('hande')
								if(hako == accountInstance2.hp){
									accountInstance.lost++
									accountInstance2.lost++
									accountInstance.log += date + "|${accountInstance2.name}と引き分けました<br>"
									accountInstance2.log += date + "|${accountInstance.name}と引き分けました<br>"
										if(accountInstance.esa != 0){
											accountInstance.esa--
											}else{
											accountInstance.deadflg = true
											}
											if(accountInstance2.esa != 0){
												accountInstance2.esa--
												}else{
												accountInstance2.deadflg = true
												}
									
								}else if(hako > accountInstance2.hp){
									accountInstance.won++
									accountInstance2.lost++
									accountInstance.log += date + "|${accountInstance2.name}との戦闘に勝利しました<br>"
									accountInstance2.log += date + "|${accountInstance.name}との戦闘に敗北しました<br>"
										if(accountInstance.esa !=3){
											accountInstance.esa++
										}
										if(accountInstance2.esa != 0){
											accountInstance2.esa--
											}else{
											accountInstance2.deadflg = true
											}
								}else if(hako < accountInstance2.hp){
									accountInstance2.won++
									accountInstance.lost++
									accountInstance.log += date + "|${accountInstance2.name}との戦闘に敗北しました<br>"
									accountInstance2.log += date + "|${accountInstance.name}との戦闘に勝利しました<br>"
										if(accountInstance2.esa != 3){
											accountInstance2.esa++
										}
										if(accountInstance.esa != 0){
											accountInstance.esa--
											}else{
											accountInstance.deadflg = true
											}
								}
								
						
							
							if(accountInstance.deadflg){
									render(view: "dead", params: params , model:[accountInstance: accountInstance,accountInstance2:accountInstance2])
								}else if(hako == accountInstance2.hp){
									render(view: "draw", params: params , model:[accountInstance: accountInstance,accountInstance2:accountInstance2])
								}else if(hako > accountInstance2.hp){
									render(view: "win", params: params , model:[accountInstance: accountInstance,accountInstance2:accountInstance2])
								}else {
									render(view: "lose", params: params , model:[accountInstance: accountInstance,accountInstance2:accountInstance2])
								}
	}
	
	def encount = {
		    def accountInstance = Account.get(params.myId)
			def accountInstance2 = Account.get(params.enemyId)
//			render("${params.myId}")
//			render("${params.enemyId}")
			
	        if (!(accountInstance && accountInstance2) ) {
	            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'map.label', default: 'Map'), params.id])}"
	            redirect(action: "list")
	        }
	        else {
	            [accountInstance: accountInstance,accountInstance2:accountInstance2]
	        }
			}
			
	def heal = {
			int hantei1
			int hantei2
			def accountInstance = Account.get(params.myId)
			def accountInstance2 = Account.get(params.enemyId)
			if (!accountInstance && accountInstance2) {
				            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'map.label', default: 'Map'), params.id])}"
				            redirect(action: "list")
				        }
				        else {
				            [accountInstance: accountInstance,accountInstance2:accountInstance2]
				        }

			if(params.int('hande') >= 0){
					hantei1 = accountInstance.hp + params.int('hande')
					hantei2 = accountInstance2.hp
			}else{
					hantei2 = accountInstance2.hp - params.int('hande')
					hantei1 = accountInstance.hp	
			}	
			
			if(hantei1 == hantei2){
				accountInstance.hp = 100
				accountInstance2.hp = 100
			}else if(hantei1 > hantei2){
				accountInstance2.hp = 100
			}else if(hantei1 < hantei2){
				accountInstance.hp = 100
			}

	redirect(action: "home" ,params: params)	
	}
	
    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [mapInstanceList: Map.list(params), mapInstanceTotal: Map.count()]
    }

    def create = {
        def mapInstance = new Map()
        mapInstance.properties = params
        return [mapInstance: mapInstance]
    }

    def save = {
        def mapInstance = new Map(params)
        if (mapInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'map.label', default: 'Map'), mapInstance.id])}"
            redirect(action: "show", id: mapInstance.id)
        }
        else {
            render(view: "create", model: [mapInstance: mapInstance])
        }
    }

    def show = {
        def mapInstance = Map.get(params.id)
        if (!mapInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'map.label', default: 'Map'), params.id])}"
            redirect(action: "list")
        }
        else {
            [mapInstance: mapInstance]
        }
    }

    def edit = {
        def mapInstance = Map.get(params.id)
        if (!mapInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'map.label', default: 'Map'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [mapInstance: mapInstance]
        }
    }

    def update = {
        def mapInstance = Map.get(params.id)
        if (mapInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (mapInstance.version > version) {
                    
                    mapInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'map.label', default: 'Map')] as Object[], "Another user has updated this Map while you were editing")
                    render(view: "edit", model: [mapInstance: mapInstance])
                    return
                }
            }
            mapInstance.properties = params
            if (!mapInstance.hasErrors() && mapInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'map.label', default: 'Map'), mapInstance.id])}"
                redirect(action: "show", id: mapInstance.id)
            }
            else {
                render(view: "edit", model: [mapInstance: mapInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'map.label', default: 'Map'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def mapInstance = Map.get(params.id)
        if (mapInstance) {
            try {
                mapInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'map.label', default: 'Map'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'map.label', default: 'Map'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'map.label', default: 'Map'), params.id])}"
            redirect(action: "list")
        }
    }
}
