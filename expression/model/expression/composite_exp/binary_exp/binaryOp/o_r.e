note
	description: "Summary description for {O_R}."
	author: "Fahad Qayyum, Ahmed Sayed Ahmed, Mustafa Alsoufi"
	date: "$Date$"
	revision: "$Revision$"

class
	O_R

inherit
	BINARYEXP
	redefine
		accept, output
	end

create make

--feature --constructor
--	make_O_R
--		do
--	--		make_binary_op(current)
--		end
feature --inherited features
	accept(v : VISITOR)
		do
			v.visit_O_R(current)
		end
	output : STRING
		do
			Result :="||"
		end

end
