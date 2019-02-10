note
	description: ""
	author: "Fahad Qayyum, Ahmed Sayed Ahmed, Mustafa Alsoufi"
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_START_OF_SET_ENUMERATION
inherit
	ETF_START_OF_SET_ENUMERATION_INTERFACE
		redefine start_of_set_enumeration end
create
	make
feature -- command
	start_of_set_enumeration
	local
			err : EXPRESSION_ERRORS
			start : SET_ENUM
    	do
			-- perform some update on the model state
			create err.make
			if model.done then
    			model.set_error(err.report_expression_is_already_fully_specified)
    		else
    			create start.make
				model.reset_message_and_error
				model.grow (start)
				model.set_message (err.report_success)
    		end
			etf_cmd_container.on_change.notify ([Current])
    	end

end
