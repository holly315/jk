package jk

class TagLib {

	def repeat = { attrs, body ->
		def i = Integer.valueOf( attrs["times"] )
		def current = 0
		i.times {
			out << body( ++current ) // pass the current iteration as the groovy default arg "it"
		}
	}
	
	def i2HexString(i){
		a=Math.abs(i)
		b=Math.floor(Math.log(a)/Math.log(16))
		map=[10:"A",11:"B",12:"C",13:"D",14:"E",15:"F"]
		s=""
			r=0
			while(b>=0){
			r=Math.floor(a/(16**b))
			a-=r*16**b
			if(r>9){
				r=map[r as Integer]
			}
			else{
			r=r as Integer
			}
			s+=r as String
			b-=1
		}
		if(s==""){s="0"}
		return s
	}

	def getcolor = {attrs ->
		String col = "#"
		col += i2HexString(attrs['red'].toInteger())
		col += i2HexString(attrs['green'].toInteger())
		col += i2HexString(attrs['blue'].toInteger())
		out << col
	}

	def fmtDatePicker = {attrs ->
		/* 
		 * デフォルト値の設定
		 * デフォルト値をDate型に変換できなかった場合は例外を投げる.
		 */
		def xdefault = attrs['default']
		if ( xdefault == null ) {
			xdefault = new Date()
		} 
		else if ( xdefault.toString() != 'none' ) {
			if ( xdefault instanceof String ) {
				xdefault = DateFormat.getInstance().parse(xdefault)
			}else if(!(xdefault instanceof Date) ) {
				throwTagError("Tag [datePicker2] requires the default date to be a parseable String or a Date")
			 }
		} 
		else {
			xdefault = null
		}

		/* 
		 * 'value'の取得
		 * 取得できなかった場合はデフォルト値を使用する
		 */
		def value = attrs['value']
		if ( value.toString() == 'none' ) {
			value = null
		} else if ( !value ) {
			value = xdefault
		}

		def name = attrs['name']
		def id   = attrs['id'] ? attrs['id'] : name

		def noSelection = attrs['noSelection']
		if ( noSelection != null ) {
			noSelection = noSelection.entrySet().iterator().next()
		}

		def years = attrs['years']

		/* 
		 * 書式文字列の設定
		 */
		def format = attrs['format']
		if ( (format == null) || (! format instanceof String)) {
			format = '%y%M%d %H%m%S'
		}

		def day
		def month
		def year
		def hour
		def minute
		
		def c = null
		if ( value instanceof Calendar) {
			c = value
		} else if ( value != null ) {
			c = new GregorianCalendar()
			c.setTime(value)
		}
		if ( c != null ) {
			day    = c.get(GregorianCalendar.DAY_OF_MONTH)
			month  = c.get(GregorianCalendar.MONTH)
			year   = c.get(GregorianCalendar.YEAR)
			hour   = c.get(GregorianCalendar.HOUR_OF_DAY)
			minute = c.get(GregorianCalendar.MINUTE)
		}


		if ( years == null ) {
			def tempyear
			if ( year == null ) {
				def tempc = new GregorianCalendar()
				tempc.setTime(new Date())
				tempyear = tempc.get(GregorianCalendar.YEAR)
			} else {
				tempyear = year
			}
			years = (tempyear - 100 ) .. (tempyear + 100 )
		}

		out << "<input type=\"hidden\" name=\"${name}\" value=\"struct\" />"

		/* 日付選択の出力 */
		def output_day = {
			out << "<select name=\"${name}_day\" id=\"${id}_day\">\n"
			for ( i in 1 .. 31 ) {
				out << "<option value=\"${i}\""
				if ( i == day ) {
					out << " selected=\"selected\""
				}
				out << ">${i}</option>\n"
			}
			out << "</select>\n"
		}

		def output_month = {
			out << "<select name=\"${name}_month\" id=\"${id}_month\">\n"
			for ( i in 0 .. 11 ) {
				def monthIndex = i + 1
				out << "<option value=\"${monthIndex}\""
				if ( month == i ) {
					out << " selected=\"selected\""
				}
				out << ">${monthIndex}</option>\n"
			}
			out << "</select>\n"
		}

		def output_year = {
			out << "<select name=\"${name}_year\" id=\"${id}_year\">\n"
			for ( i in years ) {
				out << "<option value=\"${i}\""
				if ( i == year ) {
					out << " selected=\"selected\""
				}
				out << ">${i}</option>\n"
			}
			out << "</select>\n"
		}

		def output_hour = {
			out << "<select name=\"${name}_hour\" id=\"${id}_hour\">\n"
			for ( i in 0..23 ) {
				def h = '' + i
				if ( i < 10 ) {
					h = '0' + h
				}
				out << "<option value=\"${h}\" "
				if ( hour == h.toInteger() ) {
					out << "selected=\"selected\""
				}
				out << ">${h}</option>\n"
			}
			out << "</select>\n"
		}

		def output_minute = {
			out << "<select name=\"${name}_minute\" id=\"${id}_minute\">\n"
			for ( i in 0..59 ) {
				def m = '' + i
				if ( i < 10 ) {
					m = '0' + i
				}
				out << "<option value=\"${m}\" "
				if ( minute == m.toInteger() ) {
					out << "selected=\"selected\""
				}
				out << ">${m}</option>\n"
			}
			out << "</select>\n"
		}
		for ( def i = 0; i < format.length(); i++ ) {
			def ch = format.charAt(i)
			if ( ch == '%' ) {
				switch(format.charAt(++i)){
					case 'y':
						output_year()
						break;
					case 'm':
						output_month()
						break;
					case 'd':
						output_day()
						break;
					case 'H':
						output_hour()
						break;
					case 'M':
						output_minute()
						break;
				}
			}
			else {
				out << ch
			}
		}
	}

}
