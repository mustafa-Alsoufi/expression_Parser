note
	description: ""
	author: "Fahad Qayyum, Ahmed Sayed Ahmed, Mustafa Alsoufi"
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_INTERSECTION
inherit
	ETF_INTERSECTION_INTERFACE
		redefine intersection end
create
	make
feature -- command
	intersection
	local
			err : EXPRESSION_ERRORS
			int : INTERSECT
    	do
			-- perform some update on the model state
			create err.make
			if model.done then
    			model.set_error(err.report_expression_is_already_fully_specified)
    		else
				model.reset_message_and_error
				create int.make
				model.grow (int)
				model.set_message (err.report_success)
    		end

			etf_cmd_container.on_change.notify ([Current])
		end
end
