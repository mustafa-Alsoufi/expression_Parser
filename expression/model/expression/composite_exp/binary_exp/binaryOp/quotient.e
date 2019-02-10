note
	description: "Summary description for {QUOTIENT}."
	author: "Fahad Qayyum, Ahmed Sayed Ahmed, Mustafa Alsoufi"
	date: "$Date$"
	revision: "$Revision$"

class
	QUOTIENT

inherit
	BINARYEXP
	redefine
		accept, output
	end

create make

--feature --constructor
--	make_quotient
--		do
--	--		make_binary_op(current)
--		end
feature --inherited features
	accept(v : VISITOR)
		do
			v.visit_QUOTIENT(current)
		end
	output : STRING
		do
			Result :="/"
		end

end
