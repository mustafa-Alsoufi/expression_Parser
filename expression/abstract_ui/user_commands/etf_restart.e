note
	description: ""
	author: "Fahad Qayyum, Ahmed Sayed Ahmed, Mustafa Alsoufi"
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_RESTART
inherit
	ETF_RESTART_INTERFACE
		redefine restart end
create
	make
feature -- command
	restart
	local
			err : EXPRESSION_ERRORS
    	do
			-- perform some update on the model state
			create err.make
			if model.prime.isEmpty then
				model.set_error(err.report_initial_expression_cannot_be_reset)
			else
				model.reset
				model.set_message (err.report_success)
			end
			etf_cmd_container.on_change.notify ([Current])
    	end

end
