package jk

/** アカウント */
class Account {

/** 動物 */
static belongsTo = [animal:Animal]

/** 名前 */
	String name
/** メールアドレス */
	String email
/** パスワード */
	String pass
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
	
    static constraints = {
		name(blank:false,maxSize:40,unique:true)
		email(email:true)
		pass(blank:false,maxSize:40)
		esa(max:3,min:0)
		hp(max:100,min:0)
		won(min:0)
		lost(min:0)
		log()
    }
}
