note
	description: "Summary description for {EXPRESSION}."
	author: "Fahad Qayyum, Ahmed Sayed Ahmed, Mustafa Alsoufi"
	date: "$Date$"
	revision: "$Revision$"

deferred class
	EXPRESSION

feature -- Attributes

	output : STRING
		deferred end

	accept(v : VISITOR)
		deferred end

	isEmpty: BOOLEAN
		do
			Result := False
		end
end
