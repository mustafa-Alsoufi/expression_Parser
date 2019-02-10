note
	description: "Summary description for {UNARYEXP}."
	author: "Fahad Qayyum, Ahmed Sayed Ahmed, Mustafa Alsoufi"
	date: "$Date$"
	revision: "$Revision$"

deferred class
	UNARYEXP

inherit
	EXPRESSION

	UNARY_EXPRESSION[EXPRESSION]


feature
	item_expr: EXPRESSION
		do
			if attached {EXPRESSION} item as ie then
				Result := ie
			else
				Result := create {EMPTY_EXPRESSION}.make
			end
		end
end
