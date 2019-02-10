note
	description: "Summary description for {G_T}."
	author: "Fahad Qayyum, Ahmed Sayed Ahmed, Mustafa Alsoufi"
	date: "$Date$"
	revision: "$Revision$"

class
	G_T

inherit
	BINARYEXP
	redefine
		accept, output
	end

create make

--feature --constructor
--	make_G_T
--		do
--	--		make_binary_op(current)
--		end
feature --inherited features
	accept(v : VISITOR)
		do
			v.visit_G_T(current)
		end
	output : STRING
		do
			Result :=">"
		end

end
