note
	description: ""
	author: "Fahad Qayyum, Ahmed Sayed Ahmed, Mustafa Alsoufi"
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_EXISTS
inherit
	ETF_EXISTS_INTERFACE
		redefine exists end
create
	make
feature -- command
	exists
		local
			err : EXPRESSION_ERRORS
			ex : EXISTS
    	do
			-- perform some update on the model state
			create err.make
			if model.done then
    			model.set_error(err.report_expression_is_already_fully_specified)
    		else
				model.reset_message_and_error
				create ex.make
				model.grow (ex)
				model.set_message (err.report_success)
    		end
			etf_cmd_container.on_change.notify ([Current])
    	end

end
