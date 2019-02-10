note
	description: "Summary description for {EQUAL}."
	author: "Fahad Qayyum, Ahmed Sayed Ahmed, Mustafa Alsoufi"
	date: "$Date$"
	revision: "$Revision$"

class
	EQUAL

inherit
	BINARYEXP
	redefine
		accept, output
	end

create make

--feature --constructor
--	make_equal
--		do
--	--		make_binary_op(current)
--		end
feature --inherited features
	accept(v : VISITOR)
		do
			v.visit_EQUAL(current)
		end
	output : STRING
		do
			Result := "="
		end
end
