security {

    // see DefaultSecurityConfig.groovy for all settable/overridable properties

    active = true

    loginUserDomainClass = "jk.Account"
    userName = 'name'
    enabled = 'deadflg'
    authorityDomainClass = "jk.Authority"
    requestMapClass = "jk.Requestmap"
    
    defaultTargetUrl = '/map/meta'
    afterLogoutUrl = '/'
}