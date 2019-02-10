note
	description: ""
	author: "Fahad Qayyum, Ahmed Sayed Ahmed, Mustafa Alsoufi"
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_MODULO
inherit
	ETF_MODULO_INTERFACE
		redefine modulo end
create
	make
feature -- command
	modulo
	local
			err : EXPRESSION_ERRORS
			mod : MOD
    	do
			-- perform some update on the model state
			create err.make
			if model.done then
    			model.set_error(err.report_expression_is_already_fully_specified)
    		else
				model.reset_message_and_error
				create mod.make
				model.grow (mod)
				model.set_message (err.report_success)
    		end

			etf_cmd_container.on_change.notify ([Current])
    	end
end
