note
	description: "Summary description for {L_T}."
	author: "Fahad Qayyum, Ahmed Sayed Ahmed, Mustafa Alsoufi"
	date: "$Date$"
	revision: "$Revision$"

class
	L_T

inherit
	BINARYEXP
	redefine
		accept, output
	end

create make

--feature --constructor
--	make_L_T
--		do
--	--		make_binary_op(current)
--		end
feature --inherited features
	accept(v : VISITOR)
		do
			v.visit_L_T(current)
		end
	output : STRING
		do
			Result :="<"
		end

end
