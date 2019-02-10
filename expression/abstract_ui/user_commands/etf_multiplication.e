note
	description: ""
	author: "Fahad Qayyum, Ahmed Sayed Ahmed, Mustafa Alsoufi"
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_MULTIPLICATION
inherit
	ETF_MULTIPLICATION_INTERFACE
		redefine multiplication end
create
	make
feature -- command
	multiplication
	local
			err : EXPRESSION_ERRORS
			multiply : TIMES
    	do
			-- perform some update on the model state
			create err.make
			if model.done then
    			model.set_error(err.report_expression_is_already_fully_specified)
    		else
				model.reset_message_and_error
				create multiply.make
				model.grow (multiply)
				model.set_message (err.report_success)
    		end

			etf_cmd_container.on_change.notify ([Current])
    	end

end
