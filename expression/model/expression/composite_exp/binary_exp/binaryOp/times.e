note
	description: "Summary description for {TIMES}."
	author: "Fahad Qayyum, Ahmed Sayed Ahmed, Mustafa Alsoufi"
	date: "$Date$"
	revision: "$Revision$"

class
	TIMES

inherit
	BINARYEXP
	redefine
		accept, output
	end

create make

--feature --constructor
--	make_times
--		do
--	--		make_binary_op(current)
--		end
feature --inherited features
	accept(v : VISITOR)
		do
			v.visit_TIMES(current)
		end
	output : STRING
		do
			Result :="*"
		end

end
