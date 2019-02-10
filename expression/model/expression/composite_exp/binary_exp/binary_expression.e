note
	description: "Summary description for {BINARY_EXPRESSION}."
	author: "Fahad Qayyum, Ahmed Sayed Ahmed, Mustafa Alsoufi"
	date: "$Date$"
	revision: "$Revision$"

deferred class
	BINARY_EXPRESSION[G]

inherit
	COMPOSITE_EXPRESSION[G]

feature -- Attributes

	left_expression : EXPRESSION
	right_expression : EXPRESSION

feature {NONE}
	make
		do
			create {CURRENT_EXPRESSION}left_expression.make
			create {NIL_EXPRESSION}right_expression.make
			list := create {FIXED_LIST[G]}.make(2)
			cursor := 1
		end

	maintain
		do
			if list.full then
				cursor := 0
			else
				cursor := cursor + 1
			end
		end

feature
	add(exp: G)
		do
			if list.count < cursor then
				list.extend(exp)
				if not attached {COMPOSITE_EXPRESSION[G]} exp  as ce then
					maintain
				else
					ce.set_parent(Current)
				end
			elseif attached {COMPOSITE_EXPRESSION[G]} list.at(cursor) as ic then
					ic.add(exp)
				if ic.isDone then
					maintain
				 end
			end
		end

	left: detachable G
		do
			if 0 < list.count then
				Result := list.at (1)
			end
		end

	right: detachable G
		do
			if 1 < list.count then
				Result := list.at (2)
			end
		end

feature -- Commands

	replace_left_child (e : EXPRESSION)
		do
			left_expression  := e
		end
	replace_right_child (e : EXPRESSION)
		do
			right_expression  := e
		end


feature -- Queries

	get_left_child : EXPRESSION
		do
			result := left_expression
		end

	get_right_child : EXPRESSION
		do
			result := right_expression
		end

end
