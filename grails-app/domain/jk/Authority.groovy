package jk

import jk.Account

/**
 * Authority domain class.
 */
class Authority {

	static hasMany = [people: Account]

	/** description */
	String description
	/** ROLE String */
	String authority

	static constraints = {
		authority(blank: false, unique: true)
		description()
	}
}
