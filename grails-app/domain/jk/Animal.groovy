package jk

/** 動物 */
class Animal {

	static hasMany = [account:Account,battle:Battle]
	
	/** 種類 */
	String name
	/** 画像ファイル */
	String img
	
	
    static constraints = {
    }
	String toString(){
		return name + " : " + id
	}

}
