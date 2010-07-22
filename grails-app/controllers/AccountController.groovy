//package jk
import jk.Account
import jk.Map
import jk.Authority

/**
 * User controller.
 */
class AccountController {

    def authenticateService

    // the delete, save and update actions only accept POST requests
    static Map allowedMethods = [delete: 'POST', save: 'POST', update: 'POST']

    def index = {
        redirect action: list, params: params
    }

    def list = {
        if (!params.max) {
            params.max = 10
        }
        [accountList: Account.list(params)]
    }

    def show = {
        def account = Account.get(params.id)
        println account.animal
        if (!account) {
            flash.message = "Account not found with id $params.id"
            redirect action: list
            return
        }
        List roleNames = []
        for (role in account.authorities) {
            roleNames << role.authority
        }
        roleNames.sort { n1, n2 ->
            n1 <=> n2
        }
        [account: account, roleNames: roleNames]
    }
    
    def registered = {
        def account = Account.get(params.id)
        if (!account) {
            flash.message = "Account not found with id $params.id"
            redirect action: index
            return
        }
        List roleNames = []
        for (role in account.authorities) {
            roleNames << role.authority
        }
        roleNames.sort { n1, n2 ->
            n1 <=> n2
        }
        [account: account, roleNames: roleNames]
    }

    /**
     * Person delete action. Before removing an existing account,
     * he should be removed from those authorities which he is involved.
     */
    def delete = {

        def account = Account.get(params.id)
        if (account) {
            def authPrincipal = authenticateService.principal()
            //avoid self-delete if the logged-in user is an admin
            if (!(authPrincipal instanceof String) && authPrincipal.username == account.name) {
                flash.message = "You can not delete yourself, please login as another admin and try again"
            }
            else {
                //first, delete this account from People_Authorities table.
                Authority.findAll().each { it.removeFromPeople(account) }
                account.delete()
                flash.message = "Account $params.id deleted."
            }
        }
        else {
            flash.message = "Account not found with id $params.id"
        }

        redirect action: list
    }

    def edit = {

        def account = Account.get(params.id)
        if (!account) {
            flash.message = "Account not found with id $params.id"
            redirect action: list
            return
        }

        return buildPersonModel(account)
    }

    /**
     * Person update action.
     */
    def update = {

        def account = Account.get(params.id)
        if (!account) {
            flash.message = "Account not found with id $params.id"
            redirect action: edit, id: params.id
            return
        }

        long version = params.version.toLong()
        if (account.version > version) {
            account.errors.rejectValue 'version', "account.optimistic.locking.failure",
                "Another user has updated this Account while you were editing."
                render view: 'edit', model: buildPersonModel(account)
            return
        }

        def oldPassword = account.passwd
        account.properties = params
        if (!params.passwd.equals(oldPassword)) {
            account.passwd = authenticateService.encodePassword(params.passwd)
        }
        if (account.save()) {
            Authority.findAll().each { it.removeFromPeople(account) }
            addRoles(account)
            redirect action: show, id: account.id
        }
        else {
            render view: 'edit', model: buildPersonModel(account)
        }
    }

    def create = {
        [account: new Account(params), authorityList: Authority.list()]
    }

    /**
     * Person save action.
     */
    def save = {

        def account = new Account()
        account.properties = params
        account.passwd = authenticateService.encodePassword(params.passwd)
        if (account.save()) {
            addRoles(account)
            def map = new Map()
            map.objectId = account.id
            map.x = 0
            map.y = 0
            map.object = "Account"
            if (map.save()) {
                redirect action: registered, id: account.id
            }
            else{
                render view: 'create', model: [authorityList: Authority.list(), account: account]
            }
        }
        else {
            render view: 'create', model: [authorityList: Authority.list(), account: account]
        }
    }

    private void addRoles(account) {
        for (String key in params.keySet()) {
            if (key.contains('ROLE') && 'on' == params.get(key)) {
                Authority.findByAuthority(key).addToPeople(account)
            }
        }
    }

    private Map buildPersonModel(account) {

        List roles = Authority.list()
        roles.sort { r1, r2 ->
            r1.authority <=> r2.authority
        }
        Set userRoleNames = []
        for (role in account.authorities) {
            userRoleNames << role.authority
        }
        LinkedHashMap<Authority, Boolean> roleMap = [:]
        for (role in roles) {
            roleMap[(role)] = userRoleNames.contains(role.authority)
        }

        return [account: account, roleMap: roleMap]
    }
}