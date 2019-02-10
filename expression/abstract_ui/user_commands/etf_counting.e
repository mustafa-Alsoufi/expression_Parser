note
	description: ""
	author: "Fahad Qayyum, Ahmed Sayed Ahmed, Mustafa Alsoufi"
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_COUNTING
inherit
	ETF_COUNTING_INTERFACE
		redefine counting end
create
	make
feature -- command
	counting
	local
			err : EXPRESSION_ERRORS
			count : COUNTING
    	do
			-- perform some update on the model state
			create err.make
			if model.done then
    			model.set_error(err.report_expression_is_already_fully_specified)
    		else
				model.reset_message_and_error
				create count.make
				model.grow (count)
				model.set_unary_bool(TRUE)
				model.set_message (err.report_success)
    		end
			etf_cmd_container.on_change.notify ([Current])
		end

end
