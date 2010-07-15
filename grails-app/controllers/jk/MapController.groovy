package jk

class MapController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	
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
	        if (!accountInstance && accountInstance2 ) {
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

	redirect(action: "list", controller: "account" ,params: params)	
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
