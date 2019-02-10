note
	description: "Summary description for {EXPRESSION_TREE}."
	author: "Fahad Qayyum, Ahmed Sayed Ahmed, Mustafa Alsoufi"
	date: "$Date$"
	revision: "$Revision$"

class
	EXPRESSION_TREE


create make

feature
	make
		do
			create tree.make_empty
		end

feature -- Attributes
		tree: ARRAY [EXPRESSION]

feature -- Tree operations

	grow_tree (entry: INTEGER)
			-- expand the tree
		local
			j: INTEGER
			empty: EMPTY_EXPRESSION
		do
			create empty.make
			from
				j := tree.count + 1
			until
				j > (2 * entry) + 2
			loop
				tree.force (empty, j)
				j := j + 1
			end
		end

	root: EXPRESSION
		do
			Result := tree.at (1)
		end

	force(e : EXPRESSION ; index : INTEGER)
		do
			tree.force (e, index)
		end

	count : INTEGER
		do
			result := tree.count
		end

	at(index : INTEGER) : EXPRESSION
		do
			result := tree.at (index)
		end

	put(exp : EXPRESSION ; index : INTEGER)
		do
			tree.put (exp, index)
		end

	item(index : INTEGER) : EXPRESSION
		do
			result := tree.item (index)
		end

	is_empty : BOOLEAN
		do
			result := tree.is_empty
		end

	has(exp : EXPRESSION) : BOOLEAN
		do
			result := tree.has (exp)
		end

feature -- Output features

	print_tree_list: STRING
			-- print tree in an array list order
			-- i.e left_child is at (2*k) and right_child is at (2*k)+1
		local
			i: INTEGER
		do
			create Result.make_empty
			from
				i := 1
			until
				i > tree.count
			loop
				Result.append (tree.at (i).output + " ")
				i := i + 1
			end
		end

end
