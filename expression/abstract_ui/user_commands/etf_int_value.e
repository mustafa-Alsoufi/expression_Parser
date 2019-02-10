note
	description: ""
	author: "Fahad Qayyum, Ahmed Sayed Ahmed, Mustafa Alsoufi"
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_INT_VALUE
inherit
	ETF_INT_VALUE_INTERFACE
		redefine int_value end
create
	make
feature -- command
	int_value(c: INTEGER_64)
	local
			err : EXPRESSION_ERRORS
			args : LINKED_LIST[INTEGER]
			int : INTEGER_CONSTANT
			arg_list : TREE_LIST[INTEGER]
    	do
			-- perform some update on the model state
			create err.make
			create args.make
			args.extend (c.to_integer_32)
			create arg_list.make
			arg_list.make_list (args)
			if model.done then
    			model.set_error(err.report_expression_is_already_fully_specified)
    		else
				model.reset_message_and_error
				create int.make(arg_list.tree_ll.at(1))
				model.grow(int)
				model.set_message(err.report_success)
    		end
			etf_cmd_container.on_change.notify ([Current])
    	end

end
