note
	description: "Summary description for {EXISTS}."
	author: "Fahad Qayyum, Ahmed Sayed Ahmed, Mustafa Alsoufi"
	date: "$Date$"
	revision: "$Revision$"

class
	EXISTS

inherit
	UNARYEXP
	redefine
		accept, output
	end

create make

--feature --constructor
--	make_exists
--		do
--	--		make_unary_op(current)
--		end
feature --inherited features
	accept(v : VISITOR)
		do
			v.visit_EXISTS(current)
		end
	output : STRING
		do
			Result :="||"
		end

end
