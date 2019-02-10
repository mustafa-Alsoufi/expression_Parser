note
	description: ""
	author: "Fahad Qayyum, Ahmed Sayed Ahmed, Mustafa Alsoufi"
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_FORALL
inherit
	ETF_FORALL_INTERFACE
		redefine forall end
create
	make
feature -- command
	forall
 	 local
			err : EXPRESSION_ERRORS
			f_all : FORALL
    	do
			-- perform some update on the model state
			create err.make
			if model.done then
    			model.set_error(err.report_expression_is_already_fully_specified)
    		else
				model.reset_message_and_error
				create f_all.make
				model.set_unary_bool(TRUE)
				model.grow (f_all)
				model.set_message (err.report_success)
    		end

			etf_cmd_container.on_change.notify ([Current])
		end
end
