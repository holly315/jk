package jk

class BattleController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [battleInstanceList: Battle.list(params), battleInstanceTotal: Battle.count()]
    }

    def create = {
        def battleInstance = new Battle()
        battleInstance.properties = params
        return [battleInstance: battleInstance]
    }

    def save = {
        def battleInstance = new Battle(params)
        if (battleInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'battle.label', default: 'Battle'), battleInstance.id])}"
            redirect(action: "show", id: battleInstance.id)
        }
        else {
            render(view: "create", model: [battleInstance: battleInstance])
        }
    }

    def show = {
        def battleInstance = Battle.get(params.id)
        if (!battleInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'battle.label', default: 'Battle'), params.id])}"
            redirect(action: "list")
        }
        else {
            [battleInstance: battleInstance]
        }
    }

    def edit = {
        def battleInstance = Battle.get(params.id)
        if (!battleInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'battle.label', default: 'Battle'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [battleInstance: battleInstance]
        }
    }

    def update = {
        def battleInstance = Battle.get(params.id)
        if (battleInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (battleInstance.version > version) {
                    
                    battleInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'battle.label', default: 'Battle')] as Object[], "Another user has updated this Battle while you were editing")
                    render(view: "edit", model: [battleInstance: battleInstance])
                    return
                }
            }
            battleInstance.properties = params
            if (!battleInstance.hasErrors() && battleInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'battle.label', default: 'Battle'), battleInstance.id])}"
                redirect(action: "show", id: battleInstance.id)
            }
            else {
                render(view: "edit", model: [battleInstance: battleInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'battle.label', default: 'Battle'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def battleInstance = Battle.get(params.id)
        if (battleInstance) {
            try {
                battleInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'battle.label', default: 'Battle'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'battle.label', default: 'Battle'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'battle.label', default: 'Battle'), params.id])}"
            redirect(action: "list")
        }
    }
}
