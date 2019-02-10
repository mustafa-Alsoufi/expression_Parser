note
	description: ""
	author: "Fahad Qayyum, Ahmed Sayed Ahmed, Mustafa Alsoufi"
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_EXCLUSIVE_OR
inherit
	ETF_EXCLUSIVE_OR_INTERFACE
		redefine exclusive_or end
create
	make
feature -- command
	exclusive_or
     local
			err : EXPRESSION_ERRORS
			ex_or : X_O_R
    	do
			-- perform some update on the model state
			create err.make
			if model.done then
    			model.set_error(err.report_expression_is_already_fully_specified)
    		else
				model.reset_message_and_error
				create ex_or.make
				model.grow (ex_or)
				model.set_message (err.report_success)
    		end
			etf_cmd_container.on_change.notify ([Current])
    	end

end
