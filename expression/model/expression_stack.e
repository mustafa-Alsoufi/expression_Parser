note
	description: "Summary description for {EXPRESSION_STACK}."
	author: "Fahad Qayyum, Ahmed Sayed Ahmed, Mustafa Alsoufi"
	date: "$Date$"
	revision: "$Revision$"

class
	EXPRESSION_STACK

create make

feature
	make
		do
			model := model_access.m
			create {ARRAYED_LIST [EXPRESSION]} stack.make (0)
		end

feature -- Attributes
	model : EXPRESSION_MODEL
	model_access : EXPRESSION_MODEL_ACCESS
	stack: LIST [EXPRESSION]

feature -- Stack operations

	push_element (e: EXPRESSION)
			-- push an element into the stack
		do
			stack.force (e)
			stack.forth
		--	model.set_last_expression(e)
		end

	pop_element
			-- pop the top element on stack
		do
			stack.remove
			stack.back
		end

	top: EXPRESSION
			-- current item on top of the stack
		do
			Result := stack.item
		end

	at(i : INTEGER) : EXPRESSION
		do
			result := stack.at (i)
		end

	count : INTEGER
		do
			result := stack.count
		end

	put_i_th(exp : EXPRESSION ; index : INTEGER)
		do
			stack.put_i_th (exp, index)
		end

	force(exp : EXPRESSION)
		do
			stack.force (exp)
		end
	is_empty : BOOLEAN
		do
			result := stack.is_empty
		end


end
