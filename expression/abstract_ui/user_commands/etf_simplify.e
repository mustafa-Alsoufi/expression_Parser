note
	description: ""
	author: "Fahad Qayyum, Ahmed Sayed Ahmed, Mustafa Alsoufi"
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_SIMPLIFY
inherit
	ETF_SIMPLIFY_INTERFACE
		redefine simplify end
create
	make
feature -- command
	simplify
	local
			err : EXPRESSION_ERRORS
			analysis : ANALYSIS
			simp : SIMPLIFICATION
			pp : PRETTY_PRINT
    	do
			-- perform some update on the model state
    		create analysis.make
    		create err.make
    		create simp.make
			if not model.done then
				model.set_error(err.report_expression_is_not_yet_fully_specified)
			elseif attached {EXPRESSION} model.prime as se then
				se.accept(analysis)
				if not analysis.is_type_correct then model.set_error(err.report_error_expression_is_not_type_correct)
	    		else
	    			model.prime.accept (analysis)
	    			model.reset_message_and_error
	    			model.prime.accept (simp)
	    			create pp.make
					if not simp.is_zero then
						simp.exp.accept(pp)
						model.set_message(pp.text)
					else
						model.set_error(err.report_error_divisor_is_zero)
					end
	    		end
			end
			etf_cmd_container.on_change.notify ([Current])
    	end
end
