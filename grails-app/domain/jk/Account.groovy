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

/** 名前 */
    String name
/** メールアドレス */
    String email
/** パスワード */
    String passwd
/** 餌 */
    int esa
/** 体力 */
    int hp
/** 勝利数 */
    int won
/** 敗北数 */
    int lost
/** 生死 */
    boolean deadflg
/** ログ */
    String log 
    
    //String animal    //defじゃだめっぽい
    Animal animal //でうまく使えればなんとか…

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