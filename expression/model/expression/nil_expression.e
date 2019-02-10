note
	description: "Summary description for {NIL_EXPRESSION}."
	author: "Fahad Qayyum, Ahmed Sayed Ahmed, Mustafa Alsoufi"
	date: "$Date$"
	revision: "$Revision$"

class
	NIL_EXPRESSION

inherit
	EXPRESSION
create make

feature
	make
		do

		end
feature --Constructor
	output : STRING
		do
			result := "nil"
		end
	accept(v : VISITOR)
		do
			v.visit_nil(current)
		end

end
