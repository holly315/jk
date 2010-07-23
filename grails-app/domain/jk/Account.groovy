package jk
import jk.Animal
import jk.Authority

/**
 * User domain class.
 */
class Account {
    static transients = ['pass']
    static hasMany = [authorities: Authority]
    static belongsTo = [Authority]

/** O */
    String name
/** [AhX */
    String email
/** pX[h */
    String passwd
/** a */
    int esa
/** ̗ */
    int hp
/**  */
    int won
/** sk */
    int lost
/**  */
    boolean deadflg
/** O */
    String log 
    
    //String animal    //defႾ߂ۂ
    Animal animal //ł܂g΂ȂƂc

    /** plain password to create a MD5 password */
    String pass = '[secret]'

    static constraints = {
        name(blank:false,maxSize:40,unique:true)
        email(email:true)
        passwd(blank:false,maxSize:40)
        esa(max:3,min:0)
        hp(max:100,min:0)
        won(min:0)
        lost(min:0)
        log()
    }
}