note
	description: "Summary description for {I_M_P_L_I_E_S}."
	author: "Fahad Qayyum, Ahmed Sayed Ahmed, Mustafa Alsoufi"
	date: "$Date$"
	revision: "$Revision$"

class
	I_M_P_L_I_E_S

inherit
	BINARYEXP
	redefine
		accept, output
	end

create make

--feature --constructor
--	make_implies
--		do
--	--		make_binary_op(current)
--		end
feature --inherited features
	accept(v : VISITOR)
		do
			v.visit_IMPLIES(current)
		end
	output : STRING
		do
			Result :="=>"
		end

end
