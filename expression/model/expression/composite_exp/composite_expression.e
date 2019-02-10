note
	description: "Summary description for {COMPOSITE_EXPRESSION}."
	author: "Fahad Qayyum, Ahmed Sayed Ahmed, Mustafa Alsoufi"
	date: "$Date$"
	revision: "$Revision$"

deferred class
	COMPOSITE_EXPRESSION[G]

feature -- attribute
	cursor: INTEGER
	list: LIST[G]
	parent: detachable COMPOSITE_EXPRESSION[G]

feature
	add(exp: G) deferred end

	set_parent(p: COMPOSITE_EXPRESSION[G])
		do
			parent := p
		end

	increment_cursor
		do
			if cursor = 0 or list.full then
				cursor := 0
				if attached {COMPOSITE_EXPRESSION[G]} parent as cp then
					cp.increment_cursor
				end
			else
				cursor := cursor + 1
			end
		end

	cursor_item: detachable G
		do
			if cursor /= 0 and 0 < list.count then
				Result := list.at(cursor)
			end
		end

	isDone: BOOLEAN
		do
			Result := cursor = 0
		end

end
