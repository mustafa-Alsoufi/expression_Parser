note
	description: ""
	author: "Fahad Qayyum, Ahmed Sayed Ahmed, Mustafa Alsoufi"
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_NUMERICAL_NEGATION
inherit
	ETF_NUMERICAL_NEGATION_INTERFACE
		redefine numerical_negation end
create
	make
feature -- command
	numerical_negation
	local
			err : EXPRESSION_ERRORS
			negative : NEGATIVE
    	do
			-- perform some update on the model state
			create err.make
			if model.done then
    			model.set_error(err.report_expression_is_already_fully_specified)
    		else
				model.reset_message_and_error
				create negative.make
				model.grow (negative)
				model.set_message (err.report_success)
    		end
			etf_cmd_container.on_change.notify ([Current])
    	end

end
