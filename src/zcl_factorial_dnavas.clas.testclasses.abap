*"* use this source file for your ABAP unit test classes
CLASS ltcl_factorial_test DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    METHODS:
      factorial_local_test FOR TESTING RAISING cx_static_check.

    DATA mo_cut TYPE REF TO zcl_factorial_dnavas. "cut  Class Under test

    METHODS setup.
    METHODS teardown.

ENDCLASS.

CLASS ltcl_factorial_test IMPLEMENTATION.

  METHOD setup.
    mo_cut = NEW zcl_factorial_dnavas( ).
  ENDMETHOD.

  METHOD teardown.
    CLEAR mo_cut.
  ENDMETHOD.

  METHOD  factorial_local_test.

*    Given(tdd) Test Driven Development
    DATA l_number TYPE i VALUE 4.
    DATA l_factorial TYPE i.

*    When (Cuando?)
    mo_cut->get_factorial( EXPORTING  i_factorial = l_number
                           IMPORTING  e_factorial = l_factorial ).

*    Then (Despues)
    IF cl_abap_unit_assert=>assert_equals(
       EXPORTING
         act                  = l_factorial
         exp                  = 24 ) EQ abap_true.
      cl_abap_unit_assert=>fail( 'Factorial process failed' ).
    ENDIF.

  ENDMETHOD.

ENDCLASS.
