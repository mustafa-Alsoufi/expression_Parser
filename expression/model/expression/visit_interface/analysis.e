note
	description: "Summary description for {ANALYSIS}."
	author: "Fahad Qayyum, Ahmed Sayed Ahmed, Mustafa Alsoufi"
	date: "$Date$"
	revision: "$Revision$"

class
	ANALYSIS

inherit
	VISITOR

create
	make

feature  -- Attributes

	type: STRING
	value : INTEGER

feature -- constructor
	make
		do
			create type.make_empty
		end

feature -- inherited features

	visit_integer(intc: INTEGER_CONSTANT)
		do
			type := int_out
			value := 1
		end

	visit_boolean(boolc: BOOLEAN_CONSTANT)
		do
			type := bool_out
			value := 2
		end

	visit_PLUS(plus: PLUS)
		local
			anal: ANALYSIS
			str: STRING
			correct: BOOLEAN
		do
			create anal.make
			plus.left_expr.accept(anal)
			str := anal.type
			plus.right_expr.accept(anal)
			correct := bin_con(plus)
			if correct and str ~ int_out and str ~ anal.type then
				type := int_out
			else
				create type.make_empty
			end
		end

	visit_MINUS(minus: MINUS)
		local
			anal: ANALYSIS
			str: STRING
			correct: BOOLEAN
		do
			create anal.make
			minus.left_expr.accept(anal)
			str := anal.type
			minus.right_expr.accept(anal)
			correct := bin_con(minus)
			if correct and str ~ int_out and str ~ anal.type then
				type := int_out
			else
				create type.make_empty
			end
		end

	visit_TIMES(times: TIMES)
		local
			anal: ANALYSIS
			str: STRING
			correct: BOOLEAN
		do
			create anal.make
			times.left_expr.accept(anal)
			str := anal.type
			times.right_expr.accept(anal)
			correct := bin_con(times)
			if correct and str ~ int_out and str ~ anal.type then
				type := int_out
			else
				create type.make_empty
			end
		end
	visit_QUOTIENT(quotient: QUOTIENT)
		local
			anal: ANALYSIS
			str: STRING
			correct: BOOLEAN
		do
			create anal.make
			quotient.left_expr.accept(anal)
			str := anal.type
			quotient.right_expr.accept(anal)
			correct := bin_con(quotient)
			if correct and str ~ int_out and str ~ anal.type then
				type := int_out
			else
				create type.make_empty
			end
		end
	visit_MOD(mod: MOD)
		local
			anal: ANALYSIS
			str: STRING
			correct: BOOLEAN
		do
			create anal.make
			mod.left_expr.accept(anal)
			str := anal.type
			mod.right_expr.accept(anal)
			correct := bin_con(mod)
			if correct and str ~ int_out and str ~ anal.type then
				type := int_out
			else
				create type.make_empty
			end
		end
	visit_G_T(gt: G_T)
		local
			anal: ANALYSIS
			str: STRING
			correct: BOOLEAN
		do
			create anal.make
			gt.left_expr.accept(anal)
			str := anal.type
			gt.right_expr.accept(anal)
			correct := bin_con(gt)
			if correct and str ~ int_out and str ~ anal.type then
				type := bool_out
			else
				create type.make_empty
			end
		end
	visit_L_T(lt: L_T)
		local
			anal: ANALYSIS
			str: STRING
			correct: BOOLEAN
		do
			create anal.make
			lt.left_expr.accept(anal)
			str := anal.type
			lt.right_expr.accept(anal)
			correct := bin_con(lt)
			if correct and str ~ int_out and str ~ anal.type then
				type := bool_out
			else
				create type.make_empty
			end
		end
	visit_A_N_D(eand: A_N_D)
		local
			anal: ANALYSIS
			str: STRING
			correct: BOOLEAN
		do
			create anal.make
			eand.left_expr.accept(anal)
			str := anal.type
			eand.right_expr.accept(anal)
			correct := bin_con(eand)
			if correct and str ~ bool_out and str ~ anal.type then
				type := bool_out
			else
				create type.make_empty
			end
		end
	visit_O_R(eor: O_R)
		local
			anal: ANALYSIS
			str: STRING
			correct: BOOLEAN
		do
			create anal.make
			eor.left_expr.accept(anal)
			str := anal.type
			eor.right_expr.accept(anal)
			correct := bin_con(eor)
			if correct and str ~ bool_out and str ~ anal.type then
				type := bool_out
			else
				create type.make_empty
			end
		end
	visit_X_O_R(exor: X_O_R)
		local
			anal: ANALYSIS
			str: STRING
			correct: BOOLEAN
		do
			create anal.make
			exor.left_expr.accept(anal)
			str := anal.type
			exor.right_expr.accept(anal)
			correct := bin_con(exor)
			if correct and str ~ bool_out and str ~ anal.type then
				type := bool_out
			else
				create type.make_empty
			end
		end
	visit_IMPLIES(eimplies: I_M_P_L_I_E_S)
		local
			anal: ANALYSIS
			str: STRING
			correct: BOOLEAN
		do
			create anal.make
			eimplies.left_expr.accept(anal)
			str := anal.type
			eimplies.right_expr.accept(anal)
			correct := bin_con(eimplies)
			if correct and str ~ bool_out and str ~ anal.type then
				type := bool_out
			else
				create type.make_empty
			end
		end
	visit_equal(eequal: EQUAL)
		local
			anal: ANALYSIS
			temp: STRING
			a, b, c: BOOLEAN
		do
			create anal.make
			eequal.left_expr.accept(anal)
			temp := anal.type
			eequal.right_expr.accept(anal)
			a := is_enum(eequal.left_expr)
			b := is_enum(eequal.right_expr)
			c := (temp ~ bool_out or temp ~ int_out) and temp ~ anal.type
			if ((a and b) or not (a or b)) and c then type := bool_out
			else create type.make_empty end
		end

	visit_UNION(union: UNION)
		local
			anal: ANALYSIS
			str: STRING
			correct: BOOLEAN
		do
			create anal.make
			union.left_expr.accept(anal)
			str := anal.type
			union.right_expr.accept(anal)
			correct := bin_set_con(str, anal)
			if is_enum(union.right_expr) and is_enum(union.left_expr) and correct then type := str
			else create type.make_empty end
		end
	visit_INTERSECT(intersect: INTERSECT)
		local
			anal: ANALYSIS
			str: STRING
			correct: BOOLEAN
		do
			create anal.make
			intersect.left_expr.accept(anal)
			str := anal.type
			intersect.right_expr.accept(anal)
			correct := bin_set_con(str, anal)
			if is_enum(intersect.right_expr) and is_enum(intersect.left_expr) and correct then type := str
			else create type.make_empty end
		end
	visit_DIFFERENCE(difference: DIFFERENCE)
		local
			anal: ANALYSIS
			str: STRING
			correct: BOOLEAN
		do
			create anal.make
			difference.left_expr.accept(anal)
			str := anal.type
			difference.right_expr.accept(anal)
			correct := bin_set_con(str, anal)
			if is_enum(difference.right_expr) and is_enum(difference.left_expr) and correct then type := str
			else create type.make_empty end
		end
	visit_NEGATIVE(negative: NEGATIVE)
		local
			anal: ANALYSIS
		do
			create anal.make
			create type.make_empty
			if not is_enum(negative.item_expr) then
				negative.item_expr.accept(anal)
				if (int_out ~ anal.type) then
					type := int_out
				end
			end
		end
	visit_NEGATION(negation: NEGATION)
		local
			anal: ANALYSIS
		do
			create anal.make
			create type.make_empty
			if not is_enum(negation.item_expr) then
				negation.item_expr.accept(anal)
				if (bool_out ~ anal.type) then
					type := bool_out
				end
			end
		end
	visit_SIGMA(sigma: SIGMA)
		local
			anal : ANALYSIS
		do
			create anal.make
			create type.make_empty
			if attached {SET_ENUM} sigma.item_expr as set then
				if across set.list as elm all not is_enum(elm.item) end then
					sigma.item_expr.accept(anal)
					if (int_out ~ anal.type) then
						type := int_out
					end
				end
			end
		end
	visit_PRODUCT(product: PRODUCT)
		local
			anal : ANALYSIS
		do
			create anal.make
			create type.make_empty
			if attached {SET_ENUM} product.item_expr as set then
				if across set.list as elm all not is_enum(elm.item) end then
					product.item_expr.accept(anal)
					if (int_out ~ anal.type) then
						type := int_out
					end
				end
			end
		end
	visist_FORALL(forall: FORALL)
		local
			anal : ANALYSIS
		do
			create anal.make
			create type.make_empty
			if attached {SET_ENUM} forall.item_expr as set then
				if across set.list as elm all not is_enum(elm.item) end then
					forall.item_expr.accept(anal)
					if (bool_out ~ anal.type) then
						type := bool_out
					end
				end
			end
		end
	visit_EXISTS(exists: EXISTS)
		local
			anal : ANALYSIS
		do
			create anal.make
			create type.make_empty
			if attached {SET_ENUM} exists.item_expr as set then
				if across set.list as elm all not is_enum(elm.item) end then
					exists.item_expr.accept(anal)
					if (bool_out ~ anal.type) then
						type := bool_out
					end
				end
			end
		end
	visit_COUNTING(counting: COUNTING)
		local
			anal : ANALYSIS
		do
			create anal.make
			create type.make_empty
			if attached {SET_ENUM} counting.item_expr as set then
				if across set.list as elm all not is_enum(elm.item) end then
					counting.item_expr.accept(anal)
					if (bool_out ~ anal.type) then
						type := int_out
					end
				end
			end
		end
	visit_set_enumeration(set: SET_ENUM)
		local
			anal: ANALYSIS
			ans: BOOLEAN
		do
			create anal.make
			ans := true
			set.list.first.accept (anal)
			type := anal.type
			across set.list as cursor loop
				create anal.make
				cursor.item.accept (anal)
				ans := ans and anal.is_type_correct and anal.type ~ type
			end
			if not ans then create type.make_empty end
		end

	visit_current(e : CURRENT_EXPRESSION)
		do end

	visit_nil(e : NIL_EXPRESSION)
		do end

feature -- queries

	is_type_correct: BOOLEAN
		do
			Result := not type.is_empty
		end
	int_out : STRING
		do
			result := "int"
		end
	bin_con(exp : BINARYEXP) : BOOLEAN
		do
			result := not (is_enum(exp.left_expr) or is_enum(exp.right_expr))
		end
	bin_set_con(str : STRING; anal : ANALYSIS) : BOOLEAN
		do
			result := (str ~ bool_out or str ~ int_out) and str ~ anal.type
		end
	is_enum(e: detachable EXPRESSION): BOOLEAN
		do
			Result := attached {SET_ENUM} e
		end
	bool_out : STRING
		do
			result := "bool"
		end

end
