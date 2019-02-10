note
	description: "Summary description for {SET_ENUM}."
	author: "Fahad Qayyum, Ahmed Sayed Ahmed, Mustafa Alsoufi"
	date: "$Date$"
	revision: "$Revision$"

class
	SET_ENUM

inherit
	EXPRESSION
		redefine is_equal select is_equal end
	COMPOSITE_EXPRESSION[EXPRESSION]
		rename is_equal as is_equal_composite end

create
	make

feature -- Attributes

	set : ARRAY[EXPRESSION]

feature -- Constructor
	make
		do
			create set.make_empty
			set.force(create {CURRENT_EXPRESSION}.make, 1)
			list := create {LINKED_LIST[EXPRESSION]}.make
			list.extend(create {EMPTY_EXPRESSION}.make)
			list.compare_objects
			cursor := 1
		end

feature

	accept(v: VISITOR)
		do
			v.visit_set_enumeration(Current)
		end
	output : STRING
		do
			result := ""
		end

feature -- Set Operations

	set_count : INTEGER
		do
			result := set.count
		end

	force (exp : EXPRESSION ; index : INTEGER)
		do
			set.force (exp , index)
		end

	put (exp : EXPRESSION ;  index : INTEGER)
		do
			set.put (exp, index)
		end

	has (exp : EXPRESSION) : BOOLEAN
		do
			result := set.has (exp)
		end

	at(index: INTEGER) : EXPRESSION
		do
			result := set.at (index)
		end
	remove
		local
			curr : CURRENT_EXPRESSION
		do
			create curr.make
			if(at(count) ~ curr) then
			set.remove_tail (1)
			end
		end

	add(exp: EXPRESSION)
		do
			if list.at(cursor).isEmpty then
				list.finish
				list.replace(exp)

				if not attached {COMPOSITE_EXPRESSION[EXPRESSION]} exp as cp then
					list.extend(create {EMPTY_EXPRESSION}.make)
					cursor := cursor + 1
				else
					cp.set_parent(Current)
				end

			elseif attached {COMPOSITE_EXPRESSION[EXPRESSION]} list.at(cursor) as ic then
				ic.add(exp)
				if ic.isDone then
					list.extend(create {EMPTY_EXPRESSION}.make)
					cursor := cursor + 1
				end
			end
			if attached {SET_ENUM} exp as se then
				if se.isDone then
					increment_cursor
					list.extend(create {EMPTY_EXPRESSION}.make)
				end
			end
		end

	complete
		do
			cursor := 0
			list.finish
			list.remove
		end

	set_closed : BOOLEAN
		local
			curr : CURRENT_EXPRESSION
		do
			create curr.make
			result := not set.has (curr)
		end

	count: INTEGER
		do
			Result := list.count
		end

	is_equal (other: like Current): BOOLEAN
		local
			anal: ANALYSIS
			str: STRING
			ll: LIST[EXPRESSION]
		do
			Result := count = other.count
			if Result then
				create anal.make
				accept(anal)
				str := anal.type
				Result := Result and anal.is_type_correct
				other.accept(anal)
				Result := Result and anal.is_type_correct
				if Result and (str ~ anal.type) then
					ll := other.list.deep_twin
					ll.compare_objects
					across list as c loop
						ll.start
						ll.search(c.item)
						if not ll.exhausted then
							ll.remove
						end
					end
					Result := ll.is_empty
				end
			end
		end

	reset_set
		do
			make
		end

end
