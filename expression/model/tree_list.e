note
	description: "Summary description for {TREE_LIST}."
	author: "Fahad Qayyum, Ahmed Sayed Ahmed, Mustafa Alsoufi"
	date: "$Date$"
	revision: "$Revision$"

class
	TREE_LIST[G]

create make

feature

	tree_ll: LINKED_LIST[G]

feature
	make
		do
			create tree_ll.make
		end

	make_list(ll: LINKED_LIST[G])
		do
			make
			tree_ll := ll
		end
end
