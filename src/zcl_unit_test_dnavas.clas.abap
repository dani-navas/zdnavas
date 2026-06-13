CLASS zcl_unit_test_dnavas DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC
  FOR TESTING
  DURATION short "medium "long
  RISK LEVEL HARMLESS. "dangerous critical .
  PUBLIC SECTION.
  "! @testing zcl_factorial_dnavas
  METHODS factorial_test FOR TESTING. "Method unit test

  PROTECTED SECTION.
  PRIVATE SECTION.
  DATA mo_cut TYPE REF TO zcl_factorial_dnavas. "cut  Class Under test

  METHODS setup.
  METHODS teardown.

ENDCLASS.


CLASS zcl_unit_test_dnavas IMPLEMENTATION.
  METHOD setup.
   mo_cut = new zcl_factorial_dnavas( ).
  ENDMETHOD.
  METHOD factorial_test.

*    Given(TDD) Test Driven Development
    data l_number type i VALUE 4.
    data l_factorial type i.

*    When (Cuando?)
     mo_cut->get_factorial( EXPORTING  i_factorial = l_number
                            IMPORTING  e_factorial = l_factorial ).

*    Then (Despues)
     cl_abap_unit_assert=>assert_equals(
       EXPORTING
         act                  = l_factorial
         exp                  = 24 ).

  ENDMETHOD.
  METHOD teardown.
    clear mo_cut.
  ENDMETHOD.

ENDCLASS.
