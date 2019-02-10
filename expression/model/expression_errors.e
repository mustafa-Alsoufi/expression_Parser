note
	description: "Summary description for {EXPRESSION_ERRORS}."
	author: "Fahad Qayyum, Ahmed Sayed Ahmed, Mustafa Alsoufi"
	date: "$Date$"
	revision: "$Revision$"

class
	EXPRESSION_ERRORS
create
    make

feature -- Attributes
	model :  EXPRESSION_MODEL
	model_access : EXPRESSION_MODEL_ACCESS

feature
    make

    do

        create report_success.make_empty
        create report_initial_expression_cannot_be_reset.make_empty
        create report_expression_is_already_fully_specified.make_empty
        create report_expression_is_not_yet_fully_specified.make_empty
        create report_error_expression_is_not_type_correct.make_empty
        create report_error_divisor_is_zero.make_empty
        create report_set_enumeration_is_not_being_specified.make_empty
        create report_set_enumeration_must_be_non_empty.make_empty
        create report_is_type_correct.make_empty
	    create report_is_not_type_correct.make_empty

        model := model_access.m


		report_success := "OK."
        report_initial_expression_cannot_be_reset := "Error (Initial expression cannot be reset)."
        report_expression_is_already_fully_specified := "Error (Expression is already fully specified)."
        report_expression_is_not_yet_fully_specified:= "Error (Expression is not yet fully specified)."
        report_error_expression_is_not_type_correct:= "Error (Expression is not type-correct)."
        report_error_divisor_is_zero := "Error (Divisor is zero)."
        report_set_enumeration_is_not_being_specified := "Error (Set enumeration is not being specified)."
        report_set_enumeration_must_be_non_empty := "Error: (Set enumeration must be non-empty)."
        report_is_type_correct := " is type-correct."
        report_is_not_type_correct := " is not type-correct."
    end

feature -- Constant String Representations of ETF_MODEL

    report_success: STRING
    report_initial_expression_cannot_be_reset : STRING
    report_expression_is_already_fully_specified: STRING
    report_expression_is_not_yet_fully_specified: STRING
    report_error_expression_is_not_type_correct: STRING
    report_error_divisor_is_zero : STRING
    report_set_enumeration_is_not_being_specified : STRING
    --report_set_enumeration_must_be_non_empty :STRING
	report_is_type_correct : STRING
	report_set_enumeration_must_be_non_empty : STRING
	report_is_not_type_correct:STRING


end
