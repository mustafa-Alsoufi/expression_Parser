note
	description: "Summary description for {SIMPLIFICATION}."
	author: "Fahad Qayyum, Ahmed Sayed Ahmed, Mustafa Alsoufi"
	date: "$Date$"
	revision: "$Revision$"

class
	SIMPLIFICATION

inherit
	VISITOR

create
	make

feature -- Attributes

	simplified: EXPRESSION
	is_zero: BOOLEAN
	enum : ARRAY[EXPRESSION]
	finalResult: ARRAY [STRING]
	text: STRING
	b,i,e,s : BOOLEAN
	analysis : ANALYSIS

feature -- constructor

	make
		do
			create finalResult.make_empty
			create text.make_empty
			simplified := create {EMPTY_EXPRESSION}.make
			create enum.make_empty
			create analysis.make
		end

feature -- Inherited features

	visit_integer(ic: INTEGER_CONSTANT)
		do
			simplified := ic
			b := True
			s := False
			e:=False
			finalResult.make_empty
			finalResult.force (ic.out, 1)
		end
	visit_boolean(bc: BOOLEAN_CONSTANT)
		do
			simplified := bc
			i := True
			s := False
			e:=False
			finalResult.make_empty
			finalResult.force (bc.out, 1)
		end
	visit_PLUS(plus: PLUS)
		local
			simp: SIMPLIFICATION
			value: INTEGER_64
		do
			create simp.make
			plus.left_expr.accept(simp)
			is_zero := simp.is_zero
			value := get_i(simp.simplified)
			plus.right_expr.accept(simp)
			value := value + get_i(simp.simplified)
			simplified := create {INTEGER_CONSTANT}.make(value.to_integer_32)
			b := True
			i := False
			s:=False
			finalResult.make_empty
			finalResult.force (value.out, 1)
			is_zero := is_zero or simp.is_zero
		end

	visit_MINUS(m: MINUS)
		local
			simp: SIMPLIFICATION
			value: INTEGER_64
		do
			create simp.make
			m.left_expr.accept(simp)
			is_zero := simp.is_zero
			value := get_i(simp.simplified)
			m.right_expr.accept(simp)
			value := value - get_i(simp.simplified)
			simplified := create {INTEGER_CONSTANT}.make(value.to_integer_32)
			b := True
			i := False
			s:=False
			finalResult.make_empty
			finalResult.force (value.out, 1)
			is_zero := is_zero or simp.is_zero
		end

	visit_TIMES(t: TIMES)
		local
			simp: SIMPLIFICATION
			value: INTEGER_64
		do
			create simp.make
			t.left_expr.accept(simp)
			is_zero := simp.is_zero
			value := get_i(simp.simplified)
			t.right_expr.accept(simp)
			value := value * get_i(simp.simplified)
			simplified := create {INTEGER_CONSTANT}.make(value.to_integer_32)
			b := True
			i := False
			s:=False
			finalResult.make_empty
			finalResult.force (value.out, 1)
			is_zero := is_zero or simp.is_zero
		end

	visit_QUOTIENT(q: QUOTIENT)
		local
			simp: SIMPLIFICATION
			value: INTEGER_64
		do
			create simp.make
			q.left_expr.accept(simp)
			is_zero := simp.is_zero
			value := get_i(simp.simplified)
			q.right_expr.accept(simp)
			b := True
			i := False
			s:=False
			finalResult.make_empty
			finalResult.force (value.out, 1)
			if get_i(simp.simplified) = 0 then
				is_zero := true
				simplified := create {INTEGER_CONSTANT}.make(0)
			else
				value := value // get_i(simp.simplified)
				i := False
				b := False
				s:=True
				finalResult.make_empty
				finalResult.force (value.out, 1)
				simplified := create {INTEGER_CONSTANT}.make(value.to_integer_32)
			end
		end

	visit_MOD(mod: MOD)
		local
			simp: SIMPLIFICATION
			value: INTEGER_64
		do
			create simp.make
			mod.left_expr.accept(simp)
			is_zero := simp.is_zero
			value := get_i(simp.simplified)
			mod.right_expr.accept(simp)
			b := True
			i := False
			s:=False
			finalResult.make_empty
			finalResult.force (value.out, 1)
			if get_i(simp.simplified) = 0 then
				is_zero := true
				simplified := create {INTEGER_CONSTANT}.make(0)
			else
				value := value \\ get_i(simp.simplified)
				b := True
				i := False
				s:=False
				finalResult.make_empty
				finalResult.force (value.out, 1)
				simplified := create {INTEGER_CONSTANT}.make(value.to_integer_32)
			end
		end

	visit_A_N_D(a: A_N_D)
		local
			simp: SIMPLIFICATION
			value: BOOLEAN
		do
			create simp.make
			a.left_expr.accept(simp)
			is_zero := simp.is_zero
			value := get_b(simp.simplified)
			a.right_expr.accept(simp)
			value := value and get_b(simp.simplified)
			simplified := create {BOOLEAN_CONSTANT}.make(value)
			b := True
			i := False
			s:=False
			finalResult.make_empty
			finalResult.force (value.out, 1)
			is_zero := is_zero or simp.is_zero
		end

	visit_O_R(o: O_R)
		local
			simp: SIMPLIFICATION
			value: BOOLEAN
		do
			create simp.make
			o.left_expr.accept(simp)
			is_zero := simp.is_zero
			value := get_b(simp.simplified)
			o.right_expr.accept(simp)
			value := value or get_b(simp.simplified)
			simplified := create {BOOLEAN_CONSTANT}.make(value)
			i := True
			b := False
			s:=False
			finalResult.make_empty
			finalResult.force (value.out, 1)
			is_zero := is_zero or simp.is_zero
		end

	visit_X_O_R(x: X_O_R)
		local
			simp: SIMPLIFICATION
			value: BOOLEAN
		do
			create simp.make
			x.left_expr.accept(simp)
			is_zero := simp.is_zero
			value := get_b(simp.simplified)
			x.right_expr.accept(simp)
			value := value xor get_b(simp.simplified)
			simplified := create {BOOLEAN_CONSTANT}.make(value)
			b := True
			i := False
			s:=False
			finalResult.make_empty
			finalResult.force (value.out, 1)
			is_zero := is_zero or simp.is_zero
		end

	visit_IMPLIES(imp: I_M_P_L_I_E_S)
		local
			simp: SIMPLIFICATION
			value: BOOLEAN
		do
			create simp.make
			imp.left_expr.accept(simp)
			is_zero := simp.is_zero
			value := get_b(simp.simplified)
			imp.right_expr.accept(simp)
			value := value implies get_b(simp.simplified)
			simplified := create {BOOLEAN_CONSTANT}.make(value)
			i := True
			b := False
			s:=False
			finalResult.make_empty
			finalResult.force (value.out, 1)
			is_zero := is_zero or simp.is_zero
		end
	visit_current(c : CURRENT_EXPRESSION)
		do
			b := false
			i := False
			s:=False
			finalResult.make_empty
			finalResult.force (c.out, 1)
		end
	visit_nil(ec : NIL_EXPRESSION)
		do
			b := True
			i := True
			s:=true
			finalResult.make_empty
			finalResult.force (ec.out, 1)
		end

	visit_EQUAL(eq: EQUAL)
		local
			left_simp: SIMPLIFICATION
			right_simp: SIMPLIFICATION
		do
			create left_simp.make
			create right_simp.make
			eq.left_expr.accept(left_simp)
			eq.right_expr.accept(right_simp)
			simplified := create {BOOLEAN_CONSTANT}.make(left_simp.simplified ~ right_simp.simplified)
			b := True
			i := False
			s:=False
			finalResult.make_empty
			finalResult.force (eq.out, 1)
			is_zero := left_simp.is_zero or right_simp.is_zero
		end

	visit_G_T(gt: G_T)
		local
			simp: SIMPLIFICATION
			value1: INTEGER_64
			value2: INTEGER_64
		do
			create simp.make
			gt.left_expr.accept(simp)
			is_zero := simp.is_zero
			value1 := get_i(simp.simplified)
			gt.right_expr.accept(simp)
			value2 := get_i(simp.simplified)
			simplified := create {BOOLEAN_CONSTANT}.make(value2 < value1)
			b := True
			i := False
			s:=False
			finalResult.make_empty
			finalResult.force (gt.out, 1)
			is_zero := is_zero or simp.is_zero
		end

	visit_L_T(lt: L_T)
		local
			simp: SIMPLIFICATION
			value1: INTEGER_64
			value2: INTEGER_64
		do
			create simp.make
			lt.left_expr.accept(simp)
			is_zero := simp.is_zero
			value1 := get_i(simp.simplified)
			lt.right_expr.accept(simp)
			value2 := get_i(simp.simplified)
			simplified := create {BOOLEAN_CONSTANT}.make(value1 < value2)
			b := True
			i := False
			s:=False
			finalResult.make_empty
			finalResult.force (lt.out, 1)
			is_zero := is_zero or simp.is_zero
		end

	visit_UNION(u: UNION)
		local
			simp: SIMPLIFICATION
			cs: SET_ENUM
		do
			create simp.make
			create cs.make
			u.left_expr.accept(simp)
			is_zero := simp.is_zero
			b := false
			i := False
			s:=False
			finalResult.make_empty
			finalResult.force (u.out, 1)
			if attached {SET_ENUM} simp.simplified as ls then
				across ls.list as lexp loop cs.add(lexp.item) end
			end
			u.right_expr.accept(simp)
			b := True
			i := true
			s:=true
			finalResult.make_empty
			finalResult.force (u.out, 1)
			if attached {SET_ENUM} simp.simplified as rs then
				across rs.list as rexp loop cs.add(rexp.item) end
			end
			cs.complete
			cs.accept(simp)
			simplified := simp.simplified
			b := True
			i := False
			s:=true
			finalResult.make_empty
			finalResult.force (u.out, 1)
			is_zero := is_zero or simp.is_zero
		end

	visit_INTERSECT(in: INTERSECT)
		local
			simp: SIMPLIFICATION
			cs: SET_ENUM
		do
			create simp.make
			create cs.make
			in.left_expr.accept(simp)
			is_zero := simp.is_zero
			if attached {SET_ENUM} simp.simplified as ls then
				if attached {SET_ENUM} in.right_expr as rs then
					rs.list.compare_objects
					across ls.list as lexp loop
						if rs.list.has(lexp.item) then
							cs.add(lexp.item)
						end
					end
				end
			end
			b := True
			i := False
			s:=False
			finalResult.make_empty
			finalResult.force (in.out, 1)
			cs.complete
			cs.accept(simp)
			simplified := simp.simplified

			is_zero := is_zero or simp.is_zero
		end

	visit_DIFFERENCE(dif: DIFFERENCE)
		local
			simp: SIMPLIFICATION
			cs: SET_ENUM
		do
			create simp.make
			create cs.make
			dif.left_expr.accept(simp)
			is_zero := simp.is_zero
			if attached {SET_ENUM} simp.simplified as ls then
				if attached {SET_ENUM} dif.right_expr as rs then
					rs.list.compare_objects
					across ls.list as lexp loop
						if not rs.list.has(lexp.item) then
							cs.add(lexp.item)
						end
					end
				end
			end
			i := True
			b := False
			s:=False
			finalResult.make_empty
			finalResult.force (dif.out, 1)
			cs.complete
			cs.accept(simp)
			simplified := simp.simplified
			is_zero := is_zero or simp.is_zero
		end

feature -- unaries
	visit_NEGATIVE(n: NEGATIVE)
		local
			simp: SIMPLIFICATION
			value: INTEGER_64
		do
			create simp.make
			n.item_expr.accept(simp)
			value := (-1) * get_i(simp.simplified)
			simplified := create {INTEGER_CONSTANT}.make (value.to_integer_32)
			b := True
			i := False
			s:=False
			finalResult.make_empty
			finalResult.force (value.out, 1)
			is_zero := simp.is_zero
		end


	visit_NEGATION(n: NEGATION)
		local
			simp: SIMPLIFICATION
			value: BOOLEAN
		do
			create simp.make
			n.item_expr.accept(simp)
			value := not (get_b(simp.simplified))
			simplified := create {BOOLEAN_CONSTANT}.make (value)
			b := True
			i := False
			s:=False
			finalResult.make_empty
			finalResult.force (value.out, 1)
			is_zero := simp.is_zero
		end

	visit_COUNTING(c: COUNTING)
		local
			simp: SIMPLIFICATION
			count: INTEGER_64
		do
			create simp.make
			if attached {SET_ENUM} c.item_expr as set then
				across set.list as cursor loop
					cursor.item.accept(simp)
					if attached {BOOLEAN_CONSTANT} simp.simplified as cs implies cs.state then
						count := count + 1
					end
				end
			end
			simplified := create {INTEGER_CONSTANT}.make (count.to_integer_32)
			b := True
			s := False
			i:=False
			finalResult.make_empty
			finalResult.force (c.out, 1)
			if count = 0 then
				is_zero := true
			end
		end

	visist_FORALL(fa: FORALL)
		local
			simp: SIMPLIFICATION
			bo: BOOLEAN
		do
			create simp.make
			if attached {SET_ENUM} fa.item_expr as set then
				bo := True
				across set.list as cursor loop
					cursor.item.accept(simp)
					if attached {BOOLEAN_CONSTANT} simp.simplified as c implies not c.state then
						bo := False
					end
				end
			end
			simplified := create {BOOLEAN_CONSTANT}.make (bo)
			b := True
			s := False
			i:=False
			finalResult.make_empty
			finalResult.force (fa.out, 1)
			is_zero := simp.is_zero
		end

	visit_EXISTS(ex: EXISTS)
		local
			simp: SIMPLIFICATION
			bo: BOOLEAN
		do
			create simp.make
			if attached {SET_ENUM} ex.item_expr as set then
				bo := False
				across set.list as cursor loop
					cursor.item.accept(simp)
					if attached {BOOLEAN_CONSTANT} simp.simplified as c implies c.state then
						bo := True
					end
				end
			end
			simplified := create {BOOLEAN_CONSTANT}.make (bo)
			b := True
			i := False
			s:=False
			finalResult.make_empty
			finalResult.force (ex.out, 1)
			is_zero := simp.is_zero
		end

	visit_SIGMA(si: SIGMA)
		local
			simp: SIMPLIFICATION
			v: INTEGER_64
		do
			create simp.make
			if attached {SET_ENUM} si.item_expr as set then
				across set.list as cursor loop
					cursor.item.accept(simp)
					is_zero := is_zero or simp.is_zero
					if attached {INTEGER_CONSTANT} simp.simplified as c then
						v := v + c.value
						b := True
						i := False
						s:=False
						finalResult.make_empty
						finalResult.force (si.out, 1)
					end
			end
			simplified := create {INTEGER_CONSTANT}.make (v.to_integer_32)
			end
		end

	visit_PRODUCT(p: PRODUCT)
		local
			simp: SIMPLIFICATION
			v: INTEGER_64
		do
			v := 1
			create simp.make
			if attached {SET_ENUM} p.item_expr as set then
				across set.list as cursor loop
					cursor.item.accept(simp)
					is_zero := is_zero or simp.is_zero
					if attached {INTEGER_CONSTANT} simp.simplified as c then
						v := v * c.value
						b := True
						i := False
						s:=False
						finalResult.make_empty
						finalResult.force (p.out, 1)
					end
			end
			simplified := create {INTEGER_CONSTANT}.make (v.to_integer_32)
			end
		end

	visit_set_enumeration(set: SET_ENUM)
		local
			simp: SIMPLIFICATION
			cs: SET_ENUM
		do
			create simp.make
			create cs.make
			b := False
			i := False
			s:=False
			finalResult.make_empty
			finalResult.force (set.out, 1)
			across set.list as cursor loop
				cursor.item.accept(simp)
				is_zero := is_zero or simp.is_zero
				if not (across cs.list as c some
							c.item ~ simp.simplified
						end) then
					cs.add(simp.simplified)
					b := True
					i := True
					s:= True
					finalResult.make_empty
					finalResult.force (set.out, 1)
				end
			end
			cs.complete
			simplified := cs
		end

feature -- Queries

	get_i(intexp: EXPRESSION): INTEGER_64
		do
			if attached {INTEGER_CONSTANT} intexp as int_exp then
			Result := int_exp.value end
			b := True
			i := True
			s:= True
		end
	get_b(boolexp: EXPRESSION): BOOLEAN
		do
			if attached {BOOLEAN_CONSTANT} boolexp as bool_exp then
			b := True
			i := True
			s:= True
			Result := bool_exp.state end

		end
	exp : EXPRESSION
		do
			Result := simplified
		end
end
