note
	description: ""
	author: "Fahad Qayyum, Ahmed Sayed Ahmed, Mustafa Alsoufi"
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_END_OF_SET_ENUMERATION
inherit
	ETF_END_OF_SET_ENUMERATION_INTERFACE
		redefine end_of_set_enumeration end
create
	make
feature -- command
	end_of_set_enumeration
		local
			err : EXPRESSION_ERRORS
			arrow : EXPRESSION
			enum_set : EXPRESSION
    	do
			-- perform some update on the model state
		create err.make
			enum_set := create {EMPTY_EXPRESSION}.make
			from
				arrow := model.prime
			until
				((attached {SET_ENUM} arrow) and (attached {SET_ENUM} arrow as enum implies (not enum.isDone and enum.list.last.isEmpty) ))
					or
				(attached {COMPOSITE_EXPRESSION[EXPRESSION]} arrow as com_p implies (attached {EMPTY_EXPRESSION} com_p.cursor_item)) -- = Void
			loop
				if attached {COMPOSITE_EXPRESSION[EXPRESSION]} arrow as comPointer then
					arrow := comPointer.cursor_item
				end
			end

			if attached {SET_ENUM} arrow as en then
				enum_set := en
			end
			if attached {SET_ENUM} enum_set as enumerator then
				if enumerator.list.count = 1 then
					model.set_error(err.report_set_enumeration_must_be_non_empty)
				else
					if model.done then
    					model.set_error(err.report_expression_is_already_fully_specified)
    				else
						model.reset_message_and_error
						if attached {SET_ENUM} enum_set as en then
							en.complete
							if attached {SET_ENUM} en.parent as ep then
								ep.increment_cursor
								ep.list.extend(create {EMPTY_EXPRESSION}.make)
							else
								en.increment_cursor
							end
						end
						model.set_message(err.report_success)
    				end
				end
    		else
    			model.set_error(err.report_set_enumeration_is_not_being_specified)
    		end

			model.set_message(err.report_success)
			etf_cmd_container.on_change.notify ([Current])
    	end
end
