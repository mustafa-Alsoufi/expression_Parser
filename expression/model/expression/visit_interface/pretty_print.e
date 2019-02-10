note
	description: "Summary description for {PRETTY_PRINT}."
	author: "Fahad Qayyum, Ahmed Sayed Ahmed, Mustafa Alsoufi"
	date: "$Date$"
	revision: "$Revision$"

class
	PRETTY_PRINT

inherit
	VISITOR

create
	make,
	makeBool

feature
	text : STRING
	flag : BOOLEAN

feature -- constructor
	make
		do
			create text.make_empty
			flag := False
		end
	makeBool(bool: BOOLEAN)
		do
			create text.make_empty
			flag := bool
		end

feature -- inherited features

	visit_PLUS(plus: PLUS)
		do
			text.append("(")
			text.append(sub(plus.left_expr))
			text.append (" ")
			text.append (plus.output)
			text.append (" ")
			text.append(sub(plus.right_expr))
			text.append(")")
		end
	visit_MINUS(minus: MINUS)
		do
			text.append("(")
			text.append(sub(minus.left_expr))
			text.append (" ")
			text.append (minus.output)
			text.append (" ")
			text.append(sub(minus.right_expr))
			text.append(")")
		end
	visit_TIMES(times: TIMES)
		do
			text.append("(")
			text.append(sub(times.left_expr))
			text.append (" ")
			text.append (times.output)
			text.append (" ")
			text.append(sub(times.right_expr))
			text.append(")")
		end
	visit_QUOTIENT(quotient: QUOTIENT)
		do
			text.append("(")
			text.append(sub(quotient.left_expr))
			text.append (" ")
			text.append (quotient.output)
			text.append (" ")
			text.append(sub(quotient.right_expr))
			text.append(")")
		end
	visit_MOD(mod: MOD)
		do
			text.append("(")
			text.append(sub(mod.left_expr))
			text.append (" ")
			text.append (mod.output)
			text.append (" ")
			text.append(sub(mod.right_expr))
			text.append(")")
		end
	visit_A_N_D(exp_and: A_N_D)
		do
			text.append("(")
			text.append(sub(exp_and.left_expr))
			text.append (" ")
			text.append (exp_and.output)
			text.append (" ")
			text.append(sub(exp_and.right_expr))
			text.append(")")
		end
	visit_O_R(exp_or: O_R)
		do
			text.append("(")
			text.append(sub(exp_or.left_expr))
			text.append (" ")
			text.append (exp_or.output)
			text.append (" ")
			text.append(sub(exp_or.right_expr))
			text.append(")")
		end
	visit_X_O_R(exp_xor: X_O_R)
		do
			text.append("(")
			text.append(sub(exp_xor.left_expr))
			text.append (" ")
			text.append (exp_xor.output)
			text.append (" ")
			text.append(sub(exp_xor.right_expr))
			text.append(")")
		end
	visit_IMPLIES(exp_implies: I_M_P_L_I_E_S)
		do
			text.append("(")
			text.append(sub(exp_implies.left_expr))
			text.append (" ")
			text.append (exp_implies.output)
			text.append (" ")
			text.append(sub(exp_implies.right_expr))
			text.append(")")
		end
	visit_EQUAL(exp_equal: EQUAL)
		do
			text.append("(")
			text.append(sub(exp_equal.left_expr))
			text.append (" ")
			text.append (exp_equal.output)
			text.append (" ")
			text.append(sub(exp_equal.right_expr))
			text.append(")")
		end
	visit_G_T(gt: G_T)
		do
			text.append("(")
			text.append(sub(gt.left_expr))
			text.append (" ")
			text.append (gt.output)
			text.append (" ")
			text.append(sub(gt.right_expr))
			text.append(")")
		end
	visit_L_T(lt: L_T)
		do
			text.append("(")
			text.append(sub(lt.left_expr))
			text.append (" ")
			text.append (lt.output)
			text.append (" ")
			text.append(sub(lt.right_expr))
			text.append(")")
		end
	visit_UNION(union: UNION)
		do
			text.append("(")
			text.append(sub(union.left_expr))
			text.append (" ")
			text.append (union.output)
			text.append (" ")
			text.append(sub(union.right_expr))
			text.append(")")
		end
	visit_INTERSECT(intersect: INTERSECT)
		do
			text.append("(")
			text.append(sub(intersect.left_expr))
			text.append (" ")
			text.append (intersect.output)
			text.append (" ")
			text.append(sub(intersect.right_expr))
			text.append(")")
		end
	visit_DIFFERENCE(dif: DIFFERENCE)
		do
			text.append("(")
			text.append(sub(dif.left_expr))
			text.append (" ")
			text.append (dif.output)
			text.append (" ")
			text.append(sub(dif.right_expr))
			text.append(")")
		end
	visit_NEGATIVE(neg: NEGATIVE)
		do
			text.append("(")
			text.append(neg.output)
			text.append (" ")
			text.append(sub(neg.item_expr))
			text.append(")")
		end
	visit_NEGATION(neg: NEGATION)
		do
			text.append("(")
			text.append(neg.output)
			text.append (" ")
			text.append(sub(neg.item_expr))
			text.append(")")
		end
	visit_SIGMA(sigma: SIGMA)
		do
			text.append("(")
			text.append(sigma.output)
			text.append (" ")
			text.append(sub(sigma.item_expr))
			text.append(")")
		end
	visit_PRODUCT(product: PRODUCT)
		do
			text.append("(")
			text.append(product.output)
			text.append (" ")
			text.append(sub(product.item_expr))
			text.append(")")
		end
	visist_FORALL(forall: FORALL)
		do
			text.append("(")
			text.append(forall.output)
			text.append (" ")
			text.append(sub(forall.item_expr))
			text.append(")")
		end
	visit_EXISTS(exist: EXISTS)
		do
			text.append("(")
			text.append(exist.output)
			text.append (" ")
			text.append(sub(exist.item_expr))
			text.append(")")
		end
	visit_COUNTING(count: COUNTING)
		do
			text.append("(")
			text.append(count.output)
			text.append (" ")
			text.append(sub(count.item_expr))
			text.append(")")
		end
	visit_set_enumeration(set: SET_ENUM)
		do
			text := "{"
			across set.list as cursor loop
				text := text + sub(cursor.item)
				if not cursor.is_last then text := text + ", " end
			end
			text := text + "}"
		end
	visit_current(e : CURRENT_EXPRESSION)
		do
		end
	visit_nil(e : NIL_EXPRESSION)
		do
		end
	visit_integer(intc: INTEGER_CONSTANT)
		do
			text := intc.value.out
		end
	visit_boolean(boolc: BOOLEAN_CONSTANT)
		do
			text := boolc.state.out
		end

feature -- Queries

	sub(e: EXPRESSION): STRING
		local
			subPrint: PRETTY_PRINT
			curr : CURRENT_EXPRESSION
			nil : NIL_EXPRESSION
		do
			create curr.make
			create nil.make
			if e.isEmpty then
				if flag then
					Result := nil.output
				else
					Result := curr.output
					flag := True
				end
			else
				create subPrint.makeBool(flag)
				e.accept (subPrint)
				flag := subPrint.flag
				Result := subPrint.text
			end
		end

end
