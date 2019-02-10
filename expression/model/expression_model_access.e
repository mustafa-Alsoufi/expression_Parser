note
	description: "Singleton access to the default business model."
	author: "Jackie Wang"
	date: "$Date$"
	revision: "$Revision$"

expanded class
	EXPRESSION_MODEL_ACCESS

feature
	m: EXPRESSION_MODEL
		once
			create Result.make
		end

invariant
	m = m
end




