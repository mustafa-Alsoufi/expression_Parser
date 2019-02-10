note
	description: "Summary description for {MOD}."
	author: "Fahad Qayyum, Ahmed Sayed Ahmed, Mustafa Alsoufi"
	date: "$Date$"
	revision: "$Revision$"

class
	MOD

inherit
	BINARYEXP
	redefine
		accept, output
	end

create make

--feature --constructor
--	make_MOD
--		do
--	--		make_binary_op(current)
--		end
feature --inherited features
	accept(v : VISITOR)
		do
			v.visit_MOD(current)
		end
	output : STRING
		do
			Result :="mod"
		end

end
