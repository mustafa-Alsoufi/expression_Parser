note
	description: "Summary description for {DIFFERENCE}."
	author: "Fahad Qayyum, Ahmed Sayed Ahmed, Mustafa Alsoufi"
	date: "$Date$"
	revision: "$Revision$"

class
	DIFFERENCE

inherit
	BINARYEXP
	redefine
		accept, output
	end

create make

--feature --constructor
--	make_difference
--		do
--		--	make_binary_op(current)
--		end
feature --inherited features
	accept(v : VISITOR)
		do
			v.visit_DIFFERENCE(current)
		end
	output : STRING
		do
			Result :="\"
		end

end
