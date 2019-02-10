note
	description: ""
	author: "Fahad Qayyum, Ahmed Sayed Ahmed, Mustafa Alsoufi"
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_PRODUCT
inherit
	ETF_PRODUCT_INTERFACE
		redefine product end
create
	make
feature -- command
	product
	local
			err : EXPRESSION_ERRORS
			pro : PRODUCT
    	do
			-- perform some update on the model state
			create err.make
			if model.done then
    			model.set_error(err.report_expression_is_already_fully_specified)
    		else
				model.reset_message_and_error
				create pro.make
				model.grow (pro)
				model.set_message (err.report_success)
    		end
			etf_cmd_container.on_change.notify ([Current])
		end
end
