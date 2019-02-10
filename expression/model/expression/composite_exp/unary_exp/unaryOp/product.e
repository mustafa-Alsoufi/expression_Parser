note
	description: "Summary description for {PRODUCT}."
	author: "Fahad Qayyum, Ahmed Sayed Ahmed, Mustafa Alsoufi"
	date: "$Date$"
	revision: "$Revision$"

class
	PRODUCT

inherit
	UNARYEXP
create make

--feature --constructor
--	make_product
--		do
--	--		make_unary_op(current)
--		end
feature --inherited features
	accept(v : VISITOR)
		do
			v.visit_PRODUCT(current)
		end
	output : STRING
		do
			Result :="*"
		end


end
