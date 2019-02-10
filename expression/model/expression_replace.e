note
	description: "Summary description for {EXPRESSION_REPLACE}."
	author: "Fahad Qayyum, Ahmed Sayed Ahmed, Mustafa Alsoufi"
	date: "$Date$"
	revision: "$Revision$"

class
	EXPRESSION_REPLACE

create make

feature
	make
		do

		end

--feature -- replacement functions

--	replace_bin_exp_at_i_position_in_stack (i : INTEGER)
--			local
--				nil : NIL_EXPRESSION
--				cur : CURRENT_EXPRESSION
--			do
--				create nil.make
--				create cur.make
--				if (attached {BINARY_EXPRESSION}stack.at(i) as b) then
--					if b.left ~ nil then
--						b.replace_left_child (cur)
--						update_bin_const_pointer(b)
--					elseif b.right ~ nil then
--						b.replace_right_child (cur)
--						update_bin_const_pointer(b)
--					end
--				end
--			end

--		replace_unary_exp_at_i_position_in_stack (i : INTEGER)
--		local
--				nil : NIL_EXPRESSION
--				cur : CURRENT_EXPRESSION
--		do
--			create nil.make
--			create cur.make
--			if (attached {UNARY_EXPRESSION} stack.at (i) as u) then
--				if u.right ~ nil then
--					u.replace_right_child (cur)
--					last_constant_pointer := u
--				end
--			end
--		end

--		replace_binary_exp(k : INTEGER ; exp : EXPRESSION)
--			local
--				curr : CURRENT_EXPRESSION
--				int : INTEGER
--			do
--				create curr.make
--				if (attached {BINARY_EXPRESSION} stack.at (k) as pb) then
--					if pb.left ~ curr then
--						pb.replace_left_child (exp)
--					elseif pb.right ~ curr then
--						pb.replace_right_child (exp)
--					end
--				end
--			end

--		replace_unary_exp(i : INTEGER; exp : EXPRESSION)
--			local
--				curr : CURRENT_EXPRESSION
--			do
--				create curr.make
--				if (attached {UNARY_EXPRESSION} stack.at (i) as pu) then
--					if pu.right ~ curr then
--						pu.replace_right_child (exp)
--					end
--				end
--			end

--	replace_cur_with_integer(int : INTEGER_CONSTANT)
--		local
--			i: INTEGER
--			curr: CURRENT_EXPRESSION
--			nil: NIL_EXPRESSION
--		do
--			create curr.make
--			create nil.make
--			from
--				i := 1
--			until
--				i > tree.count
--			loop
--				if tree.item (i) ~ curr then
--					tree.put (int, i)
--				end
--				i := i + 1
--			end -- end loop
--		end
--				--				loop for changing the print tree list
--	replace_cur_with_boolean(b : BINARY_CONSTANT)
--		local
--			i: INTEGER
--			curr: CURRENT_EXPRESSION
--			nil: NIL_EXPRESSION
--		do
--			create curr.make
--			create nil.make
--			from
--				i := 1
--			until
--				i > tree.count
--			loop
--				if tree.item (i) ~ curr then
--					tree.put (b, i)
--				end
--				i := i + 1
--			end -- end loop
--		end

--	replace_nil_with_cur
--		local
--			i, j: INTEGER
--			curr: CURRENT_EXPRESSION
--			nil: NIL_EXPRESSION
--		do
--			create curr.make
--			create nil.make
--			from
--				i := tree.count
--			until
--				i < 1
--			loop
--				if tree.item (i) ~ nil then
--					tree.put (curr, i)
--					j := i
--					i := 1
--				end
--				i := i - 1
--			end
--		end

end
