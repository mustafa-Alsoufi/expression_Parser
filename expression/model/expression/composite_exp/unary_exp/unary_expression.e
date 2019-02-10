note
	description: "Summary description for {UNARY_EXPRESSION}."
	author: "Fahad Qayyum, Ahmed Sayed Ahmed, Mustafa Alsoufi"
	date: "$Date$"
	revision: "$Revision$"

deferred class
	UNARY_EXPRESSION[G]

inherit
	COMPOSITE_EXPRESSION[G]

feature {NONE}
	make
		do
			create {CURRENT_EXPRESSION}right_expression.make
			list := create {FIXED_LIST[G]}.make(1)
			cursor := 1
		end

feature -- Attributes

	right_expression : EXPRESSION

feature -- Commands

	replace_right_child(e: EXPRESSION)
		do
			right_expression:= e
		end

	add(exp: G)
		do
			if list.count < cursor then
				list.extend(exp)
				if not attached {COMPOSITE_EXPRESSION[G]} exp as ce then
					cursor := 0
				else
					ce.set_parent(Current)
				 end
			elseif attached {COMPOSITE_EXPRESSION[G]} list.at(cursor) as ic then
					ic.add(exp)
						if ic.isDone then
							cursor := 0
						 end
			end
		end

feature -- Queries

	item: detachable G
		do
			if 0 < list.count then
				Result := list.at (1)
			end
		end
end
