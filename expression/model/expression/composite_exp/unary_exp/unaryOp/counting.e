note
	description: "Summary description for {COUNTING}."
	author: "Fahad Qayyum, Ahmed Sayed Ahmed, Mustafa Alsoufi"
	date: "$Date$"
	revision: "$Revision$"

class
	COUNTING

inherit
	UNARYEXP
	redefine
		accept, output
	end

create make

--feature --constructor
--	make_counting
--		do
--	--		make_unary_op(current)
--		end
feature --inherited features
	accept(v : VISITOR)
		do
			v.visit_COUNTING(current)
		end
	output : STRING
		do
			Result :="#"
		end

end
