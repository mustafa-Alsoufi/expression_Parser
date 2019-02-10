note
	description: ""
	author: "Fahad Qayyum, Ahmed Sayed Ahmed, Mustafa Alsoufi"
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_DIFFERENCE
inherit
	ETF_DIFFERENCE_INTERFACE
		redefine difference end
create
	make
feature -- command
	difference
	local
			err : EXPRESSION_ERRORS
			diff : DIFFERENCE
    	do
			-- perform some update on the model state
			create err.make
			if model.done then
    			model.set_error(err.report_expression_is_already_fully_specified)
    		else
				model.reset_message_and_error
				create diff.make
				model.grow (diff)
				model.set_message (err.report_success)
    		end
			etf_cmd_container.on_change.notify ([Current])
    	end
	end
