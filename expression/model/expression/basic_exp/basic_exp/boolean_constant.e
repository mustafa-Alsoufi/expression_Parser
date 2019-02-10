note
	description: "Summary description for {BOOLEAN_CONSTANT}."
	author: "Fahad Qayyum, Ahmed Sayed Ahmed, Mustafa Alsoufi"
	date: "$Date$"
	revision: "$Revision$"

class
	BOOLEAN_CONSTANT

inherit
	CONSTANT_EXPRESSION

create make

feature --Attributes
	state : BOOLEAN

feature
	make (b : BOOLEAN)
		do
			state := b
		end

feature --inherited features
	accept(v : VISITOR)
		do
			v.visit_boolean (current)
		end
	output : STRING
		do
			result:= state.out
		end
end
