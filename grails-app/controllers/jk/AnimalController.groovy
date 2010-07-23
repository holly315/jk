package jk

class AnimalController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	def ranking = {
		def allInstance
		def title = params.dflg + "ランキング"
		def num
		switch (params.dflg) {
		case "歴代勝利数":
			num = Account.count()
			allInstance = Account.getAll().sort{ r, l -> l.won <=> r.won }
			break
		case "歴代勝率":
			num = Account.count()
			allInstance = Account.getAll().sort{ r, l -> (l.won / ((l.won + l.lost)?(l.won + l.lost):(1))) <=> (r.won / ((r.won + r.lost)?(l.won + l.lost):(1))) }
			break
		case "生存者勝率":
			num = Account.findAllWhere(deadflg:true).count()
			allInstance = Account.findAllWhere(deadflg:true).sort{ r, l -> (l.won / ((l.won + l.lost)?(l.won + l.lost):(1))) <=> (r.won / ((r.won + r.lost)?(l.won + l.lost):(1))) }
			break
		default:
			num = Account.findAllWhere(deadflg:true).count()
			title = "生存者勝利数ランキング"
			allInstance = Account.findAllWhere(deadflg:true).sort{ r, l -> l.won <=> r.won }
			break
		}
		if (!allInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'account.label', default: 'Account'), params.id])}"
			redirect(action: "index")
		}
		[allInstance:allInstance, title:title, num:num]
	}

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [animalInstanceList: Animal.list(params), animalInstanceTotal: Animal.count()]
    }

    def create = {
        def animalInstance = new Animal()
        animalInstance.properties = params
        return [animalInstance: animalInstance]
    }

    def save = {
        def animalInstance = new Animal(params)
        if (animalInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'animal.label', default: 'Animal'), animalInstance.id])}"
            redirect(action: "show", id: animalInstance.id)
        }
        else {
            render(view: "create", model: [animalInstance: animalInstance])
        }
    }

    def show = {
        def animalInstance = Animal.get(params.id)
        if (!animalInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'animal.label', default: 'Animal'), params.id])}"
            redirect(action: "list")
        }
        else {
            [animalInstance: animalInstance]
        }
    }

    def edit = {
        def animalInstance = Animal.get(params.id)
        if (!animalInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'animal.label', default: 'Animal'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [animalInstance: animalInstance]
        }
    }

    def update = {
        def animalInstance = Animal.get(params.id)
        if (animalInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (animalInstance.version > version) {
                    
                    animalInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'animal.label', default: 'Animal')] as Object[], "Another user has updated this Animal while you were editing")
                    render(view: "edit", model: [animalInstance: animalInstance])
                    return
                }
            }
            animalInstance.properties = params
            if (!animalInstance.hasErrors() && animalInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'animal.label', default: 'Animal'), animalInstance.id])}"
                redirect(action: "show", id: animalInstance.id)
            }
            else {
                render(view: "edit", model: [animalInstance: animalInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'animal.label', default: 'Animal'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def animalInstance = Animal.get(params.id)
        if (animalInstance) {
            try {
                animalInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'animal.label', default: 'Animal'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'animal.label', default: 'Animal'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'animal.label', default: 'Animal'), params.id])}"
            redirect(action: "list")
        }
    }
}
