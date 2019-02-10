note
	description: "Summary description for {X_O_R}."
	author: "Fahad Qayyum, Ahmed Sayed Ahmed, Mustafa Alsoufi"
	date: "$Date$"
	revision: "$Revision$"

class
	X_O_R

inherit
	BINARYEXP
	redefine
		accept, output
	end

create make

--feature --constructor
--	make_X_O_R
--		do
--	--		make_binary_op(current)
--		end
feature --inherited features
	accept(v : VISITOR)
		do
			v.visit_X_O_R(current)
		end
	output : STRING
		do
			Result :="xor"
		end

end
