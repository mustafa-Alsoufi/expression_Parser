note
	description: "Summary description for {SIGMA}."
	author: "Fahad Qayyum, Ahmed Sayed Ahmed, Mustafa Alsoufi"
	date: "$Date$"
	revision: "$Revision$"

class
	SIGMA

inherit
	UNARYEXP
	redefine
		accept, output
	end

create make

--feature --constructor
--	make_sigma
--		do
--	--		make_unary_op(current)
--		end
feature --inherited features
	accept(v : VISITOR)
		do
			v.visit_SIGMA(current)
		end
	output : STRING
		do
			Result :="+"
		end

end
