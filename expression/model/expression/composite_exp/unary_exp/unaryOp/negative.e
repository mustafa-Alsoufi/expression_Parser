note
	description: "Summary description for {NEGATIVE}."
	author: "Fahad Qayyum, Ahmed Sayed Ahmed, Mustafa Alsoufi"
	date: "$Date$"
	revision: "$Revision$"

class
	NEGATIVE

inherit
	UNARYEXP
	redefine
		accept, output
	end

create make

--feature --constructor
--	make_negative
--		do
--	--		make_unary_op(current)
--		end
feature --inherited features
	accept(v : VISITOR)
		do
			v.visit_NEGATIVE(current)
		end
	output : STRING
		do
			Result :="-"
		end



end
