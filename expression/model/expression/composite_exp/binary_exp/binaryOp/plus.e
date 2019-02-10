note
	description: "Summary description for {PLUS}."
	author: "Fahad Qayyum, Ahmed Sayed Ahmed, Mustafa Alsoufi"
	date: "$Date$"
	revision: "$Revision$"

class
	PLUS

inherit
	BINARYEXP
	redefine
		accept, output
	end

create make

--feature --constructor
--	make_plus
--		do
--	--		make_binary_op(current)
--		end
feature --inherited features
	accept(v : VISITOR)
		do
			v.visit_PLUS(current)
		end
	output : STRING
		do
			Result :="+"
		end
end
