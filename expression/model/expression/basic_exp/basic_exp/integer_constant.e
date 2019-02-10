note
	description: "Summary description for {INTEGER_CONSTANT}."
	author: "Fahad Qayyum, Ahmed Sayed Ahmed, Mustafa Alsoufi"
	date: "$Date$"
	revision: "$Revision$"

class
	INTEGER_CONSTANT

inherit
	CONSTANT_EXPRESSION

create make

feature-- Attributes
	value : INTEGER

feature
	make(v : INTEGER)
		do
			value := v
		end

feature --methods
	accept(v : VISITOR)
		do
			v.visit_integer (current)
		end
	output : STRING
		do
			Result := ( "" + value.out + "")
		end
end
