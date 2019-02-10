note
	description: ""
	author: "Fahad Qayyum, Ahmed Sayed Ahmed, Mustafa Alsoufi"
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_ANALYZE
inherit
	ETF_ANALYZE_INTERFACE
		redefine analyze end
create
	make
feature -- command
	analyze
	local
			err : EXPRESSION_ERRORS
			anal : ANALYSIS
			temp : STRING
    	do
			-- perform some update on the model state
			create err.make
		if

			not model.done then  model.set_error(err.report_expression_is_not_yet_fully_specified)
    	else
    		create anal.make
    		model.reset_message_and_error
    		model.prime.accept (anal)
			temp := model.pretty_printing
			if anal.is_type_correct then
					temp.append(err.report_is_type_correct)
					model.set_message(temp)
				else
					temp.append (err.report_is_not_type_correct)
					model.set_error(temp)
			end
    	end
			etf_cmd_container.on_change.notify ([Current])
		end

end
