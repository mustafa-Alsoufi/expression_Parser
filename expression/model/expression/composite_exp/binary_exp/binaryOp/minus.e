note
	description: "Summary description for {MINUS}."
	author: "Fahad Qayyum, Ahmed Sayed Ahmed, Mustafa Alsoufi"
	date: "$Date$"
	revision: "$Revision$"

class
	MINUS

inherit
	BINARYEXP
	redefine
		accept, output
	end

create make

--feature --constructor
--	make_minus
--		do
--	--		make_binary_op(current)
--		end
feature --inherited features
	accept(v : VISITOR)
		do
			v.visit_MINUS(current)
		end
	output : STRING
		do
			Result :="-"
		end

end
