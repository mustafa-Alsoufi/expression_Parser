note
	description: ""
	author: "Fahad Qayyum, Ahmed Sayed Ahmed, Mustafa Alsoufi"
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_LOGICAL_NEGATION
inherit
	ETF_LOGICAL_NEGATION_INTERFACE
		redefine logical_negation end
create
	make
feature -- command
	logical_negation
	local
			err : EXPRESSION_ERRORS
			negation : NEGATION
    	do
			-- perform some update on the model state
			create err.make
			if model.done then
    			model.set_error(err.report_expression_is_already_fully_specified)
    		else
				model.reset_message_and_error
				create negation.make
				model.grow (negation)
				model.set_message (err.report_success)
    		end
			etf_cmd_container.on_change.notify ([Current])
    	end

end
