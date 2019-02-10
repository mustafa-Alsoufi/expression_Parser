note
	description: "Summary description for {NEGATION}."
	author: "Fahad Qayyum, Ahmed Sayed Ahmed, Mustafa Alsoufi"
	date: "$Date$"
	revision: "$Revision$"

class
	NEGATION

inherit
	UNARYEXP
	redefine
		accept, output
	end

create make

--feature --constructor
--	make_negation
--		do
--	--		make_unary_op(current)
--		end
feature --inherited features
	accept(v : VISITOR)
		do
			v.visit_NEGATION(current)
		end
	output : STRING
		do
			Result :="!"
		end


end
