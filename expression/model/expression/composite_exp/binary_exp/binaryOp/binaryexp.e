note
	description: "Summary description for {BINARYEXP}."
	author: "Fahad Qayyum, Ahmed Sayed Ahmed, Mustafa Alsoufi"
	date: "$Date$"
	revision: "$Revision$"

deferred class
	BINARYEXP

inherit
	EXPRESSION
	BINARY_EXPRESSION[EXPRESSION]
feature
	left_expr: EXPRESSION
		do
			if attached {EXPRESSION} left as l then
				Result := l
			else
				Result := create {EMPTY_EXPRESSION}.make
			end
		end
	right_expr: EXPRESSION
		do
			if attached {EXPRESSION} right as r then
				Result := r
			else
				Result := create {EMPTY_EXPRESSION}.make
			end
		end
end
