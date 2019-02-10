note
	description: "Summary description for {INTERSECT}."
	author: "Fahad Qayyum, Ahmed Sayed Ahmed, Mustafa Alsoufi"
	date: "$Date$"
	revision: "$Revision$"

class
	INTERSECT

inherit
	BINARYEXP
	redefine
		accept, output
	end

create make

--feature --constructor
--	make_intersect
--		do
--	--		make_binary_op(current)
--		end
feature --inherited features
	accept(v : VISITOR)
		do
			v.visit_INTERSECT(current)
		end
	output : STRING
		do
			Result :="/\"
		end

end
