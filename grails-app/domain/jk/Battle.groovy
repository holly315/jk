package jk

class Battle {

	static belongsTo = [animal:Animal]
	
	int toId
	int revise

    static constraints = {
	toId(min:1)
	revise(matches:"\\d+")
    }
}
