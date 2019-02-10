note
	description: "Summary description for {UNION}."
	author: "Fahad Qayyum, Ahmed Sayed Ahmed, Mustafa Alsoufi"
	date: "$Date$"
	revision: "$Revision$"

class
	UNION

inherit
	BINARYEXP
	redefine
		accept, output
	end

create make

--feature --constructor
--	make_union
--		do
--	--		make_binary_op(current)
--		end
feature --inherited features
	accept(v : VISITOR)
		do
			v.visit_UNION(current)
		end
	output : STRING
		do
			Result :="\/"
		end

end
