package jk


/** マップ */
class Map {
	
	/** x座標 */
	int x
	/** y座標 */
	int y
	/** オブジェクト */
	String object
	/** オブジェクトID */
	int objectId
	
    static constraints = {
	x(range:1..5)
	y(range:1..5)
	object(blank:false)
	objectId(min:1)
    }
}


