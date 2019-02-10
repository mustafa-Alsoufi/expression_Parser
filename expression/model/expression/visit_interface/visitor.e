note
	description: "Summary description for {VISITOR}."
	author: "Fahad Qayyum, Ahmed Sayed Ahmed, Mustafa Alsoufi"
	date: "$Date$"
	revision: "$Revision$"

deferred class
	VISITOR

feature
	visit_current(e : CURRENT_EXPRESSION)
		deferred end
	visit_nil(e : NIL_EXPRESSION)
		deferred end
	visit_boolean (e: BOOLEAN_CONSTANT)
		deferred end
	visit_integer (e: INTEGER_CONSTANT)
		deferred end
	visit_set_enumeration(e : SET_ENUM)
		deferred end
	visit_A_N_D(e : A_N_D)
		deferred end
	visit_DIFFERENCE(e : DIFFERENCE)
		deferred end
	visit_EQUAL(e : EQUAL)
		deferred end
	visit_G_T(e : G_T)
		deferred end
	visit_INTERSECT(e : INTERSECT)
		deferred end
	visit_IMPLIES(e : I_M_P_L_I_E_S)
		deferred end
	visit_L_T(e : L_T)
		deferred end
	visit_MINUS(e : MINUS)
		deferred end
	visit_MOD(e : MOD)
		deferred end
	visit_O_R(e: O_R)
		deferred end
	visit_PLUS(e : PLUS)
		deferred end
	visit_QUOTIENT(e : QUOTIENT)
		deferred end
	visit_TIMES(e : TIMES)
		deferred end
	visit_UNION(e : UNION)
		deferred end
	visit_X_O_R(e : X_O_R)
		deferred end
	visit_COUNTING(e : COUNTING)
		deferred end
	visit_EXISTS(e : EXISTS)
		deferred end
	visist_FORALL(e: FORALL)
		deferred end
	visit_NEGATION(e : NEGATION)
		deferred end
	visit_NEGATIVE(e : NEGATIVE)
		deferred end
	visit_PRODUCT(e : PRODUCT)
		deferred end
	visit_SIGMA(e : SIGMA)
		deferred end
end
