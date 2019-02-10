note
	description: "Summary description for {EMPTY_EXPRESSION}."
	author: "Fahad Qayyum, Ahmed Sayed Ahmed, Mustafa Alsoufi"
	date: "$Date$"
	revision: "$Revision$"

class
	EMPTY_EXPRESSION

inherit
	EXPRESSION
	redefine
		isEmpty
	end

create
	make
feature
	make
		do

		end
feature
	output : STRING
		do
			Result := "."
		end
	accept(v : VISITOR)
		do
		end
	isEmpty : BOOLEAN
		do
			Result := TRUE
		end
end
