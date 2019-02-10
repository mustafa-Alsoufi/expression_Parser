note
	description: ""
	author: "Fahad Qayyum, Ahmed Sayed Ahmed, Mustafa Alsoufi"
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_CONJUNCTION
inherit
	ETF_CONJUNCTION_INTERFACE
		redefine conjunction end
create
	make
feature -- command
	conjunction
	local
			err : EXPRESSION_ERRORS
			and_exp : A_N_D
    	do
			-- perform some update on the model state
			create err.make

			if model.done then
    			model.set_error(err.report_expression_is_already_fully_specified)
    		else
				model.reset_message_and_error
				create and_exp.make
				model.grow (and_exp)
				model.set_message (err.report_success)
    		end
			etf_cmd_container.on_change.notify ([Current])
    	end

end
