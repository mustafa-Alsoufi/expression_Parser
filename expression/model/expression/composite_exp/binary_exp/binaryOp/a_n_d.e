note
	description: "Summary description for {A_N_D}."
	author: "Fahad Qayyum, Ahmed Sayed Ahmed, Mustafa Alsoufi"
	date: "$Date$"
	revision: "$Revision$"

class
	A_N_D

inherit
	BINARYEXP
	redefine
		accept, output
	end

create make

--feature --constructor
--	make_A_N_D
--		do
--		--	make_binary_op(current)
--		end

feature --inherited features
	accept(v : VISITOR)
		do
			v.visit_A_N_D(current)
		end
	output : STRING
		do
			Result :="&&"
		end


end
