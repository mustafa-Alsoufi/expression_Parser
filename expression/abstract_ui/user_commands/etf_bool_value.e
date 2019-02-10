note
	description: ""
	author: "Fahad Qayyum, Ahmed Sayed Ahmed, Mustafa Alsoufi"
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_BOOL_VALUE
inherit
	ETF_BOOL_VALUE_INTERFACE
		redefine bool_value end
create
	make
feature -- command
	bool_value(c: BOOLEAN)
	local
			err : EXPRESSION_ERRORS
			args : LINKED_LIST[BOOLEAN]
			bool : BOOLEAN_CONSTANT
			arg_list : TREE_LIST[BOOLEAN]
    	do
			-- perform some update on the model state
			create err.make
			create args.make
			args.extend (c)
			create arg_list.make
			arg_list.make_list (args)
			if model.done then
    			model.set_error(err.report_expression_is_already_fully_specified)
    		else
				model.reset_message_and_error
				create bool.make(arg_list.tree_ll.at(1))
				model.grow(bool)
				model.set_message(err.report_success)
    		end
			etf_cmd_container.on_change.notify ([Current])
    	end

end
