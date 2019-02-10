note
	description: "Summary description for {CURRENT_EXPRESSION}."
	author: "Fahad Qayyum, Ahmed Sayed Ahmed, Mustafa Alsoufi"
	date: "$Date$"
	revision: "$Revision$"

class
	CURRENT_EXPRESSION

inherit
	EXPRESSION
	redefine
	output,accept
	end

create make

feature --constructor
	make
		do

		end
feature --methods
	output : STRING
		do
			result := "?"
		end
	accept(v : VISITOR)
		do
			v.visit_current(Current)
		end

end
