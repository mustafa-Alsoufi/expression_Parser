note
	description: "A default business model."
	author: "Fahad Qayyum, Ahmed Sayed Ahmed, Mustafa Alsoufi"
	date: "$Date$"
	revision: "$Revision$"

class
	EXPRESSION_MODEL

inherit
	ANY
		redefine
			out
		end

create {EXPRESSION_MODEL_ACCESS}

	make

feature {NONE}  -- Attributes

		-- Expression Operations

		printer: PRETTY_PRINT						-- Pretty Print Expression
		simplify: SIMPLIFICATION					-- simplify Expression
		type_checker: ANALYSIS						-- Type_check Expression

		-- Expression Handling

		tree: EXPRESSION_TREE						-- Tree build upon expression
		stack: EXPRESSION_STACK						-- Stack of current expression

		--  Display Attributes

		default_count: INTEGER						-- Default Count
		count : INTEGER								-- for counting binary and unary expression
		expression: STRING							-- Expression built so far
		message : STRING							-- for displaying the message
		error : STRING								-- for displaying the errors
		string : STRING								-- for other display functions

		--flag

		condition : BOOLEAN							-- for last_expression
		enum_flag : BOOLEAN							-- for set_enum
		enum_bool : BOOLEAN							-- for set_enumeration
		unary_bool : BOOLEAN						-- for unary operations
		analyze_bool : BOOLEAN						-- for analysis of operations

		--set_enum

		enum : SET_ENUM								-- for set enum
		enum_stack : EXPRESSION_STACK				-- for binary enum operations
		last_constant_pointer : EXPRESSION			-- for keeping track of last expression


feature -- model public attributes
	prime: EXPRESSION

feature {NONE} -- constructor
	make
		do
--			Stack

			create stack.make
			stack.force (create {CURRENT_EXPRESSION}.make)

-- 			Srings

			create expression.make_from_string (stack.at (1).output)

--			--Expression Tree

			create tree.make
			tree.force (create {CURRENT_EXPRESSION}.make, 1)

--			Operations

			create printer.make
			create simplify.make
			create type_checker.make

--			Count Trackers

			count := 1
			default_count := 0

--			Flags

			enum_flag := FALSE

--			Enum array

			last_constant_pointer := create {CURRENT_EXPRESSION}.make
			create enum.make
			create enum_stack.make
			enum_stack.force (create {CURRENT_EXPRESSION}.make)

--			for handling messages and reports			

			create string.make_empty
			create message.make_from_string ("Expression is initialized.")
			create error.make_empty
			prime := create {EMPTY_EXPRESSION}.make

		end

feature -- replacement features

	replace_nil_with_cur

		local
			i, j: INTEGER
			curr: CURRENT_EXPRESSION
			nil: NIL_EXPRESSION
		do
			create curr.make
			create nil.make
			from
				i := tree.count
			until
				i < 1
			loop
				if tree.item (i) ~ nil then
					tree.put (curr, i)
					j := i
					i := 1
				end
				i := i - 1
			end
		end

	replace_bin_exp_at_i_position_in_stack (i : INTEGER)
		local
			nil : NIL_EXPRESSION
			cur : CURRENT_EXPRESSION
		do
			create nil.make
			create cur.make
			if (attached {BINARY_EXPRESSION[A_N_D]}stack.at(i) as b) then
				if b.left_expression ~ nil then
					b.replace_left_child (cur)
				elseif b.right_expression ~ nil then
					b.replace_right_child (cur)
				end
			end
		end

	replace_unary_exp_at_i_position_in_stack (i : INTEGER)
		local
				nil : NIL_EXPRESSION
				cur : CURRENT_EXPRESSION
		do
			create nil.make
			create cur.make
			if (attached {UNARY_EXPRESSION[EXISTS]} stack.at (i) as u) then
				if u.right_expression ~ nil then
					u.replace_right_child (cur)
				end
			end
		end

	replace_binary_exp(k : INTEGER ; exp : EXPRESSION)
		local
			curr : CURRENT_EXPRESSION
		--	int : INTEGER
		do
			create curr.make
			if (attached {BINARY_EXPRESSION[O_R]} stack.at (k) as pb) then
				if pb.left ~ curr then
					pb.replace_left_child (exp)
				elseif pb.right ~ curr then
					pb.replace_right_child (exp)
				end
			end
		end

	replace_unary_exp(i : INTEGER; exp : EXPRESSION)
		local
			curr : CURRENT_EXPRESSION
		do
			create curr.make
			if (attached {UNARY_EXPRESSION[FORALL]} stack.at (i) as pu) then
				if pu.right_expression ~ curr then
					pu.replace_right_child (exp)
				end
			end
		end

	replace_cur_with_expression(exp : EXPRESSION)
		local
			i : INTEGER
			curr: CURRENT_EXPRESSION
		do
			create curr.make
			from
				i := 1
			until
				i > tree.count
			loop
				if tree.item (i) ~ curr then
					tree.put (exp, i)
				end
				i := i + 1
			end -- end loop
		end

	replace_cur_with_integer(int : INTEGER_CONSTANT)
		local
			i: INTEGER
			curr: CURRENT_EXPRESSION
			nil: NIL_EXPRESSION
		do
			create curr.make
			create nil.make
			from
				i := 1
			until
				i > tree.count
			loop
				if tree.item (i) ~ curr then
					tree.put (int, i)
				end
				i := i + 1
			end -- end loop
		end

--	loop for changing the print tree list
	replace_cur_with_boolean(b : BOOLEAN_CONSTANT)
		local
			i: INTEGER
			curr: CURRENT_EXPRESSION
			nil: NIL_EXPRESSION
		do
			create curr.make
			create nil.make
			from
				i := 1
			until
				i > tree.count
			loop
				if tree.item (i) ~ curr then
					tree.put (b, i)
				end
				i := i + 1
			end -- end loop
		end

feature  -- queries

	reset_message_and_error
		do
			message.make_empty
			error.make_empty
		end

	pretty_printing: STRING
		local
			pp: PRETTY_PRINT
		do
			create pp.make
			if not prime.isEmpty then
				prime.accept(pp)
				Result := pp.text
			else
				Result := "?"
			end
		end

	done: BOOLEAN
		do
			Result := not prime.isEmpty and (attached {COMPOSITE_EXPRESSION[EXPRESSION]} prime as c implies c.isDone)
		end

	last_exp_curr : BOOLEAN
		do
			if attached {CURRENT_EXPRESSION} last_constant_pointer as constant_op then
				result := TRUE
			end
		end

	last_exp_binary : BOOLEAN

		do
			if attached {BINARY_EXPRESSION[EXPRESSION]} last_constant_pointer as stack_last_binary_op then
				result := TRUE
			end
		end

	last_exp_unary : BOOLEAN

		do
			if attached {UNARY_EXPRESSION[EXPRESSION]} last_constant_pointer as stack_last_unary_op then
				result := TRUE
			end
		end

	last_exp_set_enum : BOOLEAN

		do
			if attached {SET_ENUM} last_constant_pointer as set_enum then
				result := TRUE
			end
		end

feature  -- commands

	set_main(main_exp: EXPRESSION)
		do
			prime := main_exp
		end

	set_enum_bool(b : BOOLEAN)
		do
			enum_bool := b
		end

	set_unary_bool(b : BOOLEAN)
		do
			unary_bool := b
		end

	set_analyze_bool(b : BOOLEAN)
		do
			analyze_bool := b
		end

	set_message(msg: STRING)
		do
			message := msg
		end

	set_error(e: STRING)
		do
			error := e
		end

	X_O_R_binary_exp_in_stack_at_i (i : INTEGER) : BOOLEAN
		do
			if attached {BINARY_EXPRESSION[X_O_R]} stack.at (i) as c1_binary then
				result := TRUE
			end
		end

	unary_exp_in_stack_at_i (i : INTEGER) : BOOLEAN
		do
			if attached {UNARY_EXPRESSION[COUNTING]} stack.at (i) as c1_binary then
				result := TRUE
			end
		end

	set_enum_flag(b : BOOLEAN)
		do
			enum_flag := b
		end

	pretty_print
			-- print the current expression
		do
			tree.root.accept (printer)
		end

	simplification
			-- simplify the current expression
		do
			tree.root.accept (simplify)
		end

	checker
			-- type check the current expression
		do
			tree.root.accept (type_checker)
		end

	reset_checker
			-- reset the current expression
		do
			checker
		end

	default_update
			-- Perform update to the model state.
		do
			default_count := default_count + 1
		end

	close_enum_set
			local
				curr : CURRENT_EXPRESSION
				nil : NIL_EXPRESSION
			do
				create curr.make
				create nil.make
				enum_flag := FALSE
				enum.remove

				if attached {BINARY_EXPRESSION[EXPRESSION]}last_constant_pointer as x then
					if x.left ~ nil then
						x.replace_left_child (curr)
					elseif x.right ~ nil then
						x.replace_right_child (curr)
					end
				end
				replace_cur_with_expression(enum)
			--	create enum.make
			end

	grow(exp: EXPRESSION)
		do
			if prime.isEmpty then prime := exp
			elseif attached {COMPOSITE_EXPRESSION[EXPRESSION]} prime as cm then
				cm.add(exp)
			end
		end

	insert_set_enum (e : SET_ENUM)
		local
			curr : CURRENT_EXPRESSION
			set_enum : SET_ENUM
		do
			create set_enum.make
			create curr.make
			enum_flag := TRUE
			if attached {CURRENT_EXPRESSION}tree.at (1) as j and tree.count = 1 then
				replace_cur_with_expression(enum)
			elseif attached {BINARY_EXPRESSION[EXPRESSION]}last_constant_pointer as x then
				if x.left ~ curr then
					x.replace_left_child (enum)
				elseif x.right ~ curr then
					x.replace_right_child (enum)
				end
			elseif attached {UNARY_EXPRESSION[EXPRESSION]}last_constant_pointer as x then
				if x.right_expression ~ curr then
					x.replace_right_child (enum)
				end
			end
		end

	reset
		-- Reset model
		do
			make
		end

feature -- display feature

	out : STRING
		do
			create Result.make_from_string ("  Expression currently specified: ")
			Result.append (pretty_printing)
			Result.append ("%N  Report: ")
			if not error.is_empty then
				Result.append (error)
			else
				Result.append (message) end
		end

end
